[FlashWatir](http://code.google.com/p/flash-watir) is an extension to the [Watir](http://wtr.rubyforge.org) to include the capability of testing flash applications. So if you have a flash application embedded in your web page you must be able to use [FlashWatir](http://code.google.com/p/flash-watir) to test its functionality along with the normal application.

**Important Note - You can use [FlashWatir](http://code.google.com/p/flash-watir) only on firefox as of now. The work on IE is going on. If you want to contribute or want to have more info, please let me know.**

Any firewatir scripts you have, you should be able to run in [FlashWatir](http://code.google.com/p/flash-watir) by changing the require statement. Please see the unit test in the test folder of the installation. Also see the wiki [ExternalInterface](ExternalInterface.md) for understanding the process of adding testability to flash.

For instructions on testing flash and how to use [FlashWatir](http://code.google.com/p/flash-watir) please see the wiki UserGuide.

Typical Usage

```
# include the controller
require 'flash_watir'
include FireWatir
# create an instance of the controller
browser = Firefox.new
# go to the flash page you want to test
browser.goto('http://myflashapp/')
# call the default methods available in flash
percentage_loaded = browser.flash(:id, "clickcolors").percent_loaded
# call the methods you have exposed on the flash application
browser.flash(:id, "clickcolors").click
rectangle_color = browser.flash(:id, "clickcolors").getColor
```