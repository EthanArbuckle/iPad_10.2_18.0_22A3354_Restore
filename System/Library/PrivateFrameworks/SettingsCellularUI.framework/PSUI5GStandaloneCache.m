@implementation PSUI5GStandaloneCache

+ (PSUI5GStandaloneCache)sharedInstance
{
  if (qword_253E97060 != -1)
    dispatch_once(&qword_253E97060, &__block_literal_global_13);
  return (PSUI5GStandaloneCache *)(id)_MergedGlobals_65;
}

void __39__PSUI5GStandaloneCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUI5GStandaloneCache initPrivate]([PSUI5GStandaloneCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_65;
  _MergedGlobals_65 = (uint64_t)v0;

}

- (id)initPrivate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PSUI5GStandaloneCache *v7;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("5G_SA_cache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PSUI5GStandaloneCache initWithCoreTelephonyClient:simStatusCache:](self, "initWithCoreTelephonyClient:simStatusCache:", v5, v6);

  return v7;
}

- (PSUI5GStandaloneCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7;
  id v8;
  PSUI5GStandaloneCache *v9;
  PSUI5GStandaloneCache *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUI5GStandaloneCache;
  v9 = -[PSUI5GStandaloneCache init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    -[CoreTelephonyClient setDelegate:](v10->_client, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_simStatusCache, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

    -[PSUI5GStandaloneCache clearCache](v10, "clearCache");
    -[PSUI5GStandaloneCache fetchNRStatus](v10, "fetchNRStatus");
  }

  return v10;
}

- (PSUI5GStandaloneCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUI5GStandaloneCache;
  -[PSUI5GStandaloneCache dealloc](&v4, sel_dealloc);
}

- (BOOL)is5GSASupportedForContext:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  PSUI5GStandaloneCache *v6;
  NSMutableDictionary *NRStatusDict;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_INFO, "5GSA Support status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  -[PSUI5GStandaloneCache fetchNRStatus](self, "fetchNRStatus");
  v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](NRStatusDict, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isSASwitchVisible");
  objc_sync_exit(v6);

  -[PSUI5GStandaloneCache getLogger](v6, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NOT SUPPORTED");
    if (v11)
      v13 = CFSTR("SUPPORTED");
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_INFO, "5GSA %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (BOOL)is5GSAEnabledForContext:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  PSUI5GStandaloneCache *v6;
  NSMutableDictionary *SAEnabledDict;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  int v14;
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v14 = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_INFO, "5GSA Enabled status request for context: %@", (uint8_t *)&v14, 0xCu);
  }

  -[PSUI5GStandaloneCache fetch5GSupportAndEnabledStatusIfNeeded](self, "fetch5GSupportAndEnabledStatusIfNeeded");
  v6 = self;
  objc_sync_enter(v6);
  SAEnabledDict = v6->_SAEnabledDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[__CFString slotID](v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](SAEnabledDict, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_sync_exit(v6);
  -[PSUI5GStandaloneCache getLogger](v6, "getLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("DISABLED");
    if (v10)
      v12 = CFSTR("ENABLED");
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_INFO, "5GSA %@ for context: %@", (uint8_t *)&v14, 0x16u);
  }

  return v10;
}

- (id)set5GSAEnabled:(BOOL)a3 forContext:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  CoreTelephonyClient *client;
  void *v10;
  void *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("DISABLED");
    if (v4)
      v8 = CFSTR("ENABLED");
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_INFO, "Setting 5GSA Enabled status to: %@ for context: %@", (uint8_t *)&v13, 0x16u);
  }

  client = self->_client;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreTelephonyClient setSupports5GStandalone:enabled:](client, "setSupports5GStandalone:enabled:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PSUI5GStandaloneCache clearCache](self, "clearCache");
    -[PSUI5GStandaloneCache fetchNRStatus](self, "fetchNRStatus");
  }

  return v11;
}

- (BOOL)is5GSASwitchUserInteractableForContext:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  PSUI5GStandaloneCache *v6;
  NSMutableDictionary *NRStatusDict;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_INFO, "5GSA Switch User Interactive status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](NRStatusDict, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "isSASwitchConfigurable");
  objc_sync_exit(v6);

  -[PSUI5GStandaloneCache getLogger](v6, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NOT INTERACTABLE");
    if (v11)
      v13 = CFSTR("INTERACTABLE");
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_INFO, "5GSA Switch is User Interactive %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (unint64_t)getSADisableStatusReasonMaskForContext:(id)a3
{
  id v4;
  PSUI5GStandaloneCache *v5;
  NSMutableDictionary *NRStatusDict;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  NRStatusDict = v5->_NRStatusDict;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](NRStatusDict, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "saDisabledReasonMask");
  objc_sync_exit(v5);

  -[PSUI5GStandaloneCache getLogger](v5, "getLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 134218242;
    v14 = v10;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_INFO, "5GSA Switch reasonMask %lu for context: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (BOOL)are5GRATModesUserInteractableForContext:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  PSUI5GStandaloneCache *v6;
  NSMutableDictionary *NRStatusDict;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_INFO, "5G RAT Modes User Interactive status request for context: %@", (uint8_t *)&v15, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  NRStatusDict = v6->_NRStatusDict;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "instance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](NRStatusDict, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "are5GRATModeCellsUserInteractable");
  objc_sync_exit(v6);

  -[PSUI5GStandaloneCache getLogger](v6, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NOT INTERACTABLE");
    if (v11)
      v13 = CFSTR("INTERACTABLE");
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_INFO, "5G RAT Modes User Interactive %@ for context: %@", (uint8_t *)&v15, 0x16u);
  }

  return v11;
}

- (unint64_t)getNSADisableStatusReasonMaskForContext:(id)a3
{
  id v4;
  PSUI5GStandaloneCache *v5;
  NSMutableDictionary *NRStatusDict;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  int v13;
  unint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  NRStatusDict = v5->_NRStatusDict;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](NRStatusDict, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "nsaDisabledReasonMask");
  objc_sync_exit(v5);

  -[PSUI5GStandaloneCache getLogger](v5, "getLogger");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = 134218242;
    v14 = v10;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_INFO, "5G NSA reasonMask %lu for context: %@", (uint8_t *)&v13, 0x16u);
  }

  return v10;
}

- (void)fetch5GSupportAndEnabledStatusIfNeeded
{
  PSUI5GStandaloneCache *v2;
  _BOOL4 cacheNeedsRefresh;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  CoreTelephonyClient *client;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  PSUI5GStandaloneCache *v20;
  __int128 v21;
  id v22;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  cacheNeedsRefresh = v2->_cacheNeedsRefresh;
  objc_sync_exit(v2);

  if (cacheNeedsRefresh)
  {
    -[PSUI5GStandaloneCache getLogger](v2, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Fetching SA Support and Enabled Status", buf, 2u);
    }

    -[PSSimStatusCache subscriptionContexts](v2->_simStatusCache, "subscriptionContexts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v26;
      *(_QWORD *)&v7 = 138412546;
      v21 = v7;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v10, v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          client = v2->_client;
          v24 = 0;
          -[CoreTelephonyClient getSupports5GStandalone:error:](client, "getSupports5GStandalone:error:", v11, &v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (__CFString *)v24;
          v15 = objc_msgSend(v13, "BOOLValue");

          -[PSUI5GStandaloneCache getLogger](v2, "getLogger");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v21;
              v30 = v10;
              v31 = 2112;
              v32 = v14;
              _os_log_error_impl(&dword_2161C6000, v17, OS_LOG_TYPE_ERROR, "SA Support and Enabled Status Fetch failed for context: %@, %@", buf, 0x16u);
            }
          }
          else
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v21;
              v18 = CFSTR("DISABLED");
              if ((_DWORD)v15)
                v18 = CFSTR("ENABLED");
              v30 = v10;
              v31 = 2112;
              v32 = v18;
              _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "SA Support and Enabled Status Fetch succeeded for context: %@, %@", buf, 0x16u);
            }

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "slotID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, v19);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v6);
    }

    v20 = v2;
    objc_sync_enter(v20);
    -[PSUI5GStandaloneCache setSAEnabledDict:](v20, "setSAEnabledDict:", v22);
    v2->_cacheNeedsRefresh = 0;
    objc_sync_exit(v20);

  }
}

- (void)fetchNRStatus
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  CoreTelephonyClient *client;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const __CFString *v17;
  void *v18;
  PSUI5GStandaloneCache *v19;
  __int128 v20;
  id v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Fetching NR status", buf, 2u);
  }

  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138412546;
    v20 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        client = self->_client;
        objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v9, v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        -[CoreTelephonyClient getNRStatus:error:](client, "getNRStatus:error:", v11, &v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (__CFString *)v23;

        if (v13)
        {
          -[PSUI5GStandaloneCache getLogger](self, "getLogger");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v29 = v9;
            v30 = 2112;
            v31 = v13;
            _os_log_error_impl(&dword_2161C6000, v14, OS_LOG_TYPE_ERROR, "NR status fetch failed for context: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v9);
          v14 = objc_claimAutoreleasedReturnValue();
          -[PSUI5GStandaloneCache getLogger](self, "getLogger");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_msgSend(v12, "isSADisabled");
            *(_DWORD *)buf = v20;
            v17 = CFSTR("SA ENABLED");
            if (v16)
              v17 = CFSTR("SA DISABLED");
            v29 = v9;
            v30 = 2112;
            v31 = v17;
            _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "NR status fetch succeeded for context: %@, %@", buf, 0x16u);
          }

          -[NSObject instance](v14, "instance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, v18);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

  v19 = self;
  objc_sync_enter(v19);
  -[PSUI5GStandaloneCache setNRStatusDict:](v19, "setNRStatusDict:", v21);
  objc_sync_exit(v19);

}

- (void)clearCache
{
  NSObject *v3;
  PSUI5GStandaloneCache *v4;
  NSMutableDictionary *NRStatusDict;
  NSMutableDictionary *SAEnabledDict;
  uint8_t v7[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing SA Status cache", v7, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_cacheNeedsRefresh = 1;
  NRStatusDict = v4->_NRStatusDict;
  v4->_NRStatusDict = 0;

  SAEnabledDict = v4->_SAEnabledDict;
  v4->_SAEnabledDict = 0;

  objc_sync_exit(v4);
}

- (void)notifyClientsNeedRefresh
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "Notifying SA Cache Clients should refresh", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSUI5GStandaloneCacheRefreshNotification"), 0);

}

- (void)clearCacheAndRefresh
{
  -[PSUI5GStandaloneCache clearCache](self, "clearCache");
  -[PSUI5GStandaloneCache fetchNRStatus](self, "fetchNRStatus");
  -[PSUI5GStandaloneCache notifyClientsNeedRefresh](self, "notifyClientsNeedRefresh");
}

- (void)nrDisableStatusChanged:(id)a3 status:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Recieved NR Disable Status Changed, updating SA Option Enabled status", v6, 2u);
  }

  -[PSUI5GStandaloneCache clearCacheAndRefresh](self, "clearCacheAndRefresh");
}

- (void)currentDataSimChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Current Data Sim Changed, updating all info.", v5, 2u);
  }

  -[PSUI5GStandaloneCache clearCacheAndRefresh](self, "clearCacheAndRefresh");
}

- (void)carrierBundleChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PSUI5GStandaloneCache getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Carrier Bundle Changed, updating all info.", v5, 2u);
  }

  -[PSUI5GStandaloneCache clearCacheAndRefresh](self, "clearCacheAndRefresh");
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SACache"));
}

- (NSMutableDictionary)SAEnabledDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSAEnabledDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)NRStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNRStatusDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NRStatusDict, 0);
  objc_storeStrong((id *)&self->_SAEnabledDict, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
