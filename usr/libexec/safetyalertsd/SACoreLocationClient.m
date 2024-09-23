@implementation SACoreLocationClient

- (SACoreLocationClient)initWithQueue:(id)a3
{
  id v5;
  SACoreLocationClient *v6;
  SACoreLocationClient *v7;
  CLLocationManager *v8;
  CLLocationManager *manager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SACoreLocationClient;
  v6 = -[SACoreLocationClient init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/SafetyAlerts.bundle"), v7, v5);
    manager = v7->_manager;
    v7->_manager = v8;

    -[CLLocationManager setDesiredAccuracy:](v7->_manager, "setDesiredAccuracy:", 1000.0);
    *(_WORD *)&v7->_isLocationAuthorized = 0;
  }

  return v7;
}

- (BOOL)startMonitoring
{
  CLLocationManager *manager;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL4 isMonitoringLocation;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  OS_dispatch_queue *queue;
  _QWORD block[5];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;

  manager = self->_manager;
  v4 = SALogObjectGeneral;
  v5 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (manager)
  {
    if (v5)
    {
      isMonitoringLocation = self->_isMonitoringLocation;
      *(_DWORD *)buf = 68289282;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1026;
      v19 = isMonitoringLocation;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,,startMonitoring,\", \"_isMonitoringLocation\":%{public}hhd}", buf, 0x18u);
    }
    if (self->_isMonitoringLocation)
    {
      v7 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        v8 = "{\"msg%{public}.0s\":\"#lm,startMonitoring,skipped,reason,alreadyStarted\"}";
        v9 = v7;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, 0x12u);
      }
    }
    else
    {
      self->_isMonitoringLocation = 1;
      -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", 1000.0);
      -[CLLocationManager startMonitoringSignificantLocationChanges](self->_manager, "startMonitoringSignificantLocationChanges");
      v10 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        v15 = 0;
        v16 = 2082;
        v17 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,startMonitoring,done\"}", buf, 0x12u);
      }
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000A6A10;
      block[3] = &unk_1000F7398;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 68289026;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v8 = "{\"msg%{public}.0s\":\"#lm,startMonitoring,skipped,reason,notInitialized\"}";
    v9 = v4;
    goto LABEL_9;
  }
  return manager != 0;
}

- (BOOL)stopMonitoring
{
  CLLocationManager *manager;
  NSObject *v3;
  const char *v4;
  int v6;
  int v7;
  __int16 v8;
  const char *v9;

  manager = self->_manager;
  if (manager)
  {
    if (self->_isMonitoringLocation)
    {
      self->_isMonitoringLocation = 0;
      -[CLLocationManager stopMonitoringSignificantLocationChanges](manager, "stopMonitoringSignificantLocationChanges");
      v3 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 68289026;
        v7 = 0;
        v8 = 2082;
        v9 = "";
        v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,done.\"}";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0x12u);
      }
    }
    else
    {
      v3 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 68289026;
        v7 = 0;
        v8 = 2082;
        v9 = "";
        v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,skipped,reason,alreadyStopped\"}";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v3 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 68289026;
      v7 = 0;
      v8 = 2082;
      v9 = "";
      v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,skipped,reason,notInitialized\"}";
      goto LABEL_9;
    }
  }
  return manager != 0;
}

- (void)requestSingleShotLocation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", 100.0);
  -[CLLocationManager requestLocation](self->_manager, "requestLocation");
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,requestSingleShotLocation,done.\"}", (uint8_t *)v4, 0x12u);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  SACoreLocation *v33;
  double v34;
  _DWORD v35[2];
  __int16 v36;
  const char *v37;
  __int16 v38;
  id v39;
  CLLocationCoordinate2D v40;

  v7 = a3;
  v8 = a4;
  v9 = objc_autoreleasePoolPush();
  v10 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v35[0] = 68289283;
    v35[1] = 0;
    v36 = 2082;
    v37 = "";
    v38 = 2113;
    v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#lm,didUpdateLocations\", \"locations\":%{private, location:escape_only}@}", (uint8_t *)v35, 0x1Cu);
  }
  if (v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject"));
    -[SACoreLocationClient setLocation:](self, "setLocation:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
      objc_msgSend(v13, "coordinate");
      if (!CLLocationCoordinate2DIsValid(v40))
      {
LABEL_14:

        goto LABEL_15;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
      objc_msgSend(v14, "coordinate");
      v16 = v15;
      if (v15 == 0.0)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        objc_msgSend(v4, "coordinate");
        if (v17 == 0.0)
        {

          goto LABEL_14;
        }
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
      objc_msgSend(v18, "horizontalAccuracy");
      v20 = v19;

      if (v16 == 0.0)
      {

        if (v20 <= 0.0)
          goto LABEL_15;
        goto LABEL_13;
      }

      if (v20 > 0.0)
      {
LABEL_13:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        objc_msgSend(v21, "coordinate");
        v23 = v22;

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        objc_msgSend(v24, "coordinate");
        v26 = v25;

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        objc_msgSend(v27, "altitude");
        v29 = v28;

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        objc_msgSend(v30, "horizontalAccuracy");
        v32 = v31;

        v33 = -[SACoreLocationClient clProxy](self, "clProxy");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SACoreLocationClient location](self, "location"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timestamp"));
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        (*((void (**)(SACoreLocation *, _QWORD, double, double, double, double, double))v33->var0 + 4))(v33, 0, v23, v26, v29, v32, v34);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  objc_autoreleasePoolPop(v9);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  void *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  v4 = a4;
  v5 = objc_autoreleasePoolPush();
  v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2114;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,didFailWithError\", \"error\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
  objc_autoreleasePoolPop(v5);

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  SACoreLocation *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;

  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  self->_isLocationAuthorized = a4 == 3;
  v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289538;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 1026;
    v14 = a4;
    v15 = 1026;
    v16 = a4 == 3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,didChangeAuthorizationStatus\", \"authStatus\":%{public}d, \"isAuthorized\":%{public}hhd}", (uint8_t *)v10, 0x1Eu);
  }
  v9 = -[SACoreLocationClient clProxy](self, "clProxy");
  (*((void (**)(SACoreLocation *, BOOL))v9->var0 + 5))(v9, self->_isLocationAuthorized);
  objc_autoreleasePoolPop(v7);

}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (SACoreLocation)clProxy
{
  return self->_clProxy;
}

- (void)setClProxy:(SACoreLocation *)a3
{
  self->_clProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
