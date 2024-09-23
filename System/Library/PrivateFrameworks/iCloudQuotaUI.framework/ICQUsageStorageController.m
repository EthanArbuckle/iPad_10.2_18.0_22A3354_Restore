@implementation ICQUsageStorageController

- (id)tapToRadarURLForAttributes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__ICQUsageStorageController_BugReporting__tapToRadarURLForAttributes___block_invoke;
  v10[3] = &unk_24E3F3448;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v7 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v7, "setScheme:", CFSTR("tap-to-radar"));
  objc_msgSend(v7, "setHost:", CFSTR("new"));
  objc_msgSend(v7, "setQueryItems:", v6);
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __70__ICQUsageStorageController_BugReporting__tapToRadarURLForAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

- (void)snapshotAndReportDiskSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ICQUsageStorageController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v5);
  -[ICQUsageStorageController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightBarButtonItem:", v6);

  objc_msgSend(v5, "startAnimating");
  v15 = 0;
  if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
  {
    v16 = xmmword_24E3F34B8;
    v17 = 0;
    DiskSpaceDiagnosticsLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!DiskSpaceDiagnosticsLibraryCore_frameworkLibrary)
    {
      v13 = v15;
      v12 = (void *)abort_report_np();
      free(v12);
    }
  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255539950, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.FilesystemMetadataSnapshotService"));
  objc_msgSend(v9, "setRemoteObjectInterface:", v8);
  objc_msgSend(v9, "resume");
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke;
  v14[3] = &unk_24E3F3498;
  v14[4] = self;
  v11 = (id)objc_msgSend(v10, "generateFilesystemMetadataSnapshotWithOptions:reply:", 0, v14);

}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_cold_1((uint64_t)v6, v7);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FILESYSTEM_METADATA_SNAPSHOT_FAIL_TITLE"), &stru_24E400750, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FILESYSTEM_METADATA_SNAPSHOT_FAIL_MESSAGE"), &stru_24E400750, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_64;
  block[3] = &unk_24E3F3470;
  block[4] = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v9;
  v19 = v11;
  v20 = v5;
  v12 = v5;
  v13 = v11;
  v14 = v9;
  v15 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_64(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", CFSTR("Radar"), 0, *(_QWORD *)(a1 + 32), sel_snapshotAndReportDiskSpace);
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", v2);

  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DIAGNOSTICS_ALERT_OK"), &stru_24E400750, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionWithTitle:style:handler:", v8, 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v11);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("[Disk Space]: "), CFSTR("Title"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Purple Performance"), CFSTR("ComponentName"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("1.0"), CFSTR("ComponentVersion"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("223755"), CFSTR("ComponentID"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Other Bug"), CFSTR("Classification"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Always"), CFSTR("Reproducibility"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("Attachments"));
    objc_msgSend(*(id *)(a1 + 32), "tapToRadarURLForAttributes:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "openURL:", v9);

  }
}

- (ICQUsageStorageController)init
{
  ICQUsageStorageController *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  PSSpecifier *appsStorageGroup;
  NSMutableArray *v8;
  NSMutableArray *deferredUsageApps;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICQUsageStorageController;
  v2 = -[ICQUsageStorageController init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_prepareForSnapshot, CFSTR("preferencesPrepareForSnapshotNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_didEnterForeground, *MEMORY[0x24BEBE008], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_appDeletionComplete, CFSTR("AppDeletionCompleted"), 0);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    appsStorageGroup = v2->_appsStorageGroup;
    v2->_appsStorageGroup = (PSSpecifier *)v6;

    -[PSSpecifier setProperty:forKey:](v2->_appsStorageGroup, "setProperty:forKey:", CFSTR("STORAGE_GROUP"), *MEMORY[0x24BE75AC0]);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    deferredUsageApps = v2->_deferredUsageApps;
    v2->_deferredUsageApps = v8;

    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerUsageStorageClient");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flushViews");

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterUsageStorageClient");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController dealloc](&v6, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  if ((-[ICQUsageStorageController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    -[ICQUsageStorageController reloadStorageSummary](self, "reloadStorageSummary");
    -[ICQUsageStorageController checkForPendingUpdate](self, "checkForPendingUpdate");
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("STORAGE"), &stru_24E400750, CFSTR("Usage Statistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUsageStorageController setTitle:](self, "setTitle:", v4);

  if (CPIsInternalDevice())
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithTitle:style:target:action:", CFSTR("Radar"), 0, self, sel_snapshotAndReportDiskSpace);
    -[ICQUsageStorageController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[ICQUsageStorageController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearUsageDataCache");

  }
}

- (void)reloadSpecifiers
{
  void *v3;
  PSSpecifier *photosSpecifier;
  PSSpecifier *storageAvailableSpecifier;
  PSSpecifier *storageUsedSpecifier;
  NSString *updateName;
  objc_super v8;

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearUsageDataCache");

  self->_storageLookupInProgress = 0;
  -[NSMutableArray removeAllObjects](self->_deferredUsageApps, "removeAllObjects");
  photosSpecifier = self->_photosSpecifier;
  self->_photosSpecifier = 0;

  storageAvailableSpecifier = self->_storageAvailableSpecifier;
  self->_storageAvailableSpecifier = 0;

  storageUsedSpecifier = self->_storageUsedSpecifier;
  self->_storageUsedSpecifier = 0;

  self->_updateRequiredBytes = 0;
  updateName = self->_updateName;
  self->_updateName = 0;

  v8.receiver = self;
  v8.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController reloadSpecifiers](&v8, sel_reloadSpecifiers);
}

- (void)checkForPendingUpdate
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  SUManagerClient *v6;
  SUManagerClient *SUManager;
  void *v8;
  objc_class *v9;
  id v10;
  SUManagerClient *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = MEMORY[0x24BDAC760];
  if (self->_openedFromSoftwareUpdate && !self->_SUManager)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2050000000;
    v4 = (void *)getSUManagerClientClass_softClass;
    v21 = getSUManagerClientClass_softClass;
    if (!getSUManagerClientClass_softClass)
    {
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __getSUManagerClientClass_block_invoke;
      v16 = &unk_24E3F3868;
      v17 = &v18;
      __getSUManagerClientClass_block_invoke((uint64_t)&v13);
      v4 = (void *)v19[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v18, 8);
    v6 = (SUManagerClient *)objc_msgSend([v5 alloc], "initWithDelegate:clientType:", 0, 1);
    SUManager = self->_SUManager;
    self->_SUManager = v6;

  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getSUScanOptionsClass_softClass;
  v21 = getSUScanOptionsClass_softClass;
  if (!getSUScanOptionsClass_softClass)
  {
    v13 = v3;
    v14 = 3221225472;
    v15 = __getSUScanOptionsClass_block_invoke;
    v16 = &unk_24E3F3868;
    v17 = &v18;
    __getSUScanOptionsClass_block_invoke((uint64_t)&v13);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setForced:", 1);
  objc_msgSend(v10, "setIdentifier:", CFSTR("com.apple.Preferences.usage_settings"));
  v11 = self->_SUManager;
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke;
  v12[3] = &unk_24E3F3988;
  v12[4] = self;
  -[SUManagerClient scanForUpdates:withResult:](v11, "scanForUpdates:withResult:", v10, v12);

}

void __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1424);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke_2;
    v8[3] = &unk_24E3F3960;
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    objc_msgSend(v5, "download:", v8);

  }
}

void __50__ICQUsageStorageController_checkForPendingUpdate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDone");

  v20 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v9 = (void *)getSUDownloadPolicyFactoryClass_softClass;
  v25 = getSUDownloadPolicyFactoryClass_softClass;
  if (!getSUDownloadPolicyFactoryClass_softClass)
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __getSUDownloadPolicyFactoryClass_block_invoke;
    v21[3] = &unk_24E3F3868;
    v21[4] = &v22;
    __getSUDownloadPolicyFactoryClass_block_invoke((uint64_t)v21);
    v9 = (void *)v23[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v22, 8);
  objc_msgSend(v10, "userDownloadPolicyForDescriptor:existingPolicy:", *(_QWORD *)(a1 + 32), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "isDownloadableForCurrentNetworkConditions:cellularFeesApply:", &v20, 0);
  if (v20 == 6
    && (objc_msgSend(*(id *)(a1 + 32), "humanReadableUpdateName"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    v13 = *(void **)(a1 + 32);
    if (v8)
      v14 = objc_msgSend(v13, "installationSize");
    else
      v14 = objc_msgSend(v13, "totalRequiredFreeSpace");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1456) = v14;
    objc_msgSend(*(id *)(a1 + 32), "humanReadableUpdateName", v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 1432);
    *(_QWORD *)(v18 + 1432) = v17;

    objc_msgSend(*(id *)(a1 + 40), "reloadStorageSummary");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1456) = 0;
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(v15 + 1432);
    *(_QWORD *)(v15 + 1432) = 0;

  }
}

- (void)refreshSoftwareUpdateRequiredSpace
{
  void *v3;
  float updateRequiredBytes;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  -[ICQUsageStorageController specifierForID:](self, "specifierForID:", CFSTR("SUMMARY_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  -[ICQUsageStorageController getGroup:row:ofSpecifier:](self, "getGroup:row:ofSpecifier:", &v20, 0, v3);
  updateRequiredBytes = (float)self->_updateRequiredBytes;
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableSize");
  v7 = updateRequiredBytes - v6;

  if (v7 <= 0.0)
  {
    objc_msgSend(v3, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
    -[ICQUsageStorageController table](self, "table");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_reloadSectionHeaderFooters:withRowAnimation:", v9, 100);
    goto LABEL_6;
  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("UPDATE_STORAGE_REQUIREMENT_%@"), &stru_24E400750, CFSTR("Usage Statistics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)v7, 2);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x24BE75A68];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75A68]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v15, "isEqualToString:", v8);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v14);
    -[ICQUsageStorageController table](self, "table");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reloadSectionHeaderFooters:withRowAnimation:", v16, 100);

LABEL_6:
  }

LABEL_8:
  -[PSSpecifier objectForKeyedSubscript:](self->_storageAvailableSpecifier, "objectForKeyedSubscript:", *MEMORY[0x24BE75D18]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 > 0.0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "tableCellGrayTextColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v19);

}

+ (id)systemSizeUsed:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1490];
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "usedSize");
  objc_msgSend(v3, "stringFromByteCount:countStyle:", (uint64_t)v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)systemSizeAvailable:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1490];
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableSize");
  objc_msgSend(v3, "stringFromByteCount:countStyle:", (uint64_t)v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)storageUsedSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("USED"), &stru_24E400750, CFSTR("Usage Statistics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, sel_systemSizeUsed_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)storageAvailableSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AVAILABLE"), &stru_24E400750, CFSTR("Usage Statistics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, a1, 0, sel_systemSizeAvailable_, 0, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)reloadStorageSummary
{
  void *v3;

  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSystemSizeStrings");

  -[ICQUsageStorageController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_storageAvailableSpecifier, 0);
  -[ICQUsageStorageController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_storageUsedSpecifier, 0);
  -[ICQUsageStorageController refreshSoftwareUpdateRequiredSpace](self, "refreshSoftwareUpdateRequiredSpace");
}

- (void)addStorageSpecifiers:(id)a3 completed:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v4 = a4;
  v22 = a3;
  -[ICQUsageStorageController beginUpdates](self, "beginUpdates");
  v6 = -[ICQUsageStorageController indexOfSpecifierID:](self, "indexOfSpecifierID:", CFSTR("SPINNER_CELL"));
  v7 = v6;
  if (v4)
    -[ICQUsageStorageController removeSpecifierID:animated:](self, "removeSpecifierID:animated:", CFSTR("SPINNER_CELL"), 1);
  else
    v7 = v6 + 1;
  v8 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v8))
    -[ICQUsageStorageController addStorageSpecifiers:completed:].cold.1();
  v9 = objc_msgSend(v22, "count");
  v10 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count") + v9;
  if (v7 < v10)
  {
    v11 = 0;
    do
    {
      if (v11 >= objc_msgSend(v22, "count"))
        break;
      if (v7 >= objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "count"))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "objectAtIndexedSubscript:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", kTotalSizeProperty);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "unsignedIntegerValue");

      }
      objc_msgSend(v22, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", kTotalSizeProperty);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      if (v17 > v14)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICQUsageStorageController insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v18, v7);

        ++v11;
      }
      ++v7;
    }
    while (v10 != v7);
  }
  -[ICQUsageStorageController endUpdates](self, "endUpdates");
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isRunningTest:", CFSTR("EnterManageStoragePane"));

    if (v20)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "finishedTest:", CFSTR("EnterManageStoragePane"));

    }
  }

}

- (id)stringWithAppSizeForSpecifier:(id)a3
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", kTotalSizeProperty);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  if (v5 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_24E400750, CFSTR("Usage Statistics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", (uint64_t)v5, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (Class)usageDetailControllerForBundleID:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  objc_class *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
  if (!usageDetailControllerForBundleID__specialDetailControllerMap)
  {
    v10[0] = *MEMORY[0x24BE758D8];
    v11[0] = objc_opt_class();
    v10[1] = *MEMORY[0x24BE758C8];
    v11[1] = objc_opt_class();
    v10[2] = *MEMORY[0x24BE758D0];
    v11[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
    usageDetailControllerForBundleID__specialDetailControllerMap = v5;

    v4 = (void *)usageDetailControllerForBundleID__specialDetailControllerMap;
  }
  v7 = (id)objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  if (!v7)
    v7 = (id)objc_opt_class();
  v8 = (objc_class *)v7;

  return v8;
}

- (BOOL)storageExpired
{
  void *v3;
  double v4;
  BOOL v5;

  if (!self->_storageExpiry)
    return 0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_storageExpiry);
  v5 = v4 > self->_timeoutLimit;

  return v5;
}

- (void)didUnlock
{
  void *v3;

  if (-[ICQUsageStorageController storageExpired](self, "storageExpired"))
  {
    +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearUsageDataCache");

    -[ICQUsageStorageController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)prepareForSnapshot
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v3 = -[ICQUsageStorageController indexOfSpecifier:](self, "indexOfSpecifier:", self->_appsStorageGroup);
  -[ICQUsageStorageController getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v8, &v7, v3);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E400750, 0, 0, 0, 0, 15, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", CFSTR("SPINNER_CELL"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "subarrayWithRange:", v3, -[ICQUsageStorageController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), v8));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUsageStorageController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v5, 0);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", self->_appsStorageGroup, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQUsageStorageController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", v6, v3, 0);

}

- (id)_specifierForApp:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  float v8;
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
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICQUSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "totalSize");
    *(_DWORD *)buf = 138412802;
    v22 = v7;
    v23 = 2112;
    v24 = v5;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Usage item '%@' in bundle %@ has total size %f", buf, 0x20u);

  }
  v9 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel_stringWithAppSizeForSpecifier_, -[ICQUsageStorageController usageDetailControllerForBundleID:](self, "usageDetailControllerForBundleID:", v5), 2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v11, "setProperty:forKey:", v5, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v11, "setProperty:forKey:", v5, *MEMORY[0x24BE75B70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x24BE75B88]);

  objc_msgSend(v4, "bundleVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v13, CFSTR("VERSION"));

  if ((objc_msgSend(v4, "isSystemApp") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APP_SIZE"), &stru_24E400750, CFSTR("Usage Statistics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v15, CFSTR("SIZE_TITLE"));

    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "staticSize");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v17, CFSTR("SIZE_VALUE"));

  }
  objc_msgSend(v11, "setProperty:forKey:", v4, CFSTR("USAGE_APP"));
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "totalSize");
  objc_msgSend(v18, "numberWithFloat:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v19, kTotalSizeProperty);

  return v11;
}

- (id)_specifierForBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v22;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  objc_msgSend(v4, "usageBundleStorageReporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v4, "usageBundleStorageReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "usageDetailControllerClassForUsageBundleApp:", v4);

    if (v10)
      v6 = v10;
  }
  v11 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, 0, sel_stringWithAppSizeForSpecifier_, v6, 2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v13, "setProperty:forKey:", v5, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v13, "setProperty:forKey:", v5, *MEMORY[0x24BE75B70]);
  objc_msgSend(v13, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  objc_msgSend(v13, "setProperty:forKey:", v4, CFSTR("USAGE_BUNDLE_APP"));
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "totalSize");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProperty:forKey:", v15, kTotalSizeProperty);

  v16 = (void *)MEMORY[0x24BE75638];
  objc_msgSend((id)objc_msgSend(v13, "detailControllerClass"), "mediaGroups");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setupSpecifier:forMediaGroups:", v13, v17);

  objc_msgSend(v4, "usageBundleStorageReporter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_opt_respondsToSelector();

  if ((v17 & 1) != 0)
  {
    objc_msgSend(v4, "usageBundleStorageReporter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v13;
    objc_msgSend(v19, "usageBundleApp:willDisplaySpecifier:", v4, &v22);
    v20 = v22;

    v13 = v20;
  }

  return v13;
}

- (BOOL)mediaCache:(id)a3 hasGroups:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (void)setDelayUsagePopulation:(BOOL)a3
{
  if (self->_delayUsagePopulation != a3)
  {
    self->_delayUsagePopulation = a3;
    if (!a3)
      -[ICQUsageStorageController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (id)specifiers
{
  void *v3;
  void *v4;
  double v5;
  _BOOL4 v6;
  int *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSDate *v13;
  NSDate *storageExpiry;
  void *v15;
  void *v16;
  PSSpecifier *v17;
  PSSpecifier *storageUsedSpecifier;
  PSSpecifier *v19;
  PSSpecifier *storageAvailableSpecifier;
  void *v21;
  objc_class *v22;
  void *v23;
  _QWORD v25[5];

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kPreferenceTimeoutLimitKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_timeoutLimit = v5;

  v6 = -[ICQUsageStorageController storageExpired](self, "storageExpired");
  v7 = (int *)MEMORY[0x24BE756E0];
  if (v6)
  {
    v8 = (int)*MEMORY[0x24BE756E0];
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = 0;

  }
  +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchSystemSizeStrings");

  v11 = *v7;
  v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  if (!v12)
  {
    if (!self->_storageLookupInProgress && !self->_delayUsagePopulation)
    {
      self->_storageLookupInProgress = 1;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
      storageExpiry = self->_storageExpiry;
      self->_storageExpiry = v13;

      +[ICQUsageStorageMonitor sharedMonitor](ICQUsageStorageMonitor, "sharedMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __39__ICQUsageStorageController_specifiers__block_invoke;
      v25[3] = &unk_24E3F39F0;
      v25[4] = self;
      objc_msgSend(v15, "populateUsageDataWithProgressBlock:", v25);

      -[ICQUsageStorageController checkForPendingUpdate](self, "checkForPendingUpdate");
    }
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SUMMARY_GROUP"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "storageUsedSpecifier");
    v17 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    storageUsedSpecifier = self->_storageUsedSpecifier;
    self->_storageUsedSpecifier = v17;

    objc_msgSend((id)objc_opt_class(), "storageAvailableSpecifier");
    v19 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    storageAvailableSpecifier = self->_storageAvailableSpecifier;
    self->_storageAvailableSpecifier = v19;

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24E400750, 0, 0, 0, 0, 15, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setProperty:forKey:", CFSTR("SPINNER_CELL"), *MEMORY[0x24BE75AC0]);
    v22 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v16, self->_storageUsedSpecifier, self->_storageAvailableSpecifier, self->_appsStorageGroup, v21, 0);
    v23 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = v22;

    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v11);
  }
  return v12;
}

void __39__ICQUsageStorageController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  void *v61;
  int v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  _QWORD block[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  uint8_t v90[128];
  uint8_t buf[4];
  void *v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v67 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    __39__ICQUsageStorageController_specifiers__block_invoke_cold_1();
  v66 = v9;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1416));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "removeAllObjects");
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
  v13 = v67;
  v68 = v11;
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v85 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_specifierForApp:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_msgSend(v18, "detailControllerClass"), "mediaGroups");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(*(id *)(a1 + 32), "mediaCache:hasGroups:", v13, v19);
        if ((v20 & 1) != 0 || a5)
        {
          if (((v20 | a5 ^ 1) & 1) == 0)
          {
            _ICQGetLogSystem();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v17, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v92 = v24;
              v93 = 2112;
              v94 = v25;
              _os_log_impl(&dword_21F2CC000, v23, OS_LOG_TYPE_DEFAULT, "App %@ depends on media groups %@ but they were never loaded", buf, 0x16u);

              v13 = v67;
            }

            v11 = v68;
          }
          v21 = v69;
          v22 = v18;
        }
        else
        {
          v21 = *(void **)(*(_QWORD *)(a1 + 32) + 1416);
          v22 = v17;
        }
        objc_msgSend(v21, "addObject:", v22);

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
    }
    while (v14);
  }

  v26 = *(_QWORD **)(a1 + 32);
  v27 = v26[176];
  if (!v27 && (a5 & 1) == 0)
  {
    +[ICQUsagePhotosController mediaGroups](ICQUsagePhotosController, "mediaGroups");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v13;
    v30 = (void *)v28;
    v31 = objc_msgSend(v26, "mediaCache:hasGroups:", v29, v28);

    if ((v31 & 1) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (!v27)
  {
LABEL_20:
    v32 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_24E400750, CFSTR("Usage Statistics"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v68;
    objc_msgSend(v32, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v34, *(_QWORD *)(a1 + 32), 0, sel_stringWithAppSizeForSpecifier_, objc_opt_class(), 2, 0);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(a1 + 32);
    v37 = *(void **)(v36 + 1408);
    *(_QWORD *)(v36 + 1408) = v35;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v38 = *(void **)(*(_QWORD *)(a1 + 32) + 1408);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setProperty:forKey:", v39, *MEMORY[0x24BE75B88]);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setProperty:forKey:", CFSTR("com.apple.mobileslideshow"), *MEMORY[0x24BE75B70]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setIdentifier:", CFSTR("PHOTOS"));
    v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408);
    +[ICQUsagePhotosController mediaGroups](ICQUsagePhotosController, "mediaGroups");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICQUsageDetailController setupSpecifier:forMediaGroups:](ICQUsageDetailController, "setupSpecifier:forMediaGroups:", v40, v41);

    objc_msgSend(v69, "addObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408));
  }
LABEL_21:
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v42 = v69;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v81 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
        objc_msgSend((id)objc_msgSend(v47, "detailControllerClass"), "mediaGroups");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        +[ICQUsageDetailController setupSpecifier:forMediaGroups:](ICQUsageDetailController, "setupSpecifier:forMediaGroups:", v47, v48);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    }
    while (v44);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v49 = v66;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v77;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v77 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(*(id *)(a1 + 32), "_specifierForBundle:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v54);

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
    }
    while (v51);
  }

  objc_msgSend(v42, "sortUsingComparator:", &__block_literal_global_1);
  if (a5)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1392) = 0;
  if (objc_msgSend(v42, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addStorageSpecifiers:completed:", v42, a5);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v55 = v42;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v73;
    while (2)
    {
      for (m = 0; m != v57; ++m)
      {
        if (*(_QWORD *)v73 != v58)
          objc_enumerationMutation(v55);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * m), "identifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "specifierIDPendingPush");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v60, "isEqualToString:", v61);

        if (v62)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __39__ICQUsageStorageController_specifiers__block_invoke_2;
          block[3] = &unk_24E3F3610;
          block[4] = *(_QWORD *)(a1 + 32);
          dispatch_async(MEMORY[0x24BDAC9B8], block);
          goto LABEL_49;
        }
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v88, 16);
      if (v57)
        continue;
      break;
    }
  }
LABEL_49:

  if (a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "specifierIDPendingPush");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      ICQUSLogForCategory(0);
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "specifierIDPendingPush");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v92 = v65;
        _os_log_impl(&dword_21F2CC000, v64, OS_LOG_TYPE_DEFAULT, "Did not find a specifier for url path: %@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "clearPendingURL");
    }
  }

}

uint64_t __39__ICQUsageStorageController_specifiers__block_invoke_301(uint64_t a1, void *a2, void *a3)
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = kTotalSizeProperty;
  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", kTotalSizeProperty);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "compare:", v7);
  return v8;
}

uint64_t __39__ICQUsageStorageController_specifiers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePendingURL");
}

- (id)controllerForSpecifier:(id)a3
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQUsageStorageController;
  -[ICQUsageStorageController controllerForSpecifier:](&v6, sel_controllerForSpecifier_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setStorageController:", self);
  return v4;
}

- (void)removeStorageSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count") < 3)-[ICQUsageStorageController removeStorageSpecifier:].cold.1();
  -[ICQUsageStorageController removeSpecifier:animated:](self, "removeSpecifier:animated:", v4, 1);
  -[ICQUsageStorageController reloadStorageSummary](self, "reloadStorageSummary");

}

- (void)sizeChangedForSpecifier:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];

  v4 = kTotalSizeProperty;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  v8 = -[ICQUsageStorageController indexOfSpecifier:](self, "indexOfSpecifier:", self->_appsStorageGroup);
  v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v10 = objc_msgSend(v9, "count");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__ICQUsageStorageController_sizeChangedForSpecifier___block_invoke;
  v13[3] = &__block_descriptor_40_e24_i24__0__PSSpecifier_8q16l;
  v13[4] = v7;
  v11 = objc_msgSend(v9, "sortedInsertionIndexWithRange:block:", v8, v10 - v8, v13);
  v12 = -[ICQUsageStorageController indexOfSpecifier:](self, "indexOfSpecifier:", v5);
  -[ICQUsageStorageController removeSpecifierAtIndex:](self, "removeSpecifierAtIndex:", v12);
  -[ICQUsageStorageController insertSpecifier:atIndex:animated:](self, "insertSpecifier:atIndex:animated:", v5, (_QWORD)((__PAIR128__(v11, v12) - (unint64_t)v11) >> 64), 0);

  -[ICQUsageStorageController reloadStorageSummary](self, "reloadStorageSummary");
}

uint64_t __53__ICQUsageStorageController_sizeChangedForSpecifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", kTotalSizeProperty);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = v4 > v5;
  v7 = v4 >= v5;
  if (v6)
    return 2;
  else
    return v7;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  return 1;
}

- (void)handleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[ICQUsageStorageController specifierIDPendingPush](self, "specifierIDPendingPush");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ICQUsageStorageController specifierIDPendingPush](self, "specifierIDPendingPush");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageStorageController specifierForID:](self, "specifierForID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICQUsageStorageController controllerForSpecifier:](self, "controllerForSpecifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setParentController:", self);
    -[ICQUsageStorageController rootController](self, "rootController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRootController:", v9);

    objc_msgSend(v8, "setSpecifier:", v7);
    -[ICQUsageStorageController showController:](self, "showController:", v8);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ICQUsageStorageController;
    -[ICQUsageStorageController handleURL:](&v10, sel_handleURL_, v4);
  }

}

- (BOOL)openedFromSoftwareUpdate
{
  return self->_openedFromSoftwareUpdate;
}

- (void)setOpenedFromSoftwareUpdate:(BOOL)a3
{
  self->_openedFromSoftwareUpdate = a3;
}

- (BOOL)delayUsagePopulation
{
  return self->_delayUsagePopulation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageAvailableSpecifier, 0);
  objc_storeStrong((id *)&self->_storageUsedSpecifier, 0);
  objc_storeStrong((id *)&self->_updateName, 0);
  objc_storeStrong((id *)&self->_SUManager, 0);
  objc_storeStrong((id *)&self->_deferredUsageApps, 0);
  objc_storeStrong((id *)&self->_photosSpecifier, 0);
  objc_storeStrong((id *)&self->_appsStorageGroup, 0);
  objc_storeStrong((id *)&self->_storageExpiry, 0);
}

void __69__ICQUsageStorageController_BugReporting__snapshotAndReportDiskSpace__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Failed to snapshot filesystem metadata with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)addStorageSpecifiers:completed:.cold.1()
{
  __assert_rtn("-[ICQUsageStorageController addStorageSpecifiers:completed:]", "ICQUsageStorageController.m", 294, "_specifiers");
}

void __39__ICQUsageStorageController_specifiers__block_invoke_cold_1()
{
  __assert_rtn("-[ICQUsageStorageController specifiers]_block_invoke", "ICQUsageStorageController.m", 480, "[NSThread isMainThread]");
}

- (void)removeStorageSpecifier:.cold.1()
{
  __assert_rtn("-[ICQUsageStorageController removeStorageSpecifier:]", "ICQUsageStorageController.m", 578, "0");
}

@end
