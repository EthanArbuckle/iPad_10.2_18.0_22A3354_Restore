@implementation STUPasscodeEnabledPropertyProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUPasscodeEnabledPropertyProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUPasscodeEnabledPropertyProvider_iOS;
  -[STUPasscodeEnabledPropertyProvider_iOS dealloc](&v3, "dealloc");
}

- (STUPasscodeEnabledPropertyProvider_iOS)init
{
  STUPasscodeEnabledPropertyProvider_iOS *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUPasscodeEnabledPropertyProvider_iOS;
  result = -[STUPasscodeEnabledPropertyProvider init](&v3, "init");
  if (result)
    result->mPasscodeChangedNotificationToken = -1;
  return result;
}

- (void)beginUpdating
{
  int *p_mPasscodeChangedNotificationToken;
  id v4;
  const char *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  uint8_t buf[24];

  p_mPasscodeChangedNotificationToken = &self->mPasscodeChangedNotificationToken;
  if (self->mPasscodeChangedNotificationToken == -1)
  {
    objc_initWeak(&location, self);
    v4 = objc_retainAutorelease(MCPasscodeChangedNotification);
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    v6 = &_dispatch_main_q;
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100041918;
    v13 = &unk_1000C9928;
    objc_copyWeak(&v14, &location);
    v7 = notify_register_dispatch(v5, p_mPasscodeChangedNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v10);

    if ((_DWORD)v7)
    {
      *p_mPasscodeChangedNotificationToken = -1;
      if (qword_1000FC3B8 != -1)
        dispatch_once(&qword_1000FC3B8, &stru_1000CAC70);
      v8 = (id)qword_1000FC3B0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7, v10, v11, v12, v13));
        sub_10007C2AC((uint64_t)v4, v9, buf, v8);
      }

    }
    else
    {
      -[STUPasscodeEnabledPropertyProvider_iOS passcodeEnabledDidChange](self, "passcodeEnabledDidChange", v10, v11, v12, v13);
    }
    objc_destroyWeak(&v14);

    objc_destroyWeak(&location);
  }
}

- (void)endUpdating
{
  int mPasscodeChangedNotificationToken;

  mPasscodeChangedNotificationToken = self->mPasscodeChangedNotificationToken;
  if (mPasscodeChangedNotificationToken != -1)
  {
    notify_cancel(mPasscodeChangedNotificationToken);
    self->mPasscodeChangedNotificationToken = -1;
  }
}

- (void)passcodeEnabledDidChange
{
  id v4;

  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    -[STUPasscodeEnabledPropertyProvider setPasscodeEnabled:](self, "setPasscodeEnabled:", objc_msgSend(v4, "isPasscodeSet"));

  }
  else
  {
    -[STUPasscodeEnabledPropertyProvider_iOS performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

@end
