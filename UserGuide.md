## Introduction ##

[FlashWatir](http://code.google.com/p/flash-watir/) is an extension of watir for testing flash applications in firefox. **[FlashWatir](http://code.google.com/p/flash-watir/) has been built on firewatir and so can work only on firefox as of now.** The work on IE is going on and may be available after sometime.

## Installation ##

  * To Install ruby: http://www.ruby-lang.org

> The instructions to install ruby must be available in the website. Once you install check the installation by typing > ruby -v in the command line which should give the version number of ruby.

  * To install firewatir: http://wtr.rubyforge.org/

> From command line:
> > gem install watir.

  * To Install flashwatir:

> Best way to install is to use the gem. You can download the gem from download section of this project

> From your command line:
> > gem install flash\_watir

**When writing script using `FlashWatir`, use require statement to import `FlashWatir` but when including the module you still need to use `FireWatir`.**

## Testability of Flash ##

FlashWatir works with flash using javascript. Any function you need to call in flash either to change something or to get some values needs to get exposed as ExternalInterface.

```
// functions available for JavaSript call
ExternalInterface.addCallback("getColor", getColor);
ExternalInterface.addCallback("click", changeColor);
ExternalInterface.addCallback("getSquareLabel", getSquareLabel);
ExternalInterface.addCallback("setSquareLabel", setSquareLabel);
```

The default methods like play(), percantage loaded, etc. can be called directly on flash. For more info about these methods please refer the flash.rb file in the source.