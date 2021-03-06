require 'establishment'

describe Establishment do
	let(:menu){ double(:menu, list: nil) }
	let(:checker){ double(:checker, pass?: nil) }
	let(:texter){ spy(:texter) }
	subject(:establishment){ described_class.new(menu,checker,texter) }

	context '#view_menu' do
		it 'tells its menu object to show the list of items and prices' do
			expect(menu).to receive(:list)
			establishment.view_menu
		end
	end

	context '#place_order' do
		let(:time){ Time.now }
		it 'asks the checker object whether the order passes' do
			allow(menu).to receive(:list){ "MOCK LIST"}
			expect(checker).to receive(:pass?).with(100,{item1:1,item2:2,item3:3},"MOCK LIST")
			establishment.place_order(total:100, order:{item1:1,item2:2,item3:3}, time:time)
		end
		it 'tells texter object to send order confirmation if pass? returns true' do
			allow(checker).to receive(:pass?){ true }
			establishment.place_order(total:100, order:{item1:1,item2:2,item3:3}, time:time)
			expect(texter).to have_received(:send_confirmation).with(time)
		end
		it 'doesn\'t tell texter object to send order confirmation if pass? does not return true' do
			allow(checker).to receive(:pass?){ false }
			establishment.place_order(total:100, order:{item1:1,item2:2,item3:3}, time:time)
			expect(texter).not_to have_received(:send_confirmation)
		end
	end

	context '#check_orders_received' do
		it 'instructs its texter to check for orders' do
			expect(texter).to receive(:check_for_orders).with(establishment)
			establishment.check_orders_received
		end
	end

end