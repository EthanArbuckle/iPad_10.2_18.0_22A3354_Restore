@implementation STUAppLockedPropertyProvider

- (STUAppLockedPropertyProvider)init
{
  STUAppLockedPropertyProvider *v2;
  STUAppLockedPropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUAppLockedPropertyProvider;
  v2 = -[STUAppLockedPropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &__kCFBooleanFalse);
  return v3;
}

- (id)key
{
  return CRKDeviceAppLockedKey;
}

- (BOOL)isAppLocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setAppLocked:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = a3;
  if (-[STUAppLockedPropertyProvider isAppLocked](self, "isAppLocked") != a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v5);

    if (qword_1000FC0A8 != -1)
      dispatch_once(&qword_1000FC0A8, &stru_1000C9BF0);
    v6 = (void *)qword_1000FC0A0;
    if (os_log_type_enabled((os_log_t)qword_1000FC0A0, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[STUAppLockedPropertyProvider isAppLocked](self, "isAppLocked")));
      v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "appLocked = %{public}@", (uint8_t *)&v9, 0xCu);

    }
  }
}

@end
