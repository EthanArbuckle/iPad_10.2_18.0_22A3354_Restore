@implementation WFWeatherStoreService

- (WFWeatherStoreService)init
{
  return -[WFWeatherStoreService initWithConfiguration:](self, "initWithConfiguration:", 0);
}

- (WFWeatherStoreService)initWithConfiguration:(id)a3
{
  return -[WFWeatherStoreService initWithConfiguration:error:](self, "initWithConfiguration:error:", a3, 0);
}

- (WFWeatherStoreService)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  WFWeatherStoreService *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  WFWeatherStoreService *v15;
  dispatch_queue_t v16;
  dispatch_queue_t v17;
  dispatch_queue_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  objc_super v26;

  v6 = a3;
  if (v6
    || (+[WFWeatherStoreServiceConfiguration defaultConfiguration](WFWeatherStoreServiceConfiguration, "defaultConfiguration"), (v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_msgSend(v6, "isValid") & 1) != 0)
    {
      v26.receiver = self;
      v26.super_class = (Class)WFWeatherStoreService;
      v7 = -[WFWeatherStoreService init](&v26, sel_init);
      self = v7;
      if (v7)
      {
        -[WFWeatherStoreService setConfiguration:](v7, "setConfiguration:", v6);
        -[WFWeatherStoreService configuration](self, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "cacheClass");

        objc_msgSend(v6, "cacheURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        objc_msgSend(v9, "createCacheIfNecessary:error:", v10, &v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v25;
        -[WFWeatherStoreService setCache:](self, "setCache:", v11);

        if (v12)
        {
          WFLogForCategory(2uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[WFWeatherStoreService initWithConfiguration:error:].cold.2();

          if (a4)
            *a4 = objc_retainAutorelease(v12);

LABEL_15:
          v15 = 0;
          goto LABEL_18;
        }
        v16 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.incomingRequestQueue", 0);
        -[WFWeatherStoreService setIncomingRequestQueue:](self, "setIncomingRequestQueue:", v16);

        v17 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.parseQueue", MEMORY[0x24BDAC9C0]);
        -[WFWeatherStoreService setParseQueue:](self, "setParseQueue:", v17);

        v18 = dispatch_queue_create("com.apple.WeatherFoundation.WeatherStoreService.mapQueue", 0);
        -[WFWeatherStoreService setMapQueue:](self, "setMapQueue:", v18);

        v19 = (void *)objc_opt_new();
        -[WFWeatherStoreService setURLToTaskMap:](self, "setURLToTaskMap:", v19);

        v20 = (void *)objc_opt_new();
        -[WFWeatherStoreService setURLToCallbackMap:](self, "setURLToCallbackMap:", v20);

        v21 = (void *)objc_opt_new();
        -[WFWeatherStoreService setUUIDToURLMap:](self, "setUUIDToURLMap:", v21);

        v22 = (void *)objc_opt_new();
        -[WFWeatherStoreService setUUIDToCallbackMap:](self, "setUUIDToCallbackMap:", v22);

        v23 = (void *)objc_opt_new();
        -[WFWeatherStoreService setRetryManager:](self, "setRetryManager:", v23);

        -[WFWeatherStoreService setRetryLock:](self, "setRetryLock:", 0);
      }
      self = self;
      v15 = self;
      goto LABEL_18;
    }
  }
  WFLogForCategory(2uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[WFWeatherStoreService initWithConfiguration:error:].cold.1((uint64_t)self, v14);

  if (!a4)
    goto LABEL_15;
  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 7);
  v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v15;
}

- (void)invalidateCacheWithIdentifier:(id)a3
{
  id v3;

  -[WFWeatherStoreService cache](self, "cache", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WFWeatherStoreService configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)WFWeatherStoreService;
  -[WFWeatherStoreService dealloc](&v4, sel_dealloc);
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("requestIdentifier is mandatory."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7 = v4;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService _cancelWithRequestIdentifier:](self, "_cancelWithRequestIdentifier:", v5);

}

- (void)completeErroneousForecastRequestWithHandler:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  WFForecastResponse *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(id, WFForecastResponse *);

  v13 = (void (**)(id, WFForecastResponse *))a3;
  v7 = a4;
  v8 = a5;
  if (!v13 || !v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v9 = -[WFResponse initWithIdentifier:error:]([WFForecastResponse alloc], "initWithIdentifier:error:", v7, v8);
  -[WFResponse error](v9, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFResponse setError:](v9, "setError:", v11);

  }
  v13[2](v13, v9);

}

- (void)forecastForLocation:(id)a3 locale:(id)a4 onDate:(id)a5 requestIdentifier:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t (**v23)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  char v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v44;
  _QWORD v45[4];
  uint64_t (**v46)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v47;
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  uint64_t v61;
  CLLocationCoordinate2D v62;

  v61 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v44 = a7;
  v17 = a8;
  if (!v16 || (v18 = v17) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke;
  v50[3] = &unk_24CCA1F08;
  v19 = v16;
  v51 = v19;
  v20 = v15;
  v52 = v20;
  v21 = v13;
  v53 = v21;
  v22 = v18;
  v54 = v22;
  v23 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE2990](v50);
  if (v21)
  {
    objc_msgSend(v21, "geoLocation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "coordinate");
    v25 = CLLocationCoordinate2DIsValid(v62);

    if (v25)
      goto LABEL_24;
  }
  WFLogForCategory(2uLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[WFWeatherStoreService forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:].cold.2();

  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = ((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, 0, 0, v27);

  if ((v28 & 1) == 0)
  {
LABEL_24:
    if (v20)
      goto LABEL_12;
    WFLogForCategory(2uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreService forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:].cold.1((uint64_t)v19, v29, v30);

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = ((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, 0, 0, v31);

    if ((v32 & 1) == 0)
    {
LABEL_12:
      v33 = WFForecastTypeForDate(v20);
      if (v33
        || (objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 6),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = ((uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, 0, 0, v34), v34, (v35 & 1) == 0))
      {
        v42 = v14;
        v49 = 0x7FFFFFFFFFFFFFFFLL;
        WFCacheKeyForForecastType(v33, v21, v20);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        WFCacheDetailsForForecastType(v33, &v49, (uint64_t *)&v48);
        v37 = v48;
        WFLogForCategory(2uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v56 = v19;
          v57 = 2114;
          v58 = v37;
          v59 = 2114;
          v60 = v36;
          _os_log_debug_impl(&dword_21189A000, v38, OS_LOG_TYPE_DEBUG, "(%{public}@) Check Cache Domain %{public}@ for Key %{public}@", buf, 0x20u);
        }

        -[WFWeatherStoreService cache](self, "cache");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "cachedObjectWithinDomain:forKey:staleness:", v37, v36, v49);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v40
          || (((uint64_t (**)(_QWORD, void *, uint64_t, uint64_t, _QWORD, _QWORD))v23)[2](v23, v40, v33, 1, 0, 0) & 1) == 0)
        {
          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke_103;
          v45[3] = &unk_24CCA1F30;
          v47 = v33;
          v46 = v23;
          -[WFWeatherStoreService _forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:](self, "_forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:", v33, v21, v42, v20, v19, v45);

        }
        v14 = v42;
      }
    }
  }

}

BOOL __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  WFForecastResponse *v14;
  id v15;
  _BOOL8 v16;

  v11 = a2;
  v12 = a6;
  v13 = a5;
  v14 = -[WFResponse initWithIdentifier:error:]([WFForecastResponse alloc], "initWithIdentifier:error:", *(_QWORD *)(a1 + 32), v12);

  if (!v11)
  {
    v16 = 1;
    goto LABEL_11;
  }
  if ((a3 & 0xC) == 0)
  {
    if ((a3 & 0xC2) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = v11;
        goto LABEL_10;
      }
    }
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  objc_msgSend(*(id *)(a1 + 40), "wf_weatherConditionsClosestToDate:", v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[WFForecastResponse forecast](v14, "forecast");

LABEL_10:
  v16 = v15 != 0;
  objc_msgSend(v15, "setLocation:", *(_QWORD *)(a1 + 48));
  -[WFForecastResponse setForecast:](v14, "setForecast:", v15);

LABEL_11:
  -[WFForecastResponse setForecastType:](v14, "setForecastType:", a3);
  -[WFForecastResponse setRawAPIData:](v14, "setRawAPIData:", v13);

  -[WFForecastResponse setResponseWasFromCache:](v14, "setResponseWasFromCache:", a4);
  if (v16)
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  return v16;
}

void __103__WFWeatherStoreService_forecastForLocation_locale_onDate_requestIdentifier_options_completionHandler___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v10)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if ((v6 & 0xC2) != 0)
    {
      objc_msgSend(v10, "currentConditions");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v7;
      goto LABEL_11;
    }
    if ((v6 & 4) != 0)
    {
      objc_msgSend(v10, "hourlyForecasts");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if ((v6 & 8) != 0)
    {
      objc_msgSend(v10, "dailyForecasts");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = 0;
    v5 = (id)v9;
  }
  else
  {
    v8 = 0;
  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)hourlyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  CLLocationCoordinate2D v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12 || (v14 = v13) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v28);
  }
  v15 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke;
  v31[3] = &unk_24CCA1F58;
  v16 = v12;
  v32 = v16;
  v17 = v10;
  v33 = v17;
  v18 = v14;
  v34 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE2990](v31);
  if (!v17
    || (objc_msgSend(v17, "geoLocation"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "coordinate"),
        v21 = CLLocationCoordinate2DIsValid(v35),
        v20,
        !v21))
  {
    WFLogForCategory(2uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.3();

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v19)[2](v19, 0, 0, v23);

  }
  WFLogForCategory(2uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.2();

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService _cachedHourlyForecastedConditionsForLocation:date:](self, "_cachedHourlyForecastedConditionsForLocation:date:", v17, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v26, "count"))
  {
    WFLogForCategory(2uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreService hourlyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.1();

    ((void (**)(_QWORD, void *, uint64_t, _QWORD))v19)[2](v19, v26, 1, 0);
  }
  else
  {
    v29[0] = v15;
    v29[1] = 3221225472;
    v29[2] = __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_110;
    v29[3] = &unk_24CCA1F80;
    v30 = v19;
    -[WFWeatherStoreService _forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:](self, "_forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:", 4, v17, v11, v25, v16, v29);

  }
}

void __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  WFAggregateForecastResponse *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  v8 = -[WFResponse initWithIdentifier:error:]([WFAggregateForecastResponse alloc], "initWithIdentifier:error:", a1[4], v7);

  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_setLocation_, a1[5]);
  -[WFAggregateForecastResponse setForecasts:](v8, "setForecasts:", v9);
  -[WFAggregateForecastResponse setResponseWasFromCache:](v8, "setResponseWasFromCache:", a3);
  (*(void (**)(void))(a1[6] + 16))();

}

void __94__WFWeatherStoreService_hourlyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "hourlyForecasts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id))(v4 + 16))(v4, v6, 0, v5);

}

- (void)dailyForecastForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[4];
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  CLLocationCoordinate2D v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12 || (v14 = v13) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v15 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke;
  v30[3] = &unk_24CCA1F58;
  v16 = v12;
  v31 = v16;
  v17 = v10;
  v32 = v17;
  v18 = v14;
  v33 = v18;
  v19 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE2990](v30);
  if (v17
    && (objc_msgSend(v17, "geoLocation"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "coordinate"),
        v21 = CLLocationCoordinate2DIsValid(v34),
        v20,
        v21))
  {
    WFLogForCategory(2uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.3();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherStoreService _cachedDailyForecastedConditionsForLocation:date:](self, "_cachedDailyForecastedConditionsForLocation:date:", v17, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v24, "count"))
    {
      WFLogForCategory(2uLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.2();

      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v19)[2](v19, v24, 1, 0);
    }
    else
    {
      v28[0] = v15;
      v28[1] = 3221225472;
      v28[2] = __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_111;
      v28[3] = &unk_24CCA1F80;
      v29 = v19;
      -[WFWeatherStoreService _forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:](self, "_forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:", 8, v17, v11, v23, v16, v28);

    }
  }
  else
  {
    WFLogForCategory(2uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreService dailyForecastForLocation:locale:requestIdentifier:completionHandler:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v19)[2](v19, 0, 0, v23);
  }

}

void __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  WFAggregateForecastResponse *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  v8 = -[WFResponse initWithIdentifier:error:]([WFAggregateForecastResponse alloc], "initWithIdentifier:error:", a1[4], v7);

  objc_msgSend(v9, "makeObjectsPerformSelector:withObject:", sel_setLocation_, a1[5]);
  -[WFAggregateForecastResponse setForecasts:](v8, "setForecasts:", v9);
  -[WFAggregateForecastResponse setResponseWasFromCache:](v8, "setResponseWasFromCache:", a3);
  (*(void (**)(void))(a1[6] + 16))();

}

void __93__WFWeatherStoreService_dailyForecastForLocation_locale_requestIdentifier_completionHandler___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "dailyForecasts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id))(v4 + 16))(v4, v6, 0, v5);

}

- (void)airQualityForLocation:(id)a3 locale:(id)a4 requestIdentifier:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  CLLocationCoordinate2D v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12 || !v13 || !v14 || (v17 = v16) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v18 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke;
  v34[3] = &unk_24CCA1FA8;
  v19 = v14;
  v35 = v19;
  v20 = v12;
  v36 = v20;
  v21 = v17;
  v37 = v21;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE2990](v34);
  objc_msgSend(v20, "geoLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "coordinate");
  v24 = CLLocationCoordinate2DIsValid(v38);

  WFLogForCategory(2uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:].cold.2();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherStoreService _cachedAirQualityConditionsForLocation:date:](self, "_cachedAirQualityConditionsForLocation:date:", v20, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28 && (objc_msgSend(v28, "isExpired") & 1) == 0)
    {
      WFLogForCategory(2uLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:].cold.1();

      ((void (**)(_QWORD, void *, uint64_t, _QWORD))v22)[2](v22, v29, 1, 0);
    }
    else
    {
      v32[0] = v18;
      v32[1] = 3221225472;
      v32[2] = __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke_114;
      v32[3] = &unk_24CCA1F80;
      v33 = v22;
      -[WFWeatherStoreService _forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:](self, "_forecastConditionsForTypes:location:locale:date:requestIdentifier:completionHandler:", 1, v20, v13, v27, v19, v32);

    }
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreService airQualityForLocation:locale:requestIdentifier:options:completionHandler:].cold.3();

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v22)[2](v22, 0, 0, v27);
  }

}

void __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  WFAirQualityResponse *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  v8 = -[WFResponse initWithIdentifier:error:]([WFAirQualityResponse alloc], "initWithIdentifier:error:", a1[4], v7);

  objc_msgSend(v9, "setLocation:", a1[5]);
  -[WFAirQualityResponse setAirQualityConditions:](v8, "setAirQualityConditions:", v9);
  -[WFAirQualityResponse setResponseWasFromCache:](v8, "setResponseWasFromCache:", a3);
  (*(void (**)(void))(a1[6] + 16))();

}

void __98__WFWeatherStoreService_airQualityForLocation_locale_requestIdentifier_options_completionHandler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "airQualityObservations");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD, id))(v4 + 16))(v4, v6, 0, v5);

}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 requestIdentifier:(id)a6 completionHandler:(id)a7
{
  -[WFWeatherStoreService forecast:forLocation:withUnits:locale:requestIdentifier:completionHandler:](self, "forecast:forLocation:withUnits:locale:requestIdentifier:completionHandler:", a3, a4, 0, a5, a6, a7);
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
  -[WFWeatherStoreService forecast:forLocation:withUnits:locale:requestIdentifier:requestOptions:completionHandler:](self, "forecast:forLocation:withUnits:locale:requestIdentifier:requestOptions:completionHandler:", a3, a4, *(_QWORD *)&a5, a6, a7, 0, a8);
}

- (void)forecast:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 requestIdentifier:(id)a7 requestOptions:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  unsigned int v35;
  unint64_t v36;
  id v37;
  id v38;
  _QWORD v39[4];
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  _BYTE *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _BYTE buf[24];
  void *v51;
  uint64_t v52;
  CLLocationCoordinate2D v53;

  v52 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v37 = a6;
  v16 = a7;
  v38 = a8;
  v17 = a9;
  v18 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke;
  v46[3] = &unk_24CCA1FD0;
  v19 = v16;
  v47 = v19;
  v20 = v15;
  v48 = v20;
  v21 = v17;
  v49 = v21;
  v22 = MEMORY[0x212BE2990](v46);
  if (!v19 || !v21)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v34);
  }
  v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v22;
  if (v20
    && (objc_msgSend(v20, "geoLocation"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "coordinate"),
        v25 = CLLocationCoordinate2DIsValid(v53),
        v24,
        v25))
  {
    v35 = a5;
    v36 = a3;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v51) = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_opt_new();
    v41[0] = v18;
    v41[1] = 3221225472;
    v41[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_118;
    v41[3] = &unk_24CCA1FF8;
    v41[4] = self;
    v28 = v20;
    v42 = v28;
    v29 = v26;
    v43 = v29;
    v30 = v27;
    v44 = v30;
    v45 = buf;
    -[WFWeatherStoreService _enumerateForecastTypesIn:usingBlock:](self, "_enumerateForecastTypesIn:usingBlock:", v36, v41);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      ((void (**)(_QWORD, id, uint64_t, _QWORD))v23)[2](v23, v30, 1, 0);
    }
    else
    {
      v39[0] = v18;
      v39[1] = 3221225472;
      v39[2] = __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_2;
      v39[3] = &unk_24CCA1F80;
      v40 = v23;
      -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:](self, "_forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:", v36, v28, v35, v37, v29, v19, v38, v39);

    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    WFLogForCategory(2uLL);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v20, "geoLocation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2113;
      v51 = v33;
      _os_log_error_impl(&dword_21189A000, v31, OS_LOG_TYPE_ERROR, "(%{public}@) Invalid location given for %lu Forecast request: %{private}@", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v23)[2](v23, 0, 0, v32);

  }
}

void __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  WFAggregateCommonResponse *v18;

  v7 = a4;
  v8 = a2;
  v18 = -[WFResponse initWithIdentifier:error:]([WFAggregateCommonResponse alloc], "initWithIdentifier:error:", a1[4], v7);

  objc_msgSend(v8, "airQualityObservations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocation:", a1[5]);
  -[WFAggregateCommonResponse setAirQualityObservations:](v18, "setAirQualityObservations:", v9);

  objc_msgSend(v8, "currentConditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocation:", a1[5]);
  -[WFAggregateCommonResponse setCurrentObservations:](v18, "setCurrentObservations:", v10);

  objc_msgSend(v8, "lastTwentyFourHoursOfObservations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeObjectsPerformSelector:withObject:", sel_setLocation_, a1[5]);
  -[WFAggregateCommonResponse setLastTwentyFourHoursOfObservations:](v18, "setLastTwentyFourHoursOfObservations:", v11);

  objc_msgSend(v8, "hourlyForecasts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeObjectsPerformSelector:withObject:", sel_setLocation_, a1[5]);
  -[WFAggregateCommonResponse setHourlyForecastedConditions:](v18, "setHourlyForecastedConditions:", v12);

  objc_msgSend(v8, "dailyForecasts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "makeObjectsPerformSelector:withObject:", sel_setLocation_, a1[5]);
  -[WFAggregateCommonResponse setDailyForecastedConditions:](v18, "setDailyForecastedConditions:", v13);

  objc_msgSend(v8, "pollenForecasts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonResponse setDailyPollenForecastedConditions:](v18, "setDailyPollenForecastedConditions:", v14);

  objc_msgSend(v8, "changeForecasts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonResponse setChangeForecasts:](v18, "setChangeForecasts:", v15);

  objc_msgSend(v8, "severeWeatherEvents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAggregateCommonResponse setSevereWeatherEvents:](v18, "setSevereWeatherEvents:", v16);

  objc_msgSend(v8, "nextHourPrecipitation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAggregateCommonResponse setNextHourPrecipitation:](v18, "setNextHourPrecipitation:", v17);
  -[WFAggregateCommonResponse setResponseWasFromCache:](v18, "setResponseWasFromCache:", a3);
  (*(void (**)(void))(a1[6] + 16))();

}

void __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_118(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2 <= 31)
  {
    switch(a2)
    {
      case 1:
        objc_msgSend(*(id *)(a1 + 32), "_cachedAirQualityConditionsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v3;
        if (!v3)
          goto LABEL_26;
        v8 = v3;
        v5 = objc_msgSend(v3, "isExpired");
        v4 = v8;
        if ((v5 & 1) != 0)
          goto LABEL_26;
        objc_msgSend(*(id *)(a1 + 56), "setAirQualityObservations:", v8);
        goto LABEL_25;
      case 2:
        objc_msgSend(*(id *)(a1 + 32), "_cachedCurrentObservationsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_26;
        v8 = v4;
        objc_msgSend(*(id *)(a1 + 56), "setCurrentConditions:", v4);
        goto LABEL_25;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_36;
      case 4:
        objc_msgSend(*(id *)(a1 + 32), "_cachedHourlyForecastedConditionsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_26;
        v8 = v4;
        objc_msgSend(*(id *)(a1 + 56), "setHourlyForecasts:", v4);
        goto LABEL_25;
      case 8:
        objc_msgSend(*(id *)(a1 + 32), "_cachedDailyForecastedConditionsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_26;
        v8 = v4;
        objc_msgSend(*(id *)(a1 + 56), "setDailyForecasts:", v4);
        goto LABEL_25;
      default:
        if (a2 != 16)
          goto LABEL_36;
        objc_msgSend(*(id *)(a1 + 32), "_cachedDailyPollenForecastedConditionsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
          goto LABEL_26;
        v8 = v4;
        objc_msgSend(*(id *)(a1 + 56), "setPollenForecasts:", v4);
        break;
    }
    goto LABEL_25;
  }
  if (a2 > 1023)
  {
    if (a2 == 1024)
    {
      objc_msgSend(*(id *)(a1 + 32), "_cachedSevereWeatherEventsForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(a1 + 56), "setSevereWeatherEvents:", v6);
      else
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

    }
    else if (a2 != 2048)
    {
      goto LABEL_36;
    }
    objc_msgSend(*(id *)(a1 + 32), "_cachedNextHourPrecipitationForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 56), "setNextHourPrecipitation:", v7);
    else
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

    goto LABEL_36;
  }
  if (a2 == 32)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cachedHistoricalObservationsForLast24hForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v4;
      objc_msgSend(*(id *)(a1 + 56), "setLastTwentyFourHoursOfObservations:", v4);
      goto LABEL_25;
    }
LABEL_26:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_27;
  }
  if (a2 == 512)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cachedChangeForecastForLocation:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v8 = v4;
      objc_msgSend(*(id *)(a1 + 56), "setChangeForecasts:", v4);
LABEL_25:
      v4 = v8;
LABEL_27:

      return;
    }
    goto LABEL_26;
  }
LABEL_36:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
}

uint64_t __114__WFWeatherStoreService_forecast_forLocation_withUnits_locale_requestIdentifier_requestOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_cachedAirQualityConditionsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 1, a3, a4);
}

- (id)_cachedCurrentObservationsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 2, a3, a4);
}

- (id)_cachedHourlyForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 4, a3, a4);
}

- (id)_cachedDailyForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 8, a3, a4);
}

- (id)_cachedDailyPollenForecastedConditionsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 16, a3, a4);
}

- (id)_cachedHistoricalObservationsForLast24hForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 32, a3, a4);
}

- (id)_cachedChangeForecastForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 512, a3, a4);
}

- (id)_cachedSevereWeatherEventsForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 1024, a3, a4);
}

- (id)_cachedNextHourPrecipitationForLocation:(id)a3 date:(id)a4
{
  return -[WFWeatherStoreService _cachedData:forLocation:date:](self, "_cachedData:forLocation:date:", 2048, a3, a4);
}

- (id)_cachedData:(unint64_t)a3 forLocation:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = a5;
  v9 = a4;
  WFCacheDetailsForForecastType(a3, &v16, (uint64_t *)&v15);
  v10 = v15;
  -[WFWeatherStoreService cache](self, "cache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFCacheKeyForForecastType(a3, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "cachedObjectWithinDomain:forKey:staleness:", v10, v12, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_isConnectivityAvailableForWeatherHost:(id *)a3
{
  void *v4;
  char v5;

  -[WFWeatherStoreService configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServiceAvailable");

  if (a3 && (v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
  -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:](self, "_forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:", a3, a4, 2, a5, a6, a7, 0, a8);
}

- (void)_forecastConditionsForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 locale:(id)a6 date:(id)a7 requestIdentifier:(id)a8 requestOptions:(id)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  unint64_t v49;
  id v50;
  _QWORD v51[5];
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  if (!a3 || !v15 || !v17 || !v18 || (v21 = v20) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("completionHandler / requestIdentifier are mandatory."), 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  -[WFWeatherStoreService configuration](self, "configuration");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "settingsManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService apiVersionForSettings:](self, "apiVersionForSettings:", v22);
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = (void *)v23;
  if (objc_msgSend(CFSTR("twc_v2"), "isEqualToString:", v23) && a3 != 1 && (a3 & 1) != 0)
  {
    -[WFWeatherStoreService _forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:](self, "_forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:", a3, v15, v16, v17, v18, v21);
    v25 = 0;
  }
  else
  {
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke;
    v51[3] = &unk_24CCA2020;
    v51[4] = self;
    v36 = v21;
    v52 = v36;
    v37 = (void *)MEMORY[0x212BE2990](v51);
    v50 = 0;
    objc_msgSend(v39, "forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:", a3, v15, a5, v17, v23, &v50, v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v50;
    if (v26)
    {
      v34 = v27;
      v35 = v19;
      WFLogForCategory(2uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        v54 = v18;
        v55 = 2112;
        v56 = v26;
        v57 = 2112;
        v58 = v15;
        _os_log_debug_impl(&dword_21189A000, v28, OS_LOG_TYPE_DEBUG, "(%{public}@) Built forecast request '%@' for location %@", buf, 0x20u);
      }

      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121;
      v40[3] = &unk_24CCA2070;
      v40[4] = self;
      v47 = v37;
      v49 = a3;
      v41 = v15;
      v42 = v17;
      v43 = v18;
      v44 = v39;
      v45 = v24;
      v33 = v26;
      v46 = v26;
      v48 = v36;
      v29 = v37;
      -[WFWeatherStoreService _submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:](self, "_submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:", v46, v43, v41, a3, v44, a5, v16, v42, v45, v40);

      v30 = v33;
      v25 = v34;
      v19 = v35;
    }
    else
    {
      v25 = v27;
      if (!v27)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      WFLogForCategory(2uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      v29 = v37;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:].cold.1((uint64_t)v18);

      (*((void (**)(id, _QWORD, void *))v36 + 2))(v36, 0, v25);
      v30 = 0;
    }

  }
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  void *v13;
  id v14;
  id v15;

  v13 = *(void **)(a1 + 32);
  v14 = a7;
  v15 = a2;
  objc_msgSend(v13, "_cacheParsedForecastData:types:location:date:requestIdentifier:", v15, a3, a4, a5, a6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  NSObject *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "airQualityObservations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "airQualityScale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(v5, "airQualityObservations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "temporarilyUnavailable");

      if (v22)
      {
        WFLogForCategory(2uLL);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_1(a1);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 80), "URL");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "query");
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "countryAbbreviation");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        WFLogForCategory(2uLL);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v40 = *(_QWORD *)(a1 + 56);
          objc_msgSend(v6, "description");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v54 = v40;
          v55 = 2114;
          v56 = v23;
          v57 = 2114;
          v58 = v37;
          v59 = 2114;
          v60 = v41;
          _os_log_error_impl(&dword_21189A000, v38, OS_LOG_TYPE_ERROR, "(%{public}@) WDS did not send an airQualityScale in its response. urlQuery=%{public}@, countryCode=%{public}@, error=%{public}@", buf, 0x2Au);

        }
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      goto LABEL_27;
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "languageForLocale:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFAQIScaleCacheManager sharedManager](WFAQIScaleCacheManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cachedScaleFromIdentifier:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        WFLogForCategory(7uLL);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_4((uint64_t)v12);

        objc_msgSend(v5, "airQualityObservations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setScale:", v14);

        v17 = *(void **)(a1 + 32);
        objc_msgSend(v5, "airQualityObservations");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_currentScaleCategoryForScale:index:", v14, objc_msgSend(v18, "currentCategoryIndex"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "airQualityObservations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setCurrentScaleCategory:", v19);

        (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      WFLogForCategory(2uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_5();

    }
    WFLogForCategory(2uLL);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_3();

    v26 = *(void **)(a1 + 64);
    v52 = v6;
    objc_msgSend(v26, "aqiScaleRequestForScaleNamed:language:error:", v8, v11, &v52);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v52;

    if (v14)
    {
      v42 = v27;
      v28 = *(void **)(a1 + 32);
      v30 = *(_QWORD *)(a1 + 56);
      v29 = *(_QWORD *)(a1 + 64);
      v31 = *(_QWORD *)(a1 + 72);
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_127;
      v43[3] = &unk_24CCA2048;
      v44 = v12;
      v32 = v5;
      v33 = *(_QWORD *)(a1 + 32);
      v45 = v32;
      v46 = v33;
      v47 = *(id *)(a1 + 56);
      v34 = *(id *)(a1 + 88);
      v35 = *(_QWORD *)(a1 + 104);
      v50 = v34;
      v51 = v35;
      v48 = *(id *)(a1 + 40);
      v49 = *(id *)(a1 + 48);
      objc_msgSend(v28, "_submitRequest:withIdentifier:forScaleNamed:language:configuration:apiVersion:completionHandler:", v14, v30, v8, v11, v29, v31, v43);

      v6 = v42;
    }
    else
    {
      WFLogForCategory(2uLL);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_2(a1);

      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      v6 = v27;
    }
    goto LABEL_26;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
LABEL_28:

}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_127(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    +[WFAQIScaleCacheManager sharedManager](WFAQIScaleCacheManager, "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateCacheWithScale:identifier:", v5, *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "airQualityObservations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScale:", v5);

    v9 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "airQualityObservations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_currentScaleCategoryForScale:index:", v5, objc_msgSend(v10, "currentCategoryIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "airQualityObservations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentScaleCategory:", v11);

  }
  else
  {
    WFLogForCategory(2uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_127_cold_1(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

- (id)languageForLocale:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_forecastConditionsForTWCAQIAndTypes:(unint64_t)a3 location:(id)a4 locale:(id)a5 date:(id)a6 requestIdentifier:(id)a7 completionHandler:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  NSObject *group;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  unint64_t v46;
  _QWORD v47[4];
  NSObject *v48;
  NSObject *v49;
  _QWORD *v50;
  uint64_t *v51;
  id v52;
  _QWORD v53[4];
  NSObject *v54;
  _QWORD *v55;
  _QWORD *v56;
  id v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v37 = a4;
  v34 = a5;
  v14 = a6;
  v36 = a7;
  v33 = a8;
  -[WFWeatherStoreService configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "settingsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService apiVersionForSettings:](self, "apiVersionForSettings:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  group = dispatch_group_create();
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__2;
  v68[4] = __Block_byref_object_dispose__2;
  v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__2;
  v66[4] = __Block_byref_object_dispose__2;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__2;
  v64[4] = __Block_byref_object_dispose__2;
  v65 = 0;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__2;
  v62 = __Block_byref_object_dispose__2;
  v63 = 0;
  v57 = 0;
  objc_msgSend(v15, "forecastRequestForTypes:location:date:apiVersion:error:", a3 & 0xFFFFFFFFFFFFFFFELL, v37, v14, v17, &v57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v57;
  v20 = (uint64_t)v19;
  if (v18)
  {
    dispatch_group_enter(group);
    WFLogForCategory(2uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v20;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      v71 = v36;
      v72 = 2112;
      v73 = v18;
      v74 = 2112;
      v75 = v37;
      _os_log_debug_impl(&dword_21189A000, v21, OS_LOG_TYPE_DEBUG, "(%{public}@) Built forecast request '%@' for location %@", buf, 0x20u);
    }

    v22 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke;
    v53[3] = &unk_24CCA2098;
    v55 = v68;
    v56 = v64;
    v23 = group;
    v54 = v23;
    -[WFWeatherStoreService _submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:](self, "_submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:", v18, v36, v37, a3, v15, 0, v34, v14, v17, v53);

    v52 = 0;
    objc_msgSend(v15, "forecastRequestForTypes:location:date:apiVersion:error:", 1, v37, v14, v17, &v52);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v52;
    v31 = v52;
    if (v24)
    {
      dispatch_group_enter(v23);
      v47[0] = v22;
      v47[1] = 3221225472;
      v47[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_134;
      v47[3] = &unk_24CCA20C0;
      v50 = v66;
      v48 = v37;
      v51 = &v58;
      v49 = v23;
      -[WFWeatherStoreService _submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:](self, "_submitRequest:withIdentifier:forLocation:forecastTypes:configuration:units:locale:date:apiVersion:completionHandler:", v24, v36, v48, 1, v15, 0, v34, v14, v17, v47);

      v26 = v48;
    }
    else
    {
      objc_storeStrong(v59 + 5, v25);
      if (!v59[5])
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v59[5];
        v59[5] = (id)v28;

      }
      WFLogForCategory(2uLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[WFWeatherStoreService _forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:].cold.2();
    }

    -[WFWeatherStoreService parseQueue](self, "parseQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    block[0] = v22;
    block[1] = 3221225472;
    block[2] = __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_135;
    block[3] = &unk_24CCA20E8;
    v43 = v68;
    v44 = v66;
    block[4] = self;
    v46 = a3;
    v39 = v37;
    v40 = v14;
    v41 = v36;
    v42 = v33;
    v45 = v64;
    dispatch_group_notify(v23, v30, block);

  }
  else
  {
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 5);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    WFLogForCategory(2uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v20;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreService _forecastConditionsForTypes:location:units:locale:date:requestIdentifier:requestOptions:completionHandler:].cold.1((uint64_t)v36);

    (*((void (**)(id, _QWORD, uint64_t))v33 + 2))(v33, 0, v20);
  }

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(v68, 8);

}

void __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_134(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "airQualityObservations");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setLocation:", *(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __119__WFWeatherStoreService__forecastConditionsForTWCAQIAndTypes_location_locale_date_requestIdentifier_completionHandler___block_invoke_135(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "setAirQualityObservations:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "_cacheParsedForecastData:types:location:date:requestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (id)_currentScaleCategoryForScale:(id)a3 index:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  if (a4
    && (objc_msgSend(v5, "categories"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 >= a4))
  {
    objc_msgSend(v6, "categories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLogForCategory(2uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreService _currentScaleCategoryForScale:index:].cold.1(v9);

    v10 = 0;
  }

  return v10;
}

- (void)_cacheObject:(id)a3 type:(unint64_t)a4 date:(id)a5 forLocation:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v10 = a3;
  WFCacheKeyForForecastType(a4, a6, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  WFCacheDetailsForForecastType(a4, 0, (uint64_t *)&v14);
  v12 = v14;
  -[WFWeatherStoreService cache](self, "cache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cache:withinDomain:forKey:", v10, v12, v11);

}

- (BOOL)_cacheParsedForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 date:(id)a6 requestIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  BOOL v18;
  BOOL v19;
  NSObject *v20;
  _QWORD v22[4];
  NSObject *v23;
  WFWeatherStoreService *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v12)
    v16 = v13 == 0;
  else
    v16 = 1;
  v18 = v16 || v14 == 0 || a4 == 0;
  v19 = !v18;
  if (v18)
  {
    WFLogForCategory(2uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v15;
      v29 = 2048;
      v30 = a4;
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_21189A000, v20, OS_LOG_TYPE_ERROR, "(%@) Failed to cache result.  Forecast Type: %lu / Date: %@", buf, 0x20u);
    }
  }
  else
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __88__WFWeatherStoreService__cacheParsedForecastData_types_location_date_requestIdentifier___block_invoke;
    v22[3] = &unk_24CCA2110;
    v23 = v12;
    v24 = self;
    v25 = v14;
    v26 = v13;
    -[WFWeatherStoreService _enumerateForecastTypesIn:usingBlock:](self, "_enumerateForecastTypesIn:usingBlock:", a4, v22);

    v20 = v23;
  }

  return v19;
}

void __88__WFWeatherStoreService__cacheParsedForecastData_types_location_date_requestIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForForecastType:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "_cacheObject:type:date:forLocation:", v4, a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v4 = v5;
  }

}

- (void)_enumerateForecastTypesIn:(unint64_t)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  v5 = a4;
  WFForecastTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__WFWeatherStoreService__enumerateForecastTypesIn_usingBlock___block_invoke;
  v8[3] = &unk_24CCA2138;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);

}

uint64_t __62__WFWeatherStoreService__enumerateForecastTypesIn_usingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if ((a2 & ~*(_QWORD *)(result + 40)) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forLocation:(id)a5 forecastTypes:(unint64_t)a6 configuration:(id)a7 units:(int)a8 locale:(id)a9 date:(id)a10 apiVersion:(id)a11 completionHandler:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  NSObject *queue;
  id v36;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  unint64_t v50;
  int v51;

  v16 = a3;
  v33 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  objc_msgSend(v16, "URL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService incomingRequestQueue](self, "incomingRequestQueue");
  queue = objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService parseQueue](self, "parseQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke;
  block[3] = &unk_24CCA21B0;
  block[4] = self;
  v40 = v33;
  v41 = v23;
  v42 = v18;
  v43 = v16;
  v44 = v21;
  v45 = v24;
  v49 = v22;
  v50 = a6;
  v46 = v17;
  v47 = v19;
  v51 = a8;
  v48 = v20;
  v38 = v20;
  v36 = v19;
  v25 = v17;
  v26 = v24;
  v27 = v21;
  v28 = v16;
  v29 = v18;
  v30 = v23;
  v31 = v33;
  v32 = v22;
  dispatch_async(queue, block);

}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke(uint64_t a1)
{
  WFWeatherStoreCallbackWrapper *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD block[4];
  id v49;
  WFWeatherStoreCallbackWrapper *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v2 = -[WFWeatherStoreCallbackWrapper initWithForecastRetrievalBlock:]([WFWeatherStoreCallbackWrapper alloc], "initWithForecastRetrievalBlock:", *(_QWORD *)(a1 + 112));
  v3 = *(void **)(a1 + 32);
  v52 = 0;
  v4 = objc_msgSend(v3, "_isConnectivityAvailableForWeatherHost:", &v52);
  v5 = v52;
  if ((v4 & 1) != 0)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__2;
    v46 = __Block_byref_object_dispose__2;
    objc_msgSend(*(id *)(a1 + 32), "_taskForURL:", *(_QWORD *)(a1 + 48));
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (v43[5])
    {
      WFLogForCategory(2uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 120);
        objc_msgSend((id)v43[5], "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v7;
        v55 = 2048;
        v56 = v8;
        v57 = 2114;
        v58 = v9;
        _os_log_impl(&dword_21189A000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %lu request will multiplex to %{public}@.", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_addCallback:requestIdentifier:forURL:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_139;
      v29[3] = &unk_24CCA2188;
      v29[4] = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 64);
      v30 = *(id *)(a1 + 72);
      v31 = *(id *)(a1 + 40);
      v32 = *(id *)(a1 + 48);
      v39 = &v42;
      v14 = v11;
      v33 = v14;
      v34 = *(id *)(a1 + 80);
      v15 = *(id *)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 120);
      v35 = v15;
      v40 = v16;
      v36 = *(id *)(a1 + 88);
      v41 = *(_DWORD *)(a1 + 128);
      v37 = *(id *)(a1 + 96);
      v38 = *(id *)(a1 + 104);
      objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v13, v29);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v43[5];
      v43[5] = v17;

      objc_msgSend(*(id *)(a1 + 32), "_setTask:requestIdentifier:callback:forURL:", v43[5], *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
      WFLogForCategory(2uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v26 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 120);
        objc_msgSend((id)v43[5], "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v26;
        v55 = 2048;
        v56 = v27;
        v57 = 2114;
        v58 = v28;
        _os_log_debug_impl(&dword_21189A000, v19, OS_LOG_TYPE_DEBUG, "(%{public}@) %lu request is starting for %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "forecastRequestStartingCallback");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(*(id *)(a1 + 32), "forecastRequestStartingCallback");
        v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v21[2](v21, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88));

      }
      objc_msgSend((id)v43[5], "resume");
      WFLogForCategory(2uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(_QWORD *)(a1 + 120);
        objc_msgSend((id)v43[5], "description");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v23;
        v55 = 2048;
        v56 = v24;
        v57 = 2114;
        v58 = v25;
        _os_log_impl(&dword_21189A000, v22, OS_LOG_TYPE_DEFAULT, "(%{public}@) %lu request has resumed for %{public}@.", buf, 0x20u);

      }
    }
    _Block_object_dispose(&v42, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2;
    block[3] = &unk_24CCA1618;
    v49 = *(id *)(a1 + 40);
    v50 = v2;
    v51 = v5;
    dispatch_async(v10, block);

  }
}

uint64_t __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  WFLogForCategory(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "executeCallbackwithResponse:error:", 0, *(_QWORD *)(a1 + 48));
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_139(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;

  v7 = a2;
  v8 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "_handleDataTaskCompletionWithData:httpResponse:apiVersion:identifier:requestURL:dataTask:dataTaskError:startDate:", v7, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40), v8, *(_QWORD *)(a1 + 64)) & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_140;
    block[3] = &unk_24CCA2160;
    v9 = *(NSObject **)(a1 + 72);
    v10 = *(id *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 120);
    v16 = v10;
    v25 = v11;
    v17 = v7;
    v18 = *(id *)(a1 + 88);
    v26 = *(_DWORD *)(a1 + 128);
    v19 = *(id *)(a1 + 96);
    v20 = *(id *)(a1 + 104);
    v21 = *(id *)(a1 + 40);
    v22 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 32);
    v23 = v12;
    v24 = v13;
    dispatch_async(v9, block);

  }
  else
  {
    WFLogForCategory(8uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_139_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_executeCallbacksForURL:responseData:error:", *(_QWORD *)(a1 + 56), 0, v8);
  }

}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_140(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  WFWeatherStoreResponseDataWrapper *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 104);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned int *)(a1 + 112);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v17 = 0;
  objc_msgSend(v3, "parseForecast:data:location:units:locale:date:apiVersion:error:", v2, v4, v5, v6, v7, v8, v9, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v11)
  {
    WFLogForCategory(2uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 80);
      v15 = *(_QWORD *)(a1 + 88);
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", *(_QWORD *)(a1 + 40), 4);
      *(_DWORD *)buf = 138544130;
      v19 = v14;
      v20 = 2114;
      v21 = v11;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_21189A000, v12, OS_LOG_TYPE_ERROR, "(%{public}@) Observed error while parsing forecast data: %{public}@\n%@\n%@", buf, 0x2Au);

    }
  }
  v13 = -[WFWeatherStoreResponseDataWrapper initWithForecastData:]([WFWeatherStoreResponseDataWrapper alloc], "initWithForecastData:", v10);
  objc_msgSend(*(id *)(a1 + 96), "_executeCallbacksForURL:responseData:error:", *(_QWORD *)(a1 + 88), v13, v11);

}

- (BOOL)_handleDataTaskCompletionWithData:(id)a3 httpResponse:(id)a4 apiVersion:(id)a5 identifier:(id)a6 requestURL:(id)a7 dataTask:(id)a8 dataTaskError:(id)a9 startDate:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  WFWeatherStoreService *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  WFNetworkEvent *v47;
  void *v48;
  void *v50;
  id v51;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v53 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v16 && objc_msgSend(v17, "statusCode") == 200)
  {
    WFLogForCategory(2uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v16, "length");
      objc_msgSend(v20, "description");
      v51 = v22;
      v25 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v53;
      v58 = 2048;
      v59 = v24;
      v60 = 2114;
      v61 = v26;
      _os_log_impl(&dword_21189A000, v23, OS_LOG_TYPE_INFO, "(%{public}@) Received data (%lu bytes) from %{public}@.", buf, 0x20u);

      v20 = v25;
      v22 = v51;
    }

    -[WFWeatherStoreService requestSuccessForAPIVersion:](self, "requestSuccessForAPIVersion:", v18);
    v27 = 1;
    goto LABEL_22;
  }
  -[WFWeatherStoreService requestFailureForAPIVersion:error:](self, "requestFailureForAPIVersion:error:", v18, v21);
  objc_msgSend(v21, "domain");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v20;
  if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x24BDD1308]))
  {
    v29 = objc_msgSend(v21, "code");

    if (v29 == -999)
    {
      v30 = (void *)MEMORY[0x24BDD1540];
      v31 = &unk_24CCC1370;
      v32 = 13;
      v33 = v21;
      goto LABEL_14;
    }
  }
  else
  {

  }
  if (objc_msgSend(v17, "statusCode") == 200)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 9);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v30 = (void *)MEMORY[0x24BDD1540];
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 17, 0);
      v34 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v32 = 5;
    v33 = v21;
    v31 = 0;
LABEL_14:
    objc_msgSend(v30, "wf_errorWithCode:encapsulatedError:userInfo:", v32, v33, v31);
    v34 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v44 = (void *)v34;
    goto LABEL_19;
  }
  v35 = (void *)MEMORY[0x24BDD1540];
  v54 = CFSTR("statusCode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "statusCode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v36;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v37 = v18;
  v38 = self;
  v39 = v17;
  v40 = v16;
  v41 = v22;
  v42 = v19;
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "wf_errorWithCode:userInfo:", 8, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v42;
  v22 = v41;
  v16 = v40;
  v17 = v39;
  self = v38;
  v18 = v37;

LABEL_19:
  v45 = v19;
  -[WFWeatherStoreService _executeCallbacksForURL:responseData:error:](self, "_executeCallbacksForURL:responseData:error:", v19, 0, v44);
  WFLogForCategory(2uLL);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v52, "description");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v53;
    v58 = 2114;
    v59 = (uint64_t)v50;
    v60 = 2112;
    v61 = v44;
    _os_log_error_impl(&dword_21189A000, v46, OS_LOG_TYPE_ERROR, "(%{public}@) Error received from %{public}@: %@", buf, 0x20u);

  }
  v47 = -[WFNetworkEvent initWithEventType:startDate:error:]([WFNetworkEvent alloc], "initWithEventType:startDate:error:", WFNetworkEventTypeFromAPIVersion(v18), v22, v21);
  +[WFNetworkBehaviorMonitor sharedInstance](WFNetworkBehaviorMonitor, "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "logNetworkEvent:", v47);

  v27 = 0;
  v19 = v45;
  v20 = v52;
LABEL_22:

  return v27;
}

- (void)_submitRequest:(id)a3 withIdentifier:(id)a4 forScaleNamed:(id)a5 language:(id)a6 configuration:(id)a7 apiVersion:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(v14, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService incomingRequestQueue](self, "incomingRequestQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  -[WFWeatherStoreService parseQueue](self, "parseQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke;
  block[3] = &unk_24CCA2200;
  v38 = v16;
  v39 = v19;
  block[4] = self;
  v32 = v15;
  v33 = v20;
  v34 = v17;
  v35 = v14;
  v36 = v18;
  v37 = v22;
  v30 = v16;
  v23 = v22;
  v24 = v18;
  v25 = v14;
  v26 = v17;
  v27 = v20;
  v28 = v15;
  v29 = v19;
  dispatch_async(v21, block);

}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke(uint64_t a1)
{
  WFWeatherStoreCallbackWrapper *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD block[4];
  id v41;
  WFWeatherStoreCallbackWrapper *v42;
  id v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v2 = -[WFWeatherStoreCallbackWrapper initWithAQIScaleRetrievalBlock:]([WFWeatherStoreCallbackWrapper alloc], "initWithAQIScaleRetrievalBlock:", *(_QWORD *)(a1 + 96));
  v3 = *(void **)(a1 + 32);
  v44 = 0;
  v4 = objc_msgSend(v3, "_isConnectivityAvailableForWeatherHost:", &v44);
  v5 = v44;
  if ((v4 & 1) != 0)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__2;
    v38 = __Block_byref_object_dispose__2;
    objc_msgSend(*(id *)(a1 + 32), "_taskForURL:", *(_QWORD *)(a1 + 48));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (v35[5])
    {
      WFLogForCategory(2uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 88);
        objc_msgSend((id)v35[5], "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v7;
        v47 = 2114;
        v48 = v8;
        v49 = 2114;
        v50 = v9;
        _os_log_impl(&dword_21189A000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) (%{public}@) scale request will multiplex to %{public}@.", buf, 0x20u);

      }
      objc_msgSend(*(id *)(a1 + 32), "_addCallback:requestIdentifier:forURL:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "session");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_154;
      v25[3] = &unk_24CCA21D8;
      v25[4] = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 64);
      v26 = *(id *)(a1 + 72);
      v27 = *(id *)(a1 + 40);
      v28 = *(id *)(a1 + 48);
      v33 = &v34;
      v14 = v11;
      v29 = v14;
      v30 = *(id *)(a1 + 80);
      v31 = *(id *)(a1 + 56);
      v32 = *(id *)(a1 + 88);
      objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v13, v25);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v35[5];
      v35[5] = v15;

      objc_msgSend(*(id *)(a1 + 32), "_setTask:requestIdentifier:callback:forURL:", v35[5], *(_QWORD *)(a1 + 40), v2, *(_QWORD *)(a1 + 48));
      WFLogForCategory(2uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v22 = *(_QWORD *)(a1 + 40);
        v23 = *(_QWORD *)(a1 + 88);
        objc_msgSend((id)v35[5], "description");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v22;
        v47 = 2114;
        v48 = v23;
        v49 = 2114;
        v50 = v24;
        _os_log_debug_impl(&dword_21189A000, v17, OS_LOG_TYPE_DEBUG, "(%{public}@) (%{public}@) scale is starting for %{public}@", buf, 0x20u);

      }
      objc_msgSend((id)v35[5], "resume");
      WFLogForCategory(2uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 88);
        objc_msgSend((id)v35[5], "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v46 = v19;
        v47 = 2114;
        v48 = v20;
        v49 = 2114;
        v50 = v21;
        _os_log_impl(&dword_21189A000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@)  (%{public}@) scale request has resumed for %{public}@.", buf, 0x20u);

      }
    }
    _Block_object_dispose(&v34, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mapQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_2;
    block[3] = &unk_24CCA1618;
    v41 = *(id *)(a1 + 40);
    v42 = v2;
    v43 = v5;
    dispatch_async(v10, block);

  }
}

uint64_t __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  WFLogForCategory(8uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 40), "executeCallbackwithResponse:error:", 0, *(_QWORD *)(a1 + 48));
}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_154(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "_handleDataTaskCompletionWithData:httpResponse:apiVersion:identifier:requestURL:dataTask:dataTaskError:startDate:", v7, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v8, *(_QWORD *)(a1 + 64)) & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_155;
    block[3] = &unk_24CCA07E8;
    v9 = *(NSObject **)(a1 + 72);
    v14 = *(id *)(a1 + 80);
    v15 = *(id *)(a1 + 88);
    v16 = v7;
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v19 = v10;
    v20 = v11;
    dispatch_async(v9, block);

  }
  else
  {
    WFLogForCategory(8uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_139_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_executeCallbacksForURL:responseData:error:", *(_QWORD *)(a1 + 56), 0, v8);
  }

}

void __121__WFWeatherStoreService__submitRequest_withIdentifier_forScaleNamed_language_configuration_apiVersion_completionHandler___block_invoke_155(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  WFWeatherStoreResponseDataWrapper *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v13 = 0;
  objc_msgSend(v2, "parseAQIScaleNamed:data:apiVersion:error:", v3, v4, v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    WFLogForCategory(2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(a1 + 72);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", *(_QWORD *)(a1 + 48), 4);
      *(_DWORD *)buf = 138544130;
      v15 = v10;
      v16 = 2114;
      v17 = v7;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_error_impl(&dword_21189A000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Observed error while parsing AQI Scale: %{public}@\n%@\n%@", buf, 0x2Au);

    }
  }
  v9 = -[WFWeatherStoreResponseDataWrapper initWithAQIScale:]([WFWeatherStoreResponseDataWrapper alloc], "initWithAQIScale:", v6);
  objc_msgSend(*(id *)(a1 + 80), "_executeCallbacksForURL:responseData:error:", *(_QWORD *)(a1 + 72), v9, v7);

}

- (id)apiVersionForSettings:(id)a3
{
  os_unfair_lock_s *p_retryLock;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;

  p_retryLock = &self->_retryLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[WFWeatherStoreService retryManager](self, "retryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "apiVersionForSettings:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("wds_v1");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  os_unfair_lock_unlock(p_retryLock);
  return v11;
}

- (void)requestSuccessForAPIVersion:(id)a3
{
  os_unfair_lock_s *p_retryLock;
  id v5;
  void *v6;

  p_retryLock = &self->_retryLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[WFWeatherStoreService retryManager](self, "retryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSuccessForAPIVersion:", v5);

  os_unfair_lock_unlock(p_retryLock);
}

- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4
{
  os_unfair_lock_s *p_retryLock;
  id v7;
  id v8;
  void *v9;

  p_retryLock = &self->_retryLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock_with_options();
  -[WFWeatherStoreService retryManager](self, "retryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestFailureForAPIVersion:error:", v8, v7);

  os_unfair_lock_unlock(p_retryLock);
}

- (void)_cancelWithRequestIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WFWeatherStoreService incomingRequestQueue](self, "incomingRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke;
  block[3] = &unk_24CCA17B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mapQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke_2;
  v4[3] = &unk_24CCA17B0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_sync(v2, v4);

}

void __54__WFWeatherStoreService__cancelWithRequestIdentifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "URLToCallbackMap");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLToTaskMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDToCallbackMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDToURLMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  objc_msgSend(v15, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "requestType");
    if (v9 == 1)
    {
      objc_msgSend(v8, "aqiScaleRetrievalCompletionBlock");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = &unk_24CCC13C0;
    }
    else
    {
      if (v9)
      {
LABEL_8:
        objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v6, "removeObject:", v8);
        goto LABEL_9;
      }
      objc_msgSend(v8, "forecastRetrievalCompletionBlock");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDD1540];
      v12 = &unk_24CCC1398;
    }
    objc_msgSend(v11, "wf_errorWithCode:userInfo:", 13, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v13);

    goto LABEL_8;
  }
LABEL_9:
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v15, "removeObjectForKey:", v5);
    objc_msgSend(v2, "objectForKeyedSubscript:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancel");
    objc_msgSend(v2, "removeObjectForKey:", v5);
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  }
LABEL_12:

}

- (id)_taskForURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[WFWeatherStoreService mapQueue](self, "mapQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__WFWeatherStoreService__taskForURL___block_invoke;
  block[3] = &unk_24CCA2228;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __37__WFWeatherStoreService__taskForURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "URLToTaskMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setTask:(id)a3 requestIdentifier:(id)a4 callback:(id)a5 forURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[WFWeatherStoreService mapQueue](self, "mapQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__WFWeatherStoreService__setTask_requestIdentifier_callback_forURL___block_invoke;
  block[3] = &unk_24CCA2250;
  block[4] = self;
  v20 = v11;
  v21 = v13;
  v22 = v12;
  v23 = v10;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  dispatch_async(v14, block);

}

void __68__WFWeatherStoreService__setTask_requestIdentifier_callback_forURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "UUIDToURLMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "UUIDToCallbackMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "URLToTaskMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "URLToCallbackMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 48));

}

- (void)_addCallback:(id)a3 requestIdentifier:(id)a4 forURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWeatherStoreService mapQueue](self, "mapQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__WFWeatherStoreService__addCallback_requestIdentifier_forURL___block_invoke;
  v15[3] = &unk_24CCA2278;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

void __63__WFWeatherStoreService__addCallback_requestIdentifier_forURL___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "URLToCallbackMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "UUIDToURLMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "UUIDToCallbackMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)_executeCallbacksForURL:(id)a3 responseData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WFWeatherStoreService mapQueue](self, "mapQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke;
  v15[3] = &unk_24CCA2278;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "URLToCallbackMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke_2;
  v4[3] = &unk_24CCA22A0;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_cleanupCallbacksAndTasksForURL:", *(_QWORD *)(a1 + 40));

}

uint64_t __68__WFWeatherStoreService__executeCallbacksForURL_responseData_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeCallbackwithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_cleanupCallbacksAndTasksForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFWeatherStoreService UUIDToURLMap](self, "UUIDToURLMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __57__WFWeatherStoreService__cleanupCallbacksAndTasksForURL___block_invoke;
  v26[3] = &unk_24CCA22C8;
  v7 = v4;
  v27 = v7;
  v8 = v6;
  v28 = v8;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v26);
  -[WFWeatherStoreService UUIDToCallbackMap](self, "UUIDToCallbackMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v5, "removeObjectForKey:", v15, (_QWORD)v22);
        objc_msgSend(v9, "removeObjectForKey:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v12);
  }

  -[WFWeatherStoreService URLToCallbackMap](self, "URLToCallbackMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObjectForKey:", v7);
  -[WFWeatherStoreService URLToTaskMap](self, "URLToTaskMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    WFLogForCategory(2uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "description");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v20;
      v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_21189A000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished processing %{public}@.", buf, 0x16u);

    }
    objc_msgSend(v17, "removeObjectForKey:", v7);
  }

}

void __57__WFWeatherStoreService__cleanupCallbacksAndTasksForURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "isEqual:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (WFWeatherStoreServiceConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)forecastRequestStartingCallback
{
  return self->_forecastRequestStartingCallback;
}

- (void)setForecastRequestStartingCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)locationGeocodeForCoordinateRequestStartingCallback
{
  return self->_locationGeocodeForCoordinateRequestStartingCallback;
}

- (void)setLocationGeocodeForCoordinateRequestStartingCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)incomingRequestQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIncomingRequestQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)parseQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setParseQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)mapQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMapQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (os_unfair_lock_s)retryLock
{
  return self->_retryLock;
}

- (void)setRetryLock:(os_unfair_lock_s)a3
{
  self->_retryLock = a3;
}

- (NSMutableDictionary)UUIDToCallbackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUUIDToCallbackMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)UUIDToURLMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUUIDToURLMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)URLToTaskMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setURLToTaskMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)URLToCallbackMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setURLToCallbackMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (WFWeatherStoreCache)cache
{
  return (WFWeatherStoreCache *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (WFNetworkRetryManager)retryManager
{
  return self->_retryManager;
}

- (void)setRetryManager:(id)a3
{
  objc_storeStrong((id *)&self->_retryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryManager, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_URLToCallbackMap, 0);
  objc_storeStrong((id *)&self->_URLToTaskMap, 0);
  objc_storeStrong((id *)&self->_UUIDToURLMap, 0);
  objc_storeStrong((id *)&self->_UUIDToCallbackMap, 0);
  objc_storeStrong((id *)&self->_mapQueue, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequestQueue, 0);
  objc_storeStrong(&self->_locationGeocodeForCoordinateRequestStartingCallback, 0);
  objc_storeStrong(&self->_forecastRequestStartingCallback, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithConfiguration:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Store service configuration is invalid - aborting initialization of %@", v5, 0xCu);

}

- (void)initWithConfiguration:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Error opening WFWeatherStoreCache: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)forecastForLocation:(uint64_t)a3 locale:onDate:requestIdentifier:options:completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = 0;
  OUTLINED_FUNCTION_0_2(&dword_21189A000, a2, a3, "(%{public}@) Invalid date given for Forecast request: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)forecastForLocation:locale:onDate:requestIdentifier:options:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v2, v3), "geoLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543619;
  v7 = v1;
  v8 = 2113;
  v9 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21189A000, v0, v5, "(%{public}@) Invalid location given for Forecast request: %{private}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_3();
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "(%{public}@) Valid array of hourly WFWeatherConditions instances found in cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "(%{public}@) Check cache for valid array of hourly WFWeatherConditions instances.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)hourlyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v0, v1), "geoLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v3, v4, "(%{public}@) Invalid location given for HourlyForecast request: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v0, v1), "geoLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v3, v4, "(%{public}@) Invalid location given for DailyForecast request: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "(%{public}@) Valid array of daily WFWeatherConditions instances found in cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)dailyForecastForLocation:locale:requestIdentifier:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "(%{public}@) Check cache for valid array of daily WFWeatherConditions instances.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v0, v1), "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_1_0(&dword_21189A000, v3, v4, "(%{public}@) Valid WFAirQualityConditions instance found in cache. Expires @ %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "(%{public}@) Check cache for valid WFAirQualityConditions instance.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)airQualityForLocation:locale:requestIdentifier:options:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_10();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v1, v2), "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_0_2(&dword_21189A000, v0, v4, "(%{public}@) Invalid location given for AirQuality request: %@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)_forecastConditionsForTypes:(uint64_t)a1 location:units:locale:date:requestIdentifier:requestOptions:completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v1, v2, "(%{public}@) Failed to build forecast request: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v1, v2, "(%{public}@) WDS told us that air quality data is temporarily unavailable. Forecast Data=%{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v1, v2, "(%{public}@) AQI scale request failed: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "No cached AQI scale with identifier: (%{public}@) in cache ... fetching it from WDS ...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_4(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_7_0();
  _os_log_debug_impl(&dword_21189A000, v1, OS_LOG_TYPE_DEBUG, "Applying cached aqi scale found with identifier: (%{public}@), scale: (%{public}@)", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_121_cold_5()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_21189A000, v0, OS_LOG_TYPE_FAULT, "The unarchived scale with identifier: (%{public}@) is not of the correct type", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __131__WFWeatherStoreService__forecastConditionsForTypes_location_units_locale_date_requestIdentifier_requestOptions_completionHandler___block_invoke_127_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 56);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6(&dword_21189A000, v1, v2, "(%{public}@) AQI scale request succeeded but parsing failed for identfier: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_forecastConditionsForTWCAQIAndTypes:location:locale:date:requestIdentifier:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_21189A000, v0, v1, "(%{public}@) Failed to build forecast request: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_currentScaleCategoryForScale:(os_log_t)log index:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Unexpected category index", v1, 2u);
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "(%{public}@) No internet connection available; skipping query.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

void __142__WFWeatherStoreService__submitRequest_withIdentifier_forLocation_forecastTypes_configuration_units_locale_date_apiVersion_completionHandler___block_invoke_139_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "(%{public}@) Received an unsuccessful HTTP response; aborting.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
