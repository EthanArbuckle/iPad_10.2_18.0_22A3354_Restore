@implementation ICQCloudStorageGroupController

- (ICQCloudStorageGroupController)init
{
  ICQCloudStorageGroupController *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICQCloudStorageGroupController;
  v2 = -[ICQCloudStorageGroupController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_quotaInfoChanged, CFSTR("QuotaInformationChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_updateManagedStorageState, CFSTR("PSProfileConnectionEffectiveSettingsChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_quotaInfoChanged, *MEMORY[0x24BEBE008], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)backupStateChanged, (CFStringRef)*MEMORY[0x24BE66C70], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addNetworkReachableObserver:selector:", v2, sel_reachabilityChanged_);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  ICQCloudStorageGroupController *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE66C70], 0);
  objc_msgSend(MEMORY[0x24BE04778], "sharedNetworkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNetworkReachableObserver:", self);

  -[ICQPreferencesRemoteUIDelegate delegate](self->_storageDelegate, "delegate");
  v6 = (ICQCloudStorageGroupController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_storageDelegate, "setDelegate:", 0);
  v7.receiver = self;
  v7.super_class = (Class)ICQCloudStorageGroupController;
  -[ICQCloudStorageGroupController dealloc](&v7, sel_dealloc);
}

- (void)addGroupToListController:(id)a3
{
  objc_storeWeak((id *)&self->_listController, a3);
}

- (void)groupRemovedFromListController
{
  ICQPreferencesRemoteUIDelegate *storageDelegate;

  -[ICQUICloudStorageOffersManager cancelLoad](self->_storageOffersManager, "cancelLoad");
  -[ICQPreferencesRemoteUIDelegate cancelRemoteUI](self->_storageDelegate, "cancelRemoteUI");
  storageDelegate = self->_storageDelegate;
  self->_storageDelegate = 0;

  -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner");
  objc_storeWeak((id *)&self->_listController, 0);
}

- (id)totalStorage:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;

  v4 = a3;
  if (self->_quotaCached)
  {
    -[ICQQuotaInfoResponse totalStorageText](self->_quotaInfo, "totalStorageText");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_quotaFailed)
  {
    v5 = &stru_24E400750;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24E400750, CFSTR("CloudGroup"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)availableStorage:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;

  v4 = a3;
  if (self->_quotaCached)
  {
    -[ICQQuotaInfoResponse availableStorageText](self->_quotaInfo, "availableStorageText");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (self->_quotaFailed)
  {
    v5 = &stru_24E400750;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24E400750, CFSTR("CloudGroup"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)reachabilityChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE046E0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    if (self->_quotaFailed)
      -[ICQCloudStorageGroupController getQuotaInfo](self, "getQuotaInfo");
  }
}

- (void)updateManagedStorageState
{
  void *v3;
  uint64_t v4;
  _BOOL4 buyMore;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  PSSpecifier *managedStorage;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  int v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray objectAtIndex:](self->_specifiers, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE75AA8];
  objc_msgSend(v3, "removePropertyForKey:", *MEMORY[0x24BE75AA8]);
  buyMore = self->_buyMore;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (buyMore)
    v8 = CFSTR("STORAGE");
  else
    v8 = CFSTR("CASTLE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24E400750, CFSTR("CloudGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v9);

  if (!self->_quotaCached)
  {
    if (!self->_quotaFailed)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("QUOTA_FAILED"), &stru_24E400750, CFSTR("CloudGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v12, v4);
    goto LABEL_15;
  }
  -[ICQQuotaInfoResponse accountStatus](self->_quotaInfo, "accountStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("account_status_header"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setName:", v12);
    }
    objc_msgSend(v11, "objectForKey:", CFSTR("account_status_text"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setProperty:forKey:", v13, v4);
    }

LABEL_15:
  }

LABEL_17:
  v34 = v3;
  if (self->_quotaCached)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63770]) == 2)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE048E0], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "primaryAccount");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "needsToVerifyTerms") ^ 1;

    }
  }
  else
  {
    v15 = 0;
  }
  managedStorage = self->_managedStorage;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE75A18];
  -[PSSpecifier setProperty:forKey:](managedStorage, "setProperty:forKey:", v19, *MEMORY[0x24BE75A18]);

  v21 = *MEMORY[0x24BE75D18];
  -[PSSpecifier propertyForKey:](self->_managedStorage, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v15;
  objc_msgSend(v22, "setCellEnabled:", v15);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[NSMutableArray subarrayWithRange:](self->_specifiers, "subarrayWithRange:", 1, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !self->_quotaFailed);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setProperty:forKey:", v29, v20);

        objc_msgSend(v28, "propertyForKey:", v21);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setCellEnabled:", !self->_quotaFailed);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v25);
  }

  if (v33 && self->_delayedEnterManageStorage)
  {
    -[ICQCloudStorageGroupController enterManagedStorage:](self, "enterManagedStorage:", self->_managedStorage);
    self->_delayedEnterManageStorage = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    -[NSMutableArray objectAtIndex:](self->_specifiers, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v32, 1);

  }
}

- (void)getQuotaInfo
{
  void *v3;
  _QWORD v4[5];

  if (!self->_quotaCached && !self->_quotaFetchInProgress)
  {
    self->_quotaFetchInProgress = 1;
    +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke;
    v4[3] = &unk_24E3F41E0;
    v4[4] = self;
    objc_msgSend(v3, "getQuotaInfoDetailed:handler:", 0, v4);

  }
}

void __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  NSObject *v11;
  int v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;

  v6 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = 0;
  if (!v6
    || (objc_msgSend(v6, "error"), v8 = objc_claimAutoreleasedReturnValue(), v9 = v7 | v8, (id)v8, v9))
  {
    _ICQGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke_cold_1((void *)v7, v6, v11);

    v10 = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a2);
    v10 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = v10;
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hasPurchasedMoreStorage");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "setBool:forKey:", 1, CFSTR("hasPurchasedMoreStorage"));
  else
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("hasPurchasedMoreStorage"));

  objc_msgSend(*(id *)(a1 + 32), "updateManagedStorageState");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "specifierForID:", CFSTR("BUY_MORE_STORAGE"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "hasPurchasedMoreStorage"))
    v18 = CFSTR("CHANGE_STORAGE_PLAN");
  else
    v18 = CFSTR("BUY_MORE_STORAGE");
  objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24E400750, CFSTR("CloudGroup"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", v19);

  if ((v21 & 1) == 0)
  {
    objc_msgSend(v16, "setName:", v19);
    v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v22, "reloadSpecifier:", v16);

  }
}

- (void)quotaInfoChanged
{
  -[ICQCloudStorageGroupController clearQuotaCache](self, "clearQuotaCache");
  -[ICQCloudStorageGroupController getQuotaInfo](self, "getQuotaInfo");
}

- (void)clearQuotaCache
{
  ICQQuotaInfoResponse *quotaInfo;
  id v3;

  self->_quotaFailed = 0;
  *(_WORD *)&self->_quotaFetchInProgress = 0;
  quotaInfo = self->_quotaInfo;
  self->_quotaInfo = 0;

  +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCachedQuotaInfo");

}

- (BOOL)hasPurchasedMoreStorage
{
  ICQQuotaInfoResponse *quotaInfo;
  void *v4;
  char v5;

  quotaInfo = self->_quotaInfo;
  if (quotaInfo)
    return -[ICQQuotaInfoResponse hasPurchasedMoreStorage](quotaInfo, "hasPurchasedMoreStorage");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("hasPurchasedMoreStorage"));

  return v5;
}

- (id)specifiersWithBuyMore:(BOOL)a3
{
  _BOOL4 v3;
  NSMutableArray *specifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  _BOOL4 buyMore;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PSSpecifier *v27;
  PSSpecifier *managedStorage;
  NSMutableArray *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;

  v3 = a3;
  -[ICQCloudStorageGroupController clearQuotaCache](self, "clearQuotaCache");
  specifiers = self->_specifiers;
  if (!specifiers || self->_buyMore != v3 && (self->_specifiers = 0, specifiers, !self->_specifiers))
  {
    self->_buyMore = v3;
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
    v7 = self->_specifiers;
    self->_specifiers = v6;

    v8 = (void *)MEMORY[0x24BE75590];
    buyMore = self->_buyMore;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (buyMore)
      v12 = CFSTR("STORAGE");
    else
      v12 = CFSTR("CASTLE");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24E400750, CFSTR("CloudGroup"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray addObject:](self->_specifiers, "addObject:", v14);
    v15 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TOTAL"), &stru_24E400750, CFSTR("CloudGroup"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, self, 0, sel_totalStorage_, 0, 4, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v18, "setProperty:forKey:", CFSTR("TOTAL_STORAGE"), *MEMORY[0x24BE75AC0]);
    -[NSMutableArray addObject:](self->_specifiers, "addObject:", v18);
    v20 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("AVAILABLE"), &stru_24E400750, CFSTR("CloudGroup"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, sel_availableStorage_, 0, 4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setProperty:forKey:", CFSTR("AVAILABLE_STORAGE"), v19);
    -[NSMutableArray addObject:](self->_specifiers, "addObject:", v23);
    v24 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MANAGE"), &stru_24E400750, CFSTR("CloudGroup"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v26, self, 0, 0, 0, 1, 0);
    v27 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    managedStorage = self->_managedStorage;
    self->_managedStorage = v27;

    -[PSSpecifier setIdentifier:](self->_managedStorage, "setIdentifier:", CFSTR("MANAGE_STORAGE"));
    -[PSSpecifier setControllerLoadAction:](self->_managedStorage, "setControllerLoadAction:", sel_enterManagedStorage_);
    -[NSMutableArray addObject:](self->_specifiers, "addObject:", self->_managedStorage);
    -[ICQCloudStorageGroupController updateManagedStorageState](self, "updateManagedStorageState");
    if (self->_buyMore)
    {
      v29 = self->_specifiers;
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v29, "addObject:", v30);

      v31 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ICQCloudStorageGroupController hasPurchasedMoreStorage](self, "hasPurchasedMoreStorage"))
        v33 = CFSTR("CHANGE_STORAGE_PLAN");
      else
        v33 = CFSTR("BUY_MORE_STORAGE");
      objc_msgSend(v32, "localizedStringForKey:value:table:", v33, &stru_24E400750, CFSTR("CloudGroup"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v34, self, 0, 0, objc_opt_class(), 13, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "setProperty:forKey:", CFSTR("BUY_MORE_STORAGE"), v19);
      objc_msgSend(v35, "setButtonAction:", sel_enterBuyStorage);
      -[NSMutableArray addObject:](self->_specifiers, "addObject:", v35);

    }
  }
  -[ICQCloudStorageGroupController getQuotaInfo](self, "getQuotaInfo");
  return self->_specifiers;
}

- (void)cancelLoaders
{
  ICQPreferencesRemoteUIDelegate *storageDelegate;

  if (self->_loadingCommerce || self->_loadingStorage)
  {
    self->_loadingCommerce = 0;
    -[ICQUICloudStorageOffersManager cancelLoad](self->_storageOffersManager, "cancelLoad");
    self->_loadingStorage = 0;
    -[ICQPreferencesRemoteUIDelegate cleanupLoader](self->_storageDelegate, "cleanupLoader");
    storageDelegate = self->_storageDelegate;
    self->_storageDelegate = 0;

    -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner");
  }
}

- (void)enterManageStorageWhenPossible
{
  self->_delayedEnterManageStorage = 1;
  -[ICQCloudStorageGroupController updateManagedStorageState](self, "updateManagedStorageState");
  -[ICQCloudStorageGroupController getQuotaInfo](self, "getQuotaInfo");
}

- (void)enterManagedStorage:(id)a3
{
  id v4;
  ICQPreferencesRemoteUIDelegate *storageDelegate;
  ICQPreferencesRemoteUIDelegate *v6;
  id WeakRetained;
  void *v8;
  ICQPreferencesRemoteUIDelegate *v9;
  ICQPreferencesRemoteUIDelegate *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  ICQCloudStorageGroupController *v19;
  id v20;

  v4 = a3;
  if (self->_quotaCached && !self->_loadingStorage)
  {
    -[ICQCloudStorageGroupController cancelLoaders](self, "cancelLoaders");
    self->_loadingStorage = 1;
    storageDelegate = self->_storageDelegate;
    if (!storageDelegate)
    {
      v6 = [ICQPreferencesRemoteUIDelegate alloc];
      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      objc_msgSend(WeakRetained, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:](v6, "initWithNavigationController:", v8);
      v10 = self->_storageDelegate;
      self->_storageDelegate = v9;

      storageDelegate = self->_storageDelegate;
    }
    -[ICQPreferencesRemoteUIDelegate setDelegate:](storageDelegate, "setDelegate:", self);
    -[ICQQuotaInfoResponse manageStorageURLString](self->_quotaInfo, "manageStorageURLString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAddingPercentEscapesUsingEncoding:", 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(-2, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke;
    v18 = &unk_24E3F34D8;
    v19 = self;
    v20 = v12;
    v14 = v12;
    dispatch_async(v13, &v15);

    -[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:](self, "startSpinnerInCellForSpecifier:", v4, v15, v16, v17, v18, v19);
  }

}

void __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[5];
  id v6;
  id v7;

  +[ICQCloudStorageInfo backupInfoHeaders](ICQCloudStorageInfo, "backupInfoHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke_2;
  block[3] = &unk_24E3F4098;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__ICQCloudStorageGroupController_enterManagedStorage___block_invoke_2(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1[4] + 48);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadURL:postBody:additionalHeaders:", v3, 0, a1[6]);

}

- (void)enterBuyStorageWhenPossible
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ICQCloudStorageGroupController_enterBuyStorageWhenPossible__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

uint64_t __61__ICQCloudStorageGroupController_enterBuyStorageWhenPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enterBuyStorage");
}

- (void)enterBuyStorage
{
  ICQUICloudStorageOffersManager *v3;
  ICQUICloudStorageOffersManager *storageOffersManager;
  PSListController **p_listController;
  id WeakRetained;
  void *v7;
  ICQUICloudStorageOffersManager *v8;
  void *v9;
  id v10;

  if (!self->_loadingCommerce)
  {
    -[ICQCloudStorageGroupController cancelLoaders](self, "cancelLoaders");
    self->_loadingCommerce = 1;
    if (!self->_storageOffersManager)
    {
      v3 = objc_alloc_init(ICQUICloudStorageOffersManager);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v3;

      -[ICQUICloudStorageOffersManager setDelegate:](self->_storageOffersManager, "setDelegate:", self);
    }
    p_listController = &self->_listController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "specifierForID:", CFSTR("BUY_MORE_STORAGE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:](self, "startSpinnerInCellForSpecifier:", v7);

    v8 = self->_storageOffersManager;
    v10 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v10, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUICloudStorageOffersManager beginFlowWithNavigationController:modally:](v8, "beginFlowWithNavigationController:modally:", v9, 1);

  }
}

- (void)startSpinnerInCellForSpecifier:(id)a3
{
  id v4;
  PSTableCell *v5;
  PSTableCell *remoteLoadingCell;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_remoteLoadingCell)
    -[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:].cold.1();
  v8 = v4;
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v5 = (PSTableCell *)objc_claimAutoreleasedReturnValue();
  remoteLoadingCell = self->_remoteLoadingCell;
  self->_remoteLoadingCell = v5;

  if (self->_remoteLoadingCell)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    -[PSTableCell setAccessoryView:](self->_remoteLoadingCell, "setAccessoryView:", v7);

  }
}

- (void)stopSpinner
{
  PSTableCell *remoteLoadingCell;
  PSTableCell *v4;

  remoteLoadingCell = self->_remoteLoadingCell;
  if (remoteLoadingCell)
  {
    -[PSTableCell setAccessoryView:](remoteLoadingCell, "setAccessoryView:", 0);
    v4 = self->_remoteLoadingCell;
    self->_remoteLoadingCell = 0;

  }
}

- (void)manager:(id)a3 willPresentViewController:(id)a4
{
  if (self->_loadingCommerce)
  {
    self->_loadingCommerce = 0;
    -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner", a3, a4);
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  if (self->_loadingCommerce)
  {
    self->_loadingCommerce = 0;
    -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner", a3, a4);
  }
}

- (void)loadFinished:(id)a3
{
  if (self->_storageDelegate == a3)
  {
    self->_loadingStorage = 0;
    -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner");
  }
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  if (self->_storageDelegate == a3)
  {
    self->_loadingStorage = 0;
    -[ICQCloudStorageGroupController stopSpinner](self, "stopSpinner");
  }
}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x24BDB4398];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "aa_primaryAppleAccount");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[ICQCloudStorageGroupController remoteUIDelegate:didCreatePage:forAccount:inObjectModel:](self, "remoteUIDelegate:didCreatePage:forAccount:inObjectModel:", v11, v10, v13, v9);
}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 forAccount:(id)a5 inObjectModel:(id)a6
{
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  ICQCloudStorageGraphTableViewRow *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v9 = a5;
  objc_msgSend(a6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("iCloudManageStorage"));

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE7EE18]);
    objc_msgSend(v18, "tableViewOM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithAttributes:parent:", 0, v13);

    v15 = -[ICQCloudStorageGraphTableViewRow initWithAccount:]([ICQCloudStorageGraphTableViewRow alloc], "initWithAccount:", v9);
    -[RUITableViewRow setAttributes:](v15, "setAttributes:", &unk_24E436420);
    -[RUITableViewRow setDelegate:](v15, "setDelegate:", self);
    objc_msgSend(v14, "addRow:", v15);
    objc_msgSend(v18, "tableViewOM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sections");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v14, 0);

  }
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return NSClassFromString(CFSTR("AAUIiCloudStorageGraphTableCell"));
}

- (id)sourceURLForRUITableViewRow
{
  return 0;
}

- (id)textFieldRow:(id)a3 changeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  return 0;
}

+ (id)backupInfoHeaders
{
  return +[ICQCloudStorageInfo backupInfoHeaders](ICQCloudStorageInfo, "backupInfoHeaders");
}

+ (id)backupInfoHeadersForAccount:(id)a3
{
  return +[ICQCloudStorageInfo backupInfoHeadersForAccount:](ICQCloudStorageInfo, "backupInfoHeadersForAccount:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
  objc_storeStrong((id *)&self->_remoteLoadingCell, 0);
  objc_storeStrong((id *)&self->_storageDelegate, 0);
  objc_storeStrong((id *)&self->_quotaInfo, 0);
  objc_storeStrong((id *)&self->_managedStorage, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_listController);
}

void __46__ICQCloudStorageGroupController_getQuotaInfo__block_invoke_cold_1(void *a1, void *a2, os_log_t log)
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (!a1)
  {
    objc_msgSend(a2, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "Error getting quota data: %@", (uint8_t *)&v6, 0xCu);
  if (!a1)

}

- (void)startSpinnerInCellForSpecifier:.cold.1()
{
  __assert_rtn("-[ICQCloudStorageGroupController startSpinnerInCellForSpecifier:]", "ICQCloudStorageGroupController.m", 359, "!_remoteLoadingCell");
}

@end
