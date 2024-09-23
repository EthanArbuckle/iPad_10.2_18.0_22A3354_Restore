@implementation MSDSettingsDefaults

+ (id)settingsDefaults
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003190;
  block[3] = &unk_1000488C0;
  block[4] = a1;
  if (qword_100052728 != -1)
    dispatch_once(&qword_100052728, block);
  return (id)qword_100052730;
}

- (MSDSettingsDefaults)init
{
  MSDSettingsDefaults *v2;
  id v3;
  NSUserDefaults *v4;
  NSUserDefaults *userSettingsDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDSettingsDefaults;
  v2 = -[MSDSettingsDefaults init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc((Class)NSUserDefaults);
    v4 = (NSUserDefaults *)objc_msgSend(v3, "initWithSuiteName:", kMediaSetupSettingsDomain);
    userSettingsDefaults = v2->_userSettingsDefaults;
    v2->_userSettingsDefaults = v4;

  }
  return v2;
}

- (NSUserDefaults)userSettingsDefaults
{
  return self->_userSettingsDefaults;
}

- (void)setUserSettingsDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userSettingsDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsDefaults, 0);
}

@end
