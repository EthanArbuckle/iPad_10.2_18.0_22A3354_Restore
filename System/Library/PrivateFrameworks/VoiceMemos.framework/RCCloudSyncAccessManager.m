@implementation RCCloudSyncAccessManager

uint64_t __57__RCCloudSyncAccessManager_startMonitoringAccountChanges__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startMonitoringAccountChanges");
}

- (void)_startMonitoringAccountChanges
{
  RCCloudSyncAccessManager *v2;
  void *v3;
  uint64_t v4;
  RCManagedConfigurationHelper *managedConfigurationHelper;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_monitoringAccountChanges)
  {
    v2->_monitoringAccountChanges = 1;
    -[RCCloudSyncAccessManager accountStore](v2, "accountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerWithCompletion:", &__block_literal_global_12);

    v4 = objc_opt_new();
    managedConfigurationHelper = v2->_managedConfigurationHelper;
    v2->_managedConfigurationHelper = (RCManagedConfigurationHelper *)v4;

    -[RCManagedConfigurationHelper setDelegate:](v2->_managedConfigurationHelper, "setDelegate:", v2);
    objc_initWeak(&location, v2);
    v6 = MEMORY[0x1E0C80D38];
    v7 = MEMORY[0x1E0C80D38];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__RCCloudSyncAccessManager__startMonitoringAccountChanges__block_invoke_2;
    v8[3] = &unk_1E769CDA0;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.tcc.access.changed", &v2->_tccNotifyToken, v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

}

- (BOOL)cloudSyncIsAvailable
{
  RCCloudSyncAccessManager *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  -[RCCloudSyncAccessManager accountStore](v2, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "aa_isUsingiCloud"))
    v4 = +[RCManagedConfigurationHelper cloudSyncIsAllowed](RCManagedConfigurationHelper, "cloudSyncIsAllowed");
  else
    v4 = 0;

  objc_sync_exit(v2);
  return v4;
}

- (ACMonitoredAccountStore)accountStore
{
  ACMonitoredAccountStore *accountStore;
  void *v4;
  ACMonitoredAccountStore *v5;
  ACMonitoredAccountStore *v6;

  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0C8F030]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (ACMonitoredAccountStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2D8]), "initWithAccountTypes:delegate:", v4, self);
    v6 = self->_accountStore;
    self->_accountStore = v5;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void)startMonitoringAccountChanges
{
  NSObject *v3;
  _QWORD block[5];

  v3 = dispatch_queue_create("com.apple.RCCloudSyncAccessManagerStartQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RCCloudSyncAccessManager_startMonitoringAccountChanges__block_invoke;
  block[3] = &unk_1E769BF30;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__RCCloudSyncAccessManager__startMonitoringAccountChanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "tccCloudAccessChanged");

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  int tccNotifyToken;
  objc_super v4;

  tccNotifyToken = self->_tccNotifyToken;
  if (tccNotifyToken)
    notify_cancel(tccNotifyToken);
  v4.receiver = self;
  v4.super_class = (Class)RCCloudSyncAccessManager;
  -[RCCloudSyncAccessManager dealloc](&v4, sel_dealloc);
}

- (int)tccCloudAccess
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const void **v7;
  CFTypeRef *v8;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  NSObject *v11;
  int v12;
  const __CFBoolean *v13;

  v2 = (const __CFArray *)TCCAccessCopyInformationForBundleId();
  if (v2)
  {
    v3 = v2;
    Count = CFArrayGetCount(v2);
    if (Count < 1)
      goto LABEL_14;
    v5 = Count;
    v6 = 0;
    v7 = (const void **)MEMORY[0x1E0DB10B8];
    v8 = (CFTypeRef *)MEMORY[0x1E0DB1148];
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
      Value = CFDictionaryGetValue(ValueAtIndex, *v7);
      if (CFEqual(Value, *v8))
        break;
      if (v5 == ++v6)
        goto LABEL_14;
    }
    v13 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, (const void *)*MEMORY[0x1E0DB10A8]);
    if (v13)
    {
      if (CFBooleanGetValue(v13))
        v12 = 2;
      else
        v12 = 1;
    }
    else
    {
LABEL_14:
      v12 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    OSLogForCategory(CFSTR("Default"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[RCCloudSyncAccessManager tccCloudAccess].cold.1(v11);

    return 0;
  }
  return v12;
}

- (void)setTccCloudAccess:(int)a3
{
  NSObject *v5;

  if (a3 == 2)
  {
    if (!-[RCCloudSyncAccessManager cloudSyncIsAvailable](self, "cloudSyncIsAvailable"))
    {
      OSLogForCategory(CFSTR("Default"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[RCCloudSyncAccessManager setTccCloudAccess:].cold.2(self, v5);
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (a3 == 1)
  {
LABEL_10:
    if (TCCAccessSetForBundleId())
      return;
    goto LABEL_11;
  }
  if (a3 || !TCCAccessResetForBundleId())
  {
LABEL_11:
    OSLogForCategory(CFSTR("Default"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[RCCloudSyncAccessManager setTccCloudAccess:].cold.1(a3, v5);
LABEL_13:

  }
}

- (void)_availabilityChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__RCCloudSyncAccessManager__availabilityChanged__block_invoke;
  block[3] = &unk_1E769BF30;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __48__RCCloudSyncAccessManager__availabilityChanged__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    v4 = (void *)v1;
    v3 = objc_opt_respondsToSelector();
    v2 = v4;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v4, "cloudSyncAvailabilityChanged");
      v2 = v4;
    }
  }

}

- (RCCloudSyncAccessManagerDelegate)delegate
{
  return (RCCloudSyncAccessManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)tccCloudAccess
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[RCCloudSyncAccessManager tccCloudAccess]";
  _os_log_error_impl(&dword_1BD830000, log, OS_LOG_TYPE_ERROR, "%s -- TCCAccessCopyInformationForBundleId failed", (uint8_t *)&v1, 0xCu);
}

- (void)setTccCloudAccess:(int)a1 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[RCCloudSyncAccessManager setTccCloudAccess:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to set TCCCloudAccess to %i\n", (uint8_t *)&v2, 0x12u);
}

- (void)setTccCloudAccess:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  const __CFString *v4;
  _BOOL4 v5;
  const __CFString *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "aa_isUsingiCloud"))
    v4 = CFSTR("is");
  else
    v4 = CFSTR("is not");
  v5 = +[RCManagedConfigurationHelper cloudSyncIsAllowed](RCManagedConfigurationHelper, "cloudSyncIsAllowed");
  v6 = CFSTR("does not");
  v8 = "-[RCCloudSyncAccessManager setTccCloudAccess:]";
  v7 = 136315650;
  v9 = 2112;
  v10 = v4;
  if (v5)
    v6 = CFSTR("does");
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1BD830000, a2, OS_LOG_TYPE_ERROR, "%s -- Attempting to enable cloud sync when not available - User %@ logged in, Managed Configuration %@ allow cloud sync", (uint8_t *)&v7, 0x20u);

}

@end
