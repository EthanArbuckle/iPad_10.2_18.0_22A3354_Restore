@implementation WFLocationQueryGeocodeCacheManager

+ (WFLocationQueryGeocodeCacheManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_12);
  return (WFLocationQueryGeocodeCacheManager *)(id)sharedManager_geocodeCacheManager;
}

void __51__WFLocationQueryGeocodeCacheManager_sharedManager__block_invoke()
{
  WFLocationQueryGeocodeCacheManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFLocationQueryGeocodeCacheManager);
  v1 = (void *)sharedManager_geocodeCacheManager;
  sharedManager_geocodeCacheManager = (uint64_t)v0;

}

- (WFLocationQueryGeocodeCacheManager)init
{
  WFLocationQueryGeocodeCacheManager *v2;
  WFLocationQueryGeocodeCacheManager *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *geocodeCache;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFLocationQueryGeocodeCacheManager;
  v2 = -[WFLocationQueryGeocodeCacheManager init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    -[WFLocationQueryGeocodeCacheManager _persistedInfoFromDisk](v2, "_persistedInfoFromDisk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    geocodeCache = v3->_geocodeCache;
    v3->_geocodeCache = (NSMutableDictionary *)v5;

    +[WFSettingsManager sharedInstance](WFSettingsManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cachedGeocodeLocationExpirationTimeInterval");
    v3->_expirationTime = v9;

    if (v3->_geocodeCache)
    {
      -[WFLocationQueryGeocodeCacheManager _discardExpiredLocations](v3, "_discardExpiredLocations");
    }
    else
    {
      WFLogForCategory(5uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[WFLocationQueryGeocodeCacheManager init].cold.1(v10);

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v3->_geocodeCache;
      v3->_geocodeCache = (NSMutableDictionary *)v11;

    }
  }
  return v3;
}

- (void)updateCacheForKey:(id)a3 withLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    os_unfair_lock_lock_with_options();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[WFLocationQueryGeocodeCacheManager geocodeCache](self, "geocodeCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    -[WFLocationQueryGeocodeCacheManager _persistInfoToDisk](self, "_persistInfoToDisk");
  }
  else
  {
    WFLogForCategory(5uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WFLocationQueryGeocodeCacheManager updateCacheForKey:withLocation:].cold.1(v10);

  }
}

- (id)cachedLocationForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[WFLocationQueryGeocodeCacheManager geocodeCache](self, "geocodeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;
  -[WFLocationQueryGeocodeCacheManager expirationTime](self, "expirationTime");
  v13 = v12;

  if (v11 >= v13)
  {

    -[WFLocationQueryGeocodeCacheManager geocodeCache](self, "geocodeCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v4);

    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    -[WFLocationQueryGeocodeCacheManager _persistInfoToDisk](self, "_persistInfoToDisk");
    v7 = 0;
  }
  else
  {
    os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  }

  return v7;
}

- (void)_discardExpiredLocations
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *geocodeCache;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  WFLocationQueryGeocodeCacheManager *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableDictionary count](self->_geocodeCache, "count");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  geocodeCache = self->_geocodeCache;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __62__WFLocationQueryGeocodeCacheManager__discardExpiredLocations__block_invoke;
  v16 = &unk_24CCA19D0;
  v7 = v5;
  v17 = v7;
  v18 = self;
  -[NSMutableDictionary wf_filter:](geocodeCache, "wf_filter:", &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy", v13, v14, v15, v16);
  v10 = self->_geocodeCache;
  self->_geocodeCache = v9;

  v11 = -[NSMutableDictionary count](self->_geocodeCache, "count");
  os_unfair_lock_unlock(p_dataSynchronizationLock);
  WFLogForCategory(5uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v20 = v4 - v11;
    _os_log_impl(&dword_21189A000, v12, OS_LOG_TYPE_DEFAULT, "Purged %ld expired locations from the cache", buf, 0xCu);
  }

  -[WFLocationQueryGeocodeCacheManager _persistInfoToDisk](self, "_persistInfoToDisk");
}

BOOL __62__WFLocationQueryGeocodeCacheManager__discardExpiredLocations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a3, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6 < *(double *)(*(_QWORD *)(a1 + 40) + 24);

  return v7;
}

- (void)_persistInfoToDisk
{
  os_unfair_lock_s *p_dataSynchronizationLock;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  p_dataSynchronizationLock = &self->_dataSynchronizationLock;
  os_unfair_lock_lock_with_options();
  v4 = objc_alloc(MEMORY[0x24BDBCE70]);
  -[WFLocationQueryGeocodeCacheManager geocodeCache](self, "geocodeCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "initWithDictionary:copyItems:", v5, 1);

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("geocodeCache"));
  objc_msgSend(v6, "finishEncoding");
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLocationQueryGeocodeCacheManager _persistedInfoURL](self, "_persistedInfoURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeToURL:atomically:", v8, 1);

}

- (id)_persistedInfoURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("locationQueryGeocodeCacheFolder"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_persistedInfoFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  id v17;

  v3 = (void *)MEMORY[0x24BDBCE50];
  -[WFLocationQueryGeocodeCacheManager _persistedInfoURL](self, "_persistedInfoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v5, &v17);
    v7 = v17;
    if (v6)
    {
      v8 = (void *)MEMORY[0x24BDBCF20];
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
      v11 = objc_claimAutoreleasedReturnValue();
      v16 = v7;
      objc_msgSend(v6, "decodeTopLevelObjectOfClasses:forKey:error:", v11, CFSTR("geocodeCache"), &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      if (!v12)
      {
        WFLogForCategory(5uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[WFLocationQueryGeocodeCacheManager _persistedInfoFromDisk].cold.2(self, (uint64_t)v13, v14);

      }
    }
    else
    {
      WFLogForCategory(5uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[WFLocationQueryGeocodeCacheManager _persistedInfoFromDisk].cold.1(self, (uint64_t)v7, v11);
      v12 = 0;
      v13 = v7;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (NSMutableDictionary)geocodeCache
{
  return self->_geocodeCache;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geocodeCache, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21189A000, log, OS_LOG_TYPE_DEBUG, "Couldn't find a geocode cache ... creating a new one", v1, 2u);
}

- (void)updateCacheForKey:(os_log_t)log withLocation:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21189A000, log, OS_LOG_TYPE_FAULT, "Cannot cache a nil location", v1, 2u);
}

- (void)_persistedInfoFromDisk
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_persistedInfoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_21189A000, a3, OS_LOG_TYPE_ERROR, "Failed to read geocode cache: %{public}@ -- %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_3();
}

@end
