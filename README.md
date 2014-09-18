AQSTodayExtensionSpy
========================

Determine whether the Today Extension added to the notification center.

```objc
// In view controller of the App.

AQSTodayExtensionObsever *observer = [AQSTodayExtensionObserver observerWithIdentifier:@"com.example.yourapp"];

observer.hasTodayExtensionOpened; // Returns `YES` or `NO`
observer.lastOpenedDateOrNil; // Returns last opened `NSDate` or `nil`.
```

You can receive notifications which will notify when..

1. When the Today Extension opened at first.
2. When the Today Extension opened. (No matter it is opened at first.)

```objc
// In the view controller of the App.

AQSTodayExtensionObserver *observer = [AQSTodayExtensionObserver observerWithIdentifier:@"com.example.yourapp"];
[observer observeOpenStatus];
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeTodayExtensionOpenStatus:) object:observer];
```

Note you should put the code in the Today Extension.

```objc
// In the view controller of the Today Extension

- (void)viewDidLoad {
    [super viewDidLoad];

    AQSTodayExtensionSpy *spy = [AQSTodayExtensionSpy spyWithIdentifier:@"com.example.yourapp"];
    [spy didOpenTodayExtension];
}
```

References
---

- Sharing NSUserDefaults between your app and a today extension http://tapadoo.com/2014/sharing-nsuserdefaults-between-your-app-and-a-today-extension-on-ios-8/
- KVO NSUserDefaults http://stackoverflow.com/questions/15202562/detect-changes-on-nsuserdefaults
- App Extension や Widgets に App Container を使わないで簡単にデータを渡す方法 http://akisute.com/2014_06_01_archive.html
