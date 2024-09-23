@implementation SOSPersistentTimerLocationManager

+ (SOSPersistentTimerLocationManager)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_8);
  return (SOSPersistentTimerLocationManager *)(id)sharedInstance_sSOSPersistentTimerLocationManager;
}

void __51__SOSPersistentTimerLocationManager_sharedInstance__block_invoke()
{
  SOSPersistentTimerLocationManager *v0;
  void *v1;

  v0 = objc_alloc_init(SOSPersistentTimerLocationManager);
  v1 = (void *)sharedInstance_sSOSPersistentTimerLocationManager;
  sharedInstance_sSOSPersistentTimerLocationManager = (uint64_t)v0;

}

- (SOSPersistentTimerLocationManager)init
{
  SOSPersistentTimerLocationManager *v2;
  id v3;
  void *v4;
  uint64_t v5;
  CLLocationManager *locationManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SOSPersistentTimerLocationManager;
  v2 = -[SOSPersistentTimerLocationManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    +[SOSUtilities sosLocationBundle](SOSUtilities, "sosLocationBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithEffectiveBundle:delegate:onQueue:", v4, v2, MEMORY[0x1E0C80D38]);
    locationManager = v2->_locationManager;
    v2->_locationManager = (CLLocationManager *)v5;

    -[CLLocationManager setDesiredAccuracy:](v2->_locationManager, "setDesiredAccuracy:", *MEMORY[0x1E0C9E490]);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SOSPersistentTimerLocationManager invalidateTimer](self, "invalidateTimer");
  -[SOSPersistentTimerLocationManager invalidateInitialTimer](self, "invalidateInitialTimer");
  -[PCPersistentTimer invalidate](self->_assertionTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SOSPersistentTimerLocationManager;
  -[SOSPersistentTimerLocationManager dealloc](&v3, sel_dealloc);
}

- (void)warmUpLocationRequest
{
  NSObject *v3;
  CLLocation *lastLocation;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SOSPersistentTimerLocationManager warmUpLocationRequest]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - Warming up location request", (uint8_t *)&v5, 0xCu);
  }

  -[SOSPersistentTimerLocationManager invalidateInitialTimer](self, "invalidateInitialTimer");
  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  -[SOSPersistentTimerLocationManager requestLocation](self, "requestLocation");
}

- (void)requestLocation
{
  NSObject *v3;
  NSObject *v4;
  PCPersistentTimer *v5;
  PCPersistentTimer *requestLocationsTimer;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOSPersistentTimerLocationManager requestLocation]";
    v9 = 1024;
    v10 = -[SOSPersistentTimerLocationManager isRequestingLocation](self, "isRequestingLocation");
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - Requesting location; self.isRequestingLocation: %d",
      (uint8_t *)&v7,
      0x12u);
  }

  if (!-[SOSPersistentTimerLocationManager isRequestingLocation](self, "isRequestingLocation"))
  {
    -[SOSPersistentTimerLocationManager setRequestingLocation:](self, "setRequestingLocation:", 1);
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
  }
  -[SOSPersistentTimerLocationManager invalidateRequestLocationsTimer](self, "invalidateRequestLocationsTimer");
  if (-[SOSPersistentTimerLocationManager shouldStopRequestingLocationAfterCallback](self, "shouldStopRequestingLocationAfterCallback"))
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "-[SOSPersistentTimerLocationManager requestLocation]";
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "%s - starting _requestLocationsTimer", (uint8_t *)&v7, 0xCu);
    }

    v5 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.sos.locationManager"), self, sel__requestLocationsTimeout_, 0, 35.0);
    requestLocationsTimer = self->_requestLocationsTimer;
    self->_requestLocationsTimer = v5;

  }
}

- (void)_requestLocationsTimeout:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOSPersistentTimerLocationManager _requestLocationsTimeout:]";
    v8 = 2048;
    v9 = 0x4041800000000000;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "%s - Timing out after requesting location for %f seconds", (uint8_t *)&v6, 0x16u);
  }

  -[SOSPersistentTimerLocationManager stopRequestingLocationUpdates](self, "stopRequestingLocationUpdates");
  if (-[SOSPersistentTimerLocationManager isValid](self, "isValid"))
  {
    -[SOSPersistentTimerLocationManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sosPersistentTimerLocationManagerTimerFired:location:", self, self->_lastLocation);

  }
}

- (void)invalidateRequestLocationsTimer
{
  NSObject *v3;
  PCPersistentTimer *requestLocationsTimer;
  PCPersistentTimer *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PCPersistentTimer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    requestLocationsTimer = self->_requestLocationsTimer;
    v6 = 136315394;
    v7 = "-[SOSPersistentTimerLocationManager invalidateRequestLocationsTimer]";
    v8 = 2112;
    v9 = requestLocationsTimer;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - _requestLocationsTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  -[PCPersistentTimer invalidate](self->_requestLocationsTimer, "invalidate");
  v5 = self->_requestLocationsTimer;
  self->_requestLocationsTimer = 0;

}

- (void)stopRequestingLocationUpdates
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SOSPersistentTimerLocationManager stopRequestingLocationUpdates]";
    v6 = 1024;
    v7 = -[SOSPersistentTimerLocationManager isRequestingLocation](self, "isRequestingLocation");
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - self.isRequestingLocation: %d", (uint8_t *)&v4, 0x12u);
  }

  if (-[SOSPersistentTimerLocationManager isRequestingLocation](self, "isRequestingLocation"))
  {
    -[SOSPersistentTimerLocationManager setRequestingLocation:](self, "setRequestingLocation:", 0);
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  }
}

- (void)_startTimer
{
  PCPersistentTimer *v3;
  PCPersistentTimer *locationUpdateTimer;
  NSObject *v5;
  PCPersistentTimer *v6;
  PCPersistentTimer *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  PCPersistentTimer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[SOSPersistentTimerLocationManager invalidateTimer](self, "invalidateTimer");
  v3 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.sos.locationManager"), self, sel__sosPersistentTimerLocationManagerTic_, 0, self->_ti);
  locationUpdateTimer = self->_locationUpdateTimer;
  self->_locationUpdateTimer = v3;

  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = self->_locationUpdateTimer;
    v9 = 136315394;
    v10 = "-[SOSPersistentTimerLocationManager _startTimer]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s - _locationUpdateTimer: %@", (uint8_t *)&v9, 0x16u);
  }

  -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_locationUpdateTimer, "setMinimumEarlyFireProportion:", 1.0);
  v7 = self->_locationUpdateTimer;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v7, "scheduleInRunLoop:", v8);

}

- (void)fireAndStartTimertWithTimeInterval:(double)a3
{
  NSObject *v5;
  CLLocation *lastLocation;
  void *v7;
  int v8;
  void *v9;
  PCPersistentTimer *v10;
  PCPersistentTimer *initalRequestTimer;
  NSObject *v12;
  PCPersistentTimer *v13;
  PCPersistentTimer *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    lastLocation = self->_lastLocation;
    v15 = 136315394;
    v16 = "-[SOSPersistentTimerLocationManager fireAndStartTimertWithTimeInterval:]";
    v17 = 2112;
    v18 = lastLocation;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s - _lastLocation: %@", (uint8_t *)&v15, 0x16u);
  }

  self->_ti = a3;
  -[SOSPersistentTimerLocationManager _startTimer](self, "_startTimer");
  if (self->_lastLocation
    && (-[SOSPersistentTimerLocationManager delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "locationIsValidToSend:", self->_lastLocation),
        v7,
        v8))
  {
    -[SOSPersistentTimerLocationManager stopRequestingLocationUpdates](self, "stopRequestingLocationUpdates");
    -[SOSPersistentTimerLocationManager delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sosPersistentTimerLocationManagerTimerFired:location:", self, self->_lastLocation);
  }
  else
  {
    if (!-[SOSPersistentTimerLocationManager isRequestingLocation](self, "isRequestingLocation"))
      -[SOSPersistentTimerLocationManager requestLocation](self, "requestLocation");
    -[SOSPersistentTimerLocationManager invalidateInitialTimer](self, "invalidateInitialTimer");
    v10 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.sos.locationManager.initialRequest"), self, sel__sosPersistentTimerInitialRequest_, 0, 20.0);
    initalRequestTimer = self->_initalRequestTimer;
    self->_initalRequestTimer = v10;

    sos_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_initalRequestTimer;
      v15 = 136315394;
      v16 = "-[SOSPersistentTimerLocationManager fireAndStartTimertWithTimeInterval:]";
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "%s - Created _initalRequestTimer: %@", (uint8_t *)&v15, 0x16u);
    }

    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_initalRequestTimer, "setMinimumEarlyFireProportion:", 1.0);
    v14 = self->_initalRequestTimer;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCPersistentTimer scheduleInRunLoop:](v14, "scheduleInRunLoop:", v9);
  }

}

- (void)invalidateTimer
{
  NSObject *v3;
  PCPersistentTimer *locationUpdateTimer;
  PCPersistentTimer *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PCPersistentTimer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    locationUpdateTimer = self->_locationUpdateTimer;
    v6 = 136315394;
    v7 = "-[SOSPersistentTimerLocationManager invalidateTimer]";
    v8 = 2112;
    v9 = locationUpdateTimer;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - _locationUpdateTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  -[PCPersistentTimer invalidate](self->_locationUpdateTimer, "invalidate");
  v5 = self->_locationUpdateTimer;
  self->_locationUpdateTimer = 0;

}

- (void)invalidateInitialTimer
{
  NSObject *v3;
  PCPersistentTimer *initalRequestTimer;
  PCPersistentTimer *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PCPersistentTimer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    initalRequestTimer = self->_initalRequestTimer;
    v6 = 136315394;
    v7 = "-[SOSPersistentTimerLocationManager invalidateInitialTimer]";
    v8 = 2112;
    v9 = initalRequestTimer;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - _initalRequestTimer: %@", (uint8_t *)&v6, 0x16u);
  }

  -[PCPersistentTimer invalidate](self->_initalRequestTimer, "invalidate");
  v5 = self->_initalRequestTimer;
  self->_initalRequestTimer = 0;

}

- (BOOL)isValid
{
  return -[PCPersistentTimer isValid](self->_locationUpdateTimer, "isValid");
}

- (void)_sosPersistentTimerInitialRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOSPersistentTimerLocationManager _sosPersistentTimerInitialRequest:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s - _initalRequestTimer fired: %@", (uint8_t *)&v7, 0x16u);
  }

  -[SOSPersistentTimerLocationManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sosPersistentTimerLocationManagerTimerFired:location:", self, self->_lastLocation);

  -[SOSPersistentTimerLocationManager invalidateInitialTimer](self, "invalidateInitialTimer");
}

- (void)_sosPersistentTimerLocationManagerTic:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[SOSPersistentTimerLocationManager _sosPersistentTimerLocationManagerTic:]";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s - timer: %@", (uint8_t *)&v7, 0x16u);
  }

  -[SOSPersistentTimerLocationManager requestLocation](self, "requestLocation");
  -[SOSPersistentTimerLocationManager _startTimer](self, "_startTimer");
  -[SOSPersistentTimerLocationManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sosPersistentTimerLocationManagerTimerFired:location:", self, self->_lastLocation);

}

- (void)setRequestingLocation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 requestingLocation;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_requestingLocation != a3)
  {
    self->_requestingLocation = a3;
    if (a3)
    {
      v4 = (void *)MEMORY[0x1E0C9E370];
      +[SOSUtilities sosLocationBundle](SOSUtilities, "sosLocationBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "newAssertionForBundle:withReason:", v5, CFSTR("com.apple.sos.locationManager"));
      -[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:](self, "setForceEnableLocationAssertion:", v6);

    }
    else
    {
      -[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:](self, "setForceEnableLocationAssertion:", 0);
    }
    sos_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      requestingLocation = self->_requestingLocation;
      v9 = 136315394;
      v10 = "-[SOSPersistentTimerLocationManager setRequestingLocation:]";
      v11 = 1024;
      v12 = requestingLocation;
      _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "%s - Updated _requestingLocation to %d", (uint8_t *)&v9, 0x12u);
    }

  }
}

- (void)setForceEnableLocationAssertion:(id)a3
{
  CLAssertion *v5;
  NSObject *v6;
  CLAssertion *forceEnableLocationAssertion;
  CLAssertion **p_forceEnableLocationAssertion;
  PCPersistentTimer *assertionTimer;
  NSObject *v10;
  PCPersistentTimer *v11;
  PCPersistentTimer *v12;
  PCPersistentTimer *v13;
  void *v14;
  NSObject *v15;
  CLAssertion *v16;
  int v17;
  const char *v18;
  __int16 v19;
  CLAssertion *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (CLAssertion *)a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "%s - forceEnableLocationAssertion", (uint8_t *)&v17, 0xCu);
  }

  p_forceEnableLocationAssertion = &self->_forceEnableLocationAssertion;
  forceEnableLocationAssertion = self->_forceEnableLocationAssertion;
  if (forceEnableLocationAssertion != v5)
  {
    if (forceEnableLocationAssertion)
    {
      -[CLAssertion invalidate](forceEnableLocationAssertion, "invalidate");
      -[PCPersistentTimer invalidate](self->_assertionTimer, "invalidate");
      assertionTimer = self->_assertionTimer;
      self->_assertionTimer = 0;

    }
    objc_storeStrong((id *)&self->_forceEnableLocationAssertion, a3);
    if (*p_forceEnableLocationAssertion)
    {
      sos_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315138;
        v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
        _os_log_impl(&dword_1AF4DC000, v10, OS_LOG_TYPE_DEFAULT, "%s - Setting up new location _assertionTimer", (uint8_t *)&v17, 0xCu);
      }

      -[PCPersistentTimer invalidate](self->_assertionTimer, "invalidate");
      v11 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.sos.locationManager"), self, sel__emergencyLocationAssertionTimeOut_, 0, 60.0);
      v12 = self->_assertionTimer;
      self->_assertionTimer = v11;

      -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_assertionTimer, "setMinimumEarlyFireProportion:", 1.0);
      v13 = self->_assertionTimer;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PCPersistentTimer scheduleInRunLoop:](v13, "scheduleInRunLoop:", v14);

    }
    sos_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *p_forceEnableLocationAssertion;
      v17 = 136315394;
      v18 = "-[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:]";
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "%s - Created new _forceEnableLocationAssertion: %@", (uint8_t *)&v17, 0x16u);
    }

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SOSPersistentTimerLocationManager locationManager:didUpdateLocations:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "%s - didUpdateLocations: %@", buf, 0x16u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SOSPersistentTimerLocationManager_locationManager_didUpdateLocations___block_invoke;
  v7[3] = &unk_1E5F76DB8;
  v7[4] = self;
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

void __72__SOSPersistentTimerLocationManager_locationManager_didUpdateLocations___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  sos_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[SOSPersistentTimerLocationManager locationManager:didUpdateLocations:]_block_invoke";
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "%s - location: %@", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "locationIsValidToSend:", v7);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), a2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invalidate");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 56);
    *(_QWORD *)(v11 + 56) = 0;

    if (objc_msgSend(*(id *)(a1 + 32), "shouldStopRequestingLocationAfterCallback"))
    {
      objc_msgSend(*(id *)(a1 + 32), "stopRequestingLocationUpdates");
      objc_msgSend(*(id *)(a1 + 32), "invalidateRequestLocationsTimer");
      if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sosPersistentTimerLocationManagerTimerFired:location:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));

        objc_msgSend(*(id *)(a1 + 32), "invalidateInitialTimer");
      }
    }
    *a4 = 1;
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] CLLocationManager error: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)_emergencyLocationAssertionTimeOut:(id)a3
{
  NSObject *v4;
  PCPersistentTimer *assertionTimer;
  uint8_t v6[16];

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "locationManager _emergencyLocationAssertionTimeOut", v6, 2u);
  }

  assertionTimer = self->_assertionTimer;
  self->_assertionTimer = 0;

  -[SOSPersistentTimerLocationManager stopRequestingLocationUpdates](self, "stopRequestingLocationUpdates");
  -[SOSPersistentTimerLocationManager setForceEnableLocationAssertion:](self, "setForceEnableLocationAssertion:", 0);
}

- (BOOL)isRequestingLocation
{
  return self->_requestingLocation;
}

- (SOSPersistentTimerLocationManagerDelegate)delegate
{
  return (SOSPersistentTimerLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CLAssertion)forceEnableLocationAssertion
{
  return self->_forceEnableLocationAssertion;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_forceEnableLocationAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assertionTimer, 0);
  objc_storeStrong((id *)&self->_initalRequestTimer, 0);
  objc_storeStrong((id *)&self->_requestLocationsTimer, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locationUpdateStartQueue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
