@implementation WAForecastModelController

- (WAForecastModelController)init
{
  WAForecastModelController *v2;
  void *v3;
  void *v4;
  dispatch_queue_t v5;
  dispatch_queue_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  WFServiceConnection *connection;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)WAForecastModelController;
  v2 = -[WAForecastModelController init](&v26, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[WAForecastModelController setForecastOperationQueue:](v2, "setForecastOperationQueue:", v3);

    -[WAForecastModelController forecastOperationQueue](v2, "forecastOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaxConcurrentOperationCount:", 1);

    v5 = dispatch_queue_create("com.apple.weather.forecastModelController.incomingRequestQueue", 0);
    -[WAForecastModelController setIncomingRequestQueue:](v2, "setIncomingRequestQueue:", v5);

    v6 = dispatch_queue_create("com.apple.weather.forecastModelController.completionHandlerQueue", MEMORY[0x24BDAC9C0]);
    -[WAForecastModelController setCompletionHandlerQueue:](v2, "setCompletionHandlerQueue:", v6);

    v7 = (void *)objc_opt_new();
    -[WAForecastModelController setUpdatingCities:](v2, "setUpdatingCities:", v7);

    v8 = (void *)objc_opt_new();
    -[WAForecastModelController setCompletionHandlersForCity:](v2, "setCompletionHandlersForCity:", v8);

    if (-[WAForecastModelController isPriorityForecastOperationsEnabled](v2, "isPriorityForecastOperationsEnabled"))
    {
      v9 = (void *)objc_opt_new();
      -[WAForecastModelController setPriorityForecastOperationQueue:](v2, "setPriorityForecastOperationQueue:", v9);

      -[WAForecastModelController priorityForecastOperationQueue](v2, "priorityForecastOperationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMaxConcurrentOperationCount:", 1);

      v11 = (void *)objc_opt_new();
      -[WAForecastModelController setPriorityUpdatingCities:](v2, "setPriorityUpdatingCities:", v11);

      v12 = (void *)objc_opt_new();
      -[WAForecastModelController setPriorityCompletionHandlersForCity:](v2, "setPriorityCompletionHandlersForCity:", v12);

    }
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v13 = (void *)objc_opt_new();
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isInternalInstall");

    if (v15)
      objc_storeStrong((id *)&v2->_store, v13);
    objc_initWeak(&location, v2);
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __33__WAForecastModelController_init__block_invoke;
    v23[3] = &unk_24DD9CE30;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v13, "setForecastRequestStartingCallback:", v23);
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __33__WAForecastModelController_init__block_invoke_11;
    v21[3] = &unk_24DD9CE58;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v13, "setLocationGeocodeForCoordinateRequestStartingCallback:", v21);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2250]), "initWithStore:", v13);
    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "setServiceProxy:", v17);
    objc_msgSend(v17, "addClient:", v18);
    connection = v2->_connection;
    v2->_connection = (WFServiceConnection *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __33__WAForecastModelController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "incomingRequestQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__WAForecastModelController_init__block_invoke_2;
  block[3] = &unk_24DD9E548;
  v13 = WeakRetained;
  v14 = v6;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  v11 = WeakRetained;
  dispatch_async(v8, block);

}

void __33__WAForecastModelController_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updatingCities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v6 = 138412290;
    v16 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isLocalWeatherCity", v16, (_QWORD)v17))
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v10, "wfLocation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

          if ((_DWORD)v11)
          {
            objc_msgSend(*(id *)(a1 + 32), "greenTeaLogger");
            getCTGreenTeaOsLogHandle();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v15 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = v16;
              v22 = v15;
              _os_log_impl(&dword_21AAEC000, v14, OS_LOG_TYPE_INFO, "Transmitting current location to %@ for local weather forecast.", buf, 0xCu);
            }

          }
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

}

void __33__WAForecastModelController_init__block_invoke_11(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  double v10;
  double v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "incomingRequestQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__WAForecastModelController_init__block_invoke_2_12;
  block[3] = &unk_24DD9E570;
  v9 = WeakRetained;
  v10 = a2;
  v11 = a3;
  v7 = WeakRetained;
  dispatch_async(v6, block);

}

void __33__WAForecastModelController_init__block_invoke_2_12(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updatingCities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocalWeatherCity"))
        {
          objc_msgSend(v9, "wfLocation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "geoLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinate");
          v14 = CLLocationCoordinate2DEqualToCoordinates(v12, v13, *(double *)(a1 + 40), *(double *)(a1 + 48));

          if (v14)
          {
            objc_msgSend(*(id *)(a1 + 32), "greenTeaLogger");
            getCTGreenTeaOsLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v17 = 0;
              _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", v17, 2u);
            }

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[WAForecastModelController greenTeaLogger](self, "greenTeaLogger");
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WAForecastModelController;
  -[WAForecastModelController dealloc](&v3, sel_dealloc);
}

- (void)setLocationGeocodingSampler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__WAForecastModelController_setLocationGeocodingSampler___block_invoke;
  block[3] = &unk_24DD9CF48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __57__WAForecastModelController_setLocationGeocodingSampler___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (BOOL)isCityBeingUpdated:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    if (-[WAForecastModelController isPriorityCity:](self, "isPriorityCity:", v4))
    {
      v5 = -[WAForecastModelController isPriorityCityBeingUpdated:](self, "isPriorityCityBeingUpdated:", v4);
    }
    else
    {
      v11 = 0;
      v12 = &v11;
      v13 = 0x2020000000;
      v14 = 0;
      -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __48__WAForecastModelController_isCityBeingUpdated___block_invoke;
      block[3] = &unk_24DD9E598;
      v10 = &v11;
      block[4] = self;
      v9 = v4;
      dispatch_sync(v6, block);

      v5 = *((_BYTE *)v12 + 24) != 0;
      _Block_object_dispose(&v11, 8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __48__WAForecastModelController_isCityBeingUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "updatingCities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isPriorityCityBeingUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__WAForecastModelController_isPriorityCityBeingUpdated___block_invoke;
  block[3] = &unk_24DD9E598;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __56__WAForecastModelController_isPriorityCityBeingUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "priorityUpdatingCities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

- (BOOL)fetchForecastForCity:(id)a3 completion:(id)a4
{
  return -[WAForecastModelController fetchForecastForCity:withUnits:completion:](self, "fetchForecastForCity:withUnits:completion:", a3, 0, a4);
}

- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 completion:(id)a5
{
  return -[WAForecastModelController fetchForecastForCity:withUnits:requestOptions:completion:](self, "fetchForecastForCity:withUnits:requestOptions:completion:", a3, *(_QWORD *)&a4, 0, a5);
}

- (BOOL)fetchForecastForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  _QWORD block[5];
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  int v22;

  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD, void *))a6;
  if (!v12)
    goto LABEL_5;
  objc_msgSend(v10, "locationID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    WAErrorWithCode(4, 0, v10, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v16);

LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__WAForecastModelController_fetchForecastForCity_withUnits_requestOptions_completion___block_invoke;
  block[3] = &unk_24DD9E5C0;
  block[4] = self;
  v19 = v10;
  v22 = a4;
  v20 = v11;
  v21 = v12;
  dispatch_async(v14, block);

  v15 = 1;
LABEL_6:

  return v15;
}

void __86__WAForecastModelController_fetchForecastForCity_withUnits_requestOptions_completion___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_executeFetchForCity:withUnits:requestOptions:completion:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "isPriorityCity:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "priorityForecastOperationQueue");
  else
    objc_msgSend(v3, "forecastOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v5);

}

- (BOOL)fetchForecastForCities:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  id v20;
  _QWORD block[6];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7 && objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "locationID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            WALogForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v13;
              _os_log_impl(&dword_21AAEC000, v15, OS_LOG_TYPE_DEFAULT, "Creating forecastOperation for city : %@", buf, 0xCu);
            }

            -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
            v16 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke;
            block[3] = &unk_24DD9CF98;
            block[4] = self;
            block[5] = v13;
            v22 = v7;
            dispatch_async(v16, block);

          }
          else
          {
            WAErrorWithCode(4, 0, v13, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *, _QWORD, void *))v7 + 2))(v7, v13, 0, v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v10);
    }

    v18 = 1;
    v6 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke_2;
  v12 = &unk_24DD9E5E8;
  v4 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v4;
  objc_msgSend(v2, "_queue_executeFetchForCity:completion:", v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "isPriorityCity:", *(_QWORD *)(a1 + 40), v9, v10, v11, v12);
  v7 = *(void **)(a1 + 32);
  if (v6)
    objc_msgSend(v7, "priorityForecastOperationQueue");
  else
    objc_msgSend(v7, "forecastOperationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v5);

}

uint64_t __63__WAForecastModelController_fetchForecastForCities_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

- (id)_queue_executeFetchForCity:(id)a3 completion:(id)a4
{
  return -[WAForecastModelController _queue_executeFetchForCity:withUnits:requestOptions:completion:](self, "_queue_executeFetchForCity:withUnits:requestOptions:completion:", a3, 0, 0, a4);
}

- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  if (-[WAForecastModelController isPriorityCity:](self, "isPriorityCity:", v12))
  {
    -[WAForecastModelController priorityCompletionHandlersForCity](self, "priorityCompletionHandlersForCity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAForecastModelController priorityUpdatingCities](self, "priorityUpdatingCities");
  }
  else
  {
    -[WAForecastModelController completionHandlersForCity](self, "completionHandlersForCity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAForecastModelController updatingCities](self, "updatingCities");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModelController _queue_executeFetchForCity:withUnits:requestOptions:completion:completionHandlersForCity:updatingCities:](self, "_queue_executeFetchForCity:withUnits:requestOptions:completion:completionHandlersForCity:updatingCities:", v12, v7, v11, v10, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_queue_executeFetchForCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 completion:(id)a6 completionHandlersForCity:(id)a7 updatingCities:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  WAForecastOperation *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  WAForecastOperation *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id from;
  id location;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v12 = *(_QWORD *)&a4;
  v48 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v38 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v14, "locationID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    WALogForCategory(1);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "name");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAForecastModelController _commaSeparatedNamesForUpdatingCities:](self, "_commaSeparatedNamesForUpdatingCities:", v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v21;
      v46 = 2112;
      v47 = v22;
      _os_log_impl(&dword_21AAEC000, v20, OS_LOG_TYPE_DEFAULT, "Multiplexing forecast request for %@ as one is already in-flight. Currently updating cities: %@", buf, 0x16u);

    }
    if (v15)
    {
      v23 = (void *)objc_msgSend(v15, "copy");
      objc_msgSend(v19, "addObject:", v23);

    }
    v24 = 0;
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDBCEF0];
    v26 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v25, "setWithObject:", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "locationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, v27);

    -[WAForecastModelController locationGeocodingSampler](self, "locationGeocodingSampler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "canRecordLocationForCity:", v14);

    v30 = [WAForecastOperation alloc];
    -[WAForecastModelController connection](self, "connection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[WAForecastOperation initWithCity:withUnits:requestOptions:canGeocode:onConnection:](v30, "initWithCity:withUnits:requestOptions:canGeocode:onConnection:", v14, v12, v38, v29, v31);

    -[WAForecastModelController trackingParameter](self, "trackingParameter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAForecastOperation setTrackingParameter:](v24, "setTrackingParameter:", v32);

    objc_initWeak(&location, v24);
    objc_initWeak(&from, self);
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __133__WAForecastModelController__queue_executeFetchForCity_withUnits_requestOptions_completion_completionHandlersForCity_updatingCities___block_invoke;
    v39[3] = &unk_24DD9E610;
    v37 = &v40;
    objc_copyWeak(&v40, &from);
    objc_copyWeak(&v41, &location);
    -[WAForecastOperation setCompletionBlock:](v24, "setCompletionBlock:", v39);
    WALogForCategory(1);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "name", &v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[WAForecastModelController _commaSeparatedNamesForUpdatingCities:](self, "_commaSeparatedNamesForUpdatingCities:", v17);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v34;
      v46 = 2112;
      v47 = v35;
      _os_log_impl(&dword_21AAEC000, v33, OS_LOG_TYPE_DEFAULT, "Built forecast request for %@. Currently updating cities: %@", buf, 0x16u);

    }
    objc_msgSend(v17, "addObject:", v14);
    objc_destroyWeak(&v41);
    objc_destroyWeak(v37);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v24;
}

void __133__WAForecastModelController__queue_executeFetchForCity_withUnits_requestOptions_completion_completionHandlersForCity_updatingCities___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleForecastOperationCompletion:", v2);

}

- (void)cancelAllFetchRequests
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BEC2210], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableForecastRequestCancelation");

  if ((v5 & 1) == 0)
  {
    -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke;
    block[3] = &unk_24DD9CF20;
    block[4] = self;
    dispatch_sync(v6, block);

  }
}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "forecastOperationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        WALogForCategory(1);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "city");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v21 = v10;
          _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Cancelling forecast request for %@", buf, 0xCu);

        }
        objc_msgSend(v8, "setCompletionBlock:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "completionHandlersForCity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_21;
  v15[3] = &unk_24DD9E660;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

  objc_msgSend(*(id *)(a1 + 32), "completionHandlersForCity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "forecastOperationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelAllOperations");

  objc_msgSend(*(id *)(a1 + 32), "updatingCities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllObjects");

}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  size_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1540];
  v19 = CFSTR("city");
  v20[0] = a2;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.forecastModelController.errorDomain"), 3072, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  objc_msgSend(*(id *)(a1 + 32), "completionHandlerQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_2;
  block[3] = &unk_24DD9E638;
  v17 = v11;
  v18 = v10;
  v14 = v10;
  v15 = v11;
  dispatch_apply(v12, v13, block);

}

void __51__WAForecastModelController_cancelAllFetchRequests__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, *(_QWORD *)(a1 + 40));

}

- (void)_handleForecastOperationCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  WAForecastModelController *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "city");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WAForecastModelController.m"), 312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("city"));

  }
  objc_msgSend(v5, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forecastModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WALogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[WAForecastModelController _handleForecastOperationCompletion:]";
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "%s, completed forecast city=%@, forecastModel=%@", buf, 0x20u);
  }

  -[WAForecastModelController incomingRequestQueue](self, "incomingRequestQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke;
  block[3] = &unk_24DD9E048;
  v16 = v7;
  v17 = v6;
  v18 = self;
  v19 = v8;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, block);

}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke(id *a1)
{
  uint64_t *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  size_t v16;
  NSObject *v17;
  id *v18;
  id v19;
  id *v20;
  id *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  size_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void *v39;
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 4);
  v3 = a1[4];
  WALogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_cold_1((uint64_t)a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[5], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v48 = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Completed forecast request for %@", buf, 0xCu);

  }
  v7 = objc_msgSend(a1[6], "isPriorityCity:", a1[5]);
  v8 = a1[6];
  if (v7)
  {
    objc_msgSend(v8, "priorityUpdatingCities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", a1[5]);

    WALogForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[6], "_commaSeparatedPriorityUpdatingCitiesNames");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "Remaining priority updating cities: %@", buf, 0xCu);

    }
    objc_msgSend(a1[6], "priorityCompletionHandlersForCity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "locationID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "count");
    objc_msgSend(a1[6], "completionHandlerQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_31;
    block[3] = &unk_24DD9E688;
    v18 = &v44;
    v19 = v15;
    v44 = v19;
    v20 = &v45;
    v45 = a1[7];
    v21 = &v46;
    v46 = a1[4];
    dispatch_apply(v16, v17, block);

    objc_msgSend(a1[5], "locationID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(a1[6], "priorityCompletionHandlersForCity");
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v34 = (void *)v23;
      objc_msgSend(a1[5], "locationID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeObjectForKey:", v35);

    }
  }
  else
  {
    objc_msgSend(v8, "updatingCities");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObject:", a1[5]);

    WALogForCategory(1);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1[6], "_commaSeparatedUpdatingCitiesNames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v26;
      _os_log_impl(&dword_21AAEC000, v25, OS_LOG_TYPE_DEFAULT, "Remaining updating cities: %@", buf, 0xCu);

    }
    objc_msgSend(a1[6], "completionHandlersForCity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "locationID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKey:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allObjects");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_msgSend(v30, "count");
    objc_msgSend(a1[6], "completionHandlerQueue");
    v32 = objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_32;
    v39 = &unk_24DD9E688;
    v18 = &v40;
    v19 = v30;
    v40 = v19;
    v20 = &v41;
    v41 = a1[7];
    v21 = &v42;
    v42 = a1[4];
    dispatch_apply(v31, v32, &v36);

    objc_msgSend(a1[5], "locationID", v36, v37, v38, v39);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(a1[6], "completionHandlersForCity");
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }

}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_31(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_32(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)_commaSeparatedUpdatingCitiesNames
{
  void *v3;
  void *v4;

  -[WAForecastModelController updatingCities](self, "updatingCities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModelController _commaSeparatedNamesForUpdatingCities:](self, "_commaSeparatedNamesForUpdatingCities:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_commaSeparatedPriorityUpdatingCitiesNames
{
  void *v3;
  void *v4;

  -[WAForecastModelController priorityUpdatingCities](self, "priorityUpdatingCities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastModelController _commaSeparatedNamesForUpdatingCities:](self, "_commaSeparatedNamesForUpdatingCities:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_commaSeparatedNamesForUpdatingCities:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  if (a3)
  {
    objc_msgSend(a3, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", CFSTR("name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("<None>");
  }
  return v5;
}

- (BOOL)isPriorityCity:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[WAForecastModelController isPriorityForecastOperationsEnabled](self, "isPriorityForecastOperationsEnabled"))
  {
    if ((objc_msgSend(v4, "isLocalWeatherCity") & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "isTransient");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPriorityForecastOperationsEnabled
{
  if (isPriorityForecastOperationsEnabled_onceToken != -1)
    dispatch_once(&isPriorityForecastOperationsEnabled_onceToken, &__block_literal_global_20);
  return isPriorityForecastOperationsEnabled_sIsPriorityForecastOperationsEnabled;
}

void __64__WAForecastModelController_isPriorityForecastOperationsEnabled__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BEC2210], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "settings");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isPriorityForecastOperationsEnabled_sIsPriorityForecastOperationsEnabled = objc_msgSend(v0, "disablePriorityForecastRequestQueue") ^ 1;

}

- (WALocationPrivacySampler)locationGeocodingSampler
{
  return self->_locationGeocodingSampler;
}

- (NSOperationQueue)forecastOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setForecastOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)incomingRequestQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIncomingRequestQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)completionHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletionHandlerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableSet)updatingCities
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdatingCities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)completionHandlersForCity
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCompletionHandlersForCity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (WFServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (NSOperationQueue)priorityForecastOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPriorityForecastOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableSet)priorityUpdatingCities
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPriorityUpdatingCities:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)priorityCompletionHandlersForCity
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPriorityCompletionHandlersForCity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)trackingParameter
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTrackingParameter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (WFWeatherStoreService)store
{
  return (WFWeatherStoreService *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_priorityCompletionHandlersForCity, 0);
  objc_storeStrong((id *)&self->_priorityUpdatingCities, 0);
  objc_storeStrong((id *)&self->_priorityForecastOperationQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_completionHandlersForCity, 0);
  objc_storeStrong((id *)&self->_updatingCities, 0);
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_incomingRequestQueue, 0);
  objc_storeStrong((id *)&self->_forecastOperationQueue, 0);
  objc_storeStrong((id *)&self->_locationGeocodingSampler, 0);
}

void __64__WAForecastModelController__handleForecastOperationCompletion___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a2;
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_21AAEC000, a3, OS_LOG_TYPE_ERROR, "Failed to complete forecast request for %@: %@", (uint8_t *)&v7, 0x16u);

}

@end
