@implementation ICSBackupViewController

- (ICSBackupViewController)initWithAccount:(id)a3
{
  id v5;
  ICSBackupViewController *v6;
  ICSBackupViewController *v7;
  id v8;
  void *v9;
  uint64_t v10;
  MBManager *backupManager;
  dispatch_queue_t v12;
  OS_dispatch_queue *backup_state_queue;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  NWPathEvaluator *pathEvaluator;
  _TtC14iCloudSettings22ICSAnalyticsController *v17;
  _TtC14iCloudSettings22ICSAnalyticsController *analyticsController;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICSBackupViewController;
  v6 = -[ICSBackupViewController init](&v20, sel_init);
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
    -[ICSBackupViewController _checkSupportForManualAndAutoBackupOnCellularWithCompletion:](v7, "_checkSupportForManualAndAutoBackupOnCellularWithCompletion:", 0);
    v15 = objc_opt_new();
    pathEvaluator = v7->_pathEvaluator;
    v7->_pathEvaluator = (NWPathEvaluator *)v15;

    -[NWPathEvaluator addObserver:forKeyPath:options:context:](v7->_pathEvaluator, "addObserver:forKeyPath:options:context:", v7, CFSTR("path"), 5, 0);
    -[ICSBackupViewController fetchIsBackupEnabled](v7, "fetchIsBackupEnabled");
    if (objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x24BE047F0])
      && (objc_msgSend(v5, "aa_isManagedAppleID") & 1) == 0)
    {
      -[ICSBackupViewController _fetchiCloudHomeData](v7, "_fetchiCloudHomeData");
    }
    v17 = -[ICSAnalyticsController initWithAccount:]([_TtC14iCloudSettings22ICSAnalyticsController alloc], "initWithAccount:", v5);
    analyticsController = v7->_analyticsController;
    v7->_analyticsController = v17;

  }
  return v7;
}

- (void)willUnlock
{
  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  PSGBackupDisabledAppsInfo *backupDisabledAppsInfo;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSBackupViewController;
  -[ICSBackupViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACKUPS_NAV_TITLE"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSBackupViewController setTitle:](self, "setTitle:", v5);

  backupDisabledAppsInfo = self->_backupDisabledAppsInfo;
  self->_backupDisabledAppsInfo = 0;

  -[ICSBackupViewController prepareAlertForBackupDisabledDomainAndShow:](self, "prepareAlertForBackupDisabledDomainAndShow:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)ICSBackupViewController;
  -[ICSBackupViewController viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  if ((-[ICSBackupViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEC7460], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteQuotaInfoChanged");

  }
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__ICSBackupViewController_viewDidAppear___block_invoke;
  v11[3] = &unk_251C60DC8;
  v11[4] = self;
  dispatch_async(v5, v11);

  -[ICSBackupViewController checkIfNetworkSupportsBackup](self, "checkIfNetworkSupportsBackup");
  -[ICSBackupViewController startListeningForThermalChanges](self, "startListeningForThermalChanges");
  -[ICSBackupViewController checkIfThermalSupportsBackup](self, "checkIfThermalSupportsBackup");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("settings-navigation://com.apple.Settings.AppleAccount/ICLOUD_SERVICE/BACKUP"));
  +[ICSDeviceExpertManager backupTitle](ICSDeviceExpertManager, "backupTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSDeviceExpertManager appleAccountTitle](ICSDeviceExpertManager, "appleAccountTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  +[ICSDeviceExpertManager iCloudTitle](ICSDeviceExpertManager, "iCloudTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSBackupViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.application-icon.icloud"), v7, v10, v6);

}

uint64_t __41__ICSBackupViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "syncBackupEnabled");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSBackupViewController;
  -[ICSBackupViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[ICSBackupViewController stopListeningForThermalChanges](self, "stopListeningForThermalChanges");
  self->_needToShowPopupAlertForBackup = 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[ICSBackupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  -[NWPathEvaluator removeObserver:forKeyPath:context:](self->_pathEvaluator, "removeObserver:forKeyPath:context:", self, CFSTR("path"), 0);
  -[ICSBackupViewController stopListeningForThermalChanges](self, "stopListeningForThermalChanges");
  -[MBManager setDelegate:](self->_backupManager, "setDelegate:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x24BE047F8], 0);
  v4.receiver = self;
  v4.super_class = (Class)ICSBackupViewController;
  -[ICSBackupViewController dealloc](&v4, sel_dealloc);
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
    v7[2] = __74__ICSBackupViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_251C616F8;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __74__ICSBackupViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
    -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
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
  uint64_t v9;
  NSNumber *v10;
  NSNumber *v11;
  NSObject *v12;
  NSNumber *v13;
  _QWORD v14[6];
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  NSNumber *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[ICSBackupViewController pathEvaluator](self, "pathEvaluator");
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
  v9 = 1;
  if ((objc_msgSend(v4, "usesInterfaceType:", 1) & 1) == 0)
  {
    if ((objc_msgSend(v4, "usesInterfaceType:", 3) & 1) != 0)
    {
      v9 = 1;
      goto LABEL_8;
    }
    if (objc_msgSend(v4, "usesInterfaceType:", 2))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isExpensive"));
      v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v11 = self->_isExpensiveCellular;
      self->_isExpensiveCellular = v10;

      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __55__ICSBackupViewController_checkIfNetworkSupportsBackup__block_invoke;
      v14[3] = &unk_251C61720;
      v14[4] = self;
      v14[5] = v7;
      v15 = 0;
      -[ICSBackupViewController _checkSupportForManualAndAutoBackupOnCellularWithCompletion:](self, "_checkSupportForManualAndAutoBackupOnCellularWithCompletion:", v14);
      goto LABEL_11;
    }
LABEL_7:
    v9 = 0;
  }
LABEL_8:
  LogSubsystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = self->_isExpensiveCellular;
    *(_DWORD *)buf = 134218498;
    v17 = v7;
    v18 = 2112;
    v19 = v13;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", buf, 0x1Cu);
  }

  -[ICSBackupViewController setNetworkSupportsBackup:](self, "setNetworkSupportsBackup:", v9);
LABEL_11:

}

uint64_t __55__ICSBackupViewController_checkIfNetworkSupportsBackup__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v7 = 134218498;
    v8 = v4;
    v9 = 2112;
    v10 = v3;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Network interfaceType: %ld. Expensive cellular: %@. Network supports backup: %d", (uint8_t *)&v7, 0x1Cu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setNetworkSupportsBackup:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1416));
}

- (void)_checkSupportForManualAndAutoBackupOnCellularWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  self->_isAutoBackupOnCellularAllowed = 0;
  self->_isManualBackupOnCellularAllowed = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke;
  v7[3] = &unk_251C61748;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)WeakRetained[173];
    v5 = v3[172];
    v14 = 0;
    v6 = objc_msgSend(v4, "backupOnCellularSupportWithAccount:error:", v5, &v14);
    v7 = v14;
    if (v7)
    {
      LogSubsystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_2();

    }
    else
    {
      *((_BYTE *)v3 + 1416) = v6 & 1;
      *((_BYTE *)v3 + 1417) = (v6 & 2) != 0;
    }
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((unsigned __int8 *)v3 + 1416);
      v11 = *((unsigned __int8 *)v3 + 1417);
      *(_DWORD *)buf = 67109376;
      v16 = v10;
      v17 = 1024;
      v18 = v11;
      _os_log_impl(&dword_24B4C1000, v9, OS_LOG_TYPE_DEFAULT, "ManualBackupOnCellularAllowed: %d. AutoBackupOnCellularAllowed: %d", buf, 0xEu);
    }

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_240;
    v12[3] = &unk_251C60E68;
    v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
  else
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_1(a1, v7);
  }

}

uint64_t __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
    handler[2] = __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke;
    handler[3] = &unk_251C61770;
    objc_copyWeak(&v7, &location);
    handler[4] = self;
    notify_register_dispatch(v3, &self->_thermalNotificationToken, v4, handler);

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke(uint64_t a1, int token)
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
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = state64;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "received thermal pressure notification: %llu", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1432);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke_241;
    block[3] = &unk_251C61688;
    v9 = state64;
    v8 = WeakRetained;
    dispatch_async(v6, block);

  }
}

uint64_t __58__ICSBackupViewController_startListeningForThermalChanges__block_invoke_241(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  uint8_t buf[2];

  v2 = *(_QWORD *)(a1 + 40);
  LogSubsystem();
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
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
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
  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
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
      -[ICSBackupViewController setThermalSupportsBackup:](self, "setThermalSupportsBackup:", v3 < 0x14);
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
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BACKUP_HEADER_TITLE"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BACKUPS_INFO_LEARN_MORE"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, ICQUILearnMoreTextKey);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("BACKUP_HELP_PAGE_URL"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, ICQUILearnMoreLinkKey);

  if (!-[ICSBackupViewController policyPreventsBackup](self, "policyPreventsBackup"))
  {
    LogSubsystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "Backup is allowed, setting backup info text", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUPS_INFO_TEXT"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", v14, &stru_251C6B070, CFSTR("Localizable-Backup"));
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
    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
    -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ICSBackupViewController;
    -[ICSBackupViewController reloadSpecifiers](&v3, sel_reloadSpecifiers);
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
  ICSBackupStatusView *v30;
  ICSBackupStatusView *backupStatusView;
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
  AAUISpecifierProvider *v44;
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
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.iCloudQuotaUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSBackupViewController loadSpecifiersFromPlistName:target:bundle:](self, "loadSpecifiersFromPlistName:target:bundle:", CFSTR("Backup"), self, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUP_ENABLED_SWITCH"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_251C6B070, CFSTR("Localizable-Backup"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v10);

    v11 = *MEMORY[0x24BE75868];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v6, "specifierForID:", CFSTR("BACKUP_SWITCH_GROUP"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      -[ICSBackupViewController specifiers].cold.1();
    v13 = v12;
    objc_msgSend(v12, "setName:", 0);
    -[ICSBackupViewController _buildHeaderCardSpecifier](self, "_buildHeaderCardSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      LogSubsystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v59 = 1;
        _os_log_impl(&dword_24B4C1000, v15, OS_LOG_TYPE_DEFAULT, "Inserting header specifier for backup controller at index: %d", buf, 8u);
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
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_251C6B070, CFSTR("Localizable-Backup"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE75A68]);

      v20 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("BACKUP_OVER_CELLULAR_ENABLED_SWITCH"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_251C6B070, CFSTR("Localizable-Backup"));
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
        v30 = -[ICSBackupStatusView initWithSpecifier:]([ICSBackupStatusView alloc], "initWithSpecifier:", v29);
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
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("BACKUP_NOW"), &stru_251C6B070, CFSTR("Localizable-Backup"));
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
      v44 = (AAUISpecifierProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BEC7428]), "initWithAccount:presenter:", self->_account, self);
      v45 = self->_backupSpecifierProvider;
      self->_backupSpecifierProvider = v44;

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
    v6[2] = __70__ICSBackupViewController_prepareAlertForBackupDisabledDomainAndShow___block_invoke;
    v6[3] = &unk_251C61798;
    v6[4] = self;
    objc_msgSend(PSGBackupUtilsClass_0, "fetchBackupDisabledAppsWithBackupManager:completion:", backupManager, v6);
  }
}

void __70__ICSBackupViewController_prepareAlertForBackupDisabledDomainAndShow___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *v4;
  id v5;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1560), a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1513) = 0;
  v4 = *(_BYTE **)(a1 + 32);
  if (v4[1514])
  {
    objc_msgSend(v4, "showPopUpAlertForBackupDisabledApps");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1514) = 0;
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
  block[2] = __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(backup_state_queue, block);
}

void __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[5];
  char v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isBackupEnabled");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke_2;
  v3[3] = &unk_251C617C0;
  v4 = v2;
  v3[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __47__ICSBackupViewController_fetchIsBackupEnabled__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5 = 136315394;
    v6 = "-[ICSBackupViewController fetchIsBackupEnabled]_block_invoke_2";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "%s, Caching backup enabled: %d, reloading", (uint8_t *)&v5, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1421) = *(_BYTE *)(a1 + 40);
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
  if (-[ICSBackupViewController policyPreventsBackup](self, "policyPreventsBackup"))
  {
    LogSubsystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "Backup not enabled because policy prevents backup", (uint8_t *)&v7, 2u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[MBManager isBackupEnabled](self->_backupManager, "isBackupEnabled");
    LogSubsystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      backupManager = self->_backupManager;
      v7 = 136315650;
      v8 = "-[ICSBackupViewController isBackupEnabled]";
      v9 = 1024;
      v10 = v4;
      v11 = 2112;
      v12 = backupManager;
      _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "%s, returning: %d, backup manager: %@", (uint8_t *)&v7, 0x1Cu);
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
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    backupEnabled = self->_backupEnabled;
    v6 = 136315394;
    v7 = "-[ICSBackupViewController cachedIsBackupEnabledNumber]";
    v8 = 1024;
    v9 = backupEnabled;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v6, 0x12u);
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
  LogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[ICSBackupViewController _setBackupEnabled:passcode:]";
    v28 = 1024;
    v29 = v4;
    _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  if (v4)
  {
    -[ICSBackupViewController _persistBackupEnablementState:passcode:](self, "_persistBackupEnablementState:passcode:", 1, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DISABLE_WARNING_MESSAGE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_251C6B070, CFSTR("Localizable-Backup"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", 0, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DISABLE_CONFIRM"), &stru_251C6B070, CFSTR("Localizable-Backup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke;
    v23[3] = &unk_251C617E8;
    v23[4] = self;
    v25 = 0;
    v24 = v6;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 2, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v17);

    v18 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DISABLE_CANCEL"), &stru_251C6B070, CFSTR("Localizable-Backup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_300;
    v22[3] = &unk_251C61378;
    v22[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v21);

    -[ICSBackupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, &__block_literal_global_4);
  }

}

uint64_t __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Confirmed disable backup", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_persistBackupEnablementState:passcode:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_300(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "User cancelled disable backup", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1504), "sendBackupToggleEventWithActionType:", 2);
}

void __54__ICSBackupViewController__setBackupEnabled_passcode___block_invoke_301()
{
  NSObject *v0;
  uint8_t v1[16];

  LogSubsystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24B4C1000, v0, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for Turn off iCloud Backup", v1, 2u);
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
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  ICSBackupViewController *v24;
  id v25;
  _BYTE *v26;
  BOOL v27;
  _QWORD block[6];
  _BYTE buf[24];
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  LogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ICSBackupViewController _persistBackupEnablementState:passcode:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
  }

  -[ICSBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", 0);
  -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  if (!v4)
  {
    backupNowButton = self->_backupNowButton;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE75A18];
    -[PSSpecifier setProperty:forKey:](backupNowButton, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

    -[ICSBackupViewController reloadSpecifier:](self, "reloadSpecifier:", self->_backupNowButton);
    -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v10);
    -[ICSBackupViewController reloadSpecifier:](self, "reloadSpecifier:", self->_backupOverCellularSwitch);
  }
  -[ICSBackupViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInteractionEnabled:", 0);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = __Block_byref_object_copy__2;
  v31 = __Block_byref_object_dispose__2;
  v32 = objc_alloc_init(MEMORY[0x24BEBD898]);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAutoresizingMask:", 45);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFontSize:", 16);
  v13 = *(void **)(*(_QWORD *)&buf[8] + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURNING_ON_BACKUP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  else
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURNING_OFF_BACKUP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v15);

  v16 = dispatch_time(0, 1000000000);
  v17 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke;
  block[3] = &unk_251C61830;
  block[4] = self;
  block[5] = buf;
  dispatch_after(v16, MEMORY[0x24BDAC9B8], block);
  backup_state_queue = self->_backup_state_queue;
  v20 = v17;
  v21 = 3221225472;
  v22 = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2;
  v23 = &unk_251C61880;
  v24 = self;
  v27 = v4;
  v19 = v6;
  v25 = v19;
  v26 = buf;
  dispatch_async(backup_state_queue, &v20);
  -[ICSAnalyticsController sendBackupToggleEventWithActionType:](self->_analyticsController, "sendBackupToggleEventWithActionType:", 1, v20, v21, v22, v23, v24);

  _Block_object_dispose(buf, 8);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke(uint64_t a1)
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

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setBackupEnabled:", *(unsigned __int8 *)(a1 + 56));
  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1384);
    v19 = 0;
    v4 = objc_msgSend(v3, "setupBackupWithPasscode:error:", v2, &v19);
    v5 = v19;
    *((_BYTE *)v21 + 24) = v4;
    if (v5)
    {
      LogSubsystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2_cold_1();

    }
  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  if (*((_BYTE *)v21 + 24))
  {
    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setEnabled:forDataclass:", *(unsigned __int8 *)(a1 + 56), *MEMORY[0x24BDB4558]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376);
    v9 = (id *)(v14 + 5);
    obj = (id)v14[5];
    objc_msgSend(v7, "saveVerifiedAccount:error:", v8, &obj);
    objc_storeStrong(v9, obj);
    *((_BYTE *)v21 + 24) = v14[5] == 0;

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_308;
  v11[3] = &unk_251C61858;
  v10 = *(_QWORD *)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v10;
  v11[6] = &v20;
  v11[7] = &v13;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v20, 8);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_308(uint64_t a1)
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
  void *v17;
  void *v18;
  __CFString *v19;
  uint64_t v20;
  id v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];

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
  LogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_308_cold_1(a1, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("MBErrorDomain")))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code") == 300)
    {

    }
    else
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "code");

      if (v20 != 308)
      {
        v19 = CFSTR("ERROR_ENABLING_BACKUP_DETAILS");
        goto LABEL_15;
      }
    }
    v21 = objc_alloc_init(MEMORY[0x24BE04788]);
    v22 = objc_msgSend(v21, "airplaneMode");

    if (v22)
    {
      SFLocalizableWAPIStringKeyForKey();
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("ERROR_ENABLING_BACKUP_NETWORK");
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_251C6B070, CFSTR("Localizable-Backup"));
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v15 = (void *)v24;
    v17 = 0;
  }
  else
  {
    v19 = CFSTR("ERROR_ENABLING_BACKUP_DETAILS");
  }

LABEL_15:
  v25 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("ERROR_ENABLING_BACKUP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", v19, &stru_251C6B070, CFSTR("Localizable-Backup"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v27, v29, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_326;
  v35[3] = &unk_251C61378;
  v35[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v15, 1, v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAction:", v32);

  v34[0] = v31;
  v34[1] = 3221225472;
  v34[2] = __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_327;
  v34[3] = &unk_251C61378;
  v34[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v17, 0, v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAction:", v33);

  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v30, 1, 0);
}

uint64_t __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_326(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Reload specifier with specifier ID 'BACKUP_ENABLED_SWITCH'", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("BACKUP_ENABLED_SWITCH"), 1);
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_327(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Enabling backup with specifier ID 'BACKUP_ENABLED_SWITCH'", v5, 2u);
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
    LogSubsystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch BackupOnCellularEnabled: %@", buf, 0xCu);
    }

  }
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[ICSBackupViewController isBackupOverCellularEnabled]";
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", buf, 0x12u);
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
  LogSubsystem();
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
      _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
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

  -[ICSBackupViewController checkIfNetworkSupportsBackup](self, "checkIfNetworkSupportsBackup");
}

- (void)didAcceptEnteredPIN:(id)a3
{
  -[ICSBackupViewController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 1, a3);
}

- (void)didCancelEnteringPIN
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICSBackupViewController didCancelEnteringPIN]";
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ICSBackupViewController specifierForID:](self, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSBackupViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);

}

- (void)_enableBackupWithSpecifier:(id)a3
{
  -[ICSBackupViewController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 1, 0);
}

- (void)_disableBackupWithSpecifier:(id)a3
{
  -[ICSBackupViewController _setBackupEnabled:passcode:](self, "_setBackupEnabled:passcode:", 0, 0);
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
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICSBackupViewController _backupEnabledSwitchCancelled:]";
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[ICSBackupViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v4, 1);
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
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[ICSBackupViewController setBackupEnabled:specifier:]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "%s, enabled: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[ICSBackupViewController setBackupEnabled:specifier:].cold.1();
  -[ICSAnalyticsController sendBackupToggleEventWithActionType:](self->_analyticsController, "sendBackupToggleEventWithActionType:", 0);
  if (objc_msgSend(v6, "BOOLValue"))
    -[ICSBackupViewController _enableBackupWithSpecifier:](self, "_enableBackupWithSpecifier:", v7);
  else
    -[ICSBackupViewController _disableBackupWithSpecifier:](self, "_disableBackupWithSpecifier:", v7);

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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACKUP_HELP_PAGE_URL"), &stru_251C6B070, CFSTR("Localizable-Backup"));
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
  if (a3 || (-[ICSBackupStatusView progress](self->_backupStatusView, "progress"), icloudBackupProgress >= v5))
    -[ICSBackupStatusView setBackupProgress:timeIntervalRemaining:](self->_backupStatusView, "setBackupProgress:timeIntervalRemaining:", icloudBackupProgress, (double)(60 * self->_estimateTimeRemaining));
}

- (void)setLastBackupDateString:(id)a3
{
  -[ICSBackupStatusView setLastBackupText:](self->_backupStatusView, "setLastBackupText:", a3);
  -[ICSBackupViewController beginUpdates](self, "beginUpdates");
  -[ICSBackupViewController endUpdates](self, "endUpdates");
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
  BOOL v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_251C6B070, CFSTR("Localizable-Backup"));
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
    v13 = objc_msgSend(v10, "ics_isTodayWithCalendar:", v12);

    if (v13)
      v14 = v9 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v14 = 0;
    if (v14)
    {
      objc_msgSend(v11, "setTimeStyle:", 1);
      objc_msgSend(v11, "setDateStyle:", 0);
      v25 = (void *)MEMORY[0x24BDD17C8];
      v26 = (void *)MEMORY[0x24BDD1488];
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localeIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("en_US"));

      objc_msgSend(v11, "setDoesRelativeDateFormatting:", 1);
      if (v17)
      {
        objc_msgSend(v11, "setDateStyle:", 1);
        v18 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v18, "setTimeStyle:", 1);
        v19 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("LAST_BACKUP_DATE_AT_TIME"), &stru_251C6B070, CFSTR("Localizable-Backup"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringFromDate:", v10);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithFormat:", v21, v22, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v22;
LABEL_11:

        v5 = (void *)v24;
        goto LABEL_12;
      }
      objc_msgSend(v11, "setDateStyle:", 3);
      objc_msgSend(v11, "setTimeStyle:", 1);
      objc_msgSend(v11, "setFormattingContext:", 1);
      v25 = (void *)MEMORY[0x24BDD17C8];
      v26 = (void *)MEMORY[0x24BDD1488];
    }
    objc_msgSend(v26, "bundleForClass:", objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LAST_BACKUP_DATE_OR_TIME"), &stru_251C6B070, CFSTR("Localizable-Backup"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v20, v21);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

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
    block[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke;
    block[3] = &unk_251C60DC8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  backup_state_queue = self->_backup_state_queue;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_2;
  v6[3] = &unk_251C60DC8;
  v6[4] = self;
  dispatch_async(backup_state_queue, v6);
}

void __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETERMINING_LAST_BACKUP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setLastBackupDateString:", v2);

}

void __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dateStringOfLatestBackup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_3;
  v4[3] = &unk_251C61060;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

uint64_t __66__ICSBackupViewController_updateLastBackupDateInvalidatePrevious___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLastBackupDateString:", *(_QWORD *)(a1 + 40));
}

- (void)updateLastBackupDate
{
  -[ICSBackupViewController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 0);
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
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
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
        v19 = &stru_251C6B070;
        goto LABEL_40;
      }
      v20 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("RESTORE_IN_PROGRESS"), &stru_251C6B070, CFSTR("Localizable-Backup"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v20, "initWithFormat:", v22, v5);

      v18 = 0;
      if (v16)
      {
LABEL_37:
        objc_msgSend(&stru_251C6B070, "stringByAppendingString:", v16);
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
      v19 = &stru_251C6B070;
      if (!v18)
        goto LABEL_40;
      goto LABEL_38;
    }
    v29 = v5;
    v9 = (void *)objc_msgSend(CFSTR("RESTORING"), "mutableCopy");
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "appendFormat:", CFSTR("_%@"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v12);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v9, &stru_251C6B070, CFSTR("Localizable-Backup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = v29;
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
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("BYTES_REMAINING"), &stru_251C6B070, CFSTR("Localizable-Backup"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v25, "initWithFormat:", v26, v29);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LESS_THAN_1MB_REMAINING"), &stru_251C6B070, CFSTR("Localizable-Backup"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RESTORING_PERIOD"), &stru_251C6B070, CFSTR("Localizable-Backup"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v18 = 0;
      v16 = (void *)v24;
      v5 = v29;
    }

    goto LABEL_36;
  }
  v19 = 0;
LABEL_41:

  return v19;
}

- (void)_updateToBackupState:(int)a3 backupError:(id)a4 progress:(float)a5 timeRemaining:(unint64_t)a6 restoreStateInfo:(id)a7 backgroundRestoreInfo:(id)a8 backupEnabled:(BOOL)a9
{
  uint64_t v9;
  id v16;
  void *v17;
  NSObject *v18;
  uint64_t *v19;
  NSObject *v20;
  PSSpecifier *backupNowButton;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  PSSpecifier *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char *__ptr32 *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  PSSpecifier *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _BOOL4 isManualBackupOnCellularAllowed;
  ICSBackupStatusView *backupStatusView;
  void *v53;
  void *v54;
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
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  unsigned int v79;
  id v80;
  unsigned int v81;
  unsigned int v82;
  void *v83;
  unsigned int v84;
  id v85;
  id v86;
  uint8_t buf[4];
  id v88;
  uint64_t v89;

  v9 = a9;
  v89 = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v86 = a7;
  v85 = a8;
  -[ICSBackupStatusView backupError](self->_backupStatusView, "backupError");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || v17)
  {

  }
  else if (objc_msgSend(v16, "code") != 202)
  {
    LogSubsystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v88 = v16;
      _os_log_impl(&dword_24B4C1000, v18, OS_LOG_TYPE_DEFAULT, "Setting error from backup state: %@", buf, 0xCu);
    }

    -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", v16);
  }
  self->_backupState = a3;
  self->_backupEnabled = v9;
  -[ICSBackupViewController specifierForID:](self, "specifierForID:", CFSTR("BACKUP_ENABLED_SWITCH"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (uint64_t *)MEMORY[0x24BE75A18];
  v80 = v16;
  v82 = v9;
  if (a3 > 6)
  {
    LogSubsystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = a3;
      _os_log_impl(&dword_24B4C1000, v30, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }

    LogSubsystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = a3;
      _os_log_impl(&dword_24B4C1000, v31, OS_LOG_TYPE_DEFAULT, "Got an unknown state from backup manager: %i", buf, 8u);
    }
    v79 = a3;

    v32 = *v19;
    -[PSSpecifier propertyForKey:](self->_backupNowButton, "propertyForKey:", *v19);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v33, "BOOLValue");

    objc_msgSend(v83, "propertyForKey:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v34, "BOOLValue");

  }
  else
  {
    if (((1 << a3) & 0x39) != 0)
    {
LABEL_10:
      if (self->_backupNowButton)
      {
        LogSubsystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24B4C1000, v20, OS_LOG_TYPE_DEFAULT, "Setting backup now button as backup now button", buf, 2u);
        }

        backupNowButton = self->_backupNowButton;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("BACKUP_NOW"), &stru_251C6B070, CFSTR("Localizable-Backup"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifier setName:](backupNowButton, "setName:", v23);

        -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_beginBackup_);
      }
      v79 = a3;
      if (!-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
      {
        LogSubsystem();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24B4C1000, v24, OS_LOG_TYPE_DEFAULT, "Network does not support backup - backup button disabled", buf, 2u);
        }

        v9 = 0;
      }
      v25 = 1;
      goto LABEL_30;
    }
    if (((1 << a3) & 6) == 0)
    {
      if (self->_backupCancelled)
      {
        -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
        a3 = 0;
      }
      else
      {
        a3 = 6;
      }
      goto LABEL_10;
    }
    if (self->_backupNowButton)
    {
      LogSubsystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B4C1000, v26, OS_LOG_TYPE_DEFAULT, "Setting backup now button as cancel button", buf, 2u);
      }

      v27 = self->_backupNowButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL_BACKUP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v27, "setName:", v29);

      -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_cancelBackup_);
    }
    v79 = a3;
    self->_estimateTimeRemaining = a6;
    self->_icloudBackupProgress = a5;
    v25 = 1;
    -[ICSBackupViewController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 1);
    v9 = 1;
  }
LABEL_30:
  v84 = objc_msgSend(v86, "state");
  v81 = v84 - 1;
  if (v84 - 1 > 1)
  {
    if (-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
    {
      -[ICSBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", 0);
    }
    else
    {
      isManualBackupOnCellularAllowed = self->_isManualBackupOnCellularAllowed;
      backupStatusView = self->_backupStatusView;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      if (isManualBackupOnCellularAllowed)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", v54, &stru_251C6B070, CFSTR("Localizable-Backup"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSBackupStatusView setFooterText:](backupStatusView, "setFooterText:", v55);

      }
      else
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", v56, &stru_251C6B070, CFSTR("Localizable-Backup"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSBackupStatusView setFooterText:](backupStatusView, "setFooterText:", v57);

      }
    }
    v35 = &off_24B5E8000;
  }
  else
  {
    v9 = !self->_backupCancelled;
    v35 = &off_24B5E8000;
    if (self->_backupCancelled)
    {
      LogSubsystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B4C1000, v36, OS_LOG_TYPE_DEFAULT, "Backup cancelled - backup button disabled", buf, 2u);
      }

    }
    LogSubsystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = v84 == 1;
      _os_log_impl(&dword_24B4C1000, v37, OS_LOG_TYPE_DEFAULT, "restoreState starting: %d", buf, 8u);
    }

    LogSubsystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v88) = v84 == 2;
      _os_log_impl(&dword_24B4C1000, v38, OS_LOG_TYPE_DEFAULT, "restoreState running: %d", buf, 8u);
    }

    LogSubsystem();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v39, OS_LOG_TYPE_DEFAULT, "Disabling Backup Switch", buf, 2u);
    }

    if (self->_backupNowButton)
    {
      LogSubsystem();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B4C1000, v40, OS_LOG_TYPE_DEFAULT, "Setting backup now button as stop restoring button", buf, 2u);
      }

      v41 = self->_backupNowButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("STOP_RESTORING"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", v43, &stru_251C6B070, CFSTR("Localizable-Backup"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](v41, "setName:", v44);

      -[PSSpecifier setButtonAction:](self->_backupNowButton, "setButtonAction:", sel_cancelRestore_);
      v35 = &off_24B5E8000;
    }
    if (-[NSNumber BOOLValue](self->_networkSupportsBackup, "BOOLValue"))
    {
      if (self->_thermalSupportsBackup)
        v45 = CFSTR("DEVICE_IS_BEING_RESTORED");
      else
        v45 = CFSTR("DEVICE_RESTORE_PAUSED_THERMAL");
    }
    else
    {
      SFLocalizableWAPIStringKeyForKey();
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", v47, &stru_251C6B070, CFSTR("Localizable-Backup"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICSBackupViewController _backgroundRestoreInfoText:](self, "_backgroundRestoreInfoText:", v85);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n\n%@"), v48, v49);
      v50 = objc_claimAutoreleasedReturnValue();

      v48 = (void *)v50;
    }
    -[ICSBackupStatusView setFooterText:](self->_backupStatusView, "setFooterText:", v48);

    v25 = 0;
  }
  v58 = objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode");
  v59 = -[ICSBackupViewController policyPreventsBackup](self, "policyPreventsBackup");
  v60 = v59;
  if ((v58 & 1) != 0 || v59)
  {
    LogSubsystem();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = *((_QWORD *)v35 + 288);
      LODWORD(v88) = v58;
      _os_log_impl(&dword_24B4C1000, v61, OS_LOG_TYPE_DEFAULT, "Store Demo Mode Enabled: %d", buf, 8u);
    }

    LogSubsystem();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = *((_QWORD *)v35 + 288);
      LODWORD(v88) = v60;
      _os_log_impl(&dword_24B4C1000, v62, OS_LOG_TYPE_DEFAULT, "Policy Prevents Backup: %d", buf, 8u);
    }

    v25 = 0;
    v9 = 0;
  }
  v63 = self->_backupNowButton;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = *MEMORY[0x24BE75A18];
  -[PSSpecifier setProperty:forKey:](v63, "setProperty:forKey:", v64, *MEMORY[0x24BE75A18]);

  LogSubsystem();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((_QWORD *)v35 + 288);
    LODWORD(v88) = v9;
    _os_log_impl(&dword_24B4C1000, v66, OS_LOG_TYPE_DEFAULT, "Backup Button Enabled: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier setObject:forKeyedSubscript:](self->_backupOverCellularSwitch, "setObject:forKeyedSubscript:", v67, v65);

  LogSubsystem();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((_QWORD *)v35 + 288);
    LODWORD(v88) = v25;
    _os_log_impl(&dword_24B4C1000, v68, OS_LOG_TYPE_DEFAULT, "BackupOverCellular Switch Enabled: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v25);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setProperty:forKey:", v69, v65);

  LogSubsystem();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((_QWORD *)v35 + 288);
    LODWORD(v88) = v25;
    _os_log_impl(&dword_24B4C1000, v70, OS_LOG_TYPE_DEFAULT, "Backup Switch Enabled: %d", buf, 8u);
  }

  -[ICSBackupViewController beginUpdates](self, "beginUpdates");
  v71 = -[ICSBackupViewController indexOfSpecifier:](self, "indexOfSpecifier:", self->_backupNowButton);
  if (v81 < 2 || (v82 & 1) != 0 || v71 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v72 = v80;
    v73 = v79;
    if (((v82 & 1) != 0 || v81 <= 1) && v71 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v74 = (void *)objc_opt_new();
      v75 = v74;
      if (self->_isAutoBackupOnCellularAllowed && self->_backupOverCellularSpecifiers)
        objc_msgSend(v74, "addObjectsFromArray:");
      if (self->_backupEnabled && self->_backupTipSpecifiers)
        objc_msgSend(v75, "addObjectsFromArray:");
      if (self->_backupNowSpecifiers)
        objc_msgSend(v75, "addObjectsFromArray:");
      -[ICSBackupViewController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v75, v83, 1);
      -[ICSBackupStatusView setAlpha:](self->_backupStatusView, "setAlpha:", 1.0);

    }
    else
    {
      -[ICSBackupViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_backupOverCellularSwitch, 1);
      -[ICSBackupViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_backupNowButton, 1);
    }
  }
  else
  {
    -[ICSBackupViewController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_backupNowSpecifiers, 1);
    v72 = v80;
    v73 = v79;
    if (self->_isAutoBackupOnCellularAllowed)
      -[ICSBackupViewController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_backupOverCellularSpecifiers, 1);
  }
  -[ICSBackupViewController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v83, 1);
  -[ICSBackupStatusView updateViewsForBackupState:restoreState:enabled:](self->_backupStatusView, "updateViewsForBackupState:restoreState:enabled:", v73, v84, v82);
  -[ICSBackupViewController endUpdates](self, "endUpdates");
  if (v72 && (_DWORD)v73 == 3 && v82)
  {
    objc_msgSend(v72, "domain");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v76, "isEqualToString:", CFSTR("MBErrorDomain")))
    {
LABEL_101:

      goto LABEL_102;
    }
    v77 = objc_msgSend(v72, "code");

    if (v77 == 303)
    {
      LogSubsystem();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24B4C1000, v78, OS_LOG_TYPE_DEFAULT, "iCloud backup failed due to insufficiebnt storage. Posting quota change notificaiton.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "postNotificationName:object:", *MEMORY[0x24BEC7230], 0);
      goto LABEL_101;
    }
  }
LABEL_102:

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
  -[ICSBackupViewController _updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:](self, "_updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:", v13, v18, v16, v11, v10, v6, v17);

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
  v5[2] = __42__ICSBackupViewController_updateBusyState__block_invoke;
  v5[3] = &unk_251C618D0;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v7 = backupState;
  dispatch_async(backup_state_queue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __42__ICSBackupViewController_updateBusyState__block_invoke(uint64_t a1)
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

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "backupState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "restoreState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "backgroundRestoreInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 136316162;
    v22 = "-[ICSBackupViewController updateBusyState]_block_invoke";
    v23 = 1024;
    v24 = v4;
    v25 = 1024;
    v26 = v9;
    v27 = 1024;
    v28 = objc_msgSend(v5, "state");
    v29 = 1024;
    v30 = objc_msgSend(v6, "state");
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "%s, isBackupEnabled: %d, entryState: %d, backupState: %d, restoreState: %d", buf, 0x24u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__ICSBackupViewController_updateBusyState__block_invoke_402;
  v14[3] = &unk_251C618A8;
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

void __42__ICSBackupViewController_updateBusyState__block_invoke_402(uint64_t a1)
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
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1392) == *(_DWORD *)(a1 + 72))
    {
      objc_msgSend(WeakRetained, "_updateToBackupState:restoreState:backgroundRestoreState:backupEnabled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 76));
    }
    else
    {
      LogSubsystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1392);
        v6[0] = 67109120;
        v6[1] = v5;
        _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Skipping update, current backup state: %d", (uint8_t *)v6, 8u);
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
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[ICSBackupViewController cancelRestore:]";
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "%s, presenting confirmation alert", buf, 0xCu);
  }

  self->_backupCancelled = 1;
  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  v5 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("STOP_RESTORING_QUESTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_251C6B070, CFSTR("Localizable-Backup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL_RESTORE_WARNING"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DONT_STOP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __41__ICSBackupViewController_cancelRestore___block_invoke;
  v22[3] = &unk_251C61378;
  v22[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("STOP"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_2;
  v21[3] = &unk_251C61378;
  v21[4] = self;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v20);

  -[ICSBackupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

uint64_t __41__ICSBackupViewController_cancelRestore___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1419) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateBusyState");
}

void __41__ICSBackupViewController_cancelRestore___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_3;
  block[3] = &unk_251C60DC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __41__ICSBackupViewController_cancelRestore___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Cancel restore confirmed", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "cancelRestore");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__ICSBackupViewController_cancelRestore___block_invoke_411;
  block[3] = &unk_251C60DC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __41__ICSBackupViewController_cancelRestore___block_invoke_411(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1419) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "updateBusyState");
}

- (void)cancelBackup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Cancel backup", buf, 2u);
  }

  self->_backupCancelled = 1;
  self->_currentSyncState = 0;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__ICSBackupViewController_cancelBackup___block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(v5, block);

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
}

uint64_t __40__ICSBackupViewController_cancelBackup___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSync");

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "cancel");
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
  -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  self->_estimateTimeRemaining = -1;
  self->_icloudBackupProgress = 0.0;
  -[ICSBackupViewController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 1);
  self->_finishBackupExecuted = 0;
  self->_icloudSyncProgress = 0.0;
  -[ICSBackupStatusView setSyncErrors:](self->_backupStatusView, "setSyncErrors:", 0);
  self->_currentSyncState = 1;
  LODWORD(v3) = 0;
  -[ICSBackupViewController _updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:](self, "_updateToBackupState:backupError:progress:timeRemaining:restoreStateInfo:backgroundRestoreInfo:backupEnabled:", 1, 0, -1, 0, 0, 1, v3);
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__ICSBackupViewController_startBackup__block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(v4, block);

  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Starting iMessage periodic sync", buf, 2u);
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
    v15 = &unk_251C61100;
    v16 = &v17;
    __getHKHealthStoreClass_block_invoke((uint64_t)buf);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "forceCloudSyncWithOptions:completion:", 0, &__block_literal_global_418);

}

void __38__ICSBackupViewController_startBackup__block_invoke(uint64_t a1)
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
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Start icloud sync", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startSync");

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Begin backup", buf, 2u);
  }

  v5 = (void *)objc_opt_new();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408))
    objc_msgSend(MEMORY[0x24BE66C38], "expensiveCellularAccess");
  else
    objc_msgSend(MEMORY[0x24BE66C38], "inexpensiveCellularAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellularAccess:", v6);

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1384);
  v15 = 0;
  v8 = objc_msgSend(v7, "startBackupWithOptions:error:", v5, &v15);
  v9 = v15;
  if (v8)
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "Backup begin succeed", buf, 2u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudSyncClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancelSync");

    LogSubsystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "Error starting backup: %@", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__ICSBackupViewController_startBackup__block_invoke_414;
    block[3] = &unk_251C61060;
    block[4] = *(_QWORD *)(a1 + 32);
    v14 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __38__ICSBackupViewController_startBackup__block_invoke_414(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "setBackupError:", *(_QWORD *)(a1 + 40));
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

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Failed to fetch the Interface Cost Expensive setting: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __57__ICSBackupViewController__showAlertForExpensiveCellular__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1464));
}

uint64_t __57__ICSBackupViewController__showAlertForExpensiveCellular__block_invoke_2(uint64_t a1)
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
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ICSBackupViewController beginBackup:]";
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setCellEnabled:", 0);
  -[ICSBackupViewController prepareAlertForBackupDisabledDomainAndShow:](self, "prepareAlertForBackupDisabledDomainAndShow:", 1);
}

- (void)updateBackupFinishState
{
  if (!self->_finishBackupExecuted)
  {
    self->_finishBackupExecuted = 1;
    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
    if (self->_updateBackupState == 1)
      -[ICSBackupViewController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 1);
    else
      -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
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
  v6[2] = __51__ICSBackupViewController_syncCompletedWithErrors___block_invoke;
  v6[3] = &unk_251C61060;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __51__ICSBackupViewController_syncCompletedWithErrors___block_invoke(uint64_t a1)
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
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync complete get called", (uint8_t *)&v9, 2u);
  }

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1516) == 1)
  {
    v3 = *(void **)(a1 + 40);
    if (v3 && objc_msgSend(v3, "count"))
    {
      LogSubsystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Got some icloud sync errors: %@", (uint8_t *)&v9, 0xCu);
      }

      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1516) = 3;
      v6 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      LogSubsystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "iCloud sync complete with no error", (uint8_t *)&v9, 2u);
      }

      v6 = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1516) = 2;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1448), "setSyncErrors:", v6);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1520))
    {
      LogSubsystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "We have already completed backup", (uint8_t *)&v9, 2u);
      }

    }
  }
}

- (void)syncProgress:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__ICSBackupViewController_syncProgress___block_invoke;
  v3[3] = &unk_251C61688;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

double __40__ICSBackupViewController_syncProgress___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1516) == 1)
  {
    LogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "iCloud sync reported progress: %f", (uint8_t *)&v5, 0xCu);
    }

    result = *(double *)(a1 + 40);
    *(double *)(*(_QWORD *)(a1 + 32) + 1536) = result;
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
  v5[2] = __62__ICSBackupViewController_showPopUpAlertForBackupDisabledApps__block_invoke;
  v5[3] = &unk_251C61938;
  v5[4] = self;
  objc_msgSend(PSGBackupUtilsClass_0, "configureAlertMessageOfType:AndTitleForBackUpDisabledApps:completion:", 0, backupDisabledAppsInfo, v5);
}

uint64_t __62__ICSBackupViewController_showPopUpAlertForBackupDisabledApps__block_invoke(uint64_t a1, int a2)
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
  -[ICSBackupViewController view](self, "view");
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
    -[ICSBackupViewController manageStorageAction](self, "manageStorageAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v12);

    v13 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_251C6B070, CFSTR("Localizable-Backup"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__ICSBackupViewController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke;
    v17[3] = &unk_251C61378;
    v17[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v16);

    -[ICSBackupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
  }

}

uint64_t __79__ICSBackupViewController_showAlertForBackupDisabledItemsWithTitle_andMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showAlertForExpensiveCellular");
}

- (void)proceedWithBackup
{
  void *v3;

  -[PSSpecifier propertyForKey:](self->_backupNowButton, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCellEnabled:", 1);

  -[ICSBackupViewController startBackup](self, "startBackup");
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
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SETTINGS"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__ICSBackupViewController_manageStorageAction__block_invoke;
  v8[3] = &unk_251C61378;
  v8[4] = self;
  objc_msgSend(v3, "actionWithTitle:style:handler:", v5, 0, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __46__ICSBackupViewController_manageStorageAction__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "propertyForKey:", *MEMORY[0x24BE75D18]);
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
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    Name = sel_getName(a2);
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", 0);
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDateInvalidatePrevious:](self, "updateLastBackupDateInvalidatePrevious:", 1);
  currentSyncState = self->_currentSyncState;
  LogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (currentSyncState == 1)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      v9 = "Backup finished but iCloud sync not finished";
LABEL_8:
      _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 2u);
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
  objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x24BEC7410], 0);

}

- (void)manager:(id)a3 didFailRestoreWithError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICSBackupViewController manager:didFailRestoreWithError:].cold.1();

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");

}

- (void)managerDidFinishRestore:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Restore finished", v5, 2u);
  }

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
}

- (void)managerDidCancelRestore:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Restore canceled", v5, 2u);
  }

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
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
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Failed backup: %@", (uint8_t *)&v7, 0xCu);
  }

  self->_currentSyncState = 3;
  self->_finishBackupExecuted = 1;
  self->_updateBackupState = 0;
  -[ICSBackupStatusView setBackupError:](self->_backupStatusView, "setBackupError:", v5);
  -[ICSBackupViewController updateBusyState](self, "updateBusyState");

}

- (void)manager:(id)a3 didUpdateProgress:(float)a4 estimatedTimeRemaining:(unint64_t)a5
{
  NSObject *v8;
  double v9;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a4;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Backup progress: %f", (uint8_t *)&v10, 0xCu);
  }

  self->_icloudBackupProgress = v9;
  self->_estimateTimeRemaining = a5;
  -[ICSBackupViewController updateiCloudBackupAndSyncProgressWithAllowDecrease:](self, "updateiCloudBackupAndSyncProgressWithAllowDecrease:", 0);
  if ((self->_backupState - 1) >= 2)
    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
}

- (void)managerDidUpdateBackgroundRestoreProgress:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICSBackupViewController managerDidUpdateBackgroundRestoreProgress:]";
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
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
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[ICSBackupViewController manager:didSetBackupEnabled:]";
    v9 = 1024;
    v10 = v4;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "%s, enabled: %d", (uint8_t *)&v7, 0x12u);
  }

  -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
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
    LogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Lost connection to backup service", buf, 2u);
    }

    currentSyncState = self->_currentSyncState;
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (currentSyncState == 1)
    {
      if (v7)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "We are still syncing with iCloud", v11, 2u);
      }

      if (!self->_updateBackupState)
      {
        LogSubsystem();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Backup not finished before losing connection", v10, 2u);
        }

        self->_updateBackupState = 2;
      }
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "We have finished icloud sync", v9, 2u);
      }

      self->_updateBackupState = 0;
      self->_finishBackupExecuted = 1;
    }
    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
    -[ICSBackupViewController updateLastBackupDate](self, "updateLastBackupDate");
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
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  LogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v7;
    _os_log_impl(&dword_24B4C1000, v9, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v15, 0xCu);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(v7, "specifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "count");

    if (v13)
    {
      objc_msgSend(v7, "specifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSBackupViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v8, v14, 1);

    }
    else
    {
      -[ICSBackupViewController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v8, 1);
    }
    -[ICSBackupViewController updateBusyState](self, "updateBusyState");
  }
  else
  {
    -[ICSBackupViewController addSpecifiersFromArray:](self, "addSpecifiersFromArray:", v11);

  }
}

- (void)_fetchiCloudHomeData
{
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  ICSHomeDataController *v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = -[ICSHomeDataController initWithAccount:]([ICSHomeDataController alloc], "initWithAccount:", self->_account);
  v3 = (void *)v6[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke;
  v4[3] = &unk_251C61960;
  v4[4] = self;
  v4[5] = &v5;
  objc_msgSend(v3, "fetchiCloudHomeDataModelAllowingCache:completion:", 1, v4);
  _Block_object_dispose(&v5, 8);

}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(v5, "backupViewInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "tips");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        objc_msgSend(v5, "backupViewInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "tips");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "Found an eligible tip for backup view: %@", buf, 0xCu);

      }
      objc_msgSend(v5, "backupViewInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "tips");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_436;
      v20[3] = &unk_251C61060;
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v17;
      v7 = v17;
      dispatch_async(MEMORY[0x24BDAC9B8], v20);

    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "No eligible tip found for backup view.", buf, 2u);
    }
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_436(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(*(id *)(a1 + 32), "_buildBackupSpecifiersWithTip:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1488);
  *(_QWORD *)(v3 + 1488) = v2;

  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)ICSBackupViewController;
  objc_msgSendSuper2(&v7, sel_reloadSpecifiers);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BACKUPS_NAV_TITLE"), &stru_251C6B070, CFSTR("Localizable-Backup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v6);

}

- (id)_buildBackupSpecifiersWithTip:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
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

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("UPGRADE_TO_ICLOUD_PLUS_TIP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_251C6B070, self, 0, 0, 0, 3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75D50]);

  objc_msgSend(v5, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75D28]);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *MEMORY[0x24BEBE1D0], 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v5, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("ICSActionButtonTitleKey"));

  objc_msgSend(v5, "actions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("ICSActionKey"));

  objc_msgSend(v8, "setButtonAction:", sel_performTipAction_);
  objc_msgSend(v6, "addObject:", v8);
  v18 = (void *)objc_msgSend(v6, "copy");

  return v18;
}

- (void)performTipAction:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  ICQUpgradeFlowManager *v11;
  ICQUpgradeFlowManager *upgradeFlowManager;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "Backup tip action button tapped.", (uint8_t *)&v17, 2u);
  }

  if (self->_upgradeFlowManager)
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICSBackupViewController performTipAction:].cold.2(v6);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICSActionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF48];
    -[NSObject urlString](v6, "urlString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc_init(MEMORY[0x24BEC72F8]);
      -[NSObject _updateRequestedServerUIURLWithURL:](v10, "_updateRequestedServerUIURLWithURL:", v9);
      v11 = (ICQUpgradeFlowManager *)objc_msgSend(objc_alloc(MEMORY[0x24BEC7480]), "initWithOffer:", v10);
      upgradeFlowManager = self->_upgradeFlowManager;
      self->_upgradeFlowManager = v11;

      -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
      v13 = objc_alloc(MEMORY[0x24BEC72E0]);
      -[NSObject type](v6, "type");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithActionString:url:", v14, v9);

      LogSubsystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        v18 = v9;
        _os_log_impl(&dword_24B4C1000, v16, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with url: %@", (uint8_t *)&v17, 0xCu);
      }

      -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](self->_upgradeFlowManager, "beginRemoteUpgradeFlowWithICQLink:presenter:", v15, self);
    }
    else
    {
      LogSubsystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICSBackupViewController performTipAction:].cold.1();
    }

  }
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  uint8_t v6[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  _QWORD block[5];
  uint8_t buf[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", buf, 2u);
  }

  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  -[ICSBackupViewController _postQuotaDidChangeNotification](self, "_postQuotaDidChangeNotification");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ICSBackupViewController_upgradeFlowManagerDidComplete___block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__ICSBackupViewController_upgradeFlowManagerDidComplete___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488))
  {
    LogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Removing backup tip specifiers.", v5, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "removeContiguousSpecifiers:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488), 1);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1488);
    *(_QWORD *)(v3 + 1488) = 0;

  }
}

- (void)_postQuotaDidChangeNotification
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ICSBackupViewController _postQuotaDidChangeNotification]";
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "%s refreshing quota storage info", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", *MEMORY[0x24BEC7230], 0);

}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;

  v7 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[AAUISpecifierProvider handleURL:](self->_backupSpecifierProvider, "handleURL:", v7);
  if (v6)
    v6[2](v6);

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
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_backupTipSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSwitch, 0);
  objc_storeStrong((id *)&self->_backupOverCellularSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupNowButton, 0);
  objc_storeStrong((id *)&self->_backupNowSpecifiers, 0);
  objc_storeStrong((id *)&self->_backupStatusView, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backup_state_queue, 0);
  objc_storeStrong((id *)&self->_isExpensiveCellular, 0);
  objc_storeStrong((id *)&self->_networkSupportsBackup, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  v4 = v3;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "%@ got deallocated.", v5, 0xCu);

}

void __87__ICSBackupViewController__checkSupportForManualAndAutoBackupOnCellularWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Failed to get backup on cellular support: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)specifiers
{
  __assert_rtn("-[ICSBackupViewController specifiers]", "ICSBackupViewController.m", 430, "switchGroup");
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Error setting up backup: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__ICSBackupViewController__persistBackupEnablementState_passcode___block_invoke_308_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Error starting iCloud Backup: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)setBackupEnabled:specifier:.cold.1()
{
  __assert_rtn("-[ICSBackupViewController setBackupEnabled:specifier:]", "ICSBackupViewController.m", 732, "[specifier isKindOfClass:[PSConfirmationSpecifier class]]");
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

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Restore failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __47__ICSBackupViewController__fetchiCloudHomeData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "Failed to fetch iCloud home data model w/ error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)performTipAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_24B4C1000, v0, v1, "No valid URL found for tip action: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)performTipAction:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "Upgrade flow is already in progress. Bailing.", v1, 2u);
}

@end
