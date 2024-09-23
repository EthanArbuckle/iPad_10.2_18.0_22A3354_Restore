@implementation STUScreenIsOnPropertyProvider_iOS

- (void)dealloc
{
  objc_super v3;

  -[STUScreenIsOnPropertyProvider_iOS endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUScreenIsOnPropertyProvider_iOS;
  -[STUScreenIsOnPropertyProvider_iOS dealloc](&v3, "dealloc");
}

- (STUScreenIsOnPropertyProvider_iOS)init
{
  STUScreenIsOnPropertyProvider_iOS *v2;
  STUScreenIsOnPropertyProvider_iOS *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUScreenIsOnPropertyProvider_iOS;
  v2 = -[STUScreenIsOnPropertyProvider_iOS init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &off_1000D40C8);
    v3->mNotificationToken = -1;
  }
  return v3;
}

- (id)key
{
  return CRKDeviceScreenStateKey;
}

- (void)beginUpdating
{
  int *p_mNotificationToken;
  const char *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  uint8_t buf[24];

  p_mNotificationToken = &self->mNotificationToken;
  if (self->mNotificationToken == -1)
  {
    objc_initWeak(&location, self);
    v4 = (const char *)objc_msgSend(CFSTR("com.apple.springboard.hasBlankedScreen"), "UTF8String");
    v5 = &_dispatch_main_q;
    v8 = _NSConcreteStackBlock;
    v9 = 3221225472;
    v10 = sub_1000094C8;
    v11 = &unk_1000C9928;
    objc_copyWeak(&v12, &location);
    LODWORD(v4) = notify_register_dispatch(v4, p_mNotificationToken, (dispatch_queue_t)&_dispatch_main_q, &v8);

    if ((_DWORD)v4)
    {
      if (qword_1000FC058 != -1)
        dispatch_once(&qword_1000FC058, &stru_1000C9A18);
      v6 = (id)qword_1000FC050;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenIsOnPropertyProvider_iOS key](self, "key", v8, v9, v10, v11));
        sub_10007A77C(v7, buf, v6);
      }

      *p_mNotificationToken = -1;
    }
    else
    {
      -[STUScreenIsOnPropertyProvider_iOS updateScreenState](self, "updateScreenState", v8, v9, v10, v11);
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)endUpdating
{
  int mNotificationToken;

  mNotificationToken = self->mNotificationToken;
  if (mNotificationToken != -1)
  {
    notify_cancel(mNotificationToken);
    self->mNotificationToken = -1;
  }
}

- (void)updateScreenState
{
  void *v3;
  id v4;
  int mNotificationToken;
  void *v6;
  uint64_t state64;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  mNotificationToken = self->mNotificationToken;
  if (mNotificationToken == -1)
  {
    if (v4)
      -[STUDevicePropertyProvider setValue:](self, "setValue:", &off_1000D40C8);
  }
  else
  {
    state64 = 0;
    notify_get_state(mNotificationToken, &state64);
    if (v4 != (id)(state64 == 0))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
      -[STUDevicePropertyProvider setValue:](self, "setValue:", v6);

    }
  }
}

@end
