@implementation BRCUserDefaults

- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  void *v19;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self->_cache;
  objc_sync_enter(v13);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
      v16 = 0;
    else
      v16 = v14;
    objc_sync_exit(v13);

  }
  else
  {
    -[BRCUserDefaults _loadObjectForKey:inheritFromGlobal:suiteName:validateWithBlock:](self, "_loadObjectForKey:inheritFromGlobal:suiteName:validateWithBlock:", v10, v8, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v19, v10);
    if (!v18)

    objc_sync_exit(v13);
    v14 = v18;
    v16 = v14;
  }

  return v16;
}

- (BOOL)fpfsUploadV2
{
  return _os_feature_enabled_impl();
}

+ (id)defaultsForMangledID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isShared") & 1) != 0)
  {
    objc_msgSend(a1, "defaultsForSharedZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_userDefaultsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appLibraryOrZoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "defaultsForIdentifier:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_userDefaultsManager
{
  void *v2;
  void *v3;
  id v4;
  BRCUserDefaultsManager *v5;

  if (_userDefaultsManager_once != -1)
    dispatch_once(&_userDefaultsManager_once, &__block_literal_global_322_0);
  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "br_currentPersonaID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)_userDefaultsManager_userDefaultsManagers;
  objc_sync_enter(v4);
  objc_msgSend((id)_userDefaultsManager_userDefaultsManagers, "objectForKeyedSubscript:", v3);
  v5 = (BRCUserDefaultsManager *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[BRCUserDefaultsManager initWithPersonaID:]([BRCUserDefaultsManager alloc], "initWithPersonaID:", v3);
    objc_msgSend((id)_userDefaultsManager_userDefaultsManagers, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)shouldBoostDefaultZone
{
  if (-[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17498]))
    return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("should-boost-defaultZone"), 0, 0);
  else
    return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("should-boost-defaultZone"), 1);
}

- (double)periodicSyncTimeInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.time-interval"), 0.0, 1.79769313e308, 21600.0);
  return result;
}

- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 validateWithBlock:(id)a5
{
  return -[BRCUserDefaults objectForKey:inheritFromGlobal:suiteName:validateWithBlock:](self, "objectForKey:inheritFromGlobal:suiteName:validateWithBlock:", a3, a4, 0, a5);
}

- (double)foregroundGracePeriod
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("foreground-grace-period"), 0.0, 1.79769313e308, 120.0);
  return result;
}

- (double)doubleForKey:(id)a3 min:(double)a4 max:(double)a5 byDefault:(double)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;

  v10 = a3;
  if (a4 >= a5)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.3();

  }
  if (a4 > a6)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.2();

  }
  if (a6 > a5)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.1();

  }
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = __50__BRCUserDefaults_doubleForKey_min_max_byDefault___block_invoke;
  v25 = &unk_24FE494F8;
  v27 = a6;
  v28 = a4;
  v29 = a5;
  v26 = v10;
  v11 = v10;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v11, 1, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue", v22, v23, v24, v25);
  v14 = v13;

  return v14;
}

- (BOOL)BOOLForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  BOOL v17;

  v6 = a4;
  v8 = a3;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __58__BRCUserDefaults_BOOLForKey_inheritFromGlobal_byDefault___block_invoke;
  v15 = &unk_24FE49548;
  v17 = a5;
  v16 = v8;
  v9 = v8;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v9, v6, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v10, "BOOLValue", v12, v13, v14, v15);

  return (char)self;
}

- (BOOL)BOOLForKey:(id)a3 byDefault:(BOOL)a4
{
  return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", a3, 1, a4);
}

void __39__BRCUserDefaults__userDefaultsManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_userDefaultsManager_userDefaultsManagers;
  _userDefaultsManager_userDefaultsManagers = v0;

}

+ (id)defaultsForMetadataContainer
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_userDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsForIdentifier:", CFSTR("container-metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultsForSharedZone
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_userDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsForIdentifier:", *MEMORY[0x24BE17590]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultsForSideCar
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_userDefaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultsForIdentifier:", *MEMORY[0x24BE17900]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_userDefaultsManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServerConfigurationURL:whenLoaded:", v7, v6);

}

+ (id)cachedServerConfigurationPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("CloudDocs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("server-conflig.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)loadCachedServerConfiguration
{
  id v2;

  objc_msgSend(a1, "_userDefaultsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadCachedServerConfiguration");

}

+ (void)reset
{
  id v2;

  objc_msgSend(a1, "_userDefaultsManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (BRCUserDefaults)initWithServerConfiguration:(id)a3 globalUserDefaults:(id)a4 clientZoneIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  BRCUserDefaults *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *cache;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BRCUserDefaults;
  v12 = -[BRCUserDefaults init](&v16, sel_init);
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v12->_cache;
    v12->_cache = v13;

    objc_storeStrong((id *)&v12->_serverContainerConfigurationDict, a3);
    objc_storeStrong((id *)&v12->_globalUserDefault, a4);
    objc_storeStrong((id *)&v12->_clientZoneIdentifier, a5);
  }

  return v12;
}

- (id)initAsGlobalWithServerConfiguration:(id)a3
{
  return -[BRCUserDefaults initWithServerConfiguration:globalUserDefaults:clientZoneIdentifier:](self, "initWithServerConfiguration:globalUserDefaults:clientZoneIdentifier:", a3, 0, 0);
}

- (BOOL)_isSharedDefaults
{
  return -[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17590]);
}

- (id)_loadObjectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, id);
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  BRCUserDefaults *globalUserDefault;
  id v24;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v8 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id))a6;
  -[BRCUserDefaults _serverDefaultForKey:](self, "_serverDefaultForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412802;
      v27 = v10;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v14;
      _os_log_debug_impl(&dword_230455000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] server default for %@: %@%@", (uint8_t *)&v26, 0x20u);
    }

  }
  if (v11)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if (self->_clientZoneIdentifier)
  {
    objc_msgSend(v16, "dictionaryForKey:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v10);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (!v19)
      goto LABEL_18;
LABEL_13:
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138412802;
      v27 = v10;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v20;
      _os_log_debug_impl(&dword_230455000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] user default for %@: %@%@", (uint8_t *)&v26, 0x20u);
    }

    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "containsString:", CFSTR("server-only")) & 1) == 0)
  {
    objc_msgSend(v17, "valueForKey:", v10);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19)
      goto LABEL_13;
  }
LABEL_18:
  v19 = v13;
  if (!v13 && v8)
  {
    globalUserDefault = self->_globalUserDefault;
    if (globalUserDefault)
    {
      -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](globalUserDefault, "objectForKey:inheritFromGlobal:validateWithBlock:", v10, 1, v12);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (v19)
        goto LABEL_22;
    }
    else
    {
      v19 = 0;
    }
  }
LABEL_16:
  if (v12)
  {
    v12[2](v12, v19);
    v22 = objc_claimAutoreleasedReturnValue();

    v19 = (id)v22;
  }
LABEL_22:
  v24 = v19;

  return v24;
}

- (id)_serverDefaultForKey:(id)a3
{
  id v4;
  id v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int *v22;
  void *v23;
  NSObject *v24;
  id v26;
  BRCUserDefaults *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BRVersion();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_27;
  v26 = v4;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = self;
  v6 = self->_serverContainerConfigurationDict;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "hasPrefix:", CFSTR("defaults.clouddocs.")))
        {
          objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("defaults.clouddocs."), "length"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v5, "addObject:", v12);
          }
          else
          {
            brc_bread_crumbs();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v11;
              v35 = 2112;
              v36 = v13;
              _os_log_fault_impl(&dword_230455000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no version for key: %@%@", buf, 0x16u);
            }

          }
        }
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_336);
  v15 = objc_msgSend(v5, "count");
  v4 = v26;
  if (v15 - 1 < 0)
  {
LABEL_26:

    self = v27;
LABEL_27:
    -[NSDictionary valueForKey:](self->_serverContainerConfigurationDict, "valueForKey:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v16 = v15;
  v17 = &dword_230455000;
  while (1)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", --v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "compare:options:", v18, 64) != -1)
    {
      objc_msgSend(CFSTR("defaults.clouddocs."), "stringByAppendingString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v27->_serverContainerConfigurationDict, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v22 = v17;
        brc_bread_crumbs();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v23;
          _os_log_fault_impl(v22, v24, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: perVersionDict%@", buf, 0xCu);
        }

        v17 = v22;
      }
      objc_msgSend(v20, "valueForKey:", v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
        break;
    }

    if (v16 < 1)
      goto LABEL_26;
  }

LABEL_28:
  return v21;
}

uint64_t __40__BRCUserDefaults__serverDefaultForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 64);
}

- (int)intForKey:(id)a3 min:(int)a4 max:(int)a5 byDefault:(int)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  int v23;
  int v24;
  int v25;

  v10 = a3;
  if (a4 >= a5)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.3();

  }
  if (a4 > a6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.2();

  }
  if (a6 > a5)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.1();

  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __47__BRCUserDefaults_intForKey_min_max_byDefault___block_invoke;
  v21[3] = &unk_24FE494D0;
  v23 = a6;
  v24 = a4;
  v25 = a5;
  v22 = v10;
  v11 = v10;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v11, 1, v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  return v13;
}

id __47__BRCUserDefaults_intForKey_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(unsigned int *)(a1 + 40);
  v5 = v3;
  v6 = 0x24BDD1000uLL;
  if (!v5)
  {
    v7 = v4;
LABEL_3:

    v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v5, "intValue");
    if ((int)v10 >= *(_DWORD *)(a1 + 44))
    {
      v7 = v10;
      if ((int)v10 <= *(_DWORD *)(a1 + 48))
        goto LABEL_3;
    }
  }

  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = *(_DWORD *)(a1 + 44);
    v14 = *(_DWORD *)(a1 + 48);
    v16 = *(_DWORD *)(a1 + 40);
    v17 = 138413570;
    v18 = v13;
    v19 = 2112;
    v20 = v5;
    v21 = 1024;
    v22 = v15;
    v23 = 1024;
    v24 = v14;
    v25 = 1024;
    v26 = v16;
    v27 = 2112;
    v28 = v11;
    _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%d,%d]; using default:%d%@",
      (uint8_t *)&v17,
      0x32u);
  }

  v6 = 0x24BDD1000;
LABEL_4:
  objc_msgSend(*(id *)(v6 + 1760), "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unsigned)unsignedIntForKey:(id)a3 min:(unsigned int)a4 max:(unsigned int)a5 byDefault:(unsigned int)a6
{
  return -[BRCUserDefaults unsignedIntForKey:inheritFromGlobal:min:max:byDefault:](self, "unsignedIntForKey:inheritFromGlobal:min:max:byDefault:", a3, 1, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (unsigned)unsignedIntForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(unsigned int)a5 max:(unsigned int)a6 byDefault:(unsigned int)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;

  v10 = a4;
  v12 = a3;
  if (a5 >= a6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.3();

  }
  if (a5 > a7)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.2();

  }
  if (a7 > a6)
  {
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.1();

  }
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__BRCUserDefaults_unsignedIntForKey_inheritFromGlobal_min_max_byDefault___block_invoke;
  v23[3] = &unk_24FE494D0;
  v25 = a7;
  v26 = a5;
  v27 = a6;
  v24 = v12;
  v13 = v12;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v13, v10, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  return v15;
}

id __73__BRCUserDefaults_unsignedIntForKey_inheritFromGlobal_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(unsigned int *)(a1 + 40);
  v5 = v3;
  v6 = 0x24BDD1000uLL;
  if (!v5)
  {
    v7 = v4;
LABEL_3:

    v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v5, "intValue");
    if (v10 >= *(_DWORD *)(a1 + 44))
    {
      v7 = v10;
      if (v10 <= *(_DWORD *)(a1 + 48))
        goto LABEL_3;
    }
  }

  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = *(_DWORD *)(a1 + 44);
    v14 = *(_DWORD *)(a1 + 48);
    v16 = *(_DWORD *)(a1 + 40);
    v17 = 138413570;
    v18 = v13;
    v19 = 2112;
    v20 = v5;
    v21 = 1024;
    v22 = v15;
    v23 = 1024;
    v24 = v14;
    v25 = 1024;
    v26 = v16;
    v27 = 2112;
    v28 = v11;
    _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%d,%d]; using default:%d%@",
      (uint8_t *)&v17,
      0x32u);
  }

  v6 = 0x24BDD1000;
LABEL_4:
  objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)unsignedLongLongForKey:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5 byDefault:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v10 = a3;
  if (a4 >= a5)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.3();

  }
  if (a4 > a6)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.2();

  }
  if (a6 > a5)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.1();

  }
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __60__BRCUserDefaults_unsignedLongLongForKey_min_max_byDefault___block_invoke;
  v24 = &unk_24FE494F8;
  v27 = a4;
  v28 = a5;
  v25 = v10;
  v26 = a6;
  v11 = v10;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v11, 1, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedLongLongValue", v21, v22, v23, v24);

  return v13;
}

id __60__BRCUserDefaults_unsignedLongLongForKey_min_max_byDefault___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1[5];
  v5 = v3;
  v6 = 0x24BDD1000uLL;
  if (!v5)
  {
    v7 = v4;
LABEL_3:

    v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = objc_msgSend(v5, "longLongValue");
    if (v10 >= a1[6])
    {
      v7 = v10;
      if (v10 <= a1[7])
        goto LABEL_3;
    }
  }

  brc_bread_crumbs();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    v13 = a1[6];
    v14 = a1[7];
    v15 = a1[4];
    v16 = a1[5];
    v17 = 138413570;
    v18 = v15;
    v19 = 2112;
    v20 = v5;
    v21 = 2048;
    v22 = v13;
    v23 = 2048;
    v24 = v14;
    v25 = 2048;
    v26 = v16;
    v27 = 2112;
    v28 = v11;
    _os_log_error_impl(&dword_230455000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%lld,%lld]; using default:%lld%@",
      (uint8_t *)&v17,
      0x3Eu);
  }

  v6 = 0x24BDD1000;
LABEL_4:
  objc_msgSend(*(id *)(v6 + 1760), "numberWithUnsignedLongLong:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (float)floatForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(float)a5 max:(float)a6 byDefault:(float)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  float v26;
  float v27;
  float v28;

  v10 = a4;
  v12 = a3;
  if (a5 >= a6)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.3();

  }
  if (a5 > a7)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.2();

  }
  if (a7 > a6)
  {
    brc_bread_crumbs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      -[BRCUserDefaults intForKey:min:max:byDefault:].cold.1();

  }
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __67__BRCUserDefaults_floatForKey_inheritFromGlobal_min_max_byDefault___block_invoke;
  v24[3] = &unk_24FE494D0;
  v26 = a7;
  v27 = a5;
  v28 = a6;
  v25 = v12;
  v13 = v12;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v13, v10, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  return v16;
}

id __67__BRCUserDefaults_floatForKey_inheritFromGlobal_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  id v5;
  unint64_t v6;
  float v7;
  double v8;
  void *v9;
  double v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(float *)(a1 + 40);
  v5 = v3;
  v6 = 0x24BDD1000uLL;
  if (!v5)
  {
    v7 = v4;
LABEL_3:

    v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v11;
    if (*(float *)(a1 + 44) <= v7 && *(float *)(a1 + 48) >= v7)
      goto LABEL_3;
  }

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(float *)(a1 + 44);
    v16 = *(float *)(a1 + 48);
    v17 = *(float *)(a1 + 40);
    v18 = 138413570;
    v19 = v14;
    v20 = 2112;
    v21 = v5;
    v22 = 2048;
    v23 = v15;
    v24 = 2048;
    v25 = v16;
    v26 = 2048;
    v27 = v17;
    v28 = 2112;
    v29 = v12;
    _os_log_error_impl(&dword_230455000, v13, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%f,%f]; using default:%f%@",
      (uint8_t *)&v18,
      0x3Eu);
  }

  v6 = 0x24BDD1000;
LABEL_4:
  *(float *)&v8 = v4;
  objc_msgSend(*(id *)(v6 + 1760), "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (float)floatForKey:(id)a3 min:(float)a4 max:(float)a5 byDefault:(float)a6
{
  float result;

  -[BRCUserDefaults floatForKey:inheritFromGlobal:min:max:byDefault:](self, "floatForKey:inheritFromGlobal:min:max:byDefault:", a3, 1);
  return result;
}

- (id)stringForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__BRCUserDefaults_stringForKey_inheritFromGlobal_byDefault___block_invoke;
  v12[3] = &unk_24FE49520;
  v13 = v8;
  v9 = v8;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", a3, v5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__BRCUserDefaults_stringForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v3;
  if ((isKindOfClass & 1) == 0)
    v5 = *(void **)(a1 + 32);
  v6 = v5;

  return v6;
}

- (id)stringForKey:(id)a3 byDefault:(id)a4
{
  return -[BRCUserDefaults stringForKey:inheritFromGlobal:byDefault:](self, "stringForKey:inheritFromGlobal:byDefault:", a3, 1, a4);
}

id __50__BRCUserDefaults_doubleForKey_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v12 = *(double *)(a1 + 40);
  if (validateUserDouble(v3, (double *)(a1 + 48), (double *)(a1 + 56), &v12) == 2)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      v14 = v10;
      v15 = 2112;
      v16 = v3;
      v17 = 2048;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2048;
      v22 = v11;
      v23 = 2112;
      v24 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%f,%f]; using default:%f%@",
        buf,
        0x3Eu);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__BRCUserDefaults_BOOLForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  const char *v9;
  unsigned __int8 v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10 = *(_BYTE *)(a1 + 40);
  if (validateUserBool(v3, &v10) == 2)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        v9 = "YES";
      else
        v9 = "NO";
      *(_DWORD *)buf = 138413058;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      v15 = 2080;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      _os_log_error_impl(&dword_230455000, v5, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@; using default:%s%@",
        buf,
        0x2Au);
    }

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexSetForKey:(id)a3 byDefault:(id)a4
{
  return -[BRCUserDefaults indexSetForKey:inheritFromGlobal:byDefault:](self, "indexSetForKey:inheritFromGlobal:byDefault:", a3, 1, a4);
}

- (id)indexSetForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__BRCUserDefaults_indexSetForKey_inheritFromGlobal_byDefault___block_invoke;
  v12[3] = &unk_24FE49520;
  v13 = v8;
  v9 = v8;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", a3, v5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __62__BRCUserDefaults_indexSetForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "br_decodeIndexStringToIndexSet"), (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v4 = *(id *)(a1 + 32);
  }

  return v4;
}

- (id)xpcActivityDictionaryForKey:(id)a3 byDefault:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__BRCUserDefaults_xpcActivityDictionaryForKey_byDefault___block_invoke;
  v12[3] = &unk_24FE49570;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", v8, 1, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__BRCUserDefaults_xpcActivityDictionaryForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  xpc_object_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE buf[12];
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  void *v70;
  _QWORD v71[5];
  _BYTE v72[128];
  _QWORD v73[3];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3)
  {
    v9 = 0;
    goto LABEL_38;
  }
  v51 = a1;
  v52 = (void *)v4;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v73[0] = CFSTR("interval");
  v73[1] = CFSTR("delay");
  v73[2] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (!v7)
  {
    v9 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v59;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v59 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
      *(_QWORD *)buf = 0;
      v57 = 0x403E000000000000;
      objc_msgSend(v3, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = validateUserDouble(v13, (double *)&v57, 0, (double *)buf);

      if (v14 == 2)
      {
        v15 = v9;
        v9 = v12;
      }
      else
      {
        if (v14 != 1)
          continue;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)buf);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v15, v12);
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  }
  while (v8);
LABEL_17:

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v71[0] = CFSTR("repeat");
  v71[1] = CFSTR("powernap");
  v71[2] = CFSTR("battery");
  v71[3] = CFSTR("screen.sleep");
  v71[4] = CFSTR("disk-intensive");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
  if (!v17)
  {
    v5 = v52;
    goto LABEL_31;
  }
  v18 = v17;
  v19 = *(_QWORD *)v54;
  v5 = v52;
  while (2)
  {
    v20 = 0;
    while (2)
    {
      if (*(_QWORD *)v54 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v20);
      buf[0] = 0;
      objc_msgSend(v3, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = validateUserBool(v22, buf);

      if (v23 == 2)
      {
        v24 = v9;
        v9 = v21;
LABEL_26:

      }
      else if (v23 == 1)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", buf[0]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v24, v21);
        goto LABEL_26;
      }
      if (v18 != ++v20)
        continue;
      break;
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    if (v18)
      continue;
    break;
  }
LABEL_31:

  v25 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setWithObjects:", v26, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("priority"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = v28;
  v31 = v30;
  if (!v29)
  {

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v31 && !objc_msgSend(v31, "containsObject:", v29))
  {

    v29 = 0;
    v9 = CFSTR("priority");
    goto LABEL_34;
  }
  v50 = objc_retainAutorelease(v29);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("priority"));
LABEL_33:
  if (v9)
  {
LABEL_34:
    brc_bread_crumbs();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
    {
      v49 = *(_QWORD *)(v51 + 32);
      v48 = *(_QWORD *)(v51 + 40);
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v48;
      v63 = 2112;
      v64 = v9;
      v65 = 2112;
      v66 = v3;
      v67 = 2112;
      v68 = v49;
      v69 = 2112;
      v70 = v32;
      _os_log_error_impl(&dword_230455000, v33, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@.%@: %@; using default:%@%@",
        buf,
        0x34u);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", *(_QWORD *)(v51 + 32));
    v34 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v34;
  }

LABEL_38:
  v35 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("interval"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x24BDAC5F0], objc_msgSend(v36, "longLongValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("delay"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x24BDAC5B8], objc_msgSend(v38, "longLongValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("grace"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x24BDAC5D8], objc_msgSend(v39, "longLongValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("repeat"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC6B8], objc_msgSend(v40, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("priority"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
    xpc_dictionary_set_string(v35, (const char *)*MEMORY[0x24BDAC698], (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("battery"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC598], objc_msgSend(v42, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("powernap"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC688], objc_msgSend(v43, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("screen.sleep"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC6E8], objc_msgSend(v44, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disk-intensive"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC5C0], objc_msgSend(v45, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("may.reboot"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x24BDAC640], objc_msgSend(v46, "BOOLValue"));

  return v35;
}

- (unint64_t)maxXattrBlobSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fs.xattr-max-size"), 0, -1, 0x8000);
}

- (unint64_t)maxPreservedXattrBlobSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fs.preserved-xattr-max-size"), 0, -1, 0x8000);
}

- (BOOL)shouldFetchAllChanges
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.down.fetch-all-changes"), 1);
}

- (unsigned)maxRecordCountInFetchRecordsOperation
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.down.batchsize"), 1, 1000000, 200);
}

- (unsigned)maxRecordCountInModifyRecordsOperation
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.up.batchsize"), 1, 1000000, 200);
}

- (unsigned)maxRecordCountWhenListingDirChanges
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("list-dir.batchsize"), 1, 1000000, 64);
}

- (unint64_t)listDirChangesCancelDelay
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("list-dir.cancel-delay"), 0, -1, 10000000000);
}

- (unint64_t)rescheduleItemsRecursivelyBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("applyscheduler.rescheduleItemsRecursively.batchsize"), 0, -1, 200);
}

- (float)modifyRecordsCountMultiplicativeDecrease
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v2) = 0;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 0.5;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.batchsize.decrease.factor"), v2, v3, v4);
  return result;
}

- (float)modifyRecordsCountAdditiveIncreaseFraction
{
  unsigned int v3;
  unsigned int v4;

  v3 = -[BRCUserDefaults maxRecordCountInModifyRecordsOperation](self, "maxRecordCountInModifyRecordsOperation");
  v4 = -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.up.batchsize.increase"), 1, 100, 10);
  if (v3)
    return (float)v4 / (float)v3;
  else
    return 0.000001;
}

- (unsigned)maxRecordCountInClientZoneModifyRecordsOperation
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.appcontainers.batchsize"), 1, 1000000, 10);
}

- (unsigned)maxRecordCountInQuerySharedRecordsOperation
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.down.sharequerysize"), 1, 1000000, 200);
}

- (unsigned)maxRelativePathDepth
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fs.maxdepth"), 1, 10000, 80);
}

- (unsigned)maxSyncPathDepth
{
  uint64_t v3;

  v3 = -[BRCUserDefaults maxRelativePathDepth](self, "maxRelativePathDepth");
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.maxdepth"), v3, 10000, v3);
}

- (unsigned)treeEnumeratorBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("container.local.treeEnumerator"), 4, 0x7FFFFFFFLL, 100);
}

- (id)_extensionSetForKey:(id)a3 startingWithExtensions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__BRCUserDefaults__extensionSetForKey_startingWithExtensions___block_invoke;
  v10[3] = &unk_24FE49520;
  v11 = v6;
  v7 = v6;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", a3, 1, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __62__BRCUserDefaults__extensionSetForKey_startingWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_UTISetFor:(id)a3 startingWithExtensions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __53__BRCUserDefaults__UTISetFor_startingWithExtensions___block_invoke;
  v10[3] = &unk_24FE49520;
  v11 = v6;
  v7 = v6;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", a3, 1, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __53__BRCUserDefaults__UTISetFor_startingWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSSet)packageExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.pkg.extensions"), &unk_24FEB4B28);
}

- (NSSet)blacklistedPackageExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.pkg.blacklist.extensions"), &unk_24FEB4B40);
}

- (NSSet)iworkShareableExtensions
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE176A0], "iWorkShareableExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.shareable.iwork.extensions"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)shouldFixupBundleBitOnPackages
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fs.bundle-bit.should-fixup.ios"), 1);
}

- (NSSet)extensionsSkippingBundleBitFixup
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.bundle-bit.fixup.backlist.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)shouldBeGreedyExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.greedy.extensions.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)nonAutoEvictableExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.non-auto-evictable.extensions.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)nonEvictableExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.non-evictable.extensions.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)nonEvictablePathComponents
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("fs.non-evictable.path-components.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)nonAutoEvictableUTIs
{
  return (NSSet *)-[BRCUserDefaults _UTISetFor:startingWithExtensions:](self, "_UTISetFor:startingWithExtensions:", CFSTR("fs.non-auto-evictable.utis.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)autoEvictableUTIs
{
  return (NSSet *)-[BRCUserDefaults _UTISetFor:startingWithExtensions:](self, "_UTISetFor:startingWithExtensions:", CFSTR("fs.auto-evictable.utis.ios"), MEMORY[0x24BDBD1A8]);
}

- (NSSet)blacklistedThumbnailExtensions
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("doc.thumbnail-blacklist.extensions"), &unk_24FEB4B58);
}

- (unsigned)_umaskForKey:(id)a3
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", a3, 0, 63, 18);
}

- (unsigned)stageFileUmask
{
  return -[BRCUserDefaults _umaskForKey:](self, "_umaskForKey:", CFSTR("stage.umask.file"));
}

- (unsigned)stageFSRootUmask
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("stage.umask.fsroot"), 0, 63, 63);
}

- (unsigned)stageDirectoryUmask
{
  return -[BRCUserDefaults _umaskForKey:](self, "_umaskForKey:", CFSTR("stage.umask.directory"));
}

- (unsigned)stageInPackageDirectoryUmask
{
  return -[BRCUserDefaults _umaskForKey:](self, "_umaskForKey:", CFSTR("stage.umask.package.directory"));
}

- (unsigned)stageInPackageFileUmask
{
  return -[BRCUserDefaults _umaskForKey:](self, "_umaskForKey:", CFSTR("stage.umask.package.file"));
}

- (OS_xpc_object)configurationUpdateXPCActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("interval");
  v3 = *MEMORY[0x24BDAC600];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 2 * *MEMORY[0x24BDAC600]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v12[3] = MEMORY[0x24BDBD1C8];
  v11[3] = CFSTR("repeat");
  v11[4] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = CFSTR("battery");
  v12[4] = v7;
  v12[5] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("configuration.automatic.xpc"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v9;
}

- (OS_xpc_object)transmogrifyXPCActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("interval");
  v3 = *MEMORY[0x24BDAC600];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 3 * *MEMORY[0x24BDAC600]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v12[3] = MEMORY[0x24BDBD1C8];
  v11[3] = CFSTR("repeat");
  v11[4] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = CFSTR("battery");
  v12[4] = v7;
  v12[5] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("transmogrify.xpc"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v9;
}

- (NSArray)syncThrottles
{
  return (NSArray *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync-throttles"), 1, &__block_literal_global_1137);
}

id __32__BRCUserDefaults_syncThrottles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)appLibraryScanThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3668;
  v10[1] = &unk_24FEB3680;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB3668;
  v10[3] = &unk_24FEB3698;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__BRCUserDefaults_appLibraryScanThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("fsreader.container.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __47__BRCUserDefaults_appLibraryScanThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)lostItemThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB36E0;
  v10[1] = &unk_24FEB36F8;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4CF0;
  v10[3] = &unk_24FEB3710;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__BRCUserDefaults_lostItemThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("fsreader.lost.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __41__BRCUserDefaults_lostItemThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)applyThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3728;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D00;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__BRCUserDefaults_applyThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("fswriter.apply.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __38__BRCUserDefaults_applyThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)downloadThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3728;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D00;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36C8;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__BRCUserDefaults_downloadThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("transfer.download.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __41__BRCUserDefaults_downloadThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)uploadThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3770;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D00;
  v10[3] = &unk_24FEB3788;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BRCUserDefaults_uploadThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("transfer.upload.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __39__BRCUserDefaults_uploadThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)uploadFileModifiedThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3668;
  v10[1] = &unk_24FEB36B0;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB37A0;
  v10[3] = &unk_24FEB37B8;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__BRCUserDefaults_uploadFileModifiedThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("transfer.upload.file-modified.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __51__BRCUserDefaults_uploadFileModifiedThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)perItemSyncUpThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB37D0;
  v10[1] = &unk_24FEB37E8;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB3710;
  v10[3] = &unk_24FEB3800;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3818;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BRCUserDefaults_perItemSyncUpThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync-up.error.per-item.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __46__BRCUserDefaults_perItemSyncUpThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (unint64_t)availableQuotaComfortSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("quota.available.comfort-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x40000000);
}

- (double)quotaFetchPacerDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.quota.fetch-delay"), 0.0, 1.79769313e308, 30.0);
  return result;
}

- (double)appsFetchPacerDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("apps-fetch-delay"), 0.0, 1.79769313e308, 20.0);
  return result;
}

- (BOOL)skipPerItemSyncUpThrottling
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync-up.per-item.throttling.skip"), 0);
}

- (BOOL)considerSyncUpBatchFailuresAsSuccessForThrottling
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync-up.batch-failures.throttling.skip"), 1);
}

- (NSDictionary)operationFailureThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3668;
  v10[1] = &unk_24FEB37E8;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB3830;
  v10[3] = &unk_24FEB3800;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3818;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__BRCUserDefaults_operationFailureThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("operation.failure.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __49__BRCUserDefaults_operationFailureThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)appLibraryResetThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3848;
  v10[1] = &unk_24FEB3860;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB3830;
  v10[3] = &unk_24FEB36B0;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3800;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__BRCUserDefaults_appLibraryResetThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("container.reset.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __48__BRCUserDefaults_appLibraryResetThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)sharedAppLibraryResetThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB37E8;
  v10[1] = &unk_24FEB3878;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D10;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3800;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__BRCUserDefaults_sharedAppLibraryResetThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("shared-container.reset.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __54__BRCUserDefaults_sharedAppLibraryResetThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSArray)telemetryRTCAllowedZoneNamePrefixes
{
  void *v2;
  void *v3;

  -[BRCUserDefaults stringForKey:byDefault:](self, "stringForKey:byDefault:", CFSTR("telemetry.rtc.allowed-zone-name-prefixes"), CFSTR("com.apple.,iCloud.com.apple."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (double)telemetryRTCPacerMinFireInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("telemetry.rtc.min-fire-interval"), 1.0, 1.79769313e308, 5.0);
  return result;
}

- (NSDictionary)appLibraryAliasRemovalThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3668;
  v10[1] = &unk_24FEB37E8;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB3830;
  v10[3] = &unk_24FEB3800;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3818;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__BRCUserDefaults_appLibraryAliasRemovalThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("container.reset.alias-removal.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __55__BRCUserDefaults_appLibraryAliasRemovalThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BRCSyncOperationThrottleParams)syncDownThrottle
{
  return (BRCSyncOperationThrottleParams *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.down.throttle"), 1, &__block_literal_global_1183);
}

BRCSyncOperationThrottleParams *__35__BRCUserDefaults_syncDownThrottle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BRCSyncOperationThrottleParams *v3;
  void *v4;
  BRCSyncOperationThrottleParams *v5;
  _QWORD v7[7];
  _QWORD v8[8];

  v8[7] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = [BRCSyncOperationThrottleParams alloc];
  v7[0] = CFSTR("wait-at-least");
  v7[1] = CFSTR("wait-at-most");
  v8[0] = &unk_24FEB4D20;
  v8[1] = &unk_24FEB36B0;
  v7[2] = CFSTR("success-ratio");
  v7[3] = CFSTR("quota-clear-ratio");
  v8[2] = &unk_24FEB4D30;
  v8[3] = &unk_24FEB4D40;
  v7[4] = CFSTR("error-ratio");
  v7[5] = CFSTR("kickback-delay");
  v8[4] = &unk_24FEB3668;
  v8[5] = &unk_24FEB37B8;
  v7[6] = CFSTR("kickback-ratio");
  v8[6] = &unk_24FEB4D10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCSyncOperationThrottleParams initWithParams:defaults:](v3, "initWithParams:defaults:", v2, v4);

  return v5;
}

- (BRCSyncOperationThrottleParams)syncUpThrottle
{
  return (BRCSyncOperationThrottleParams *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.up.throttle"), 1, &__block_literal_global_1190);
}

BRCSyncOperationThrottleParams *__33__BRCUserDefaults_syncUpThrottle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  BRCSyncOperationThrottleParams *v3;
  void *v4;
  BRCSyncOperationThrottleParams *v5;
  _QWORD v7[7];
  _QWORD v8[8];

  v8[7] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = [BRCSyncOperationThrottleParams alloc];
  v7[0] = CFSTR("wait-at-least");
  v7[1] = CFSTR("wait-at-most");
  v8[0] = &unk_24FEB4D20;
  v8[1] = &unk_24FEB36B0;
  v7[2] = CFSTR("success-ratio");
  v7[3] = CFSTR("quota-clear-ratio");
  v8[2] = &unk_24FEB4D30;
  v8[3] = &unk_24FEB4D40;
  v7[4] = CFSTR("error-ratio");
  v7[5] = CFSTR("kickback-delay");
  v8[4] = &unk_24FEB3668;
  v8[5] = &unk_24FEB37B8;
  v7[6] = CFSTR("kickback-ratio");
  v8[6] = &unk_24FEB4D10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BRCSyncOperationThrottleParams initWithParams:defaults:](v3, "initWithParams:defaults:", v2, v4);

  return v5;
}

- (NSDictionary)syncClientZoneThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3890;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D10;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB38A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__BRCUserDefaults_syncClientZoneThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.container.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __47__BRCUserDefaults_syncClientZoneThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)syncClientZoneErrorThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3668;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D10;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB38A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__BRCUserDefaults_syncClientZoneErrorThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.container.error.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __52__BRCUserDefaults_syncClientZoneErrorThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BOOL)treatPerItemThrottleAsOperationSuccess
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.treat-per-item-throttle-as-success"), 1);
}

- (unint64_t)autoBugCaptureReporterThrottleCapacity
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("auto-bug-capture-reporter.throttle.capacity"), 1, 0xFFFFFFFFLL, 16);
}

- (double)autoBugCaptureReporterThrottlePeriod
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("auto-bug-capture-reporter.throttle.period"), 1.0, 1.79769313e308, 3600.0);
  return result;
}

- (float)syncUpMinimalBudget
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 10.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.budget.minimal"), v2, v3, v4);
  return result;
}

- (float)_defaultSyncUpDailyBudget
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v4) = 1315859240;
  LODWORD(v2) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.budget.daily.default"), v2, v3, v4);
  return result;
}

- (float)syncUpDailyBudget
{
  double v2;
  double v3;
  double v4;
  NSString *clientZoneIdentifier;
  int v7;
  float result;

  clientZoneIdentifier = self->_clientZoneIdentifier;
  v7 = 1343554297;
  if (clientZoneIdentifier
    && !-[NSString isEqualToString:](clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17550]))
  {
    -[BRCUserDefaults _defaultSyncUpDailyBudget](self, "_defaultSyncUpDailyBudget");
    v7 = LODWORD(v2);
  }
  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = v7;
  -[BRCUserDefaults floatForKey:inheritFromGlobal:min:max:byDefault:](self, "floatForKey:inheritFromGlobal:min:max:byDefault:", CFSTR("sync.up.budget.daily"), 0, v2, v3, v4);
  return result;
}

- (float)_defaultSyncUpHourlyBudget
{
  float v3;
  double v4;
  double v5;
  double v6;
  float result;

  -[BRCUserDefaults _defaultSyncUpDailyBudget](self, "_defaultSyncUpDailyBudget");
  *(float *)&v4 = v3 / 6.0;
  LODWORD(v5) = 2139095039;
  LODWORD(v6) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.budget.hourly.default"), v6, v5, v4);
  return result;
}

- (float)syncUpHourlyBudget
{
  NSString *clientZoneIdentifier;
  double v4;
  double v5;
  double v6;
  float result;

  clientZoneIdentifier = self->_clientZoneIdentifier;
  if (clientZoneIdentifier
    && !-[NSString isEqualToString:](clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17550]))
  {
    -[BRCUserDefaults _defaultSyncUpHourlyBudget](self, "_defaultSyncUpHourlyBudget");
    LODWORD(v6) = LODWORD(v4);
  }
  else
  {
    -[BRCUserDefaults syncUpDailyBudget](self, "syncUpDailyBudget");
    *(float *)&v6 = *(float *)&v4 / 6.0;
  }
  LODWORD(v5) = 2139095039;
  LODWORD(v4) = 0;
  -[BRCUserDefaults floatForKey:inheritFromGlobal:min:max:byDefault:](self, "floatForKey:inheritFromGlobal:min:max:byDefault:", CFSTR("sync.up.budget.hourly"), 0, v4, v5, v6);
  return result;
}

- (float)_defaultSyncUpMinutelyBudget
{
  float v3;
  double v4;
  double v5;
  double v6;
  float result;

  -[BRCUserDefaults _defaultSyncUpHourlyBudget](self, "_defaultSyncUpHourlyBudget");
  *(float *)&v4 = v3 / 5.0;
  LODWORD(v5) = 2139095039;
  LODWORD(v6) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.budget.minutely.default"), v6, v5, v4);
  return result;
}

- (float)syncUpMinutelyBudget
{
  NSString *clientZoneIdentifier;
  double v4;
  double v5;
  double v6;
  float result;

  clientZoneIdentifier = self->_clientZoneIdentifier;
  if (clientZoneIdentifier
    && !-[NSString isEqualToString:](clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17550]))
  {
    -[BRCUserDefaults _defaultSyncUpMinutelyBudget](self, "_defaultSyncUpMinutelyBudget");
    LODWORD(v6) = LODWORD(v4);
  }
  else
  {
    -[BRCUserDefaults syncUpHourlyBudget](self, "syncUpHourlyBudget");
    *(float *)&v6 = *(float *)&v4 / 6.0;
  }
  LODWORD(v5) = 2139095039;
  LODWORD(v4) = 0;
  -[BRCUserDefaults floatForKey:inheritFromGlobal:min:max:byDefault:](self, "floatForKey:inheritFromGlobal:min:max:byDefault:", CFSTR("sync.up.budget.minutely"), 0, v4, v5, v6);
  return result;
}

- (float)syncUpInitialItemCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v4) = 1036831949;
  LODWORD(v2) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.initial-item"), v2, v3, v4);
  return result;
}

- (float)syncUpStructureCreateCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 1.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.structure.create"), v2, v3, v4);
  return result;
}

- (float)syncUpStructureEditCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 1.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.structure.edit"), v2, v3, v4);
  return result;
}

- (float)syncUpStructureDeleteCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 1.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.structure.delete"), v2, v3, v4);
  return result;
}

- (float)syncUpDataCreateCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 2.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.data.create"), v2, v3, v4);
  return result;
}

- (float)syncUpDataEditCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 2.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.data.edit"), v2, v3, v4);
  return result;
}

- (float)syncUpDataDeleteCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 2.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.data.delete"), v2, v3, v4);
  return result;
}

- (float)syncUpDocumentCreateCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 0.5;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.document.create"), v2, v3, v4);
  return result;
}

- (float)syncUpDocumentEditCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 2.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.document.edit"), v2, v3, v4);
  return result;
}

- (float)syncUpDocumentDeleteCost
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 1.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync.up.cost.document.delete"), v2, v3, v4);
  return result;
}

- (unint64_t)sharedDbSyncDownCoalesceNanoseconds
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sync.down.shared.coalesce.nanoseconds"), 0, -1, 30000000000);
}

- (NSDictionary)readerThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB38C0;
  v10[1] = &unk_24FEB3680;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB37A0;
  v10[3] = &unk_24FEB38D8;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3710;
  v10[5] = &unk_24FEB38A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__BRCUserDefaults_readerThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("fsreader.coordination.throttle"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __39__BRCUserDefaults_readerThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BOOL)dbTraced
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.trace"), 1);
}

- (BOOL)dbProfiled
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.profile"), 0);
}

- (BOOL)dbVerboseProfiled
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.verbose.profile"), 0);
}

- (int)dbBatchSize
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("db.batch-size"), 1, 1000000000, 10000);
}

- (double)dbBatchDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("db.batch-delay"), 0.01, 30.0, 0.5);
  return result;
}

- (BOOL)allowReadOnlyDBInIPC
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.allow-read-only-in-ipc"), 1);
}

- (int64_t)dbAutovacuumBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("db.autovacuum-batch-size"), 0x40000, 0x7FFFFFFFFFFFFFFFLL, 10485760);
}

- (float)dbAutovacuumRatio
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 1120403456;
  LODWORD(v2) = 0;
  LODWORD(v4) = 20.0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("db.autovacuum-ratio"), v2, v3, v4);
  return result;
}

- (BOOL)skipServerSideThrottling
{
  return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("server.throttling.disable"), 1, 0);
}

- (BOOL)shouldAppLibraryBeGreedy
{
  _BOOL8 v3;

  v3 = -[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17498]);
  return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("container.greedy"), v3 ^ 1, v3);
}

- (BOOL)shouldSessionBeGreedy
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("session.should-be-greedy.ios"), 0);
}

- (unint64_t)maxTotalFilesCount
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("max-file-count"), 0, 0x7FFFFFFFFFFFFFFFLL, 500000);
}

- (unint64_t)maxNumberOfFilesInAFolder
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("max-file-count.per-folder"), 0, 0x7FFFFFFFFFFFFFFFLL, 500000);
}

- (int64_t)uploadMaxFileSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("upload.max-file-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x1900000000);
}

- (int64_t)uploadMaxInPkgFileSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("upload.max-in-pkg-file-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x1900000000);
}

- (int64_t)uploadMaxPkgFileSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("upload.max-pkg-file-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x3200000000);
}

- (unint64_t)uploadBatchRecordsCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("upload.batch.records.count"), 0, 0xFFFFFFFFLL, 200);
}

- (unint64_t)uploadBatchCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("upload.batch.count"), 0, 0xFFFFFFFFLL, 2);
}

- (unint64_t)downloadBatchRecordsCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("download.batch.records.count"), 0, 0xFFFFFFFFLL, 200);
}

- (unint64_t)downloadBatchCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("download.batch.count"), 0, 0xFFFFFFFFLL, 2);
}

- (unint64_t)downloadWillRetryProgressMaxCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("download.will-retry-progress.max-count"), 0, 0xFFFFFFFFLL, 200);
}

- (unint64_t)zoneHealthSyncDownBatchRecordsCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("zone-health.sync-down.batch.count"), 0, 0xFFFFFFFFLL, 200);
}

- (unint64_t)sharedDBSyncDownBatchRecordsCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("shared-db.sync-down.batch.count"), 0, 0xFFFFFFFFLL, 200);
}

- (double)systemReachabilityStableStateMinThreshold
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("system.reachability.stable-state-min-threshold"), 0.001, 300.0, 60.0);
  return result;
}

- (double)systemReachabilityMinDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("system.reachability.min-delay"), 0.001, 172800.0, 1.0);
  return result;
}

- (double)systemReachabilityMaxDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("system.reachability.max-delay"), 0.001, 172800.0, 5.0);
  return result;
}

- (double)systemPowerLatency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("system.power"), 0.001, 172800.0, 10.0);
  return result;
}

- (double)systemLowDiskLatency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("system.lowdisk"), 0.001, 172800.0, 5.0);
  return result;
}

- (double)readerIOsCancelDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsreader.coordination.delay"), 0.0, 600.0, 10.0);
  return result;
}

- (double)writerIOsCancelDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fswriter.coordination.delay"), 0.0, 600.0, 10.0);
  return result;
}

- (int)readerMaxConcurrentIOs
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("fsreader.coordination.count"), 32, 100000, 128);
}

- (int)writerMaxConcurrentIOs
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("fswriter.coordination.count"), 32, 100000, 128);
}

- (int)readerScanBatchSize
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("fsreader.scan.batch-size"), 1, 100000, 20);
}

- (int)fpfsMigrationCleanupBatchSize
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("fpfs-migration-cleanup-batch-size"), 1, 100000, 20);
}

- (double)readerPackageProcessingDelay
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsreader.scan.package-delay"), 0.0, 86400.0, 1.0);
  return result;
}

- (unsigned)applySchedulerJobMaxRetriesBeforeAssert
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("applyscheduler.job-max-retries-before-assert"), 0, 0xFFFFFFFFLL, 20);
}

- (int)writerApplyBatchSize
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("fswriter.apply.batch-size"), 1, 100000, 20);
}

- (double)readerLostItemBackoff
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsreader.lost.backoff"), 0.001, 432000.0, 3.0);
  return result;
}

- (double)markChildLostBackoff
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsreader.lost-child.backoff"), 0.001, 432000.0, 0.001);
  return result;
}

- (double)fseventsLatency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsevents.latency"), 0.01, 60.0, 0.5);
  return result;
}

- (double)fseventsResetBackoff
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fsevents.reset-backoff"), 0.02, 600.0, 10.0);
  return result;
}

- (unint64_t)fseventQueueBufferSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fsevents.queue-buffer-size"), 1, -1, 200);
}

- (unint64_t)fseventProcessBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fsevents.process-batch-size"), 1, -1, 50);
}

- (int)transferQueueMinBatchSize
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("transfer.batch-size.min"), 0, 1000000, 16);
}

- (int)transferQueueMinConcurrentOperations
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("transfer.width.min"), 0, 1000000, 16);
}

- (int)transferQueueMaxConcurrentOperations
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("transfer.width.max"), 0, 1000000, 200);
}

- (double)transferQueueTransferBudget
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("transfer.budget"), 0.0, INFINITY, 33554432.0);
  return result;
}

- (BOOL)sessionZombiesEnabled
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("account.debug.zombie.enable"), 0);
}

- (BOOL)nsurlsessiondEnabled
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("nsurlsessiond"), 1);
}

- (OS_xpc_object)stageGCXPCActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("interval");
  v3 = *MEMORY[0x24BDAC608];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC608]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v11[1] = CFSTR("delay");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC618]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  v11[2] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v6;
  v12[3] = MEMORY[0x24BDBD1C8];
  v11[3] = CFSTR("repeat");
  v11[4] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("stage.gc.xpc"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v9;
}

- (OS_xpc_object)cacheDeletePushXPCActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[8];

  v11[7] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("delay");
  v3 = *MEMORY[0x24BDAC620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC620]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("repeat");
  v10[3] = CFSTR("screen.sleep");
  v11[1] = v5;
  v11[2] = MEMORY[0x24BDBD1C8];
  v11[3] = MEMORY[0x24BDBD1C8];
  v11[4] = MEMORY[0x24BDBD1C8];
  v10[4] = CFSTR("powernap");
  v10[5] = CFSTR("battery");
  v11[5] = MEMORY[0x24BDBD1C0];
  v10[6] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("cachedelete-push.xpc"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v8;
}

- (NSString)serverConfigurationURL
{
  return (NSString *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("server-config-url"), 1, &__block_literal_global_1299);
}

__CFString *__41__BRCUserDefaults_serverConfigurationURL__block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v2 = CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/clouddocs/clouddocs-1.0.plist");
  }
  return v2;
}

- (unsigned)publishURLTimeout
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("url.publish-timeout"), 0, 0xFFFFFFFFLL, 2592000);
}

- (int64_t)minFileSizeForGraveyard
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("min-file-size-graveyard"), 0, 0x7FFFFFFFFFFFFFFFLL, 4096);
}

- (int64_t)minAutomaticallyEvictableFilesize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("min-evictable-size.auto.ios"), 0, 0x7FFFFFFFFFFFFFFFLL, 4096);
}

- (unsigned)logoutTimeout
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("logout-timeout"), 0, 0xFFFFFFFFLL, 60);
}

- (double)forceForegroundGracePeriod
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("force-foreground-grace-period"), 0.0, 1.79769313e308, 300.0);
  return result;
}

- (BOOL)forceBatchFailureWhenReceivingAssetTokenExpiration
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("force-batch-failure-when-token-expires"), 1);
}

- (double)accessTimeDeltaInLowUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-access-time.low-urgency"), 0.0, 1.79769313e308, 1209600.0);
  return result;
}

- (double)accessTimeDeltaInMedUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-access-time.med-urgency"), 0.0, 1.79769313e308, 604800.0);
  return result;
}

- (double)accessTimeDeltaInHighUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-access-time.high-urgency"), 0.0, 1.79769313e308, 600.0);
  return result;
}

- (double)accessTimeDeltaInVeryHighUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-access-time.very-high-urgency"), 0.0, 1.79769313e308, 0.0);
  return result;
}

- (double)defaultTimeDeltaForEviction
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.eviction.default-access-time"), 0.0, 1.79769313e308, 1209600.0);
  return result;
}

- (double)onDiskAccessTimeDeltaInLowUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-ondisk-access-time.low-urgency"), 0.0, 1.79769313e308, 172800.0);
  return result;
}

- (double)onDiskAccessTimeDeltaInMedUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-ondisk-access-time.med-urgency"), 0.0, 1.79769313e308, 28800.0);
  return result;
}

- (double)onDiskAccessTimeDeltaInHighUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-ondisk-access-time.high-urgency"), 0.0, 1.79769313e308, 600.0);
  return result;
}

- (double)onDiskAccessTimeDeltaInVeryHighUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-ondisk-access-time.very-high-urgency"), 0.0, 1.79769313e308, 0.0);
  return result;
}

- (double)defaultOnDiskAccessTimeDefaultForEviction
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.eviction.default-ondisk-access-time"), 0.0, 1.79769313e308, 1209600.0);
  return result;
}

- (double)graveyardAgeDeltaInLowUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-graveyard-time.low-urgency"), 0.0, 1.79769313e308, 259200.0);
  return result;
}

- (double)graveyardAgeDeltaInMedUrgency
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.max-graveyard-time.med-urgency"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)xattrAgeDelta
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.xattr-age-time"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)minFetchQuotaInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fetch-quota-interval"), 0.0, 1.79769313e308, 3600.0);
  return result;
}

- (double)minForceTelemetrySyncInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fetch-force-telemetry-sync-interval"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)purgePacerInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-reclaimer.purge-pacer-interval"), 0.0, 1.79769313e308, 10.0);
  return result;
}

- (int64_t)dbReclaimableSpaceThreshold
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-reclaimer.db-reclaimable-space-threshold"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x100000);
}

- (double)cacheDeleteRecomputeInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-reclaimer.cache-delete-recompute-interval"), 0.0, 1.79769313e308, 3600.0);
  return result;
}

- (double)maximumDocumentAgeToBeGreedy
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("maximum-document-age-to-be-greedy"), 0.0, 1.79769313e308, 7776000.0);
  return result;
}

- (unint64_t)statementCacheMaxCountForServerTruth
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("statement-cache-max-count-server-truth"), 0, 0xFFFFFFFFLL, 30);
}

- (unint64_t)statementCacheMaxCountForClientTruth
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("statement-cache-max-count-client-truth"), 0, 0xFFFFFFFFLL, 300);
}

- (unint64_t)copyShareIDsBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("copy-share-ids-batch-size"), 1, 0xFFFFFFFFLL, 20);
}

- (unint64_t)aliasDeletionBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("alias-deletion-batch-size"), 1, 0xFFFFFFFFLL, 20);
}

- (unint64_t)minimumDiskSpaceRequiredToDownload
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-space.minimum-required-to-download.ios"), 1, 0x7FFFFFFFFFFFFFFFLL, 419430400);
}

- (unint64_t)minimumDiskSpaceRequiredToDownloadUserInitiated
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-space.minimum-required-to-download-user-initiated"), 1, 0x7FFFFFFFFFFFFFFFLL, 20971520);
}

- (unint64_t)minimumDiskSpaceRequiredToBeGreedy
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-space.minimum-required-to-be-greedy.ios"), 1, 0x7FFFFFFFFFFFFFFFLL, 0x80000000);
}

- (unint64_t)diskSpaceRequiredToReturnToGreedyState
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-space.required-to-return-to-greedy-state.ios"), 1, 0x7FFFFFFFFFFFFFFFLL, 0x200000000);
}

- (float)relativeDiskSpaceRequiredToReturnToGreedyState
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v2) = 0;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("disk-space.required-to-return-to-greedy-state.relative.ios"), v2, v3, v4);
  return result;
}

- (unint64_t)maximumAccountSizeToBeAlwaysGreedy
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("account-size.maximum-to-be-always-greedy"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x140000000);
}

- (unint64_t)minimumDiskSpaceRequiredToBeFunctional
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("disk-space.minimum-required-to-be-functional"), 1, 0x7FFFFFFFFFFFFFFFLL, 20971520);
}

- (double)diskSpaceCheckInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space.check-interval"), 0.0, 1.79769313e308, 30.0);
  return result;
}

- (double)activeDownloadSizeRefreshInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space.active-download-refresh-interval"), 0.0, 1.79769313e308, 10.0);
  return result;
}

- (BOOL)shouldDisplayUploadNotification
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("user-notification.upload"), 0);
}

- (BOOL)spotlightIndexingEnabled
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("spotlight-indexer.enabled"), 1);
}

- (double)recentsEnumeratorPacerInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("spotlight-indexer.pacer-interval"), 0.0, 1.79769313e308, 0.1);
  return result;
}

- (unint64_t)recentsEnumeratorBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("spotlight-indexer.batch-size"), 1, 0x7FFFFFFFLL, 32);
}

- (unint64_t)recentsEnumeratorMaxHierarchyDepth
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("spotlight-indexer.max-depth"), 0, 0x7FFFFFFFLL, 16);
}

- (NSDictionary)recentsEnumeratorFailureThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB38F0;
  v10[1] = &unk_24FEB36F8;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D00;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB36C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BRCUserDefaults_recentsEnumeratorFailureThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("spotlight-indexer.failure-throttle-params"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __57__BRCUserDefaults_recentsEnumeratorFailureThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)migrationThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB3830;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB38F0;
  v10[3] = &unk_24FEB3908;
  v9[4] = CFSTR("forget-after");
  v10[4] = &unk_24FEB3800;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__BRCUserDefaults_migrationThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("migration.failure-throttle-params"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __42__BRCUserDefaults_migrationThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (double)intervalToWaitBeforeShowingAdditionalDescription
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("global-progress.additional.wait-trigger"), 1.0, 1.79769313e308, 10.0);
  return result;
}

- (int64_t)minimalSizeToShowAdditionalDescription
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("global-progress.additional.size-trigger"), 1, 0x7FFFFFFFFFFFFFFFLL, 52428800);
}

- (double)documentAccessHighPriorityInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("document-access.high-priority-download-interval"), 1.0, 1.79769313e308, 259200.0);
  return result;
}

- (double)packageExtensionPlistWriteInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("pkg-extension-plist.write-interval"), 0.0, 1.79769313e308, 5.0);
  return result;
}

- (int64_t)minFileSizeForThumbnailTransfer
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("doc.min-size-for-thumbnail"), 0, 0x7FFFFFFFFFFFFFFFLL, 0x100000);
}

- (unsigned)thumbnailTransferQueueWidth
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("doc.thumbnail-transfer-queue-width.ios"), 1, 0x7FFFFFFFLL, 4);
}

- (unint64_t)notifOverflowLimit
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("notif.overflow-limit"), 1, 0x7FFFFFFFLL, 2048);
}

- (unint64_t)notifGatherUpTo
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("notif.gather-up-to"), 1, 0x7FFFFFFFLL, 256);
}

- (unint64_t)notifBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("notif.batch-size"), 1, 0x7FFFFFFFLL, 64);
}

- (unint64_t)zoneHealthReportedRecordNamesCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("zone-health.reported-record-names-count"), 0, 0x7FFFFFFFLL, 10);
}

- (BOOL)onlyTreatCaughtUpAsConsistent
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.only-treat-caught-up-as-consistent"), 0);
}

- (NSSet)blacklistPCSPrep
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("zone-pcs-migration.blacklist-pcs-prep"), 1, &__block_literal_global_1418);
}

id __35__BRCUserDefaults_blacklistPCSPrep__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE17550];
  objc_msgSend(v2, "addObject:", *MEMORY[0x24BE17550]);
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", v3, *MEMORY[0x24BE17540], *MEMORY[0x24BE175C0], CFSTR("_defaultZone"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (BOOL)shouldPreparePCSMigration
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("zone-pcs-migration.should-prepare"), 1);
}

- (unint64_t)pcsChainingMaxPathDepth
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("pcs-chaining.max-path-depth"), 1, 0xFFFFFFFFLL, 512);
}

- (unint64_t)pcsChainingBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("pcs-chaining.batch-size"), 0, 0xFFFFFFFFLL, 200);
}

- (unint64_t)enhancedDrivePrivacyBasehashSaltingBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("enhanced-drive-privacy.basehash-salting.batch-size"), 0, 0xFFFFFFFFLL, 200);
}

- (BOOL)destroyiWorkShares
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sharing.destroy-iwork-shares"), 1);
}

- (unint64_t)readerMarkChildrenLostBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fsreader.lost.marklost.batchSize"), 10, 0xFFFFFFFFLL, 300);
}

- (unint64_t)lostScanDeepScanFirstThreshold
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fsreader.lost.deep-first-threshold"), 0, 0xFFFFFFFFLL, 5);
}

- (unsigned)bounceFileMaxRetries
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fswrite.bounce-file-max-retries"), 1, 0xFFFFFFFFLL, 1000);
}

- (double)bounceFileReportInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("fswrite.bounce-file-report-interval"), 1.0, 1.79769313e308, 43200.0);
  return result;
}

- (NSSet)excludedFilenamesWorthWarningAtLogout
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("excluded-filenames-worth-warning-at-logout"), 1, &__block_literal_global_1441);
}

id __56__BRCUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE17680], "defaultExcludedFilenamesWorthWarningAtLogout");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSSet)excludedFilenamesWorthPreserving
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("excluded-filenames-worth-preservering"), 1, &__block_literal_global_1445);
}

id __51__BRCUserDefaults_excludedFilenamesWorthPreserving__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE17680], "defaultExcludedFilenamesWorthPreserving");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (NSSet)excludedExtensionsWorthPreserving
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("excluded-extensions-worth-preservering"), 1, &__block_literal_global_1448);
}

id __52__BRCUserDefaults_excludedExtensionsWorthPreserving__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  _stringSetFromDefaultValue(a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE17680], "defaultExcludedExtensionsWorthPreserving");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (unsigned)ignoredQuarantineMask
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("ignored-quarantine-mask"), 0, 0x7FFFFFFFLL, 896);
}

- (BOOL)shouldAutoMigrateToCloudDocs
{
  if (-[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE172B0]))
    return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("should-auto-migrate"), 0, 0);
  else
    return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("should-auto-migrate"), 1);
}

+ (int)rampNumberWithSession:(id)a3
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a3, "accountDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "brc_SHA256");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") < 9)
    v5 = -1;
  else
    v5 = *(_QWORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes") % 0x64uLL;

  return v5;
}

- (BOOL)_shouldRampForKey:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;
  int v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v21;
  id v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", v6, 0, 100, 0);
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".carry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", v9, 0, 100, 0);

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".internal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", v11, 0, 100, 0);

  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".internal+carry"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", v13, 0, 100, 0);

  if (v8 > 0 || v10 > 0 || v12 > 0 || (v15 = 0, v14 >= 1))
  {
    v16 = +[BRCUserDefaults rampNumberWithSession:](BRCUserDefaults, "rampNumberWithSession:", v7);
    if (v16 >= v8)
    {
      v19 = v16;
      if (objc_msgSend(v7, "icloudAccountIsInCarry") && v19 < v10)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[BRCUserDefaults _shouldRampForKey:session:].cold.2();
      }
      else if (os_variant_has_internal_content() && v19 < v12)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[BRCUserDefaults _shouldRampForKey:session:].cold.3();
      }
      else if (objc_msgSend(v7, "icloudAccountIsInCarry")
             && os_variant_has_internal_content()
             && v19 < v14)
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 1;
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[BRCUserDefaults _shouldRampForKey:session:].cold.4();
      }
      else
      {
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v21 = 138413314;
          v22 = v6;
          v23 = 1024;
          v24 = v19;
          v25 = 1024;
          v26 = v8;
          v27 = 1024;
          v28 = v10;
          v29 = 2112;
          v30 = v17;
          _os_log_debug_impl(&dword_230455000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] We are denylisted from %@ because %d < %d and %d%@", (uint8_t *)&v21, 0x28u);
        }
        v15 = 0;
      }
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 1;
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[BRCUserDefaults _shouldRampForKey:session:].cold.1();
    }

  }
  return v15;
}

- (BOOL)optimisticallyPCSChainWithSession:(id)a3
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.optimistic-pcs-chaining"), -[BRCUserDefaults _shouldRampForKey:session:](self, "_shouldRampForKey:session:", CFSTR("sync.optimistic-chain-ramp"), a3));
}

- (BOOL)optimisticallyPCSChainDuringResetWithSession:(id)a3
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.reset.optimistic-chain"), -[BRCUserDefaults _shouldRampForKey:session:](self, "_shouldRampForKey:session:", CFSTR("sync.reset.optimistic-chain-ramp"), a3));
}

- (BOOL)aggressivelyPCSChainWithSession:(id)a3
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("aggressive-pcs-chaining"), -[BRCUserDefaults _shouldRampForKey:session:](self, "_shouldRampForKey:session:", CFSTR("sync.aggressive-chain-ramp"), a3));
}

- (OS_xpc_object)aggressivePCSChainActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24FEB37D0;
  v9[0] = CFSTR("delay");
  v9[1] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC630]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDBD1C0];
  v10[1] = v3;
  v10[2] = MEMORY[0x24BDBD1C0];
  v9[2] = CFSTR("repeat");
  v9[3] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v10[4] = v4;
  v9[4] = CFSTR("battery");
  v9[5] = CFSTR("screen.sleep");
  v10[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("agressive-pcs-activity"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v7;
}

- (OS_xpc_object)finishSaltingPartiallySaltedDirectoriesActivity
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v10[0] = &unk_24FEB37D0;
  v9[0] = CFSTR("delay");
  v9[1] = CFSTR("grace");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC600]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDBD1C0];
  v10[1] = v3;
  v10[2] = MEMORY[0x24BDBD1C0];
  v9[2] = CFSTR("repeat");
  v9[3] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v10[4] = v4;
  v9[4] = CFSTR("battery");
  v9[5] = CFSTR("screen.sleep");
  v10[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("salt-partially-salted"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v7;
}

- (BOOL)shouldFixupTargetCZMAliases
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("should-fixup-czm-aliases"), 1);
}

- (unint64_t)deleteShareIDBatchCount
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("delete-shareid-batch-count"), 0, 0x7FFFFFFFLL, 200);
}

- (unint64_t)maxFolderEnumerationCount
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("max-folder-enumeration-count"), 0, 0x7FFFFFFFLL, 200000);
}

- (unint64_t)maxFolderEnumerationDepth
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("max-folder-enumeration-depth"), 0, 0x7FFFFFFFLL, 20);
}

- (double)powerLogReportInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("power-log-report-interval"), 60.0, 1.79769313e308, 86400.0);
  return result;
}

- (unint64_t)sqliteCacheSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sqlite-cache-size.ios"), 0, 0x7FFFFFFFLL, 128);
}

- (unint64_t)sqliteCacheSpill
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sqlite-cache-spill.ios"), 0, 0x7FFFFFFFLL, 512);
}

- (double)downloadSizeRefreshInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("downloader.size-refresh-interval"), 0.0, 1.79769313e308, 10.0);
  return result;
}

- (char)forceSyncOverride
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("force-sync-override"), 0xFFFFFFFFLL, 1, 0);
}

- (unint64_t)utiCacheSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("uti-cache-size"), 0, 0x7FFFFFFFLL, 200);
}

- (unint64_t)fieldsToMoveOutOfTrashMask
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fields-to-move-out-of-trash-mask"), 0, -1, 0x20000);
}

- (unint64_t)applyCountToSignalFaultsLive
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("apply-count-to-signal-faults-live"), 0, -1, 10);
}

- (unint64_t)numberOfGreedyRecentlyUsedItems
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("greedy-recently-used-item-count"), 0, -1, 64);
}

- (unint64_t)computeEvictableBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("compute-evictable-batch-size"), 0, -1, 4096);
}

- (double)eventMetricTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("ck-event-metric-timeout"), 0.0, 1.79769313e308, 300.0);
  return result;
}

- (BOOL)shouldReportAllPerItemFailures
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("report-all-per-item-failures"), 1);
}

- (BOOL)should2PhasePCSChain
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("pcs-chain-2-phase"), 0);
}

- (unint64_t)pendingChangesStreamSoftOpenCount
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("pending-changes-soft-open"), 0, -1, 4);
}

- (unint64_t)pendingChangesStreamHardOpenCount
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("pending-changes-hard-open"), 0, -1, 8);
}

- (unint64_t)pendingChangesStreamCloseDelay
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("pending-changes-close-delay"), 0, -1, 2000000000);
}

- (int)discretionaryRecursiveListMaxOperationCount
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("recursive-list.discretionary.concurrent-operation-count"), 0xFFFFFFFFLL, 0x7FFFFFFFLL, 1);
}

- (int)nonDiscretionaryRecursiveListMaxOperationCount
{
  return -[BRCUserDefaults intForKey:min:max:byDefault:](self, "intForKey:min:max:byDefault:", CFSTR("recursive-list.non-discretionary.concurrent-operation-count"), 0xFFFFFFFFLL, 0x7FFFFFFFLL, 2);
}

- (int64_t)recursiveListFetchDirFaultBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("recursive-list.fetch-dir-fault.batch-size"), 1, -1, 200);
}

- (int64_t)dbMigrationBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("db-migration-batch-size"), 1, 0x7FFFFFFFFFFFFFFFLL, 0x4000);
}

- (BOOL)forceDeltaInitialSync
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("force-delta-initial-sync"), 0);
}

- (BOOL)blockApplyUntilList
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("block-apply-until-list"), 1);
}

- (BOOL)allowsDirectoryListBeforeInitialChangeToken
{
  const __CFString *v3;
  BRCUserDefaults *v4;
  uint64_t v5;

  if (-[BRCUserDefaults _isSharedDefaults](self, "_isSharedDefaults"))
  {
    v3 = CFSTR("allows-shared-directory-list-before-initial-change");
    v4 = self;
    v5 = 1;
  }
  else
  {
    v3 = CFSTR("allows-private-directory-list-before-initial-change");
    v4 = self;
    v5 = 0;
  }
  return -[BRCUserDefaults BOOLForKey:byDefault:](v4, "BOOLForKey:byDefault:", v3, v5);
}

- (BOOL)canSaveRecordsDirectlyForList
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.save-records-directly-for-list"), 1);
}

- (BOOL)canSaveRecordsDirectlyForDeltaSync
{
  _BOOL8 v3;

  v3 = -[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE17590]);
  return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("sync.save-records-directly-for-delta-sync"), v3 ^ 1, v3);
}

- (BOOL)canSaveRecordsDirectlyWithDeletes
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.save-records-directly-with-deletes"), 1);
}

- (BOOL)isBlacklistedFromFolderSharing
{
  _BOOL8 v3;

  v3 = -[NSString isEqualToString:](self->_clientZoneIdentifier, "isEqualToString:", *MEMORY[0x24BE172D0]);
  return -[BRCUserDefaults BOOLForKey:inheritFromGlobal:byDefault:](self, "BOOLForKey:inheritFromGlobal:byDefault:", CFSTR("sync.server-only.folder-sharing-blacklisted"), v3 ^ 1, v3);
}

- (BOOL)fetchContentRecordsInline
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.fetch-content-records-inline"), 1);
}

- (BOOL)fetchShareRecordsInline
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.fetch-share-records-inline"), 1);
}

- (unint64_t)qbsExpectedItemsFetchedPerInterval
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("qbs-telemetry.items-fetched-per-interval"), 0, 0x7FFFFFFFFFFFFFFFLL, 25000);
}

- (double)qbsExpectedItemsFetchedCheckInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("qbs-telemetry.items-fetched-check-interval"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)syncUpDelayForFailure
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync-up.delay-for-failure"), 0.0, 1.79769313e308, 540.0);
  return result;
}

- (double)syncDownDelayForFailure
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync-down.delay-for-failure"), 0.0, 1.79769313e308, 540.0);
  return result;
}

- (float)syncUpBackoffDelayForFailure
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v4) = 1142292480;
  LODWORD(v2) = 0;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync-up.backoff.delay-for-failure"), v2, v3, v4);
  return result;
}

- (float)syncUpBackoffRatioForFailure
{
  double v2;
  double v3;
  double v4;
  float result;

  LODWORD(v3) = 2139095039;
  LODWORD(v2) = 0;
  LODWORD(v4) = 0.75;
  -[BRCUserDefaults floatForKey:min:max:byDefault:](self, "floatForKey:min:max:byDefault:", CFSTR("sync-up.backoff.ratio-for-failure"), v2, v3, v4);
  return result;
}

- (unint64_t)minimumNumberOfFailuresBeforeReportingSyncBackoffRatio
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sync-up.backoff.min-failures-before-reporting-ratio"), 1, -1, 3);
}

- (unint64_t)syncUpRetryCountForFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sync-up.retry-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 10);
}

- (unint64_t)uploadRetryCountForFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("uploader.retry-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 20);
}

- (unint64_t)downloadRetryCountForFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("downloader.retry-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 12);
}

- (unint64_t)applyRetryCountForFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("apply.retry-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 12);
}

- (unint64_t)readerRetryCountForFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("reader.retry-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 100);
}

- (OS_xpc_object)fpfsMigrationTrialRefreshXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 6 * *MEMORY[0x24BDAC608]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C8];
  v8[2] = CFSTR("battery");
  v8[3] = CFSTR("screen.sleep");
  v8[4] = CFSTR("repeat");
  v9[3] = MEMORY[0x24BDBD1C0];
  v9[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("fpfs.migrator.scheduler.trial.refresh.xpc"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v6;
}

- (OS_xpc_object)fpfsMigrationSchedulerXPCActivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE17688], "isInternalBuild"))
    v3 = *MEMORY[0x24BDAC600];
  else
    v3 = 3 * *MEMORY[0x24BDAC600];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[0] = CFSTR("interval");
  v9[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v10[2] = MEMORY[0x24BDBD1C0];
  v9[2] = CFSTR("battery");
  v9[3] = CFSTR("screen.sleep");
  v9[4] = CFSTR("may.reboot");
  v10[3] = MEMORY[0x24BDBD1C8];
  v10[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("fpfs.migrator.scheduler.reboot.xpc"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v7;
}

- (OS_xpc_object)analyticsReportXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC600]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C0];
  v8[2] = CFSTR("battery");
  v8[3] = CFSTR("screen.sleep");
  v8[4] = CFSTR("repeat");
  v9[3] = MEMORY[0x24BDBD1C8];
  v9[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("analytics.report.xpc"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v6;
}

- (OS_xpc_object)appTelemetryGatherXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 2 * *MEMORY[0x24BDAC600]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C0];
  v8[2] = CFSTR("battery");
  v8[3] = CFSTR("screen.sleep");
  v8[4] = CFSTR("repeat");
  v9[3] = MEMORY[0x24BDBD1C8];
  v9[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("analytics.report.app-telemetry-gather.xpc"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v6;
}

- (BOOL)useFailIfOutdatedForResets
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.reset.fail-if-outdated"), 0);
}

- (NSString)fakeEtagForFailIfOutdated
{
  void *v2;

  -[BRCUserDefaults stringForKey:byDefault:](self, "stringForKey:byDefault:", CFSTR("sync.reset.fake-etag-for-fail-if-outdated"), CFSTR("0"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("nil")))
  {

    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)useShareReferenceOnSideCar
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.side-car.use-share-reference"), 1);
}

- (BOOL)shouldMigrateFetchShareAliases
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.should-migrate-fetch-share-aliases"), 1);
}

- (NSArray)carryPartitions
{
  void *v2;
  void *v3;

  -[BRCUserDefaults stringForKey:byDefault:](self, "stringForKey:byDefault:", CFSTR("sync.server-only.carry-partitions"), CFSTR("p97,p98"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (unint64_t)maxBackoffToRetryUserInitiated
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("user-initiated-max-backoff"), 0, -1, 60000000000);
}

- (BOOL)pcsChainShareAliases
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("should-pcs-chain-share-aliases"), 1);
}

- (int64_t)delayForStuckThrottle
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("sync.stuck-throttle-delay"), 0, -1, 86400000000000);
}

- (BOOL)forceFailIfExistOnRevival
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("force-fail-if-exists-on-revival"), 1);
}

- (BOOL)changeItemIDOnUnknownItem
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("change-item-id-on-unknown-item"), 1);
}

- (unint64_t)healthZoneMaxNumberOfResets
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("zone-health.max-number-of-resets"), 0, 0x7FFFFFFFFFFFFFFFLL, 5);
}

- (double)healthZoneTimeIntervalForMaxNumberOfResets
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("zone-health.max-number-of-resets-for-time-interval"), 0.0, 1.79769313e308, 3600.0);
  return result;
}

- (BOOL)reportXPCErrorOnPCSChain
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("report-xpc-error-on-pcs-chain"), 1);
}

- (int64_t)timeoutForCZMProcessing
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("czm-processing.timeout"), 0, 0x7FFFFFFFFFFFFFFFLL, 60);
}

- (BOOL)shouldReportTelemetryEvents
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("telemetry.should-report"), 1);
}

- (int64_t)telemetryEventQueueSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("telemetry.event-queue-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 500);
}

- (unsigned)telemetryEventQueueReductionAmount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("telemetry.event-queue-reduction"), 2, 0xFFFFFFFFLL, 250);
}

- (int64_t)telemetryEventReportBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("telemetry.report-batch-size"), 0, 0x7FFFFFFFFFFFFFFFLL, 10);
}

- (NSIndexSet)telemetryEventDisabledMessages
{
  return (NSIndexSet *)-[BRCUserDefaults indexSetForKey:byDefault:](self, "indexSetForKey:byDefault:", CFSTR("telemetry.disabled-messages"), 0);
}

- (int64_t)telemetryRetryCountForPermenentFailure
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("telemetry.retry-count-for-failure"), 0, 0x7FFFFFFFFFFFFFFFLL, 5);
}

- (double)telemetryApplySchedulerTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("telemetry.apply-scheduler-timeout"), 0.0, 1.79769313e308, 30.0);
  return result;
}

- (NSSet)telemetryHeaderSupportedClasses
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("telemetry.header-send-supported-classes"), 1, &__block_literal_global_1627);
}

id __50__BRCUserDefaults_telemetryHeaderSupportedClasses__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  Class v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _stringSetFromDefaultValue(a2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = NSClassFromString(*(NSString **)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (v9)
            objc_msgSend(v3, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (unint64_t)telemetryErrorDescriptionMaxLength
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("telemetry.error-description-length"), 0, 0xFFFFFFFFLL, 100);
}

- (NSSet)benignTelemetryErrorDescriptions
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("telemetry.benign-error-descriptions"), 1, &__block_literal_global_1639);
}

id __51__BRCUserDefaults_benignTelemetryErrorDescriptions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  _stringSetFromDefaultValue(a2, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("CKErrorZoneNotFound"), CFSTR("CKErrorSharedZoneNotFound"), CFSTR("CKErrorUserDeletedZone"), CFSTR("zone became healthy"), CFSTR("testing"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)deleteShareOnEmptySave
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sharing.delete-share-on-empty-save"), 1);
}

- (BOOL)preventRecordSyncWithoutDiffs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync-up.prevent-record-sync-without-diffs"), 1);
}

- (BOOL)stripBirthtimeFromSyncUpMaskOnDocuments
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync-up.strip-birthtime-on-documents"), 1);
}

- (BOOL)preventSharingFolderWithPendingDelete
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync-up.sharing.prevent-sharing-with-pending-delete"), 1);
}

- (unsigned)ubiquitousMigrationMaxBouncingAttempts
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("ubiquitous-migration-max-bouncing-attempts"), 0, 0xFFFFFFFFLL, 100);
}

- (id)_healthErrorSetForKey:(id)a3 byDefault:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__BRCUserDefaults__healthErrorSetForKey_byDefault___block_invoke;
  v10[3] = &unk_24FE49520;
  v11 = v6;
  v7 = v6;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", a3, 1, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __51__BRCUserDefaults__healthErrorSetForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _numberSetFromDefaultValue(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "intValue", v15) >= 20)
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v9;
            _os_log_fault_impl(&dword_230455000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [error intValue] < BRCProblemTypeMaxValue%@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v6 = v11;
    }
    while (v11);
  }
  if (v3)
  {
    v12 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (NSSet)healthErrorsForReset
{
  return (NSSet *)-[BRCUserDefaults _healthErrorSetForKey:byDefault:](self, "_healthErrorSetForKey:byDefault:", CFSTR("zone-health.errors-for-reset"), &unk_24FEB4B70);
}

- (NSSet)healthErrorsToReport
{
  return (NSSet *)-[BRCUserDefaults _healthErrorSetForKey:byDefault:](self, "_healthErrorSetForKey:byDefault:", CFSTR("zone-health.errors-to-report"), &unk_24FEB4B88);
}

- (NSSet)recordsToIgnoreOnSyncDown
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.ignored-record-names"), 1, &__block_literal_global_1689);
}

id __44__BRCUserDefaults_recordsToIgnoreOnSyncDown__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  _stringSetFromDefaultValue(a2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("directory/appData_com.apple.Desktop"), CFSTR("directory/appDocuments_com.apple.Desktop"), CFSTR("directory/appData_com.apple.Documents"), CFSTR("directory/appDocuments_com.apple.Documents"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (BOOL)preventConcurrentModifyRecordsOperations
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.prevent-concurrent-modify-records-operations"), 1);
}

- (OS_xpc_object)dbIntegrityCheckXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", 2 * *MEMORY[0x24BDAC600]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C0];
  v8[2] = CFSTR("battery");
  v8[3] = CFSTR("screen.sleep");
  v8[4] = CFSTR("repeat");
  v9[3] = MEMORY[0x24BDBD1C8];
  v9[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("db.integrity-check.xpc"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v6;
}

- (BOOL)integrityCheckContentPolicy
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check-content-policy"), 1);
}

- (BOOL)integrityCheckBoosting
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.integrity-check.boosting"), 1);
}

- (BOOL)dbIntegrityCheckApplyJobs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.apply"), 1);
}

- (BOOL)dbIntegrityCheckDownloadJobs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.download"), 1);
}

- (BOOL)dbIntegrityCheckUploadJobs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.upload"), 1);
}

- (BOOL)dbIntegrityCheckReaderJobs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.reader"), 1);
}

- (BOOL)dbIntegrityCheckSyncUpJobs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.sync-up"), 1);
}

- (BOOL)dbIntegrityCheckMissingShareOptions
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.share-options"), 1);
}

- (BOOL)dbIntegrityCheckBasehashSalting
{
  _BOOL4 v3;

  v3 = -[BRCUserDefaults supportsEnhancedDrivePrivacy](self, "supportsEnhancedDrivePrivacy");
  if (v3)
    LOBYTE(v3) = -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.basehash-salting"), 1);
  return v3;
}

- (BOOL)dbIntegrityCheckLostZombieDirectories
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("db.integrity-check.lost-zombie-directories"), 1);
}

- (BOOL)supportsServerSideAssetCopies
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("uploads.supports-server-side-asset-copies"), 1);
}

- (BOOL)fpfsOptimizeStorageAndSpeculativeDownload
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.optimize-storage-and-speculative-download"), 1);
}

- (BOOL)supportsEnhancedDrivePrivacy
{
  return _os_feature_enabled_impl();
}

- (BOOL)enhancedDrivePrivacyForced
{
  return 0;
}

- (unsigned)validationKeyTruncationLength
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.enhanced-drive-privacy.validation-key-length"), 1, 64, 4);
}

- (unsigned)timestampRoundingAmount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.enhanced-drive-privacy.timestamp-rounding-amount"), 60, 0x7FFFFFFFLL, 60);
}

- (BOOL)shouldSendRoundedTimestamps
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.enhanced-drive-privacy.send-rounded-timestamps"), 1);
}

- (unsigned)contentPolicyPropogationTimeInSec
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("content-policy-propogation-time-in-sec"), 0, 0xFFFFFFFFLL, 5);
}

- (double)operationTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("operation-timeout"), 60.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)thumbnailGenerationOperationTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("thumbnail-generation-operation-timeout"), 0.0, 1.79769313e308, 300.0);
  return result;
}

- (double)refreshRevisionMaxBackoff
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("refresh-revision-max-backoff"), 0.0, 1.79769313e308, 60.0);
  return result;
}

- (double)thumbnailGenerationForCollaborationUploadTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("thumbnail-generation-for-collaboration-timeout"), 0.0, 1.79769313e308, 20.0);
  return result;
}

- (unsigned)syncConsistencyFileChecksumRate
{
  return -[BRCUserDefaults unsignedIntForKey:inheritFromGlobal:min:max:byDefault:](self, "unsignedIntForKey:inheritFromGlobal:min:max:byDefault:", CFSTR("sync-consistency.file-checksum-rate"), 1, 0, 1000, 50);
}

- (unsigned)syncConsistencyPackageChecksumRate
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync-consistency.package-checksum-rate"), 0, 1000, 10);
}

- (unsigned)syncConsistencyMaxEventsCount
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync-consistency.max-events-count"), 0, 0xFFFFFFFFLL, 250);
}

- (BOOL)syncConsistencyCheckerEnabled
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.consistency-checker.enabled"), 1);
  return v3;
}

- (BOOL)syncConsistencyCheckerSnapshotting
{
  return _os_feature_enabled_impl();
}

- (OS_xpc_object)syncConsistencyCheckerXPCActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("interval");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", *MEMORY[0x24BDAC630]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("priority");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDAC6A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v9[2] = MEMORY[0x24BDBD1C0];
  v8[2] = CFSTR("battery");
  v8[3] = CFSTR("screen.sleep");
  v9[3] = MEMORY[0x24BDBD1C8];
  v9[4] = MEMORY[0x24BDBD1C8];
  v8[4] = CFSTR("disk-intensive");
  v8[5] = CFSTR("repeat");
  v9[5] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCUserDefaults xpcActivityDictionaryForKey:byDefault:](self, "xpcActivityDictionaryForKey:byDefault:", CFSTR("sync.consistency-check.xpc"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_xpc_object *)v6;
}

- (double)syncConsistencyXPCActivityDeferralCheckInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.consistency-check.deferral-check-interval"), 0.0, 1.79769313e308, 5.0);
  return result;
}

- (double)syncConsistencyXPCActivityCheckLeeway
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.consistency-check.deferral-check-leeway"), 0.0, 1.79769313e308, 3.0);
  return result;
}

- (double)syncConsistencyTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.consistency-check.timeout"), 0.0, 1.79769313e308, 3600.0);
  return result;
}

- (BOOL)skipContainerRecordsWithMissingAssets
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.container-metadata.skip-records-with-missing-assets"), 1);
}

- (int)setupAssistantReadyMaxWaitTimeInSec
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("daemon-start.setup-assistant-ready.max-wait-time-in-sec"), 1, 0x7FFFFFFFLL, 10);
}

- (unsigned)fpReadyForXpcCheckMaxWaitTimeInSec
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("daemon-start.FP-ready-for-xpc-check.max-wait-time-in-sec"), 1, 0xFFFFFFFFLL, 300);
}

- (double)maxPauseFileTimeout
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("iwork-collaboration.max-pause-file-timeout"), 0.0, 1.79769313e308, 2592000.0);
  return result;
}

- (unsigned)autoResumeSyncBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("iwork-collaboration.auto-resume-sync-batch-size"), 1, 0xFFFFFFFFLL, 200);
}

- (unsigned)iWorkFetchPausedFilesBatchSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("iwork-collaboration.fetch-paused-files-batch-size"), 1, 0xFFFFFFFFLL, 200);
}

- (unint64_t)lostItemUnderUnknownParentBeforeDeepScan
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("lost-scan.unknown-parent-before-deep-scan"), 0, -1, 1000);
}

- (NSDictionary)serverStitchingThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB38C0;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D10;
  v10[3] = &unk_24FEB3758;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB36B0;
  v10[5] = &unk_24FEB38A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__BRCUserDefaults_serverStitchingThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.server-stitching.throttle-params"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __48__BRCUserDefaults_serverStitchingThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)locateRecordsThrottleParams
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("start-after");
  v9[1] = CFSTR("give-up-after");
  v10[0] = &unk_24FEB37A0;
  v10[1] = &unk_24FEB3740;
  v9[2] = CFSTR("wait-at-least");
  v9[3] = CFSTR("wait-at-most");
  v10[2] = &unk_24FEB4D10;
  v10[3] = &unk_24FEB37B8;
  v9[4] = CFSTR("forget-after");
  v9[5] = CFSTR("max-elemnt-count");
  v10[4] = &unk_24FEB3788;
  v10[5] = &unk_24FEB38A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BRCUserDefaults_locateRecordsThrottleParams__block_invoke;
  v7[3] = &unk_24FE49520;
  v8 = v3;
  v4 = v3;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("sync.locate-records.throttle-params"), 1, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

id __46__BRCUserDefaults_locateRecordsThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (unsigned)subResourceFetchLoopCacheSize
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("sync.subresources.fetch-loop-cache-size"), 1, 0x7FFFFFFFLL, 20);
}

- (BOOL)fetchFullAppLibraryContents
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.fetch-full-contents"), 1);
}

- (BOOL)allowForceTelemetryDequeue
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("telemetry.allow-force-dequeue"), 1);
}

- (unsigned)forceTelemetryDequeuePercentage
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("telemetry.force-dequeue-percentage"), 0, 100, 75);
}

- (unsigned)highPriorityTelemetryEventsPercentage
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("telemetry.high-priority-event-percentage"), 0, 100, 50);
}

- (BOOL)rejectDeletionsBasedOnEtag
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.reject-delete-items-based-on-etag"), 0);
}

- (BOOL)testDevice
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("test-device"), 0);
}

- (BOOL)scheduleDeepScanOnFSEventsReset
{
  return !-[BRCUserDefaults testDevice](self, "testDevice")
      || -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("test.schedule-deep-scan-on-fsevents-reset"), 1);
}

- (unint64_t)resumeProgressBatchSize
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("progress.resume-batch-size"), 1, -1, 200);
}

- (BOOL)checkTombstoneEmbargoReparents
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.check-tombstone-embargo-reparents"), 1);
}

- (BOOL)reviveDeadDirsOnNewDirCreations
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.revive-dead-dirs-on-new-dir-creationss"), 1);
}

- (BOOL)recoverDamagedDocumentOnDisk
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("sync.recover-damaged-document-on-dir-disk"), 1);
}

- (id)_brErrorSetForKey:(id)a3 byDefault:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__BRCUserDefaults__brErrorSetForKey_byDefault___block_invoke;
  v10[3] = &unk_24FE49520;
  v11 = v6;
  v7 = v6;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:suiteName:validateWithBlock:](self, "objectForKey:inheritFromGlobal:suiteName:validateWithBlock:", a3, 1, CFSTR("com.apple.bird"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __47__BRCUserDefaults__brErrorSetForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  _numberSetFromDefaultValue(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "intValue", v15) <= 0)
        {
          brc_bread_crumbs();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            v21 = v9;
            _os_log_fault_impl(&dword_230455000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [errorID intValue] > 0%@", buf, 0xCu);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      v6 = v11;
    }
    while (v11);
  }
  if (v3)
  {
    v12 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 32));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (double)downloadStageAgeDelta
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.download-stage-age-time-fpfs"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)itemsCreationAgeDelta
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.item-creation-age-time-fpfs"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)liveItemsStageAgeDelta
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("disk-space-reclaimer.live-items-stage-age-delta-fpfs"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (unsigned)fpfsImportStatusTelemetryDaysThreshold
{
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x24BE17688], "isInternalBuild"))
    v3 = 0;
  else
    v3 = 2;
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fpfs.migration.import-status-telemetry-days-threshold"), 0, 1000000, v3);
}

- (unsigned)fpfsImportStatusTelemetryStuckMigrationDaysThreshold
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fpfs.migration.import-status-telemetry-stuck-migration-days-threshold"), 0, 1000000, 5);
}

- (BOOL)fpfsStuckMigrationTakeReconciledItemsIntoAccount
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.migration.stuck-migration-take-reconciled-items-into-account"), 0);
}

- (unsigned)fpfsStuckMigrationRecoveryDaysWithoutProgressThreshold
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fpfs.migration.stuck-migration-recovery-days-without-progress-threshold"), 0, 1000000, 2);
}

- (unsigned)fpfsStuckMigrationRecoveryDaysSinceImportStartedThreshold
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fpfs.migration.stuck-migration-recovery-days-since-import-started-threshold"), 0, 1000000, 9);
}

- (unsigned)fpfsStuckMigrationRecoveryDaysSinceUpgradeThreshold
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("fpfs.migration.stuck-migration-recovery-days-since-upgrade-threshold"), 0, 1000000, 2);
}

- (BOOL)requestCKCacheAssetClone
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("enable.ck-cache"), 1);
}

- (NSSet)sendTapToRadarForMigrationErrors
{
  return (NSSet *)-[BRCUserDefaults _brErrorSetForKey:byDefault:](self, "_brErrorSetForKey:byDefault:", CFSTR("fpfs.send-tap-to-radar-for-migration-errors"), &unk_24FEB4BA0);
}

- (BOOL)deleteFPFSDomainOnReimportRootError
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.delete-fpfs-domain-on-reimport-error"), 1);
}

- (BOOL)stripFileProviderXattrBeforeImport
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.strip-fp-xattr-on-import-domain"), 0);
}

- (unint64_t)itemsNotMigratedToInvestigateLimit
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fpfs.migration.items-not-migrated-investigation-count"), 0, -1, 100);
}

- (unint64_t)itemsNotMigratedTelemetryLimit
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fpfs.migration.items-not-migrated-telemetry-count"), 0, -1, 10);
}

- (unint64_t)migrationStatusPendingItemsTelemetryLimit
{
  return -[BRCUserDefaults unsignedLongLongForKey:min:max:byDefault:](self, "unsignedLongLongForKey:min:max:byDefault:", CFSTR("fpfs.migration.pending-items-status-telemetry-count"), 0, -1, 5);
}

- (BOOL)filterDecendantsOfNotMigratedFolders
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.filter-decendants-of-not-migrated-folders"), 1);
}

- (BOOL)failModifyRequestsWhenInFlightUnAckedChanges
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.sync.fail-modify-requests-with-in-flight-un-acked-changes"), 1);
}

- (BOOL)reimportRootContainerWhenDomainDecorationIsInvalid
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.reimport-root-container-when-domain-decoration-invalid"), 1);
}

- (BOOL)showNotificatioForTapToRadar
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.show-notification-for-tap-to-radar"), 1);
}

- (BOOL)showNotificatioForRadarURL
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.show-notification-for-radar-url"), 1);
}

- (double)throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.throttle-threshold-before-immediately-failing-non-discretionary-op"), 0.0, 1.79769313e308, 10.0);
  return result;
}

- (double)throttleThresholdToBlockExistingOpOnNewOp
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("sync.throttle-threshold-to-block-existing-op-on-new-op"), 0.0, 1.79769313e308, 0.0);
  return result;
}

- (NSSet)ignoredCKErrorsForABC
{
  return (NSSet *)-[BRCUserDefaults _brErrorSetForKey:byDefault:](self, "_brErrorSetForKey:byDefault:", CFSTR("abc.ignored-ck-errors"), &unk_24FEB4BB8);
}

- (BOOL)ignoreCKCZMigrationAlreadyDoneErrorForABC
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("abc.ignore-ck-cz-migration-already-done-error"), 1);
}

- (BOOL)ignoreCKMMCSItemNotAvailableErrorForABC
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("abc.ignore-ck-mmcs-item-not-available-error"), 1);
}

- (unint64_t)xpcConnectionFailureRetries
{
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", CFSTR("xpc-connection-failure-retries"), 1, 100, 5);
}

- (BOOL)shouldPurgeUploadsOnDeviceIDChange
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("account-session.should.purge.uploads.on.deviceid.change"), 1);
}

- (NSString)dumpDateFormat
{
  return (NSString *)-[BRCUserDefaults stringForKey:byDefault:](self, "stringForKey:byDefault:", CFSTR("dump.date.format"), CFSTR("yyyy-MM-dd HH:mm:ss.SSS"));
}

- (NSDateFormatter)dumpDateFormatter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__BRCUserDefaults_dumpDateFormatter__block_invoke;
  block[3] = &unk_24FE3FA18;
  block[4] = self;
  if (dumpDateFormatter_onceToken != -1)
    dispatch_once(&dumpDateFormatter_onceToken, block);
  return (NSDateFormatter *)(id)dumpDateFormatter_df;
}

void __36__BRCUserDefaults_dumpDateFormatter__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = (void *)dumpDateFormatter_df;
  dumpDateFormatter_df = (uint64_t)v2;

  v4 = (void *)dumpDateFormatter_df;
  objc_msgSend(*(id *)(a1 + 32), "dumpDateFormat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateFormat:", v5);

}

- (BOOL)shouldSendTelemetryOnCollaborationAPIs
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("collaboration-api-send-telemetry"), 1);
}

- (BOOL)useIDSDecisionService
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("ttr.use.ids.decision.service"), 1);
}

- (NSURL)idsDecisionServiceURL
{
  void *v2;
  void *v3;

  -[BRCUserDefaults stringForKey:byDefault:](self, "stringForKey:byDefault:", CFSTR("ttr.ids.decision.service.url"), CFSTR("https://support.ess.apple.com/WebObjects/SupportService.woa/internal/checkTapToRadarDecision"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSDictionary)tapToRadarDailyThrottleRules
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__BRCUserDefaults_tapToRadarDailyThrottleRules__block_invoke;
  v4[3] = &unk_24FE49520;
  v5 = &unk_24FEB4CA0;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("ttr.daily.throttle.rules"), 1, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v2;
}

id __47__BRCUserDefaults_tapToRadarDailyThrottleRules__block_invoke(uint64_t a1, void *a2)
{
  return _validateNamedThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)tapToRadarWeeklyThrottleRules
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__BRCUserDefaults_tapToRadarWeeklyThrottleRules__block_invoke;
  v4[3] = &unk_24FE49520;
  v5 = &unk_24FEB4CC8;
  -[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("ttr.weekly.throttle.rules"), 1, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v2;
}

id __48__BRCUserDefaults_tapToRadarWeeklyThrottleRules__block_invoke(uint64_t a1, void *a2)
{
  return _validateNamedThrottleDefaults(a2, *(void **)(a1 + 32));
}

+ (id)generateThrottleTTRIdentifiersForTriggerRootCause:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "code");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%ld"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)weeklyThrottledErrorsForTTR
{
  return (NSSet *)-[BRCUserDefaults objectForKey:inheritFromGlobal:validateWithBlock:](self, "objectForKey:inheritFromGlobal:validateWithBlock:", CFSTR("ttr.weekly.throttled.errors"), 1, &__block_literal_global_1909);
}

id __46__BRCUserDefaults_weeklyThrottledErrorsForTTR__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[6];

  v16[5] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v3 = v2, (objc_msgSend(v2, "br_all_of_type:", objc_opt_class()) & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInitialScanItemBouncedByServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v14;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorInitialScanItemTypeMismatch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v4;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorRecordBouncedByServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v6;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorBouncedItemNotKnownByServer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[3] = v8;
    objc_msgSend(MEMORY[0x24BDD1540], "brc_errorNoEtagAvailableForDownloadOfItemWithIdentifier:", &stru_24FE4A790);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:](BRCUserDefaults, "generateThrottleTTRIdentifiersForTriggerRootCause:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSSet)resetReasonsToTriggerTTR
{
  return (NSSet *)-[BRCUserDefaults _extensionSetForKey:startingWithExtensions:](self, "_extensionSetForKey:startingWithExtensions:", CFSTR("reset.reasons.to.trigger.ttr"), &unk_24FEB4BD0);
}

- (BOOL)fpfsSpeculativeSetDownload
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("fpfs.speculative-set-download"), 1);
}

- (double)periodicSyncNetworkUnreachableMinThreshold
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.net-unreachable-min-threshold"), 0.0, 1.79769313e308, 3600.0);
  return result;
}

- (double)periodicSyncNetworkStableMinThreshold
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.net-stable-min-threshold"), 0.0, 1.79769313e308, 60.0);
  return result;
}

- (double)periodicSyncAppLibraryLastBoostMinThreshold
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.applibrary-last-boost-min-threshold"), 0.0, 1.79769313e308, 10800.0);
  return result;
}

- (double)periodicSyncScreenUnlockedMinThreshold
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.screen-unlocked-min-threshold"), 0.0, 1.79769313e308, 120.0);
  return result;
}

- (double)periodicSyncAutoTriggerTimeInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("periodic-sync.auto-trigger-time-interval"), 0.0, 1.79769313e308, 86400.0);
  return result;
}

- (double)dbFixupContentPolicyRecoverAfterTimeInterval
{
  double result;

  -[BRCUserDefaults doubleForKey:min:max:byDefault:](self, "doubleForKey:min:max:byDefault:", CFSTR("db-fixup.content-policy-recover"), 0.0, 1.79769313e308, 60.0);
  return result;
}

- (BOOL)checkBRCTLTCCAccessOnInternalBuild
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("tcc-check-brctl-access-on-internal"), 0);
}

- (BOOL)handleUnloadedZones
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("account-session.should.handle.unloaded.zones"), 1);
}

- (BOOL)finishSaltingPartiallySaltedDirectories
{
  return -[BRCUserDefaults BOOLForKey:byDefault:](self, "BOOLForKey:byDefault:", CFSTR("edp.aggressive-salting"), 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZoneIdentifier, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serverContainerConfigurationDict, 0);
  objc_storeStrong((id *)&self->_globalUserDefault, 0);
}

- (void)intForKey:min:max:byDefault:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: def <= max%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)intForKey:min:max:byDefault:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: min <= def%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)intForKey:min:max:byDefault:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: min < max%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_shouldRampForKey:session:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We are not denylisted from %@%@");
  OUTLINED_FUNCTION_0();
}

- (void)_shouldRampForKey:session:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We are not denylisted from %@ chaining because we are in carry%@");
  OUTLINED_FUNCTION_0();
}

- (void)_shouldRampForKey:session:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We are not denylisted from %@ because we are on an internal build%@");
  OUTLINED_FUNCTION_0();
}

- (void)_shouldRampForKey:session:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_230455000, v0, v1, "[DEBUG] We are not denylisted from %@ because we are on an internal build and in carry%@");
  OUTLINED_FUNCTION_0();
}

@end
