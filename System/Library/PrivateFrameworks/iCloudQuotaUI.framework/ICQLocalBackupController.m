@implementation ICQLocalBackupController

+ (id)specifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BACKUPS_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specifierForAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ICQUISpecifierKeyAccount"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("CURRENT_DEVICE_BACKUP"), *MEMORY[0x24BE75AC0]);
  return v5;
}

- (ICQLocalBackupController)init
{
  ICQLocalBackupController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PSSpecifier *showAllSpecifier;
  PSSpecifier *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PSSpecifier *nextBackupSizeSpecifier;
  NSMutableArray *v17;
  NSMutableArray *visibleAppSpecifiers;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ICQLocalBackupController;
  v2 = -[ICQLocalBackupController init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_reloadQuotaInfo, CFSTR("QuotaInformationChanged"), 0);

    v4 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_APPS"), &stru_24E400750, CFSTR("BackupInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v2, 0, 0, 0, 13, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    showAllSpecifier = v2->_showAllSpecifier;
    v2->_showAllSpecifier = (PSSpecifier *)v7;

    v9 = v2->_showAllSpecifier;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75860]);

    v11 = *MEMORY[0x24BE75AC0];
    -[PSSpecifier setProperty:forKey:](v2->_showAllSpecifier, "setProperty:forKey:", CFSTR("SHOW_ALL_APPS"), *MEMORY[0x24BE75AC0]);
    -[PSSpecifier setButtonAction:](v2->_showAllSpecifier, "setButtonAction:", sel_showAllApps_);
    v12 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NEXT_BACKUP_SIZE"), &stru_24E400750, CFSTR("BackupInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v2, 0, sel_nextBackupSizeStringWithSpecifier_, 0, 4, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    nextBackupSizeSpecifier = v2->_nextBackupSizeSpecifier;
    v2->_nextBackupSizeSpecifier = (PSSpecifier *)v15;

    -[PSSpecifier setProperty:forKey:](v2->_nextBackupSizeSpecifier, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    -[PSSpecifier setProperty:forKey:](v2->_nextBackupSizeSpecifier, "setProperty:forKey:", CFSTR("NEXT_BACKUP_SIZE"), v11);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    visibleAppSpecifiers = v2->_visibleAppSpecifiers;
    v2->_visibleAppSpecifiers = v17;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel_didEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  }
  return v2;
}

- (void)setSpecifier:(id)a3
{
  id v5;
  void *v6;
  ACAccount *v7;
  ACAccount *account;
  id v9;
  ACAccount *v10;
  MBManager *v11;
  NSObject *v12;
  MBManager *backupManager;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v5 = a3;
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), a3);
  -[ICQLocalBackupController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ICQUISpecifierKeyAccount"));
  v7 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;
  self->_account = v7;

  if (self->_account)
  {
    v9 = objc_alloc(MEMORY[0x24BE66C40]);
    v10 = self->_account;
    v21 = 0;
    v11 = (MBManager *)objc_msgSend(v9, "initWithAccount:delegate:eventQueue:error:", v10, self, 0, &v21);
    v12 = v21;
    backupManager = self->_backupManager;
    self->_backupManager = v11;

    if (v12)
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ICQLocalBackupController setSpecifier:].cold.2((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

    }
  }
  else
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICQLocalBackupController setSpecifier:].cold.1(v12);
  }

}

- (void)dealloc
{
  void *v3;
  ICQLocalBackupController *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MBManager setDelegate:](self->_backupManager, "setDelegate:", 0);
  -[ICQPreferencesRemoteUIDelegate delegate](self->_remoteDelegate, "delegate");
  v4 = (ICQLocalBackupController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_remoteDelegate, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController dealloc](&v5, sel_dealloc);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (self->_scanInProgress
    && self->_shouldCancelScanOnExit
    && -[ICQLocalBackupController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    self->_shouldCancelScanOnExit = 0;
    -[MBManager cancel](self->_backupManager, "cancel");
  }
  v5.receiver = self;
  v5.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  ICQPreferencesRemoteUIDelegate *remoteDelegate;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (self->_manageStorageReloadNeeded)
  {
    remoteDelegate = self->_remoteDelegate;
    +[ICQCloudStorageInfo backupInfoHeaders](ICQCloudStorageInfo, "backupInfoHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPreferencesRemoteUIDelegate reloadTopControllerWithAdditionalHeaders:](remoteDelegate, "reloadTopControllerWithAdditionalHeaders:", v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
}

- (void)didEnterBackground:(id)a3
{
  self->_manageStorageReloadNeeded = 0;
}

+ (id)deviceImageURLFromAttributes:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  if (v6 <= 1.0
    || (objc_msgSend(CFSTR("largeImage"), "stringByAppendingString:", CFSTR("2x")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "objectForKey:", v7),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("largeImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)loadPropertyValuesFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setDeviceName:](self, "setDeviceName:", v5);

  objc_msgSend(v4, "objectForKey:", CFSTR("deviceUdid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setDeviceIdentifier:](self, "setDeviceIdentifier:", v6);

  objc_msgSend((id)objc_opt_class(), "deviceImageURLFromAttributes:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setDeviceImageURL:](self, "setDeviceImageURL:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("backupSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setBackupSize:](self, "setBackupSize:", objc_msgSend(v8, "longLongValue"));

  objc_msgSend(v4, "objectForKey:", CFSTR("bytesRequiredForBackup"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v10, "longLongValue"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQLocalBackupController setAdditionalSpaceRequiredString:](self, "setAdditionalSpaceRequiredString:", v9);

  }
  else
  {
    -[ICQLocalBackupController setAdditionalSpaceRequiredString:](self, "setAdditionalSpaceRequiredString:", 0);
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ICQDeviceIdentificationView *v7;
  NSString *deviceName;
  void *v9;
  void *v10;
  ICQDeviceIdentificationView *v11;
  ICQDeviceIdentificationView *deviceIdentificationView;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController loadView](&v15, sel_loadView);
  -[ICQLocalBackupController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController loadPropertyValuesFromDictionary:](self, "loadPropertyValuesFromDictionary:", v4);

  -[ICQLocalBackupController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("remoteDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setRemoteDelegate:](self, "setRemoteDelegate:", v6);

  -[ICQLocalBackupController loadQuotaInfo](self, "loadQuotaInfo");
  v7 = [ICQDeviceIdentificationView alloc];
  deviceName = self->_deviceName;
  -[ICQLocalBackupController deviceIdentifier](self, "deviceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController deviceImageURL](self, "deviceImageURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICQDeviceIdentificationView initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:](v7, "initWithFrame:deviceName:deviceIdentifier:imageURL:isCurrentDevice:", deviceName, v9, v10, 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  deviceIdentificationView = self->_deviceIdentificationView;
  self->_deviceIdentificationView = v11;

  -[ICQDeviceIdentificationView setLeftExtraMargin:](self->_deviceIdentificationView, "setLeftExtraMargin:", 16.0);
  -[ICQDeviceIdentificationView sizeToFit](self->_deviceIdentificationView, "sizeToFit");
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "setTableHeaderView:", self->_deviceIdentificationView);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("BACKUPS_PAGE_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController setTitle:](self, "setTitle:", v14);

}

- (id)appSpecifierForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
    goto LABEL_4;
  -[ICQLocalBackupController specifiers](self, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (void)turnOffAppBackupCancelled:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "control");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setOn:animated:", 1, 1);
}

- (void)turnOffAppBackupConfirmed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("MBDomainInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke;
  block[3] = &unk_24E3F4098;
  block[4] = self;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(v7, block);

}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  char v17;
  id v18;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1376);
  v18 = 0;
  v4 = objc_msgSend(v3, "removeDomainName:error:", v2, &v18);
  v5 = v18;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setBackupEnabled:forDomainName:", 0, *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1472);
    *(_QWORD *)(v6 + 1472) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "domainInfoForName:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2;
  block[3] = &unk_24E3F36C0;
  v17 = v4;
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = v8;
  v9 = v8;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  id v31;
  _QWORD v32[5];
  id v33;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 56), "propertyForKey:", CFSTR("MBDomainInfo"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "remoteSize");

    objc_msgSend(*(id *)(a1 + 56), "setProperty:forKey:", *(_QWORD *)(a1 + 64), CFSTR("MBDomainInfo"));
    +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteQuotaInfoChanged");

    objc_msgSend(*(id *)(a1 + 48), "setBackupSize:", objc_msgSend(*(id *)(a1 + 48), "backupSize") - v3);
    objc_msgSend(*(id *)(a1 + 48), "reloadSpecifierID:", CFSTR("BACKUP_SIZE"));
    objc_msgSend(*(id *)(a1 + 48), "setScanInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 48), "specifierForID:", CFSTR("BACKED_UP_APPS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v31 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "hideSpinner");
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);

    objc_msgSend(*(id *)(a1 + 48), "reloadSpecifier:animated:", *(_QWORD *)(a1 + 56), 1);
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANNOT_TURN_OFF_BACKUP_DETAILS"), &stru_24E400750, CFSTR("BackupInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANNOT_TURN_OFF_BACKUP"), &stru_24E400750, CFSTR("BackupInfo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v20, v17, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E400750, CFSTR("BackupInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_109;
    v32[3] = &unk_24E3F3638;
    v25 = *(void **)(a1 + 56);
    v32[4] = *(_QWORD *)(a1 + 48);
    v33 = v25;
    objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v26);

    v27 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E400750, CFSTR("BackupInfo"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAction:", v30);

    objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v21, 1, 0);
  }
}

uint64_t __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_109(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "turnOffAppBackupConfirmed:", *(_QWORD *)(a1 + 40));
}

- (void)setBackupDomainEnabled:(id)a3 forSpecifier:(id)a4
{
  void *v6;
  MBManager *backupManager;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(v10, "propertyForKey:", CFSTR("MBDomainInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setEnabled:", 1);
    backupManager = self->_backupManager;
    objc_msgSend(v6, "domainName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBManager setBackupEnabled:forDomainName:](backupManager, "setBackupEnabled:forDomainName:", 1, v8);

    -[ICQLocalBackupController updateNextBackupSize](self, "updateNextBackupSize");
    v9 = v6;
  }
  else
  {
    -[ICQLocalBackupController showConfirmationViewForSpecifier:](self, "showConfirmationViewForSpecifier:", v10);
    v9 = v10;
  }

}

- (id)backupDomainEnabledForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("MBDomainInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  if (objc_msgSend(v3, "isEnabled"))
    v5 = objc_msgSend(v3, "isRestricted") ^ 1;
  else
    v5 = 0;
  objc_msgSend(v4, "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)showAllApps:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_showAllPressed = 1;
  if (!self->_appSpecifiers)
    -[ICQLocalBackupController showAllApps:].cold.1();
  v5 = v4;
  -[ICQLocalBackupController animateAppSpecifierChanges](self, "animateAppSpecifierChanges");

}

+ (BOOL)isiCloudPhotosEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/mobile/Media/PhotoData/CPL/initialsync_marker"));

  return v3;
}

- (BOOL)isDomainWhitelisted:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = isDomainWhitelisted__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isDomainWhitelisted__onceToken, &__block_literal_global_7);
  v5 = (void *)isDomainWhitelisted__whitelist;
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __48__ICQLocalBackupController_isDomainWhitelisted___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE758C8];
  v3[0] = *MEMORY[0x24BE758D0];
  v3[1] = v0;
  v3[2] = *MEMORY[0x24BE758B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)isDomainWhitelisted__whitelist;
  isDomainWhitelisted__whitelist = v1;

}

- (void)assignDisableBackupsConfirmationToSpecifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v20 = (void *)MEMORY[0x24BDBCE70];
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("BackupInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE75970];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_24E400750, CFSTR("BackupInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BE75980];
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_APP_PROMPT_TEXT"), &stru_24E400750, CFSTR("BackupInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE75988];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_24E400750, CFSTR("BackupInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v17, v16, v5, v15, v10, v11, v13, *MEMORY[0x24BE75990], 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setupWithDictionary:", v21);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v14, *MEMORY[0x24BE75978]);

}

- (id)loadAppSpecifiersWithDomainInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char *v14;
  char *v15;
  BOOL v16;
  int v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  ICQLocalBackupController *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  float v37;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  ICQLocalBackupController *v47;
  uint64_t v48;
  uint64_t v49;
  id obj;
  _QWORD v51[4];
  id v52;
  ICQLocalBackupController *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v55;
    v46 = *MEMORY[0x24BE75948];
    v44 = *MEMORY[0x24BE75B70];
    v45 = *MEMORY[0x24BE75AC0];
    v42 = *MEMORY[0x24BE75D28];
    v43 = *MEMORY[0x24BE75B88];
    v39 = *MEMORY[0x24BE75A18];
    v47 = self;
    v48 = *(_QWORD *)v55;
    do
    {
      v8 = 0;
      v49 = v6;
      do
      {
        if (*(_QWORD *)v55 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x2207C89EC]();
        objc_msgSend(getPSGBackupUtilsClass(), "displayNameForDomainInfo:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getPSGBackupUtilsClass(), "bundleIdForDomainInfo:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(getPSGBackupUtilsClass(), "shouldIgnoreBundleId:", v12) & 1) == 0)
        {
          _ICQGetLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v11;
            v60 = 2112;
            v61 = v12;
            _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Attempting to show domain: %@:%@", buf, 0x16u);
          }

          -[ICQLocalBackupController appSpecifierForBundleID:](self, "appSpecifierForBundleID:", v12);
          v14 = (char *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v14 && !v11)
          {
            objc_msgSend(v14, "name");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (v11)
            v16 = 1;
          else
            v16 = v12 == 0;
          v17 = v16;
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24E400750, CFSTR("BackupInfo"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "addObject:", v12);
          }
          if (v11)
          {
            if (v15)
            {
              objc_msgSend(v15, "setName:", v11);
              v19 = v15;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, sel_setBackupDomainEnabled_forSpecifier_, sel_backupDomainEnabledForSpecifier_, 0, 6, 0);
              v19 = (char *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), v46);
            objc_msgSend(v19, "setProperty:forKey:", v9, CFSTR("MBDomainInfo"));
            objc_msgSend(v19, "setProperty:forKey:", v12, v45);
            objc_msgSend(v19, "setProperty:forKey:", v12, v44);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setProperty:forKey:", v20, v43);

            if (objc_msgSend(v9, "isRestricted"))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setProperty:forKey:", v21, v39);

              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("BACKUP_NOT_SUPPORTED"), &stru_24E400750, CFSTR("BackupInfo"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setProperty:forKey:", v23, v42);

              v7 = v48;
            }
            else
            {
              v24 = objc_msgSend(v9, "size");
              if (v24)
              {
                objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v24, 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_24E400750, CFSTR("BackupInfo"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend(v19, "setProperty:forKey:", v22, v42);
              if (v15)
                v26 = 1;
              else
                v26 = v17;
              if (v26 == 1)
              {
                v27 = v47;
                -[ICQLocalBackupController assignDisableBackupsConfirmationToSpecifier:](v47, "assignDisableBackupsConfirmationToSpecifier:", v19);
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setProperty:forKey:", v28, v39);

                v27 = v47;
              }
              v7 = v48;
              objc_storeWeak((id *)&v19[*MEMORY[0x24BE75768]], v27);
              objc_msgSend(v19, "setConfirmationAction:", sel_turnOffAppBackupConfirmed_);
              objc_msgSend(v19, "setConfirmationCancelAction:", sel_turnOffAppBackupCancelled_);
            }

            v6 = v49;
            if (objc_msgSend(v9, "isCameraRollDomain"))
            {
              self = v47;
              if ((objc_msgSend((id)objc_opt_class(), "isiCloudPhotosEnabled") & 1) == 0)
                objc_msgSend(v40, "insertObject:atIndex:", v19, 0);
            }
            else
            {
              objc_msgSend(v40, "addObject:", v19);
              self = v47;
            }
          }
          else
          {
            v19 = v15;
            v7 = v48;
            v6 = v49;
          }

        }
        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v6);
  }

  v29 = v41;
  if (ceilf((float)(unint64_t)objc_msgSend(v41, "count") / 10.0) > 0.0)
  {
    v30 = 0;
    v31 = 1;
    v32 = MEMORY[0x24BDAC760];
    do
    {
      v33 = objc_msgSend(v29, "count");
      if (v33 - (unint64_t)(v30 & 0xFFFFFFFE) >= 0xA)
        v34 = 10;
      else
        v34 = v33 - (v30 & 0xFFFFFFFE);
      objc_msgSend(v29, "subarrayWithRange:", v30 & 0xFFFFFFFE, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v32;
      v51[1] = 3221225472;
      v51[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke;
      v51[3] = &unk_24E3F40E0;
      v52 = v40;
      v53 = self;
      objc_msgSend(v36, "getAppDetailsForBundleIDs:handler:", v35, v51);

      v29 = v41;
      v37 = (float)v31;
      v30 += 10;
      ++v31;
    }
    while (ceilf((float)(unint64_t)objc_msgSend(v41, "count") / 10.0) > v37);
  }

  return v40;
}

void __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id obj;
  _QWORD block[5];
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "apps");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    v16 = *MEMORY[0x24BE75A18];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v7, "bundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "specifierForID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setName:", v11);

        objc_msgSend(v10, "propertyForKey:", CFSTR("MBDomainInfo"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isRestricted") & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "assignDisableBackupsConfirmationToSpecifier:", v10);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProperty:forKey:", v13, v16);

        }
        dispatch_get_global_queue(0, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_2;
        block[3] = &unk_24E3F4098;
        block[4] = v7;
        v19 = v10;
        v20 = *(_QWORD *)(a1 + 40);
        v15 = v10;
        dispatch_async(v14, block);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v4);
  }

}

void __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD block[4];
  int8x16_t v11;

  v2 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(*(id *)(a1 + 32), "thumbnailURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", v7, *MEMORY[0x24BE75AC8]);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_3;
  block[3] = &unk_24E3F34D8;
  v9 = *(int8x16_t *)(a1 + 40);
  v8 = (id)v9.i64[0];
  v11 = vextq_s8(v9, v9, 8uLL);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__ICQLocalBackupController_loadAppSpecifiersWithDomainInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 inSection:(int64_t)a7 withRowOffset:(int64_t)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  id obj;
  void *v54;
  uint64_t v55;
  int64_t v56;
  void *v57;
  void *v58;
  _QWORD aBlock[4];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v44 = v12;
  objc_msgSend(v12, "beginUpdates");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v14, "copy");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v13;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  v16 = 0x24BDD1000uLL;
  if (!v15)
  {
    v37 = 0;
    goto LABEL_23;
  }
  v17 = v15;
  v56 = a7;
  v18 = 0;
  v19 = *(_QWORD *)v62;
  v49 = *MEMORY[0x24BE75AC0];
  v50 = *(_QWORD *)v62;
  v51 = a6;
  do
  {
    v20 = 0;
    v21 = v18;
    v55 = a8 + v18;
    v52 = v17;
    v47 = v18;
    do
    {
      v22 = v20;
      if (*(_QWORD *)v62 != v19)
        objc_enumerationMutation(obj);
      v23 = v21 + v20;
      v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v22);
      if (v23 >= objc_msgSend(v14, "count"))
      {
        objc_msgSend(*(id *)(v16 + 1496), "indexPathForRow:inSection:", v55 + v22, v56);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "addObject:", v28);

        objc_msgSend(v14, "addObject:", v24);
        goto LABEL_17;
      }
      objc_msgSend(v14, "objectAtIndex:", v21 + v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "propertyForKey:", v49);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "propertyForKey:", v49);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "isEqualToString:", v26) & 1) == 0)
      {
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__ICQLocalBackupController__updateTable_toMatchArray_withVisibleArray_maxVisible_inSection_withRowOffset___block_invoke;
        aBlock[3] = &unk_24E3F4108;
        v60 = v27;
        v29 = _Block_copy(aBlock);
        v30 = objc_msgSend(v58, "indexOfObjectPassingTest:", v29);
        v31 = *(void **)(v16 + 1496);
        v32 = v16;
        v48 = v29;
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v31, "indexPathForRow:inSection:", v55 + v22, v56);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v33);

          v16 = v32;
          v21 = v47;
          goto LABEL_14;
        }
        objc_msgSend(v31, "indexPathForRow:inSection:", v30 + a8, v56);
        v45 = v25;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v16 + 1496), "indexPathForRow:inSection:", v55 + v22, v56);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "moveRowAtIndexPath:toIndexPath:", v34, v35);

        v25 = v45;
        v36 = objc_msgSend(v14, "indexOfObjectPassingTest:", v29);
        v16 = v32;
        v21 = v47;
        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v14, "removeObjectAtIndex:", v36);
LABEL_14:
          objc_msgSend(v14, "insertObject:atIndex:", v24, v23);
        }

        goto LABEL_16;
      }
      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v21 + v22, v24);
LABEL_16:

      v19 = v50;
      a6 = v51;
      v17 = v52;
LABEL_17:
      v37 = v21 + v22 + 1;
      if (v37 >= a6)
        goto LABEL_21;
      v20 = v22 + 1;
    }
    while (v17 != v22 + 1);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    v18 = v21 + v20;
  }
  while (v17);
  v37 = v21 + v22 + 1;
LABEL_21:
  a7 = v56;
LABEL_23:

  if (objc_msgSend(v14, "count") <= v37)
  {
    v39 = 0;
    v38 = 0;
  }
  else
  {
    v38 = objc_msgSend(v14, "count") - v37;
    v39 = v37;
  }
  for (; v37 < objc_msgSend(v14, "count"); ++v37)
  {
    objc_msgSend(v14, "objectAtIndex:", v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v58, "indexOfObject:", v40);
    if (v41 == 0x7FFFFFFFFFFFFFFFLL)
      -[ICQLocalBackupController _updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:].cold.1();
    objc_msgSend(*(id *)(v16 + 1496), "indexPathForRow:inSection:", v41 + a8, a7);
    v42 = v16;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addObject:", v43);

    v16 = v42;
  }
  objc_msgSend(v14, "removeObjectsInRange:", v39, v38);
  objc_msgSend(v44, "insertRowsAtIndexPaths:withRowAnimation:", v54, 0);
  objc_msgSend(v44, "deleteRowsAtIndexPaths:withRowAnimation:", v57, 0);
  objc_msgSend(v44, "endUpdates");

}

uint64_t __106__ICQLocalBackupController__updateTable_toMatchArray_withVisibleArray_maxVisible_inSection_withRowOffset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "propertyForKey:", *MEMORY[0x24BE75AC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)animateAppSpecifierChanges
{
  __assert_rtn("-[ICQLocalBackupController animateAppSpecifierChanges]", "ICQLocalBackupController.m", 534, "[groupSpecifiers count]");
}

- (BOOL)beginScan
{
  id v2;
  BOOL v3;
  MBManager *backupManager;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;

  if (self->_scanInProgress)
  {
    v2 = 0;
    v3 = 1;
  }
  else
  {
    backupManager = self->_backupManager;
    v17 = 0;
    v6 = -[MBManager startScanWithError:](backupManager, "startScanWithError:", &v17);
    v2 = v17;
    if (!v6)
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICQLocalBackupController beginScan].cold.1((uint64_t)v2, v7, v8, v9, v10, v11, v12, v13);

      objc_msgSend(v2, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("MBErrorDomain")))
      {
        v15 = objc_msgSend(v2, "code");

        if (v15 == 3)
        {
          v3 = 1;
          -[ICQLocalBackupController setScanInProgress:](self, "setScanInProgress:", 1);
          goto LABEL_12;
        }
      }
      else
      {

      }
      v3 = 0;
      goto LABEL_12;
    }
    v3 = 1;
    -[ICQLocalBackupController setScanInProgress:](self, "setScanInProgress:", 1);
    self->_shouldCancelScanOnExit = 1;
  }
LABEL_12:

  return v3;
}

- (void)updateAppSpecifiersScanWhenComplete:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke;
  v6[3] = &unk_24E3F37A0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[5];
  id v5;
  char v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "domainInfoList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke_2;
  block[3] = &unk_24E3F35C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = *(_BYTE *)(a1 + 40);
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__ICQLocalBackupController_updateAppSpecifiersScanWhenComplete___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "loadAppSpecifiersWithDomainInfo:", *(_QWORD *)(a1 + 40));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count") || !*(_BYTE *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1384), obj);
    objc_msgSend(*(id *)(a1 + 32), "animateAppSpecifierChanges");
    objc_msgSend(*(id *)(a1 + 32), "specifierForID:", CFSTR("BACKED_UP_APPS"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "beginScan"))
        objc_msgSend(v3, "showSpinner");
    }
    else
    {
      objc_msgSend(v3, "hideSpinner");
    }
    objc_msgSend(*(id *)(a1 + 32), "updateNextBackupSize");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "beginScan");
  }

}

- (void)insertDeleteBackupButtonIfNeeded
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (self->_deviceBackup)
  {
    -[ICQLocalBackupController specifierForID:](self, "specifierForID:", CFSTR("DELETE_BACKUP"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DELETE_BACKUP_BUTTON_GROUP"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled");
      v6 = CFSTR("DELETE_BACKUP_AND_TURN_OFF_BACKUP");
      if (!v5)
        v6 = CFSTR("DELETE_BACKUP");
      v7 = (void *)MEMORY[0x24BE75590];
      v8 = (void *)MEMORY[0x24BDD1488];
      v9 = v6;
      objc_msgSend(v8, "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_24E400750, CFSTR("BackupInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "deleteButtonSpecifierWithName:target:action:", v11, self, sel_firstDeleteConfirmation_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_BACKUP_FOOTER"), &stru_24E400750, CFSTR("BackupInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A68]);

      objc_msgSend(v15, "addObject:", v4);
      objc_msgSend(v15, "addObject:", v12);
      -[ICQLocalBackupController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v15, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"), 1);

    }
  }
}

- (void)firstDeleteConfirmation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DELETE_BACKUP_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("TURN_OFF_ALL_AND_DELETE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24E400750, CFSTR("BackupInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("TURN_OFF_AND_DELETE");
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE_BACKUP_PROMPT"), &stru_24E400750, CFSTR("BackupInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, self->_deviceName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("DELETE_BACKUP");
  }
  objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24E400750, CFSTR("BackupInfo"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x24BDD1488];
  v17 = v15;
  v18 = v8;
  v19 = v5;
  objc_msgSend(v16, "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("BackupInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "sheetAlertControllerWithTitle:message:", v19, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __52__ICQLocalBackupController_firstDeleteConfirmation___block_invoke;
  v25[3] = &unk_24E3F4130;
  v25[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v17, 2, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_175);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addAction:", v23);
  objc_msgSend(v22, "addAction:", v24);
  -[ICQLocalBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

}

uint64_t __52__ICQLocalBackupController_firstDeleteConfirmation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secondDeleteConfirmation");
}

- (void)secondDeleteConfirmation
{
  void *v3;
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
  _QWORD v14[5];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SECOND_DELETE_BACKUP_TITLE"), &stru_24E400750, CFSTR("BackupInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SECOND_DELETE_BACKUP_PROMPT"), &stru_24E400750, CFSTR("BackupInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SECOND_DELETE_BACKUP_ACTION"), &stru_24E400750, CFSTR("BackupInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("BackupInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "sheetAlertControllerWithTitle:message:", v4, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__ICQLocalBackupController_secondDeleteConfirmation__block_invoke;
  v14[3] = &unk_24E3F4130;
  v14[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v8, 2, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v10, 1, &__block_literal_global_182);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v12);
  objc_msgSend(v11, "addAction:", v13);
  -[ICQLocalBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

uint64_t __52__ICQLocalBackupController_secondDeleteConfirmation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackupConfirmed");
}

- (void)managerDidFinishScan:(id)a3
{
  if (self->_scanInProgress)
  {
    -[ICQLocalBackupController setScanInProgress:](self, "setScanInProgress:", 0);
    -[ICQLocalBackupController updateAppSpecifiersScanWhenComplete:](self, "updateAppSpecifiersScanWhenComplete:", 0);
  }
}

- (void)manager:(id)a3 didFailScanWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQLocalBackupController manager:didFailScanWithError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  if (self->_scanInProgress && objc_msgSend(v5, "code") != 202)
  {
    -[ICQLocalBackupController setScanInProgress:](self, "setScanInProgress:", 0);
    -[ICQLocalBackupController specifierForID:](self, "specifierForID:", CFSTR("BACKED_UP_APPS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyForKey:", *MEMORY[0x24BE75AB0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "hideSpinner");
  }

}

+ (id)currentDeviceBackupWithMBManager:(id)a3 filtering:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v6 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "backupDeviceUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(v7, "getBackupListWithFiltering:error:", v6, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v12 = v11;
  if (v10)
  {
    v30 = v11;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v18, "backupUUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v9);

          if ((v20 & 1) != 0)
          {
            v21 = v18;

            goto LABEL_12;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        if (v15)
          continue;
        break;
      }
    }

    v21 = 0;
LABEL_12:
    v12 = v30;
  }
  else
  {
    _ICQGetLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[ICQLocalBackupController currentDeviceBackupWithMBManager:filtering:error:].cold.1((uint64_t)v12, v22, v23, v24, v25, v26, v27, v28);

    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }

  return v21;
}

- (id)currentDeviceBackup
{
  MBBackup *v3;
  MBBackup *deviceBackup;
  MBBackup *v5;
  MBBackup *v6;
  void *v7;
  NSDate *v8;
  NSDate *dateOfLastBackup;
  MBBackup *v10;

  v3 = self->_deviceBackup;
  objc_sync_enter(v3);
  deviceBackup = self->_deviceBackup;
  if (!deviceBackup)
  {
    objc_msgSend((id)objc_opt_class(), "currentDeviceBackupWithMBManager:filtering:error:", self->_backupManager, 0, 0);
    v5 = (MBBackup *)objc_claimAutoreleasedReturnValue();
    v6 = self->_deviceBackup;
    self->_deviceBackup = v5;

    -[MBManager dateOfLastBackup](self->_backupManager, "dateOfLastBackup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSDate *)objc_msgSend(v7, "copy");
    dateOfLastBackup = self->_dateOfLastBackup;
    self->_dateOfLastBackup = v8;

    self->_doneLoadingDeviceBackup = 1;
    deviceBackup = self->_deviceBackup;
  }
  v10 = deviceBackup;
  objc_sync_exit(v3);

  return v10;
}

+ (id)cellValueStyleDateStringForDate:(id)a3
{
  id v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isTodayWithCalendar:", v5);

  objc_msgSend(v4, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v4, "setTimeStyle:", v6);
  objc_msgSend(v4, "setDateStyle:", 1);
  objc_msgSend(v4, "stringFromDate:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dateStringForSnapshot:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "state");
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    v9 = CFSTR("INCOMPLETE");
LABEL_6:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24E400750, CFSTR("BackupInfo"));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v4 != 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    v9 = CFSTR("NEVER");
    goto LABEL_6;
  }
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellValueStyleDateStringForDate:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v7;

  return v10;
}

- (id)dateStringOfLatestBackup
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (!self->_doneLoadingDeviceBackup)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24E400750, CFSTR("BackupInfo"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

    return v2;
  }
  if (!self->_dateOfLastBackup)
  {
    -[MBBackup snapshots](self->_deviceBackup, "snapshots");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NEVER"), &stru_24E400750, CFSTR("BackupInfo"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "dateStringForSnapshot:", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "cellValueStyleDateStringForDate:", self->_dateOfLastBackup);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

- (id)nextBackupSizeStringWithSpecifier:(id)a3
{
  id v4;
  NSString *nextBackupSizeString;
  NSString *v6;
  NSObject *v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  if (!self->_doneLoadingDeviceBackup)
    goto LABEL_5;
  nextBackupSizeString = self->_nextBackupSizeString;
  if (!nextBackupSizeString)
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(v7, block);

LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24E400750, CFSTR("BackupInfo"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v6 = nextBackupSizeString;
LABEL_6:

  return v6;
}

void __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[6];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "nextBackupSizeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "state") == 2)
  {
    v3 = objc_msgSend(v2, "size");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke_2;
    v4[3] = &unk_24E3F41B8;
    v4[4] = *(_QWORD *)(a1 + 32);
    v4[5] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }

}

void __62__ICQLocalBackupController_nextBackupSizeStringWithSpecifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 40), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("+%@"), v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1472);
  *(_QWORD *)(v3 + 1472) = v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416));
}

- (void)updateNextBackupSize
{
  NSString *nextBackupSizeString;

  nextBackupSizeString = self->_nextBackupSizeString;
  self->_nextBackupSizeString = 0;

  -[ICQLocalBackupController reloadSpecifier:](self, "reloadSpecifier:", self->_nextBackupSizeSpecifier);
}

- (id)backupSizeString
{
  return (id)objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", -[ICQLocalBackupController backupSize](self, "backupSize"), 1);
}

- (void)reloadAfterFetch
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = *MEMORY[0x24BE75D18];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v8, "cellType", (_QWORD)v11))
        {
          objc_msgSend(v8, "propertyForKey:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v8, "propertyForKey:", v6);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "refreshCellContentsWithSpecifier:", v8);

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (void)loadQuotaInfo
{
  void *v3;
  _QWORD v4[5];

  +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__ICQLocalBackupController_loadQuotaInfo__block_invoke;
  v4[3] = &unk_24E3F41E0;
  v4[4] = self;
  objc_msgSend(v3, "getQuotaInfoDetailed:handler:", 0, v4);

}

uint64_t __41__ICQLocalBackupController_loadQuotaInfo__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadAfterFetch");
}

- (void)reloadQuotaInfo
{
  NSObject *v3;
  _QWORD block[5];

  -[ICQLocalBackupController loadQuotaInfo](self, "loadQuotaInfo");
  self->_manageStorageReloadNeeded = 1;
  self->_doneLoadingDeviceBackup = 0;
  -[ICQLocalBackupController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("BACKUP_SIZE"));
  -[ICQLocalBackupController reloadSpecifierID:](self, "reloadSpecifierID:", CFSTR("LATEST_BACKUP"));
  -[ICQLocalBackupController updateNextBackupSize](self, "updateNextBackupSize");
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v3, block);

}

void __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reloadBackupInfoWithDeleteButton:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "domainInfoList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "remoteSize");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke_2;
  v8[3] = &unk_24E3F41B8;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);
}

uint64_t __43__ICQLocalBackupController_reloadQuotaInfo__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBackupSize:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:", CFSTR("BACKUP_SIZE"));
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:", CFSTR("LATEST_BACKUP"));
  return objc_msgSend(*(id *)(a1 + 32), "updateNextBackupSize");
}

- (void)reloadBackupInfoWithDeleteButton:(BOOL)a3
{
  MBBackup *deviceBackup;
  NSDate *dateOfLastBackup;
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;

  deviceBackup = self->_deviceBackup;
  self->_deviceBackup = 0;

  dateOfLastBackup = self->_dateOfLastBackup;
  self->_dateOfLastBackup = 0;

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke;
  v8[3] = &unk_24E3F37A0;
  v8[4] = self;
  v9 = a3;
  dispatch_async(v7, v8);

}

void __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke(uint64_t a1)
{
  id v2;
  _QWORD v3[5];
  char v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "currentDeviceBackup");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke_2;
  v3[3] = &unk_24E3F37A0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __61__ICQLocalBackupController_reloadBackupInfoWithDeleteButton___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "reloadAfterFetch");
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "insertDeleteBackupButtonIfNeeded");
  return result;
}

- (id)specifiers
{
  void *v3;
  NSMutableArray *appSpecifiers;
  NSString *nextBackupSizeString;
  id v6;
  void *v7;
  char v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v38 = (int)*MEMORY[0x24BE756E0];
    appSpecifiers = self->_appSpecifiers;
    self->_appSpecifiers = 0;

    nextBackupSizeString = self->_nextBackupSizeString;
    self->_nextBackupSizeString = 0;

    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v7, "setProperty:forKey:", CFSTR("BACKUP_INFO_GROUP"));
    v8 = -[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled");
    v9 = (_QWORD *)MEMORY[0x24BE75A68];
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEVICE_BACKUP_TURNED_OFF_FOOTER"), &stru_24E400750, CFSTR("BackupInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *v9);

    }
    objc_msgSend(v6, "addObject:", v7);
    v12 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LATEST_BACKUP"), &stru_24E400750, CFSTR("BackupInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_dateStringOfLatestBackup, 0, 4, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    v17 = *MEMORY[0x24BE75948];
    objc_msgSend(v15, "setProperty:forKey:", v16, *MEMORY[0x24BE75948]);
    v39 = v15;
    objc_msgSend(v6, "addObject:", v15);
    v18 = (void *)MEMORY[0x24BE75590];
    v19 = (objc_class *)v6;
    v20 = v7;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("BACKUP_SIZE"), &stru_24E400750, CFSTR("BackupInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, sel_backupSizeString, 0, 4, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setProperty:forKey:", objc_opt_class(), v17);
    objc_msgSend(v6, "addObject:", v23);
    -[MBManager restoreState](self->_backupManager, "restoreState");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v24, "state");

    if ((v17 - 1) >= 2)
    {
      if (-[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled"))
        objc_msgSend(v6, "addObject:", self->_nextBackupSizeSpecifier);
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setProperty:forKey:", CFSTR("BACKED_UP_APPS"), v37);
      objc_msgSend(v29, "setProperty:forKey:", CFSTR("LocalBackupHeaderView"), *MEMORY[0x24BE75AA0]);
      objc_msgSend(v6, "addObject:", v29);
      v19 = (objc_class *)v6;
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E400750, 0, 0, 0, 0, 15, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setProperty:forKey:", CFSTR("SPINNER_CELL"), v37);
      objc_msgSend(v6, "addObject:", v30);
      -[NSMutableArray removeAllObjects](self->_visibleAppSpecifiers, "removeAllObjects");
      -[ICQLocalBackupController reloadBackupInfoWithDeleteButton:](self, "reloadBackupInfoWithDeleteButton:", 1);
      -[ICQLocalBackupController updateAppSpecifiersScanWhenComplete:](self, "updateAppSpecifiersScanWhenComplete:", 1);
      v28 = v38;
      if (objc_msgSend((id)objc_opt_class(), "isiCloudPhotosEnabled")
        && (-[ACAccount aa_isManagedAppleID](self->_account, "aa_isManagedAppleID") & 1) == 0)
      {
        _ICQGetLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[ICQLocalBackupController specifiers].cold.1(v31);

        if (-[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled"))
          v32 = CFSTR("ICLOUD_PHOTOS_ACTIVE_BACKUP_FOOTER_TEXT");
        else
          v32 = CFSTR("ICLOUD_PHOTOS_INACTIVE_BACKUP_FOOTER_TEXT");
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", v32, &stru_24E400750, CFSTR("BackupInfo"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setProperty:forKey:", v34, *MEMORY[0x24BE75A68]);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESTORE_INCOMPLETE"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", v26, &stru_24E400750, CFSTR("BackupInfo"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setProperty:forKey:", v27, *MEMORY[0x24BE75A68]);

      -[ICQLocalBackupController reloadBackupInfoWithDeleteButton:](self, "reloadBackupInfoWithDeleteButton:", 0);
      v28 = v38;
    }
    v35 = *(Class *)((char *)&self->super.super.super.super.super.isa + v28);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v28) = v19;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v28);
  }
  return v3;
}

- (void)startDeletionBezel
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  ICQSpinnerBezel *v24;
  ICQSpinnerBezel *deletionBezel;
  ICQSpinnerBezel *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[ICQLocalBackupController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  v9 = (v6 + -156.0) * 0.5;
  v10 = floorf(v9);
  v11 = (v8 + -126.0) * 0.5;
  v12 = floorf(v11);
  -[ICQLocalBackupController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertRect:toView:", v15, v10, v12, 156.0, 126.0);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = -[ICQSpinnerBezel initWithFrame:]([ICQSpinnerBezel alloc], "initWithFrame:", v17, v19, v21, v23);
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = v24;

  v26 = self->_deletionBezel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DELETING"), &stru_24E400750, CFSTR("BackupInfo"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQSpinnerBezel setBezelText:](v26, "setBezelText:", v28);

  -[ICQLocalBackupController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", self->_deletionBezel);

  -[ICQLocalBackupController view](self, "view");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "window");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUserInteractionEnabled:", 0);

}

- (void)endDeletionBezel
{
  void *v3;
  void *v4;
  ICQSpinnerBezel *deletionBezel;

  -[ICQLocalBackupController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  -[ICQSpinnerBezel removeFromSuperview](self->_deletionBezel, "removeFromSuperview");
  deletionBezel = self->_deletionBezel;
  self->_deletionBezel = 0;

}

- (void)_backupDeletionSuccess
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Backup deletion completed sucessfully.", v7, 2u);
  }

  -[ICQLocalBackupController endDeletionBezel](self, "endDeletionBezel");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("BackupInfoDidChange"), 0);

  -[ICQLocalBackupController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)deleteBackupConfirmed
{
  NSObject *v3;
  _QWORD block[5];

  -[ICQLocalBackupController startDeletionBezel](self, "startDeletionBezel");
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;
  id v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1432), "backupUDID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 1432);
  if (v4)
    v5 = v2 == 0;
  else
    v5 = 0;
  if (v5)
    __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_cold_1();
  v6 = (void *)v2;
  if (v4)
  {
    v7 = *(void **)(v3 + 1376);
    v14 = 0;
    v8 = objc_msgSend(v7, "deleteBackupUDID:error:", v6, &v14);
    v9 = v14;
  }
  else
  {
    v9 = 0;
    v8 = 1;
  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2;
  v11[3] = &unk_24E3F35C0;
  v13 = v8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v9;
  v10 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
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
  id v27;
  id v28;
  _QWORD v29[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(v2 + 1512);
    if (v3)
    {
      objc_msgSend(v3, "setDelegate:");
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1512);
      +[ICQCloudStorageInfo backupInfoHeaders](ICQCloudStorageInfo, "backupInfoHeaders");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "popAndReloadFromRemoteUI:additionalHeaders:", 0, v27);

    }
    else
    {
      objc_msgSend((id)v2, "_backupDeletionSuccess");
    }
  }
  else
  {
    *(_BYTE *)(v2 + 1522) = 1;
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 32), "endDeletionBezel");
    objc_msgSend(*(id *)(a1 + 40), "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR("CANNOT_DELETE_BACKUP_DETAILS");
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("MBErrorDomain"))
      && objc_msgSend(*(id *)(a1 + 40), "code") == 13)
    {
      v13 = CFSTR("CANNOT_DELETE_BACKUP_LOCKED");
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_24E400750, CFSTR("BackupInfo"));
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANNOT_DELETE_BACKUP"), &stru_24E400750, CFSTR("BackupInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", v17, v28, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E400750, CFSTR("BackupInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_220;
    v29[3] = &unk_24E3F4130;
    v29[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v22);

    v23 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E400750, CFSTR("BackupInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v26);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v18, 1, 0);
  }
}

uint64_t __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_220(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteBackupConfirmed");
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5;
  id v6;

  -[ICQLocalBackupController endDeletionBezel](self, "endDeletionBezel", a3, a4);
  -[ICQLocalBackupController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v5 = a4;
  -[ICQLocalBackupController specifierAtIndex:](self, "specifierAtIndex:", -[ICQLocalBackupController indexForIndexPath:](self, "indexForIndexPath:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQLocalBackupController specifierAtIndex:](self, "specifierAtIndex:", -[ICQLocalBackupController indexForIndexPath:](self, "indexForIndexPath:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController getGroupSpecifierForSpecifier:](self, "getGroupSpecifierForSpecifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SHOW_ALL_APPS")) & 1) != 0
    || (objc_msgSend(v9, "identifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("DELETE_BACKUP_BUTTON_GROUP")),
        v10,
        v11))
  {
    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  v8.receiver = self;
  v8.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v7, v6);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
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
  uint64_t v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)ICQLocalBackupController;
  -[ICQLocalBackupController tableView:viewForHeaderInSection:](&v19, sel_tableView_viewForHeaderInSection_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQLocalBackupController additionalSpaceRequiredString](self, "additionalSpaceRequiredString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICQLocalBackupController specifierForID:](self, "specifierForID:", CFSTR("BACKED_UP_APPS"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[ICQLocalBackupController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v18, 0, v8);
    if (v18 == a4)
    {
      objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75AB0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "subtitleAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v9, "addSubtitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("ADDITONAL_SPACE_NEEDED"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_24E400750, CFSTR("BackupInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQLocalBackupController additionalSpaceRequiredString](self, "additionalSpaceRequiredString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v16);

    }
  }
  return v6;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x24BE75530], "instancesRespondToSelector:", sel_tableView_willDisplayCell_forRowAtIndexPath_))
  {
    v25.receiver = self;
    v25.super_class = (Class)ICQLocalBackupController;
    -[ICQLocalBackupController tableView:willDisplayCell:forRowAtIndexPath:](&v25, sel_tableView_willDisplayCell_forRowAtIndexPath_, v8, v9, v10);
  }
  -[ICQLocalBackupController specifierAtIndex:](self, "specifierAtIndex:", -[ICQLocalBackupController indexForIndexPath:](self, "indexForIndexPath:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("SHOW_ALL_APPS"));

  if (v13)
  {
    objc_msgSend(v9, "setIndentationLevel:", 1);
    objc_msgSend(v9, "setIndentationWidth:", 36.0);
  }
  else
  {
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NEXT_BACKUP_SIZE"));

    if (v15)
    {
      -[ICQLocalBackupController additionalSpaceRequiredString](self, "additionalSpaceRequiredString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (void *)MEMORY[0x24BEBD660];
        objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v18;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "configurationWithPaletteColors:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v21);
        objc_msgSend(v9, "setAccessoryView:", v22);

      }
    }
  }
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE75D28]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v9, "detailTextLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setText:", v23);

  }
}

- (BOOL)scanInProgress
{
  return self->_scanInProgress;
}

- (void)setScanInProgress:(BOOL)a3
{
  self->_scanInProgress = a3;
}

- (unint64_t)backupSize
{
  return self->_backupSize;
}

- (void)setBackupSize:(unint64_t)a3
{
  self->_backupSize = a3;
}

- (NSString)additionalSpaceRequiredString
{
  return self->_additionalSpaceRequiredString;
}

- (void)setAdditionalSpaceRequiredString:(id)a3
{
  objc_storeStrong((id *)&self->_additionalSpaceRequiredString, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (NSURL)deviceImageURL
{
  return self->_deviceImageURL;
}

- (void)setDeviceImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImageURL, a3);
}

- (ICQPreferencesRemoteUIDelegate)remoteDelegate
{
  return self->_remoteDelegate;
}

- (void)setRemoteDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDelegate, a3);
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_remoteDelegate, 0);
  objc_storeStrong((id *)&self->_deletionBezel, 0);
  objc_storeStrong((id *)&self->_deviceImageURL, 0);
  objc_storeStrong((id *)&self->_additionalSpaceRequiredString, 0);
  objc_storeStrong((id *)&self->_nextBackupSizeString, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_dateOfLastBackup, 0);
  objc_storeStrong((id *)&self->_deviceBackup, 0);
  objc_storeStrong((id *)&self->_deviceIdentificationView, 0);
  objc_storeStrong((id *)&self->_nextBackupSizeSpecifier, 0);
  objc_storeStrong((id *)&self->_showAllSpecifier, 0);
  objc_storeStrong((id *)&self->_visibleAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "LocalBackup received no account info. Can't initiate backup manager.", v1, 2u);
}

- (void)setSpecifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21F2CC000, a2, a3, "%s unable to init MBManager with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __54__ICQLocalBackupController_turnOffAppBackupConfirmed___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_21F2CC000, a2, a3, "Error removing backup domain %@: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)showAllApps:.cold.1()
{
  __assert_rtn("-[ICQLocalBackupController showAllApps:]", "ICQLocalBackupController.m", 295, "_appSpecifiers");
}

- (void)_updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:.cold.1()
{
  __assert_rtn("-[ICQLocalBackupController _updateTable:toMatchArray:withVisibleArray:maxVisible:inSection:withRowOffset:]", "ICQLocalBackupController.m", 504, "originalIndex != NSNotFound");
}

- (void)beginScan
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Scan failed to start with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)manager:(uint64_t)a3 didFailScanWithError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Scan failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)currentDeviceBackupWithMBManager:(uint64_t)a3 filtering:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Error getting backupList: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)specifiers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F2CC000, log, OS_LOG_TYPE_DEBUG, "Setting iCPL footer as iCPL seems enabled and active account is NOT a MAID account.", v1, 2u);
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_cold_1()
{
  __assert_rtn("-[ICQLocalBackupController deleteBackupConfirmed]_block_invoke", "ICQLocalBackupController.m", 1004, "(_deviceBackup == nil) || backupUDID != nil");
}

void __49__ICQLocalBackupController_deleteBackupConfirmed__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Failed to delete backup with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
