@implementation CARDNDManager

+ (void)setupSharedManagerWithVehicleStore:(id)a3 sessionStatus:(id)a4
{
  CARDNDStateObserver *v6;
  id v7;
  CARDNDStateObserver *v8;
  id v9;
  CARDNDAssertionTrap *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CARDNDAssertionTrap *v18;
  id v19;
  void *v20;
  CARUserAlerts *v21;
  id v22;
  id v23;
  id v24;

  v23 = a4;
  v22 = a3;
  v24 = objc_alloc_init((Class)CARAutomaticDNDStatus);
  v6 = [CARDNDStateObserver alloc];
  v7 = objc_alloc_init((Class)RadiosPreferences);
  v8 = -[CARDNDStateObserver initWithRadiosPreferences:vehicleStateClass:](v6, "initWithRadiosPreferences:vehicleStateClass:", v7, objc_opt_class(CMVehicleState));

  v9 = objc_alloc((Class)a1);
  v21 = objc_alloc_init(CARUserAlerts);
  v10 = -[CARDNDAssertionTrap initWithPreferences:]([CARDNDAssertionTrap alloc], "initWithPreferences:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[DNDStateService serviceForClientIdentifier:](DNDStateService, "serviceForClientIdentifier:", CFSTR("com.apple.carkitd.assertion-service")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[DNDModeConfigurationService serviceForClientIdentifier:](DNDModeConfigurationService, "serviceForClientIdentifier:", CFSTR("com.apple.carkitd.assertion-service")));
  v13 = BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UserFocus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "DoNotDisturbWhileDriving"));
  v17 = v9;
  v18 = v10;
  v19 = objc_msgSend(v17, "initWithVehicleState:alertManager:preferences:carSessionStatus:geoFencingObserver:assertionTrap:vehicleStore:stateService:modeConfigurationService:drivingStream:", v8, v21, v24, v23, 0, v10, v22, v11, v12, v16);

  v20 = (void *)qword_1000DB8C8;
  qword_1000DB8C8 = (uint64_t)v19;

}

+ (id)sharedManager
{
  return (id)qword_1000DB8C8;
}

- (CARDNDManager)initWithVehicleState:(id)a3 alertManager:(id)a4 preferences:(id)a5 carSessionStatus:(id)a6 geoFencingObserver:(id)a7 assertionTrap:(id)a8 vehicleStore:(id)a9 stateService:(id)a10 modeConfigurationService:(id)a11 drivingStream:(id)a12
{
  CARDNDManager *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *CARDNDQueue;
  id *p_stateMachine;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CARDNDManager *v30;
  uint64_t v31;
  BPSSink *biomeDrivingSink;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  __CFNotificationCenter *DarwinNotifyCenter;
  id obj;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD v57[4];
  CARDNDManager *v58;
  objc_super v59;

  obj = a3;
  v55 = a3;
  v54 = a4;
  v56 = a5;
  v53 = a6;
  v52 = a7;
  v51 = a8;
  v50 = a9;
  v49 = a10;
  v48 = a11;
  v47 = a12;
  v59.receiver = self;
  v59.super_class = (Class)CARDNDManager;
  v18 = -[CARDNDManager init](&v59, "init");
  if (v18)
  {
    v19 = dispatch_queue_create("com.apple.carkit.driving", 0);
    CARDNDQueue = v18->_CARDNDQueue;
    v18->_CARDNDQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v18->_dndStateService, a10);
    objc_storeStrong((id *)&v18->_dndModeService, a11);
    objc_storeStrong((id *)&v18->_drivingStream, a12);
    p_stateMachine = (id *)&v18->_stateMachine;
    objc_storeStrong((id *)&v18->_stateMachine, obj);
    -[CARDNDStateObserver setDelegate:](v18->_stateMachine, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_preferences, a5);
    objc_storeStrong((id *)&v18->_alertManager, a4);
    v18->_lastKnownVehicularState = 0;
    v18->_lastKnownVehicularHints = 0;
    objc_storeStrong((id *)&v18->_sessionStatus, a6);
    -[CARSessionStatus addSessionObserver:](v18->_sessionStatus, "addSessionObserver:", v18);
    objc_storeStrong((id *)&v18->_geofencingObserver, a7);
    -[CARDNDGeofencingObserver setDelegate:](v18->_geofencingObserver, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_assertionTrap, a8);
    -[CARDNDAssertionTrap setDelegate:](v18->_assertionTrap, "setDelegate:", v18);
    objc_storeStrong((id *)&v18->_vehicleStore, a9);
    v18->_expectedDNDTermination = 0;
    v18->_vehicleQueryInitiatedTimestamp = 0.0;
    objc_msgSend(v56, "_detachObservers");
    v22 = objc_msgSend(objc_alloc((Class)BMBiomeScheduler), "initWithIdentifier:targetQueue:", CFSTR("com.apple.focus.driving"), v18->_CARDNDQueue);
    v23 = BiomeLibrary();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "UserFocus"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ComputedMode"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "DSLPublisher"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "filterWithKeyPath:value:", CFSTR("eventBody.semanticType"), &off_1000BE6B0));

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "subscribeOn:", v22));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100052984;
    v57[3] = &unk_1000B73C0;
    v30 = v18;
    v58 = v30;
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "sinkWithCompletion:receiveInput:", &stru_1000B7398, v57));
    biomeDrivingSink = v30->_biomeDrivingSink;
    v30->_biomeDrivingSink = (BPSSink *)v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
    LODWORD(v25) = objc_msgSend(v33, "isActive");

    if (!(_DWORD)v25)
      goto LABEL_15;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
    if (objc_msgSend(v34, "hasAssertion:", 4))
    {
      v35 = objc_msgSend(*p_stateMachine, "isInAirplaneMode");

      if ((v35 & 1) != 0)
      {
LABEL_7:
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap", obj));
        v37 = objc_msgSend(v36, "hasAssertion:", 1);

        if (v37)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
          objc_msgSend(v38, "releaseAssertion:", 1);

        }
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
        v40 = objc_msgSend(v39, "hasAssertion:", 16);

        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
          objc_msgSend(v41, "releaseAssertion:", 16);

        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
        if (!objc_msgSend(v42, "hasAssertion:", 32))
          goto LABEL_14;
        v43 = objc_msgSend(*p_stateMachine, "isInLostMode");

        if ((v43 & 1) == 0)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
          objc_msgSend(v42, "releaseAssertion:", 32);
LABEL_14:

        }
LABEL_15:
        -[CARDNDManager _migrateToDrivingActivityModeIfNeeded](v30, "_migrateToDrivingActivityModeIfNeeded", obj);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDExitConfirmationDisabledNotification, 0, 0, 1u);

        goto LABEL_16;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](v30, "assertionTrap"));
      objc_msgSend(v34, "releaseAssertion:", 4);
    }

    goto LABEL_7;
  }
LABEL_16:

  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[BPSSink cancel](self->_biomeDrivingSink, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)CARDNDManager;
  -[CARDNDManager dealloc](&v3, "dealloc");
}

- (BOOL)showsInternalAlerts
{
  int v3;
  void *v4;
  unsigned __int8 v5;

  v3 = CRIsInternalInstall(self);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v5 = objc_msgSend(v4, "isAutomaticDNDInternalShowUserAlertsEnabledPreference");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CARDNDGeofencingObserver)geofencingObserver
{
  CARDNDGeofencingObserver *geofencingObserver;
  _QWORD block[5];

  geofencingObserver = self->_geofencingObserver;
  if (!geofencingObserver)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100052BB8;
    block[3] = &unk_1000B51B8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    geofencingObserver = self->_geofencingObserver;
  }
  return geofencingObserver;
}

- (void)sessionDidConnect:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  v4 = objc_claimAutoreleasedReturnValue(-[CARDNDManager CARDNDQueue](self, "CARDNDQueue", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052C64;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)sessionDidDisconnect:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences", a3));
  v5 = objc_msgSend(v4, "shouldActivateWithCarPlay");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v7 = objc_msgSend(v6, "automaticDNDTriggeringMethod");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
  objc_msgSend(v8, "releaseAssertion:", 1);

  if (!v5 || v7 != (id)2)
  {
    v19 = CarDNDWDLogging(v9, v10);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; disabling Driving",
        buf,
        2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v21, "DNDEndedWithTrigger:vehicleHints:context:", 3, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"), 0);

    v16 = objc_claimAutoreleasedReturnValue(-[CARDNDManager CARDNDQueue](self, "CARDNDQueue"));
    v17 = v16;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000530A4;
    v24[3] = &unk_1000B51B8;
    v24[4] = self;
    v18 = v24;
    goto LABEL_10;
  }
  v11 = -[CARDNDManager lastKnownVehicularState](self, "lastKnownVehicularState");
  if (v11 < 2)
  {
    v13 = CarDNDWDLogging(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; disabling Driving due to non-vehicular state",
        buf,
        2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v15, "DNDEndedWithTrigger:vehicleHints:context:", 3, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"), 0);

    v16 = objc_claimAutoreleasedReturnValue(-[CARDNDManager CARDNDQueue](self, "CARDNDQueue"));
    v17 = v16;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100053090;
    v25[3] = &unk_1000B51B8;
    v25[4] = self;
    v18 = v25;
LABEL_10:
    dispatch_async(v16, v18);

    return;
  }
  if (v11 == 2)
  {
    v22 = CarDNDWDLogging(2, v12);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CarPlay session ended; leaving Driving active for auto-termination.",
        buf,
        2u);
    }

  }
}

- (BOOL)isDNDValid
{
  DNDStateService *dndStateService;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v12;

  dndStateService = self->_dndStateService;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DNDStateService queryCurrentStateWithError:](dndStateService, "queryCurrentStateWithError:", &v12));
  v4 = v12;
  v6 = v4;
  if (v4)
  {
    v7 = CarDNDWDLogging(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10006E66C();

  }
  if (objc_msgSend(v3, "isActive"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeModeIdentifier"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.driving"));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCurrentlyInGeofencedRegion
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
  v3 = objc_msgSend(v2, "currentlyInRegion");

  return v3;
}

- (void)stateMachine:(id)a3 receivedVehicleState:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[CARDNDManager CARDNDQueue](self, "CARDNDQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053244;
  v8[3] = &unk_1000B5390;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)stateMachine:(id)a3 receivedAirplaneMode:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap", a3));
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "takeAssertion:", 4);
  else
    objc_msgSend(v5, "releaseAssertion:", 4);

}

- (void)stateMachine:(id)a3 receivedFMDMode:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap", a3));
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "takeAssertion:", 32);
  else
    objc_msgSend(v5, "releaseAssertion:", 32);

}

- (void)geofencingObserver:(id)a3 didUpdateRegionState:(int64_t)a4
{
  void *v6;
  unsigned int v7;
  id v8;

  if (-[CARDNDManager showsInternalAlerts](self, "showsInternalAlerts", a3))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v7 = objc_msgSend(v6, "isAutomaticDNDInternalShowGeofencingAlertsEnabledPreference");

    if (v7)
    {
      if (a4 == 2)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[CARDNDManager alertManager](self, "alertManager"));
        objc_msgSend(v8, "showDNDExitGeofenceWithCompletion:", 0);
        goto LABEL_8;
      }
      if (a4 == 1)
      {
        v8 = (id)objc_claimAutoreleasedReturnValue(-[CARDNDManager alertManager](self, "alertManager"));
        objc_msgSend(v8, "showDNDEnterGeofenceWithCompletion:", 0);
LABEL_8:

      }
    }
  }
}

- (void)assertionTrap:(id)a3 didBecomeActive:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[CARDNDManager CARDNDQueue](self, "CARDNDQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053434;
  block[3] = &unk_1000B73E8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 completion:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  unint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int v14;
  BOOL v15;
  id location;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v8 = a5;
  v9 = (-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints") >> 4) & 1;
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000536BC;
  v11[3] = &unk_1000B7410;
  v15 = v6;
  objc_copyWeak(&v13, &location);
  v14 = v5;
  v10 = v8;
  v12 = v10;
  -[CARDNDManager _setDNDActive:trigger:withStartingGeofence:completion:](self, "_setDNDActive:trigger:withStartingGeofence:completion:", v6, v5, v9, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_setDNDActive:(BOOL)a3 trigger:(int)a4 withStartingGeofence:(BOOL)a5 completion:(id)a6
{
  uint64_t v6;
  _BOOL4 v7;
  void (**v9)(id, uint64_t);
  _BOOL8 v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void (**v19)(id, uint64_t);
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(id, uint64_t);
  _QWORD block[4];
  void (**v25)(id, uint64_t);
  uint8_t buf[16];

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v9 = (void (**)(id, uint64_t))a6;
  v10 = -[CARDNDManager isDNDValid](self, "isDNDValid");
  v12 = v10;
  if (v7)
  {
    v13 = CarDNDWDLogging(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Requested to enable Driving, but it's already active.", buf, 2u);
      }

      if (v9)
        v9[2](v9, 1);
      goto LABEL_18;
    }
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Engaging Driving.", buf, 2u);
    }

    self->_expectedDNDTermination = 0;
    self->_lastKnownVehicularState = 2;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
    objc_msgSend(v20, "releaseAllTemporaryAssertions");

    -[CARDNDManager setLastKnownReportTime:](self, "setLastKnownReportTime:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v21, "DNDStartedWithTrigger:vehicleHints:", v6, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"));

    -[CARDNDManager sendDrivingModeEventWithReason:isStart:](self, "sendDrivingModeEventWithReason:isStart:", v6, 1);
    if (v9)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000539F8;
      block[3] = &unk_1000B5628;
      v25 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v19 = v25;
      goto LABEL_17;
    }
  }
  else
  {
    if (!v10)
    {
      v16 = CarDNDWDLogging(v10, v11);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Requested to disable Driving, but it wasn't active.", buf, 2u);
      }

    }
    self->_expectedDNDTermination = 1;
    self->_activatedByUserAction = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v18, "DNDEndedWithTrigger:vehicleHints:context:", v6, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"), 0);

    -[CARDNDManager sendDrivingModeEventWithReason:isStart:](self, "sendDrivingModeEventWithReason:isStart:", v6, 0);
    if (v9)
    {
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100053A08;
      v22[3] = &unk_1000B5628;
      v23 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v22);
      v19 = v23;
LABEL_17:

    }
  }
LABEL_18:

}

- (void)_checkVehicleState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CARDNDManager stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "_checkVehicleState");

}

- (void)_transitionToState:(unint64_t)a3 vehicularHints:(unint64_t)a4 operatorState:(unint64_t)a5
{
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[4];
  void *v58;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v10 = objc_msgSend(v9, "automaticDNDTriggeringMethod");
  v12 = v10;
  if (a3 == 2)
  {
    v16 = CarDNDWDLogging(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "Evaluating transition to Vehicular state.";
  }
  else if (a3 == 1)
  {
    v13 = CarDNDWDLogging(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "Evaluating transition to Non-vehicular state.";
  }
  else
  {
    v17 = CarDNDWDLogging(v10, v11);
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v15 = "Evaluating transition to Unknown state.";
  }
  _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
LABEL_10:

  if (v12 == (id)2)
  {
    v23 = CarDNDWDLogging(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = "Automatic trigger mode.";
      goto LABEL_19;
    }
  }
  else if (v12 == (id)1)
  {
    v24 = CarDNDWDLogging(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = "BT trigger mode.";
      goto LABEL_19;
    }
  }
  else
  {
    if (v12)
      goto LABEL_21;
    v20 = CarDNDWDLogging(v18, v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v22 = "Manual trigger mode.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    }
  }

LABEL_21:
  if (CRIsInternalInstall(v25))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v27 = objc_msgSend(v26, "isAutomaticDNDInternalForceOverrideEnabledPreference");

  }
  else
  {
    v27 = 0;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  if (objc_msgSend(v28, "shouldActivateWithCarPlay"))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager sessionStatus](self, "sessionStatus"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "currentSession"));
    v31 = v30 != 0;

  }
  else
  {
    v31 = 0;
  }

  if (a5 == 1)
  {
    v34 = CarDNDWDLogging(v32, v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "User is not operating.", buf, 2u);
    }
    v36 = 1;
  }
  else
  {
    if (a3 == 1)
    {
      v36 = 1;
      goto LABEL_44;
    }
    v35 = objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v38 = -[NSObject automaticDNDTriggeringMethod](v35, "automaticDNDTriggeringMethod");
    v36 = 0;
    if ((a4 & 0x10) == 0 && v38 == (id)1)
      v36 = (LOBYTE(self->_lastKnownVehicularHints) >> 4) & 1;
  }

  if ((v27 & 1) != 0)
  {
    v27 = 1;
  }
  else if (a3 == 2)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    if (objc_msgSend(v37, "automaticDNDTriggeringMethod") == (id)1)
      v27 = (a4 >> 4) & 1;
    else
      v27 = 1;

  }
  else
  {
    v27 = 0;
  }
LABEL_44:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
  v40 = objc_msgSend(v39, "isActive");

  self->_lastKnownVehicularState = a3;
  self->_lastKnownVehicularHints = a4;
  self->_vehicleQueryInitiatedTimestamp = 0.0;
  if (v36)
  {
    if (v31)
    {
      v43 = CarDNDWDLogging(v41, v42);
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Ignoring non-vehicular report in CarPlay mode.", buf, 2u);
      }
LABEL_48:

      return;
    }
    objc_initWeak((id *)buf, self);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100053FD4;
    v55[3] = &unk_1000B7438;
    objc_copyWeak(&v56, (id *)buf);
    -[CARDNDManager _setDNDActive:trigger:completion:](self, "_setDNDActive:trigger:completion:", 0, 2, v55);
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)buf);
  }
  else if (v27)
  {
    if (v40)
    {
      v45 = CarDNDWDLogging(v41, v42);
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "activeAssertionsDebugString"));
        *(_DWORD *)buf = 138543362;
        v58 = v48;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Not engaging Driving due to active assertions: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
      if (objc_msgSend(v49, "automaticDNDTriggeringMethod"))
      {

      }
      else
      {
        v50 = -[CARDNDManager _hasDrivingActivityMode](self, "_hasDrivingActivityMode");

        if (v50)
        {
          v53 = CarDNDWDLogging(v51, v52);
          v44 = objc_claimAutoreleasedReturnValue(v53);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Driving Focus is available, but trigger is manual. Ignoring.", buf, 2u);
          }
          goto LABEL_48;
        }
      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      objc_msgSend(v54, "DNDStartedWithTrigger:vehicleHints:", 2, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"));

      -[CARDNDManager _setDNDActive:trigger:completion:](self, "_setDNDActive:trigger:completion:", 1, 2, 0);
    }
  }
}

- (id)_internalText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  char v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;

  if (-[CARDNDManager showsInternalAlerts](self, "showsInternalAlerts"))
  {
    if (qword_1000DB8D8 != -1)
      dispatch_once(&qword_1000DB8D8, &stru_1000B7498);
    v3 = (void *)qword_1000DB8D0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[Internal] %@"), v5));
    if (-[CARDNDManager isDNDValid](self, "isDNDValid"))
    {
      v7 = -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints");
      if (!v7)
      {
        v11 = CFSTR("None");
LABEL_23:
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" Reason: %@"), v11));

        v6 = (void *)v12;
        return v6;
      }
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v10 = v9;
      if ((v8 & 1) != 0)
      {
        objc_msgSend(v9, "addObject:", CFSTR("Motion"));
        if ((v8 & 2) == 0)
        {
LABEL_8:
          if ((v8 & 4) == 0)
            goto LABEL_9;
          goto LABEL_18;
        }
      }
      else if ((v8 & 2) == 0)
      {
        goto LABEL_8;
      }
      objc_msgSend(v10, "addObject:", CFSTR("GPS"));
      if ((v8 & 4) == 0)
      {
LABEL_9:
        if ((v8 & 8) == 0)
          goto LABEL_10;
        goto LABEL_19;
      }
LABEL_18:
      objc_msgSend(v10, "addObject:", CFSTR("Baseband"));
      if ((v8 & 8) == 0)
      {
LABEL_10:
        if ((v8 & 0x10) == 0)
        {
LABEL_12:
          if (objc_msgSend(v10, "count"))
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", CFSTR(";")));
          else
            v11 = CFSTR("None");

          goto LABEL_23;
        }
LABEL_11:
        objc_msgSend(v10, "addObject:", CFSTR("Bluetooth"));
        goto LABEL_12;
      }
LABEL_19:
      objc_msgSend(v10, "addObject:", CFSTR("Wi-Fi"));
      if ((v8 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_scheduleVehicleQuery
{
  double v3;
  id v4;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  self->_vehicleQueryInitiatedTimestamp = v3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CARDNDManager stateMachine](self, "stateMachine"));
  objc_msgSend(v4, "scheduleVehicleStateCheckWithDelay:", 30.0);

}

- (void)_drivingModeStartedWithStartingGeofence:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v10;
  uint8_t v11[16];

  v3 = a3;
  v5 = CarDNDWDLogging(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Driving mode started.", v11, 2u);
  }

  -[CARDNDManager _beginIdleExitTransaction](self, "_beginIdleExitTransaction");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
  objc_msgSend(v7, "setDNDActive:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
  objc_msgSend(v8, "beginMonitoringLOIsWithStartingLocationGeofence:", v3);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDStatusChangedNotification, 0, 0, 1u);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v10, CARAutomaticDNDEnabledNotification, 0, 0, 1u);
}

- (void)_drivingModeEnded
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v8;
  uint8_t v9[16];

  v3 = CarDNDWDLogging(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up Driving state.", v9, 2u);
  }

  -[CARDNDManager _endIdleExitTransaction](self, "_endIdleExitTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
  objc_msgSend(v5, "setDNDActive:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
  objc_msgSend(v6, "stopMonitoringLOIs");

  -[CARDNDManager setLastKnownVehicularState:](self, "setLastKnownVehicularState:", 1);
  -[CARDNDManager setLastKnownVehicularHints:](self, "setLastKnownVehicularHints:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CARAutomaticDNDStatusChangedNotification, 0, 0, 1u);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(v8, CARAutomaticDNDDisabledNotification, 0, 0, 1u);
}

- (void)_drivingModeChanged:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v6 = objc_msgSend(v5, "starting");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v8 = objc_msgSend(v7, "updateSource");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v10 = objc_msgSend(v9, "updateReason");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Driving ")));
  v12 = CFSTR("ended");
  if (v6)
    v12 = CFSTR("started");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ externally"), v12));
  objc_msgSend(v11, "appendString:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v15 = objc_msgSend(v14, "updateSource");

  if (v15 - 1 > 2)
    v16 = CFSTR(" from an unknown source");
  else
    v16 = *(&off_1000B74B8 + (int)(v15 - 1));
  v17 = objc_msgSend(v11, "appendString:", v16);
  v19 = CarDNDWDLogging(v17, v18);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  if (v6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
    objc_msgSend(v21, "DNDStartedWithTrigger:vehicleHints:", 1, -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
    objc_msgSend(v22, "releaseAllTemporaryAssertions");

    v23 = (-[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints") >> 4) & 1;
    self->_activatedByUserAction = v10 == 1;
    if (v8 == 2)
      v24 = 1;
    else
      v24 = v23;
    -[CARDNDManager _drivingModeStartedWithStartingGeofence:](self, "_drivingModeStartedWithStartingGeofence:", v24);
  }
  else
  {
    v25 = -[CARDNDManager showsInternalAlerts](self, "showsInternalAlerts");
    if (v25)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
      v28 = objc_msgSend(v27, "hasAssertion:", 2);

      if ((v28 & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager alertManager](self, "alertManager"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager _internalText](self, "_internalText"));
        objc_msgSend(v29, "showDNDEndNotificationWithText:completion:", v30, 0);

      }
    }
    if (v10 == 1)
    {
      if (v8 == 2)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
        objc_msgSend(v31, "takeAssertion:", 2);

      }
      else
      {
        -[CARDNDManager _disableDNDUntilEndOfDrive](self, "_disableDNDUntilEndOfDrive");
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v35 = -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints");
      v36 = v34;
      v37 = 5;
    }
    else if (self->_expectedDNDTermination)
    {
      v32 = CarDNDWDLogging(v25, v26);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Expected Driving termination.", buf, 2u);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v35 = -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints");
      v36 = v34;
      v37 = 4;
    }
    else
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CARAnalytics sharedInstance](CARAnalytics, "sharedInstance"));
      v35 = -[CARDNDManager lastKnownVehicularHints](self, "lastKnownVehicularHints");
      v36 = v34;
      v37 = 6;
    }
    objc_msgSend(v36, "DNDEndedWithTrigger:vehicleHints:context:", v37, v35, 0);

    -[CARDNDManager _drivingModeEnded](self, "_drivingModeEnded");
  }

}

- (void)_disableDNDUntilEndOfDrive
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (-[CARDNDManager showsInternalAlerts](self, "showsInternalAlerts"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager alertManager](self, "alertManager"));
    objc_msgSend(v3, "showDNDNotDrivingAlertWithCompletion:", &stru_1000B7478);

  }
  v4 = -[CARDNDManager lastKnownVehicularState](self, "lastKnownVehicularState");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
  v7 = v5;
  if (v4 >= 2)
    v6 = 2;
  else
    v6 = 8;
  objc_msgSend(v5, "takeAssertion:", v6);

}

- (BOOL)_hasDrivingActivityMode
{
  DNDModeConfigurationService *dndModeService;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v10;
  _BOOL4 v11;
  uint8_t v13[16];
  uint8_t buf[8];
  id v15;

  dndModeService = self->_dndModeService;
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DNDModeConfigurationService modeConfigurationForModeIdentifier:error:](dndModeService, "modeConfigurationForModeIdentifier:error:", CFSTR("com.apple.donotdisturb.mode.driving"), &v15));
  v4 = v15;
  v6 = v4;
  if (v4)
  {
    v7 = CarDNDWDLogging(v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10006E7A0();
LABEL_4:
    v9 = 0;
    goto LABEL_9;
  }
  v10 = CarDNDWDLogging(0, v5);
  v8 = objc_claimAutoreleasedReturnValue(v10);
  v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v11)
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No available driving mode.", v13, 2u);
    }
    goto LABEL_4;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User has configured a driving mode.", buf, 2u);
  }
  v9 = 1;
LABEL_9:

  return v9;
}

- (void)_migrateToDrivingActivityModeIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[2];
  __int16 v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v4 = objc_msgSend(v3, "automaticDNDTriggeringMethod");

  if (v4)
  {
    v7 = CarDNDWDLogging(v5, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 0;
      v9 = "Performing migration for DNDWD based on trigger mode.";
      v10 = (uint8_t *)&v24;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v12 = objc_msgSend(v11, "hasAdjustedTriggerMethod");

  v15 = CarDNDWDLogging(v13, v14);
  v8 = objc_claimAutoreleasedReturnValue(v15);
  v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      v9 = "Performing migration for DNDWD based on previous trigger adjustment.";
      v10 = buf;
      goto LABEL_7;
    }
LABEL_8:

    v19 = CarDNDWDLogging(v17, v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Migrating to Driving activity mode.", v21, 2u);
    }

    -[CARDNDManager _createDrivingActivityModeIfNeeded:](self, "_createDrivingActivityModeIfNeeded:", 0);
    return;
  }
  if (v16)
  {
    *(_WORD *)v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not performing Driving migration.", v22, 2u);
  }

}

- (void)_createDrivingActivityModeIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  DNDModeConfigurationService *dndModeService;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  DNDModeConfigurationService *v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint8_t buf[16];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v6 = objc_msgSend(v5, "hasMigratedToDriving");

  if (!v6 || v3)
  {
    if (v3)
    {
      v12 = CarDNDWDLogging(v7, v8);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating a Driving configuration from override.", buf, 2u);
      }

    }
    v14 = -[CARDNDManager _hasDrivingActivityMode](self, "_hasDrivingActivityMode");
    if (!v14)
    {
      dndModeService = self->_dndModeService;
      v32 = 0;
      v10 = objc_claimAutoreleasedReturnValue(-[DNDModeConfigurationService createDefaultDrivingModeConfigurationWithError:](dndModeService, "createDefaultDrivingModeConfigurationWithError:", &v32));
      v18 = v32;
      if (v18)
      {
        v20 = v18;
        v21 = CarDNDWDLogging(v18, v19);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          sub_10006E860();

      }
      else
      {
        v23 = self->_dndModeService;
        v31 = 0;
        v24 = -[DNDModeConfigurationService setModeConfiguration:error:](v23, "setModeConfiguration:error:", v10, &v31);
        v25 = v31;
        v27 = CarDNDWDLogging(v25, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        v29 = v28;
        if (!v24 || v25)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            sub_10006E800();

          goto LABEL_23;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Created driving activity mode.", buf, 2u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_100054F88;
        v30[3] = &unk_1000B51B8;
        v30[4] = self;
        objc_msgSend(v20, "_performCARPreferencesBlock:forReading:", v30, 0);
      }

      goto LABEL_23;
    }
    v16 = CarDNDWDLogging(v14, v15);
    v10 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Skipping driving migration; one already exists.";
      goto LABEL_12;
    }
  }
  else
  {
    v9 = CarDNDWDLogging(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "Skipping driving migration; already migrated.";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
LABEL_23:

}

- (void)sendDrivingModeEventWithReason:(int)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = CarDNDWDLogging(self, a2);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v16 = 138412546;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending Driving event with start %@ reason %@", (uint8_t *)&v16, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager drivingStream](self, "drivingStream"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "source"));
  v13 = objc_alloc((Class)BMUserFocusDoNotDisturbWhileDriving);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v15 = objc_msgSend(v13, "initWithStarting:reason:", v14, v5);

  objc_msgSend(v12, "sendEvent:", v15);
}

- (void)_processVehicleState:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int64_t v49;
  _BOOL4 v50;
  _BOOL4 v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  _BOOL4 v77;
  void *v78;
  uint64_t v79;
  NSObject *v80;
  void *v81;
  uint8_t v82[16];
  _QWORD block[4];
  id v84;
  _BYTE *v85;
  _BYTE buf[24];
  char v87;

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "vehicleState");
  v6 = objc_msgSend(v4, "vehicularHints");
  v7 = objc_msgSend(v4, "vehicleOperatorState");
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceID"));
  if (CRIsInternalInstall(v81))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v9 = objc_msgSend(v8, "isAutomaticDNDInternalForceOverrideEnabledPreference");

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  v11 = objc_msgSend(v10, "shouldActivateWithCarPlay");

  if (v9)
  {
    v14 = CarDNDWDLogging(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Override is set; forcing vehicle state ON.",
        buf,
        2u);
    }

    v5 = 2;
  }
  if (CRIsInternalInstall(v12))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
    v17 = objc_msgSend(v16, "isAutomaticDNDInternalExitConfirmationOverrideEnabledPreference");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager geofencingObserver](self, "geofencingObserver"));
    objc_msgSend(v18, "setExitConfirmationOverride:", v17);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  if (!objc_msgSend(v19, "automaticDNDTriggeringMethod")
    && self->_lastKnownVehicularState == 2
    && v5 == 2
    && (self->_lastKnownVehicularHints & 0x10) != 0)
  {

    if ((v6 & 0x10) == 0)
    {
      v33 = CarDNDWDLogging(v31, v32);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Skipping non-BT in-vehicle report received after BT in-vehicle report.", buf, 2u);
      }

      goto LABEL_95;
    }
  }
  else
  {

  }
  v20 = objc_claimAutoreleasedReturnValue(-[CARDNDManager preferences](self, "preferences"));
  if (-[NSObject automaticDNDTriggeringMethod](v20, "automaticDNDTriggeringMethod") == (id)1
    && (self->_lastKnownVehicularHints & 0x10) != 0
    && (objc_msgSend(v4, "vehicularHints") & 0x10) == 0)
  {
    v21 = self->_lastKnownVehicularState == 2;

    if (!v21)
      goto LABEL_20;
    v24 = CarDNDWDLogging(v22, v23);
    v20 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Interpreted as BT disconnect.", buf, 2u);
    }
    v5 = 1;
  }

LABEL_20:
  if ((v9 & 1) != 0)
  {
LABEL_21:
    -[CARDNDManager _transitionToState:vehicularHints:operatorState:](self, "_transitionToState:vehicularHints:operatorState:", v5, v6, v7);
    goto LABEL_95;
  }
  if (self->_lastKnownVehicularState == v5 && (id)self->_lastKnownVehicularHints == v6 && v5 != 1 && v7 != (id)1)
  {
    v25 = CarDNDWDLogging(v22, v23);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_lastKnownVehicularState));
      if (v6)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v29 = v28;
        if ((v6 & 1) != 0)
          objc_msgSend(v28, "addObject:", CFSTR("Motion"));
        if ((v6 & 2) != 0)
          objc_msgSend(v29, "addObject:", CFSTR("GPS"));
        if ((v6 & 4) != 0)
          objc_msgSend(v29, "addObject:", CFSTR("Baseband"));
        if ((v6 & 8) != 0)
          objc_msgSend(v29, "addObject:", CFSTR("Wi-Fi"));
        if ((v6 & 0x10) != 0)
          objc_msgSend(v29, "addObject:", CFSTR("Bluetooth"));
        if (objc_msgSend(v29, "count"))
          v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "componentsJoinedByString:", CFSTR(";")));
        else
          v30 = CFSTR("None");

      }
      else
      {
        v30 = CFSTR("None");
      }
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No change from vehicle state %@ with hints %@.", buf, 0x16u);

    }
    goto LABEL_95;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager sessionStatus](self, "sessionStatus"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "currentSession"));
  if (v36)
    v37 = v11;
  else
    v37 = 1;

  if ((v37 & 1) == 0)
  {
    v46 = CarDNDWDLogging(v38, v39);
    v45 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Ignoring vehicle state change because CarPlay session is active.", buf, 2u);
    }
    goto LABEL_57;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager stateMachine](self, "stateMachine"));
  v41 = objc_msgSend(v40, "isInAirplaneMode");

  if (v41)
  {
    v44 = CarDNDWDLogging(v42, v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Ignoring vehicle state change because AirPlane mode is active.", buf, 2u);
    }
LABEL_57:

    self->_vehicleQueryInitiatedTimestamp = 0.0;
    goto LABEL_95;
  }
  if (self->_vehicleQueryInitiatedTimestamp <= 0.0)
  {
    v50 = 0;
  }
  else
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v49 = +[CARAnalytics calendarUnitsOfType:fromDate:toDate:](CARAnalytics, "calendarUnitsOfType:fromDate:toDate:", 128, v47, v48);

    v50 = v49 > 29;
  }
  v52 = v5 != 2 || v81 == 0;
  if ((v6 & 0x10) == 0)
    v52 = 1;
  if (((v52 | v50 | v11) & 1) == 0)
  {
    v53 = objc_msgSend(v81, "hasPrefix:", CFSTR("CarKit"));
    if ((_DWORD)v53)
    {
      v55 = CarDNDWDLogging(v53, v54);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Likely a CarPlay connection.", buf, 2u);
      }

      -[CARDNDManager _scheduleVehicleQuery](self, "_scheduleVehicleQuery");
      goto LABEL_95;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v87 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055A20;
    block[3] = &unk_1000B5750;
    v85 = buf;
    v57 = v81;
    v84 = v57;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager vehicleStore](self, "vehicleStore"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "vehicleForBluetoothAddress:", v57));

      if (!v59 || (v60 = objc_msgSend(v59, "pairingStatus"), v60 != (id)1))
      {
        v79 = CarDNDWDLogging(v60, v61);
        v80 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v82 = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "CarPlay vehicle that isn't disabled.", v82, 2u);
        }

        -[CARDNDManager _scheduleVehicleQuery](self, "_scheduleVehicleQuery");
        _Block_object_dispose(buf, 8);
        goto LABEL_95;
      }

    }
    _Block_object_dispose(buf, 8);
  }
  if (!-[CARDNDManager _hasDrivingActivityMode](self, "_hasDrivingActivityMode"))
    goto LABEL_21;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
  v63 = objc_msgSend(v62, "hasAssertion:", 2);

  if (v63)
  {
    v66 = CarDNDWDLogging(v64, v65);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Marking report while user disabled.", buf, 2u);
    }

    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    self->_lastKnownReportTime = v68;
    -[CARDNDManager _scheduleUserDisabledTimerWithInterval:](self, "_scheduleUserDisabledTimerWithInterval:", 480.0);
  }
  else
  {
    if (v5 != 2)
      goto LABEL_21;
    -[CARDNDManager lastKnownReportTime](self, "lastKnownReportTime");
    if (v69 <= 0.0)
      goto LABEL_21;
    -[CARDNDManager lastKnownReportTime](self, "lastKnownReportTime");
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v72 = +[CARAnalytics calendarUnitsOfType:fromDate:toDate:](CARAnalytics, "calendarUnitsOfType:fromDate:toDate:", 64, v70, v71);

    v75 = CarDNDWDLogging(v73, v74);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    v77 = os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT);
    if (v72 > 7)
    {
      if (v77)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Vehicular report occurred after jitter interval.", buf, 2u);
      }

      -[CARDNDManager _cancelUserDisabledTimer](self, "_cancelUserDisabledTimer");
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
      objc_msgSend(v78, "releaseAssertion:", 2);

      goto LABEL_21;
    }
    if (v77)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Ignoring vehicular report - user disabled and still within delay window.", buf, 2u);
    }

  }
LABEL_95:

}

- (void)_beginIdleExitTransaction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager idleExitTransaction](self, "idleExitTransaction"));

  if (!v3)
  {
    v6 = CarDNDWDLogging(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Beginning IE transaction.", v9, 2u);
    }

    v8 = (void *)os_transaction_create("com.apple.carkit.dnd.transaction");
    -[CARDNDManager setIdleExitTransaction:](self, "setIdleExitTransaction:", v8);

  }
}

- (void)_endIdleExitTransaction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager idleExitTransaction](self, "idleExitTransaction"));

  if (v3)
  {
    v6 = CarDNDWDLogging(v4, v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Releasing IE transaction.", v8, 2u);
    }

    -[CARDNDManager setIdleExitTransaction:](self, "setIdleExitTransaction:", 0);
  }
}

- (void)_cancelUserDisabledTimer
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager userDisableTimer](self, "userDisableTimer"));
  objc_msgSend(v3, "invalidate");

  -[CARDNDManager setUserDisableTimer:](self, "setUserDisableTimer:", 0);
}

- (void)_scheduleUserDisabledTimerWithInterval:(double)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *userDisableTimer;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v5 = -[CARDNDManager _cancelUserDisabledTimer](self, "_cancelUserDisabledTimer");
  v7 = CarDNDWDLogging(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v14 = 138412290;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scheduling user disabled timer after %@", (uint8_t *)&v14, 0xCu);

  }
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_userDisabledTimerFired:", 0, 0, a3));
  userDisableTimer = self->_userDisableTimer;
  self->_userDisableTimer = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager userDisableTimer](self, "userDisableTimer"));
  objc_msgSend(v12, "addTimer:forMode:", v13, NSDefaultRunLoopMode);

}

- (void)_userDisabledTimerFired:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = CarDNDWDLogging(self, a2);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User disabled timer fired.", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDManager assertionTrap](self, "assertionTrap"));
  objc_msgSend(v6, "releaseAssertion:", 2);

}

- (void)modeAssertionService:(id)a3 didReceiveModeAssertionInvalidation:(id)a4
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055DDC;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (NSTimer)userDisableTimer
{
  return self->_userDisableTimer;
}

- (void)setUserDisableTimer:(id)a3
{
  objc_storeStrong((id *)&self->_userDisableTimer, a3);
}

- (OS_os_transaction)idleExitTransaction
{
  return self->_idleExitTransaction;
}

- (void)setIdleExitTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_idleExitTransaction, a3);
}

- (BMStream)drivingStream
{
  return self->_drivingStream;
}

- (void)setDrivingStream:(id)a3
{
  objc_storeStrong((id *)&self->_drivingStream, a3);
}

- (BPSSink)biomeDrivingSink
{
  return self->_biomeDrivingSink;
}

- (void)setBiomeDrivingSink:(id)a3
{
  objc_storeStrong((id *)&self->_biomeDrivingSink, a3);
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
  objc_storeStrong((id *)&self->_dndStateService, a3);
}

- (DNDModeConfigurationService)dndModeService
{
  return self->_dndModeService;
}

- (void)setDndModeService:(id)a3
{
  objc_storeStrong((id *)&self->_dndModeService, a3);
}

- (CARDNDStateObserver)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (CARUserAlerts)alertManager
{
  return self->_alertManager;
}

- (void)setAlertManager:(id)a3
{
  objc_storeStrong((id *)&self->_alertManager, a3);
}

- (CARAutomaticDNDStatus)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (CARDNDAssertionTrap)assertionTrap
{
  return self->_assertionTrap;
}

- (void)setAssertionTrap:(id)a3
{
  objc_storeStrong((id *)&self->_assertionTrap, a3);
}

- (CRVehicleStore)vehicleStore
{
  return self->_vehicleStore;
}

- (void)setGeofencingObserver:(id)a3
{
  objc_storeStrong((id *)&self->_geofencingObserver, a3);
}

- (OS_dispatch_queue)CARDNDQueue
{
  return self->_CARDNDQueue;
}

- (void)setCARDNDQueue:(id)a3
{
  objc_storeStrong((id *)&self->_CARDNDQueue, a3);
}

- (BOOL)activatedByUserAction
{
  return self->_activatedByUserAction;
}

- (void)setActivatedByUserAction:(BOOL)a3
{
  self->_activatedByUserAction = a3;
}

- (unint64_t)lastKnownVehicularState
{
  return self->_lastKnownVehicularState;
}

- (void)setLastKnownVehicularState:(unint64_t)a3
{
  self->_lastKnownVehicularState = a3;
}

- (unint64_t)lastKnownVehicularHints
{
  return self->_lastKnownVehicularHints;
}

- (void)setLastKnownVehicularHints:(unint64_t)a3
{
  self->_lastKnownVehicularHints = a3;
}

- (double)lastKnownReportTime
{
  return self->_lastKnownReportTime;
}

- (void)setLastKnownReportTime:(double)a3
{
  self->_lastKnownReportTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CARDNDQueue, 0);
  objc_storeStrong((id *)&self->_geofencingObserver, 0);
  objc_storeStrong((id *)&self->_vehicleStore, 0);
  objc_storeStrong((id *)&self->_assertionTrap, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_alertManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_dndModeService, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_biomeDrivingSink, 0);
  objc_storeStrong((id *)&self->_drivingStream, 0);
  objc_storeStrong((id *)&self->_idleExitTransaction, 0);
  objc_storeStrong((id *)&self->_userDisableTimer, 0);
}

@end
