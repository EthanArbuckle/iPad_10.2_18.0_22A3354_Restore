@implementation PSCellularManagementCache

+ (id)sharedInstance
{
  if (qword_253E975F8 != -1)
    dispatch_once(&qword_253E975F8, &__block_literal_global);
  return (id)_MergedGlobals_2;
}

void __43__PSCellularManagementCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSCellularManagementCache initPrivate]([PSCellularManagementCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSCellularManagementCache *v2;
  PSCellularManagementCache *v3;
  NSSet *managedCellDataAppCache;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSCellularManagementCache;
  v2 = -[PSCellularManagementCache init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    managedCellDataAppCache = v2->_managedCellDataAppCache;
    v2->_managedCellDataAppCache = 0;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel_willEnterForeground, *MEMORY[0x24BDF75D0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_managedConfigurationSettingsDidChange, *MEMORY[0x24BE63740], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_managedConfigurationProfileListDidChange, *MEMORY[0x24BE63B78], 0);

  }
  return v3;
}

- (PSCellularManagementCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSCellularManagementCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSCellularManagementCache init]";
    _os_log_error_impl(&dword_2188BE000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)clearCache
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSCellularManagementCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Clearing cellular management cache", v4, 2u);
  }

  -[PSCellularManagementCache setManagedCellDataAppCache:](self, "setManagedCellDataAppCache:", 0);
}

- (void)willEnterForeground
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSCellularManagementCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received willEnterForeground notification", v4, 2u);
  }

  -[PSCellularManagementCache clearCache](self, "clearCache");
}

- (void)managedConfigurationSettingsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSCellularManagementCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationSettingsDidChange notification", v4, 2u);
  }

  -[PSCellularManagementCache clearCache](self, "clearCache");
}

- (void)managedConfigurationProfileListDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSCellularManagementCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationProfileListDidChange notification", v4, 2u);
  }

  -[PSCellularManagementCache clearCache](self, "clearCache");
}

- (BOOL)isGlobalDataModificationRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637A8]) == 2;

  return v3;
}

- (NSString)mdmName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installedProfileWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "friendlyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)managedAppBundleIDs
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedAppIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)managedCellDataAppBundleIDs
{
  PSCellularManagementCache *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  PSCellularManagementCache *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v2 = self;
  v21 = *MEMORY[0x24BDAC8D0];
  -[PSCellularManagementCache managedCellDataAppCache](self, "managedCellDataAppCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v15 = v2;
    -[PSCellularManagementCache managedAppBundleIDs](v2, "managedAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
          +[PSAppDataUsagePolicyCache sharedInstance](PSAppDataUsagePolicyCache, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "policiesFor:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isManaged");

          if (v13)
            objc_msgSend(v4, "addObject:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v2 = v15;
    -[PSCellularManagementCache setManagedCellDataAppCache:](v15, "setManagedCellDataAppCache:", v4);

  }
  -[PSCellularManagementCache managedCellDataAppCache](v2, "managedCellDataAppCache");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasManagedCellularData
{
  void *v2;
  BOOL v3;

  -[PSCellularManagementCache managedCellDataAppBundleIDs](self, "managedCellDataAppBundleIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isManaged:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  id v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSCellularManagementCache managedCellDataAppBundleIDs](self, "managedCellDataAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  -[PSCellularManagementCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("is not managed");
    if (v6)
      v8 = CFSTR("is managed");
    v10 = 138543618;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_2188BE000, v7, OS_LOG_TYPE_INFO, "For %{public}@, policy: %@", (uint8_t *)&v10, 0x16u);
  }

  return v6;
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("CellularManagement"));
}

- (NSSet)managedCellDataAppCache
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManagedCellDataAppCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedCellDataAppCache, 0);
}

@end
