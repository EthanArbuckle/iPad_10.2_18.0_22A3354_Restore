@implementation SKUINearMeController

+ (id)sharedController
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        +[SKUINearMeController sharedController].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (sharedController_sOnce != -1)
    dispatch_once(&sharedController_sOnce, &__block_literal_global_41);
  return (id)sharedController_sNearMeController;
}

void __40__SKUINearMeController_sharedController__block_invoke()
{
  SKUINearMeController *v0;
  void *v1;

  v0 = objc_alloc_init(SKUINearMeController);
  v1 = (void *)sharedController_sNearMeController;
  sharedController_sNearMeController = (uint64_t)v0;

}

- (SKUINearMeController)init
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SKUINearMeController *v11;
  void *v12;
  void *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v3)
        -[SKUINearMeController init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUINearMeController;
  v11 = -[SKUINearMeController init](&v15, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__applicationWillEnterForeground_, *MEMORY[0x1E0DC4860], 0);
    +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v11);

  }
  return v11;
}

- (NSArray)items
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKUIItemStateCenter defaultCenter](SKUIItemStateCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "parentalControlsRank");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "parentalControlsRank", (_QWORD)v13) <= v5)
          objc_msgSend(v3, "addObject:", v11);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return (NSArray *)v3;
}

- (BOOL)isNearMeLocationStatusEnabled
{
  uint64_t v2;
  int v3;

  v2 = SKUICoreLocationFramework();
  v3 = objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v2), "authorizationStatus");
  return SKUINearMeIsEnabledForAuthorizationStatus(v3);
}

- (void)_applicationWillEnterForeground:(id)a3
{
  if (self->_refreshTimer)
    -[SKUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation", a3);
}

- (void)itemStateCenterRestrictionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SKUINearMeController_itemStateCenterRestrictionsChanged___block_invoke;
  block[3] = &unk_1E739FD38;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __59__SKUINearMeController_itemStateCenterRestrictionsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setItems:responseDictionary:error:status:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 0, 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  SKUIClientContext *clientContext;
  void *v11;
  SKUIClientContext *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (SKUINearMeIsEnabledForAuthorizationStatus(a4))
  {
    -[SKUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation");
  }
  else if (a4)
  {
    -[SKUINearMeController _disableNearMe](self, "_disableNearMe");
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("nearMeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", SKUINearMeIsEnabledForAuthorizationStatus(a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SKUINearMeLocationStatusDidChangeNotification"), v8);

  if (a4 == 2 && !self->_authorizationStatus)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DC3458]);
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("NEAR_ME_LOCATION_ALERT"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("NEAR_ME_LOCATION_ALERT"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v11);

    v12 = self->_clientContext;
    if (v12)
      -[SKUIClientContext localizedStringForKey:](v12, "localizedStringForKey:", CFSTR("OK"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("OK"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCancelButtonIndex:", objc_msgSend(v9, "addButtonWithTitle:", v13));

    objc_msgSend(v9, "show");
  }
  self->_authorizationStatus = a4;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (objc_msgSend(a4, "code", a3) == 1)
    -[SKUINearMeController _disableNearMe](self, "_disableNearMe");
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "count");
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalAccuracy");
    if (v8 > 0.00000011920929 && v8 <= 65.0 && SKUILocationIsAccurate(v7))
      -[SKUINearMeController _lookupItemsForLocation:](self, "_lookupItemsForLocation:", v7);

    v6 = v9;
  }

}

- (void)_startMonitoringLocation
{
  uint64_t v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  void *v6;
  double *v7;
  int v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *locationTimeoutTimer;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[SKUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  if (!self->_isMonitoring && !self->_lookupRequest)
  {
    if (!self->_locationManager)
    {
      v3 = SKUICoreLocationFramework();
      v4 = (CLLocationManager *)objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("CLLocationManager"), v3));
      locationManager = self->_locationManager;
      self->_locationManager = v4;

      -[CLLocationManager setDelegate:](self->_locationManager, "setDelegate:", self);
      v6 = (void *)SKUICoreLocationFramework();
      v7 = (double *)SKUIWeakLinkedSymbolForString("kCLLocationAccuracyBest", v6);
      if (v7)
        -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", *v7);
    }
    v8 = objc_msgSend((id)objc_opt_class(), "authorizationStatus");
    self->_authorizationStatus = v8;
    if (!v8)
      -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    self->_isMonitoring = 1;
    if (!self->_locationTimeoutTimer)
    {
      objc_initWeak(&location, self);
      v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
      locationTimeoutTimer = self->_locationTimeoutTimer;
      self->_locationTimeoutTimer = v9;

      v11 = self->_locationTimeoutTimer;
      v12 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(v11, v12, 0, 0);
      v13 = self->_locationTimeoutTimer;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__SKUINearMeController__startMonitoringLocation__block_invoke;
      v14[3] = &unk_1E739FF68;
      objc_copyWeak(&v15, &location);
      dispatch_source_set_event_handler(v13, v14);
      dispatch_resume((dispatch_object_t)self->_locationTimeoutTimer);
      self->_locationTimeoutCount = 0;
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __48__SKUINearMeController__startMonitoringLocation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_monitorLocationTimeout");

}

- (void)_stopMonitoringLocation
{
  NSObject *locationTimeoutTimer;
  OS_dispatch_source *v4;

  if (self->_isMonitoring)
  {
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    self->_isMonitoring = 0;
  }
  locationTimeoutTimer = self->_locationTimeoutTimer;
  if (locationTimeoutTimer)
  {
    dispatch_source_cancel(locationTimeoutTimer);
    v4 = self->_locationTimeoutTimer;
    self->_locationTimeoutTimer = 0;

  }
}

- (void)_monitorLocationTimeout
{
  void *v3;
  int64_t locationTimeoutCount;
  NSObject *locationTimeoutTimer;
  dispatch_time_t v6;
  id v7;

  -[CLLocationManager location](self->_locationManager, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (v3 && SKUILocationIsAccurate(v3))
  {
    -[SKUINearMeController _lookupItemsForLocation:](self, "_lookupItemsForLocation:", v7);
  }
  else
  {
    locationTimeoutCount = self->_locationTimeoutCount;
    self->_locationTimeoutCount = locationTimeoutCount + 1;
    if (locationTimeoutCount > 2)
    {
      -[SKUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
      -[SKUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", MEMORY[0x1E0C9AA60], 0, 0, 2);
      -[SKUINearMeController _startRefreshTimer](self, "_startRefreshTimer");
    }
    else
    {
      locationTimeoutTimer = self->_locationTimeoutTimer;
      v6 = dispatch_time(0, 2500000000);
      dispatch_source_set_timer(locationTimeoutTimer, v6, 0, 0);
    }
  }

}

- (void)_lookupItemsForLocation:(id)a3
{
  id v4;
  SSLookupRequest *v5;
  SSLookupRequest *lookupRequest;
  SSLookupRequest *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[SKUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
  -[SKUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  if (!self->_lookupRequest)
  {
    objc_initWeak(&location, self);
    v5 = (SSLookupRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF550]), "initWithLocation:", v4);
    lookupRequest = self->_lookupRequest;
    self->_lookupRequest = v5;

    -[SSLookupRequest setKeyProfile:](self->_lookupRequest, "setKeyProfile:", *MEMORY[0x1E0DAFA90]);
    v7 = self->_lookupRequest;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SKUINearMeController__lookupItemsForLocation___block_invoke;
    v8[3] = &unk_1E73A1E90;
    objc_copyWeak(&v9, &location);
    -[SSLookupRequest startWithLookupBlock:](v7, "startWithLookupBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __48__SKUINearMeController__lookupItemsForLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  SKUISearchItem *v12;
  void *v13;
  SKUISearchItem *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v18 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "allItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        v12 = [SKUISearchItem alloc];
        objc_msgSend(v11, "lookupDictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SKUISearchItem initWithLookupDictionary:](v12, "initWithLookupDictionary:", v13);

        if (v14)
          objc_msgSend(v5, "addObject:", v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SKUINearMeController__lookupItemsForLocation___block_invoke_2;
  block[3] = &unk_1E739FE28;
  objc_copyWeak(&v24, (id *)(a1 + 32));
  v21 = v5;
  v22 = v4;
  v23 = v18;
  v15 = v18;
  v16 = v4;
  v17 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v24);
}

void __48__SKUINearMeController__lookupItemsForLocation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_finishLookupWithItems:response:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_finishLookupWithItems:(id)a3 response:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  SSLookupRequest *lookupRequest;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "responseDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", v9, v10, v8, 1);

  -[SKUINearMeController _startRefreshTimer](self, "_startRefreshTimer");
  lookupRequest = self->_lookupRequest;
  self->_lookupRequest = 0;

}

- (void)_startRefreshTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *refreshTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_refreshTimer)
  {
    objc_initWeak(&location, self);
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v3;

    v5 = self->_refreshTimer;
    v6 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v5, v6, 0, 0);
    v7 = self->_refreshTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __42__SKUINearMeController__startRefreshTimer__block_invoke;
    v8[3] = &unk_1E739FF68;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v7, v8);
    dispatch_resume((dispatch_object_t)self->_refreshTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __42__SKUINearMeController__startRefreshTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshTimeout");

}

- (void)_stopRefreshTimer
{
  NSObject *refreshTimer;
  OS_dispatch_source *v4;

  refreshTimer = self->_refreshTimer;
  if (refreshTimer)
  {
    dispatch_source_cancel(refreshTimer);
    v4 = self->_refreshTimer;
    self->_refreshTimer = 0;

  }
}

- (void)_refreshTimeout
{
  -[SKUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  -[SKUINearMeController _startMonitoringLocation](self, "_startMonitoringLocation");
}

- (void)_setItems:(id)a3 responseDictionary:(id)a4 error:(id)a5 status:(int64_t)a6
{
  NSArray *v9;
  NSDictionary *v10;
  NSArray *items;
  NSArray *v12;
  NSDictionary *responseDictionary;
  NSDictionary *v14;
  id v15;

  v9 = (NSArray *)a3;
  v10 = (NSDictionary *)a4;
  items = self->_items;
  self->_items = v9;
  v12 = v9;

  self->_status = a6;
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v10;
  v14 = v10;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "postNotificationName:object:", CFSTR("SKUINearMeItemsDidChangeNotification"), self);
}

- (void)_disableNearMe
{
  -[SKUINearMeController _stopMonitoringLocation](self, "_stopMonitoringLocation");
  -[SKUINearMeController _stopRefreshTimer](self, "_stopRefreshTimer");
  -[SKUINearMeController _setItems:responseDictionary:error:status:](self, "_setItems:responseDictionary:error:status:", 0, 0, 0, 0);
}

- (int64_t)status
{
  return self->_status;
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_locationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_lookupRequest, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

+ (void)sharedController
{
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  OUTLINED_FUNCTION_1();
}

@end
