@implementation CARDNDStateObserver

- (CARDNDStateObserver)initWithRadiosPreferences:(id)a3 vehicleStateClass:(Class)a4
{
  id v7;
  CARDNDStateObserver *v8;
  CARDNDStateObserver *v9;
  CXCallObserver *v10;
  CXCallObserver *callObserver;
  char v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v14;
  void (__cdecl *v15)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef);
  CARDNDStateObserver *v16;
  __CFNotificationCenter *v17;
  uint64_t v18;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CARDNDStateObserver;
  v8 = -[CARDNDStateObserver init](&v20, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_vehicleStateClass, a4);
    objc_storeStrong((id *)&v9->_radiosPreferences, a3);
    -[RadiosPreferences setDelegate:](v9->_radiosPreferences, "setDelegate:", v9);
    -[RadiosPreferences refresh](v9->_radiosPreferences, "refresh");
    v10 = (CXCallObserver *)objc_alloc_init((Class)CXCallObserver);
    callObserver = v9->_callObserver;
    v9->_callObserver = v10;

    v12 = CRDeviceSupportsAutomaticDNDMotionTrigger();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if ((v12 & 1) != 0)
    {
      v14 = (const __CFString *)kCMVehicularStateChangedNotification;
      v15 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_100010E7C;
      v16 = v9;
    }
    else
    {
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_100010DF8, kCMVehicleConnectedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      v14 = (const __CFString *)kCMVehicleDisconnectedNotification;
      v16 = v9;
      v15 = (void (__cdecl *)(CFNotificationCenterRef, void *, CFNotificationName, const void *, CFDictionaryRef))sub_100010DF8;
    }
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, v15, v14, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v17 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v17, v9, (CFNotificationCallback)sub_100010E84, kLostModeChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    sub_100010E84(v18, v9);
  }

  return v9;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;
  void *v5;
  objc_super v6;

  -[RadiosPreferences setDelegate:](self->_radiosPreferences, "setDelegate:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver vehicleStateCheckTimer](self, "vehicleStateCheckTimer"));
  objc_msgSend(v5, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)CARDNDStateObserver;
  -[CARDNDStateObserver dealloc](&v6, "dealloc");
}

+ (BOOL)observesVehicularReports
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v15;
  __int16 v16;
  __int16 v17;

  v2 = CRDeviceSupportsDNDWhileDriving(a1, a2);
  if ((v2 & 1) != 0)
  {
    v6 = +[CRVehicleStoreAvailability isVehicleStoreAvailable](CRVehicleStoreAvailability, "isVehicleStoreAvailable");
    if (v6)
      return 1;
    v15 = CarDNDWDLogging(v6, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 0;
      v13 = "Not fetching vehicle state - device has not unlocked since boot.";
      v14 = (uint8_t *)&v16;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = CarDNDWDLogging(v2, v3, v4, v5);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v13 = "Not fetching vehicle state - device does not support DNDWD.";
      v14 = (uint8_t *)&v17;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }

  return 0;
}

- (BOOL)isInAirplaneMode
{
  return -[RadiosPreferences airplaneMode](self->_radiosPreferences, "airplaneMode");
}

- (BOOL)isInLostMode
{
  void *v2;
  unsigned __int8 v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
  if ((objc_msgSend(v2, "lostModeIsActive") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
    v3 = objc_msgSend(v4, "isManagedLostModeActive");

  }
  return v3;
}

- (NSDate)mostRecentVehicleBTConnectionDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class mostRecentVehicleConnection](-[CARDNDStateObserver vehicleStateClass](self, "vehicleStateClass"), "mostRecentVehicleConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "timeRange"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));

  return (NSDate *)v4;
}

- (void)scheduleVehicleStateCheckWithDelay:(double)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSTimer *v14;
  NSTimer *vehicleStateCheckTimer;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver vehicleStateCheckTimer](self, "vehicleStateCheckTimer"));

  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver vehicleStateCheckTimer](self, "vehicleStateCheckTimer"));
    objc_msgSend(v10, "invalidate");

    v6 = -[CARDNDStateObserver setVehicleStateCheckTimer:](self, "setVehicleStateCheckTimer:", 0);
  }
  v11 = CarDNDWDLogging(v6, v7, v8, v9);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    v18 = 138412290;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Scheduling vehicle state check after %@", (uint8_t *)&v18, 0xCu);

  }
  v14 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "timerWithTimeInterval:target:selector:userInfo:repeats:", self, "_checkVehicleState", 0, 0, a3));
  vehicleStateCheckTimer = self->_vehicleStateCheckTimer;
  self->_vehicleStateCheckTimer = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver vehicleStateCheckTimer](self, "vehicleStateCheckTimer"));
  objc_msgSend(v16, "addTimer:forMode:", v17, NSDefaultRunLoopMode);

}

- (void)airplaneModeChanged
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  char v13;
  void *v14;
  __int16 v15;
  __int16 v16;

  -[RadiosPreferences refresh](self->_radiosPreferences, "refresh");
  v3 = -[CARDNDStateObserver isInAirplaneMode](self, "isInAirplaneMode");
  v7 = CarDNDWDLogging(v3, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v9)
      goto LABEL_7;
    v16 = 0;
    v10 = "Airplane mode now active.";
    v11 = (uint8_t *)&v16;
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    v15 = 0;
    v10 = "Airplane mode now inactive.";
    v11 = (uint8_t *)&v15;
  }
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
LABEL_7:

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "stateMachine:receivedAirplaneMode:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver delegate](self, "delegate"));
    objc_msgSend(v14, "stateMachine:receivedAirplaneMode:", self, v3);

  }
}

- (void)_checkVehicleState
{
  id WeakRetained;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  int v36;
  void *v37;

  if (objc_msgSend((id)objc_opt_class(self), "observesVehicularReports"))
  {
    if (CRDeviceSupportsAutomaticDNDMotionTrigger())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      v4 = (uint64_t)objc_msgSend(WeakRetained, "vehicularState");

      v5 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      v6 = (uint64_t)objc_msgSend(v5, "vehicularHints");

      v7 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      v8 = objc_msgSend(v7, "vehicularOperatorState");

    }
    else
    {
      if (-[CARDNDStateObserver connected](self, "connected"))
        v4 = 2;
      else
        v4 = 1;
      v9 = -[CARDNDStateObserver connected](self, "connected");
      v8 = 0;
      if (v9)
        v6 = 16;
      else
        v6 = 0;
    }
    v13 = CarDNDWDLogging(v9, v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
      v36 = 138412290;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Fetched CM vehicle state: %@", (uint8_t *)&v36, 0xCu);

    }
    if (v4)
    {
      v20 = objc_loadWeakRetained((id *)&self->_vehicleStateClass);
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mostRecentVehicleConnection"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject deviceId](v21, "deviceId"));
      v24 = (void *)objc_opt_new(_CARVehicleState, v23);
      objc_msgSend(v24, "setDeviceID:", v22);
      objc_msgSend(v24, "setVehicleState:", v4);
      objc_msgSend(v24, "setVehicularHints:", v6);
      v25 = objc_msgSend(v24, "setVehicleOperatorState:", v8);
      v29 = CarDNDWDLogging(v25, v26, v27, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "vehicleStateDebugDescription"));
        v36 = 138543362;
        v37 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Generated vehicle state %{public}@", (uint8_t *)&v36, 0xCu);

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver delegate](self, "delegate"));
      v33 = objc_opt_respondsToSelector(v32, "stateMachine:receivedVehicleState:");

      if ((v33 & 1) != 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CARDNDStateObserver delegate](self, "delegate"));
        objc_msgSend(v34, "stateMachine:receivedVehicleState:", self, v24);

      }
    }
    else
    {
      v35 = CarDNDWDLogging(v16, v17, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Ignoring unknown vehicular state.", (uint8_t *)&v36, 2u);
      }
    }

  }
}

- (Class)vehicleStateClass
{
  return (Class)objc_loadWeakRetained((id *)&self->_vehicleStateClass);
}

- (RadiosPreferences)radiosPreferences
{
  return self->_radiosPreferences;
}

- (CARDNDStateDelegate)delegate
{
  return (CARDNDStateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
  objc_storeStrong((id *)&self->_callObserver, a3);
}

- (NSTimer)vehicleStateCheckTimer
{
  return self->_vehicleStateCheckTimer;
}

- (void)setVehicleStateCheckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleStateCheckTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleStateCheckTimer, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radiosPreferences, 0);
  objc_destroyWeak((id *)&self->_vehicleStateClass);
}

@end
