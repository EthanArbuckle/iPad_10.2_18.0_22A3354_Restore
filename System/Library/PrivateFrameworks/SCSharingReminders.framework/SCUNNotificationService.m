@implementation SCUNNotificationService

- (SCUNNotificationService)initWithDelegate:(id)a3
{
  id v4;
  SCUNNotificationService *v5;
  uint64_t v6;
  UNUserNotificationCenter *userNotificationCenter;
  UNUserNotificationCenter *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCUNNotificationService;
  v5 = -[SCUNNotificationService init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.safetycheckd.notifications"));
    userNotificationCenter = v5->_userNotificationCenter;
    v5->_userNotificationCenter = (UNUserNotificationCenter *)v6;

    -[UNUserNotificationCenter setDelegate:](v5->_userNotificationCenter, "setDelegate:", v4);
    v8 = v5->_userNotificationCenter;
    -[SCUNNotificationService notificationCategories](v5, "notificationCategories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNUserNotificationCenter setNotificationCategories:](v8, "setNotificationCategories:", v9);

    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v5->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
  }

  return v5;
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", a3, a4);
}

- (void)removeNotifications
{
  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_userNotificationCenter, "removeAllDeliveredNotifications");
  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_userNotificationCenter, "removeAllPendingNotificationRequests");
}

- (id)notificationCategories
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDBD1A8];
  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("scsharingreminders.general"), MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

  objc_msgSend(MEMORY[0x24BDF8838], "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("scsharingreminders.wifisync"), v3, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

  return v2;
}

- (id)toUNNotificationRequest:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x24BDF8800];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  SCUILocStringForKey(CFSTR("TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCUNNotificationService contentBodyForWifiSyncReminder:](self, "contentBodyForWifiSyncReminder:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBody:", v9);

  objc_msgSend(v6, "setCategoryIdentifier:", CFSTR("scsharingreminders.wifisync"));
  -[SCUNNotificationService actionURLWithSuffix:](self, "actionURLWithSuffix:", CFSTR("reminders/wifisync"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultActionURL:", v10);

  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.safetycheckd.scsharingreminders"), v6, 0, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)actionURLWithSuffix:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/"), CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/SAFETY_CHECK"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)contentBodyForWifiSyncReminder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(v3, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Windows PC"));

    if (!v7)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      SCUILocStringForKey(CFSTR("BODY"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v8 = CFSTR("BODY_WINDOWS_PC");
  }
  else
  {
    v8 = CFSTR("BODY_FALLBACK");
  }
  SCUILocStringForKey(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v9;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_userNotificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
}

@end
