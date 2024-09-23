@implementation WFAirQualityProviderAttributionManager

+ (WFAirQualityProviderAttributionManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  return (WFAirQualityProviderAttributionManager *)(id)sharedManager_attributionManager;
}

void __55__WFAirQualityProviderAttributionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_attributionManager;
  sharedManager_attributionManager = v0;

}

- (WFAirQualityProviderAttributionManager)init
{
  WFAirQualityProviderAttributionManager *v2;
  WFAirQualityProviderAttributionManager *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *attributionCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFAirQualityProviderAttributionManager;
  v2 = -[WFAirQualityProviderAttributionManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataSynchronizationLock._os_unfair_lock_opaque = 0;
    WeatherFoundationInternalUserDefaults();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("providerAttributionPrimitives"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
    else
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    attributionCache = v3->_attributionCache;
    v3->_attributionCache = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)registerProviderAttribution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFAirQualityProviderAttributionManager p_archivedDataForProviderAttribution:](self, "p_archivedDataForProviderAttribution:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      os_unfair_lock_lock_with_options();
      -[WFAirQualityProviderAttributionManager attributionCache](self, "attributionCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

      os_unfair_lock_unlock(&self->_dataSynchronizationLock);
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__WFAirQualityProviderAttributionManager_registerProviderAttribution___block_invoke;
    v9[3] = &unk_24CCA1430;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v10, "loadLogoImageWithCompletion:", v9);

  }
}

uint64_t __70__WFAirQualityProviderAttributionManager_registerProviderAttribution___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateCacheWithProviderAttribution:", *(_QWORD *)(a1 + 40));
}

- (id)cachedAttributionForProvider:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFAirQualityProviderAttributionManager attributionCache](self, "attributionCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      if (v9)
      {
        WFLogForCategory(5uLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[WFAirQualityProviderAttributionManager cachedAttributionForProvider:].cold.1();

      }
    }
    else
    {
      v8 = 0;
    }
    os_unfair_lock_unlock(p_dataSynchronizationLock);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadAttributionForProvider:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  WFAirQualityProviderAttributionManager *v12;
  id v13;

  v6 = a4;
  -[WFAirQualityProviderAttributionManager cachedAttributionForProvider:](self, "cachedAttributionForProvider:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __80__WFAirQualityProviderAttributionManager_loadAttributionForProvider_completion___block_invoke;
    v10[3] = &unk_24CCA1458;
    v11 = v7;
    v12 = self;
    v13 = v6;
    objc_msgSend(v11, "loadLogoImageWithCompletion:", v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.foundation.airQuality.provider.attribution.manager.errorDomain"), 6667, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v9);

  }
}

void __80__WFAirQualityProviderAttributionManager_loadAttributionForProvider_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cachedLogoImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCachedLogoImage:", v7);
    objc_msgSend(*(id *)(a1 + 40), "p_updateCacheWithProviderAttribution:", *(_QWORD *)(a1 + 32));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (WFAirQualityProviderAttribution)defaultProviderAttribution
{
  return +[WFAirQualityProviderAttribution defaultProviderAttribution](WFAirQualityProviderAttribution, "defaultProviderAttribution");
}

- (id)p_archivedDataForProviderAttribution:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (v5)
  {
    WFLogForCategory(5uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WFAirQualityProviderAttributionManager p_archivedDataForProviderAttribution:].cold.1(v3, (uint64_t)v5, v6);

  }
  return v4;
}

- (void)p_updateCacheWithProviderAttribution:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_dataSynchronizationLock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[WFAirQualityProviderAttributionManager p_archivedDataForProviderAttribution:](self, "p_archivedDataForProviderAttribution:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    p_dataSynchronizationLock = &self->_dataSynchronizationLock;
    os_unfair_lock_lock_with_options();
    -[WFAirQualityProviderAttributionManager attributionCache](self, "attributionCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

    -[WFAirQualityProviderAttributionManager attributionCache](self, "attributionCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    os_unfair_lock_unlock(p_dataSynchronizationLock);
    WeatherFoundationInternalUserDefaults();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("providerAttributionPrimitives"));

  }
}

- (os_unfair_lock_s)dataSynchronizationLock
{
  return self->_dataSynchronizationLock;
}

- (void)setDataSynchronizationLock:(os_unfair_lock_s)a3
{
  self->_dataSynchronizationLock = a3;
}

- (NSMutableDictionary)attributionCache
{
  return self->_attributionCache;
}

- (void)setAttributionCache:(id)a3
{
  objc_storeStrong((id *)&self->_attributionCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionCache, 0);
}

- (void)cachedAttributionForProvider:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  v3 = v0;
  OUTLINED_FUNCTION_0_2(&dword_21189A000, v1, (uint64_t)v1, "Error retrieving provider from cache %{public}@: %{public}@", v2);
}

- (void)p_archivedDataForProviderAttribution:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  v8 = a2;
  OUTLINED_FUNCTION_0_2(&dword_21189A000, a3, v6, "Error generating archived data from attribution %{public}@: %{public}@", v7);

}

@end
