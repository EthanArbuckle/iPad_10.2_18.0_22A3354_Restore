@implementation TWCCityUpdater

+ (id)sharedCityUpdater
{
  if (sharedCityUpdater_onceToken != -1)
    dispatch_once(&sharedCityUpdater_onceToken, &__block_literal_global_15);
  return (id)sharedCityUpdater_sharedCityUpdater;
}

void __35__TWCCityUpdater_sharedCityUpdater__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCityUpdater_sharedCityUpdater;
  sharedCityUpdater_sharedCityUpdater = v0;

}

- (TWCCityUpdater)init
{
  TWCCityUpdater *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TWCCityUpdater;
  v2 = -[TWCCityUpdater init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TWCCityUpdater setForecastModelController:](v2, "setForecastModelController:", v3);

  }
  return v2;
}

- (void)configureWithLocationGeocodingSampler:(id)a3
{
  -[WAForecastModelController setLocationGeocodingSampler:](self->_forecastModelController, "setLocationGeocodingSampler:", a3);
}

- (BOOL)isUpdatingCity:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TWCCityUpdater forecastModelController](self, "forecastModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCityBeingUpdated:", v4);

  return v6;
}

- (void)cancel
{
  id v2;

  -[TWCCityUpdater forecastModelController](self, "forecastModelController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAllFetchRequests");

}

- (NSString)trackingParameter
{
  void *v2;
  void *v3;

  -[TWCCityUpdater forecastModelController](self, "forecastModelController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackingParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTrackingParameter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TWCCityUpdater forecastModelController](self, "forecastModelController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrackingParameter:", v4);

}

- (void)updateWeatherForCity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[TWCCityUpdater forecastModelController](self, "forecastModelController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__TWCCityUpdater_updateWeatherForCity___block_invoke;
  v7[3] = &unk_24DD9DC60;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "fetchForecastForCity:completion:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __39__TWCCityUpdater_updateWeatherForCity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__TWCCityUpdater_updateWeatherForCity___block_invoke_2;
  v9[3] = &unk_24DD9DC38;
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = v5;
  v8 = v6;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
  objc_destroyWeak(&v13);

}

void __39__TWCCityUpdater_updateWeatherForCity___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "updateCityForModel:", *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "cityDidFinishUpdatingWithError:", v2);
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v3)
    objc_msgSend(v4, "city:failedToUpdateWithError:", v6, *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(v4, "cityDidUpdateWeather:", v6);

}

- (void)updateWeatherForCities:(id)a3
{
  -[TWCCityUpdater updateWeatherForCities:withCompletionHandler:](self, "updateWeatherForCities:withCompletionHandler:", a3, 0);
}

- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *v10;
  dispatch_group_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  TWCCityUpdater *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[TWCCityUpdater updateWeatherForCities:withCompletionHandler:]";
    v31 = 2112;
    v32 = self;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "%s self=%@, updating weather for cities: %@ in city updater", buf, 0x20u);
  }

  v9 = objc_msgSend(v6, "count");
  if (v7 || v9 > 1)
  {
    v11 = dispatch_group_create();
    v12 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke;
    v27[3] = &unk_24DD9DC88;
    v13 = v11;
    v28 = v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);
    -[TWCCityUpdater delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v14);

    v15 = (void *)objc_opt_new();
    -[TWCCityUpdater forecastModelController](self, "forecastModelController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_2;
    v23[3] = &unk_24DD9DCD8;
    objc_copyWeak(&v26, (id *)buf);
    v17 = v15;
    v24 = v17;
    v10 = v13;
    v25 = v10;
    objc_msgSend(v16, "fetchForecastForCities:completion:", v6, v23);

    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_6;
    block[3] = &unk_24DD9DD00;
    v22 = v7;
    v20 = v17;
    v21 = v6;
    v18 = v17;
    dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    objc_msgSend(v6, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    -[TWCCityUpdater updateWeatherForCity:](self, "updateWeatherForCity:", v10);
  }

}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_24DD9DCB0;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  objc_copyWeak(&v19, a1 + 6);
  v17 = a1[4];
  v18 = a1[5];
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v19);
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    WALogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v9 = 138412546;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "Success updated city: %@, with forecast model: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "updateCityForModel:", *(_QWORD *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "cityDidFinishUpdatingWithError:", v2);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:");
    WALogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3_cold_1(v3, (uint64_t *)(a1 + 40), v7);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "city:failedToUpdateWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "cityDidUpdateWeather:", *(_QWORD *)(a1 + 40));
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "count");
    v3 = *(void **)(a1 + 32);
    if (v2 == 1)
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v3, "count"))
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v6 = *(_QWORD *)(a1 + 32);
      v8 = CFSTR("errors");
      v9[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 7, v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (WeatherUpdaterDelegate)delegate
{
  return (WeatherUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (WALocationPrivacySampler)locationGeocodingSampler
{
  return self->_locationGeocodingSampler;
}

- (WAForecastModelController)forecastModelController
{
  return self->_forecastModelController;
}

- (void)setForecastModelController:(id)a3
{
  objc_storeStrong((id *)&self->_forecastModelController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forecastModelController, 0);
  objc_storeStrong((id *)&self->_locationGeocodingSampler, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__TWCCityUpdater_updateWeatherForCities_withCompletionHandler___block_invoke_3_cold_1(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Forecast retrieval error: %@ for city: %@", (uint8_t *)&v5, 0x16u);
}

@end
