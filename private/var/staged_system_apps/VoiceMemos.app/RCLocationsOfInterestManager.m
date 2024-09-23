@implementation RCLocationsOfInterestManager

- (RCLocationsOfInterestManager)init
{
  RCLocationsOfInterestManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCLocationsOfInterestManager;
  v2 = -[RCLocationsOfInterestManager init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.voicememod.RCLocationsOfInterestManager.serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)defaultManager
{
  if (qword_1001ED908 != -1)
    dispatch_once(&qword_1001ED908, &stru_1001AC6C0);
  return (id)qword_1001ED900;
}

- (void)_didFetchPlaceInferences:(id)a3 location:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *locationsOfInterest;
  uint64_t v14;
  NSObject *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (self->_active)
  {
    if (v8)
    {
      objc_storeStrong((id *)&self->_currentLocation, a4);
      v12 = (NSArray *)objc_msgSend(v8, "copy");
      locationsOfInterest = self->_locationsOfInterest;
      self->_locationsOfInterest = v12;

      if (self->_placeInferencePolicy != 3)
      {
        self->_placeInferencePolicy = 3;
        -[RCLocationsOfInterestManager _requestPlaceInferences](self, "_requestPlaceInferences");
      }
    }
    else if (v10)
    {
      v14 = OSLogForCategory(kVMLogCategoryDefault);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_10010C44C();

    }
  }

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (self->_active && (self->_authorizationStatus - 3) <= 1)
    -[RCLocationsOfInterestManager _requestPlaceInferences](self, "_requestPlaceInferences");

}

- (void)_requestPlaceInferences
{
  void *v3;
  CLLocationManager *locationManager;
  unint64_t placeInferencePolicy;
  _QWORD v6[5];
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocationManager location](self->_locationManager, "location"));
  if (v3
    && !self->_isFetchingPlacesOfInterest
    && (objc_opt_respondsToSelector(self->_locationManager, "_fetchPlaceInferencesWithFidelityPolicy:handler:") & 1) != 0)
  {
    self->_isFetchingPlacesOfInterest = 1;
    locationManager = self->_locationManager;
    placeInferencePolicy = self->_placeInferencePolicy;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006C70;
    v6[3] = &unk_1001AC2E8;
    v6[4] = self;
    v7 = v3;
    -[CLLocationManager _fetchPlaceInferencesWithFidelityPolicy:handler:](locationManager, "_fetchPlaceInferencesWithFidelityPolicy:handler:", placeInferencePolicy, v6);

  }
}

- (void)start
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B6DC;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)prepare
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004EF0;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4;
  int v5;
  CLLocation *currentLocation;
  NSArray *locationsOfInterest;

  v4 = objc_msgSend(a3, "authorizationStatus");
  v5 = v4;
  if (v4 - 1 < 2)
  {
    -[RCLocationsOfInterestManager _stopMonitoringLocation](self, "_stopMonitoringLocation");
    currentLocation = self->_currentLocation;
    self->_currentLocation = 0;

    locationsOfInterest = self->_locationsOfInterest;
    self->_locationsOfInterest = 0;

  }
  else if (v4 - 3 >= 2)
  {
    if (!v4)
      -[CLLocationManager requestWhenInUseAuthorization](self->_locationManager, "requestWhenInUseAuthorization");
  }
  else if (self->_active && (self->_authorizationStatus - 3) >= 2)
  {
    -[RCLocationsOfInterestManager _startMonitoringLocation](self, "_startMonitoringLocation");
  }
  self->_authorizationStatus = v5;
}

- (void)_startMonitoringLocation
{
  -[CLLocationManager startMonitoringSignificantLocationChanges](self->_locationManager, "startMonitoringSignificantLocationChanges");
  -[CLLocationManager requestLocation](self->_locationManager, "requestLocation");
  self->_placeInferencePolicy = 1;
  -[RCLocationsOfInterestManager _requestPlaceInferences](self, "_requestPlaceInferences");
}

- (void)stop
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000641F0;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_stopMonitoringLocation
{
  if (self->_active)
  {
    if ((self->_authorizationStatus - 3) <= 1)
      -[CLLocationManager stopMonitoringSignificantLocationChanges](self->_locationManager, "stopMonitoringSignificantLocationChanges");
    self->_active = 0;
  }
}

- (CLLocation)currentLocation
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000642EC;
  v10 = sub_1000642FC;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100064304;
  v5[3] = &unk_1001AC6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

- (NSArray)locationsOfInterest
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1000642EC;
  v10 = sub_1000642FC;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000643F0;
  v5[3] = &unk_1001AC6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (objc_msgSend(v6, "isEqualToString:", kCLErrorDomain))
  {
    v7 = objc_msgSend(v5, "code");

    if (!v7)
    {
      -[CLLocationManager requestLocation](self->_locationManager, "requestLocation");
      goto LABEL_8;
    }
  }
  else
  {

  }
  v8 = OSLogForCategory(kVMLogCategoryDefault);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    sub_10010C4BC();

LABEL_8:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_locationsOfInterest, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
