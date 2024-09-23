@implementation UserNotification

- (UserNotification)initWithType:(int)a3 device:(id)a4 bundleID:(id)a5
{
  id v9;
  id v10;
  UserNotification *v11;
  UserNotification *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UserNotification;
  v11 = -[UserNotification init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_device, a4);
    objc_storeStrong((id *)&v12->_bundleID, a5);
    v12->_notification = 0;
    v12->_runLoopSource = 0;
  }

  return v12;
}

- (void)dealloc
{
  __CFUserNotification *notification;
  __CFRunLoop *Main;
  objc_super v5;

  notification = self->_notification;
  if (notification)
  {
    CFUserNotificationCancel(notification);
    CFRelease(self->_notification);
  }
  if (self->_runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, kCFRunLoopDefaultMode);
    CFRelease(self->_runLoopSource);
  }
  v5.receiver = self;
  v5.super_class = (Class)UserNotification;
  -[UserNotification dealloc](&v5, "dealloc");
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  __CFUserNotification *notification;
  __CFUserNotification *v5;

  notification = self->_notification;
  if (a3)
    v5 = (__CFUserNotification *)CFRetain(a3);
  else
    v5 = 0;
  self->_notification = v5;
  if (notification)
  {
    CFUserNotificationCancel(notification);
    CFRelease(notification);
  }
}

- (__CFRunLoopSource)runLoopSource
{
  return self->_runLoopSource;
}

- (void)setRunLoopSource:(__CFRunLoopSource *)a3
{
  __CFRunLoopSource *runLoopSource;
  __CFRunLoopSource *v6;
  __CFRunLoop *Main;
  __CFRunLoop *v8;

  runLoopSource = self->_runLoopSource;
  if (a3)
    v6 = (__CFRunLoopSource *)CFRetain(a3);
  else
    v6 = 0;
  self->_runLoopSource = v6;
  if (runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, runLoopSource, kCFRunLoopDefaultMode);
    CFRelease(runLoopSource);
  }
  if (a3)
  {
    v8 = CFRunLoopGetMain();
    CFRunLoopAddSource(v8, a3, kCFRunLoopDefaultMode);
  }
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSUUID)device
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
