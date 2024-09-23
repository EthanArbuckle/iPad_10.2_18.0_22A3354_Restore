@implementation STUConcreteGlobalNotification

- (void)dealloc
{
  objc_super v3;

  -[STUConcreteGlobalNotification cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)STUConcreteGlobalNotification;
  -[STUConcreteGlobalNotification dealloc](&v3, "dealloc");
}

- (STUConcreteGlobalNotification)initWithNotification:(__CFUserNotification *)a3
{
  STUConcreteGlobalNotification *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUConcreteGlobalNotification;
  v4 = -[STUConcreteGlobalNotification init](&v6, "init");
  if (v4)
  {
    CFRetain(a3);
    v4->_notificationRef = a3;
  }
  return v4;
}

- (void)cancel
{
  if (-[STUConcreteGlobalNotification notificationRef](self, "notificationRef"))
  {
    CFUserNotificationCancel(self->_notificationRef);
    CFRelease(self->_notificationRef);
    -[STUConcreteGlobalNotification setNotificationRef:](self, "setNotificationRef:", 0);
    -[STUConcreteGlobalNotification setCompletion:](self, "setCompletion:", 0);
  }
}

- (void)scheduleWithCompletion:(id)a3
{
  void *v5;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v7;
  id v8;
  void *v9;
  __CFRunLoop *Main;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(id, _QWORD, void *, void *);

  v14 = (void (**)(id, _QWORD, void *, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUConcreteGlobalNotification completion](self, "completion"));

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConcreteGlobalNotification.m"), 51, CFSTR("Programmer error to schedule the same notification more than once"));

  }
  RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, -[STUConcreteGlobalNotification notificationRef](self, "notificationRef"), (CFUserNotificationCallBack)sub_10005A56C, 0);
  if (RunLoopSource)
  {
    v7 = RunLoopSource;
    -[STUConcreteGlobalNotification setCompletion:](self, "setCompletion:", v14);
    v8 = objc_msgSend((id)objc_opt_class(self), "scheduledNotifications");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v9, "addObject:", self);

    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v7, kCFRunLoopCommonModes);
    CFRelease(v7);
  }
  else
  {
    v11 = CRKErrorWithCodeAndUserInfo(10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14[2](v14, 0, &__NSDictionary0__struct, v12);

  }
}

- (void)fireWithResponseFlags:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, unint64_t, void *, _QWORD);

  v8 = (void (**)(id, unint64_t, void *, _QWORD))objc_claimAutoreleasedReturnValue(-[STUConcreteGlobalNotification completion](self, "completion"));
  -[STUConcreteGlobalNotification setCompletion:](self, "setCompletion:", 0);
  if (v8)
  {
    v5 = -[__CFDictionary copy](CFUserNotificationGetResponseDictionary(-[STUConcreteGlobalNotification notificationRef](self, "notificationRef")), "copy");
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = &__NSDictionary0__struct;
    v8[2](v8, a3, v7, 0);

  }
}

+ (id)scheduledNotifications
{
  if (qword_1000FC4F8 != -1)
    dispatch_once(&qword_1000FC4F8, &stru_1000CB6B0);
  return (id)qword_1000FC500;
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  self->_notificationRef = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
}

@end
