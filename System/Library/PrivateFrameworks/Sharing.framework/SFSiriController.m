@implementation SFSiriController

+ (BOOL)isSiriEnabled
{
  void *v2;
  char v3;

  objc_msgSend((Class)getAFPreferencesClass[0](), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  return v3;
}

+ (BOOL)isHeySiriEnabled
{
  void *v2;
  void *v3;
  char v4;

  CFStringGetTypeID();

  objc_msgSend((Class)getVTPreferencesClass[0](), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((Class)getAFPreferencesClass[0](), "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  if (objc_msgSend(v3, "assistantIsEnabled"))
    v4 = objc_msgSend(v2, "voiceTriggerEnabled");

  return v4;
}

+ (BOOL)isSiriAllowedWhileLocked
{
  void *v2;
  char v3;

  objc_msgSend((Class)getAFPreferencesClass[0](), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableAssistantWhilePasscodeLocked") ^ 1;

  return v3;
}

+ (BOOL)isCurrentLocaleSupported
{
  void *v2;
  char v3;

  objc_msgSend((Class)getAFPreferencesClass[0](), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentLocaleNativelySupported");

  return v3;
}

+ (BOOL)hasUserSeenAnnounceMessagesOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted](SFDefaults, "siriNotificationsPrompted") == 3;
}

+ (void)setHasUserSeenAnnounceMessagesOptOutScreen:(BOOL)a3
{
  if (a3)
    +[SFDefaults setSiriNotificationsPrompted:](SFDefaults, "setSiriNotificationsPrompted:", 3);
}

+ (BOOL)hasUserSeenAnnounceCallsOptOutScreen
{
  return +[SFDefaults siriNotificationsPrompted](SFDefaults, "siriNotificationsPrompted") == 4;
}

+ (void)setHasUserSeenAnnounceCallsOptOutScreen:(BOOL)a3
{
  if (a3)
    +[SFDefaults setSiriNotificationsPrompted:](SFDefaults, "setSiriNotificationsPrompted:", 4);
}

+ (BOOL)isAnnounceMessagesEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend((Class)getUNNotificationSettingsCenterClass[0](), "currentNotificationSettingsCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "announcementSetting") == 2;

  return v4;
}

+ (void)setAnnounceMessagesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = a3;
  objc_msgSend((Class)getUNNotificationSettingsCenterClass[0](), "currentNotificationSettingsCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notificationSystemSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 2;
  else
    v6 = 1;
  if (objc_msgSend(v4, "announcementSetting") != v6)
  {
    v7 = objc_alloc_init((Class)getUNMutableNotificationSystemSettingsClass[0]());
    objc_msgSend(v7, "setAnnouncementSetting:", v6);
    objc_msgSend(v7, "setShowPreviewsSetting:", objc_msgSend(v5, "showPreviewsSetting"));
    objc_msgSend(v8, "setNotificationSystemSettings:", v7);

  }
}

+ (BOOL)isAnnounceMessagesSupported
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend((Class)getUNNotificationSettingsCenterClass[0](), "currentNotificationSettingsCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "announcementSetting") != 0;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)isAnnounceEnabledForHeadphones
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend((Class)getUNNotificationSettingsCenterClass[0](), "currentNotificationSettingsCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "announcementHeadphonesSetting");

  return v4 == 2;
}

+ (BOOL)isAnnounceSupported
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend((Class)getUNNotificationSettingsCenterClass[0](), "currentNotificationSettingsCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationSystemSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "announcementSetting") != 0;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)hasUserSeenAnnounceNotificationsOptOutScreen
{
  return +[SFDefaults hasSeenAnnounceNotifications](SFDefaults, "hasSeenAnnounceNotifications");
}

+ (void)setHasUserSeenAnnounceNotificationsOptOutScreen:(BOOL)a3
{
  +[SFDefaults setHasSeenAnnounceNotifications:](SFDefaults, "setHasSeenAnnounceNotifications:", a3);
}

+ (int64_t)announceCallsState
{
  id v2;
  unint64_t v3;

  v2 = objc_alloc_init((Class)getTUUserConfigurationClass[0]());
  v3 = objc_msgSend(v2, "announceCalls");
  if (v3 >= 4)
  {
    if (gLogCategory_SFSiriController <= 90
      && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = 0;
  }

  return v3;
}

+ (void)setAnnounceCallsState:(int64_t)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  id v7;

  v4 = objc_alloc_init((Class)getTUUserConfigurationClass[0]());
  v5 = a3;
  v7 = v4;
  if ((unint64_t)a3 >= 4)
  {
    if (gLogCategory_SFSiriController > 90)
    {
      v5 = 0;
    }
    else
    {
      if (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize())
      {
        v6 = a3;
        LogPrintF();
      }
      v5 = 0;
      v4 = v7;
    }
  }
  objc_msgSend(v4, "setAnnounceCalls:", v5, v6);
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

+ (BOOL)shouldPromptForAnnounceMessagesForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4;
  char v5;
  _BOOL4 v7;
  SFHeadphoneProduct *v9;
  _BOOL4 v10;
  char v11;
  int v12;

  v4 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v4
    || (v7 = a4,
        v9 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", *(_QWORD *)&a3), v10 = -[SFHeadphoneProduct hasW1Chip](v9, "hasW1Chip"), v9, v10))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (v7
    && ((objc_msgSend(a1, "hasUserSeenAnnounceMessagesOptOutScreen") & 1) != 0
     || objc_msgSend(a1, "hasUserSeenAnnounceCallsOptOutScreen")))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  v11 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  if (objc_msgSend(a1, "isAnnounceMessagesSupported"))
    v12 = objc_msgSend(a1, "isAnnounceMessagesEnabled") ^ 1;
  else
    LOBYTE(v12) = 0;
  if (v7)
    v5 = v11 & v12;
  else
    v5 = v12;
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

+ (BOOL)shouldPromptForAnnounceCallsForProductID:(unsigned int)a3 supportsInEarDetection:(BOOL)a4 isUpsellFlow:(BOOL)a5
{
  BOOL v5;
  BOOL v6;
  _BOOL4 v8;
  SFHeadphoneProduct *v11;
  _BOOL4 v12;
  char v13;
  uint64_t v14;
  BOOL v15;

  v5 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v5
    || (v8 = a5,
        v11 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", *(_QWORD *)&a3), v12 = -[SFHeadphoneProduct hasW1Chip](v11, "hasW1Chip"), v11, v12))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (!a4)
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  if (!SFIsAnnounceCallsEnabled())
    return 0;
  if (v8 && objc_msgSend(a1, "hasUserSeenAnnounceCallsOptOutScreen"))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  v13 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  v14 = objc_msgSend(a1, "announceCallsState");
  if (v14)
    v15 = 0;
  else
    v15 = v13;
  if (v8)
    v6 = v15;
  else
    v6 = v14 == 0;
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v6;
}

+ (BOOL)shouldPromptForAnnounceNotificationsForProductID:(unsigned int)a3 isUpsellFlow:(BOOL)a4
{
  BOOL v4;
  BOOL v5;
  _BOOL4 v7;
  SFHeadphoneProduct *v9;
  _BOOL4 v10;
  char v11;
  int v12;

  v4 = a3 - 8194 > 0xE || ((1 << (a3 - 2)) & 0x409B) == 0;
  if (!v4
    || (v7 = a4,
        v9 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", *(_QWORD *)&a3), v10 = -[SFHeadphoneProduct hasW1Chip](v9, "hasW1Chip"), v9, v10))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_7;
  }
  if (v7 && objc_msgSend(a1, "hasUserSeenAnnounceNotificationsOptOutScreen"))
  {
    if (gLogCategory_SFSiriController > 30
      || gLogCategory_SFSiriController == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
LABEL_7:
    LogPrintF();
    return 0;
  }
  v11 = objc_msgSend(a1, "isSiriAllowedWhileLocked");
  if (objc_msgSend(a1, "isAnnounceSupported"))
    v12 = objc_msgSend(a1, "isAnnounceEnabledForHeadphones") ^ 1;
  else
    LOBYTE(v12) = 0;
  if (v7)
    v5 = v11;
  else
    v5 = v12;
  if (gLogCategory_SFSiriController <= 30
    && (gLogCategory_SFSiriController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v5;
}

@end
