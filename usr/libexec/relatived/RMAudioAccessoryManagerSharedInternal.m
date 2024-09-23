@implementation RMAudioAccessoryManagerSharedInternal

+ (id)sharedInternal
{
  if (qword_10002C908 != -1)
    dispatch_once(&qword_10002C908, &stru_100024C50);
  return (id)qword_10002C900;
}

- (RMAudioAccessoryManagerSharedInternal)init
{
  RMAudioAccessoryManagerSharedInternal *v2;
  void *v3;
  CMAudioAccessoryManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RMAudioAccessoryManagerSharedInternal;
  v2 = -[RMAudioAccessoryManagerSharedInternal init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[RMAudioAccessoryManagerSharedInternal setManagers:](v2, "setManagers:", v3);

    v4 = objc_opt_new(CMAudioAccessoryManager);
    -[RMAudioAccessoryManagerSharedInternal setAudioAccessoryManager:](v2, "setAudioAccessoryManager:", v4);

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](v2, "setDeviceMotionActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setLastDeviceStatus:](v2, "setLastDeviceStatus:", 1);
    -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](v2, "setStatusUpdatesActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](v2, "setMotionActivityActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setTempestActive:](v2, "setTempestActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:](v2, "setActiveAudioRouteDeviceID:", 0);
    -[RMAudioAccessoryManagerSharedInternal startMonitoringActiveAudioRoute](v2, "startMonitoringActiveAudioRoute");
  }
  return v2;
}

- (BOOL)shouldActivateStatusUpdates
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (+[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "deviceMotionStatusHandler"));

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopStatusUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateStatusUpdates](self, "shouldActivateStatusUpdates"))
    -[RMAudioAccessoryManagerSharedInternal startStatusUpdates](self, "startStatusUpdates");
  else
    -[RMAudioAccessoryManagerSharedInternal stopStatusUpdates](self, "stopStatusUpdates");
}

- (void)startStatusUpdates
{
  void *v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  if (!-[RMAudioAccessoryManagerSharedInternal statusUpdatesActive](self, "statusUpdatesActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_10000A4DC;
    v8 = &unk_100024C78;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "_startAudioAccessoryDeviceMotionStatusUpdatesToQueue:withHandler:", v4, &v5);

    -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](self, "setStatusUpdatesActive:", 1, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);
}

- (void)stopStatusUpdates
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
  objc_msgSend(v3, "_stopAudioAccessoryDeviceMotionStatusUpdates");

  -[RMAudioAccessoryManagerSharedInternal setLastDeviceStatus:](self, "setLastDeviceStatus:", 1);
  -[RMAudioAccessoryManagerSharedInternal setStatusUpdatesActive:](self, "setStatusUpdatesActive:", 0);
}

- (BOOL)shouldActivateDeviceMotionUpdates
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (+[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "deviceMotionHandler"));

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopDeviceMotionUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateDeviceMotionUpdates](self, "shouldActivateDeviceMotionUpdates"))
  {
    -[RMAudioAccessoryManagerSharedInternal startDeviceMotionUpdates](self, "startDeviceMotionUpdates");
  }
  else
  {
    -[RMAudioAccessoryManagerSharedInternal stopDeviceMotionUpdates](self, "stopDeviceMotionUpdates");
  }
}

- (void)startDeviceMotionUpdates
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, void *);
  void *v9;
  id v10;
  id location;

  if (!-[RMAudioAccessoryManagerSharedInternal isDeviceMotionActive](self, "isDeviceMotionActive"))
  {
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:](self, "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:", -[RMAudioAccessoryManagerSharedInternal isTempestActive](self, "isTempestActive"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    objc_msgSend(v3, "_setAudioAccessoryDeviceMotionUpdateInterval:", 0.04);

    objc_initWeak(&location, self);
    -[RMAudioAccessoryManagerSharedInternal setLastDMSampleTime:](self, "setLastDMSampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastDMPrintTime:](self, "setLastDMPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setDmSamplesPerSecond:](self, "setDmSamplesPerSecond:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10000A970;
    v9 = &unk_100024CA0;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v4, "_startAudioAccessoryDeviceMotionUpdatesToQueue:lowLatencyMode:withHandler:", v5, 1, &v6);

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](self, "setDeviceMotionActive:", 1, v6, v7, v8, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)stopDeviceMotionUpdates
{
  void *v3;

  if (-[RMAudioAccessoryManagerSharedInternal isDeviceMotionActive](self, "isDeviceMotionActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    objc_msgSend(v3, "_stopAudioAccessoryDeviceMotionUpdates");

    -[RMAudioAccessoryManagerSharedInternal setDeviceMotionActive:](self, "setDeviceMotionActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setLastDMSampleTime:](self, "setLastDMSampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastDMPrintTime:](self, "setLastDMPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setDmSamplesPerSecond:](self, "setDmSamplesPerSecond:", 0);
    -[RMAudioAccessoryManagerSharedInternal startOrStopStatusUpdates](self, "startOrStopStatusUpdates");
  }
}

- (BOOL)shouldActivateActivityUpdates
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (+[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal managers](self, "managers", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v3);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "activityHandler"));

          if (v7)
          {
            LOBYTE(v4) = 1;
            goto LABEL_13;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)startOrStopActivityUpdates
{
  if (-[RMAudioAccessoryManagerSharedInternal shouldActivateActivityUpdates](self, "shouldActivateActivityUpdates"))
    -[RMAudioAccessoryManagerSharedInternal startActivityUpdates](self, "startActivityUpdates");
  else
    -[RMAudioAccessoryManagerSharedInternal stopActivityUpdates](self, "stopActivityUpdates");
}

- (void)startActivityUpdates
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id location;

  if (!-[RMAudioAccessoryManagerSharedInternal motionActivityActive](self, "motionActivityActive"))
  {
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:](self, "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:", -[RMAudioAccessoryManagerSharedInternal isTempestActive](self, "isTempestActive"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    objc_msgSend(v3, "_setAudioAccessoryActivityUpdateInterval:", 0.2);

    -[RMAudioAccessoryManagerSharedInternal setLastActivitySampleTime:](self, "setLastActivitySampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastActivityPrintTime:](self, "setLastActivityPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setActivitySamplesPerSecond:](self, "setActivitySamplesPerSecond:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMHeadphoneActivityManager sharedInstance](RMHeadphoneActivityManager, "sharedInstance"));
    v5 = objc_msgSend(v4, "mslLoggingEnabled");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RMHeadphoneActivityManager sharedInstance](RMHeadphoneActivityManager, "sharedInstance"));
      objc_msgSend(v6, "startMslLogging");

    }
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_10000AF88;
    v12 = &unk_100024CC8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v7, "_startAudioAccessoryActivityUpdatesToQueue:withHandler:", v8, &v9);

    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](self, "setMotionActivityActive:", 1, v9, v10, v11, v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)stopActivityUpdates
{
  void *v3;
  void *v4;

  if (-[RMAudioAccessoryManagerSharedInternal motionActivityActive](self, "motionActivityActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal audioAccessoryManager](self, "audioAccessoryManager"));
    objc_msgSend(v3, "_stopAudioAccessoryActivityUpdates");

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMHeadphoneActivityManager sharedInstance](RMHeadphoneActivityManager, "sharedInstance"));
    objc_msgSend(v4, "stopMslLogging");

    -[RMAudioAccessoryManagerSharedInternal setMotionActivityActive:](self, "setMotionActivityActive:", 0);
    -[RMAudioAccessoryManagerSharedInternal setLastActivitySampleTime:](self, "setLastActivitySampleTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setLastActivityPrintTime:](self, "setLastActivityPrintTime:", 0.0);
    -[RMAudioAccessoryManagerSharedInternal setActivitySamplesPerSecond:](self, "setActivitySamplesPerSecond:", 0);
  }
}

- (void)setTempestActive:(BOOL)a3
{
  RMAudioAccessoryManagerSharedInternal *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_tempestActive = a3;
  if (-[RMAudioAccessoryManagerSharedInternal isTempestActive](obj, "isTempestActive"))
    -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:](obj, "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:", 1);
  objc_sync_exit(obj);

}

- (void)startMonitoringActiveAudioRoute
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](AVOutputContext, "sharedSystemAudioContext"));
  v4 = (void *)qword_10002C910;
  qword_10002C910 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "onActiveAudioRouteChanged:", AVOutputContextOutputDeviceDidChangeNotification, 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "onActiveAudioRouteChanged:", AVOutputContextOutputDevicesDidChangeNotification, 0);

}

- (void)onActiveAudioRouteChanged:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024CE8);
  v5 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] Active audio route changed", v6, 2u);
  }
  -[RMAudioAccessoryManagerSharedInternal updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:](self, "updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:", 0);

}

- (void)updateActiveAudioRouteDeviceIDAllowingSimulatedCrash:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RMAudioAccessoryManagerSharedInternal *obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if ((+[CMAudioAccessoryManager _isAvailable](CMAudioAccessoryManager, "_isAvailable") & 1) != 0)
  {
    -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:](obj, "setActiveAudioRouteDeviceID:", 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVOutputContext sharedSystemAudioContext](AVOutputContext, "sharedSystemAudioContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "outputDevices"));

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v29;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
          v11 = objc_msgSend(v10, "containsString:", CFSTR("Speaker"));

          if ((v11 & 1) == 0)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelID"));
            v14 = +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:](CMAudioAccessoryManager, "_selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:", v12, v13);

            if ((v14 & 1) != 0)
            {
              if (qword_10002C4B0 != -1)
                dispatch_once(&qword_10002C4B0, &stru_100024CE8);
              v22 = (id)qword_10002C4B8;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelID"));
                *(_DWORD *)buf = 138543875;
                v33 = v23;
                v34 = 2113;
                v35 = v24;
                v36 = 2113;
                v37 = v25;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] relatived sucessfully selected active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);

              }
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
              -[RMAudioAccessoryManagerSharedInternal setActiveAudioRouteDeviceID:](obj, "setActiveAudioRouteDeviceID:", v26);

              -[RMAudioAccessoryManagerSharedInternal postAudioRouteChangeCompleted](obj, "postAudioRouteChangeCompleted");
              goto LABEL_27;
            }
            if (+[RMPlatformInfo isInternalBuild](RMPlatformInfo, "isInternalBuild") && v3)
            {
              if (qword_10002C4B0 != -1)
                dispatch_once(&qword_10002C4B0, &stru_100024CE8);
              v15 = (id)qword_10002C4B8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
              {
                v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
                v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelID"));
                *(_DWORD *)buf = 138543875;
                v33 = v16;
                v34 = 2113;
                v35 = v17;
                v36 = 2113;
                v37 = v18;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);

              }
            }
            else
            {
              if (qword_10002C4B0 != -1)
                dispatch_once(&qword_10002C4B0, &stru_100024CE8);
              v15 = (id)qword_10002C4B8;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceID"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelID"));
                *(_DWORD *)buf = 138543875;
                v33 = v19;
                v34 = 2113;
                v35 = v20;
                v36 = 2113;
                v37 = v21;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "[RMAudioAccessoryManager] relatived failed to select active audio route for device %{public}@ ID %{private}@ model %{private}@", buf, 0x20u);

              }
            }

          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
        if (v6)
          continue;
        break;
      }
    }

    +[CMAudioAccessoryManager _selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:](CMAudioAccessoryManager, "_selectActiveAudioRouteForDeviceMotionWithBTAddress:modelID:", 0, 0);
    -[RMAudioAccessoryManagerSharedInternal postAudioRouteChangeCompleted](obj, "postAudioRouteChangeCompleted");
  }
LABEL_27:
  objc_sync_exit(obj);

}

- (void)postAudioRouteChangeCompleted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal activeAudioRouteDeviceID](self, "activeAudioRouteDeviceID"));

  if (v3)
  {
    v7 = CFSTR("RMAudioDeviceChangeCompletedRouteIDKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioAccessoryManagerSharedInternal activeAudioRouteDeviceID](self, "activeAudioRouteDeviceID"));
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  }
  else
  {
    v5 = &__NSDictionary0__struct;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("RMAudioDeviceChangeCompletedNotification"), 0, v5);

}

- (NSHashTable)managers
{
  return self->_managers;
}

- (void)setManagers:(id)a3
{
  objc_storeStrong((id *)&self->_managers, a3);
}

- (CMAudioAccessoryManager)audioAccessoryManager
{
  return self->_audioAccessoryManager;
}

- (void)setAudioAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_audioAccessoryManager, a3);
}

- (BOOL)isDeviceMotionActive
{
  return self->_deviceMotionActive;
}

- (void)setDeviceMotionActive:(BOOL)a3
{
  self->_deviceMotionActive = a3;
}

- (BOOL)statusUpdatesActive
{
  return self->_statusUpdatesActive;
}

- (void)setStatusUpdatesActive:(BOOL)a3
{
  self->_statusUpdatesActive = a3;
}

- (int64_t)lastDeviceStatus
{
  return self->_lastDeviceStatus;
}

- (void)setLastDeviceStatus:(int64_t)a3
{
  self->_lastDeviceStatus = a3;
}

- (BOOL)motionActivityActive
{
  return self->_motionActivityActive;
}

- (void)setMotionActivityActive:(BOOL)a3
{
  self->_motionActivityActive = a3;
}

- (BOOL)isTempestActive
{
  return self->_tempestActive;
}

- (NSString)activeAudioRouteDeviceID
{
  return self->_activeAudioRouteDeviceID;
}

- (void)setActiveAudioRouteDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)dmSamplesPerSecond
{
  return self->_dmSamplesPerSecond;
}

- (void)setDmSamplesPerSecond:(unint64_t)a3
{
  self->_dmSamplesPerSecond = a3;
}

- (unint64_t)dmSampleRate
{
  return self->_dmSampleRate;
}

- (void)setDmSampleRate:(unint64_t)a3
{
  self->_dmSampleRate = a3;
}

- (double)lastDMSampleTime
{
  return self->_lastDMSampleTime;
}

- (void)setLastDMSampleTime:(double)a3
{
  self->_lastDMSampleTime = a3;
}

- (double)lastDMPrintTime
{
  return self->_lastDMPrintTime;
}

- (void)setLastDMPrintTime:(double)a3
{
  self->_lastDMPrintTime = a3;
}

- (unint64_t)activitySamplesPerSecond
{
  return self->_activitySamplesPerSecond;
}

- (void)setActivitySamplesPerSecond:(unint64_t)a3
{
  self->_activitySamplesPerSecond = a3;
}

- (unint64_t)activitySampleRate
{
  return self->_activitySampleRate;
}

- (void)setActivitySampleRate:(unint64_t)a3
{
  self->_activitySampleRate = a3;
}

- (double)lastActivitySampleTime
{
  return self->_lastActivitySampleTime;
}

- (void)setLastActivitySampleTime:(double)a3
{
  self->_lastActivitySampleTime = a3;
}

- (double)lastActivityPrintTime
{
  return self->_lastActivityPrintTime;
}

- (void)setLastActivityPrintTime:(double)a3
{
  self->_lastActivityPrintTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAudioRouteDeviceID, 0);
  objc_storeStrong((id *)&self->_audioAccessoryManager, 0);
  objc_storeStrong((id *)&self->_managers, 0);
}

@end
