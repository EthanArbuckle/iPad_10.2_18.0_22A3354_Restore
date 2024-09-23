@implementation PSUICoreTelephonyCarrierBundleCache

+ (PSUICoreTelephonyCarrierBundleCache)sharedInstance
{
  if (qword_253E970B0 != -1)
    dispatch_once(&qword_253E970B0, &__block_literal_global_18);
  return (PSUICoreTelephonyCarrierBundleCache *)(id)_MergedGlobals_70;
}

void __53__PSUICoreTelephonyCarrierBundleCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUICoreTelephonyCarrierBundleCache initPrivate]([PSUICoreTelephonyCarrierBundleCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_70;
  _MergedGlobals_70 = (uint64_t)v0;

}

- (id)initPrivate
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  PSUICoreTelephonyCarrierBundleCache *v7;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("carrier_bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PSUICoreTelephonyCarrierBundleCache initWithCoreTelephonyClient:simStatusCache:](self, "initWithCoreTelephonyClient:simStatusCache:", v5, v6);

  return v7;
}

- (PSUICoreTelephonyCarrierBundleCache)initWithCoreTelephonyClient:(id)a3 simStatusCache:(id)a4
{
  id v7;
  id v8;
  PSUICoreTelephonyCarrierBundleCache *v9;
  PSUICoreTelephonyCarrierBundleCache *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PSUICoreTelephonyCarrierBundleCache;
  v9 = -[PSUICoreTelephonyCarrierBundleCache init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    -[CoreTelephonyClient setDelegate:](v10->_client, "setDelegate:", v10);
    objc_storeStrong((id *)&v10->_simCache, a4);
    -[PSUICoreTelephonyCarrierBundleCache resetDictionariesBySlot](v10, "resetDictionariesBySlot");
    -[PSUICoreTelephonyCarrierBundleCache createKeysAndDefaultValues](v10, "createKeysAndDefaultValues");
    -[PSUICoreTelephonyCarrierBundleCache _clearCache](v10, "_clearCache");
    -[PSUICoreTelephonyCarrierBundleCache bulkFetch](v10, "bulkFetch");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_willEnterForeground, *MEMORY[0x24BEBE008], 0);

  }
  return v10;
}

- (PSUICoreTelephonyCarrierBundleCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSUICoreTelephonyCarrierBundleCache init]";
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)resetDictionariesBySlot
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *dictionariesBySlot;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableDictionary *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache subscriptionContexts](self->_simCache, "subscriptionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  v4 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  dictionariesBySlot = self->_dictionariesBySlot;
  self->_dictionariesBySlot = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PSSimStatusCache subscriptionContexts](self->_simCache, "subscriptionContexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = self->_dictionariesBySlot;
        v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "slotID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
}

- (void)createKeysAndDefaultValues
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *keys;
  NSArray *defaultValues;
  NSArray *v9;
  NSArray *v10;
  _QWORD v11[4];
  NSArray *v12;
  NSArray *v13;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24D51C6E0, "count"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(&unk_24D51C6E0, "count"));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__PSUICoreTelephonyCarrierBundleCache_createKeysAndDefaultValues__block_invoke;
  v11[3] = &unk_24D502488;
  v5 = v3;
  v12 = v5;
  v6 = v4;
  v13 = v6;
  objc_msgSend(&unk_24D51C6E0, "enumerateKeysAndObjectsUsingBlock:", v11);
  keys = self->_keys;
  self->_keys = v5;
  v10 = v5;

  defaultValues = self->_defaultValues;
  self->_defaultValues = v6;
  v9 = v6;

}

void __65__PSUICoreTelephonyCarrierBundleCache_createKeysAndDefaultValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)_clearCache
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Clearing carrier bundle cache", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  -[PSUICoreTelephonyCarrierBundleCache setCarrierBundleVersionDict:](self, "setCarrierBundleVersionDict:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  -[PSUICoreTelephonyCarrierBundleCache resetDictionariesBySlot](self, "resetDictionariesBySlot");
}

- (void)willEnterForeground
{
  -[PSUICoreTelephonyCarrierBundleCache _clearCache](self, "_clearCache");
  -[PSUICoreTelephonyCarrierBundleCache bulkFetch](self, "bulkFetch");
}

- (id)getDictionaryForSlotID:(int64_t)a3
{
  NSMutableDictionary *dictionariesBySlot;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;

  dictionariesBySlot = self->_dictionariesBySlot;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](dictionariesBySlot, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = self->_dictionariesBySlot;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v9);

  }
  return v7;
}

- (void)bulkFetch
{
  -[PSUICoreTelephonyCarrierBundleCache bulkFetchForKeys:defaultValues:](self, "bulkFetchForKeys:defaultValues:", self->_keys, self->_defaultValues);
}

- (void)bulkFetchForKeys:(id)a3 defaultValues:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CoreTelephonyClient *client;
  void *v14;
  id obj;
  _QWORD v16[6];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PSSimStatusCache subscriptionContexts](self->_simCache, "subscriptionContexts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        client = self->_client;
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __70__PSUICoreTelephonyCarrierBundleCache_bulkFetchForKeys_defaultValues___block_invoke;
        v16[3] = &unk_24D5024B0;
        v16[4] = self;
        v16[5] = v12;
        v17 = v6;
        -[CoreTelephonyClient copyCarrierBundleValues:keys:defaultValues:bundleType:withFallbackBundleCheck:completion:](client, "copyCarrierBundleValues:keys:defaultValues:bundleType:withFallbackBundleCheck:completion:", v12, v17, v7, v14, 1, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

}

void __70__PSUICoreTelephonyCarrierBundleCache_bulkFetchForKeys_defaultValues___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(a1[4], "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[5];
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136316162;
      v15 = "-[PSUICoreTelephonyCarrierBundleCache bulkFetchForKeys:defaultValues:]_block_invoke";
      v16 = 2112;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = MEMORY[0x24BDBD1A8];
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "%s bulk fetch from: %@ with UUID:%{public}@ for keys: %{public}@ failed. Error: %{public}@", (uint8_t *)&v14, 0x34u);

    }
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    objc_msgSend(a1[4], "getDictionaryForSlotID:", objc_msgSend(a1[5], "slotID"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1[6], "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v8, "setObject:forKey:", v10, v11);

        ++v9;
      }
      while (objc_msgSend(a1[6], "count") > v9);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  }

}

- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *client;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s executing fetch %@ %@", buf, 0x20u);
  }

  client = self->_client;
  v17 = 0;
  -[CoreTelephonyClient context:getCarrierBundleValue:error:](client, "context:getCarrierBundleValue:error:", v7, v6, &v17);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v17;
  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
      v20 = 2112;
      v21 = v7;
      v22 = 2114;
      v23 = v16;
      v24 = 2114;
      v25 = v6;
      v26 = 2114;
      v27 = v11;
      _os_log_error_impl(&dword_2161C6000, v13, OS_LOG_TYPE_ERROR, "%s fetch from: %@ with UUID:%{public}@ for key hierarchy: %{public}@ failed. Error: %{public}@", buf, 0x34u);

    }
    v13 = v10;
    v10 = 0;
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v19 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:]";
    v20 = 2112;
    v21 = v7;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v6;
    v26 = 2114;
    v27 = v10;
    _os_log_impl(&dword_2161C6000, v13, OS_LOG_TYPE_DEFAULT, "%s fetch from: %@ with UUID:%{public}@ for key hierarchy: %{public}@ successful. Value:%{public}@", buf, 0x34u);

  }
  return v10;
}

- (id)getCarrierBundleValueForKey:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", objc_msgSend(v7, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:](self, "fetchCarrierBundleValue:context:", v10, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v8, "setObject:forKey:", v9, v6);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);

  return v9;
}

- (id)getCarrierBundleStringForKey:(id)a3 context:(id)a4
{
  void *v4;
  id v5;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleValueForKey:context:](self, "getCarrierBundleValueForKey:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (BOOL)getCarrierBundleFlagForKey:(id)a3 context:(id)a4
{
  void *v4;
  char v5;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleValueForKey:context:](self, "getCarrierBundleValueForKey:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (id)getCarrierBundleArrayForKey:(id)a3 context:(id)a4
{
  void *v4;
  id v5;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleValueForKey:context:](self, "getCarrierBundleValueForKey:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)getCarrierBundleDictForKey:(id)a3 context:(id)a4
{
  void *v4;
  id v5;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleValueForKey:context:](self, "getCarrierBundleValueForKey:context:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)carrierName:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("CarrierName"), a3);
}

- (id)activeDataCarrierName
{
  void *v3;
  void *v4;

  -[PSSimStatusCache activeDataSubscriptionContext](self->_simCache, "activeDataSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCarrierBundleCache carrierName:](self, "carrierName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)fetchCarrierBundleVersion
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CoreTelephonyClient *client;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s executing fetch", buf, 0xCu);
  }

  -[PSSimStatusCache subscriptionContexts](self->_simCache, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v21;
    *(_QWORD *)&v8 = 136315650;
    v18 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        client = self->_client;
        v19 = 0;
        v14 = (void *)-[CoreTelephonyClient copyCarrierBundleVersion:error:](client, "copyCarrierBundleVersion:error:", v12, &v19, v18);
        v15 = v19;
        -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v15)
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
            v26 = 2112;
            v27 = v12;
            v28 = 2112;
            v29 = v15;
            _os_log_error_impl(&dword_2161C6000, v17, OS_LOG_TYPE_ERROR, "%s fetch failed: %@, %@", buf, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v25 = "-[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion]";
            v26 = 2112;
            v27 = v12;
            v28 = 2112;
            v29 = v14;
            _os_log_impl(&dword_2161C6000, v17, OS_LOG_TYPE_DEFAULT, "%s fetched succeeded: %@, %@", buf, 0x20u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "slotID"));
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v17);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v9);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  -[PSUICoreTelephonyCarrierBundleCache setCarrierBundleVersionDict:](self, "setCarrierBundleVersionDict:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);

}

- (id)carrierBundleVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PSUICoreTelephonyCarrierBundleCache carrierBundleVersionDict](self, "carrierBundleVersionDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleVersion](self, "fetchCarrierBundleVersion");
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  -[PSUICoreTelephonyCarrierBundleCache carrierBundleVersionDict](self, "carrierBundleVersionDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v4, "slotID");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  return v10;
}

- (BOOL)shouldOverride3Gto4G:(id)a3
{
  void *v3;
  char v4;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("DataIndicatorOverride"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("4G"));

  return v4;
}

- (BOOL)shouldOverrideLTEto4G:(id)a3
{
  void *v3;
  char v4;

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("DataIndicatorOverrideForLTE"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("4G"));

  return v4;
}

- (id)volteCustomerCarePhoneNumber:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("VoLTECustomerCarePhoneNumber"), a3);
}

- (id)volteCustomerCareWebsite:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("VoLTECustomerCareWebsite"), a3);
}

- (BOOL)showVolteWarningUnsupportedCarrier:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("ShowVolteWarningUnsupportedCarrier"), a3);
}

- (BOOL)showVoNRWarningUnsupportedCarrier:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("ShowVoNRWarningUnsupportedCarrier"), a3);
}

- (BOOL)show5GWarningUnsupportedCarrier:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("Show5GWarningUnsupportedCarrier"), a3);
}

- (BOOL)is5GSAEnabledByDefault:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("Enable5GStandaloneByDefault"), a3);
}

- (BOOL)show5GSACoverageExtension:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("Supports5GSACoverageExtension"), a3);
}

- (void)bulkFetchCarrierServicesNamesForServices:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  PSUICoreTelephonyCarrierBundleCache *v17;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
  v18 = v7;
  v17 = self;
  -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", objc_msgSend(v7, "slotID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "objectForKey:", CFSTR("ServiceName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_SERVICE_NAME"), v14);
          objc_msgSend(v8, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(v20, "addObject:", v15);
            objc_msgSend(v19, "addObject:", &stru_24D5028C8);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
  if (objc_msgSend(v20, "count"))
    -[PSUICoreTelephonyCarrierBundleCache bulkFetchForKeys:defaultValues:](v17, "bulkFetchForKeys:defaultValues:", v20, v19);

}

- (id)carrierServices:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleArrayForKey:context:](self, "getCarrierBundleArrayForKey:context:", CFSTR("Services"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICoreTelephonyCarrierBundleCache bulkFetchCarrierServicesNamesForServices:context:](self, "bulkFetchCarrierServicesNamesForServices:context:", v5, v4);

  return v5;
}

- (BOOL)showServiceCodes:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("ShowServiceCodes"), a3);
}

- (id)carrierServiceNameForServiceName:(id)a3 context:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@_SERVICE_NAME"), v8);

  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)carrierServicesAccountUrl:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("MyAccountURL"), a3);
}

- (id)carrierServicesWebViewAccountUrl:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("MyAccountURLInWebViewer"), a3);
}

- (id)carrierServicesMyAccountUrlTitle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("MyAccountURLTitle"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_MYACCOUNTURLTITLE"), v5);
    if (v7)
    {
      -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
      {
        v9 = v8;

        v6 = v9;
      }

    }
  }
  else
  {
    -[PSUICoreTelephonyCarrierBundleCache carrierName:](self, "carrierName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)mmsInfoUrl:(id)a3
{
  return -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("MMSInformationURL"), a3);
}

- (id)mmsInfoTitle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", CFSTR("MMSInformationURLTitle"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@_MMSINFORMATIONURLTITLE"), v5);
    if (v7)
    {
      -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleStringForKey:context:](self, "getCarrierBundleStringForKey:context:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_msgSend(v7, "isEqualToString:", v8) & 1) == 0)
      {
        v9 = v8;

        v6 = v9;
      }

    }
  }
  else
  {
    -[PSUICoreTelephonyCarrierBundleCache carrierName:](self, "carrierName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)shouldShowVoiceRoamingSwitchForDefaultVoicePlan
{
  void *v3;
  BOOL v4;

  -[PSSimStatusCache defaultVoiceSubscriptionContext](self->_simCache, "defaultVoiceSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleFlagForKey:context:](self, "getCarrierBundleFlagForKey:context:", CFSTR("ShowVoiceRoamingSwitch"), v3);
  else
    v4 = 0;

  return v4;
}

- (BOOL)isMMSOnWhileRoamingForActiveDataPlan
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;

  -[PSSimStatusCache activeDataSubscriptionContext](self->_simCache, "activeDataSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&cacheLock);
    -[PSUICoreTelephonyCarrierBundleCache getDictionaryForSlotID:](self, "getDictionaryForSlotID:", objc_msgSend(v3, "slotID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("OnWhileRoaming"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PSUICoreTelephonyCarrierBundleCache fetchCarrierBundleValue:context:](self, "fetchCarrierBundleValue:context:", &unk_24D51C6B0, v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v5 = v6;
      else
        v5 = (id)MEMORY[0x24BDBD1C0];
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("OnWhileRoaming"));

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&cacheLock);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v5, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)shouldShowWifiAssistForActiveDataPlan
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PSSimStatusCache activeDataSubscriptionContext](self->_simCache, "activeDataSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PSUICoreTelephonyCarrierBundleCache getCarrierBundleDictForKey:context:](self, "getCarrierBundleDictForKey:context:", CFSTR("ReliableNetworkFallback"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserCanEdit"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v7 = objc_msgSend(v6, "BOOLValue");
      else
        v7 = 1;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICoreTelephonyCarrierBundleCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICoreTelephonyCarrierBundleCache carrierBundleChange:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s updating cached values for: %@", (uint8_t *)&v6, 0x16u);
  }

  -[PSUICoreTelephonyCarrierBundleCache _clearCache](self, "_clearCache");
  -[PSUICoreTelephonyCarrierBundleCache bulkFetch](self, "bulkFetch");

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierBundleCache"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (PSSimStatusCache)simCache
{
  return self->_simCache;
}

- (void)setSimCache:(id)a3
{
  objc_storeStrong((id *)&self->_simCache, a3);
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
  objc_storeStrong((id *)&self->_keys, a3);
}

- (NSArray)defaultValues
{
  return self->_defaultValues;
}

- (void)setDefaultValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultValues, a3);
}

- (NSMutableDictionary)dictionariesBySlot
{
  return self->_dictionariesBySlot;
}

- (void)setDictionariesBySlot:(id)a3
{
  objc_storeStrong((id *)&self->_dictionariesBySlot, a3);
}

- (NSMutableDictionary)carrierBundleVersionDict
{
  return self->_carrierBundleVersionDict;
}

- (void)setCarrierBundleVersionDict:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleVersionDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierBundleVersionDict, 0);
  objc_storeStrong((id *)&self->_dictionariesBySlot, 0);
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_simCache, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
