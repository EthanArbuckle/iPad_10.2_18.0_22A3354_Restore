@implementation PSUICoreTelephonySubscriberCache

+ (id)sharedInstance
{
  if (qword_253E96FF8 != -1)
    dispatch_once(&qword_253E96FF8, &__block_literal_global_9);
  return (id)_MergedGlobals_60;
}

void __50__PSUICoreTelephonySubscriberCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonySubscriberCache initPrivate]([PSUICoreTelephonySubscriberCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_60;
  _MergedGlobals_60 = (uint64_t)v0;

}

- (id)initPrivate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PSUICoreTelephonySubscriberCache *v7;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("subscriber_cache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PSUICoreTelephonySubscriberCache initWithCoreTelephonyClient:simStatusCache:](self, "initWithCoreTelephonyClient:simStatusCache:", v5, v6);

  return v7;
}

- (PSUICoreTelephonySubscriberCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7;
  id v8;
  PSUICoreTelephonySubscriberCache *v9;
  PSUICoreTelephonySubscriberCache *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUICoreTelephonySubscriberCache;
  v9 = -[PSUICoreTelephonySubscriberCache init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    -[CoreTelephonyClient setDelegate:](v10->_client, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_simStatusCache, a4);
    -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](v10, "setMobileEquipmentInfoDict:", 0);
    -[PSUICoreTelephonySubscriberCache setIsoCountryCodesDict:](v10, "setIsoCountryCodesDict:", 0);
    -[PSUICoreTelephonySubscriberCache setShortLabelDict:](v10, "setShortLabelDict:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v10;
}

- (PSUICoreTelephonySubscriberCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)willEnterForeground
{
  -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](self, "setMobileEquipmentInfoDict:", 0);
  -[PSUICoreTelephonySubscriberCache setIsoCountryCodesDict:](self, "setIsoCountryCodesDict:", 0);
  -[PSUICoreTelephonySubscriberCache setShortLabelDict:](self, "setShortLabelDict:", 0);
}

- (void)fetchMobileEquipmentInfo
{
  NSObject *v3;
  CoreTelephonyClient *client;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PSUICoreTelephonySubscriberCache *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "fetchMobileEquipmentInfo executing", buf, 2u);
  }

  client = self->_client;
  v20 = 0;
  -[CoreTelephonyClient getMobileEquipmentInfo:](client, "getMobileEquipmentInfo:", &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v20;
  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "fetchMobileEquipmentInfo failed: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "fetchMobileEquipmentInfo succeeded: %@", buf, 0xCu);
    }

    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v15, "meInfoList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "slotId"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, v13);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    v14 = self;
    objc_sync_enter(v14);
    -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](v14, "setMobileEquipmentInfoDict:", v7);
    objc_sync_exit(v14);

  }
}

- (id)mobileEquipmentInfo:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonySubscriberCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonySubscriberCache mobileEquipmentInfoDict](self, "mobileEquipmentInfoDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonySubscriberCache fetchMobileEquipmentInfo](self, "fetchMobileEquipmentInfo");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonySubscriberCache mobileEquipmentInfoDict](v6, "mobileEquipmentInfoDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (unint64_t)mobileEquipmentInfoLength
{
  void *v3;
  PSUICoreTelephonySubscriberCache *v4;
  void *v5;
  unint64_t v6;

  -[PSUICoreTelephonySubscriberCache mobileEquipmentInfoDict](self, "mobileEquipmentInfoDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSUICoreTelephonySubscriberCache fetchMobileEquipmentInfo](self, "fetchMobileEquipmentInfo");
  v4 = self;
  objc_sync_enter(v4);
  -[PSUICoreTelephonySubscriberCache mobileEquipmentInfoDict](v4, "mobileEquipmentInfoDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_sync_exit(v4);
  return v6;
}

- (void)fetchCountryCodes
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CoreTelephonyClient *client;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  PSUICoreTelephonySubscriberCache *v16;
  __int128 v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "fetchCountryCodes executing", buf, 2u);
  }

  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 138412546;
    v17 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        client = self->_client;
        v19 = 0;
        -[CoreTelephonyClient getMobileSubscriberHomeCountryList:error:](client, "getMobileSubscriberHomeCountryList:error:", v9, &v19, v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v19;
        -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v9;
            v26 = 2112;
            v27 = v12;
            _os_log_error_impl(&dword_2161C6000, v14, OS_LOG_TYPE_ERROR, "fetchCountryCodes failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v9;
            v26 = 2112;
            v27 = v11;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "fetchCountryCodes succeeded: %@, %@", buf, 0x16u);
          }

          objc_msgSend(v11, "firstObject");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "slotID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v15);

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v5);
  }

  v16 = self;
  objc_sync_enter(v16);
  -[PSUICoreTelephonySubscriberCache setIsoCountryCodesDict:](v16, "setIsoCountryCodesDict:", v18);
  objc_sync_exit(v16);

}

- (id)isoCountryCode:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonySubscriberCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonySubscriberCache isoCountryCodesDict](self, "isoCountryCodesDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonySubscriberCache fetchCountryCodes](self, "fetchCountryCodes");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonySubscriberCache isoCountryCodesDict](v6, "isoCountryCodesDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (id)shortLabel:(id)a3
{
  id v4;
  void *v5;
  PSUICoreTelephonySubscriberCache *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PSUICoreTelephonySubscriberCache shortLabelDict](self, "shortLabelDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonySubscriberCache fetchShortLabels](self, "fetchShortLabels");
  v6 = self;
  objc_sync_enter(v6);
  -[PSUICoreTelephonySubscriberCache shortLabelDict](v6, "shortLabelDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  return v9;
}

- (void)fetchShortLabels
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  CoreTelephonyClient *client;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  PSUICoreTelephonySubscriberCache *v15;
  __int128 v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "fetchShortLabels executing", buf, 2u);
  }

  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        client = self->_client;
        v18 = 0;
        -[CoreTelephonyClient getShortLabel:error:](client, "getShortLabel:error:", v9, &v18, v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v18;
        -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v24 = v9;
            v25 = 2112;
            v26 = v12;
            _os_log_error_impl(&dword_2161C6000, v14, OS_LOG_TYPE_ERROR, "fetchShortLabels failed: %@, %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v24 = v9;
            v25 = 2112;
            v26 = v11;
            _os_log_impl(&dword_2161C6000, v14, OS_LOG_TYPE_DEFAULT, "fetchShortLabels succeeded: %@, %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "slotID"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, v14);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v5);
  }

  v15 = self;
  objc_sync_enter(v15);
  -[PSUICoreTelephonySubscriberCache setShortLabelDict:](v15, "setShortLabelDict:", v17);
  objc_sync_exit(v15);

}

- (void)shortLabelsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Short labels did change, clearing short label cache", v4, 2u);
  }

  -[PSUICoreTelephonySubscriberCache setShortLabelDict:](self, "setShortLabelDict:", 0);
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](self, "setMobileEquipmentInfoDict:", 0, a4);
  -[PSUICoreTelephonySubscriberCache setIsoCountryCodesDict:](self, "setIsoCountryCodesDict:", 0);
}

- (void)prlVersionDidChange:(id)a3 version:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICoreTelephonySubscriberCache setMobileEquipmentInfoDict:](self, "setMobileEquipmentInfoDict:", 0);
  -[PSUICoreTelephonySubscriberCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[PSUICoreTelephonySubscriberCache prlVersionDidChange:version:]";
    v13 = 2112;
    v14 = CFSTR("PSUIPRLVersionChanged");
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("SubscriptionContext");
  v10 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("PSUIPRLVersionChanged"), 0, v8);
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("SubscriberCache"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSMutableDictionary)mobileEquipmentInfoDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMobileEquipmentInfoDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)isoCountryCodesDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsoCountryCodesDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)shortLabelDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setShortLabelDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortLabelDict, 0);
  objc_storeStrong((id *)&self->_isoCountryCodesDict, 0);
  objc_storeStrong((id *)&self->_mobileEquipmentInfoDict, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
}

@end
