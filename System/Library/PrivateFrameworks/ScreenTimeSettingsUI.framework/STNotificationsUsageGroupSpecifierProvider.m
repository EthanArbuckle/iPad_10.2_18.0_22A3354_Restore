@implementation STNotificationsUsageGroupSpecifierProvider

- (STNotificationsUsageGroupSpecifierProvider)init
{
  STNotificationsUsageGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *notificationSectionByBundleID;
  dispatch_queue_t v10;
  OS_dispatch_queue *notificationSettingsGatewayQueue;
  uint64_t v12;
  BBSettingsGateway *notificationSettingsGateway;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  v2 = -[STShowMoreUsageGroupSpecifierProvider init](&v16, sel_init);
  v3 = (void *)MEMORY[0x24BE75590];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NotificationsGroupName"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("Notifications Summary"), v2, 0, sel__usageDetailsCoordinator_, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  -[STShowMoreUsageGroupSpecifierProvider setSummarySpecifier:](v2, "setSummarySpecifier:", v7);
  v8 = objc_opt_new();
  notificationSectionByBundleID = v2->_notificationSectionByBundleID;
  v2->_notificationSectionByBundleID = (NSMutableDictionary *)v8;

  v10 = dispatch_queue_create("com.apple.screentime.notification-settings-gateway", 0);
  notificationSettingsGatewayQueue = v2->_notificationSettingsGatewayQueue;
  v2->_notificationSettingsGatewayQueue = (OS_dispatch_queue *)v10;

  v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", v2->_notificationSettingsGatewayQueue);
  notificationSettingsGateway = v2->_notificationSettingsGateway;
  v2->_notificationSettingsGateway = (BBSettingsGateway *)v12;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", v2, sel__specifierIdentifierDidChange_, 0x24DB8F5D0, 0);

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextNotificationUsageGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextNotificationUsageGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), 5, "KVOContextNotificationUsageGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextNotificationUsageGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextNotificationUsageGroupSpecifierProvider")
  {
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasUsageData")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v12, "BOOLValue") ^ 1);
    }
    else
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))goto LABEL_14;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == v16)
      {

        v15 = 0;
      }
      -[STNotificationsUsageGroupSpecifierProvider _selectedUsageReportDidChangeFrom:to:](self, "_selectedUsageReportDidChangeFrom:to:", v12, v15);

    }
    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STNotificationsUsageGroupSpecifierProvider;
  -[STNotificationsUsageGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_14:

}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  STNotificationsUsageGroupSpecifierProvider *v43;
  id v44;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6 != v7 && (objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    v45 = v6;
    v8 = objc_msgSend(v6, "type");
    v9 = v8 == objc_msgSend(v7, "type");
    -[STShowMoreUsageGroupSpecifierProvider summarySpecifier](self, "summarySpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v10, v9);

    -[STNotificationsUsageGroupSpecifierProvider notificationSectionByBundleID](self, "notificationSectionByBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "notificationsByTrustIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKeyPath:", CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();

    v42 = (void *)v14;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v14);
    v16 = (void *)MEMORY[0x24BDBCF20];
    -[STNotificationsUsageGroupSpecifierProvider notificationSectionByBundleID](self, "notificationSectionByBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minusSet:", v19);

    v46 = v15;
    if (objc_msgSend(v15, "count"))
    {
      -[STNotificationsUsageGroupSpecifierProvider notificationSettingsGateway](self, "notificationSettingsGateway");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sectionInfoForSectionIDs:", v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v22 = v21;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v52 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v27, "sectionID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, v28);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v24);
      }

    }
    v43 = self;
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "viewModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "installedBundleIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v7;
    objc_msgSend(v7, "notifications");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v32, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v34 = v32;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v39, "budgetItemIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v31, "containsObject:", v40);

          if (v41)
            objc_msgSend(v33, "addObject:", v39);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v36);
    }

    -[STShowMoreUsageGroupSpecifierProvider setUsageItems:](v43, "setUsageItems:", v33);
    v7 = v44;
    v6 = v45;
  }

}

- (id)newSpecifierWithUsageItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[STNotificationsUsageGroupSpecifierProvider notificationSectionByBundleID](self, "notificationSectionByBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "budgetItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v7, "suppressFromSettings"))
      v10 = -1;
    else
      v10 = 2;
  }
  else
  {
    v10 = -1;
  }
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel_getNotificationsInfo_, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PSBundlePathForPreferenceBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75B68]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", *MEMORY[0x24BE84910], *MEMORY[0x24BE759F8]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE758E8]);
  objc_msgSend(v11, "setControllerLoadAction:", sel_lazyLoadBundle_);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, 0x24DB92CB0);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE84920]);
  objc_msgSend(v11, "setUserInfo:", v4);
  objc_msgSend(v7, "sectionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v11, "setIdentifier:", v14);
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentifier:", v15);

  }
  return v11;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  objc_msgSend(v15, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(v6, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setName:", v8);

    objc_msgSend(v15, "setUserInfo:", v6);
    -[STNotificationsUsageGroupSpecifierProvider notificationSectionByBundleID](self, "notificationSectionByBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "budgetItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "sectionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v15, "setIdentifier:", v12);
    }
    else
    {
      objc_msgSend(v6, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setIdentifier:", v13);

    }
    if (v11)
      v14 = 2;
    else
      v14 = -1;
    objc_msgSend(v15, "setCellType:", v14);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE84920]);

  }
}

- (id)_usageDetailsCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getNotificationsInfo:(id)a3
{
  return (id)objc_msgSend(a3, "userInfo");
}

- (void)_specifierIdentifierDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8F5F0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STShowMoreUsageGroupSpecifierProvider summarySpecifier](self, "summarySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

}

- (NSMutableDictionary)notificationSectionByBundleID
{
  return self->_notificationSectionByBundleID;
}

- (BBSettingsGateway)notificationSettingsGateway
{
  return self->_notificationSettingsGateway;
}

- (OS_dispatch_queue)notificationSettingsGatewayQueue
{
  return self->_notificationSettingsGatewayQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsGatewayQueue, 0);
  objc_storeStrong((id *)&self->_notificationSettingsGateway, 0);
  objc_storeStrong((id *)&self->_notificationSectionByBundleID, 0);
}

@end
