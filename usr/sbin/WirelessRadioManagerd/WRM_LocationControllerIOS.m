@implementation WRM_LocationControllerIOS

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void (**v21)(_QWORD, _QWORD, double, double, double, double, double, double);
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  uint64_t v27;
  id v28;
  id v29;

  v28 = a3;
  v6 = a4;
  if (self->_isMonitoringLocation)
  {
    if (v6)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: didUpdateLocations %@"), v6, v28);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      -[WRM_LocationControllerIOS setLocation:](self, "setLocation:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS clientLocationHandler](self, "clientLocationHandler"));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS location](self, "location"));
        objc_msgSend(v9, "coordinate");
        v11 = v10;

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS location](self, "location"));
        objc_msgSend(v12, "coordinate");
        v14 = v13;

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS location](self, "location"));
        objc_msgSend(v15, "altitude");
        v17 = v16;

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS location](self, "location"));
        objc_msgSend(v18, "horizontalAccuracy");
        v20 = v19;

        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: invoke clientLocationHandler"));
        v21 = (void (**)(_QWORD, _QWORD, double, double, double, double, double, double))objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS clientLocationHandler](self, "clientLocationHandler"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timestamp"));
        objc_msgSend(v22, "timeIntervalSinceReferenceDate");
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS location](self, "location"));
        objc_msgSend(v25, "speed");
        v21[2](v21, 0, v11, v14, v17, v20, v24, v26);

      }
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: nil location"), v27, v28);
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: location received while stopped %@"), v6, v28);
  }

}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 32, 1);
}

- (id)clientLocationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (WRM_LocationControllerIOS)initWithDesiredAccuracy:(double)a3 distanceFilter:(double)a4
{
  id v6;
  dispatch_queue_t v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WRM_LocationControllerIOS;
  v6 = -[WRM_LocationControllerIOS init](&v15, "init");
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.WirelessRadioManager.Location", 0);
    v8 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v7;

    *((_WORD *)v6 + 12) = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: init\n"));
    v9 = *((_QWORD *)v6 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D0E0C;
    block[3] = &unk_1002058E0;
    v12 = v6;
    v13 = a3;
    v14 = a4;
    dispatch_async(v9, block);

  }
  return (WRM_LocationControllerIOS *)v6;
}

- (void)startMonitoring
{
  NSObject *mAlarmQueue;
  _QWORD block[5];

  mAlarmQueue = self->_mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D0F54;
  block[3] = &unk_100205908;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopMonitoring
{
  NSObject *mAlarmQueue;
  _QWORD block[5];

  mAlarmQueue = self->_mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D1038;
  block[3] = &unk_100205908;
  block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)updateLocationAuthorized_sync
{
  void *v3;
  void (**v4)(id, BOOL);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS clientLocationAuthorized](self, "clientLocationAuthorized"));

  if (v3)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: updateLocationAuthorized"));
    v4 = (void (**)(id, BOOL))objc_claimAutoreleasedReturnValue(-[WRM_LocationControllerIOS clientLocationAuthorized](self, "clientLocationAuthorized"));
    v4[2](v4, self->_isLocationAuthorized);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (a4)
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: didFailWithError,%@"), a4);
}

- (BOOL)isLocationAuthorized
{
  return self->_isLocationAuthorized;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  BOOL v7;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("LocationController: didChangeAuthorizationStatus,%d"), *(_QWORD *)&a4);
  v7 = a4 == 3 || a4 == 0;
  self->_isLocationAuthorized = v7;
  -[WRM_LocationControllerIOS updateLocationAuthorized_sync](self, "updateLocationAuthorized_sync");
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (void)setClientLocationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)clientLocationAuthorized
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setClientLocationAuthorized:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientLocationAuthorized, 0);
  objc_storeStrong(&self->_clientLocationHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_mAlarmQueue, 0);
}

@end
