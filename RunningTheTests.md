## Introduction ##

These are the instructions to run the tests which come with `FlashWatir`. Also you can use similar method to run your tests.


## Details ##

The sample flash application used for testing is available in the Downloads section of the project. The application you are testing needs to be hosted in a web server to be used in `FlashWatir`. You can use IIS or anyother existing server to host this and then checkout if you are able to access the web page.

The installation instructions for `FlashWatir` is available in the UserGuide section of wiki. Once you install the go to the test folder and **change the url of the application in the individual methods of the test to the url of the application you have hosted**.
Now you should be good to go. Run the test and checkout `FlashWatir` testing the flash.

If you are not able to host the application, there is one already hosted in the internet. You can use the url http://www.geocities.com/paulocaroli/flash/colors.html. Please use something like firebug to find out the flash element hierarchy and update the script according to that before running the test.

If you face any problems in running the tests or in testing flash application using `FlashWatir`, please let me know.