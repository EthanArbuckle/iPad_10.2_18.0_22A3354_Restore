@implementation ICSUbiquityAccessManager

+ (ICSUbiquityAccessManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1)
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_7);
  return (ICSUbiquityAccessManager *)(id)sharedInstance__accessManager;
}

void __42__ICSUbiquityAccessManager_sharedInstance__block_invoke()
{
  ICSUbiquityAccessManager *v0;
  void *v1;

  v0 = objc_alloc_init(ICSUbiquityAccessManager);
  v1 = (void *)sharedInstance__accessManager;
  sharedInstance__accessManager = (uint64_t)v0;

}

- (ICSUbiquityAccessManager)init
{
  ICSUbiquityAccessManager *v2;
  ICSUbiquityAccessManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSUbiquityAccessManager;
  v2 = -[ICSUbiquityAccessManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ICSUbiquityAccessManager reloadAccessInfo](v2, "reloadAccessInfo");
  return v3;
}

- (void)reloadAccessInfo
{
  NSMutableDictionary *v3;
  NSMutableDictionary *accessInfoCacheByBundleID;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  accessInfoCacheByBundleID = self->_accessInfoCacheByBundleID;
  self->_accessInfoCacheByBundleID = v3;

  v5 = (_QWORD *)MEMORY[0x24BEB3978];
  v8 = (id)TCCAccessCopyInformation();
  v6 = (_QWORD *)MEMORY[0x24BEB38B0];
  v7 = (void *)TCCAccessCopyInformation();
  -[ICSUbiquityAccessManager _addAccessInfo:forServiceName:](self, "_addAccessInfo:forServiceName:", v8, *v5);
  -[ICSUbiquityAccessManager _addAccessInfo:forServiceName:](self, "_addAccessInfo:forServiceName:", v7, *v6);

}

- (void)_addAccessInfo:(id)a3 forServiceName:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  __CFBundle *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD *v20;
  ICSUbiquityAccessManager *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v25 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x24BEB3810];
    v10 = (_QWORD *)MEMORY[0x24BEB3818];
    v28 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
        objc_msgSend(v12, "objectForKeyedSubscript:", *v9);
        v13 = (__CFBundle *)objc_claimAutoreleasedReturnValue();
        CFBundleGetIdentifier(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", *v10);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
        {
          if (!v15)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NSMutableDictionary objectForKey:](self->_accessInfoCacheByBundleID, "objectForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = v17;
            objc_msgSend(v17, "objectForKey:", CFSTR("services"));
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (v19)
              goto LABEL_11;
          }
          else
          {
            v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
            v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("services"));
            objc_msgSend(v18, "setObject:forKey:", v13, CFSTR("bundle"));
            -[NSMutableDictionary setObject:forKey:](self->_accessInfoCacheByBundleID, "setObject:forKey:", v18, v14);
            if (v19)
            {
LABEL_11:
              v20 = v10;
              v21 = self;
              v22 = v9;
              v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
              objc_msgSend(v23, "setObject:forKey:", v16, CFSTR("granted"));
              objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("serviceName"));
              objc_msgSend(v19, "addObject:", v23);

              v9 = v22;
              self = v21;
              v10 = v20;
              v8 = v26;
            }
          }

        }
        ++v11;
      }
      while (v8 != v11);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v8 = v24;
    }
    while (v24);
  }

}

- (NSArray)allBundleIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_accessInfoCacheByBundleID, "allKeys");
}

- (__CFBundle)_bundleForBundleID:(id)a3
{
  void *v3;
  __CFBundle *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessInfoCacheByBundleID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (__CFBundle *)objc_msgSend(v3, "objectForKey:", CFSTR("bundle"));

  return v4;
}

- (id)_servicesForBundleID:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessInfoCacheByBundleID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("services"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_serviceNamesForBundleID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_accessInfoCacheByBundleID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("services"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("serviceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessGrantedForBundleID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ICSUbiquityAccessManager _servicesForBundleID:](self, "_servicesForBundleID:", a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "objectForKey:", CFSTR("granted"), (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLValue");

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)setAppAccessGranted:(BOOL)a3 forBundleID:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v4 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!-[ICSUbiquityAccessManager _bundleForBundleID:](self, "_bundleForBundleID:", v6))
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "Error! No bundle for bundle ID: %@. Maybe iCloud Drive is turned off?", buf, 0xCu);
    }

  }
  -[ICSUbiquityAccessManager _serviceNamesForBundleID:](self, "_serviceNamesForBundleID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        TCCAccessSetForBundle();
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  -[ICSUbiquityAccessManager _updateCacheGranted:forBundleID:](self, "_updateCacheGranted:forBundleID:", v4, v6);
  -[ICSUbiquityAccessManager _serviceNamesForBundleID:](self, "_serviceNamesForBundleID:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", *MEMORY[0x24BEB3978]);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE38508], "sharedService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "terminateApplication:forReason:andReport:withDescription:", v6, 3, 0, 0);

  }
}

- (void)_updateCacheGranted:(BOOL)a3 forBundleID:(id)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[ICSUbiquityAccessManager _servicesForBundleID:](self, "_servicesForBundleID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("granted"));

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessInfoCacheByBundleID, 0);
}

@end
