## Details ##

Flash ExternalInterface provides a mechanism for which you can use JavaScript to call an ActionScript function in the Flash Player. In [FlashWatir](http://code.google.com/p/flash-watir/) we use JavaScript as the conduit between Watir and the Flash application.

With Flash ExternalInterface you can expose specific Flash object functions.For example, the following code adds external invocation capabilities to some of the `ColoredSquare` Flash component methods.

```
// functions available for JavaSript call
ExternalInterface.addCallback("getColor", getColor);
ExternalInterface.addCallback("click", changeColor);
ExternalInterface.addCallback("getSquareLabel", getSquareLabel);
ExternalInterface.addCallback("setSquareLabel", setSquareLabel);
```

On the testing side, The [FlashWatir](http://code.google.com/p/flash-watir/) is the component adding Flash communication capabilities to the Watir. The flash object is identified using id given in the OBJECT tag of the flash component on the html side.

You can invoke functions which were externalized by the ExternalInterface, as well as the default functions of any flash object (e.g, `PercentLoaded(), IsPlaying()`, etc).