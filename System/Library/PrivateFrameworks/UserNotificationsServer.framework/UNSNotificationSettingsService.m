@implementation UNSNotificationSettingsService

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[UNSSettingsGateway effectiveSectionInfoForSectionID:](self->_settingsGateway, "effectiveSectionInfoForSectionID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "subsections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "subsectionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "uns_notificationSettings");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v14, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[UNSSettingsGateway effectiveSectionInfoForSectionID:](self->_settingsGateway, "effectiveSectionInfoForSectionID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uns_notificationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDF8868], "emptySettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)settingsGateway:(id)a3 didUpdateSectionInfoForSectionIDs:(id)a4
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "settingsService:didUpdateNotificationSourcesForBundleIdentifiers:", self, v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (UNSNotificationSettingsService)initWithSettingsGateway:(id)a3
{
  id v5;
  UNSNotificationSettingsService *v6;
  NSMutableArray *v7;
  NSMutableArray *observers;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  UNSCriticalAlertAuthorizationAlertController *v12;
  UNSCriticalAlertAuthorizationAlertController *criticalAlertAuthorizationAlertController;
  UNSNotificationAuthorizationAlertController *v14;
  UNSNotificationAuthorizationAlertController *notificationAuthorizationAlertController;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UNSNotificationSettingsService;
  v6 = -[UNSNotificationSettingsService init](&v17, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    observers = v6->_observers;
    v6->_observers = v7;

    objc_storeStrong((id *)&v6->_settingsGateway, a3);
    -[UNSSettingsGateway addObserver:](v6->_settingsGateway, "addObserver:", v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.usernotificationsserver.SettingsService", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v12 = -[UNSAuthorizationAlertController initWithQueue:]([UNSCriticalAlertAuthorizationAlertController alloc], "initWithQueue:", v6->_queue);
    criticalAlertAuthorizationAlertController = v6->_criticalAlertAuthorizationAlertController;
    v6->_criticalAlertAuthorizationAlertController = v12;

    v14 = -[UNSAuthorizationAlertController initWithQueue:]([UNSNotificationAuthorizationAlertController alloc], "initWithQueue:", v6->_queue);
    notificationAuthorizationAlertController = v6->_notificationAuthorizationAlertController;
    v6->_notificationAuthorizationAlertController = v14;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UNSSettingsGateway removeObserver:](self->_settingsGateway, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)UNSNotificationSettingsService;
  -[UNSNotificationSettingsService dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__UNSNotificationSettingsService_addObserver___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __46__UNSNotificationSettingsService_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UNSNotificationSettingsService_removeObserver___block_invoke;
  block[3] = &unk_24D639C20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __49__UNSNotificationSettingsService_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(_QWORD *)(a1 + 40));
}

- (id)notificationSourceForBundleIdentifier:(id)a3
{
  id v4;
  NSObject **v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (NSObject **)MEMORY[0x24BDF89F8];
  v6 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification Source For BundleIdentifier", (uint8_t *)&v11, 0xCu);
  }
  -[UNSSettingsGateway effectiveSectionInfoForSectionID:](self->_settingsGateway, "effectiveSectionInfoForSectionID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uns_notificationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning Notification Source For BundleIdentifier %{public}@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (id)notificationSourcesForBundleIdentifiers:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89F8];
  v6 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_216DCB000, v6, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification Sources For BundleIdentifiers", buf, 0xCu);
  }
  -[UNSSettingsGateway effectiveSectionInfoForSectionIDs:](self->_settingsGateway, "effectiveSectionInfoForSectionIDs:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "uns_notificationSource", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v11);
  }

  v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning Notification Sources For BundleIdentifiers %{public}@", buf, 0x16u);
  }

  return v8;
}

- (id)allNotificationSources
{
  os_log_t *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BDF89F8];
  v4 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v27 = (id)objc_opt_class();
    v6 = v27;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting All Notification Sources", buf, 0xCu);

  }
  v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[UNSSettingsGateway allEffectiveSectionInfo](self->_settingsGateway, "allEffectiveSectionInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v15), "uns_notificationSource", (_QWORD)v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v13);
  }

  v17 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    v19 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v27 = v19;
    v28 = 2114;
    v29 = v10;
    v20 = v19;
    _os_log_impl(&dword_216DCB000, v18, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning All Notification Sources %{public}@", buf, 0x16u);

  }
  return v10;
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
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
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = (os_log_t *)MEMORY[0x24BDF89F8];
  v11 = *MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v37 = 138543362;
    v38 = v8;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Authorizing Notification Settings", (uint8_t *)&v37, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BEBF420], "sourceDescriptionWithBundleIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:].cold.1((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_17;
  }
  if ((objc_msgSend(v12, "useDefaultDataProvider") & 1) == 0)
  {
    v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:].cold.3((uint64_t)v8, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_17;
  }
  if ((a3 & 0x10) != 0 && (objc_msgSend(v13, "allowCriticalAlerts") & 1) == 0)
  {
    v30 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:].cold.2((uint64_t)v8, v30, v31, v32, v33, v34, v35, v36);
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v14);
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BE0FE80], "defaultSectionInfoForType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "allowTimeSensitive"))
    v15 = 2;
  else
    v15 = 0;
  objc_msgSend(v14, "setTimeSensitiveSetting:", v15);
  objc_msgSend(v14, "setSectionID:", v8);
  objc_msgSend(v14, "uns_setPropertiesFromAuthorizationOptions:supportsProvisionalAlerts:", a3, objc_msgSend(v13, "supportsProvisionalAlerts"));
  -[UNSSettingsGateway setSectionInfo:forSectionID:](self->_settingsGateway, "setSectionInfo:forSectionID:", v14, v8);
  v9[2](v9, 1, 0);
LABEL_18:

}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)v13 = 138543362;
    *(_QWORD *)&v13[4] = objc_opt_class();
    v10 = *(id *)&v13[4];
    _os_log_impl(&dword_216DCB000, v9, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Replacing Notification Settings", v13, 0xCu);

  }
  -[UNSSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v7, *(_OWORD *)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSNotificationSettingsService notificationSystemSettings](self, "notificationSystemSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uns_setPropertiesFromNotificationSettings:systemSettings:", v6, v12);

  -[UNSSettingsGateway setSectionInfo:forSectionID:](self->_settingsGateway, "setSectionInfo:forSectionID:", v11, v7);
}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 138543362;
    v33 = (id)objc_opt_class();
    v12 = v33;
    _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Replacing Notification Topic Settings", buf, 0xCu);

  }
  -[UNSSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v8);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "subsections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v25 = v8;
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v19, "subsectionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v9);

        if (v21)
        {
          v22 = v19;

          v16 = v22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  -[UNSNotificationSettingsService notificationSystemSettings](self, "notificationSystemSettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uns_setPropertiesFromNotificationSettings:systemSettings:", v26, v23);

  -[UNSSettingsGateway setSectionInfo:forSectionID:](self->_settingsGateway, "setSectionInfo:forSectionID:", v16, v25);
}

- (id)notificationSystemSettings
{
  os_log_t *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BDF89F8];
  v4 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v6 = v21;
    _os_log_impl(&dword_216DCB000, v5, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification System Settings", buf, 0xCu);

  }
  v7 = UNShowPreviewsSettingFromBBContentPreviewSetting(-[UNSSettingsGateway globalContentPreviewSetting](self->_settingsGateway, "globalContentPreviewSetting"));
  v8 = UNNotificationSettingFromBBAnnounceSetting(-[UNSSettingsGateway globalAnnounceSetting](self->_settingsGateway, "globalAnnounceSetting"));
  v9 = UNNotificationSettingFromBBAnnounceSetting(-[UNSSettingsGateway globalAnnounceHeadphonesSetting](self->_settingsGateway, "globalAnnounceHeadphonesSetting"));
  v10 = UNNotificationAnnouncementCarPlaySettingFromBBAnnounceCarPlaySetting(-[UNSSettingsGateway globalAnnounceCarPlaySetting](self->_settingsGateway, "globalAnnounceCarPlaySetting"));
  v11 = UNNotificationSettingFromBBScheduledDeliverySetting(-[UNSSettingsGateway globalScheduledDeliverySetting](self->_settingsGateway, "globalScheduledDeliverySetting"));
  -[UNSSettingsGateway globalScheduledDeliveryTimes](self->_settingsGateway, "globalScheduledDeliveryTimes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = UNNotificationSettingFromBBSystemSetting(-[UNSSettingsGateway globalScheduledDeliveryShowNextSummarySetting](self->_settingsGateway, "globalScheduledDeliveryShowNextSummarySetting"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF9E0]), "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:", v7, v8, v9, v10, v11, v12, v13, UNNotificationListDisplayStyleSettingFromBBNotificationListDisplayStyleSetting(-[UNSSettingsGateway globalNotificationListDisplayStyleSetting](self->_settingsGateway, "globalNotificationListDisplayStyleSetting")));
  v15 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v21 = v17;
    v22 = 2114;
    v23 = v14;
    v18 = v17;
    _os_log_impl(&dword_216DCB000, v16, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning System Settings %{public}@", buf, 0x16u);

  }
  return v14;
}

- (void)setNotificationSystemSettings:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  os_log_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  os_log_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  os_log_t v26;
  NSObject *v27;
  void *v28;
  id v29;
  os_log_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  os_log_t v35;
  NSObject *v36;
  void *v37;
  id v38;
  os_log_t v39;
  NSObject *v40;
  void *v41;
  id v42;
  int v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BDF89F8];
  v6 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    v43 = 138543618;
    v44 = v8;
    v45 = 2048;
    v46 = objc_msgSend(v4, "modifiedSettings");
    _os_log_impl(&dword_216DCB000, v7, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Settings with modifiedSettings = %lu", (uint8_t *)&v43, 0x16u);

  }
  if ((objc_msgSend(v4, "modifiedSettings") & 1) != 0)
  {
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v12;
      v13 = v12;
      _os_log_impl(&dword_216DCB000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Content Preview", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalContentPreviewSetting:](self->_settingsGateway, "setGlobalContentPreviewSetting:", BBContentPreviewSettingFromUNShowPreviewsSetting(objc_msgSend(v4, "showPreviewsSetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 2) != 0)
  {
    v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      v16 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v16;
      v17 = v16;
      _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalAnnounceSetting:](self->_settingsGateway, "setGlobalAnnounceSetting:", BBAnnounceSettingFromUNNotificationSetting(objc_msgSend(v4, "announcementSetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 4) != 0)
  {
    v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v20;
      v21 = v20;
      _os_log_impl(&dword_216DCB000, v19, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement in Headphones", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalAnnounceHeadphonesSetting:](self->_settingsGateway, "setGlobalAnnounceHeadphonesSetting:", BBAnnounceSettingFromUNNotificationSetting(objc_msgSend(v4, "announcementHeadphonesSetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 8) != 0)
  {
    v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      v24 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v24;
      v25 = v24;
      _os_log_impl(&dword_216DCB000, v23, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement in CarPlay", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalAnnounceCarPlaySetting:](self->_settingsGateway, "setGlobalAnnounceCarPlaySetting:", BBAnnounceCarPlaySettingFromUNNotificationAnnouncementCarPlaySetting(objc_msgSend(v4, "announcementCarPlaySetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 0x10) != 0)
  {
    v26 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v28;
      v29 = v28;
      _os_log_impl(&dword_216DCB000, v27, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalScheduledDeliverySetting:](self->_settingsGateway, "setGlobalScheduledDeliverySetting:", BBScheduledDeliverySettingFromUNNotificationSetting(objc_msgSend(v4, "scheduledDeliverySetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 0x20) != 0)
  {
    v30 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v32;
      v33 = v32;
      _os_log_impl(&dword_216DCB000, v31, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery Times", (uint8_t *)&v43, 0xCu);

    }
    objc_msgSend(v4, "scheduledDeliveryTimes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSSettingsGateway setGlobalScheduledDeliveryTimes:](self->_settingsGateway, "setGlobalScheduledDeliveryTimes:", v34);

  }
  if ((objc_msgSend(v4, "modifiedSettings") & 0x40) != 0)
  {
    v35 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      v37 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v37;
      v38 = v37;
      _os_log_impl(&dword_216DCB000, v36, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery Show Next Summary", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalScheduledDeliveryShowNextSummarySetting:](self->_settingsGateway, "setGlobalScheduledDeliveryShowNextSummarySetting:", BBSystemSettingFromUNNotificationSetting(objc_msgSend(v4, "scheduledDeliveryShowNextSummarySetting")));
  }
  if ((objc_msgSend(v4, "modifiedSettings") & 0x80) != 0)
  {
    v39 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v40 = v39;
      v41 = (void *)objc_opt_class();
      v43 = 138543362;
      v44 = v41;
      v42 = v41;
      _os_log_impl(&dword_216DCB000, v40, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Notification List Display Style", (uint8_t *)&v43, 0xCu);

    }
    -[UNSSettingsGateway setGlobalNotificationListDisplayStyleSetting:](self->_settingsGateway, "setGlobalNotificationListDisplayStyleSetting:", BBNotificationListDisplayStyleSettingFromUNNotificationListDisplayStyleSetting(objc_msgSend(v4, "notificationListDisplayStyleSetting")));
  }

}

- (void)resetScheduledDeliverySetting
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDF89F8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_216DCB000, v4, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Resetting Scheduled Delivery Setting", v6, 0xCu);

  }
  -[UNSSettingsGateway setGlobalScheduledDeliverySetting:](self->_settingsGateway, "setGlobalScheduledDeliverySetting:", 0, *(_OWORD *)v6);
  -[UNSSettingsGateway setGlobalScheduledDeliveryTimes:](self->_settingsGateway, "setGlobalScheduledDeliveryTimes:", MEMORY[0x24BDBD1A8]);
}

- (void)_queue_addObserver:(id)a3
{
  -[NSMutableArray addObject:](self->_observers, "addObject:", a3);
}

- (void)_queue_removeObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_observers, "removeObject:", a3);
}

- (void)settingsGateway:(id)a3 didUpdateGlobalSettings:(id)a4
{
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = UNShowPreviewsSettingFromBBContentPreviewSetting(objc_msgSend(v5, "globalContentPreviewSetting"));
  v7 = UNNotificationSettingFromBBAnnounceSetting(objc_msgSend(v5, "globalAnnounceSetting"));
  v8 = UNNotificationSettingFromBBAnnounceSetting(objc_msgSend(v5, "globalAnnounceHeadphonesSetting"));
  v9 = UNNotificationAnnouncementCarPlaySettingFromBBAnnounceCarPlaySetting(objc_msgSend(v5, "globalAnnounceCarPlaySetting"));
  v10 = UNNotificationSettingFromBBScheduledDeliverySetting(objc_msgSend(v5, "globalScheduledDeliverySetting"));
  objc_msgSend(v5, "globalScheduledDeliveryTimes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = UNNotificationSettingFromBBSystemSetting(objc_msgSend(v5, "globalScheduledDeliveryShowNextSummarySetting"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBF9E0]), "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:", v6, v7, v8, v9, v10, v11, v12, UNNotificationListDisplayStyleSettingFromBBNotificationListDisplayStyleSetting(objc_msgSend(v5, "globalNotificationListDisplayStyleSetting")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_observers;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "settingsService:didUpdateNotificationSystemSettings:", self, v13);
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_criticalAlertAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a2, a3, "[%{public}@] Notification source not found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a2, a3, "[%{public}@] Notification source is not permitted to use critical alerts", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_216DCB000, a2, a3, "[%{public}@] Notification source not configured for UserNotifications", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
