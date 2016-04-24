Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'
 
 ```

Instructions:

1. Clone this repo and run bundle to install the necessary gems
2. Require the following files: './lib/menu.rb', './lib/establishment.rb', './lib/checker.rb', './lib/texter.rb'
3. To create a menu: menu = Menu.new(<path to textfile>) (note there are sample menu textfiles saved in the lib folder as sample_menu.txt and sample_menu_2.txt)
4. To create a takeaway establishment: establishment = Establishment.new(menu)
5. To view the establishment's menu: establishment.view_menu
6. To place an order: establishment.place_order(total:<total amount you will pay>, order:<order hash>) ( note that the format for the order hash should be {itemname:quantity, itemname:quantity, itemname:quantity} )
