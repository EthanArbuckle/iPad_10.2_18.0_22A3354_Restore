@implementation PSUICoreTelephonyCapabilitiesCache

+ (id)sharedInstance
{
  if (qword_253E96F88 != -1)
    dispatch_once(&qword_253E96F88, &__block_literal_global_0);
  return (id)_MergedGlobals_54;
}

void __52__PSUICoreTelephonyCapabilitiesCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyCapabilitiesCache initPrivate]([PSUICoreTelephonyCapabilitiesCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_54;
  _MergedGlobals_54 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSUICoreTelephonyCapabilitiesCache *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CoreTelephonyClient *client;
  uint64_t v7;
  PSSimStatusCache *simStatusCache;
  CTCapability *v9;
  CTCapability *v10;
  CTCapability *v11;
  CTCapability *v12;
  CTCapability *v13;
  CTCapability *v14;
  CTCapability *v15;
  CTCapability *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PSUICoreTelephonyCapabilitiesCache;
  v2 = -[PSUICoreTelephonyCapabilitiesCache init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC2810]);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("capabilities_cache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithQueue:", v4);
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v5;

    -[CoreTelephonyClient setDelegate:](v2->_client, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    simStatusCache = v2->_simStatusCache;
    v2->_simStatusCache = (PSSimStatusCache *)v7;

    v9 = [CTCapability alloc];
    v10 = -[CTCapability initWithCapabilityName:](v9, "initWithCapabilityName:", *MEMORY[0x24BDC29B8]);
    -[PSUICoreTelephonyCapabilitiesCache setVolteCapability:](v2, "setVolteCapability:", v10);

    v11 = [CTCapability alloc];
    v12 = -[CTCapability initWithCapabilityName:](v11, "initWithCapabilityName:", *MEMORY[0x24BDC29C0]);
    -[PSUICoreTelephonyCapabilitiesCache setVonrCapability:](v2, "setVonrCapability:", v12);

    v13 = [CTCapability alloc];
    v14 = -[CTCapability initWithCapabilityName:](v13, "initWithCapabilityName:", *MEMORY[0x24BDC29F0]);
    -[PSUICoreTelephonyCapabilitiesCache setTurnOffCellularCapability:](v2, "setTurnOffCellularCapability:", v14);

    v15 = [CTCapability alloc];
    v16 = -[CTCapability initWithCapabilityName:](v15, "initWithCapabilityName:", *MEMORY[0x24BDC29E0]);
    -[PSUICoreTelephonyCapabilitiesCache setNetworkSlicingCapability:](v2, "setNetworkSlicingCapability:", v16);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (PSUICoreTelephonyCapabilitiesCache)init
{
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v2 = 136315138;
    v3 = "-[PSUICoreTelephonyCapabilitiesCache init]";
    _os_log_error_impl(&dword_2161C6000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unsupported initializer called: %s", (uint8_t *)&v2, 0xCu);
  }
  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)fetchCanSetCapabilityWithCache:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *client;
  void *v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  PSUICoreTelephonyCapabilitiesCache *v18;
  uint64_t v19;
  id v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Executing can set capability fetch for %@", buf, 0xCu);
  }

  v21 = 0;
  client = self->_client;
  objc_msgSend(v6, "capabilityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[CoreTelephonyClient context:canSetCapability:allowed:with:](client, "context:canSetCapability:allowed:with:", v7, v10, &v21, &v20);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (v11)
  {
    -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "Can set fetch for %@ failed: %@", buf, 0x16u);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC29E8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("YES");
      *(_DWORD *)buf = 138413058;
      if (v21)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v23 = v7;
      if (!(_DWORD)v14)
        v16 = CFSTR("NO");
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Can set fetch for %@, Allowed: %@, Enabled: %@, %@", buf, 0x2Au);
    }
  }

  v18 = self;
  objc_sync_enter(v18);
  v19 = objc_msgSend(v7, "slotID");
  objc_msgSend(v6, "acceptCapabilityforSlotID:status:canSet:info:", v19, v14, v21, v12);
  objc_sync_exit(v18);

}

- (BOOL)canSetCapabilityForContext:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  PSUICoreTelephonyCapabilitiesCache *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "capabilityFetched");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x24BDBD1C8]);

  if ((v11 & 1) == 0)
    -[PSUICoreTelephonyCapabilitiesCache fetchCanSetCapabilityWithCache:forContext:](self, "fetchCanSetCapabilityWithCache:forContext:", v7, v6);
  v12 = self;
  objc_sync_enter(v12);
  v13 = objc_msgSend(v7, "getCapabilityForSlotID:", objc_msgSend(v6, "slotID"));
  objc_sync_exit(v12);

  return v13;
}

- (BOOL)getCapabilityInfo:(id)a3 forContext:(id)a4 cache:(id)a5
{
  void *v5;
  char v6;

  -[PSUICoreTelephonyCapabilitiesCache getCapabilityInfoObject:forContext:cache:](self, "getCapabilityInfoObject:forContext:cache:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (id)getCapabilityInfoObject:(id)a3 forContext:(id)a4 cache:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  PSUICoreTelephonyCapabilitiesCache *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "slotID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "capabilityFetched");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", MEMORY[0x24BDBD1C8]);

  if ((v14 & 1) == 0)
    -[PSUICoreTelephonyCapabilitiesCache fetchCanSetCapabilityWithCache:forContext:](self, "fetchCanSetCapabilityWithCache:forContext:", v10, v9);
  v15 = self;
  objc_sync_enter(v15);
  objc_msgSend(v10, "getCapabilityInfoObject:forSlotID:", v8, objc_msgSend(v9, "slotID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v15);

  return v16;
}

- (void)setCapabilityInfoObject:(id)a3 forKey:(id)a4 forContext:(id)a5 cache:(id)a6
{
  id v10;
  id v11;
  id v12;
  PSUICoreTelephonyCapabilitiesCache *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = self;
  objc_sync_enter(v13);
  objc_msgSend(v12, "setCapabilityInfoObject:forKey:forSlotID:", v14, v10, objc_msgSend(v11, "slotID"));
  objc_sync_exit(v13);

}

- (void)fetchCapabilityEnabledWithCache:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *client;
  void *v10;
  __CFString *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  PSUICoreTelephonyCapabilitiesCache *v18;
  uint64_t v19;
  id v20;
  unsigned __int8 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Executing capability enabled fetch", buf, 2u);
  }

  v21 = 0;
  client = self->_client;
  objc_msgSend(v6, "capabilityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  -[CoreTelephonyClient context:getCapability:status:with:](client, "context:getCapability:status:with:", v7, v10, &v21, &v20);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (v11)
  {
    -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v7;
      v24 = 2112;
      v25 = v11;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "Capability enabled fetch failed for %@: %@", buf, 0x16u);
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDC29D0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      if ((_DWORD)v14)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v23 = v7;
      v24 = 2112;
      if (v21)
        v16 = CFSTR("YES");
      v25 = v17;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Fetch for capability for %@, Allowed: %@, Enabled: %@, %@", buf, 0x2Au);
    }
  }

  v18 = self;
  objc_sync_enter(v18);
  v19 = objc_msgSend(v7, "slotID");
  objc_msgSend(v6, "acceptCapabilityforSlotID:status:canSet:info:", v19, v21, v14, v12);
  objc_sync_exit(v18);

}

- (BOOL)capabilityEnabledForContext:(id)a3 cache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  PSUICoreTelephonyCapabilitiesCache *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enabledFetched");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x24BDBD1C8]);

  if ((v11 & 1) == 0)
    -[PSUICoreTelephonyCapabilitiesCache fetchCapabilityEnabledWithCache:forContext:](self, "fetchCapabilityEnabledWithCache:forContext:", v7, v6);
  v12 = self;
  objc_sync_enter(v12);
  v13 = objc_msgSend(v7, "getEnabledForSlotID:", objc_msgSend(v6, "slotID"));
  objc_sync_exit(v12);

  return v13;
}

- (void)setCapabilityEnabledForContext:(id)a3 cache:(id)a4 enabled:(BOOL)a5 info:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  CoreTelephonyClient *client;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  PSUICoreTelephonyCapabilitiesCache *v19;
  int v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v7)
      v14 = CFSTR("YES");
    v20 = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "Setting capability for %@ to %@", (uint8_t *)&v20, 0x16u);
  }

  client = self->_client;
  objc_msgSend(v11, "capabilityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreTelephonyClient context:setCapability:enabled:with:](client, "context:setCapability:enabled:with:", v10, v16, v7, v12);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (PSUICoreTelephonyCapabilitiesCache *)v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_2161C6000, &v19->super, OS_LOG_TYPE_ERROR, "Set capability for context %@ failed: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_2161C6000, &v19->super, OS_LOG_TYPE_DEFAULT, "Set succeeded", (uint8_t *)&v20, 2u);
    }

    v19 = self;
    objc_sync_enter(v19);
    objc_msgSend(v11, "setEnabled:forSlotID:", v7, objc_msgSend(v10, "slotID"));
    objc_sync_exit(v19);
  }

}

- (BOOL)canSetCapabilityVoLTE:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache canSetCapabilityForContext:cache:](self, "canSetCapabilityForContext:cache:", v4, v5);

  return (char)self;
}

- (BOOL)cannotChangeVoLTESettingCallCarrier:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *MEMORY[0x24BDC29D8];
  v5 = a3;
  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache getCapabilityInfo:forContext:cache:](self, "getCapabilityInfo:forContext:cache:", v4, v5, v6);

  return (char)self;
}

- (BOOL)isVoLTEStillProvisioningForContext:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *MEMORY[0x24BDC29C8];
  v5 = a3;
  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache getCapabilityInfo:forContext:cache:](self, "getCapabilityInfo:forContext:cache:", v4, v5, v6);

  return (char)self;
}

- (BOOL)capabilityEnabledVoLTE:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledForContext:cache:](self, "capabilityEnabledForContext:cache:", v4, v5);

  return (char)self;
}

- (void)setCapabilityVoLTE:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setCapabilityEnabledForContext:cache:enabled:info:](self, "setCapabilityEnabledForContext:cache:enabled:info:", v6, v7, v4, 0);

}

- (BOOL)fetchDeviceAndPlan5GSupport:(id)a3
{
  id v4;
  CoreTelephonyClient *client;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  char v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  client = self->_client;
  v14 = 0;
  -[CoreTelephonyClient getSupports5G:error:](client, "getSupports5G:error:", v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "BOOLValue");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %@", buf, 0x16u);
  }

  v12 = objc_msgSend(v6, "BOOLValue");
  return v12;
}

- (BOOL)canSetCapabilityVoNR:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache vonrCapability](self, "vonrCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache canSetCapabilityForContext:cache:](self, "canSetCapabilityForContext:cache:", v4, v5);

  return (char)self;
}

- (BOOL)capabilityEnabledVoNR:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache vonrCapability](self, "vonrCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledForContext:cache:](self, "capabilityEnabledForContext:cache:", v4, v5);

  return (char)self;
}

- (void)setCapabilityVoNR:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PSUICoreTelephonyCapabilitiesCache vonrCapability](self, "vonrCapability");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setCapabilityEnabledForContext:cache:enabled:info:](self, "setCapabilityEnabledForContext:cache:enabled:info:", v6, v7, v4, 0);

}

- (BOOL)canSetTurnOffCellular:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache turnOffCellularCapability](self, "turnOffCellularCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache canSetCapabilityForContext:cache:](self, "canSetCapabilityForContext:cache:", v4, v5);

  return (char)self;
}

- (BOOL)getTurnOffCellular:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache turnOffCellularCapability](self, "turnOffCellularCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledForContext:cache:](self, "capabilityEnabledForContext:cache:", v4, v5);

  return (char)self;
}

- (void)setTurnOffCellular:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[PSUICoreTelephonyCapabilitiesCache turnOffCellularCapability](self, "turnOffCellularCapability");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setCapabilityEnabledForContext:cache:enabled:info:](self, "setCapabilityEnabledForContext:cache:enabled:info:", v6, v7, v4, 0);

}

- (BOOL)canSetNetworkSlicing:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache canSetCapabilityForContext:cache:](self, "canSetCapabilityForContext:cache:", v4, v5);

  return (char)self;
}

- (BOOL)getNetworkSlicing:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PSUICoreTelephonyCapabilitiesCache capabilityEnabledForContext:cache:](self, "capabilityEnabledForContext:cache:", v4, v5);

  return (char)self;
}

- (void)setNetworkSlicing:(id)a3 enabled:(BOOL)a4 category:(id)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v5 = a4;
  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = *MEMORY[0x24BDC2AC0];
  v14[0] = a5;
  v8 = (void *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setCapabilityEnabledForContext:cache:enabled:info:](self, "setCapabilityEnabledForContext:cache:enabled:info:", v10, v12, v5, v11);

}

- (id)networkSlicingCategories:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x24BDC2AB8];
  v5 = a3;
  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache getCapabilityInfoObject:forContext:cache:](self, "getCapabilityInfoObject:forContext:cache:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setNetworkSlicingCategories:(id)a3 forContext:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *MEMORY[0x24BDC2AB8];
  v7 = a4;
  v8 = a3;
  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCapabilitiesCache setCapabilityInfoObject:forKey:forContext:cache:](self, "setCapabilityInfoObject:forKey:forContext:cache:", v8, v6, v7, v9);

}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138412546;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "capabilitiesChanged: %@, %@", (uint8_t *)&v39, 0x16u);
  }

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC29B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (_QWORD *)MEMORY[0x24BDC29D0];
  v12 = (_QWORD *)MEMORY[0x24BDC29E8];
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDC29D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v10, "objectForKey:", *v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v16, v14, v10);

  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC29C0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "objectForKey:", *v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v19, "objectForKey:", *v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache vonrCapability](self, "vonrCapability");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v23, v21, v19);

  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC29F0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "objectForKey:", *v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v26, "objectForKey:", *v12);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache turnOffCellularCapability](self, "turnOffCellularCapability");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v30, v28, v26);

  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BDC29E0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "objectForKey:", *v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "BOOLValue");

    objc_msgSend(v33, "objectForKey:", *v12);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "BOOLValue");

    -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "acceptCapabilityforSlotID:status:canSet:info:", objc_msgSend(v6, "slotID"), v37, v35, v33);

  }
}

- (void)clearCache
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  -[PSUICoreTelephonyCapabilitiesCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing capabilities cache", v8, 2u);
  }

  -[PSUICoreTelephonyCapabilitiesCache volteCapability](self, "volteCapability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  -[PSUICoreTelephonyCapabilitiesCache vonrCapability](self, "vonrCapability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reset");

  -[PSUICoreTelephonyCapabilitiesCache turnOffCellularCapability](self, "turnOffCellularCapability");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reset");

  -[PSUICoreTelephonyCapabilitiesCache networkSlicingCapability](self, "networkSlicingCapability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("Capabilities"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (CTCapability)volteCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVolteCapability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CTCapability)vonrCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVonrCapability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CTCapability)turnOffCellularCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTurnOffCellularCapability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CTCapability)networkSlicingCapability
{
  return (CTCapability *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNetworkSlicingCapability:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSlicingCapability, 0);
  objc_storeStrong((id *)&self->_turnOffCellularCapability, 0);
  objc_storeStrong((id *)&self->_vonrCapability, 0);
  objc_storeStrong((id *)&self->_volteCapability, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
