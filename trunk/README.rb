=begin rdoc
Introducing FlashWatir - An extension of watir for testing flash applications in firefox. http://code.google.com/p/flash-watir/

To Install ruby:    http://www.ruby-lang.org
   The instructions to install ruby must be available in the website. Once you install check the installation
   by typing > ruby -v in the commandline which should give the version number of ruby.

To install firewatir:    http://wtr.rubyforge.org/
   Best way to install is to use commandline. Use > gem install firewatir.

To Install flashwatir:
   Best way to install is to use the gem. You can download the gem from Google code project
   http://code.google.com/p/flash-watir/

   From your command line:
     > gem install flash_watir

Where To Use:
   flash_watir works on Windows XP, Linux, Mac. It has been tested on XP, Ubuntu Linux and Mac OSX.
   As of now the flash-watir works only with firefox. The work on IE is going on now. 
   If you have firewatir scripts you must be able to test flash applications by changing only the 
   require statement at the begining of the test and you should be able to test flash applications.
   
User Guide:    http://code.google.com/p/flash-watir/wiki/UserGuide

Testing flash-watir:
   Run the unit tests in a cmd shell. Go to the dir where you installed it and then type 'ruby test/test_flash_watir.rb'.
   The unit test uses a hosted flash application to run the test. If you are not able to access the internet I have given
   the application as a download in the project downloads section.

Typical Usage
   # include the controller
   require 'flash_watir'
   include FireWatir
   # create an instance of the controller
   browser = Browser.new
   # go to the flash page you want to test
   browser.goto('http://myflashapp/')
   # call the default methods available in flash
   percentage_loaded = browser.flash(:id, "clickcolors").percent_loaded
   # call the methods you have exposed on the flash application
   browser.flash(:id, "clickcolors").click
   rectangle_color = browser.flash(:id, "clickcolors").getColor

  Flash objects are identified using id. Please check out the typical usage or
  the test.
  
  For all the default methods you can use on a flash object, please refer the 
  source of flash.rb
  
  Please refer the wiki or the typical usage in readme.
  The flash_watir can work with flash applications inside containers like frame,
  div or span.

Contacts:
   Sai Venkatakrishnan (saidesertrose2004@gmail.com)

Acknowledgements:
   Gu Hui (You are indispensable and invaluable)
   Paulo Caroli (Thank you for helping me understanding flash testability)
=end
