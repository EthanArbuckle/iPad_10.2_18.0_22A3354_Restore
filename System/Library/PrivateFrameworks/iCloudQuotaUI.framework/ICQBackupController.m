@implementation ICQBackupController

- (ICQBackupController)init
{
  void *v3;
  void *v4;
  ICQBackupController *v5;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICQBackupController initWithAccount:](self, "initWithAccount:", v4);

  return v5;
}

- (ICQBackupController)initWithAccount:(id)a3
{
  id v5;
  ICQBackupController *v6;
  ICQBackupController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  MBManager *backupManager;
  dispatch_queue_t v12;
  OS_dispatch_queue *backup_state_queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  NWPathEvaluator *pathEvaluator;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICQBackupController;
  v6 = -[ICQBackupController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = objc_alloc(MEMORY[0x24BE66C40]);
    -[ACAccount personaIdentifier](v7->_account, "personaIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithDelegate:eventQueue:personaIdentifier:", v7, 0, v9);
    backupManager = v7->_backupManager;
    v7->_backupManager = (MBManager *)v10;

    v12 = dispatch_queue_create("com.apple.preferences.backup_state", 0);
    backup_state_queue = v7->_backup_state_queue;
    v7->_backup_state_queue = (OS_dispatch_queue *)v12;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)appleAccountChangedCallback, (CFStringRef)*MEMORY[0x24BE047F8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7->_thermalNotificationToken = -1;
    v7->_thermalSupportsBackup = 1;
    v7->_currentSyncState = 0;
    v7->_updateBackupState = 0;
    v7->_icloudSyncProgress = 0.0;
    v7->_icloudBackupProgress = 0.0;
    v7->_estimateTimeRemaining = 0;
    v7->_isFetchingDomainInfo = 0;
    v7->_needToShowPopupAlertForBackup = 0;
    -[ICQBackupController _checkSupportForManualAndAutoBackupOnCellular](v7, "_checkSupportForManualAndAutoBackupOnCellular");
    v15 = objc_opt_new();
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = (NWPathEvaluator *)v15;

    -[NWPathEvaluator addObserver:forKeyPath:options:context:](v7->_pathEvaluator, "addObserver:forKeyPath:options:context:", v7, CFSTR("path"), 5, 0);
    -[ICQBackupController fetchIsBackupEnabled](v7, "fetchIsBackupEnabled");
  }

  return v7;
}

- (void)willUnlock
{
  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PSGBackupDisabledAppsInfo *backupDisabledAppsInfo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQBackupController;
  -[ICQBackupController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACKUPS_NAV_TITLE"), &stru_24E400750, CFSTR("Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBackupController setTitle:](self, "setTitle:", v5);

  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  self->_backupDisabledAppsInfo = 0;

  -[ICQBackupController prepareAlertForBackupDisabledDomainAndShow:](self, "prepareAlertForBackupDisabledDomainAndShow:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQBackupController;
  -[ICQBackupController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if ((-[ICQBackupController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    +[ICQQuotaRequestManager sharedManager](ICQQuotaRequestManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteQuotaInfoChanged");

  }
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_viewDidAppear___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v5, block);

  -[ICQBackupController checkIfNetworkSupportsBackup](self, "checkIfNetworkSupportsBackup");
  -[ICQBackupController startListeningForThermalChanges](self, "startListeningForThermalChanges");
  -[ICQBackupController checkIfThermalSupportsBackup](self, "checkIfThermalSupportsBackup");
}

uint64_t __37__ICQBackupController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "syncBackupEnabled");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQBackupController;
  -[ICQBackupController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[ICQBackupController stopListeningForThermalChanges](self, "stopListeningForThermalChanges");
  self->_needToShowPopupAlertForBackup = 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[ICQBackupController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[NWPathEvaluator removeObserver:forKeyPath:context:](self->_pathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);
  -[ICQBackupController stopListeningForThermalChanges](self, "stopListeningForThermalChanges");
  -[MBManager setDelegate:](self->_backupManager, "setDelegate:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE047F8], 0);
  v4.receiver = self;
  v4.super_class = (Class)ICQBackupController;
  -[ICQBackupController dealloc](&v4, sel_dealloc);
}

- (BYBuddyDaemonCloudSyncClient)cloudSyncClient
{
  BYBuddyDaemonCloudSyncClient *cloudSyncClient;
  BYBuddyDaemonCloudSyncClient *v4;
  BYBuddyDaemonCloudSyncClient *v5;

  cloudSyncClient = self->_cloudSyncClient;
  if (!cloudSyncClient)
  {
    v4 = (BYBuddyDaemonCloudSyncClient *)objc_opt_new();
    v5 = self->_cloudSyncClient;
    self->_cloudSyncClient = v4;

    -[BYBuddyDaemonCloudSyncClient setDelegate:](self->_cloudSyncClient, "setDelegate:", self);
    cloudSyncClient = self->_cloudSyncClient;
  }
  return cloudSyncClient;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD v7[4];
  id v8;
  id location;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("path"), a4, a5, a6))
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__ICQBackupController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_24E3F48E8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__ICQBackupController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkIfNetworkSupportsBackup");

}

- (void)setNetworkSupportsBackup:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *networkSupportsBackup;
  NSNumber *v6;
  NSNumber *v7;

  v3 = a3;
  networkSupportsBackup = self->_networkSupportsBackup;
  if (!networkSupportsBackup || -[NSNumber BOOLValue](networkSupportsBackup, "BOOLValue") != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_networkSupportsBackup;
    self->_networkSupportsBackup = v6;

    -[ICQBackupController updateBusyState](self, "updateBusyState");
    -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
  }
}

- (void)checkIfNetworkSupportsBackup
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  NSNumber *isExpensiveCellular;
  _BOOL8 isManualBackupOnCellularAllowed;
  NSNumber *v10;
  NSNumber *v11;
  NSObject *v12;
  NSNumber *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  NSNumber *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ICQBackupController pathEvaluator](self, "pathEvaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "status") & 0xFFFFFFFFFFFFFFFDLL;
  objc_msgSend(v4, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  isExpensiveCellular = self->_isExpensiveCellular;
  self->_isExpensiveCellular = 0;

  if (v5 != 1)
    goto LABEL_7;
  isManualBackupOnCellularAllowed = 1;
  if ((objc_msgSend(v4, "usesInterfaceType:", 1) & 1) != 0)
    goto LABEL_8;
  if ((objc_msgSend(v4, "usesInterfaceType:", 3) & 1) != 0)
  {
    isManualBackupOnCellularAllowed = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "usesInterfaceType:", 2))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isExpensive"));
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v11 = self->_isExpensiveCellular;
    self->_isExpensiveCellular = v10;

    -[ICQBackupController _checkSupportForManualAndAutoBackupOnCellular](self, "_checkSupportForManualAndAutoBackupOnCellular");
    isManualBackupOnCellularAllowed = self->_isManualBackupOnCellularAllowed;
  }
  else
  {
LABEL_7:
    isManualBackupOnCellularAllowed = 0;
  }
LABEL_8:
  _ICQGetLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_isExpensiveCellular;
    v14 = 134218498;
    v15 = v7;
    v16 = 2112;
    v17 = v13;
    v18 = 1024;
    v19 = isManualBackupOnCellularAllowed;
    _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", (uint8_t *)&v14, 0x1Cu);
  }

  -[ICQBackupController setNetworkSupportsBackup:](self, "setNetworkSupportsBackup:", isManualBackupOnCellularAllowed);
}

- (void)_checkSupportForManualAndAutoBackupOnCellular
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Failed to get backup on cellular support: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)startListeningForThermalChanges
{
  const char *v3;
  NSObject *v4;
  id v5;
  _QWORD handler[5];
  id v7;
  id location;

  objc_initWeak(&location, self);
  if (self->_thermalNotificationToken == -1)
  {
    v3 = (const char *)*MEMORY[0x24BDAE948];
    v4 = MEMORY[0x24BDAC9B8];
    v5 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __54__ICQBackupController_startListeningForThermalChanges__block_invoke;
    handler[3] = &unk_24E3F4910;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    notify_register_dispatch(v3, &self->_thermalNotificationToken, v4, handler);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __54__ICQBackupController_startListeningForThermalChanges__block_invoke(uint64_t a1, int token)
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = state64;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "received thermal pressure notification: %llu", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1480);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__ICQBackupController_startListeningForThermalChanges__block_invoke_358;
    block[3] = &unk_24E3F41B8;
    v9 = state64;
    v8 = WeakRetained;
    dispatch_async(v6, block);

  }
}

uint64_t __54__ICQBackupController_startListeningForThermalChanges__block_invoke_358(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  uint8_t buf[2];

  v2 = *(_QWORD *)(a1 + 40);
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2 >= 0x14)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      v5 = "Restore paused due to thermal pressure.";
      v6 = buf;
      goto LABEL_6;
    }
  }
  else if (v4)
  {
    v8 = 0;
    v5 = "Restore resumed due to thermal pressure.";
    v6 = (uint8_t *)&v8;
LABEL_6:
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setThermalSupportsBackup:", v2 < 0x14);
}

- (void)stopListeningForThermalChanges
{
  notify_cancel(self->_thermalNotificationToken);
  self->_thermalNotificationToken = -1;
}

- (void)setThermalSupportsBackup:(BOOL)a3
{
  self->_thermalSupportsBackup = a3;
  -[ICQBackupController updateBusyState](self, "updateBusyState");
}

- (void)checkIfThermalSupportsBackup
{
  uint64_t v3;
  int out_token;

  out_token = 0;
  v3 = 0;
  if (!notify_register_check((const char *)*MEMORY[0x24BDAE948], &out_token))
  {
    if (!notify_get_state(out_token, &v3))
      -[ICQBackupController setThermalSupportsBackup:](self, "setThermalSupportsBackup:", v3 < 0x14);
    notify_cancel(out_token);
  }
}

- (id)_buildHeaderCardSpecifier
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
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("BackupHeader"), self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForKey:", *MEMORY[0x24BE75810]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75AC8]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACKUP_HEADER_TITLE"), &stru_24E400750, CFSTR("Backup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BACKUPS_INFO_LEARN_MORE"), &stru_24E400750, CFSTR("Backup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, ICQUILearnMoreTextKey);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("BACKUP_HELP_PAGE_URL"), &stru_24E400750, CFSTR("Backup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, ICQUILearnMoreLinkKey);

  if (!-[ICQBackupController policyPreventsBackup](self, "policyPreventsBackup"))
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Backup is allowed, setting backup info text", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUPS_INFO_TEXT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_24E400750, CFSTR("Backup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75D28]);

  }
  return v3;
}

- (void)reloadSpecifiers
{
  objc_super v3;

  if (self->_finishedInitialLoad)
  {
    -[ICQBackupController updateBusyState](self, "updateBusyState");
    -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ICQBackupController;
    -[ICQBackupController reloadSpecifiers](&v3, sel_reloadSpecifiers);
  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
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
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PSSpecifier *v24;
  PSSpecifier *backupOverCellularSwitch;
  PSSpecifier *v26;
  NSArray *v27;
  NSArray *backupOverCellularSpecifiers;
  void *v29;
  ICQBackupStatusView *v30;
  ICQBackupStatusView *backupStatusView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  PSSpecifier *v37;
  PSSpecifier *backupNowButton;
  PSSpecifier *v39;
  void *v40;
  NSArray *v41;
  NSArray *backupNowSpecifiers;
  AAUISpecifierProvider *backupSpecifierProvider;
  ICQDeviceBackupSpecifierProvider *v44;
  AAUISpecifierProvider *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[2];
  uint8_t buf[4];
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if (MGGetBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.iCloudQuotaUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBackupController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("Backup"), self, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUP_ENABLED_SWITCH"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24E400750, CFSTR("Backup"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v10);

      v11 = *MEMORY[0x24BE75868];
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
      objc_msgSend(v6, "specifierForID:", CFSTR("BACKUP_SWITCH_GROUP"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        -[ICQBackupController specifiers].cold.1();
      v13 = v12;
      objc_msgSend(v12, "setName:", 0);
      -[ICQBackupController _buildHeaderCardSpecifier](self, "_buildHeaderCardSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        _ICQGetLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v59 = 1;
          _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Inserting header specifier for backup controller at index: %d", buf, 8u);
        }

        objc_msgSend(v6, "insertObject:atIndex:", v14, 1);
      }
      if (!self->_backupOverCellularSpecifiers)
      {
        objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BACKUP_OVER_CELLULAR_GROUP"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = v13;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        SFLocalizableWAPIStringKeyForKey();
        v53 = v7;
        v55 = v11;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_24E400750, CFSTR("Backup"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A68]);

        v20 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUP_OVER_CELLULAR_ENABLED_SWITCH"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_24E400750, CFSTR("Backup"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, sel_setBackupOverCellularEnabled_, sel_isBackupOverCellularEnabled, 0, 6, 0);
        v24 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        backupOverCellularSwitch = self->_backupOverCellularSwitch;
        self->_backupOverCellularSwitch = v24;

        v11 = v55;
        v13 = v51;

        v7 = v53;
        -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
        -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v55);
        -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", CFSTR("BACKUP_OVER_CELLULAR_ENABLED_SWITCH"), *MEMORY[0x24BE75AC0]);
        v26 = self->_backupOverCellularSwitch;
        v57[0] = v16;
        v57[1] = v26;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
        v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
        backupOverCellularSpecifiers = self->_backupOverCellularSpecifiers;
        self->_backupOverCellularSpecifiers = v27;

      }
      if (!self->_backupNowSpecifiers)
      {
        v56 = v11;
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = *MEMORY[0x24BE75AC0];
        objc_msgSend(v29, "setProperty:forKey:", CFSTR("BACKUP_NOW_GROUP"));
        if (!self->_backupStatusView)
        {
          v30 = -[ICQBackupStatusView initWithSpecifier:]([ICQBackupStatusView alloc], "initWithSpecifier:", v29);
          backupStatusView = self->_backupStatusView;
          self->_backupStatusView = v30;

        }
        objc_msgSend((id)objc_opt_class(), "description");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setProperty:forKey:", v32, *MEMORY[0x24BE75A30]);

        objc_msgSend(v29, "setProperty:forKey:", self->_backupStatusView, *MEMORY[0x24BE75A78]);
        if (!self->_backupNowButton)
        {
          v52 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("BACKUP_NOW"), &stru_24E400750, CFSTR("Backup"));
          v34 = v13;
          v35 = v7;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v36, self, 0, 0, 0, 13, 0);
          v37 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
          backupNowButton = self->_backupNowButton;
          self->_backupNowButton = v37;

          v7 = v35;
          v13 = v34;

          v39 = self->_backupNowButton;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSSpecifier setProperty:forKey:](v39, "setProperty:forKey:", v40, *MEMORY[0x24BE75A18]);

          -[PSSpecifier setProperty:forKey:](self->_backupNowButton, "setProperty:forKey:", CFSTR("BACKUP_NOW_BUTTON"), v54);
          -[PSSpecifier setProperty:forKey:](self->_backupNowButton, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v56);
          -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_beginBackup_);
        }
        v41 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v29, self->_backupNowButton, 0);
        backupNowSpecifiers = self->_backupNowSpecifiers;
        self->_backupNowSpecifiers = v41;

      }
      backupSpecifierProvider = self->_backupSpecifierProvider;
      if (!backupSpecifierProvider)
      {
        v44 = -[ICQDeviceBackupSpecifierProvider initWithAccount:presenter:]([ICQDeviceBackupSpecifierProvider alloc], "initWithAccount:presenter:", self->_account, self);
        v45 = self->_backupSpecifierProvider;
        self->_backupSpecifierProvider = (AAUISpecifierProvider *)v44;

        backupSpecifierProvider = self->_backupSpecifierProvider;
      }
      -[AAUISpecifierProvider specifiers](backupSpecifierProvider, "specifiers");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "count");

      if (v47)
      {
        -[AAUISpecifierProvider specifiers](self->_backupSpecifierProvider, "specifiers");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v48);

      }
      v49 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    }
    self->_finishedInitialLoad = 1;
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)prepareAlertForBackupDisabledDomainAndShow:(BOOL)a3
{
  id PSGBackupUtilsClass_0;
  MBManager *backupManager;
  _QWORD v6[5];

  self->_needToShowPopupAlertForBackup = a3;
  if (!self->_isFetchingDomainInfo)
  {
    self->_isFetchingDomainInfo = 1;
    PSGBackupUtilsClass_0 = getPSGBackupUtilsClass_0();
    backupManager = self->_backupManager;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__ICQBackupController_prepareAlertForBackupDisabledDomainAndShow___block_invoke;
    v6[3] = &unk_24E3F4938;
    v6[4] = self;
    objc_msgSend(PSGBackupUtilsClass_0, "fetchBackupDisabledAppsWithBackupManager:completion:", backupManager, v6);
  }
}

void __66__ICQBackupController_prepareAlertForBackupDisabledDomainAndShow___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1544), a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1497) = 0;
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[1498])
  {
    objc_msgSend(v4, "showPopUpAlertForBackupDisabledApps");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1498) = 0;
  }

}

- (BOOL)policyPreventsBackup
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638B8]) == 2;

  return v3;
}

- (void)fetchIsBackupEnabled
{
  NSObject *backup_state_queue;
  _QWORD block[5];

  backup_state_queue = self->_backup_state_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ICQBackupController_fetchIsBackupEnabled__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(backup_state_queue, block);
}

void __43__ICQBackupController_fetchIsBackupEnabled__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isBackupEnabled");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__ICQBackupController_fetchIsBackupEnabled__block_invoke_2;
  v3[3] = &unk_24E3F37A0;
  v4 = v2;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __43__ICQBackupController_fetchIsBackupEnabled__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[ICQBackupController fetchIsBackupEnabled]_block_invoke_2";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "%s, Caching backup enabled: %d, reloading", (uint8_t *)&v5, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1388) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (BOOL)isBackupEnabled
{
  NSObject *v3;
  int v4;
  MBManager *backupManager;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  MBManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  if (-[ICQBackupController policyPreventsBackup](self, "policyPreventsBackup"))
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Backup not enabled because policy prevents backup", (uint8_t *)&v7, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled");
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      backupManager = self->_backupManager;
      v7 = 136315650;
      v8 = "-[ICQBackupController isBackupEnabled]";
      v9 = 1024;
      v10 = v4;
      v11 = 2112;
      v12 = backupManager;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s, returning: %d, backup manager: %@", (uint8_t *)&v7, 0x1Cu);
    }
  }

  return v4;
}

- (id)cachedIsBackupEnabledNumber
{
  NSObject *v3;
  _BOOL4 backupEnabled;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    backupEnabled = self->_backupEnabled;
    v6 = 136315394;
    v7 = "-[ICQBackupController cachedIsBackupEnabledNumber]";
    v8 = 1024;
    v9 = backupEnabled;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v6, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_backupEnabled);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setBackupEnabled:(BOOL)a3 passcode:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v4 = a3;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ICQBackupController _setBackupEnabled:passcode:]";
    v28 = 1024;
    v29 = v4;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  if (v4)
  {
    -[ICQBackupController _persistBackupEnablementState:passcode:](self, "_persistBackupEnablementState:passcode:", 1, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DISABLE_WARNING_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24E400750, CFSTR("Backup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DISABLE_CONFIRM"), &stru_24E400750, CFSTR("Backup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __50__ICQBackupController__setBackupEnabled_passcode___block_invoke;
    v23[3] = &unk_24E3F4960;
    v23[4] = self;
    v25 = 0;
    v24 = v6;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 2, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v17);

    v18 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DISABLE_CANCEL"), &stru_24E400750, CFSTR("Backup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_413;
    v22[3] = &unk_24E3F4130;
    v22[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v21);

    -[ICQBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, &__block_literal_global_14);
  }

}

uint64_t __50__ICQBackupController__setBackupEnabled_passcode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Confirmed disable backup", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_persistBackupEnablementState:passcode:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_413(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "User cancelled disable backup", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __50__ICQBackupController__setBackupEnabled_passcode___block_invoke_414()
{
  NSObject *v0;
  uint8_t v1[16];

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21F2CC000, v0, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for Turn off iCloud Backup", v1, 2u);
  }

}

- (void)_persistBackupEnablementState:(BOOL)a3 passcode:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  PSSpecifier *backupNowButton;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  uint64_t v17;
  NSObject *backup_state_queue;
  id v19;
  _QWORD v20[5];
  id v21;
  _BYTE *v22;
  BOOL v23;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ICQBackupController _persistBackupEnablementState:passcode:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  -[ICQBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", 0);
  -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  if (!v4)
  {
    backupNowButton = self->_backupNowButton;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE75A18];
    -[PSSpecifier setProperty:forKey:](backupNowButton, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

    -[ICQBackupController reloadSpecifier:](self, "reloadSpecifier:", self->_backupNowButton);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v10);
    -[ICQBackupController reloadSpecifier:](self, "reloadSpecifier:", self->_backupOverCellularSwitch);
  }
  -[ICQBackupController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", 0);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = objc_alloc_init(MEMORY[0x24BEBD898]);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAutoresizingMask:", 45);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFontSize:", 16);
  v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURNING_ON_BACKUP"), &stru_24E400750, CFSTR("Backup"));
  else
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURNING_OFF_BACKUP"), &stru_24E400750, CFSTR("Backup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  v16 = dispatch_time(0, 1000000000);
  v17 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke;
  block[3] = &unk_24E3F4348;
  block[4] = self;
  block[5] = buf;
  dispatch_after(v16, MEMORY[0x24BDAC9B8], block);
  backup_state_queue = self->_backup_state_queue;
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2;
  v20[3] = &unk_24E3F49D0;
  v23 = v4;
  v20[4] = self;
  v21 = v6;
  v22 = buf;
  v19 = v6;
  dispatch_async(backup_state_queue, v20);

  _Block_object_dispose(buf, 8);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "table");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "superview");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v6 = v2;
      do
      {
        v5 = v6;

        v6 = v4;
        objc_msgSend(v6, "superview");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        v2 = v5;
      }
      while (v4);
    }
    else
    {
      v6 = v2;
      v5 = v2;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "showInView:", v5);

  }
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  _QWORD v11[8];
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setBackupEnabled:", *(unsigned __int8 *)(a1 + 56));
  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1376);
    v19 = 0;
    v4 = objc_msgSend(v3, "setupBackupWithPasscode:error:", v2, &v19);
    v5 = v19;
    *((_BYTE *)v21 + 24) = v4;
    if (v5)
    {
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2_cold_1();

    }
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1392), "setEnabled:forDataclass:", *(unsigned __int8 *)(a1 + 56), *MEMORY[0x24BDB4558]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1392);
    v9 = (id *)(v14 + 5);
    obj = (id)v14[5];
    objc_msgSend(v7, "saveVerifiedAccount:error:", v8, &obj);
    objc_storeStrong(v9, obj);
    *((_BYTE *)v21 + 24) = v14[5] == 0;

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_420;
  v11[3] = &unk_24E3F49A8;
  v10 = *(_QWORD *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v10;
  v11[6] = &v20;
  v11[7] = &v13;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_420(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  id v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hide");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(WeakRetained, "reloadSpecifiers");

    objc_msgSend(*(id *)(a1 + 32), "checkIfNetworkSupportsBackup");
    return;
  }
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_420_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24E400750, CFSTR("Backup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_24E400750, CFSTR("Backup"));
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("MBErrorDomain")))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code") == 300)
    {

    }
    else
    {
      v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code");

      if (v21 != 308)
      {
        v35 = (void *)v17;
        v19 = v15;
        v20 = CFSTR("ERROR_ENABLING_BACKUP_DETAILS");
        goto LABEL_15;
      }
    }
    v22 = objc_alloc_init(MEMORY[0x24BE04788]);
    v23 = objc_msgSend(v22, "airplaneMode");

    if (v23)
    {
      SFLocalizableWAPIStringKeyForKey();
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = CFSTR("ERROR_ENABLING_BACKUP_NETWORK");
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E400750, CFSTR("Backup"));
    v25 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v17;
    v19 = (void *)v25;
    v35 = 0;
  }
  else
  {
    v35 = (void *)v17;
    v19 = v15;
    v20 = CFSTR("ERROR_ENABLING_BACKUP_DETAILS");
  }

LABEL_15:
  v26 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ERROR_ENABLING_BACKUP"), &stru_24E400750, CFSTR("Backup"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", v20, &stru_24E400750, CFSTR("Backup"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "alertControllerWithTitle:message:preferredStyle:", v28, v30, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_436;
  v37[3] = &unk_24E3F4130;
  v37[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v19, 1, v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAction:", v33);

  v36[0] = v32;
  v36[1] = 3221225472;
  v36[2] = __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_437;
  v36[3] = &unk_24E3F4130;
  v36[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v35, 0, v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAction:", v34);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v31, 1, 0);
}

uint64_t __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_436(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Reload specifier with specifier ID 'BACKUP_ENABLED_SWITCH'", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("BACKUP_ENABLED_SWITCH"), 1);
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_437(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Enabling backup with specifier ID 'BACKUP_ENABLED_SWITCH'", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_enableBackupWithSpecifier:", v4);

}

- (id)isBackupOverCellularEnabled
{
  MBManager *backupManager;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  backupManager = self->_backupManager;
  v9 = 0;
  v3 = -[MBManager isBackupOnCellularEnabledWithError:](backupManager, "isBackupOnCellularEnabledWithError:", &v9);
  v4 = (char *)v9;
  if (v4)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }

  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[ICQBackupController isBackupOverCellularEnabled]";
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setBackupOverCellularEnabled:(id)a3
{
  id v4;
  MBManager *backupManager;
  int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  backupManager = self->_backupManager;
  v13 = 0;
  v6 = -[MBManager setBackupOnCellularEnabled:error:](backupManager, "setBackupOnCellularEnabled:error:", objc_msgSend(v4, "BOOLValue"), &v13);
  v7 = v13;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      v10 = "Successfully set BackupOnCellularEnabled: %@";
      v11 = v8;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else if (v9)
  {
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v7;
    v10 = "Failed to set BackupOnCellularEnabled: %@: %@";
    v11 = v8;
    v12 = 22;
    goto LABEL_6;
  }

  -[ICQBackupController checkIfNetworkSupportsBackup](self, "checkIfNetworkSupportsBackup");
}

- (void)didAcceptEnteredPIN:(id)a3
{
  -[ICQBackupController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 1, a3);
}

- (void)didCancelEnteringPIN
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQBackupController didCancelEnteringPIN]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQBackupController specifierForID:](self, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQBackupController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);

}

- (void)_enableBackupWithSpecifier:(id)a3
{
  -[ICQBackupController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 1, 0);
}

- (void)_disableBackupWithSpecifier:(id)a3
{
  -[ICQBackupController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 0, 0);
}

- (void)_backupEnabledSwitchCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQBackupController _backupEnabledSwitchCancelled:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQBackupController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
}

- (void)setBackupEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICQBackupController setBackupEnabled:specifier:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s, enabled: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[ICQBackupController setBackupEnabled:specifier:].cold.1();
  if (objc_msgSend(v6, "BOOLValue"))
    -[ICQBackupController _enableBackupWithSpecifier:](self, "_enableBackupWithSpecifier:", v7);
  else
    -[ICQBackupController _disableBackupWithSpecifier:](self, "_disableBackupWithSpecifier:", v7);

}

- (void)openBackupHelpPage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACKUP_HELP_PAGE_URL"), &stru_24E400750, CFSTR("Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:options:completionHandler:", v6, MEMORY[0x24BDBD1B8], 0);

}

- (void)updateiCloudBackupAndSyncProgressWithAllowDecrease:(BOOL)a3
{
  double icloudBackupProgress;
  double v5;

  if (self->_icloudBackupProgress >= 0.0199999996)
    icloudBackupProgress = self->_icloudBackupProgress;
  else
    icloudBackupProgress = 0.0199999996;
  if (a3 || (-[ICQBackupStatusView progress](self->_backupStatusView, "progress"), icloudBackupProgress >= v5))
    -[ICQBackupStatusView setBackupProgress:timeIntervalRemaining:](self->_backupStatusView, "setBackupProgress:timeIntervalRemaining:", icloudBackupProgress, (double)(60 * self->_estimateTimeRemaining));
}

- (void)setLastBackupDateString:(id)a3
{
  -[ICQBackupStatusView setLastBackupText:](self->_backupStatusView, "setLastBackupText:", a3);
  -[ICQBackupController beginUpdates](self, "beginUpdates");
  -[ICQBackupController endUpdates](self, "endUpdates");
}

- (id)dateStringOfLatestBackup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_24E400750, CFSTR("Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD1500];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "rangeOfString:", CFSTR("H"));
  -[MBManager dateOfLastBackup](self->_backupManager, "dateOfLastBackup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "isTodayWithCalendar:", v12);

    if (v13 && v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "setTimeStyle:", 1);
      objc_msgSend(v11, "setDateStyle:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("en_US"));

      objc_msgSend(v11, "setDoesRelativeDateFormatting:", 1);
      if (v16)
      {
        objc_msgSend(v11, "setDateStyle:", 1);
        v17 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v17, "setTimeStyle:", 1);
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LAST_BACKUP_DATE_AT_TIME"), &stru_24E400750, CFSTR("Backup"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringFromDate:", v10);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringFromDate:", v10);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v20, v21, v22);
        v23 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v21;
LABEL_9:

        v5 = (void *)v23;
        goto LABEL_10;
      }
      objc_msgSend(v11, "setDateStyle:", 3);
      objc_msgSend(v11, "setTimeStyle:", 1);
      objc_msgSend(v11, "setFormattingContext:", 1);
    }
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LAST_BACKUP_DATE_OR_TIME"), &stru_24E400750, CFSTR("Backup"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringWithFormat:", v19, v20);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)updateLastBackupDateInvalidatePrevious:(BOOL)a3
{
  uint64_t v4;
  NSObject *backup_state_queue;
  _QWORD v6[5];
  _QWORD block[5];

  v4 = MEMORY[0x24BDAC760];
  if (a3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  backup_state_queue = self->_backup_state_queue;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_2;
  v6[3] = &unk_24E3F3610;
  v6[4] = self;
  dispatch_async(backup_state_queue, v6);
}

void __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETERMINING_LAST_BACKUP"), &stru_24E400750, CFSTR("Backup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setLastBackupDateString:", v2);

}

void __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dateStringOfLatestBackup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_3;
  v4[3] = &unk_24E3F34D8;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

uint64_t __62__ICQBackupController_updateLastBackupDateInvalidatePrevious___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLastBackupDateString:", *(_QWORD *)(a1 + 40));
}

- (void)updateLastBackupDate
{
  -[ICQBackupController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 0);
}

- (id)_backgroundRestoreInfoText:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned int v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", objc_msgSend(v3, "bytesRemaining"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = objc_msgSend(v4, "dataClassesRemaining");
    v8 = (v7 >> 5) & 1;
    if ((v7 & 0x20) != 0)
      objc_msgSend(v6, "addObject:", CFSTR("APPDATA"));
    if ((objc_msgSend(v4, "dataClassesRemaining") & 1) != 0)
    {
      objc_msgSend(v6, "addObject:", CFSTR("PHOTOS"));
      v8 = 1;
    }
    if ((objc_msgSend(v4, "dataClassesRemaining") & 0x10) != 0)
    {
      objc_msgSend(v6, "addObject:", CFSTR("MESSAGES"));
      v8 = 1;
    }
    if ((objc_msgSend(v4, "dataClassesRemaining") & 4) != 0)
    {
      objc_msgSend(v6, "addObject:", CFSTR("RINGTONES"));
      v8 = 1;
    }
    if ((objc_msgSend(v4, "dataClassesRemaining") & 8) != 0)
      objc_msgSend(v6, "addObject:", CFSTR("MEDIA"));
    if ((objc_msgSend(v4, "dataClassesRemaining") & 2) != 0)
      objc_msgSend(v6, "addObject:", CFSTR("BOOKS"));
    if ((objc_msgSend(v4, "dataClassesRemaining") & 0x40) != 0)
    {
      objc_msgSend(v6, "addObject:", CFSTR("FILES"));
      v8 = 1;
    }
    if (!objc_msgSend(v6, "count"))
    {
      if (!objc_msgSend(v4, "bytesRemaining"))
      {
        v16 = 0;
        v19 = &stru_24E400750;
        goto LABEL_40;
      }
      v20 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("RESTORE_IN_PROGRESS"), &stru_24E400750, CFSTR("Backup"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v20, "initWithFormat:", v22, v5);

      v18 = 0;
      if (v16)
      {
LABEL_37:
        objc_msgSend(&stru_24E400750, "stringByAppendingString:", v16);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
LABEL_40:

          goto LABEL_41;
        }
LABEL_38:
        -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", CFSTR(" "));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "stringByAppendingString:", v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_40;
      }
LABEL_30:
      v19 = &stru_24E400750;
      if (!v18)
        goto LABEL_40;
      goto LABEL_38;
    }
    v9 = (void *)objc_msgSend(CFSTR("RESTORING"), "mutableCopy");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "appendFormat:", CFSTR("_%@"), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v9, &stru_24E400750, CFSTR("Backup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((unint64_t)objc_msgSend(v4, "bytesRemaining") > 0xF423F)
      {
        if (!objc_msgSend(v4, "bytesRemaining"))
        {
          v18 = 0;
LABEL_36:

          if (v16)
            goto LABEL_37;
          goto LABEL_30;
        }
        v25 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("BYTES_REMAINING"), &stru_24E400750, CFSTR("Backup"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v25, "initWithFormat:", v26, v5);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LESS_THAN_1MB_REMAINING"), &stru_24E400750, CFSTR("Backup"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RESTORING_PERIOD"), &stru_24E400750, CFSTR("Backup"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v16 = (void *)v24;
    }

    goto LABEL_36;
  }
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)_updateToBackupState:(int)a3 backupError:(id)a4 progress:(float)a5 timeRemaining:(unint64_t)a6 restoreStateInfo:(id)a7 backgroundRestoreInfo:(id)a8 backupEnabled:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t *v21;
  NSObject *v22;
  PSSpecifier *backupNowButton;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  PSSpecifier *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  unsigned int v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  PSSpecifier *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  ICQBackupStatusView *backupStatusView;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  _BOOL4 v59;
  _BOOL4 v60;
  NSObject *v61;
  NSObject *v62;
  PSSpecifier *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  PSSpecifier *backupOverCellularSwitch;
  unsigned int v76;
  id v77;
  id v78;
  _BOOL4 v79;
  void *v80;
  unsigned int v81;
  id v82;
  uint8_t buf[4];
  id v84;
  uint64_t v85;

  v9 = a9;
  v85 = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a7;
  v82 = a8;
  -[ICQBackupStatusView backupError](self->_backupStatusView, "backupError");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || v18)
  {

  }
  else if (objc_msgSend(v16, "code") != 202)
  {
    _ICQGetLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v16;
      _os_log_impl(&dword_21F2CC000, v19, OS_LOG_TYPE_DEFAULT, "Setting error from backup state: %@", buf, 0xCu);
    }

    -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", v16);
  }
  self->_backupState = a3;
  self->_backupEnabled = v9;
  -[ICQBackupController specifierForID:](self, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (uint64_t *)MEMORY[0x24BE75A18];
  v78 = v16;
  v79 = v9;
  v80 = (void *)v20;
  if (a3 > 6)
  {
    _ICQGetLogSystem();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = a3;
      _os_log_impl(&dword_21F2CC000, v33, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }

    ICQUSLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = a3;
      _os_log_impl(&dword_21F2CC000, v34, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }
    v76 = a3;

    v35 = *v21;
    -[PSSpecifier propertyForKey:](self->_backupNowButton, "propertyForKey:", *v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v36, "BOOLValue");

    objc_msgSend(v80, "propertyForKey:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v37, "BOOLValue");

  }
  else
  {
    if (((1 << a3) & 0x39) != 0)
    {
      v76 = a3;
LABEL_11:
      if (self->_backupNowButton)
      {
        _ICQGetLogSystem();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v22, OS_LOG_TYPE_DEFAULT, "Setting backup now button as backup now button", buf, 2u);
        }

        backupNowButton = self->_backupNowButton;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("BACKUP_NOW"), &stru_24E400750, CFSTR("Backup"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setName:](backupNowButton, "setName:", v25);

        -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_beginBackup_);
      }
      if (-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
      {
        v26 = 1;
        v27 = v9;
      }
      else
      {
        ICQUSLogForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21F2CC000, v32, OS_LOG_TYPE_DEFAULT, "Network does not support backup - backup button disabled", buf, 2u);
        }

        v27 = 0;
        v26 = 1;
      }
      goto LABEL_31;
    }
    if (((1 << a3) & 6) == 0)
    {
      if (self->_backupCancelled)
      {
        -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
        v76 = 0;
      }
      else
      {
        v76 = 6;
      }
      goto LABEL_11;
    }
    v76 = a3;
    if (self->_backupNowButton)
    {
      _ICQGetLogSystem();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v28, OS_LOG_TYPE_DEFAULT, "Setting backup now button as cancel button", buf, 2u);
      }

      v29 = self->_backupNowButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CANCEL_BACKUP"), &stru_24E400750, CFSTR("Backup"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v29, "setName:", v31);

      -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_cancelBackup_);
    }
    self->_estimateTimeRemaining = a6;
    self->_icloudBackupProgress = a5;
    v26 = 1;
    -[ICQBackupController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 1);
    v27 = 1;
  }
LABEL_31:
  v77 = v17;
  v81 = objc_msgSend(v17, "state");
  v38 = v81 - 1;
  if (v81 - 1 > 1)
  {
    if (-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
    {
      -[ICQBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", 0);
    }
    else
    {
      backupStatusView = self->_backupStatusView;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", v56, &stru_24E400750, CFSTR("Backup"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQBackupStatusView setFooterText:](backupStatusView, "setFooterText:", v57);

    }
  }
  else
  {
    v27 = !self->_backupCancelled;
    if (self->_backupCancelled)
    {
      ICQUSLogForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v39, OS_LOG_TYPE_DEFAULT, "Backup cancelled - backup button disabled", buf, 2u);
      }

    }
    ICQUSLogForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v81 == 1;
      _os_log_impl(&dword_21F2CC000, v40, OS_LOG_TYPE_DEFAULT, "restoreState starting: %d", buf, 8u);
    }

    ICQUSLogForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v81 == 2;
      _os_log_impl(&dword_21F2CC000, v41, OS_LOG_TYPE_DEFAULT, "restoreState running: %d", buf, 8u);
    }

    ICQUSLogForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v42, OS_LOG_TYPE_DEFAULT, "Disabling Backup Switch", buf, 2u);
    }

    if (self->_backupNowButton)
    {
      _ICQGetLogSystem();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v43, OS_LOG_TYPE_DEFAULT, "Setting backup now button as stop restoring button", buf, 2u);
      }

      v44 = self->_backupNowButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("STOP_RESTORING"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", v46, &stru_24E400750, CFSTR("Backup"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v44, "setName:", v47);

      -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_cancelRestore_);
    }
    if (-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
    {
      if (self->_thermalSupportsBackup)
        v48 = CFSTR("DEVICE_IS_BEING_RESTORED");
      else
        v48 = CFSTR("DEVICE_RESTORE_PAUSED_THERMAL");
    }
    else
    {
      SFLocalizableWAPIStringKeyForKey();
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", v50, &stru_24E400750, CFSTR("Backup"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQBackupController _backgroundRestoreInfoText:](self, "_backgroundRestoreInfoText:", v82);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v51, v52);
      v53 = objc_claimAutoreleasedReturnValue();

      v51 = (void *)v53;
    }
    -[ICQBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", v51);

    v26 = 0;
  }
  v58 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  v59 = -[ICQBackupController policyPreventsBackup](self, "policyPreventsBackup");
  v60 = v59;
  if ((v58 & 1) != 0 || v59)
  {
    ICQUSLogForCategory(0);
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v58;
      _os_log_impl(&dword_21F2CC000, v61, OS_LOG_TYPE_DEFAULT, "Store Demo Mode Enabled: %d", buf, 8u);
    }

    ICQUSLogForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v84) = v60;
      _os_log_impl(&dword_21F2CC000, v62, OS_LOG_TYPE_DEFAULT, "Policy Prevents Backup: %d", buf, 8u);
    }

    v26 = 0;
    v27 = 0;
  }
  v63 = self->_backupNowButton;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = *MEMORY[0x24BE75A18];
  -[PSSpecifier setProperty:forKey:](v63, "setProperty:forKey:", v64, *MEMORY[0x24BE75A18]);

  ICQUSLogForCategory(0);
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v27;
    _os_log_impl(&dword_21F2CC000, v66, OS_LOG_TYPE_DEFAULT, "Backup Button Enabled: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", v67, v65);

  ICQUSLogForCategory(0);
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v26;
    _os_log_impl(&dword_21F2CC000, v68, OS_LOG_TYPE_DEFAULT, "BackupOverCellular Switch Enabled: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v26);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setProperty:forKey:", v69, v65);

  ICQUSLogForCategory(0);
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v84) = v26;
    _os_log_impl(&dword_21F2CC000, v70, OS_LOG_TYPE_DEFAULT, "Backup Switch Enabled: %d", buf, 8u);
  }

  -[ICQBackupController beginUpdates](self, "beginUpdates");
  v71 = -[ICQBackupController indexOfSpecifier:](self, "indexOfSpecifier:", self->_backupNowButton);
  if (v38 < 2 || v79 || v71 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v79)
    {
      v73 = v77;
      if (v71 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_85:
        -[ICQBackupController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_backupOverCellularSwitch, 1);
        -[ICQBackupController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_backupNowButton, 1);
LABEL_86:
        v72 = v78;
        v74 = v76;
        goto LABEL_87;
      }
    }
    else
    {
      v73 = v77;
      if (v38 > 1 || v71 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_85;
    }
    backupOverCellularSwitch = (PSSpecifier *)v80;
    if (self->_isAutoBackupOnCellularAllowed)
    {
      -[ICQBackupController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", self->_backupOverCellularSpecifiers, v80, 1);
      backupOverCellularSwitch = self->_backupOverCellularSwitch;
    }
    -[ICQBackupController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", self->_backupNowSpecifiers, backupOverCellularSwitch, 1);
    -[ICQBackupStatusView setAlpha:](self->_backupStatusView, "setAlpha:", 1.0);
    goto LABEL_86;
  }
  -[ICQBackupController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_backupNowSpecifiers, 1);
  v73 = v77;
  v72 = v78;
  v74 = v76;
  if (self->_isAutoBackupOnCellularAllowed)
    -[ICQBackupController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_backupOverCellularSpecifiers, 1);
LABEL_87:
  -[ICQBackupController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v80, 1);
  -[ICQBackupStatusView updateViewsForBackupState:restoreState:enabled:](self->_backupStatusView, "updateViewsForBackupState:restoreState:enabled:", v74, v81, v79);
  -[ICQBackupController endUpdates](self, "endUpdates");

}

- (void)_updateToBackupState:(id)a3 restoreState:(id)a4 backgroundRestoreState:(id)a5 backupEnabled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  double v17;
  id v18;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_msgSend(v12, "state");
  objc_msgSend(v12, "error");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "progress");
  v15 = v14;
  v16 = objc_msgSend(v12, "estimatedTimeRemaining");

  LODWORD(v17) = v15;
  -[ICQBackupController _updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:](self, "_updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:", v13, v18, v16, v11, v10, v6, v17);

}

- (void)updateBusyState
{
  int backupState;
  NSObject *backup_state_queue;
  _QWORD v5[5];
  id v6;
  int v7;
  id location;

  backupState = self->_backupState;
  objc_initWeak(&location, self);
  backup_state_queue = self->_backup_state_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__ICQBackupController_updateBusyState__block_invoke;
  v5[3] = &unk_24E3F4A20;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v7 = backupState;
  dispatch_async(backup_state_queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__ICQBackupController_updateBusyState__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "isBackupEnabled");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "backupState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "restoreState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "backgroundRestoreInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    v22 = "-[ICQBackupController updateBusyState]_block_invoke";
    v23 = 1024;
    v24 = v4;
    v25 = 1024;
    v26 = v9;
    v27 = 1024;
    v28 = objc_msgSend(v5, "state");
    v29 = 1024;
    v30 = objc_msgSend(v6, "state");
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "%s, isBackupEnabled: %d, entryState: %d, backupState: %d, restoreState: %d", buf, 0x24u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __38__ICQBackupController_updateBusyState__block_invoke_507;
  v14[3] = &unk_24E3F49F8;
  objc_copyWeak(&v18, v2);
  v10 = *(_QWORD *)(a1 + 32);
  v19 = *(_DWORD *)(a1 + 48);
  v14[4] = v10;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v20 = v4;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

  objc_destroyWeak(&v18);
}

void __38__ICQBackupController_updateBusyState__block_invoke_507(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1384) == *(_DWORD *)(a1 + 72))
    {
      objc_msgSend(WeakRetained, "_updateToBackupState:restoreState:backgroundRestoreState:backupEnabled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 76));
    }
    else
    {
      _ICQGetLogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1384);
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Skipping update, current backup state: %d", (uint8_t *)v6, 8u);
      }

    }
  }

}

- (void)cancelRestore:(id)a3
{
  NSObject *v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[ICQBackupController cancelRestore:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s, presenting confirmation alert", buf, 0xCu);
  }

  self->_backupCancelled = 1;
  -[ICQBackupController updateBusyState](self, "updateBusyState");
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("STOP_RESTORING_QUESTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_24E400750, CFSTR("Backup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL_RESTORE_WARNING"), &stru_24E400750, CFSTR("Backup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DONT_STOP"), &stru_24E400750, CFSTR("Backup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __37__ICQBackupController_cancelRestore___block_invoke;
  v22[3] = &unk_24E3F4130;
  v22[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("STOP"), &stru_24E400750, CFSTR("Backup"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __37__ICQBackupController_cancelRestore___block_invoke_2;
  v21[3] = &unk_24E3F4130;
  v21[4] = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v20);

  -[ICQBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __37__ICQBackupController_cancelRestore___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1448) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateBusyState");
}

void __37__ICQBackupController_cancelRestore___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_cancelRestore___block_invoke_3;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __37__ICQBackupController_cancelRestore___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Cancel restore confirmed", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "cancelRestore");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ICQBackupController_cancelRestore___block_invoke_516;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __37__ICQBackupController_cancelRestore___block_invoke_516(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1448) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateBusyState");
}

- (void)cancelBackup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Cancel backup", buf, 2u);
  }

  self->_backupCancelled = 1;
  self->_currentSyncState = 0;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__ICQBackupController_cancelBackup___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v5, block);

  -[ICQBackupController updateBusyState](self, "updateBusyState");
}

uint64_t __36__ICQBackupController_cancelBackup___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSync");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "cancel");
}

- (void)startBackup
{
  double v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  self->_backupCancelled = 0;
  -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  self->_estimateTimeRemaining = -1;
  self->_icloudBackupProgress = 0.0;
  -[ICQBackupController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 1);
  self->_finishBackupExecuted = 0;
  self->_icloudSyncProgress = 0.0;
  -[ICQBackupStatusView setSyncErrors:](self->_backupStatusView, "setSyncErrors:", 0);
  self->_currentSyncState = 1;
  LODWORD(v3) = 0;
  -[ICQBackupController _updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:](self, "_updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:", 1, 0, -1, 0, 0, 1, v3);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__ICQBackupController_startBackup__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v4, block);

  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Starting iMessage periodic sync", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE502B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPeriodicSync");

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getHKHealthStoreClass_softClass;
  v20 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    *(_QWORD *)buf = v5;
    v13 = 3221225472;
    v14 = __getHKHealthStoreClass_block_invoke;
    v15 = &unk_24E3F3868;
    v16 = &v17;
    __getHKHealthStoreClass_block_invoke((uint64_t)buf);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "forceCloudSyncWithOptions:completion:", 0, &__block_literal_global_523);

}

void __34__ICQBackupController_startBackup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  ICQUSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Start icloud sync", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSync");

  ICQUSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Begin backup", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1464))
    objc_msgSend(MEMORY[0x24BE66C38], "expensiveCellularAccess");
  else
    objc_msgSend(MEMORY[0x24BE66C38], "inexpensiveCellularAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellularAccess:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1376);
  v15 = 0;
  v8 = objc_msgSend(v7, "startBackupWithOptions:error:", v5, &v15);
  v9 = v15;
  if (v8)
  {
    ICQUSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "Backup begin succeed", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelSync");

    ICQUSLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Error starting backup: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__ICQBackupController_startBackup__block_invoke_519;
    block[3] = &unk_24E3F34D8;
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __34__ICQBackupController_startBackup__block_invoke_519(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setBackupError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateBusyState");
}

- (void)_showAlertForExpensiveCellular
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Failed to fetch the Interface Cost Expensive setting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __53__ICQBackupController__showAlertForExpensiveCellular__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1424));
}

uint64_t __53__ICQBackupController__showAlertForExpensiveCellular__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proceedWithBackup");
}

- (void)beginBackup:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ICQBackupController beginBackup:]";
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCellEnabled:", 0);
  -[ICQBackupController prepareAlertForBackupDisabledDomainAndShow:](self, "prepareAlertForBackupDisabledDomainAndShow:", 1);
}

- (void)updateBackupFinishState
{
  if (!self->_finishBackupExecuted)
  {
    self->_finishBackupExecuted = 1;
    -[ICQBackupController updateBusyState](self, "updateBusyState");
    if (self->_updateBackupState == 1)
      -[ICQBackupController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 1);
    else
      -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
    self->_updateBackupState = 0;
  }
}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__ICQBackupController_syncCompletedWithErrors___block_invoke;
  v6[3] = &unk_24E3F34D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __47__ICQBackupController_syncCompletedWithErrors___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  ICQUSLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync complete get called", (uint8_t *)&v9, 2u);
  }

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1500) == 1)
  {
    v3 = *(void **)(a1 + 40);
    if (v3 && objc_msgSend(v3, "count"))
    {
      ICQUSLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Got some icloud sync errors: %@", (uint8_t *)&v9, 0xCu);
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1500) = 3;
      v6 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      ICQUSLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "iCloud sync complete with no error", (uint8_t *)&v9, 2u);
      }

      v6 = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1500) = 2;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setSyncErrors:", v6);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1504))
    {
      ICQUSLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "We have already completed backup", (uint8_t *)&v9, 2u);
      }

    }
  }
}

- (void)syncProgress:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__ICQBackupController_syncProgress___block_invoke;
  v3[3] = &unk_24E3F41B8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

double __36__ICQBackupController_syncProgress___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1500) == 1)
  {
    ICQUSLogForCategory(0);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync reported progress: %f", (uint8_t *)&v5, 0xCu);
    }

    result = *(double *)(a1 + 40);
    *(double *)(*(_QWORD *)(a1 + 32) + 1520) = result;
  }
  return result;
}

- (void)showPopUpAlertForBackupDisabledApps
{
  id PSGBackupUtilsClass_0;
  PSGBackupDisabledAppsInfo *backupDisabledAppsInfo;
  _QWORD v5[5];

  PSGBackupUtilsClass_0 = getPSGBackupUtilsClass_0();
  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__ICQBackupController_showPopUpAlertForBackupDisabledApps__block_invoke;
  v5[3] = &unk_24E3F4A68;
  v5[4] = self;
  objc_msgSend(PSGBackupUtilsClass_0, "configureAlertMessageOfType:AndTitleForBackUpDisabledApps:completion:", 0, backupDisabledAppsInfo, v5);
}

uint64_t __58__ICQBackupController_showPopUpAlertForBackupDisabledApps__block_invoke(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "showAlertForBackupDisabledItemsWithTitle:andMessage:");
  else
    return objc_msgSend(v2, "_showAlertForExpensiveCellular");
}

- (void)showAlertForBackupDisabledItemsWithTitle:(id)a3 andMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  v7 = a4;
  -[ICQBackupController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PSSpecifier propertyForKey:](self->_backupNowButton, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCellEnabled:", 1);

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBackupController manageStorageAction](self, "manageStorageAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v12);

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24E400750, CFSTR("Backup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __75__ICQBackupController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke;
    v17[3] = &unk_24E3F4130;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v16);

    -[ICQBackupController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }

}

uint64_t __75__ICQBackupController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showAlertForExpensiveCellular");
}

- (void)proceedWithBackup
{
  void *v3;

  -[PSSpecifier propertyForKey:](self->_backupNowButton, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCellEnabled:", 1);

  -[ICQBackupController startBackup](self, "startBackup");
}

- (id)manageStorageAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v3 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SETTINGS"), &stru_24E400750, CFSTR("Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ICQBackupController_manageStorageAction__block_invoke;
  v8[3] = &unk_24E3F4130;
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:style:handler:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __42__ICQBackupController_manageStorageAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "propertyForKey:", *MEMORY[0x24BE75D18]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCellEnabled:", 1);

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/CURRENT_DEVICE_BACKUP"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (void)managerDidFinishBackup:(id)a3
{
  NSObject *v5;
  int currentSyncState;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  void *v10;
  int v11;
  const char *Name;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 1);
  currentSyncState = self->_currentSyncState;
  ICQUSLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (currentSyncState == 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      v9 = "Backup finished but iCloud sync not finished";
LABEL_8:
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 2u);
    }
  }
  else if (v8)
  {
    LOWORD(v11) = 0;
    v9 = "Backup and iCloud sync both finished";
    goto LABEL_8;
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("BackupInfoDidChange"), 0);

}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQBackupController manager:didFailRestoreWithError:].cold.1();

  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");

}

- (void)managerDidFinishRestore:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Restore finished", v5, 2u);
  }

  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)managerDidCancelRestore:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Restore canceled", v5, 2u);
  }

  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)manager:(id)a3 didFailBackupWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  ICQUSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Failed backup: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_currentSyncState = 3;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  -[ICQBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", v5);
  -[ICQBackupController updateBusyState](self, "updateBusyState");

}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  NSObject *v8;
  double v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  ICQUSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Backup progress: %f", (uint8_t *)&v10, 0xCu);
  }

  self->_icloudBackupProgress = v9;
  self->_estimateTimeRemaining = a5;
  -[ICQBackupController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 0);
  if ((self->_backupState - 1) >= 2)
    -[ICQBackupController updateBusyState](self, "updateBusyState");
}

- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQBackupController managerDidUpdateBackgroundRestoreProgress:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQBackupController updateBusyState](self, "updateBusyState");
}

- (void)manager:(id)a3 didSetBackupEnabled:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ICQBackupController manager:didSetBackupEnabled:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  -[ICQBackupController updateBusyState](self, "updateBusyState");
  -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  NSObject *v4;
  int currentSyncState;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  if ((self->_backupState - 1) <= 1)
  {
    ICQUSLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backup service", buf, 2u);
    }

    currentSyncState = self->_currentSyncState;
    ICQUSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (currentSyncState == 1)
    {
      if (v7)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "We are still syncing with iCloud", v11, 2u);
      }

      if (!self->_updateBackupState)
      {
        ICQUSLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Backup not finished before losing connection", v10, 2u);
        }

        self->_updateBackupState = 2;
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "We have finished icloud sync", v9, 2u);
      }

      self->_updateBackupState = 0;
      self->_finishBackupExecuted = 1;
    }
    -[ICQBackupController updateBusyState](self, "updateBusyState");
    -[ICQBackupController updateLastBackupDate](self, "updateLastBackupDate");
  }
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v14, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(v7, "specifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "count");

    if (!v13)
    {
      -[ICQBackupController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v8, 1);
      goto LABEL_9;
    }
    objc_msgSend(v7, "specifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQBackupController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v8, v12, 1);
  }
  else
  {
    -[ICQBackupController addSpecifiersFromArray:](self, "addSpecifiersFromArray:", v11);
  }

LABEL_9:
}

- (int)currentSyncState
{
  return self->_currentSyncState;
}

- (void)setCurrentSyncState:(int)a3
{
  self->_currentSyncState = a3;
}

- (void)setCloudSyncClient:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncClient, a3);
}

- (int)updateBackupState
{
  return self->_updateBackupState;
}

- (void)setUpdateBackupState:(int)a3
{
  self->_updateBackupState = a3;
}

- (BOOL)finishBackupExecuted
{
  return self->_finishBackupExecuted;
}

- (void)setFinishBackupExecuted:(BOOL)a3
{
  self->_finishBackupExecuted = a3;
}

- (double)icloudSyncProgress
{
  return self->_icloudSyncProgress;
}

- (void)setIcloudSyncProgress:(double)a3
{
  self->_icloudSyncProgress = a3;
}

- (double)icloudBackupProgress
{
  return self->_icloudBackupProgress;
}

- (void)setIcloudBackupProgress:(double)a3
{
  self->_icloudBackupProgress = a3;
}

- (int64_t)estimateTimeRemaining
{
  return self->_estimateTimeRemaining;
}

- (void)setEstimateTimeRemaining:(int64_t)a3
{
  self->_estimateTimeRemaining = a3;
}

- (PSGBackupDisabledAppsInfo)backupDisabledAppsInfo
{
  return self->_backupDisabledAppsInfo;
}

- (void)setBackupDisabledAppsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_backupDisabledAppsInfo, a3);
}

- (BOOL)isFetchingDomainInfo
{
  return self->_isFetchingDomainInfo;
}

- (void)setIsFetchingDomainInfo:(BOOL)a3
{
  self->_isFetchingDomainInfo = a3;
}

- (BOOL)needToShowPopupAlertForBackup
{
  return self->_needToShowPopupAlertForBackup;
}

- (void)setNeedToShowPopupAlertForBackup:(BOOL)a3
{
  self->_needToShowPopupAlertForBackup = a3;
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (void)setPathEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_pathEvaluator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_backupDisabledAppsInfo, 0);
  objc_storeStrong((id *)&self->_cloudSyncClient, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backup_state_queue, 0);
  objc_storeStrong((id *)&self->_isExpensiveCellular, 0);
  objc_storeStrong((id *)&self->_networkSupportsBackup, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSwitch, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupNowButton, 0);
  objc_storeStrong((id *)&self->_backupNowSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupStatusView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

- (void)specifiers
{
  __assert_rtn("-[ICQBackupController specifiers]", "ICQBackupController.m", 791, "switchGroup");
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Error setting up backup: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __62__ICQBackupController__persistBackupEnablementState_passcode___block_invoke_420_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Error starting iCloud Backup: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)setBackupEnabled:specifier:.cold.1()
{
  __assert_rtn("-[ICQBackupController setBackupEnabled:specifier:]", "ICQBackupController.m", 1103, "[specifier isKindOfClass:[PSConfirmationSpecifier class]]");
}

- (void)manager:didFailRestoreWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Restore failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
