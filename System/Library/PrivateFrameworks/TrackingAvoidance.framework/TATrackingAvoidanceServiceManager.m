@implementation TATrackingAvoidanceServiceManager

- (void)ingestTAEvent:(id)a3
{
  id v4;
  id v5;
  TATrackingAvoidanceService *service;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    switch(objc_msgSend(v5, "systemStateType"))
    {
      case 3:
        -[TATrackingAvoidanceServiceManager _onAirplaneMode:](self, "_onAirplaneMode:", objc_msgSend(v5, "isOn"));
        break;
      case 4:
        -[TATrackingAvoidanceServiceManager _onBatterySaverMode:](self, "_onBatterySaverMode:", objc_msgSend(v5, "isOn"));
        break;
      case 7:
        -[TATrackingAvoidanceServiceManager _onHighThermalState:](self, "_onHighThermalState:", objc_msgSend(v5, "isOn"));
        break;
      case 8:
        -[TATrackingAvoidanceServiceManager _onLocationServicesEnabled:](self, "_onLocationServicesEnabled:", objc_msgSend(v5, "isOn"));
        break;
      case 9:
        -[TATrackingAvoidanceServiceManager _onLocationSimulationInProgress:](self, "_onLocationSimulationInProgress:", objc_msgSend(v5, "isOn"));
        break;
      case 10:
        -[TATrackingAvoidanceServiceManager _onAllowSimulatedEvents:](self, "_onAllowSimulatedEvents:", objc_msgSend(v5, "isOn"));
        break;
      case 11:
        -[TATrackingAvoidanceServiceManager _onDeviceUnlockedSinceBoot:](self, "_onDeviceUnlockedSinceBoot:", objc_msgSend(v5, "isOn"));
        break;
      case 12:
        -[TATrackingAvoidanceServiceManager _onLocationAndPrivacyReset:](self, "_onLocationAndPrivacyReset:", objc_msgSend(v5, "isOn"));
        break;
      case 13:
        -[TATrackingAvoidanceServiceManager _onHasKoreaCountryCode:](self, "_onHasKoreaCountryCode:", objc_msgSend(v5, "isOn"));
        break;
      case 14:
        -[TATrackingAvoidanceServiceManager _onUserLocationInsideKorea:](self, "_onUserLocationInsideKorea:", objc_msgSend(v5, "isOn"));
        break;
      default:
        break;
    }

  }
  service = self->_service;
  if (service)
  {
    -[TATrackingAvoidanceService ingestTAEvent:](service, "ingestTAEvent:", v4);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager ingestTAEvent:].cold.1();
  }

}

- (TATrackingAvoidanceServiceManager)initWithQueue:(id)a3 settings:(id)a4
{
  id v7;
  id v8;
  TATrackingAvoidanceServiceManager *v9;
  uint64_t v10;
  NSHashTable *observers;
  uint64_t v12;
  NSHashTable *dataSources;
  TATrackingAvoidanceService *service;
  TATrackingAvoidanceServiceStateContext *v15;
  TATrackingAvoidanceServiceStateContext *stateContext;
  TAPersistenceManager *v17;
  void *v18;
  uint64_t v19;
  TAPersistenceManager *persistenceManager;
  uint64_t v21;
  NSUUID *sessionID;
  TAAnalyticsManager *v23;
  void *v24;
  uint64_t v25;
  TAAnalyticsManager *analyticsManager;
  RTRoutineManager *v27;
  RTRoutineManager *routineManager;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)TATrackingAvoidanceServiceManager;
  v9 = -[TATrackingAvoidanceServiceManager init](&v30, sel_init);
  if (v9)
  {
    TARegisterLogs();
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v12 = objc_claimAutoreleasedReturnValue();
    dataSources = v9->_dataSources;
    v9->_dataSources = (NSHashTable *)v12;

    service = v9->_service;
    v9->_service = 0;

    v9->_state = 0;
    v15 = objc_alloc_init(TATrackingAvoidanceServiceStateContext);
    stateContext = v9->_stateContext;
    v9->_stateContext = v15;

    v17 = [TAPersistenceManager alloc];
    objc_msgSend(v8, "persistenceManagerSettings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TAPersistenceManager initWithSettings:](v17, "initWithSettings:", v18);
    persistenceManager = v9->_persistenceManager;
    v9->_persistenceManager = (TAPersistenceManager *)v19;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    sessionID = v9->_sessionID;
    v9->_sessionID = (NSUUID *)v21;

    v23 = [TAAnalyticsManager alloc];
    objc_msgSend(v8, "analyticsManagerSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[TAAnalyticsManager initWithSettings:](v23, "initWithSettings:", v24);
    analyticsManager = v9->_analyticsManager;
    v9->_analyticsManager = (TAAnalyticsManager *)v25;

    v27 = (RTRoutineManager *)objc_alloc_init(MEMORY[0x24BE27ED0]);
    routineManager = v9->_routineManager;
    v9->_routineManager = v27;

    -[TATrackingAvoidanceServiceManager addObserver:](v9, "addObserver:", v9);
    -[TATrackingAvoidanceServiceManager addObserver:](v9, "addObserver:", v9->_analyticsManager);
    -[TAPersistenceManager addObserver:](v9->_persistenceManager, "addObserver:", v9->_analyticsManager);
    -[TATrackingAvoidanceServiceManager onUpdatedSettings:](v9, "onUpdatedSettings:", v8);
  }

  return v9;
}

- (void)_onServiceEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received service enable notification\", \"serviceEnabled\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setServiceEnabled:](self->_stateContext, "setServiceEnabled:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onHighThermalState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received thermal state notification\", \"isHighThermalState\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setHighThermalState:](self->_stateContext, "setHighThermalState:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onAirplaneMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received airplane mode notification\", \"airplaneMode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setAirplaneMode:](self->_stateContext, "setAirplaneMode:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onBatterySaverMode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received battery saver mode notification\", \"batterySaverMode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setBatterySaverMode:](self->_stateContext, "setBatterySaverMode:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onLocationServicesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location services notification\", \"locationServicesEnabled\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setLocationServicesEnabled:](self->_stateContext, "setLocationServicesEnabled:", v3);
  if (!v3)
  {
    -[TAPersistenceManager reset](self->_persistenceManager, "reset");
    -[TATrackingAvoidanceServiceStateContext setRestartRequired:](self->_stateContext, "setRestartRequired:", 1);
  }
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onLocationSimulationInProgress:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location simulation notification\", \"locationSimulationInProgress\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setLocationSimulationInProgress:](self->_stateContext, "setLocationSimulationInProgress:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onAllowSimulatedEvents:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received allow simulated events notification\", \"allowSimulatedEvents\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setAllowSimulatedEvents:](self->_stateContext, "setAllowSimulatedEvents:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onDeviceUnlockedSinceBoot:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received device unlocked since boot notification\", \"deviceUnlockedSinceBoot\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setDeviceUnlockedSinceBoot:](self->_stateContext, "setDeviceUnlockedSinceBoot:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onLocationAndPrivacyReset:(BOOL)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_217877000, v4, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received location and privacy reset notification. Resetting persistence store and restarting service.\"}", (uint8_t *)v5, 0x12u);
  }
  -[TAPersistenceManager reset](self->_persistenceManager, "reset");
  -[TATrackingAvoidanceServiceStateContext setRestartRequired:](self->_stateContext, "setRestartRequired:", 1);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onHasKoreaCountryCode:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received country code notification\", \"hasKoreaCountryCode\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setHasKoreaCountryCode:](self->_stateContext, "setHasKoreaCountryCode:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)_onUserLocationInsideKorea:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 1026;
    v10 = v3;
    _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ut received user location inside Korea notification\", \"userLocationInsideKorea\":%{public}hhd}", (uint8_t *)v6, 0x18u);
  }
  -[TATrackingAvoidanceServiceStateContext setUserLocationInsideKorea:](self->_stateContext, "setUserLocationInsideKorea:", v3);
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");
}

- (void)onUpdatedSettings:(id)a3
{
  id v5;
  _BOOL8 v6;
  _BOOL4 v7;

  v5 = a3;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    -[TATrackingAvoidanceServiceManager onUpdatedSettings:].cold.3();
  if (!self->_serviceSettings || (objc_msgSend(v5, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_serviceSettings, a3);
    -[TATrackingAvoidanceServiceStateContext setServiceEnabled:](self->_stateContext, "setServiceEnabled:", -[TASettings trackingAvoidanceEnabled](self->_serviceSettings, "trackingAvoidanceEnabled"));
    v6 = -[TATrackingAvoidanceServiceStateContext serviceEnabled](self->_stateContext, "serviceEnabled");
    v7 = os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG);
    if (v6)
    {
      if (v7)
        -[TATrackingAvoidanceServiceManager onUpdatedSettings:].cold.1();
    }
    else if (v7)
    {
      -[TATrackingAvoidanceServiceManager onUpdatedSettings:].cold.2();
    }
    -[TATrackingAvoidanceServiceStateContext setRestartRequired:](self->_stateContext, "setRestartRequired:", v6);
  }
  -[TATrackingAvoidanceServiceManager _handleStateUpdateIfNecessary](self, "_handleStateUpdateIfNecessary");

}

- (BOOL)_shouldSuspendAvengerScanner
{
  return -[TATrackingAvoidanceServiceStateContext highThermalState](self->_stateContext, "highThermalState");
}

- (BOOL)_shouldTerminateService
{
  return !-[TATrackingAvoidanceServiceStateContext serviceEnabled](self->_stateContext, "serviceEnabled")
      || -[TATrackingAvoidanceServiceStateContext airplaneMode](self->_stateContext, "airplaneMode")
      || !-[TATrackingAvoidanceServiceStateContext locationServicesEnabled](self->_stateContext, "locationServicesEnabled")|| !self->_serviceSettings|| !-[TATrackingAvoidanceServiceStateContext allowSimulatedEvents](self->_stateContext, "allowSimulatedEvents")&& -[TATrackingAvoidanceServiceStateContext locationSimulationInProgress](self->_stateContext, "locationSimulationInProgress")|| !-[TATrackingAvoidanceServiceStateContext deviceUnlockedSinceBoot](self->_stateContext, "deviceUnlockedSinceBoot")|| -[TATrackingAvoidanceServiceStateContext hasKoreaCountryCode](self->_stateContext, "hasKoreaCountryCode")|| -[TATrackingAvoidanceServiceStateContext userLocationInsideKorea](self->_stateContext, "userLocationInsideKorea");
}

- (void)_handleStateUpdateIfNecessary
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = a1;
  +[TATrackingAvoidanceServiceManager managerStateToString:](TATrackingAvoidanceServiceManager, "managerStateToString:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_4(&dword_217877000, v3, v4, "#ut no state update necessary at %@ state", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_4();
}

- (void)_setState:(unint64_t)a3
{
  if (self->_state != a3)
    self->_state = a3;
}

- (void)_changeSession
{
  NSUUID *v3;
  void *v4;
  NSUUID *sessionID;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  NSUUID *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    v6 = v4;
    -[NSUUID UUIDString](sessionID, "UUIDString");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");
    -[NSUUID UUIDString](v3, "UUIDString");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11[0] = 68289538;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2082;
    v15 = v8;
    v16 = 2082;
    v17 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_217877000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ut session change\", \"oldSessionID\":\"%{public}s\", \"newSessionID\":\"%{public}s\"}", (uint8_t *)v11, 0x26u);

  }
  v10 = self->_sessionID;
  self->_sessionID = v3;

}

- (void)_registerForTATrackingAvoidanceServiceWithSettings:(id)a3
{
  id v4;
  TATrackingAvoidanceService *v5;
  TATrackingAvoidanceService *service;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_service)
  {
    v5 = -[TATrackingAvoidanceService initWithTASettings:]([TATrackingAvoidanceService alloc], "initWithTASettings:", v4);
    service = self->_service;
    self->_service = v5;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_observers;
    v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[TATrackingAvoidanceService addObserver:](self->_service, "addObserver:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[TATrackingAvoidanceServiceManager _changeSession](self, "_changeSession");
    -[TATrackingAvoidanceServiceManager _loadAndBootstrap](self, "_loadAndBootstrap");
    -[TATrackingAvoidanceServiceManager _fetchAndIngestLastVisit](self, "_fetchAndIngestLastVisit");
    -[TASettings persistenceInterval](self->_serviceSettings, "persistenceInterval");
    -[TATrackingAvoidanceServiceManager _schedulePeriodicSaveAfterTimeInterval:](self, "_schedulePeriodicSaveAfterTimeInterval:");
  }

}

- (void)_unregisterForTATrackingAvoidanceService
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  TATrackingAvoidanceService *service;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_service)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = self->_observers;
    v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          -[TATrackingAvoidanceService removeObserver:](self->_service, "removeObserver:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
        }
        while (v5 != v7);
        v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    -[TATrackingAvoidanceServiceManager _changeSession](self, "_changeSession");
    service = self->_service;
    self->_service = 0;

  }
}

- (void)_fetchAndIngestLastVisit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x24BE27ED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BE27EF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAscending:confidence:dateInterval:labelVisit:limit:", 0, v4, 0, 1, &unk_24D825028);

  -[TATrackingAvoidanceServiceManager routineManager](self, "routineManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke;
  v7[3] = &unk_24D815540;
  v7[4] = self;
  objc_msgSend(v6, "fetchStoredVisitsWithOptions:handler:", v5, v7);

}

void __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke_2;
  v7[3] = &unk_24D815518;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __61__TATrackingAvoidanceServiceManager__fetchAndIngestLastVisit__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  void *v9;
  CLLocationDegrees v10;
  CLLocationCoordinate2D v11;
  TACLVisit *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  TACLVisit *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 && objc_msgSend(v2, "count"))
  {
    v3 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v24 = 68289283;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      v28 = 2113;
      v29 = v4;
      _os_log_impl(&dword_217877000, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit got last visit\", \"visits\":\"%{private}@\"}", (uint8_t *)&v24, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "latitude");
    v8 = v7;
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "longitude");
    v11 = CLLocationCoordinate2DMake(v8, v10);

    v12 = [TACLVisit alloc];
    objc_msgSend(v5, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "horizontalUncertainty");
    v15 = v14;
    objc_msgSend(v5, "entry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TACLVisit initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:](v12, "initWithCoordinate:horizontalAccuracy:arrivalDate:departureDate:detectionDate:confidence:", v16, v17, v18, 2, v11.latitude, v11.longitude, v15);

    objc_msgSend(*(id *)(a1 + 40), "service");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "service");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ingestTAEvent:", v19);

    }
    else
    {
      v23 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      {
        v24 = 68289026;
        v25 = 0;
        v26 = 2082;
        v27 = "";
        _os_log_impl(&dword_217877000, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:visit not ingesting TAEvent as TA service is down\"}", (uint8_t *)&v24, 0x12u);
      }
    }

  }
  else
  {
    v22 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 68289026;
      v25 = 0;
      v26 = 2082;
      v27 = "";
      _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:visit no last visit to bootstrap onto\"}", (uint8_t *)&v24, 0x12u);
    }
  }
}

- (void)_fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _DWORD v20[2];
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[TATrackingAvoidanceServiceManager service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getLatestValidVisit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TATrackingAvoidanceServiceManager service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
  {
    v10 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v6, "coordinate");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "horizontalAccuracy");
    v16 = v15;
    objc_msgSend(v6, "detectionDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v17, v12, v14, 0.0, v16, -1.0);

    -[TATrackingAvoidanceServiceManager _fetchAndIngestNextPredictedLocationOfInterestFromLocation:startDate:interval:](self, "_fetchAndIngestNextPredictedLocationOfInterestFromLocation:startDate:interval:", v18, v9, 7200.0);
  }
  else
  {
    v19 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 68289539;
      v20[1] = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2113;
      v24 = v6;
      v25 = 2113;
      v26 = v9;
      _os_log_impl(&dword_217877000, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#manager:nextPLOI missing required info to query\", \"latestVisit\":\"%{private}@\", \"startDate\":\"%{private}@\"}", (uint8_t *)v20, 0x26u);
    }
  }

}

- (void)_fetchAndIngestNextPredictedLocationOfInterestFromLocation:(id)a3 startDate:(id)a4 interval:(double)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v8 = a4;
  v9 = a3;
  -[TATrackingAvoidanceServiceManager routineManager](self, "routineManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke;
  v11[3] = &unk_24D815540;
  v11[4] = self;
  objc_msgSend(v10, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:withHandler:", v9, v8, v11, a5);

}

void __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke_2;
  v7[3] = &unk_24D815518;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __115__TATrackingAvoidanceServiceManager__fetchAndIngestNextPredictedLocationOfInterestFromLocation_startDate_interval___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  TAPredictedLocationOfInterest *v29;
  void *v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v34;
  id obj;
  TAPredictedLocationOfInterest *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t buf;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(a1 + 32);
  if (v1 && objc_msgSend(v1, "count"))
  {
    v2 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 32);
      buf = 68289283;
      v47 = 2082;
      v48 = "";
      v49 = 2113;
      v50 = v3;
      _os_log_impl(&dword_217877000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:nextPLOI got nextPLOI\", \"nextPLOI\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = *(id *)(a1 + 32);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v42;
      *(_QWORD *)&v5 = 68289283;
      v32 = v5;
      do
      {
        v8 = 0;
        v34 = v6;
        do
        {
          if (*(_QWORD *)v42 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
          objc_msgSend(v9, "confidence", v32);
          if (v10 >= 1.0)
          {
            objc_msgSend(v9, "locationOfInterest");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = +[TALocationOfInterest convertRTToTALocationOfInterestType:](TALocationOfInterest, "convertRTToTALocationOfInterestType:", objc_msgSend(v12, "type"));

            v36 = [TAPredictedLocationOfInterest alloc];
            objc_msgSend(v9, "locationOfInterest");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "location");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "latitude");
            v14 = v13;
            objc_msgSend(v9, "locationOfInterest");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "location");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "longitude");
            v17 = v16;
            objc_msgSend(v9, "locationOfInterest");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "location");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "horizontalUncertainty");
            v21 = v20;
            objc_msgSend(v9, "locationOfInterest");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "referenceFrame");
            objc_msgSend(v9, "confidence");
            v26 = v25;
            objc_msgSend(v9, "nextEntryTime");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[TAPredictedLocationOfInterest initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:](v36, "initWithType:latitude:longitude:horizontalAccuracy:referenceFrame:confidence:nextEntryTime:date:", v37, v24, v27, v28, v14, v17, v21, v26);

            objc_msgSend(*(id *)(a1 + 40), "service");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "ingestTAEvent:", v29);

            v6 = v34;
          }
          else
          {
            v11 = TAStatusLog;
            if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
            {
              buf = v32;
              v47 = 2082;
              v48 = "";
              v49 = 2113;
              v50 = v9;
              _os_log_impl(&dword_217877000, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:nextPLOI ignoring low confidence PLOI\", \"nextPLOI\":\"%{private}@\"}", (uint8_t *)&buf, 0x1Cu);
            }
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v6);
    }

  }
  else
  {
    v31 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      buf = 68289026;
      v47 = 2082;
      v48 = "";
      _os_log_impl(&dword_217877000, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:nextPLOI no next PLOI\"}", (uint8_t *)&buf, 0x12u);
    }
  }
}

- (void)_registerForAvengerScanner
{
  NSHashTable *v2;
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
  v2 = self->_dataSources;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(v7, "registerForAvengerScanner", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_unregisterForAvengerScanner
{
  NSHashTable *v2;
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
  v2 = self->_dataSources;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
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
          objc_msgSend(v7, "unregisterForAvengerScanner", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)notifyObserversOfStateChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_dataSources;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "onManagerStateChangeFrom:to:", a3, a4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_loadAndBootstrap
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  TATrackingAvoidanceService *service;
  void *v8;
  void *v9;
  TATrackingAvoidanceService *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)os_transaction_create();
  if (!-[TAPersistenceManager load](self->_persistenceManager, "load"))
  {
    v13 = TAStatusLog;
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v17 = 68289026;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v14 = "{\"msg%{public}.0s\":\"#manager:persistence failed to load persistence store, aborting bootstrap\"}";
    v15 = v13;
    v16 = OS_LOG_TYPE_ERROR;
LABEL_10:
    _os_log_impl(&dword_217877000, v15, v16, v14, (uint8_t *)&v17, 0x12u);
    goto LABEL_11;
  }
  -[TAPersistenceManager store](self->_persistenceManager, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = TAStatusLog;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    v17 = 68289026;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v14 = "{\"msg%{public}.0s\":\"#manager:persistence no device record to bootstrap onto\"}";
    v15 = v6;
    v16 = OS_LOG_TYPE_DEBUG;
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 68289026;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    _os_log_impl(&dword_217877000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence bootstrapping onto loaded store\"}", (uint8_t *)&v17, 0x12u);
  }
  service = self->_service;
  -[TAPersistenceManager store](self->_persistenceManager, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TATrackingAvoidanceService bootstrapDeviceRecord:](service, "bootstrapDeviceRecord:", v9);

  v10 = self->_service;
  -[TAPersistenceManager store](self->_persistenceManager, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visitState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TATrackingAvoidanceService bootstrapVisitState:](v10, "bootstrapVisitState:", v12);

LABEL_11:
}

- (void)_fetchStoreAndSave
{
  TAPersistenceManager *persistenceManager;
  void *v4;
  id v5;

  v5 = (id)os_transaction_create();
  persistenceManager = self->_persistenceManager;
  -[TATrackingAvoidanceService store](self->_service, "store");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TAPersistenceManager onUpdatedTAStore:](persistenceManager, "onUpdatedTAStore:", v4);

  -[TAPersistenceManager save](self->_persistenceManager, "save");
  -[TATrackingAvoidanceServiceManager _setLastSaveTime](self, "_setLastSaveTime");

}

- (void)_schedulePeriodicSaveAfterTimeInterval:(double)a3
{
  void *v5;
  NSUUID *sessionID;
  NSObject *v7;
  id v8;
  NSUUID *v9;
  dispatch_time_t v10;
  NSObject *queue;
  NSUUID *v12;
  _QWORD block[5];
  NSUUID *v14;
  double v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    sessionID = self->_sessionID;
    v7 = v5;
    -[NSUUID UUIDString](sessionID, "UUIDString");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 68289538;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2050;
    v21 = a3;
    v22 = 2082;
    v23 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_217877000, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence scheduling save\", \"interval\":\"%{public}f\", \"currentSession\":\"%{public}s\"}", buf, 0x26u);

  }
  v9 = self->_sessionID;
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__TATrackingAvoidanceServiceManager__schedulePeriodicSaveAfterTimeInterval___block_invoke;
  block[3] = &unk_24D815568;
  v15 = a3;
  block[4] = self;
  v14 = v9;
  v12 = v9;
  dispatch_after(v10, queue, block);

}

void __76__TATrackingAvoidanceServiceManager__schedulePeriodicSaveAfterTimeInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  id *v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  id *v24;
  int v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(double *)(a1 + 48);
    v25 = 68289282;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2050;
    v30 = v3;
    _os_log_impl(&dword_217877000, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence begin scheduled save\", \"interval\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isEqual:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) == 1)
    {
      mach_continuous_time();
      TMConvertTicksToSeconds();
      v5 = v4;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "persistenceInterval");
      if (v5 >= v6)
      {
        v20 = (void *)TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
          v22 = v20;
          objc_msgSend(v21, "persistenceInterval");
          v25 = 68289282;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2050;
          v30 = v23;
          _os_log_impl(&dword_217877000, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence save and schedule next save\", \"secondsToNextSave\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);

        }
        objc_msgSend(*(id *)(a1 + 32), "_fetchStoreAndSave");
        v24 = *(id **)(a1 + 32);
        objc_msgSend(v24[6], "persistenceInterval");
        v10 = v24;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "persistenceInterval");
        v8 = v7 - v5;
        v9 = TAStatusLog;
        if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
        {
          v25 = 68289282;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2050;
          v30 = v8;
          _os_log_impl(&dword_217877000, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence push out save schedule\", \"secondsToNextSave\":\"%{public}f\"}", (uint8_t *)&v25, 0x1Cu);
        }
        v10 = *(id **)(a1 + 32);
        v11 = v8;
      }
      objc_msgSend(v10, "_schedulePeriodicSaveAfterTimeInterval:", v11);
    }
    else
    {
      v19 = TAStatusLog;
      if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
      {
        v25 = 68289026;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        _os_log_impl(&dword_217877000, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:persistence scheduled save running but not in running state, discontinuing scheduled saves\"}", (uint8_t *)&v25, 0x12u);
      }
    }
  }
  else
  {
    v12 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      v14 = v12;
      objc_msgSend(v13, "UUIDString");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(double *)&v16 = COERCE_DOUBLE(objc_msgSend(v15, "UTF8String"));
      objc_msgSend(*(id *)(a1 + 40), "UUIDString");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "UTF8String");
      v25 = 68289538;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = *(double *)&v16;
      v31 = 2082;
      v32 = v18;
      _os_log_impl(&dword_217877000, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#manager:persistence canceling scheduled save due to session change\", \"currentSession\":\"%{public}s\", \"sessionAtTimeOfSchedule\":\"%{public}s\"}", (uint8_t *)&v25, 0x26u);

    }
  }
}

- (void)_setLastSaveTime
{
  self->_persistenceManagerLastSaveTime = mach_continuous_time();
}

- (void)addObserver:(id)a3
{
  TATrackingAvoidanceService *service;
  id v5;

  v5 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:");
  service = self->_service;
  if (service)
    -[TATrackingAvoidanceService addObserver:](service, "addObserver:", v5);

}

- (void)removeObserver:(id)a3
{
  TATrackingAvoidanceService *service;
  id v5;

  v5 = a3;
  -[NSHashTable removeObject:](self->_observers, "removeObject:");
  service = self->_service;
  if (service)
    -[TATrackingAvoidanceService addObserver:](service, "addObserver:", v5);

}

- (void)fetchTAUnknownBeacon:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  TATrackingAvoidanceService *service;

  v6 = a3;
  v7 = a4;
  service = self->_service;
  if (service)
  {
    -[TATrackingAvoidanceService fetchTAUnknownBeacon:withCompletion:](service, "fetchTAUnknownBeacon:withCompletion:", v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager fetchTAUnknownBeacon:withCompletion:].cold.1();
  }

}

- (void)debugForceSurfaceStagedDetections:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  TATrackingAvoidanceService *service;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  service = self->_service;
  if (service)
  {
    -[TATrackingAvoidanceService debugForceSurfaceStagedDetections:deviceType:detailsBitmask:](service, "debugForceSurfaceStagedDetections:deviceType:detailsBitmask:", v8, a4, v5);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager debugForceSurfaceStagedDetections:deviceType:detailsBitmask:].cold.1();
  }

}

- (void)debugStageTADetection:(id)a3 deviceType:(unint64_t)a4 detailsBitmask:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  TATrackingAvoidanceService *service;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  service = self->_service;
  if (service)
  {
    -[TATrackingAvoidanceService debugStageTADetection:deviceType:detailsBitmask:](service, "debugStageTADetection:deviceType:detailsBitmask:", v8, a4, v5);
  }
  else if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEBUG))
  {
    -[TATrackingAvoidanceServiceManager debugStageTADetection:deviceType:detailsBitmask:].cold.1();
  }

}

- (void)addDataSource:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[NSHashTable addObject:](self->_dataSources, "addObject:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "registerForLeechedEvents");
  v4 = v6;
  if (self->_state == 1)
  {
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "registerForAvengerScanner");
      v4 = v6;
    }
  }

}

- (void)removeDataSource:(id)a3
{
  id v4;
  char v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "unregisterForLeechedEvents");
  v4 = v6;
  if (self->_state == 1)
  {
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "unregisterForAvengerScanner");
      v4 = v6;
    }
  }
  -[NSHashTable removeObject:](self->_dataSources, "removeObject:", v4);

}

- (void)trackingAvoidanceService:(id)a3 didFindSuspiciousDevices:(id)a4
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "count", a3))
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didFindSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    -[TATrackingAvoidanceServiceManager _fetchStoreAndSave](self, "_fetchStoreAndSave");
  }
}

- (void)trackingAvoidanceService:(id)a3 didStageSuspiciousDevices:(id)a4
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "count", a3))
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didStageSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    -[TATrackingAvoidanceServiceManager _fetchStoreAndSave](self, "_fetchStoreAndSave");
  }
}

- (void)trackingAvoidanceService:(id)a3 didUnstageSuspiciousDevices:(id)a4
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a4, "count", a3))
  {
    v5 = TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl(&dword_217877000, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence didUnstageSuspiciousDevices called, saving state\"}", (uint8_t *)v6, 0x12u);
    }
    -[TATrackingAvoidanceServiceManager _fetchStoreAndSave](self, "_fetchStoreAndSave");
  }
}

- (void)visitStateChangedForTrackingAvoidanceService:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl(&dword_217877000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#manager:persistence visitStateChangedForTrackingAvoidanceService called, saving state\"}", (uint8_t *)v5, 0x12u);
  }
  -[TATrackingAvoidanceServiceManager _fetchStoreAndSave](self, "_fetchStoreAndSave");
  -[TATrackingAvoidanceServiceManager _fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState](self, "_fetchAndIngestNextPredictedLocationOfInterestWithCurrentVisitState");
}

+ (id)managerStateToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("UnknownState");
  else
    return off_24D815588[a3];
}

- (unint64_t)state
{
  return self->_state;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSHashTable)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_dataSources, a3);
}

- (TATrackingAvoidanceService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (TASettings)serviceSettings
{
  return self->_serviceSettings;
}

- (void)setServiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSettings, a3);
}

- (TATrackingAvoidanceServiceStateContext)stateContext
{
  return self->_stateContext;
}

- (void)setStateContext:(id)a3
{
  objc_storeStrong((id *)&self->_stateContext, a3);
}

- (TAPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (unint64_t)persistenceManagerLastSaveTime
{
  return self->_persistenceManagerLastSaveTime;
}

- (void)setPersistenceManagerLastSaveTime:(unint64_t)a3
{
  self->_persistenceManagerLastSaveTime = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (TAAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
  objc_storeStrong((id *)&self->_routineManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_stateContext, 0);
  objc_storeStrong((id *)&self->_serviceSettings, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)onUpdatedSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut settings changed or weren't set; restart service required",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)onUpdatedSettings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut settings have disabled TA", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)onUpdatedSettings:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_1();
  v3 = 2113;
  v4 = v0;
  _os_log_debug_impl(&dword_217877000, v1, OS_LOG_TYPE_DEBUG, "#ut new settings %{private}@, old settings %{private}@", v2, 0x16u);
}

- (void)ingestTAEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut not ingesting TAEvent as TA service is down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)fetchTAUnknownBeacon:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut not fetching unknown beacon as TA service is down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)debugForceSurfaceStagedDetections:deviceType:detailsBitmask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut not ForceSurfaceStagedDetections as TA service is down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

- (void)debugStageTADetection:deviceType:detailsBitmask:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_217877000, v0, v1, "#ut not debugStageTADetection as TA service is down", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

@end
