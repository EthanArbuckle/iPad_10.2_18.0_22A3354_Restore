@implementation WFAQIScaleCacheManager

+ (WFAQIScaleCacheManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_19);
  return (WFAQIScaleCacheManager *)(id)sharedManager_aqiScaleCacheManager;
}

void __39__WFAQIScaleCacheManager_sharedManager__block_invoke()
{
  WFAQIScaleCacheManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFAQIScaleCacheManager);
  v1 = (void *)sharedManager_aqiScaleCacheManager;
  sharedManager_aqiScaleCacheManager = (uint64_t)v0;

}

- (WFAQIScaleCacheManager)init
{
  WFAQIScaleCacheManager *v2;
  WFAQIScaleCacheManager *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *aqiScaleCache;
  NSObject *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFAQIScaleCacheManager;
  v2 = -[WFAQIScaleCacheManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    -[WFAQIScaleCacheManager _persistedInfoFromDisk](v2, "_persistedInfoFromDisk");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    aqiScaleCache = v3->_aqiScaleCache;
    v3->_aqiScaleCache = (NSMutableDictionary *)v5;

    if (!v3->_aqiScaleCache)
    {
      WFLogForCategory(5uLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[WFAQIScaleCacheManager init].cold.1();

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v3->_aqiScaleCache;
      v3->_aqiScaleCache = (NSMutableDictionary *)v8;

    }
  }
  return v3;
}

- (void)updateCacheWithScale:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    WFLogForCategory(5uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:].cold.1();
    goto LABEL_8;
  }
  if (!v7)
  {
    WFLogForCategory(5uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:].cold.2();
LABEL_8:

    goto LABEL_9;
  }
  os_unfair_lock_lock_with_options();
  -[WFAQIScaleCacheManager aqiScaleCache](self, "aqiScaleCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v8);

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  -[WFAQIScaleCacheManager _persistInfoToDisk](self, "_persistInfoToDisk");
LABEL_9:

}

- (id)cachedScaleFromIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFAQIScaleCacheManager aqiScaleCache](self, "aqiScaleCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_dataSynchronizationLock);
  }
  else
  {
    WFLogForCategory(5uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[WFAQIScaleCacheManager updateCacheWithScale:identifier:].cold.2();

    v7 = 0;
  }

  return v7;
}

- (void)clearCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  WeatherFoundationInternalUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("aqiRemoteScales"));

  os_unfair_lock_lock_with_options();
  -[WFAQIScaleCacheManager aqiScaleCache](self, "aqiScaleCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  os_unfair_lock_unlock(&self->_dataSynchronizationLock);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCacheManager _persistedInfoURL](self, "_persistedInfoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItemAtURL:error:", v5, 0);

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
  -[WFAQIScaleCacheManager aqiScaleCache](self, "aqiScaleCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "initWithDictionary:copyItems:", v5, 1);

  os_unfair_lock_unlock(p_dataSynchronizationLock);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("scalesCache"));
  objc_msgSend(v6, "finishEncoding");
  objc_msgSend(v6, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAQIScaleCacheManager _persistedInfoURL](self, "_persistedInfoURL");
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

  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("serverDrivenAQIScalesCacheFolder"), 0);
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
  -[WFAQIScaleCacheManager _persistedInfoURL](self, "_persistedInfoURL");
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
      objc_msgSend(v6, "decodeTopLevelObjectOfClasses:forKey:error:", v11, CFSTR("scalesCache"), &v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;

      if (!v12)
      {
        WFLogForCategory(5uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[WFAQIScaleCacheManager _persistedInfoFromDisk].cold.2(self, (uint64_t)v13, v14);

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

- (WFAQIScale)defaultScale
{
  return self->_defaultScale;
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (NSMutableDictionary)aqiScaleCache
{
  return self->_aqiScaleCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aqiScaleCache, 0);
  objc_storeStrong((id *)&self->_defaultScale, 0);
}

- (void)init
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_21189A000, v0, OS_LOG_TYPE_DEBUG, "Couldn't find an aqi scale cache ... creating a new one", v1, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)updateCacheWithScale:identifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "Cannot cache a nil scale", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)updateCacheWithScale:identifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "identifier is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
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
  _os_log_error_impl(&dword_21189A000, a3, OS_LOG_TYPE_ERROR, "Failed to read: %{public}@ -- %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_3();
}

@end
