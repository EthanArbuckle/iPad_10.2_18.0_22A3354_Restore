@implementation WALockscreenWidgetViewController

+ (id)sharedInstanceIfExists
{
  return objc_loadWeakRetained(&sharedLockscreenWidgetViewControllerIfExists);
}

- (WALockscreenWidgetViewController)init
{
  WALockscreenWidgetViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WALockscreenWidgetViewController;
  v2 = -[WALockscreenWidgetViewController init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[WALockscreenWidgetViewController setTodayView:](v2, "setTodayView:", v3);

    v4 = (void *)objc_opt_new();
    -[WALockscreenWidgetViewController todayView](v2, "todayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", v4);

    -[WALockscreenWidgetViewController todayView](v2, "todayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALockscreenWidgetViewController todayView](v2, "todayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[WALockscreenWidgetViewController todayView](v2, "todayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[WALockscreenWidgetViewController setLocationServicesActive:](v2, "setLocationServicesActive:", 1);
    -[WALockscreenWidgetViewController setUpdateInterval:](v2, "setUpdateInterval:", 300.0);
    WeakRetained = objc_loadWeakRetained(&sharedLockscreenWidgetViewControllerIfExists);

    if (!WeakRetained)
      objc_storeWeak(&sharedLockscreenWidgetViewControllerIfExists, v2);
  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  -[WALockscreenWidgetViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[WALockscreenWidgetViewController todayView](self, "todayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WALockscreenWidgetViewController setView:](self, "setView:", v3);

  -[WALockscreenWidgetViewController _updateTodayView](self, "_updateTodayView");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  -[WALockscreenWidgetViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WALockscreenWidgetViewController _updateTodayView](self, "_updateTodayView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  -[WALockscreenWidgetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WALockscreenWidgetViewController _updateWithReason:](self, "_updateWithReason:", CFSTR("viewDidAppear wants an update."));
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WALockscreenWidgetViewController;
  -[WALockscreenWidgetViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[WALockscreenWidgetViewController _teardownWeatherModel](self, "_teardownWeatherModel");
  -[WALockscreenWidgetViewController _setTodayViewHidden:](self, "_setTodayViewHidden:", 1);
  -[WALockscreenWidgetViewController _teardownTimer](self, "_teardownTimer");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)WALockscreenWidgetViewController;
  v7 = a4;
  -[WALockscreenWidgetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[WALockscreenWidgetViewController todayView](self, "todayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__WALockscreenWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_24DD9D278;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);

}

void __87__WALockscreenWidgetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  objc_msgSend(*(id *)(a1 + 32), "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_referenceBounds");
  v7 = v6;
  v9 = v8;

  +[WATodayPadViewStyle styleForScreenWithSize:orientation:](WATodayPadViewStyle, "styleForScreenWithSize:orientation:", v3, v7, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStyle:", v10);

}

- (void)setLocationServicesActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;

  if (self->_locationServicesActive != a3)
  {
    v3 = a3;
    self->_locationServicesActive = a3;
    -[WALockscreenWidgetViewController todayModel](self, "todayModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[WALockscreenWidgetViewController todayModel](self, "todayModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLocationServicesActive:", v3);

    }
    -[WALockscreenWidgetViewController _updateTodayView](self, "_updateTodayView");
  }
}

- (void)setUpdateInterval:(double)a3
{
  if (self->_updateInterval != a3)
  {
    -[WALockscreenWidgetViewController _teardownTimer](self, "_teardownTimer");
    self->_updateInterval = a3;
    -[WALockscreenWidgetViewController _scheduleNewTimer](self, "_scheduleNewTimer");
  }
}

- (void)updateWeather
{
  -[WALockscreenWidgetViewController _updateWithReason:](self, "_updateWithReason:", CFSTR("SpringBoard initiated a request"));
}

- (void)updateForChangedSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WALockscreenWidgetViewController todayView](self, "todayView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForChangedSettings:", v4);

}

- (BOOL)todayViewIsVisible
{
  void *v3;
  int v4;

  if (-[WALockscreenWidgetViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[WALockscreenWidgetViewController todayView](self, "todayView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHidden") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_updateWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[WALockscreenWidgetViewController _setupWeatherModel](self, "_setupWeatherModel");
  if (-[WALockscreenWidgetViewController _delegateShouldUpdateForecast](self, "_delegateShouldUpdateForecast"))
  {
    -[WALockscreenWidgetViewController _delegateWillUpdate](self, "_delegateWillUpdate");
    objc_initWeak(&location, self);
    WALogForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "Updating with reason: %@", buf, 0xCu);
    }

    v7 = objc_loadWeakRetained(&location);
    objc_msgSend(v7, "todayModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__WALockscreenWidgetViewController__updateWithReason___block_invoke;
    v10[3] = &unk_24DD9D2A0;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v8, "executeModelUpdateWithCompletion:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    WALogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Delegate said to not update with reason: %@", buf, 0xCu);
    }

  }
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setUpdateLastCompletionDate:", v5);

  if (v4)
  {
    WALogForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_3((uint64_t)v4, a1, v8);

    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _delegateUpdateDidFailWithError:](v9, "_delegateUpdateDidFailWithError:", v4);
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v10, "todayModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forecastModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "city");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isLocalWeatherCity");

    WALogForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v15)
        __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_1(a1, v9, v16, v17, v18, v19, v20, v21);

      v22 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v22, "todayModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "forecastModel");
      v9 = objc_claimAutoreleasedReturnValue();

      v24 = objc_loadWeakRetained(v6);
      objc_msgSend(v24, "setCurrentForecastModel:", v9);

    }
    else if (v15)
    {
      __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_2(a1, v9, v16, v17, v18, v19, v20, v21);
    }
  }

  v25 = objc_loadWeakRetained(v6);
  objc_msgSend(v25, "_updateTodayView");

}

- (void)_setTodayViewHidden:(BOOL)a3
{
  int v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;

  v3 = a3;
  -[WALockscreenWidgetViewController todayView](self, "todayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (v6 != v3)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((v3 & 1) != 0)
    {
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("WALockscreenWidgetWillDisappearNotification"), self);

      -[WALockscreenWidgetViewController todayView](self, "todayView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("WALockscreenWidgetDidDisappearNotification");
    }
    else
    {
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("WALockscreenWidgetWillAppearNotification"), self);

      -[WALockscreenWidgetViewController todayView](self, "todayView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("WALockscreenWidgetDidAppearNotification");
    }
    v13 = v10;
    objc_msgSend(v10, "postNotificationName:object:", v11, self);

  }
}

- (void)_updateTodayView
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(10);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WALockscreenWidgetViewController _updateTodayView]";
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__WALockscreenWidgetViewController__updateTodayView__block_invoke;
  v4[3] = &unk_24DD9D2C8;
  v4[4] = self;
  -[WALockscreenWidgetViewController getLocationServicesAuthorizationStatus:](self, "getLocationServicesAuthorizationStatus:", v4);
}

void __52__WALockscreenWidgetViewController__updateTodayView__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(10);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v5;
    _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "AuthorizationStatus %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentForecastModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocalWeatherCity");
  v9 = objc_msgSend(*(id *)(a1 + 32), "locationServicesActive");
  if ((_DWORD)a2 == 3)
    v10 = v9;
  else
    v10 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_locationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && v8 && v10 || (objc_msgSend(*(id *)(a1 + 32), "shouldFakeWeather") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_temperature");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_conditionsLine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_conditionsImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLocationName:", v11);

    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTemperature:", v12);

    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConditionsImage:", v14);

    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setConditionsLine:", v13);

    WALogForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "todayView");
      v31 = v7;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "locationName");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "todayView");
      v30 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "temperature");
      v23 = v11;
      v24 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v21;
      v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_21AAEC000, v19, OS_LOG_TYPE_DEFAULT, "Show Today View: %@ at %@", buf, 0x16u);

      v6 = v24;
      v11 = v23;

      v13 = v30;
      v7 = v31;
    }

    objc_msgSend(*(id *)(a1 + 32), "_setTodayViewHidden:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setTodayViewHidden:", 1);
    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setConditionsLine:", &stru_24DD9EDF8);

    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setLocationName:", &stru_24DD9EDF8);

    objc_msgSend(*(id *)(a1 + 32), "todayView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTemperature:", &stru_24DD9EDF8);

    WALogForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = CFSTR("Location Services are disabled.");
      if (v10)
        v29 = CFSTR("Unknown!");
      if (!v8)
        v29 = CFSTR("First Weather Forecast Location; not local weather city");
      *(_DWORD *)buf = 138412290;
      v33 = v29;
      _os_log_impl(&dword_21AAEC000, v12, OS_LOG_TYPE_DEFAULT, "Today View Is Hidden: %@", buf, 0xCu);
    }
  }

}

- (void)todayModelWantsUpdate:(id)a3
{
  -[WALockscreenWidgetViewController _updateWithReason:](self, "_updateWithReason:", CFSTR("WATodayModel requested update"));
}

- (void)todayModel:(id)a3 forecastWasUpdated:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WALogForCategory(10);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315650;
    v20 = "-[WALockscreenWidgetViewController todayModel:forecastWasUpdated:]";
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ %@", (uint8_t *)&v19, 0x20u);
  }

  WALogForCategory(10);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    -[WALockscreenWidgetViewController todayModel](self, "todayModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forecastModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "current %@ todayModel.forcastModel %@", (uint8_t *)&v19, 0x16u);

  }
  -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "forecastModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == v15)
  {
    WALogForCategory(10);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21AAEC000, v18, OS_LOG_TYPE_DEFAULT, "Not updating today view since currentForcastModel is equal to todayModel.forcastModel", (uint8_t *)&v19, 2u);
    }

  }
  else
  {
    -[WALockscreenWidgetViewController todayModel](self, "todayModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "forecastModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALockscreenWidgetViewController setCurrentForecastModel:](self, "setCurrentForecastModel:", v17);

    -[WALockscreenWidgetViewController _updateTodayView](self, "_updateTodayView");
  }

}

- (void)_updateTimerFired:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__WALockscreenWidgetViewController__updateTimerFired___block_invoke;
  v3[3] = &unk_24DD9D2F0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __54__WALockscreenWidgetViewController__updateTimerFired___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateWithReason:", CFSTR("Timer Fired!"));

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_scheduleNewTimer");

}

- (void)_scheduleNewTimer
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  id v7;

  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WALockscreenWidgetViewController updateInterval](self, "updateInterval");
    if (v4 > 0.0)
    {
      -[WALockscreenWidgetViewController _teardownTimer](self, "_teardownTimer");
      v5 = (void *)MEMORY[0x24BDBCF40];
      -[WALockscreenWidgetViewController updateInterval](self, "updateInterval");
      objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateTimerFired_, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WALockscreenWidgetViewController setUpdateTimer:](self, "setUpdateTimer:", v6);

      -[WALockscreenWidgetViewController updateTimer](self, "updateTimer");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTolerance:", 60.0);

    }
  }
}

- (void)_teardownTimer
{
  void *v3;

  -[WALockscreenWidgetViewController updateTimer](self, "updateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WALockscreenWidgetViewController setUpdateTimer:](self, "setUpdateTimer:", 0);
}

- (void)_setupWeatherModel
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  float v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (-[WALockscreenWidgetViewController shouldFakeWeather](self, "shouldFakeWeather"))
  {
    v3 = (void *)objc_opt_new();
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("FakePadWeatherLatitude"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("FakePadWeatherLongitude"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5)
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8)
    {
      v15 = -122.029488;
      v13 = 37.3333702;
    }
    else
    {
      objc_msgSend(v5, "floatValue");
      v13 = v12;
      objc_msgSend(v7, "floatValue");
      v15 = v14;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v13, v15);
    objc_msgSend(v3, "setGeoLocation:", v16);

    objc_msgSend(v4, "objectForKey:", CFSTR("FakePadWeatherDisplayName"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("Cupertino, CA");
    objc_msgSend(v3, "setDisplayName:", v19);

    +[WATodayModel modelWithLocation:](WATodayModel, "modelWithLocation:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALockscreenWidgetViewController setTodayModel:](self, "setTodayModel:", v20);

    -[WALockscreenWidgetViewController _updateWithReason:](self, "_updateWithReason:", CFSTR("We're faking the weather, so let's just get some data in here"));
  }
  else
  {
    v9 = (void *)objc_opt_new();
    +[WATodayModel autoupdatingLocationModelWithPreferences:effectiveBundleIdentifier:](WATodayModel, "autoupdatingLocationModelWithPreferences:effectiveBundleIdentifier:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WALockscreenWidgetViewController setTodayModel:](self, "setTodayModel:", v10);

    v11 = -[WALockscreenWidgetViewController locationServicesActive](self, "locationServicesActive");
    -[WALockscreenWidgetViewController todayModel](self, "todayModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocationServicesActive:", v11);
  }

  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "forecastModel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[WALockscreenWidgetViewController setCurrentForecastModel:](self, "setCurrentForecastModel:", v22);

  -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    -[WALockscreenWidgetViewController _updateTodayView](self, "_updateTodayView");
  -[WALockscreenWidgetViewController _scheduleNewTimer](self, "_scheduleNewTimer");
  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:", self);

}

- (void)_teardownWeatherModel
{
  void *v3;

  -[WALockscreenWidgetViewController todayModel](self, "todayModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WALockscreenWidgetViewController setTodayModel:](self, "setTodayModel:", 0);
}

- (BOOL)shouldFakeWeather
{
  void *v2;
  void *v3;
  char v4;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FakePadWeather"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_locationName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WALockscreenWidgetViewController shouldFakeWeather](self, "shouldFakeWeather")
    && (objc_msgSend(v3, "objectForKey:", CFSTR("FakePadWeatherDisplayName")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("FakePadWeatherDisplayName"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "city");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v5 = v8;
    }
    else
    {
      objc_msgSend(v6, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayName");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

- (id)_temperature
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (_temperature_onceToken != -1)
    dispatch_once(&_temperature_onceToken, &__block_literal_global_6);
  objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "temperatureUnit");
  objc_msgSend((id)_temperature_temperatureFormatter, "setOutputUnit:", v4);

  objc_msgSend((id)_temperature_temperatureFormatter, "setSymbolType:", !WAIsChinaSKUAndSimplifiedChinese());
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WALockscreenWidgetViewController shouldFakeWeather](self, "shouldFakeWeather")
    && (objc_msgSend(v5, "objectForKey:", CFSTR("FakePadWeatherConditionTemperature")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    v7 = (void *)_temperature_temperatureFormatter;
    objc_msgSend(v5, "objectForKey:", CFSTR("FakePadWeatherConditionTemperature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringForObjectValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentConditions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)_temperature_temperatureFormatter;
    objc_msgSend(v10, "temperature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForObjectValue:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

void __48__WALockscreenWidgetViewController__temperature__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_temperature_temperatureFormatter;
  _temperature_temperatureFormatter = v0;

}

- (id)_conditionsLine
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int IsSignificantForCategory;
  void *v27;
  void *v28;
  void *v29;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isV3Enabled");

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WALockscreenWidgetViewController shouldFakeWeather](self, "shouldFakeWeather");
  if (!v4)
  {
    if (!v6
      || (objc_msgSend(v5, "objectForKey:", CFSTR("FakePadWeatherConditionDescription")),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          !v17))
    {
      -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentConditions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "airQualityConditions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = WAAirQualityCategoryFromConditions();

      -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "location");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "countryAbbreviation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      IsSignificantForCategory = WAAirQualityIsSignificantForCategory(v22, v25);

      if (IsSignificantForCategory)
      {
        -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "location");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "countryAbbreviation");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        WAAirQualityDescriptionForCategory(v22, v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WAConditionsLineStringFromCurrentForecasts(v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_16;
    }
LABEL_9:
    objc_msgSend(v5, "objectForKey:", CFSTR("FakePadWeatherConditionDescription"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("FakePadWeatherConditionDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_9;
  }
  -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentConditions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "city");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "airQualityScaleCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "longDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        v14 = objc_msgSend(v11, "categoryIndex"),
        v15 = objc_msgSend(v11, "warningLevel"),
        v13,
        v14 > v15))
  {
    objc_msgSend(v11, "longDescription");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WAConditionsLineStringFromCurrentForecasts(v9);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v16;

LABEL_16:
  return v18;
}

- (id)_conditionsImage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WALockscreenWidgetViewController shouldFakeWeather](self, "shouldFakeWeather")
    && (objc_msgSend(v3, "objectForKey:", CFSTR("FakePadWeatherCondition")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("FakePadWeatherCondition"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

    WAImageForLegacyConditionCode(v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WALockscreenWidgetViewController currentForecastModel](self, "currentForecastModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentConditions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WAImageForLegacyConditionCode(objc_msgSend(v9, "conditionCode"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_delegateShouldUpdateForecast
{
  void (**v2)(_QWORD);
  char v3;
  _QWORD v5[5];
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  id location;

  objc_initWeak(&location, self);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__WALockscreenWidgetViewController__delegateShouldUpdateForecast__block_invoke;
  v5[3] = &unk_24DD9D318;
  objc_copyWeak(&v6, &location);
  v5[4] = &v7;
  v2 = (void (**)(_QWORD))MEMORY[0x220751644](v5);
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    v2[2](v2);
  else
    dispatch_sync(MEMORY[0x24BDAC9B8], v2);
  v3 = *((_BYTE *)v8 + 24);

  objc_destroyWeak(&v6);
  _Block_object_dispose(&v7, 8);
  objc_destroyWeak(&location);
  return v3;
}

void __65__WALockscreenWidgetViewController__delegateShouldUpdateForecast__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained(v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "widgetViewControllerShouldUpdateForecast:", v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
}

- (void)_delegateWillUpdate
{
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id location;

  -[WALockscreenWidgetViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__WALockscreenWidgetViewController__delegateWillUpdate__block_invoke;
    block[3] = &unk_24DD9D340;
    v5 = v3;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }

}

void __55__WALockscreenWidgetViewController__delegateWillUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "widgetViewControllerWillUpdate:", WeakRetained);

}

- (void)_delegateDidUpdate
{
  void *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id location;

  -[WALockscreenWidgetViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__WALockscreenWidgetViewController__delegateDidUpdate__block_invoke;
    block[3] = &unk_24DD9D340;
    v5 = v3;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }

}

void __54__WALockscreenWidgetViewController__delegateDidUpdate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "widgetViewControllerDidUpdate:", WeakRetained);

}

- (void)_delegateUpdateDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[WALockscreenWidgetViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __68__WALockscreenWidgetViewController__delegateUpdateDidFailWithError___block_invoke;
    v6[3] = &unk_24DD9D368;
    v7 = v5;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __68__WALockscreenWidgetViewController__delegateUpdateDidFailWithError___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "widgetViewController:failedToUpdateWithError:", WeakRetained, *(_QWORD *)(a1 + 40));

}

- (void)getLocationServicesAuthorizationStatus:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_3;
  block[3] = &unk_24DD9D3D8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

id __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke()
{
  if (WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_token_12 != -1)
    dispatch_once(&WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_token_12, &__block_literal_global_78);
  return (id)WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12;
}

void __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.weather.location-auth-status", 0);
  v1 = (void *)WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12;
  WALockscreenWidgetDidDisappearNotification_block_invoke_na_once_object_12 = (uint64_t)v0;

}

void __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_3(uint64_t a1)
{
  int v2;
  _QWORD v3[4];
  id v4;
  int v5;

  v2 = +[WeatherLocationManager locationManagerAuthorizationWithEffectiveBundleId:](WeatherLocationManager, "locationManagerAuthorizationWithEffectiveBundleId:", 0);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_4;
  v3[3] = &unk_24DD9D3B0;
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __75__WALockscreenWidgetViewController_getLocationServicesAuthorizationStatus___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (WATodayPadView)todayView
{
  return self->_todayView;
}

- (void)setTodayView:(id)a3
{
  objc_storeStrong((id *)&self->_todayView, a3);
}

- (BOOL)locationServicesActive
{
  return self->_locationServicesActive;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (WAWidgetDelegate)delegate
{
  return (WAWidgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WATodayModel)todayModel
{
  return self->_todayModel;
}

- (void)setTodayModel:(id)a3
{
  objc_storeStrong((id *)&self->_todayModel, a3);
}

- (WAForecastModel)currentForecastModel
{
  return self->_currentForecastModel;
}

- (void)setCurrentForecastModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (NSDate)updateLastCompletionDate
{
  return self->_updateLastCompletionDate;
}

- (void)setUpdateLastCompletionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateLastCompletionDate, 0);
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_currentForecastModel, 0);
  objc_storeStrong((id *)&self->_todayModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_todayView, 0);
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21AAEC000, a2, a3, "Update Received (Update Reason: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21AAEC000, a2, a3, "Update Ignored (not local weather city) (Update Reason: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__WALockscreenWidgetViewController__updateWithReason___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Update Error: %@ (Update Reason: %@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
