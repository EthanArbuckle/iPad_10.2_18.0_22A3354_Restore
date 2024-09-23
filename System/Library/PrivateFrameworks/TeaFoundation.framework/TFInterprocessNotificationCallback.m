@implementation TFInterprocessNotificationCallback

- (TFInterprocessNotificationCallback)initWithNotificationName:(id)a3 callback:(id)a4
{
  __CFString *v7;
  id v8;
  TFInterprocessNotificationCallback *v9;
  void *v10;
  id callback;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v14;

  v7 = (__CFString *)a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFInterprocessNotificationCallback;
  v9 = -[TFInterprocessNotificationCallback init](&v14, sel_init);
  if (v9)
  {
    v10 = _Block_copy(v8);
    callback = v9->_callback;
    v9->_callback = v10;

    objc_storeStrong((id *)&v9->_notificationName, a3);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)interprocessNotificationHandler, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v9;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[TFInterprocessNotificationCallback notificationName](self, "notificationName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
  v5.receiver = self;
  v5.super_class = (Class)TFInterprocessNotificationCallback;
  -[TFInterprocessNotificationCallback dealloc](&v5, sel_dealloc);
}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (void)setNotificationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)callback
{
  return self->_callback;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
