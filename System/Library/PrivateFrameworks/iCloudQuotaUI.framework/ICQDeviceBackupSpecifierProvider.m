@implementation ICQDeviceBackupSpecifierProvider

- (ICQDeviceBackupSpecifierProvider)initWithAccountManager:(id)a3
{
  void *v4;
  void *v5;
  ICQDeviceBackupSpecifierProvider *v6;

  objc_msgSend(a3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICQDeviceBackupSpecifierProvider initWithAccount:presenter:](self, "initWithAccount:presenter:", v5, 0);

  return v6;
}

- (ICQDeviceBackupSpecifierProvider)initWithAccount:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICQDeviceBackupSpecifierProvider *v9;
  ICQDeviceBackupSpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQDeviceBackupSpecifierProvider;
  v9 = -[ICQDeviceBackupSpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isBackupRequestInProgress = 0;
    -[ICQDeviceBackupSpecifierProvider _fetchBackupInfo](v10, "_fetchBackupInfo");
    -[ICQDeviceBackupSpecifierProvider _startObservingBackupChanges](v10, "_startObservingBackupChanges");
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  id backupChangesNotificationObserver;
  objc_super v5;

  if (self->_backupChangesNotificationObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self->_backupChangesNotificationObserver, CFSTR("BackupInfoDidChange"), 0);

    backupChangesNotificationObserver = self->_backupChangesNotificationObserver;
    self->_backupChangesNotificationObserver = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ICQDeviceBackupSpecifierProvider;
  -[ICQDeviceBackupSpecifierProvider dealloc](&v5, sel_dealloc);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v5;
  ICQBackupInfo *backupInfo;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  _QWORD v16[4];
  id v17;
  ICQDeviceBackupSpecifierProvider *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (specifiers)
    return specifiers;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  backupInfo = self->_backupInfo;
  if (backupInfo)
  {
    -[ICQBackupInfo deviceGroups](backupInfo, "deviceGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__ICQDeviceBackupSpecifierProvider_specifiers__block_invoke;
    v16[3] = &unk_24E3F3AC8;
    v8 = v5;
    v17 = v8;
    v18 = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

    v9 = (NSArray *)objc_msgSend(v8, "copy");
    v10 = self->_specifiers;
    self->_specifiers = v9;

  }
  else if (self->_isBackupRequestInProgress)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BACKUP_DEVICES_GROUP"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    -[ICQDeviceBackupSpecifierProvider _specifierForSpinner](self, "_specifierForSpinner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_specifiers;
    self->_specifiers = v13;

  }
  v15 = self->_specifiers;

  return v15;
}

void __46__ICQDeviceBackupSpecifierProvider_specifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "backupDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v13, "sectionHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupSpecifierWithID:name:", CFSTR("BACKUP_DEVICES_GROUP"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "sectionFooter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE75A68];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75A68]);

    objc_msgSend(v13, "sectionFooter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v10, v9);

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_backupDevicesSpecififers:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v12);

  }
}

- (id)_specifierForSpinner
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
}

- (id)_backupDevicesSpecififers:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  ICQDeviceBackupSpecifierProvider *v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "backupDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __62__ICQDeviceBackupSpecifierProvider__backupDevicesSpecififers___block_invoke;
  v14 = &unk_24E3F3AF0;
  v15 = self;
  v16 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v11);

  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);
  return v9;
}

void __62__ICQDeviceBackupSpecifierProvider__backupDevicesSpecififers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  __objc2_class **v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "isLocalBackup");
  v5 = off_24E3F1FD0;
  if (v4)
    v5 = off_24E3F1F30;
  -[__objc2_class specifierForAccount:](*v5, "specifierForAccount:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rawDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v6, CFSTR("attributes"));

  objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  objc_msgSend(v3, "imageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v8, *MEMORY[0x24BE75B98]);

  objc_msgSend(v11, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("ICQUISpecifierKeyAccount"));
  objc_msgSend(v11, "setTarget:", v3);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v3, "deviceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75D50]);

  objc_msgSend(v11, "setCellType:", 1);
  objc_msgSend(v3, "deviceSubtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75D28]);

  objc_msgSend(v11, "setTarget:", v3);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

- (id)_valueForBackUpDevice:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v3, "target"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "storageUsedLabel");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_24E400750;
  }

  return v8;
}

- (void)_fetchBackupInfo
{
  void *v3;
  _QWORD v4[5];

  self->_isBackupRequestInProgress = 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC72A8]), "initWithAccount:", self->_account);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke;
  v4[3] = &unk_24E3F3B18;
  v4[4] = self;
  objc_msgSend(v3, "fetchBackupinfoWithCompletion:", v4);

}

void __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];

  v6 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  if (v7)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_cold_1((uint64_t)v7, v8);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_38;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

_QWORD *__52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_38(uint64_t a1)
{
  _QWORD *result;

  objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
  result = *(_QWORD **)(a1 + 32);
  if (result[6])
    return (_QWORD *)objc_msgSend(result, "_handleLocalDeviceDeeplink");
  return result;
}

- (void)_reloadSpecifiers
{
  NSArray *specifiers;
  id WeakRetained;
  id v5;

  v5 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 1);

}

- (void)loadStarted:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Backup info RUI view loading started.", v4, 2u);
  }

}

- (void)loadFinished:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Backup info RUI view load finished with success.", v4, 2u);
  }

}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Backup info RUI view load failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_startObservingBackupChanges
{
  void *v3;
  void *v4;
  void *v5;
  id backupChangesNotificationObserver;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_backupChangesNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__ICQDeviceBackupSpecifierProvider__startObservingBackupChanges__block_invoke;
    v7[3] = &unk_24E3F3B40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("BackupInfoDidChange"), 0, v4, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    backupChangesNotificationObserver = self->_backupChangesNotificationObserver;
    self->_backupChangesNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __64__ICQDeviceBackupSpecifierProvider__startObservingBackupChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("BackupInfoDidChange");
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchBackupInfo");

}

- (BOOL)handleURL:(id)a3
{
  NSDictionary *v4;
  NSDictionary *resourceDictionary;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  resourceDictionary = self->_resourceDictionary;
  self->_resourceDictionary = v4;

  if (self->_isBackupRequestInProgress)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Backup info request is in progress, will handle deeplink a bit later.", buf, 2u);
    }

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__ICQDeviceBackupSpecifierProvider_handleURL___block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  return 1;
}

uint64_t __46__ICQDeviceBackupSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLocalDeviceDeeplink");
}

- (void)_handleLocalDeviceDeeplink
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2CC000, log, OS_LOG_TYPE_ERROR, "No local backup specifier found. Failed to handle deeplink.", v1, 2u);
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceDictionary, 0);
  objc_storeStrong(&self->_backupChangesNotificationObserver, 0);
  objc_storeStrong((id *)&self->_backupInfo, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_account, 0);
}

void __52__ICQDeviceBackupSpecifierProvider__fetchBackupInfo__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch backup info with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
