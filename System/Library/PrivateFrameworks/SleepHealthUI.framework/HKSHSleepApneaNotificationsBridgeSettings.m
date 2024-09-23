@implementation HKSHSleepApneaNotificationsBridgeSettings

- (HKSHSleepApneaNotificationsBridgeSettings)initWithSettingVisible:(BOOL)a3 settingEnabled:(BOOL)a4 showOnboarding:(BOOL)a5 footer:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  HKSHSleepApneaNotificationsBridgeSettings *v11;
  HKSHSleepApneaNotificationsBridgeSettings *v12;
  objc_super v14;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)HKSHSleepApneaNotificationsBridgeSettings;
  v11 = -[HKSHSleepApneaNotificationsBridgeSettings init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HKSHSleepApneaNotificationsBridgeSettings setSettingVisible:](v11, "setSettingVisible:", v8);
    -[HKSHSleepApneaNotificationsBridgeSettings setSettingEnabled:](v12, "setSettingEnabled:", v7);
    -[HKSHSleepApneaNotificationsBridgeSettings setShowOnboarding:](v12, "setShowOnboarding:", v6);
    -[HKSHSleepApneaNotificationsBridgeSettings setFooter:](v12, "setFooter:", v10);
  }

  return v12;
}

+ (id)hiddenSettings
{
  return -[HKSHSleepApneaNotificationsBridgeSettings initWithSettingVisible:settingEnabled:showOnboarding:footer:]([HKSHSleepApneaNotificationsBridgeSettings alloc], "initWithSettingVisible:settingEnabled:showOnboarding:footer:", 0, 0, 0, 0);
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (void)setSettingVisible:(BOOL)a3
{
  self->_settingVisible = a3;
}

- (BOOL)settingEnabled
{
  return self->_settingEnabled;
}

- (void)setSettingEnabled:(BOOL)a3
{
  self->_settingEnabled = a3;
}

- (BOOL)showOnboarding
{
  return self->_showOnboarding;
}

- (void)setShowOnboarding:(BOOL)a3
{
  self->_showOnboarding = a3;
}

- (HKSHSleepApneaNotificationsFooter)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_storeStrong((id *)&self->_footer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
}

@end
