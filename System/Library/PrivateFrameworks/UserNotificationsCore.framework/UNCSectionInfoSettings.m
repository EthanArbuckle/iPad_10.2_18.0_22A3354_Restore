@implementation UNCSectionInfoSettings

- (UNCSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3
{
  UNCSectionInfoSettings *v4;
  UNCSectionInfoSettings *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UNCSectionInfoSettings;
  v4 = -[UNCSectionInfoSettings init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UNCSectionInfoSettings setAuthorizationStatus:](v4, "setAuthorizationStatus:", 2);
    -[UNCSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", 2);
    if ((a3 | 2) == 2)
    {
      -[UNCSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", 2);
      -[UNCSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", 1);
      -[UNCSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", 0);
      -[UNCSectionInfoSettings setAlertType:](v5, "setAlertType:", 1);
      -[UNCSectionInfoSettings setPushSettings:](v5, "setPushSettings:", 0);
      -[UNCSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", 0);
      -[UNCSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", 2);
      -[UNCSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", 0);
      -[UNCSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", 0);
      -[UNCSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", 0);
      -[UNCSectionInfoSettings setScheduledDeliverySetting:](v5, "setScheduledDeliverySetting:", 1);
      -[UNCSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", 1);
      -[UNCSectionInfoSettings setDirectMessagesSetting:](v5, "setDirectMessagesSetting:", 0);
      -[UNCSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", 0);
    }
  }
  return v5;
}

- (void)muteSectionUntilDate:(id)a3
{
  id v4;

  +[UNCSectionMuteAssertion sectionMuteAssertionUntilDate:](UNCSectionMuteAssertion, "sectionMuteAssertionUntilDate:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", v4);

}

- (void)unmuteSection
{
  -[UNCSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", 0);
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) == 0))
  {
    v23 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      -[UNCSectionInfoSettings muteThreadIdentifier:untilDate:].cold.2((uint64_t)v6, v23, v24, v25, v26, v27, v28, v29);
  }
  else if (v6 && objc_msgSend(v6, "length"))
  {
    -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[UNCThreadsMuteAssertion threadsMuteAssertion](UNCThreadsMuteAssertion, "threadsMuteAssertion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCSectionInfoSettings setMuteAssertion:](self, "setMuteAssertion:", v13);

    }
    -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMutedUntilDate:forThreadIdentifier:", v7, v6);

  }
  else
  {
    v15 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      -[UNCSectionInfoSettings muteThreadIdentifier:untilDate:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v18 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      -[UNCSectionInfoSettings unmuteThreadIdentifier:].cold.2((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
  }
  else if (v4 && objc_msgSend(v4, "length"))
  {
    -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setUnmutedForThreadIdentifier:", v4);

  }
  else
  {
    v10 = *MEMORY[0x24BDF89F8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_ERROR))
      -[UNCSectionInfoSettings unmuteThreadIdentifier:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isActiveForThreadIdentifier:", v4);

  return v6;
}

- (NSDictionary)stateCapture
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[UNCSectionInfoSettings _authorizationStatusDescription](self, "_authorizationStatusDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("Authorized"));

  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("Authorization Expiration Date"));

  -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("Last User Granted Authorizated"));

  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("Mute Configuration"));

  if (-[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("NotificationCenter"));

  }
  if (-[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("LockScreen"));

  }
  if (-[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting") == 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("CarPlay"));

  }
  if (-[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting") == 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v14, CFSTR("RemoteNotifications"));

  }
  if (-[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting") == 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("CriticalAlerts"));

  }
  if (-[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("TimeSensitive"));

    UNCStringFromBool(-[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("UserConfiguredTimeSensitive"));

  }
  if (-[UNCSectionInfoSettings announceSetting](self, "announceSetting"))
  {
    -[UNCSectionInfoSettings _announceSettingDescription](self, "_announceSettingDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("AnnounceNotifications"));

  }
  if (-[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting") == 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("ScheduledDelivery"));

  }
  if (-[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"))
  {
    UNCStringFromBool(-[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting") == 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("DirectMessages"));

    UNCStringFromBool(-[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("UserConfiguredDirectMessages"));

  }
  UNCStringFromBool(-[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("ShowsOnExternalDevices"));

  UNCStringFromBool(-[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v23, CFSTR("CustomSettingsLink"));

  -[UNCSectionInfoSettings _contentPreviewSettingDescription](self, "_contentPreviewSettingDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("ContentPreviewSetting"));

  -[UNCSectionInfoSettings _alertTypeDescription](self, "_alertTypeDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("AlertType"));

  UNCStringFromBool(-[UNCSectionInfoSettings pushSettings](self, "pushSettings") & 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("PushSettingsBadgeSupported"));

  UNCStringFromBool((-[UNCSectionInfoSettings pushSettings](self, "pushSettings") >> 3) & 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("PushSettingsBadgeEnabled"));

  UNCStringFromBool((-[UNCSectionInfoSettings pushSettings](self, "pushSettings") >> 1) & 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("PushSettingsSoundSupported"));

  UNCStringFromBool((-[UNCSectionInfoSettings pushSettings](self, "pushSettings") >> 4) & 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("PushSettingsSoundEnabled"));

  UNCStringFromBool((-[UNCSectionInfoSettings pushSettings](self, "pushSettings") >> 2) & 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("PushSettingsAlertSupported"));

  UNCStringFromBool((-[UNCSectionInfoSettings pushSettings](self, "pushSettings") >> 5) & 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v31, CFSTR("PushSettingsAlertEnabled"));

  -[UNCSectionInfoSettings _bulletinGroupingSettingDescription](self, "_bulletinGroupingSettingDescription");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v32, CFSTR("GroupingSetting"));

  return (NSDictionary *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;

  -[UNCSectionInfoSettings _authorizationStatusDescription](self, "_authorizationStatusDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(" Section settings"), "stringByAppendingFormat:", CFSTR(": authorized = %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(", authorization expiration date = %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", last user granted authorization date = %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(", mute configuration = %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"))
  {
    if (-[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", notification center = %@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  if (-[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"))
  {
    if (-[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", lock screen = %@"), v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v14;
  }
  if (-[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"))
  {
    if (-[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting") == 2)
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", scheduled delivery = %@"), v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v16;
  }
  if (-[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"))
  {
    if (-[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting") == 2)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", CarPlay = %@"), v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v18;
  }
  if (-[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"))
  {
    if (-[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting") == 2)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", remote notifications = %@"), v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v20;
  }
  if (-[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"))
  {
    if (-[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting") == 2)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", critical alert = %@"), v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v22;
  }
  if (-[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"))
  {
    if (-[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", time sensitive = %@"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR(", user configured time sensitive = %@"), v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[UNCSectionInfoSettings announceSetting](self, "announceSetting"))
  {
    -[UNCSectionInfoSettings _announceSettingDescription](self, "_announceSettingDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", announce setting = %@"), v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v27;
  }
  if (-[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"))
  {
    if (-[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting") == 2)
      v28 = CFSTR("YES");
    else
      v28 = CFSTR("NO");
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", direct messages = %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"))
    {
      v30 = CFSTR("YES");
    }
    else
    {
      v30 = CFSTR("NO");
    }
    objc_msgSend(v29, "stringByAppendingFormat:", CFSTR(", user configured direct messages = %@"), v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(", shows on external devices = %@"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  objc_msgSend(v32, "stringByAppendingFormat:", CFSTR(", shows custom settings = %@"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings _contentPreviewSettingDescription](self, "_contentPreviewSettingDescription");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringByAppendingFormat:", CFSTR(", content preview setting = %@"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings _alertTypeDescription](self, "_alertTypeDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringByAppendingFormat:", CFSTR(", Alert style = %@"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  UNCPushSettingsDescription(-[UNCSectionInfoSettings pushSettings](self, "pushSettings"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringByAppendingFormat:", CFSTR(", Push settings = %@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[UNCSectionInfoSettings _bulletinGroupingSettingDescription](self, "_bulletinGroupingSettingDescription");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "stringByAppendingFormat:", CFSTR(", grouping = %@"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v46.receiver = self;
  v46.super_class = (Class)UNCSectionInfoSettings;
  -[UNCSectionInfoSettings description](&v46, sel_description);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "stringByAppendingString:", v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)_authorizationStatusDescription
{
  unint64_t v2;

  v2 = -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus");
  if (v2 > 4)
    return CFSTR("<invalid>");
  else
    return off_251AE07F0[v2];
}

- (id)_alertTypeDescription
{
  unint64_t v2;

  v2 = -[UNCSectionInfoSettings alertType](self, "alertType");
  if (v2 > 2)
    return CFSTR("<invalid>");
  else
    return off_251AE0818[v2];
}

- (id)_contentPreviewSettingDescription
{
  unint64_t v2;

  v2 = -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
  if (v2 > 3)
    return CFSTR("<invalid>");
  else
    return off_251AE0830[v2];
}

- (id)_bulletinGroupingSettingDescription
{
  unint64_t v2;

  v2 = -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting");
  if (v2 > 2)
    return CFSTR("<invalid>");
  else
    return off_251AE0850[v2];
}

- (id)_announceSettingDescription
{
  unint64_t v2;

  v2 = -[UNCSectionInfoSettings announceSetting](self, "announceSetting");
  if (v2 > 3)
    return 0;
  else
    return off_251AE0868[v2];
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;

  v3 = -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus");
  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");
  v10 = -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting");
  v11 = v10 ^ -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting");
  v12 = v9 ^ v11 ^ -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices");
  v13 = -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink");
  v14 = v13 ^ -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
  v15 = v12 ^ v14 ^ -[UNCSectionInfoSettings alertType](self, "alertType");
  v16 = -[UNCSectionInfoSettings pushSettings](self, "pushSettings");
  v17 = v16 ^ -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting");
  v18 = v17 ^ -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
  v19 = v18 ^ -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting");
  v20 = v19 ^ -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting");
  v21 = v15 ^ v20 ^ -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting");
  v22 = -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting");
  v23 = v22 ^ -[UNCSectionInfoSettings announceSetting](self, "announceSetting");
  v24 = v23 ^ -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting");
  v25 = v24 ^ -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting");
  v26 = v21 ^ v25 ^ -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting");

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  UNCSectionInfoSettings *v4;
  UNCSectionInfoSettings *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  int64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  _BOOL4 v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  _BOOL4 v30;

  v4 = (UNCSectionInfoSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      v6 = -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus");
      if (v6 == -[UNCSectionInfoSettings authorizationStatus](v5, "authorizationStatus"))
      {
        -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UNCSectionInfoSettings authorizationExpirationDate](v5, "authorizationExpirationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {
          -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](v5, "lastUserGrantedAuthorizationDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10 == v11)
          {
            -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[UNCSectionInfoSettings muteAssertion](v5, "muteAssertion");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (!BSEqualObjects())
              goto LABEL_30;
            v14 = -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting");
            if (v14 != -[UNCSectionInfoSettings notificationCenterSetting](v5, "notificationCenterSetting"))
              goto LABEL_30;
            v15 = -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting");
            if (v15 != -[UNCSectionInfoSettings lockScreenSetting](v5, "lockScreenSetting"))
              goto LABEL_30;
            v16 = -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices");
            if (v16 != -[UNCSectionInfoSettings showsOnExternalDevices](v5, "showsOnExternalDevices"))
              goto LABEL_30;
            v17 = -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink");
            if (v17 != -[UNCSectionInfoSettings showsCustomSettingsLink](v5, "showsCustomSettingsLink"))
              goto LABEL_30;
            v18 = -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting");
            if (v18 != -[UNCSectionInfoSettings contentPreviewSetting](v5, "contentPreviewSetting"))
              goto LABEL_30;
            v19 = -[UNCSectionInfoSettings alertType](self, "alertType");
            if (v19 != -[UNCSectionInfoSettings alertType](v5, "alertType"))
              goto LABEL_30;
            v20 = -[UNCSectionInfoSettings pushSettings](self, "pushSettings");
            if (v20 != -[UNCSectionInfoSettings pushSettings](v5, "pushSettings"))
              goto LABEL_30;
            v21 = -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting");
            if (v21 != -[UNCSectionInfoSettings carPlaySetting](v5, "carPlaySetting"))
              goto LABEL_30;
            v22 = -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting");
            if (v22 != -[UNCSectionInfoSettings remoteNotificationsSetting](v5, "remoteNotificationsSetting"))
              goto LABEL_30;
            v23 = -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting");
            if (v23 == -[UNCSectionInfoSettings criticalAlertSetting](v5, "criticalAlertSetting")
              && (v24 = -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"),
                  v24 == -[UNCSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting"))
              && (v25 = -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), v25 == -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](v5, "hasUserConfiguredTimeSensitiveSetting"))&& (v26 = -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), v26 == -[UNCSectionInfoSettings bulletinGroupingSetting](v5, "bulletinGroupingSetting"))&& (v27 = -[UNCSectionInfoSettings announceSetting](self, "announceSetting"), v27 == -[UNCSectionInfoSettings announceSetting](v5, "announceSetting"))&& (v28 = -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), v28 == -[UNCSectionInfoSettings scheduledDeliverySetting](v5, "scheduledDeliverySetting"))&& (v29 = -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), v29 == -[UNCSectionInfoSettings directMessagesSetting](v5, "directMessagesSetting")))
            {
              v30 = -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting");
              v9 = v30 ^ -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](v5, "hasUserConfiguredDirectMessagesSetting") ^ 1;
            }
            else
            {
LABEL_30:
              LOBYTE(v9) = 0;
            }

          }
          else
          {
            LOBYTE(v9) = 0;
          }

        }
        else
        {
          LOBYTE(v9) = 0;
        }

      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAuthorizationStatus:", -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthorizationExpirationDate:", v6);

  -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastUserGrantedAuthorizationDate:", v7);

  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setMuteAssertion:", v9);

  objc_msgSend(v5, "setNotificationCenterSetting:", -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v5, "setLockScreenSetting:", -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v5, "setShowsOnExternalDevices:", -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v5, "setShowsCustomSettingsLink:", -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v5, "setContentPreviewSetting:", -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v5, "setAlertType:", -[UNCSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v5, "setPushSettings:", -[UNCSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v5, "setCarPlaySetting:", -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v5, "setRemoteNotificationsSetting:", -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v5, "setCriticalAlertSetting:", -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v5, "setTimeSensitiveSetting:", -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v5, "setUserConfiguredTimeSensitiveSetting:", -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v5, "setBulletinGroupingSetting:", -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  objc_msgSend(v5, "setAnnounceSetting:", -[UNCSectionInfoSettings announceSetting](self, "announceSetting"));
  objc_msgSend(v5, "setScheduledDeliverySetting:", -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  objc_msgSend(v5, "setDirectMessagesSetting:", -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v5, "setUserConfiguredDirectMessagesSetting:", -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionInfoSettings)initWithCoder:(id)a3
{
  id v4;
  UNCSectionInfoSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UNCSectionInfoSettings;
  v5 = -[UNCSectionInfoSettings init](&v19, sel_init);
  if (v5)
  {
    -[UNCSectionInfoSettings setAuthorizationStatus:](v5, "setAuthorizationStatus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("authorizationStatus")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationExpirationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfoSettings setAuthorizationExpirationDate:](v5, "setAuthorizationExpirationDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUserGrantedAuthorizationDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfoSettings setLastUserGrantedAuthorizationDate:](v5, "setLastUserGrantedAuthorizationDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("muteAssertion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCSectionInfoSettings setMuteAssertion:](v5, "setMuteAssertion:", v8);

    -[UNCSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationCenterSetting")));
    -[UNCSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lockScreenSetting")));
    -[UNCSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsOnExternalDevices")));
    -[UNCSectionInfoSettings setShowsCustomSettingsLink:](v5, "setShowsCustomSettingsLink:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsCustomSettingsLink")));
    -[UNCSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contentPreviewSetting")));
    -[UNCSectionInfoSettings setAlertType:](v5, "setAlertType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alertType")));
    -[UNCSectionInfoSettings setPushSettings:](v5, "setPushSettings:", (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pushSettings")));
    -[UNCSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("carPlaySetting")));
    -[UNCSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("remoteNotificationsSetting")));
    -[UNCSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("criticalAlertSetting")));
    -[UNCSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeSensitiveSetting")));
    -[UNCSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfiguredTimeSensitiveSetting")));
    -[UNCSectionInfoSettings setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bulletinGroupingSetting")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("announceSetting")))
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("announceSetting"));
    else
      v9 = 1;
    if (v9 <= 1)
      v10 = 1;
    else
      v10 = v9;
    -[UNCSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", v10);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("scheduledDeliverySetting")))
      v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledDeliverySetting"));
    else
      v11 = 1;
    if (v11 <= 1)
      v12 = 1;
    else
      v12 = v11;
    -[UNCSectionInfoSettings setScheduledDeliverySetting:](v5, "setScheduledDeliverySetting:", v12);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("directMessagesSettingKey")))
      v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("directMessagesSettingKey"));
    else
      v13 = 0;
    -[UNCSectionInfoSettings setDirectMessagesSetting:](v5, "setDirectMessagesSetting:", v13);
    -[UNCSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfiguredDirectMessagesSetting")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsNotifications")))
      -[UNCSectionInfoSettings setAllowsNotifications:](v5, "setAllowsNotifications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsNotifications")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("showsMessagePreview")))
      -[UNCSectionInfoSettings setShowsMessagePreview:](v5, "setShowsMessagePreview:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsMessagePreview")));
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("notificationCenterSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("showsInNotificationCenter")))
    {
      -[UNCSectionInfoSettings setShowsInNotificationCenter:](v5, "setShowsInNotificationCenter:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInNotificationCenter")));
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lockScreenSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("showsInLockScreen")))
    {
      -[UNCSectionInfoSettings setShowsInLockScreen:](v5, "setShowsInLockScreen:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsInLockScreen")));
    }
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("announceSetting")) & 1) == 0
      && objc_msgSend(v4, "containsValueForKey:", CFSTR("spokenNotificationSetting")))
    {
      v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("spokenNotificationSetting"));
      if (v14)
      {
        if (v14 != 2)
        {
          v15 = v14 == 1;
LABEL_37:
          -[UNCSectionInfoSettings setAnnounceSetting:](v5, "setAnnounceSetting:", v15);
          goto LABEL_38;
        }
        v16 = -[UNCSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting") == 0;
        v17 = 2;
      }
      else
      {
        v16 = -[UNCSectionInfoSettings timeSensitiveSetting](v5, "timeSensitiveSetting") == 2;
        v17 = 1;
      }
      if (v16)
        v15 = v17 + 1;
      else
        v15 = v17;
      goto LABEL_37;
    }
  }
LABEL_38:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus"), CFSTR("authorizationStatus"));
  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("authorizationExpirationDate"));

  -[UNCSectionInfoSettings lastUserGrantedAuthorizationDate](self, "lastUserGrantedAuthorizationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("lastUserGrantedAuthorizationDate"));

  -[UNCSectionInfoSettings muteAssertion](self, "muteAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("muteAssertion"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"), CFSTR("notificationCenterSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"), CFSTR("lockScreenSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"), CFSTR("showsOnExternalDevices"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"), CFSTR("showsCustomSettingsLink"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"), CFSTR("contentPreviewSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings alertType](self, "alertType"), CFSTR("alertType"));
  objc_msgSend(v7, "encodeInt32:forKey:", -[UNCSectionInfoSettings pushSettings](self, "pushSettings"), CFSTR("pushSettings"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"), CFSTR("carPlaySetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), CFSTR("remoteNotificationsSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"), CFSTR("criticalAlertSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"), CFSTR("timeSensitiveSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), CFSTR("userConfiguredTimeSensitiveSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), CFSTR("bulletinGroupingSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings announceSetting](self, "announceSetting"), CFSTR("announceSetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), CFSTR("scheduledDeliverySetting"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), CFSTR("directMessagesSettingKey"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"), CFSTR("userConfiguredDirectMessagesSetting"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"), CFSTR("showsInLockScreen"));
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"), CFSTR("showsInNotificationCenter"));

}

- (BOOL)isAuthorizedTemporarily
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UNCSectionInfoSettings authorizationExpirationDate](self, "authorizationExpirationDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 > 0.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)allowsNotifications
{
  return -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus") == 2
      || -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus") == 3
      || -[UNCSectionInfoSettings isAuthorizedTemporarily](self, "isAuthorizedTemporarily");
}

- (void)setAllowsNotifications:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[UNCSectionInfoSettings setAuthorizationStatus:](self, "setAuthorizationStatus:", v3);
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (NSDate)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationExpirationDate, a3);
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, a3);
}

- (UNCMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void)setMuteAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_muteAssertion, a3);
}

- (int64_t)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->_notificationCenterSetting = a3;
}

- (int64_t)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->_lockScreenSetting = a3;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  self->_showsOnExternalDevices = a3;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->_showsCustomSettingsLink = a3;
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (unint64_t)pushSettings
{
  return self->_pushSettings;
}

- (void)setPushSettings:(unint64_t)a3
{
  self->_pushSettings = a3;
}

- (int64_t)carPlaySetting
{
  return self->_carPlaySetting;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  self->_carPlaySetting = a3;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->_remoteNotificationsSetting = a3;
}

- (int64_t)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  self->_criticalAlertSetting = a3;
}

- (int64_t)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  self->_timeSensitiveSetting = a3;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->_scheduledDeliverySetting = a3;
}

- (int64_t)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  self->_directMessagesSetting = a3;
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  return self->_userConfiguredDirectMessagesSetting;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  self->_userConfiguredDirectMessagesSetting = a3;
}

- (int64_t)bulletinGroupingSetting
{
  return self->_bulletinGroupingSetting;
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  self->_bulletinGroupingSetting = a3;
}

- (int64_t)announceSetting
{
  return self->_announceSetting;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  self->_announceSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, 0);
  objc_storeStrong((id *)&self->_authorizationExpirationDate, 0);
}

- (BOOL)showsMessagePreview
{
  return -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting") != 3;
}

- (BOOL)showsInNotificationCenter
{
  return -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting") == 2;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[UNCSectionInfoSettings setNotificationCenterSetting:](self, "setNotificationCenterSetting:", v3);
}

- (BOOL)showsInLockScreen
{
  return -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting") == 2;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 1;
  -[UNCSectionInfoSettings setLockScreenSetting:](self, "setLockScreenSetting:", v3);
}

- (int64_t)spokenNotificationSetting
{
  int64_t v2;

  v2 = -[UNCSectionInfoSettings announceSetting](self, "announceSetting");
  if ((unint64_t)(v2 - 1) > 2)
    return 0;
  else
    return qword_249B09FA0[v2 - 1];
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  uint64_t v4;

  if (a3 == 2)
  {
    if (-[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting") == 2)
      v4 = 2;
    else
      v4 = 3;
  }
  else
  {
    v4 = a3 == 1;
  }
  -[UNCSectionInfoSettings setAnnounceSetting:](self, "setAnnounceSetting:", v4);
}

- (void)muteThreadIdentifier:(uint64_t)a3 untilDate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2499A5000, a1, a3, "UNCSectionInfoSettings: Must provide valid thread identifier in order to mute a thread", a5, a6, a7, a8, 0);
}

- (void)muteThreadIdentifier:(uint64_t)a3 untilDate:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "UNCSectionInfoSettings: Cannot mute thread because section is already muted. Thread ID:%@", a5, a6, a7, a8, 2u);
}

- (void)unmuteThreadIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_2499A5000, a1, a3, "UNCSectionInfoSettings: Must provide valid thread identifier in order to unmute a thread", a5, a6, a7, a8, 0);
}

- (void)unmuteThreadIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "UNCSectionInfoSettings: Cannot unmute thread because section is already muted. Thread ID:%@", a5, a6, a7, a8, 2u);
}

@end
