@implementation PRCoreLocationClient

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void (**regulatoryLocationHandler)(id, _QWORD, double, double, double, double, double);
  void *v20;
  double v21;
  id v22;

  v5 = a4;
  if (v5)
  {
    v22 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    -[PRCoreLocationClient setLocation:](self, "setLocation:", v6);
    if (self->_regulatoryLocationHandler)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      objc_msgSend(v7, "coordinate");
      v9 = v8;

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      objc_msgSend(v10, "coordinate");
      v12 = v11;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      objc_msgSend(v13, "altitude");
      v15 = v14;

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PRCoreLocationClient location](self, "location"));
      objc_msgSend(v16, "horizontalAccuracy");
      v18 = v17;

      regulatoryLocationHandler = (void (**)(id, _QWORD, double, double, double, double, double))self->_regulatoryLocationHandler;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timestamp"));
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      regulatoryLocationHandler[2](regulatoryLocationHandler, 0, v9, v12, v15, v18, v21);

    }
    v5 = v22;
  }

}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (PRCoreLocationClient)initWithQueue:(id)a3
{
  id v5;
  PRCoreLocationClient *v6;
  PRCoreLocationClient *v7;
  CLLocationManager *v8;
  CLLocationManager *manager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRCoreLocationClient;
  v6 = -[PRCoreLocationClient init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/UWBRegulatory.bundle"), v7, v5);
    manager = v7->_manager;
    v7->_manager = v8;

    -[CLLocationManager setDesiredAccuracy:](v7->_manager, "setDesiredAccuracy:", 2147483650.0);
    *(_WORD *)&v7->_isMonitoringLocation = 0;
  }

  return v7;
}

- (BOOL)startMonitoring
{
  CLLocationManager *manager;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  _QWORD block[5];

  manager = self->_manager;
  v4 = qword_10085B6F0;
  v5 = os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG);
  if (manager)
  {
    if (v5)
      sub_1003E5E98((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
    if (self->_isMonitoringLocation)
    {
      if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
        sub_1003E5E6C();
    }
    else
    {
      self->_isMonitoringLocation = 1;
      -[CLLocationManager startUpdatingLocation](self->_manager, "startUpdatingLocation");
      if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
        sub_1003E5E40();
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002A5190;
      block[3] = &unk_1007FB340;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
  else if (v5)
  {
    sub_1003E5F00();
  }
  return manager != 0;
}

- (BOOL)stopMonitoring
{
  CLLocationManager *manager;

  manager = self->_manager;
  if (manager)
  {
    if (self->_isMonitoringLocation)
    {
      self->_isMonitoringLocation = 0;
      -[CLLocationManager stopUpdatingLocation](manager, "stopUpdatingLocation");
      if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
        sub_1003E5F58();
    }
    else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
    {
      sub_1003E5F2C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
  {
    sub_1003E5F84();
  }
  return manager != 0;
}

- (BOOL)upgradeToBestAccuracyMonitoring
{
  CLLocationManager *manager;

  manager = self->_manager;
  if (manager)
  {
    -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", -1.0);
    if (self->_isMonitoringLocation)
    {
      -[PRCoreLocationClient stopMonitoring](self, "stopMonitoring");
      -[PRCoreLocationClient startMonitoring](self, "startMonitoring");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
    {
      sub_1003E5FB0();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
  {
    sub_1003E5FDC();
  }
  return manager != 0;
}

- (BOOL)dowgradeToBystanderMonitoring
{
  CLLocationManager *manager;

  manager = self->_manager;
  if (manager)
  {
    -[CLLocationManager setDesiredAccuracy:](self->_manager, "setDesiredAccuracy:", 2147483650.0);
    if (self->_isMonitoringLocation)
    {
      -[PRCoreLocationClient stopMonitoring](self, "stopMonitoring");
      -[PRCoreLocationClient startMonitoring](self, "startMonitoring");
    }
    else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
    {
      sub_1003E6008();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
  {
    sub_1003E6034();
  }
  return manager != 0;
}

- (void)updateLocationAuthorized
{
  void (**regulatoryLocationAuthorized)(id, BOOL);

  regulatoryLocationAuthorized = (void (**)(id, BOOL))self->_regulatoryLocationAuthorized;
  if (regulatoryLocationAuthorized)
    regulatoryLocationAuthorized[2](regulatoryLocationAuthorized, self->_isLocationAuthorized);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v5 = qword_10085B6F0;
  if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
    sub_1003E6060((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = qword_10085B6F0;
  if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
    sub_1003E60F0(v4, v7, v8, v9, v10, v11, v12, v13);
  v15 = (_DWORD)v4 == 3 || (_DWORD)v4 == 0;
  self->_isLocationAuthorized = v15;
  if (self->_isMonitoringLocation)
  {
    -[PRCoreLocationClient updateLocationAuthorized](self, "updateLocationAuthorized");
  }
  else if (os_log_type_enabled((os_log_t)qword_10085B6F0, OS_LOG_TYPE_DEBUG))
  {
    sub_1003E60C4();
  }

}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (id)regulatoryLocationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setRegulatoryLocationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)regulatoryLocationAuthorized
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setRegulatoryLocationAuthorized:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regulatoryLocationAuthorized, 0);
  objc_storeStrong(&self->_regulatoryLocationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
