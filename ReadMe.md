## Cup Demo
This application is a demo of [Cup](https://github.com/aparajita/Cup), the ultimate upload framework for [Cappuccino](http://www.cappuccino-project.org). It provides a fairly complete overview of Cup's features. Currently everything is configured in the xib, so if you are not running on Mac OS X it won't be much help in terms of learning how to configure Cup through code.

### Installation
There are a few things you will need to do before running the demo:

1. Install Cup by following the [installation instructions](https://github.com/aparajita/Cup/wiki/Home).
1. Configure your web server (it must be able to server php) to the cup-demo directory.
1. Copy or symlink the Cup framework into the application's Frameworks directory. One easy way to do this:
```sh
cd /path/to/cup-demo
capp gen -lf -F Cup .
```

If you need to change the URL for the upload server, you can do it in Xcode in or AppController.j.

#### Xcode
1. Open the demo in XcodeCapp (`xcc /path/to/cup-demo`) and open the Xcode project if necessary.
1. Edit MainMenu.xib.
1. Select the Cup object in the object list.
1. Select the Identity Inspector.
1. Change the value of the "URL" item in User Defined Runtime Attributes to the address of your upload server.

#### AppController.j
In `applicationDidFinishLaunching:`, add this line of code:

```objj
[uploader setURL:@"http://host/path/to/upload/handler"];
```
