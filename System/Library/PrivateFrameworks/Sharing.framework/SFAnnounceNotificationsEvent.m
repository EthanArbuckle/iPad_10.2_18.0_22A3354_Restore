@implementation SFAnnounceNotificationsEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.AnnounceNotifications");
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("tappedInitialEnable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceNotificationsEvent tappedInitialEnable](self, "tappedInitialEnable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("tappedCustomize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceNotificationsEvent tappedCustomize](self, "tappedCustomize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("tappedNotNow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceNotificationsEvent tappedNotNow](self, "tappedNotNow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("tappedDismissButton");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceNotificationsEvent tappedDismissButton](self, "tappedDismissButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = CFSTR("customizedApps");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceNotificationsEvent customizedApps](self, "customizedApps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFAnnounceNotificationsEvent eventName](SFAnnounceNotificationsEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAnnounceNotificationsEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (BOOL)tappedInitialEnable
{
  return self->_tappedInitialEnable;
}

- (void)setTappedInitialEnable:(BOOL)a3
{
  self->_tappedInitialEnable = a3;
}

- (BOOL)tappedCustomize
{
  return self->_tappedCustomize;
}

- (void)setTappedCustomize:(BOOL)a3
{
  self->_tappedCustomize = a3;
}

- (BOOL)tappedNotNow
{
  return self->_tappedNotNow;
}

- (void)setTappedNotNow:(BOOL)a3
{
  self->_tappedNotNow = a3;
}

- (BOOL)tappedDismissButton
{
  return self->_tappedDismissButton;
}

- (void)setTappedDismissButton:(BOOL)a3
{
  self->_tappedDismissButton = a3;
}

- (BOOL)customizedApps
{
  return self->_customizedApps;
}

- (void)setCustomizedApps:(BOOL)a3
{
  self->_customizedApps = a3;
}

@end
