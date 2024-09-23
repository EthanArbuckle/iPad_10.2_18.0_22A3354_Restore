@implementation WeatherService

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_5);
  return (id)sharedService_service;
}

void __31__WeatherService_sharedService__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedService_service;
  sharedService_service = v0;

}

- (WeatherService)init
{
  WFWeatherStoreService *v3;
  WeatherService *v4;

  v3 = objc_alloc_init(WFWeatherStoreService);
  v4 = -[WeatherService initWithStore:](self, "initWithStore:", v3);

  return v4;
}

- (WeatherService)initWithStore:(id)a3
{
  id v4;
  WeatherService *v5;
  WeatherService *v6;
  WFQueryDispatcher *v7;
  void *v8;
  void *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *clientQueue;
  WeatherService *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WeatherService;
  v5 = -[WeatherService init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[WeatherService setInternalService:](v5, "setInternalService:", v4);
    v7 = objc_alloc_init(WFQueryDispatcher);
    -[WeatherService setQueryDispatcher:](v6, "setQueryDispatcher:", v7);

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherService setClientDictionary:](v6, "setClientDictionary:", v8);

    v9 = (void *)objc_opt_new();
    -[WeatherService setTemperatureUnitProvider:](v6, "setTemperatureUnitProvider:", v9);

    v10 = dispatch_queue_create("WeatherServiceQueue", MEMORY[0x24BDAC9C0]);
    clientQueue = v6->_clientQueue;
    v6->_clientQueue = (OS_dispatch_queue *)v10;

    v12 = v6;
  }

  return v6;
}

- (void)addClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    -[WeatherService clientDictionary](self, "clientDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__WeatherService_addClient___block_invoke;
    v7[3] = &unk_24CCA1640;
    v7[4] = self;
    v8 = v5;
    v9 = v4;
    v6 = v5;
    objc_msgSend(v9, "taskIdentifier:", v7);

  }
}

void __28__WeatherService_addClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;
  id v10;
  id v11;

  v3 = a2;
  WFLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5)
      __28__WeatherService_addClient___block_invoke_cold_2(v3, v4);

    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__WeatherService_addClient___block_invoke_6;
    block[3] = &unk_24CCA1618;
    v9 = v6;
    v10 = *(id *)(a1 + 48);
    v11 = v3;
    dispatch_barrier_sync(v7, block);

    v4 = v9;
  }
  else if (v5)
  {
    __28__WeatherService_addClient___block_invoke_cold_1(v4);
  }

}

void __28__WeatherService_addClient___block_invoke_6(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 48), "pid"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKey:", v2, v3);

}

- (void)addClient:(id)a3 forPid:(int)a4
{
  void *v6;
  NSObject *clientQueue;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  int v13;

  v9 = a3;
  if (v9)
  {
    -[WeatherService clientDictionary](self, "clientDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__WeatherService_addClient_forPid___block_invoke;
    block[3] = &unk_24CCA1668;
    v13 = a4;
    v11 = v6;
    v12 = v9;
    v8 = v6;
    dispatch_barrier_sync(clientQueue, block);

  }
}

void __35__WeatherService_addClient_forPid___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  WFLogForCategory(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __35__WeatherService_addClient_forPid___block_invoke_cold_1(a1, v2, v3);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, v6);

}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *clientQueue;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  if (a3)
  {
    v4 = a3;
    -[WeatherService clientDictionary](self, "clientDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "allKeysForObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_initWeak(&location, self);
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __31__WeatherService_removeClient___block_invoke;
      block[3] = &unk_24CCA1690;
      v10 = v7;
      objc_copyWeak(&v11, &location);
      dispatch_barrier_async(clientQueue, block);
      objc_destroyWeak(&v11);

      objc_destroyWeak(&location);
    }

  }
}

void __31__WeatherService_removeClient___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = (id *)(a1 + 40);
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        WFLogForCategory(4uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_debug_impl(&dword_21189A000, v9, OS_LOG_TYPE_DEBUG, "WF Client Removed: %@", buf, 0xCu);
        }

        WeakRetained = objc_loadWeakRetained(v6);
        objc_msgSend(WeakRetained, "clientDictionary");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v8);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v4);
  }

}

- (NSArray)clients
{
  void *v3;
  void *v4;
  NSObject *clientQueue;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[WeatherService clientDictionary](self, "clientDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  clientQueue = self->_clientQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __25__WeatherService_clients__block_invoke;
  v9[3] = &unk_24CCA08D0;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(clientQueue, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return (NSArray *)v7;
}

void __25__WeatherService_clients__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)clientForPid:(int)a3
{
  void *v5;
  NSObject *clientQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  -[WeatherService clientDictionary](self, "clientDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__WeatherService_clientForPid___block_invoke;
  block[3] = &unk_24CCA16B8;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(clientQueue, block);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __31__WeatherService_clientForPid___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)performMigrationWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = a3;
    objc_msgSend(v4, "wf_errorWithCode:", 15);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 options:(id)a6 taskIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WFLogForCategory(4uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__WeatherService_forecastForLocation_locale_onDate_options_taskIdentifier___block_invoke;
  v21[3] = &unk_24CCA16E0;
  v21[4] = self;
  v22 = v12;
  v20 = v12;
  objc_msgSend(v18, "forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:", v16, v15, v14, v19, v13, v21);

}

uint64_t __75__WeatherService_forecastForLocation_locale_onDate_options_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  WFLogForCategory(4uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__WeatherService_hourlyForecastForLocation_locale_taskIdentifier___block_invoke;
  v15[3] = &unk_24CCA16E0;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v12, "hourlyForecastForLocation:locale:requestIdentifier:completionHandler:", v10, v9, v13, v15);

}

uint64_t __66__WeatherService_hourlyForecastForLocation_locale_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 taskIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  WFLogForCategory(4uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__WeatherService_dailyForecastForLocation_locale_taskIdentifier___block_invoke;
  v15[3] = &unk_24CCA16E0;
  v15[4] = self;
  v16 = v8;
  v14 = v8;
  objc_msgSend(v12, "dailyForecastForLocation:locale:requestIdentifier:completionHandler:", v10, v9, v13, v15);

}

uint64_t __65__WeatherService_dailyForecastForLocation_locale_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 taskIdentifier:(id)a6
{
  -[WeatherService forecast:forLocation:withUnits:locale:taskIdentifier:](self, "forecast:forLocation:withUnits:locale:taskIdentifier:", a3, a4, 0, a5, a6);
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7
{
  -[WeatherService forecast:forLocation:withUnits:locale:taskIdentifier:requestOptions:](self, "forecast:forLocation:withUnits:locale:taskIdentifier:requestOptions:", a3, a4, *(_QWORD *)&a5, a6, a7, 0);
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 taskIdentifier:(id)a7 requestOptions:(id)a8
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;

  v10 = *(_QWORD *)&a5;
  v14 = a7;
  v15 = a8;
  v16 = a6;
  v17 = a4;
  WFLogForCategory(4uLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __86__WeatherService_forecast_forLocation_withUnits_locale_taskIdentifier_requestOptions___block_invoke;
  v22[3] = &unk_24CCA16E0;
  v22[4] = self;
  v23 = v14;
  v21 = v14;
  objc_msgSend(v19, "forecast:forLocation:withUnits:locale:requestIdentifier:requestOptions:completionHandler:", a3, v17, v10, v16, v20, v15, v22);

}

uint64_t __86__WeatherService_forecast_forLocation_withUnits_locale_taskIdentifier_requestOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)airQualityForLocation:(id)a3 locale:(id)a4 options:(id)a5 taskIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  WFLogForCategory(4uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __70__WeatherService_airQualityForLocation_locale_options_taskIdentifier___block_invoke;
  v18[3] = &unk_24CCA16E0;
  v18[4] = self;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v15, "airQualityForLocation:locale:requestIdentifier:options:completionHandler:", v13, v12, v16, v11, v18);

}

uint64_t __70__WeatherService_airQualityForLocation_locale_options_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)reachabilityConfigurationForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  WFReachabilityConfigurationResponse *v6;
  void *v7;
  WFReachabilityConfigurationResponse *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *clientQueue;
  id v13;
  WFReachabilityConfigurationResponse *v14;
  _QWORD block[5];
  WFReachabilityConfigurationResponse *v16;
  id v17;

  v4 = a3;
  WFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  v6 = [WFReachabilityConfigurationResponse alloc];
  objc_msgSend(v4, "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFResponse initWithIdentifier:](v6, "initWithIdentifier:", v7);

  -[WeatherService internalService](self, "internalService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceConnectivityEvaluationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFReachabilityConfigurationResponse setReachabilityHostURL:](v8, "setReachabilityHostURL:", v11);
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WeatherService_reachabilityConfigurationForIdentifier___block_invoke;
  block[3] = &unk_24CCA1618;
  block[4] = self;
  v16 = v8;
  v17 = v4;
  v13 = v4;
  v14 = v8;
  dispatch_async(clientQueue, block);

}

uint64_t __57__WeatherService_reachabilityConfigurationForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  WFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService queryDispatcher](self, "queryDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancelTaskWithIdentifier:", v4);

  -[WeatherService internalService](self, "internalService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelTaskWithIdentifier:", v4);

}

- (void)invalidateCache:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[WeatherService queryDispatcher](self, "queryDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateCacheWithIdentifier:", v4);

  -[WeatherService internalService](self, "internalService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateCacheWithIdentifier:", v4);

}

- (void)locationForString:(id)a3 taskIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  WFLogForCategory(4uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService queryDispatcher](self, "queryDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__WeatherService_locationForString_taskIdentifier___block_invoke;
  v11[3] = &unk_24CCA1708;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "locationForString:taskIdentifier:results:", v7, v10, v11);

}

uint64_t __51__WeatherService_locationForString_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)locationForCoordinate:(CLLocationCoordinate2D)a3 taskIdentifier:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(double, double);
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  WFLogForCategory(4uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService internalService](self, "internalService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationGeocodeForCoordinateRequestStartingCallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WeatherService internalService](self, "internalService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locationGeocodeForCoordinateRequestStartingCallback");
    v12 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    v12[2](latitude, longitude);

  }
  -[WeatherService queryDispatcher](self, "queryDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__WeatherService_locationForCoordinate_taskIdentifier___block_invoke;
  v15[3] = &unk_24CCA1708;
  v15[4] = self;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v13, "locationForCoordinate:taskIdentifier:results:", v14, v15, latitude, longitude);

}

uint64_t __55__WeatherService_locationForCoordinate_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)locationForSearchCompletion:(id)a3 taskIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  WFLogForCategory(4uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService queryDispatcher](self, "queryDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__WeatherService_locationForSearchCompletion_taskIdentifier___block_invoke;
  v11[3] = &unk_24CCA1708;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "locationForSearchCompletion:taskIdentifier:results:", v7, v10, v11);

}

uint64_t __61__WeatherService_locationForSearchCompletion_taskIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryDispatcherDidReceiveResponse:identifier:", a2, *(_QWORD *)(a1 + 40));
}

- (void)fetchFavoriteLocationsWithTaskIdentifier:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  WFLogForCategory(4uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

}

- (void)temperatureUnitWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WeatherService *v10;

  v4 = a3;
  WFLogForCategory(4uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  -[WeatherService temperatureUnitProvider](self, "temperatureUnitProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__WeatherService_temperatureUnitWithIdentifier___block_invoke;
  v8[3] = &unk_24CCA1730;
  v9 = v4;
  v10 = self;
  v7 = v4;
  objc_msgSend(v6, "fetchTemperatureUnitWithCompletionHandler:", v8);

}

void __48__WeatherService_temperatureUnitWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  WFTemperatureUnitResponse *v4;
  void *v5;
  WFTemperatureUnitResponse *v6;

  v4 = [WFTemperatureUnitResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFResponse initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[WFTemperatureUnitResponse setTemperatureUnit:](v6, "setTemperatureUnit:", a2);
  objc_msgSend(*(id *)(a1 + 40), "queryDispatcherDidReceiveResponse:identifier:", v6, *(_QWORD *)(a1 + 32));

}

- (void)replaceTemperatureUnitWith:(int)a3 identifier:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  WFTemperatureUnitProvider *temperatureUnitProvider;
  id v9;
  _QWORD v10[4];
  id v11;
  WeatherService *v12;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  WFLogForCategory(4uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[WeatherService forecastForLocation:locale:onDate:options:taskIdentifier:].cold.1();

  temperatureUnitProvider = self->_temperatureUnitProvider;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WeatherService_replaceTemperatureUnitWith_identifier___block_invoke;
  v10[3] = &unk_24CCA1730;
  v11 = v6;
  v12 = self;
  v9 = v6;
  -[WFTemperatureUnitProvider replaceUnit:completionHandler:](temperatureUnitProvider, "replaceUnit:completionHandler:", v4, v10);

}

void __56__WeatherService_replaceTemperatureUnitWith_identifier___block_invoke(uint64_t a1, uint64_t a2)
{
  WFTemperatureUnitResponse *v4;
  void *v5;
  WFTemperatureUnitResponse *v6;

  v4 = [WFTemperatureUnitResponse alloc];
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFResponse initWithIdentifier:](v4, "initWithIdentifier:", v5);

  -[WFTemperatureUnitResponse setTemperatureUnit:](v6, "setTemperatureUnit:", a2);
  objc_msgSend(*(id *)(a1 + 40), "queryDispatcherDidReceiveResponse:identifier:", v6, *(_QWORD *)(a1 + 32));

}

- (void)queryDispatcherDidReceiveResponse:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  -[WeatherService clientForPid:](self, "clientForPid:", objc_msgSend(v7, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    WFLogForCategory(4uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WeatherService queryDispatcherDidReceiveResponse:identifier:].cold.3(v7);

  }
  objc_msgSend(v6, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(4uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WeatherService queryDispatcherDidReceiveResponse:identifier:].cold.2();
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[WeatherService queryDispatcherDidReceiveResponse:identifier:].cold.1(v7);
  }

  objc_msgSend(v8, "serviceDidReceiveResponse:", v6);
}

- (WFTemperatureUnitProvider)temperatureUnitProvider
{
  return self->_temperatureUnitProvider;
}

- (void)setTemperatureUnitProvider:(id)a3
{
  objc_storeStrong((id *)&self->_temperatureUnitProvider, a3);
}

- (WFWeatherStoreService)internalService
{
  return (WFWeatherStoreService *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (WFQueryDispatcher)queryDispatcher
{
  return (WFQueryDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueryDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMapTable)clientDictionary
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDictionary, 0);
  objc_storeStrong((id *)&self->_queryDispatcher, 0);
  objc_storeStrong((id *)&self->_internalService, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_temperatureUnitProvider, 0);
}

void __28__WeatherService_addClient___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21189A000, log, OS_LOG_TYPE_DEBUG, "Invalid WF Client attempted connection; rejected.",
    v1,
    2u);
}

void __28__WeatherService_addClient___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_6_1(&dword_21189A000, a2, v3, "WF Client Added: %d", (uint8_t *)v4);
}

void __35__WeatherService_addClient_forPid___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(a1 + 48);
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_6_1(&dword_21189A000, a2, a3, "WF Client Added: %d", (uint8_t *)v4);
}

- (void)forecastForLocation:locale:onDate:options:taskIdentifier:.cold.1()
{
  void *v0;
  id v1;
  const char *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(v1, "UUID");
  objc_claimAutoreleasedReturnValue();
  v2 = (const char *)OUTLINED_FUNCTION_3_3();
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v4, v5, "(%@) Executing %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_3();
}

- (void)queryDispatcherDidReceiveResponse:(void *)a1 identifier:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_21189A000, v2, v3, "(%@) Received response.  Forwarding to Client", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_3_2();
}

- (void)queryDispatcherDidReceiveResponse:identifier:.cold.2()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(v2, "UUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_3_3(), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_21189A000, v0, OS_LOG_TYPE_ERROR, "(%@) Received response.  Response contained an error: %@", v4, 0x16u);

  OUTLINED_FUNCTION_3();
}

- (void)queryDispatcherDidReceiveResponse:(void *)a1 identifier:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_21189A000, v2, v3, "(%@) Unable to dispatch response; Client does not exist!",
    v4,
    v5,
    v6,
    v7,
    2u);

  OUTLINED_FUNCTION_3_2();
}

@end
