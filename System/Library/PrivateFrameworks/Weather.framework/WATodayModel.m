@implementation WATodayModel

+ (id)autoupdatingLocationModelWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  WATodayAutoupdatingLocationModel *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v7 = -[WATodayAutoupdatingLocationModel initWithPreferences:effectiveBundleIdentifier:]([WATodayAutoupdatingLocationModel alloc], "initWithPreferences:effectiveBundleIdentifier:", v6, v5);

  -[WATodayModel setHasPendingUpdates:](v7, "setHasPendingUpdates:", 0);
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "+[WATodayModel autoupdatingLocationModelWithPreferences:effectiveBundleIdentifier:]";
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v10, 0xCu);
  }

  -[WATodayAutoupdatingLocationModel configureWithLocationServicesActive:](v7, "configureWithLocationServicesActive:", 1);
  return v7;
}

+ (id)currentLocationModel
{
  WATodayAutoupdatingLocationModel *v2;
  WeatherPreferences *v3;
  WATodayAutoupdatingLocationModel *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = [WATodayAutoupdatingLocationModel alloc];
  v3 = objc_alloc_init(WeatherPreferences);
  v4 = -[WATodayAutoupdatingLocationModel initWithPreferences:effectiveBundleIdentifier:](v2, "initWithPreferences:effectiveBundleIdentifier:", v3, 0);

  -[WATodayModel setHasPendingUpdates:](v4, "setHasPendingUpdates:", 0);
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "+[WATodayModel currentLocationModel]";
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v7, 0xCu);
  }

  -[WATodayAutoupdatingLocationModel configureWithLocationServicesActive:](v4, "configureWithLocationServicesActive:", 1);
  return v4;
}

+ (id)modelWithLocation:(id)a3
{
  id v3;
  WATodayModel *v4;

  v3 = a3;
  v4 = -[WATodayModel initWithLocation:]([WATodayModel alloc], "initWithLocation:", v3);

  return v4;
}

- (WATodayModel)init
{
  WATodayModel *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  NSOperationQueue *modelOperationQueue;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  WFServiceConnection *connection;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, double, double);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)WATodayModel;
  v2 = -[WATodayModel init](&v22, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = objc_opt_new();
    modelOperationQueue = v2->_modelOperationQueue;
    v2->_modelOperationQueue = (NSOperationQueue *)v5;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_modelOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v2->_hasPendingUpdates = 0;
    WALogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WATodayModel init]";
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", buf, 0xCu);
    }

    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
    v8 = (void *)objc_opt_new();
    objc_initWeak((id *)buf, v2);
    v9 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __20__WATodayModel_init__block_invoke;
    v20[3] = &unk_24DD9CE30;
    objc_copyWeak(&v21, (id *)buf);
    objc_msgSend(v8, "setForecastRequestStartingCallback:", v20);
    v15 = v9;
    v16 = 3221225472;
    v17 = __20__WATodayModel_init__block_invoke_6;
    v18 = &unk_24DD9CE58;
    objc_copyWeak(&v19, (id *)buf);
    objc_msgSend(v8, "setLocationGeocodeForCoordinateRequestStartingCallback:", &v15);
    v10 = objc_alloc(MEMORY[0x24BEC2250]);
    v11 = (void *)objc_msgSend(v10, "initWithStore:", v8, v15, v16, v17, v18);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setServiceProxy:", v11);
    objc_msgSend(v11, "addClient:", v12);
    connection = v2->_connection;
    v2->_connection = (WFServiceConnection *)v12;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

  }
  return v2;
}

void __20__WATodayModel_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id to;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v7 = objc_loadWeakRetained(&to);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v8 = objc_loadWeakRetained(&to);
  objc_msgSend(v8, "forecastModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "isEqual:", v10);

  if (v11)
  {
    v12 = objc_loadWeakRetained(&to);
    objc_msgSend(v12, "greenTeaLogger");
    getCTGreenTeaOsLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();

    if (v7 && os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_INFO, "Transmitting current location to %@ for local weather forecast.", buf, 0xCu);
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_destroyWeak(&to);

}

void __20__WATodayModel_init__block_invoke_6(uint64_t a1, double a2, double a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  id v13;
  uint8_t v14[8];
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v5 = objc_loadWeakRetained(&to);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    goto LABEL_7;
  }
  v6 = objc_loadWeakRetained(&to);
  objc_msgSend(v6, "forecastModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "geoLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinate");
  v12 = CLLocationCoordinate2DEqualToCoordinates(v10, v11, a2, a3);

  if (v12)
  {
    v13 = objc_loadWeakRetained(&to);
    objc_msgSend(v13, "greenTeaLogger");
    getCTGreenTeaOsLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5 && os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", v14, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_destroyWeak(&to);
}

- (WATodayModel)initWithLocation:(id)a3
{
  id v5;
  WATodayModel *v6;
  uint64_t v7;
  WAForecastModel *forecastModel;
  NSObject *v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WATodayModel.m"), 111, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location"));

  }
  v6 = -[WATodayModel init](self, "init");
  if (v6)
  {
    v7 = objc_opt_new();
    forecastModel = v6->_forecastModel;
    v6->_forecastModel = (WAForecastModel *)v7;

    -[WAForecastModel setLocation:](v6->_forecastModel, "setLocation:", v5);
    v6->_hasPendingUpdates = 0;
    WALogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[WATodayModel initWithLocation:]";
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", buf, 0xCu);
    }

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[WATodayModel greenTeaLogger](self, "greenTeaLogger");
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)WATodayModel;
  -[WATodayModel dealloc](&v3, sel_dealloc);
}

- (BOOL)executeModelUpdateWithCompletion:(id)a3
{
  id v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__WATodayModel_executeModelUpdateWithCompletion___block_invoke;
    v6[3] = &unk_24DD9CE80;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    -[WATodayModel _executeLocationUpdateWithCompletion:](self, "_executeLocationUpdateWithCompletion:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

void __49__WATodayModel_executeModelUpdateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_locationUpdateCompleted:error:completion:", v7, v6, *(_QWORD *)(a1 + 32));

}

- (void)_locationUpdateCompleted:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (a4)
  {
    (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, a4);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__WATodayModel__locationUpdateCompleted_error_completion___block_invoke;
    v11[3] = &unk_24DD9CEA8;
    v11[4] = self;
    v12 = v8;
    v13 = v10;
    -[WATodayModel _executeForecastRetrievalForLocation:completion:](self, "_executeForecastRetrievalForLocation:completion:", v12, v11);

  }
}

uint64_t __58__WATodayModel__locationUpdateCompleted_error_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forecastUpdateCompleted:forecastModel:error:completion:", *(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 48));
}

- (void)_forecastUpdateCompleted:(id)a3 forecastModel:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  WATodayModel *v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__WATodayModel__forecastUpdateCompleted_forecastModel_error_completion___block_invoke;
  v15[3] = &unk_24DD9CED0;
  v16 = v10;
  v17 = self;
  v18 = v9;
  v19 = v11;
  v12 = v9;
  v13 = v11;
  v14 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

uint64_t __72__WATodayModel__forecastUpdateCompleted_forecastModel_error_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  char v4;
  void *v5;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "forecastModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 48));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setForecastModel:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_willDeliverForecastModel:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_fireTodayModelForecastWasUpdated:", *(_QWORD *)(a1 + 48));
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setLastUpdateDate:", v5);

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if ((v4 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_persistStateWithModel:", *(_QWORD *)(a1 + 48));
  return result;
}

- (id)location
{
  void *v2;
  void *v3;

  -[WATodayModel forecastModel](self, "forecastModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (WAForecastModel)forecastModel
{
  return self->_forecastModel;
}

- (void)setForecastModel:(id)a3
{
  objc_storeStrong((id *)&self->_forecastModel, a3);
}

- (void)_executeLocationUpdateWithCompletion:(id)a3
{
  WAForecastModel *forecastModel;
  id v5;
  id v6;

  if (a3)
  {
    forecastModel = self->_forecastModel;
    v5 = a3;
    -[WAForecastModel location](forecastModel, "location");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

  }
}

- (void)_executeForecastRetrievalForLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  WAForecastOperation *v9;
  void *v10;
  WAForecastOperation *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSOperationQueue cancelAllOperations](self->_modelOperationQueue, "cancelAllOperations");
    WALogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "Creating WAForecastOperation for %@", buf, 0xCu);
    }

    v9 = [WAForecastOperation alloc];
    -[WATodayModel connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WAForecastOperation initWithLocation:onConnection:](v9, "initWithLocation:onConnection:", v6, v10);

    objc_initWeak((id *)buf, v11);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__WATodayModel__executeForecastRetrievalForLocation_completion___block_invoke;
    v13[3] = &unk_24DD9CEF8;
    objc_copyWeak(&v16, (id *)buf);
    v14 = v6;
    v15 = v7;
    -[WAForecastOperation setCompletionBlock:](v11, "setCompletionBlock:", v13);
    -[NSOperationQueue addOperation:](self->_modelOperationQueue, "addOperation:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    WALogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[WATodayModel _executeForecastRetrievalForLocation:completion:].cold.1(v12);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 4, 0);
    v11 = (WAForecastOperation *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, WAForecastOperation *))v7 + 2))(v7, 0, v11);
  }

}

void __64__WATodayModel__executeForecastRetrievalForLocation_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "forecastModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "WAForecastOperation completed for %@, %@", (uint8_t *)&v10, 0x16u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v4, v9);

}

- (BOOL)hasCrossedHourlyBoundary
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayModel lastUpdateDate](self, "lastUpdateDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = DatesAreNotWithinSameHour(v3, v4);

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  WATodayModel *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315650;
    v10 = "-[WATodayModel addObserver:]";
    v11 = 2112;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "%s self=%@, adding observer: %@", (uint8_t *)&v9, 0x20u);
  }

  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  if (-[WATodayModel hasPendingUpdates](self, "hasPendingUpdates"))
  {
    WALogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "Has pending updates, start updating location", (uint8_t *)&v9, 2u);
    }

    -[WATodayModel performDelayedUpdatesForObserver:](self, "performDelayedUpdatesForObserver:", v4);
    -[WATodayModel setHasPendingUpdates:](self, "setHasPendingUpdates:", 0);
    WALogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[WATodayModel addObserver:]";
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "%s , Flag pending update to No", (uint8_t *)&v9, 0xCu);
    }

  }
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "Does not have pending updates, do nothing", (uint8_t *)&v9, 2u);
  }

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_fireTodayModelWantsUpdate
{
  NSObject *v3;
  NSHashTable *observers;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSHashTable *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  WATodayModel *v14;
  __int16 v15;
  NSHashTable *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    observers = self->_observers;
    *(_DWORD *)buf = 136315394;
    v14 = (WATodayModel *)"-[WATodayModel _fireTodayModelWantsUpdate]";
    v15 = 2112;
    v16 = observers;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[WATodayModel hasPendingUpdates](self, "hasPendingUpdates");
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 1024;
    LODWORD(v16) = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "I am a WATodayModel: %@, current pending update status is %d", buf, 0x12u);
  }

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    WALogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_observers;
      *(_DWORD *)buf = 138412290;
      v14 = (WATodayModel *)v10;
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Has observers:%@, update location now", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__WATodayModel__fireTodayModelWantsUpdate__block_invoke;
    block[3] = &unk_24DD9CF20;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    -[WATodayModel setHasPendingUpdates:](self, "setHasPendingUpdates:", 1);
    WALogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v11, OS_LOG_TYPE_DEFAULT, "Do not have observers, flag pending update to yes", buf, 2u);
    }

  }
}

void __42__WATodayModel__fireTodayModelWantsUpdate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "todayModelWantsUpdate:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_fireTodayModelForecastWasUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *observers;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  NSHashTable *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    observers = self->_observers;
    *(_DWORD *)buf = 136315394;
    v11 = "-[WATodayModel _fireTodayModelForecastWasUpdated:]";
    v12 = 2112;
    v13 = observers;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__WATodayModel__fireTodayModelForecastWasUpdated___block_invoke;
  v8[3] = &unk_24DD9CF48;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __50__WATodayModel__fireTodayModelForecastWasUpdated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "todayModel:forecastWasUpdated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)performDelayedUpdatesForObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WATodayModel *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__WATodayModel_performDelayedUpdatesForObserver___block_invoke;
  v6[3] = &unk_24DD9CF48;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __49__WATodayModel_performDelayedUpdatesForObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "todayModelWantsUpdate:", *(_QWORD *)(a1 + 40));
  return result;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void)setLastUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateDate, a3);
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

- (BOOL)hasPendingUpdates
{
  return self->_hasPendingUpdates;
}

- (void)setHasPendingUpdates:(BOOL)a3
{
  self->_hasPendingUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_forecastModel, 0);
  objc_storeStrong((id *)&self->_modelOperationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_executeForecastRetrievalForLocation:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Tried executing a forecast retrieval for a NIL location.", v1, 2u);
}

@end
