@implementation STUPasscodeEnabledPropertyProvider

- (STUPasscodeEnabledPropertyProvider)init
{
  STUPasscodeEnabledPropertyProvider *v2;
  STUPasscodeEnabledPropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUPasscodeEnabledPropertyProvider;
  v2 = -[STUPasscodeEnabledPropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &__kCFBooleanFalse);
  return v3;
}

- (id)key
{
  return CRKDevicePasscodeEnabledKey;
}

- (BOOL)passcodeEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setPasscodeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[STUPasscodeEnabledPropertyProvider passcodeEnabled](self, "passcodeEnabled") != a3)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v5);

  }
}

@end
