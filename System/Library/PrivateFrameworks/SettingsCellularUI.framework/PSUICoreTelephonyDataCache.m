@implementation PSUICoreTelephonyDataCache

+ (PSUICoreTelephonyDataCache)sharedInstance
{
  if (qword_253E970D0 != -1)
    dispatch_once(&qword_253E970D0, &__block_literal_global_21);
  return (PSUICoreTelephonyDataCache *)(id)_MergedGlobals_72;
}

void __44__PSUICoreTelephonyDataCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyDataCache initPrivate]([PSUICoreTelephonyDataCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_72;
  _MergedGlobals_72 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICoreTelephonyDataCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *client;
  void *v7;
  RadiosPreferences *v8;
  RadiosPreferences *radioPreferences;
  uint64_t v10;
  NSMutableDictionary *privateNetworkCapabilities;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PSUICoreTelephonyDataCache;
  v2 = -[PSUICoreTelephonyDataCache init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("data_cache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    -[PSUICoreTelephonyDataCache setCtConnection:](v2, "setCtConnection:", _CTServerConnectionCreateOnTargetQueue());
    -[PSUICoreTelephonyDataCache setCellularDataSettingInitialized:](v2, "setCellularDataSettingInitialized:", 0);
    -[PSUICoreTelephonyDataCache setCellularDataSetting:](v2, "setCellularDataSetting:", 0);
    -[PSUICoreTelephonyDataCache setDataStatusDict:](v2, "setDataStatusDict:", 0);
    v7 = (void *)objc_opt_new();
    -[PSUICoreTelephonyDataCache setIntlDataAccessStatus:](v2, "setIntlDataAccessStatus:", v7);

    v8 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radioPreferences = v2->_radioPreferences;
    v2->_radioPreferences = v8;

    -[RadiosPreferences setNotifyForExternalChangeOnly:](v2->_radioPreferences, "setNotifyForExternalChangeOnly:", 1);
    -[RadiosPreferences setDelegate:](v2->_radioPreferences, "setDelegate:", v2);
    -[PSUICoreTelephonyDataCache setPrivacyProxySettingsFetched:](v2, "setPrivacyProxySettingsFetched:", 0);
    -[PSUICoreTelephonyDataCache privacyProxySetting](v2, "privacyProxySetting");
    -[PSUICoreTelephonyDataCache setPrivacyProxySetting:](v2, "setPrivacyProxySetting:", 0);
    v10 = objc_opt_new();
    privateNetworkCapabilities = v2->_privateNetworkCapabilities;
    v2->_privateNetworkCapabilities = (NSMutableDictionary *)v10;

    -[PSUICoreTelephonyDataCache setCellularStatisticsSetting:](v2, "setCellularStatisticsSetting:", 0);
    -[PSUICoreTelephonyDataCache setCellularStatisticsSettingFetched:](v2, "setCellularStatisticsSettingFetched:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (PSUICoreTelephonyDataCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
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
  v4.super_class = (Class)PSUICoreTelephonyDataCache;
  -[PSUICoreTelephonyDataCache dealloc](&v4, sel_dealloc);
}

- (void)willEnterForeground
{
  void *v3;

  -[PSUICoreTelephonyDataCache setCellularDataSettingInitialized:](self, "setCellularDataSettingInitialized:", 0);
  -[PSUICoreTelephonyDataCache setCellularStatisticsSettingFetched:](self, "setCellularStatisticsSettingFetched:", 0);
  -[PSUICoreTelephonyDataCache intlDataAccessStatus](self, "intlDataAccessStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[PSUICoreTelephonyDataCache setDataStatusDict:](self, "setDataStatusDict:", 0);
}

- (void)fetchDataStatus
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CoreTelephonyClient *client;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  PSUICoreTelephonyDataCache *v17;
  __int128 v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Executing fetch for data status", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v8 = 138412546;
    v18 = v8;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        client = self->_client;
        v20 = 0;
        -[CoreTelephonyClient getDataStatus:error:](client, "getDataStatus:error:", v11, &v20, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v20;
        -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            v27 = 2112;
            v28 = v14;
            _os_log_error_impl(&dword_2161C6000, v16, OS_LOG_TYPE_ERROR, "Data status fetch failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            v27 = 2112;
            v28 = v13;
            _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "Data status fetched succeeded: %@, %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "slotID"));
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v16);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v7);
  }

  v17 = self;
  objc_sync_enter(v17);
  -[PSUICoreTelephonyDataCache setDataStatusDict:](v17, "setDataStatusDict:", v19);
  objc_sync_exit(v17);

}

- (id)getDataStatus:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyDataCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonyDataCache dataStatusDict](self, "dataStatusDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyDataCache fetchDataStatus](self, "fetchDataStatus");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyDataCache dataStatusDict](v6, "dataStatusDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PSUICoreTelephonyDataCache *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Updating data status: %@, %@", (uint8_t *)&v11, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  -[PSUICoreTelephonyDataCache dataStatusDict](v9, "dataStatusDict");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);

  objc_sync_exit(v9);
}

- (void)dataSettingsChanged:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  PSUICoreTelephonyDataCache *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Updating data settings: %@", buf, 0xCu);
  }

  v6 = self;
  objc_sync_enter(v6);
  v7 = -[PSUICoreTelephonyDataCache cellularDataSetting](v6, "cellularDataSetting");
  if (v7 != -[__CFString isCellularDataEnabled](v4, "isCellularDataEnabled"))
  {
    -[PSUICoreTelephonyDataCache getLogger](v6, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[PSUICoreTelephonyDataCache cellularDataSetting](v6, "cellularDataSetting");
      v10 = -[__CFString isCellularDataEnabled](v4, "isCellularDataEnabled");
      v11 = CFSTR("NO");
      if (v9)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Cellular data changing from %@ to %@", buf, 0x16u);
    }

  }
  -[PSUICoreTelephonyDataCache setCellularDataSettingInitialized:](v6, "setCellularDataSettingInitialized:", 0);
  objc_sync_exit(v6);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PSUICoreTelephonyDataCache_dataSettingsChanged___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __50__PSUICoreTelephonyDataCache_dataSettingsChanged___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUICoreTelephonyDataCache dataSettingsChanged:]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSCellularDataSettingChangedNotification");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PSCellularDataSettingChangedNotification"), 0);

}

- (void)fetchInternationalDataAccessStatus:(id)a3
{
  id v4;
  PSUICoreTelephonyDataCache *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  CoreTelephonyClient *client;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PSUICoreTelephonyDataCache intlDataAccessStatus](v5, "intlDataAccessStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  if (!v8)
  {
    -[PSUICoreTelephonyDataCache getLogger](v5, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Executing fetch for international data access status", buf, 2u);
    }

    client = v5->_client;
    v18 = 0;
    v11 = -[CoreTelephonyClient getInternationalDataAccessSync:error:](client, "getInternationalDataAccessSync:error:", v4, &v18);
    v12 = (__CFString *)v18;
    -[PSUICoreTelephonyDataCache getLogger](v5, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v12;
        _os_log_error_impl(&dword_2161C6000, v14, OS_LOG_TYPE_ERROR, "International data access status fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = CFSTR("NO");
        if ((_DWORD)v11)
          v15 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "Fetch for international data access status succeeded: %@", buf, 0xCu);
      }

      -[PSUICoreTelephonyDataCache intlDataAccessStatus](v5, "intlDataAccessStatus");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "instance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v14, "setObject:forKey:", v16, v17);

    }
  }

}

- (BOOL)getInternationalDataAccessStatus
{
  NSObject *v3;
  void *v4;
  BOOL v5;
  uint8_t v7[16];

  if (+[SettingsCellularUtils isUIDualSIM](SettingsCellularUtils, "isUIDualSIM"))
  {
    -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2161C6000, v3, OS_LOG_TYPE_ERROR, "Need a service descriptor, use getInternationalDataAccessStatus:", v7, 2u);
    }

  }
  +[SettingsCellularUtils singleSIMUIServiceDescriptor](SettingsCellularUtils, "singleSIMUIServiceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PSUICoreTelephonyDataCache getInternationalDataAccessStatus:](self, "getInternationalDataAccessStatus:", v4);

  return v5;
}

- (BOOL)getInternationalDataAccessStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[PSUICoreTelephonyDataCache fetchInternationalDataAccessStatus:](self, "fetchInternationalDataAccessStatus:", v4);
  -[PSUICoreTelephonyDataCache intlDataAccessStatus](self, "intlDataAccessStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setInternationalDataAccessStatus:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  if (+[SettingsCellularUtils isUIDualSIM](SettingsCellularUtils, "isUIDualSIM"))
  {
    -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_2161C6000, v5, OS_LOG_TYPE_ERROR, "Need a service descriptor, use setInternationalDataAccessStatus:status:", v7, 2u);
    }

  }
  +[SettingsCellularUtils singleSIMUIServiceDescriptor](SettingsCellularUtils, "singleSIMUIServiceDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyDataCache setInternationalDataAccessStatus:status:](self, "setInternationalDataAccessStatus:status:", v6, v3);

}

- (void)setInternationalDataAccessStatus:(id)a3 status:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v14 = 138412290;
    v15 = v8;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Setting international data access status to %@", (uint8_t *)&v14, 0xCu);
  }

  -[CoreTelephonyClient setInternationalDataAccessSync:status:](self->_client, "setInternationalDataAccessSync:status:", v6, v4);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v9;
      _os_log_error_impl(&dword_2161C6000, v11, OS_LOG_TYPE_ERROR, "Setting international data access status failed: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_2161C6000, v11, OS_LOG_TYPE_DEFAULT, "Setting international data access status successful", (uint8_t *)&v14, 2u);
    }

    -[PSUICoreTelephonyDataCache intlDataAccessStatus](self, "intlDataAccessStatus");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v11, "setObject:forKey:", v12, v13);

  }
}

- (void)dataRoamingSettingsChanged:(id)a3 status:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  PSUICoreTelephonyDataCache *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Changing international data access status: %@", buf, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  -[PSUICoreTelephonyDataCache intlDataAccessStatus](v9, "intlDataAccessStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, v12);

  objc_sync_exit(v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__PSUICoreTelephonyDataCache_dataRoamingSettingsChanged_status___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__PSUICoreTelephonyDataCache_dataRoamingSettingsChanged_status___block_invoke(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[PSUICoreTelephonyDataCache dataRoamingSettingsChanged:status:]_block_invoke";
    v5 = 2112;
    v6 = CFSTR("PSCellularDataSettingChangedNotification");
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v3, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("PSCellularDataSettingChangedNotification"), 0);

}

- (void)fetchCellularDataEnabled
{
  PSUICoreTelephonyDataCache *v2;
  BOOL v3;
  uint64_t IsEnabled;
  NSObject *v5;
  const __CFString *v6;
  BOOL v7;
  uint8_t buf[4];
  _DWORD v9[7];

  *(_QWORD *)&v9[5] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[PSUICoreTelephonyDataCache cellularDataSettingInitialized](v2, "cellularDataSettingInitialized");
  objc_sync_exit(v2);

  if (!v3)
  {
    v7 = -[PSUICoreTelephonyDataCache cellularDataSetting](v2, "cellularDataSetting");
    -[PSUICoreTelephonyDataCache ctConnection](v2, "ctConnection");
    IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
    if ((_DWORD)IsEnabled)
    {
      -[PSUICoreTelephonyDataCache getLogger](v2, "getLogger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v9[0] = IsEnabled;
        LOWORD(v9[1]) = 1024;
        *(_DWORD *)((char *)&v9[1] + 2) = HIDWORD(IsEnabled);
        _os_log_error_impl(&dword_2161C6000, v5, OS_LOG_TYPE_ERROR, "Querying cellular data is enabled setting failed %d (%d)", buf, 0xEu);
      }
    }
    else
    {
      -[PSUICoreTelephonyDataCache setCellularDataSetting:](v2, "setCellularDataSetting:", v7);
      -[PSUICoreTelephonyDataCache setCellularDataSettingInitialized:](v2, "setCellularDataSettingInitialized:", 1);
      -[PSUICoreTelephonyDataCache getLogger](v2, "getLogger");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (v7)
          v6 = CFSTR("YES");
        else
          v6 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v9 = v6;
        _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Cellular data is enabled is %@", buf, 0xCu);
      }
    }

  }
}

- (BOOL)isCellularDataEnabled
{
  -[PSUICoreTelephonyDataCache fetchCellularDataEnabled](self, "fetchCellularDataEnabled");
  return -[PSUICoreTelephonyDataCache cellularDataSetting](self, "cellularDataSetting");
}

- (void)setCellularDataEnabled:(BOOL)a3
{
  -[PSUICoreTelephonyDataCache ctConnection](self, "ctConnection");
  _CTServerConnectionSetCellularDataIsEnabled();
}

- (BOOL)isAirplaneModeEnabled
{
  void *v2;
  char v3;

  -[PSUICoreTelephonyDataCache radioPreferences](self, "radioPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "airplaneMode");

  return v3;
}

- (BOOL)isDataFallbackEnabled
{
  NSObject *v3;
  CoreTelephonyClient *client;
  int v5;
  __CFString *v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  id v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Fetching dynamic data SIM switching support", buf, 2u);
  }

  client = self->_client;
  v11 = 0;
  v5 = -[CoreTelephonyClient getSupportDynamicDataSimSwitchSync:](client, "getSupportDynamicDataSimSwitchSync:", &v11);
  v6 = (__CFString *)v11;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "Fetch dynamic data SIM switching failed: %@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Fetching dynamic data SIM switching succeeded: %@", buf, 0xCu);
  }

  return v5;
}

- (void)setDataFallbackEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting dynamic data SIM switching to %@", (uint8_t *)&v10, 0xCu);
  }

  -[CoreTelephonyClient setSupportDynamicDataSimSwitch:](self->_client, "setSupportDynamicDataSimSwitch:", v3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Setting dynamic data SIM switching failed: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Setting dynamic data SIM switching successful", (uint8_t *)&v10, 2u);
  }

}

- (void)airplaneModeChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PSUICoreTelephonyDataCache radioPreferences](self, "radioPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "airplaneMode");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Airplane mode changed to %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("PSCellularAirplaneModeChangedNotification"), 0);

}

- (void)fetchPrivacyProxyStatus:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  PSUICoreTelephonyDataCache *v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  client = self->_client;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  LOWORD(v7) = -[CoreTelephonyClient getPrivacyProxyState:error:](client, "getPrivacyProxyState:error:", v6, &v15);
  v8 = (__CFString *)v15;

  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_2161C6000, v10, OS_LOG_TYPE_ERROR, "Fetch PrivacyProxy status failed: %@", buf, 0xCu);
    }

    v11 = 0;
    v7 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("YES");
      if ((v7 & 1) != 0)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      if ((v7 & 0x100) == 0)
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Fetch PrivacyProxy status success, feature enabled: %@, user enabled: %@", buf, 0x16u);
    }

    v11 = (unsigned __int16)v7 & 0xFF00;
    v7 = v7;
  }
  v14 = self;
  objc_sync_enter(v14);
  -[PSUICoreTelephonyDataCache setPrivacyProxySetting:](v14, "setPrivacyProxySetting:", v7 | v11);
  objc_sync_exit(v14);

}

- (BOOL)isUserSubscribedToPrivacyProxy:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (!-[PSUICoreTelephonyDataCache privacyProxySettingsFetched](self, "privacyProxySettingsFetched"))
    -[PSUICoreTelephonyDataCache fetchPrivacyProxyStatus:](self, "fetchPrivacyProxyStatus:", v4);
  v5 = (char)-[PSUICoreTelephonyDataCache privacyProxySetting](self, "privacyProxySetting");

  return v5 & 1;
}

- (BOOL)isPrivacyProxyEnabled:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (!-[PSUICoreTelephonyDataCache privacyProxySettingsFetched](self, "privacyProxySettingsFetched"))
    -[PSUICoreTelephonyDataCache fetchPrivacyProxyStatus:](self, "fetchPrivacyProxyStatus:", v4);
  v5 = (-[PSUICoreTelephonyDataCache privacyProxySetting](self, "privacyProxySetting") >> 8) & 1;

  return v5;
}

- (void)setPrivacyProxy:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  CoreTelephonyClient *client;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  client = self->_client;
  objc_msgSend(MEMORY[0x24BDC27B0], "descriptorWithSubscriptionContext:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreTelephonyClient setPrivacyProxyState:enabled:](client, "setPrivacyProxyState:enabled:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Set PrivacyProxy state failed: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)fetchPrivateNetworkCapabilities:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyDataCache *v6;
  void *v7;
  void *v8;
  CoreTelephonyClient *client;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    client = v6->_client;
    v14 = 0;
    -[CoreTelephonyClient getPrivateNetworkCapabilitiesForContext:error:](client, "getPrivateNetworkCapabilitiesForContext:error:", v4, &v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    if (v11)
    {
      -[PSUICoreTelephonyDataCache getLogger](v6, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "Checking Private Network capabilities failed: %@", buf, 0xCu);
      }
    }
    else
    {
      -[PSUICoreTelephonyDataCache getLogger](v6, "getLogger");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v5;
        v17 = 2112;
        v18 = v10;
        _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Private Network Capabilities for context slot id [%@]: %@", buf, 0x16u);
      }

      -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v10, v5);
    }

  }
  objc_sync_exit(v6);

}

- (BOOL)isPrivateNetworkSIM:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyDataCache *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC2800], "contextWithServiceDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyDataCache fetchPrivateNetworkCapabilities:](self, "fetchPrivateNetworkCapabilities:", v5);
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "slotID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPrivateNetworkSIM");

  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v6);

  return v13;
}

- (BOOL)hideDataRoaming:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonyDataCache *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC2800], "contextWithServiceDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyDataCache fetchPrivateNetworkCapabilities:](self, "fetchPrivateNetworkCapabilities:", v5);
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "slotID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hideDataRoaming");

  }
  else
  {
    v13 = 0;
  }
  objc_sync_exit(v6);

  return v13;
}

- (id)copyStartDateOfCellularDataUsageRecords
{
  -[PSUICoreTelephonyDataCache ctConnection](self, "ctConnection");
  _CTServerConnectionCopyStartDateOfCellularDataUsageRecords();
  return 0;
}

- (void)eraseCellularDataUsageRecords
{
  -[PSUICoreTelephonyDataCache ctConnection](self, "ctConnection");
  _CTServerConnectionEraseCellularDataUsageRecords();
}

- (void)fetchCellularUsageStatisticsSetting
{
  PSUICoreTelephonyDataCache *v2;
  BOOL v3;
  CoreTelephonyClient *client;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[PSUICoreTelephonyDataCache cellularStatisticsSettingFetched](v2, "cellularStatisticsSettingFetched");
  objc_sync_exit(v2);

  if (!v3)
  {
    client = v2->_client;
    v12 = 0;
    -[CoreTelephonyClient usageCollectionEnabledSync:](client, "usageCollectionEnabledSync:", &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v6)
    {
      -[PSUICoreTelephonyDataCache getLogger](v2, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "domain");
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v11;
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch cellular usage statistics setting %@ (%@)", buf, 0x16u);

      }
    }
    else
    {
      v8 = objc_msgSend(v5, "BOOLValue");
      -[PSUICoreTelephonyDataCache getLogger](v2, "getLogger");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFSTR("NO");
        if ((_DWORD)v8)
          v10 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Cellular usage statistics enabled: %@", buf, 0xCu);
      }

      -[PSUICoreTelephonyDataCache setCellularStatisticsSetting:](v2, "setCellularStatisticsSetting:", v8);
      -[PSUICoreTelephonyDataCache setCellularStatisticsSettingFetched:](v2, "setCellularStatisticsSettingFetched:", 1);
    }

  }
}

- (BOOL)isCellularUsageStatisticsEnabled
{
  -[PSUICoreTelephonyDataCache fetchCellularUsageStatisticsSetting](self, "fetchCellularUsageStatisticsSetting");
  return -[PSUICoreTelephonyDataCache cellularStatisticsSetting](self, "cellularStatisticsSetting");
}

- (void)setCellularUsageStatisticsEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  CoreTelephonyClient *client;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v4 = a3;
  v6 = a4;
  location = 0;
  objc_initWeak(&location, self);
  client = self->_client;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__PSUICoreTelephonyDataCache_setCellularUsageStatisticsEnabled_completion___block_invoke;
  v9[3] = &unk_24D502728;
  objc_copyWeak(&v11, &location);
  v12 = v4;
  v8 = v6;
  v10 = v8;
  -[CoreTelephonyClient setUsageCollectionEnabled:completion:](client, "setUsageCollectionEnabled:completion:", v4, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __75__PSUICoreTelephonyDataCache_setCellularUsageStatisticsEnabled_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (*(_BYTE *)(a1 + 48))
        v12 = CFSTR("ENABLED");
      else
        v12 = CFSTR("DISABLED");
      objc_msgSend(v3, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      v18 = 2112;
      v19 = v3;
      _os_log_error_impl(&dword_2161C6000, v6, OS_LOG_TYPE_ERROR, "Failed to set cellular usage statistics to %@, error: %@ (%@)", (uint8_t *)&v14, 0x20u);

    }
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "setCellularStatisticsSettingFetched:", 0);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v8 = CFSTR("ENABLED");
      else
        v8 = CFSTR("DISABLED");
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Successfully set cellular usage statistics to %@", (uint8_t *)&v14, 0xCu);
    }

    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "setCellularStatisticsSetting:", v9);

    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
  }

}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  PSUICoreTelephonyDataCache *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Clearing Private network SIM info for context %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self;
  objc_sync_enter(v10);
  -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v10, "privateNetworkCapabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v9);

  objc_sync_exit(v10);
}

- (void)preferPrivateNetworkCellularOverWiFiDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  PSUICoreTelephonyDataCache *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyDataCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing Private network SIM infos due to profile update", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  objc_sync_enter(v6);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "slotID", (_QWORD)v13));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSUICoreTelephonyDataCache privateNetworkCapabilities](v6, "privateNetworkCapabilities");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("DataCache"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (__CTServerConnection)ctConnection
{
  return self->_ctConnection;
}

- (void)setCtConnection:(__CTServerConnection *)a3
{
  self->_ctConnection = a3;
}

- (NSMutableDictionary)dataStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDataStatusDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)intlDataAccessStatus
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntlDataAccessStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radioPreferences, a3);
}

- (BOOL)cellularDataSetting
{
  return self->_cellularDataSetting;
}

- (void)setCellularDataSetting:(BOOL)a3
{
  self->_cellularDataSetting = a3;
}

- (BOOL)cellularDataSettingInitialized
{
  return self->_cellularDataSettingInitialized;
}

- (void)setCellularDataSettingInitialized:(BOOL)a3
{
  self->_cellularDataSettingInitialized = a3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)privacyProxySetting
{
  $96EE1C12479E9B303E9C2794B92A11A2 dest;

  objc_copyStruct(&dest, &self->_privacyProxySetting, 2, 1, 0);
  return dest;
}

- (void)setPrivacyProxySetting:(id)a3
{
  $96EE1C12479E9B303E9C2794B92A11A2 src;

  src = a3;
  objc_copyStruct(&self->_privacyProxySetting, &src, 2, 1, 0);
}

- (BOOL)privacyProxySettingsFetched
{
  return self->_privacyProxySettingsFetched;
}

- (void)setPrivacyProxySettingsFetched:(BOOL)a3
{
  self->_privacyProxySettingsFetched = a3;
}

- (NSMutableDictionary)privateNetworkCapabilities
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrivateNetworkCapabilities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)cellularStatisticsSetting
{
  return self->_cellularStatisticsSetting;
}

- (void)setCellularStatisticsSetting:(BOOL)a3
{
  self->_cellularStatisticsSetting = a3;
}

- (BOOL)cellularStatisticsSettingFetched
{
  return self->_cellularStatisticsSettingFetched;
}

- (void)setCellularStatisticsSettingFetched:(BOOL)a3
{
  self->_cellularStatisticsSettingFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateNetworkCapabilities, 0);
  objc_storeStrong((id *)&self->_radioPreferences, 0);
  objc_storeStrong((id *)&self->_intlDataAccessStatus, 0);
  objc_storeStrong((id *)&self->_dataStatusDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
