@implementation STNotificationSettingsGateway

- (STNotificationSettingsGateway)initWithBundleIdentifiers:(id)a3
{
  id v4;
  STNotificationSettingsGateway *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDictionary *sectionInfoByBundleIdentifier;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[STNotificationSettingsGateway init](self, "init");
  -[BBSettingsGateway sectionInfoForSectionIDs:](v5->_notificationSettingsGateway, "sectionInfoForSectionIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v13, "suppressFromSettings", (_QWORD)v18) & 1) == 0)
        {
          objc_msgSend(v13, "sectionID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(v7, "copy");
  sectionInfoByBundleIdentifier = v5->_sectionInfoByBundleIdentifier;
  v5->_sectionInfoByBundleIdentifier = (NSDictionary *)v15;

  return v5;
}

- (STNotificationSettingsGateway)init
{
  STNotificationSettingsGateway *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *notificationSettingsGatewayQueue;
  uint64_t v5;
  BBSettingsGateway *notificationSettingsGateway;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STNotificationSettingsGateway;
  v2 = -[STNotificationSettingsGateway init](&v8, sel_init);
  v3 = dispatch_queue_create("com.apple.ScreenTimeUICore.notification-settings-gateway", 0);
  notificationSettingsGatewayQueue = v2->_notificationSettingsGatewayQueue;
  v2->_notificationSettingsGatewayQueue = (OS_dispatch_queue *)v3;

  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", v2->_notificationSettingsGatewayQueue);
  notificationSettingsGateway = v2->_notificationSettingsGateway;
  v2->_notificationSettingsGateway = (BBSettingsGateway *)v5;

  return v2;
}

- (BOOL)hasNotificationSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  -[STNotificationSettingsGateway sectionInfoByBundleIdentifier](self, "sectionInfoByBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;

  }
  else
  {
    -[STNotificationSettingsGateway notificationSettingsGateway](self, "notificationSettingsGateway");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionInfoForSectionID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      LOBYTE(v9) = 0;
      goto LABEL_5;
    }
  }
  v9 = objc_msgSend(v7, "suppressFromSettings") ^ 1;

LABEL_5:
  return v9;
}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[STNotificationSettingsGateway sectionInfoByBundleIdentifier](self, "sectionInfoByBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;

  }
  else
  {
    -[STNotificationSettingsGateway notificationSettingsGateway](self, "notificationSettingsGateway");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionInfoForSectionID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  if (objc_msgSend(v7, "suppressFromSettings"))
    v9 = 0;
  else
    v9 = v7;
LABEL_7:
  v10 = v9;

  return v10;
}

- (BBSettingsGateway)notificationSettingsGateway
{
  return (BBSettingsGateway *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)notificationSettingsGatewayQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)sectionInfoByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationSettingsGatewayQueue, 0);
  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);
}

@end
