@implementation FMDLocationTracker

+ (id)stringForLocationTrackerType:(unsigned __int8)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("lostmodetracks")));

  }
  return v3;
}

- (FMDLocationTracker)initWithType:(unsigned __int8)a3
{
  uint64_t v3;
  FMDLocationTracker *v4;
  FMDLocationTracker *v5;
  FMDTrackedLocationsStore *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDLocationTracker;
  v4 = -[FMDLocationTracker init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    -[FMDLocationTracker setLocationTrackerType:](v4, "setLocationTrackerType:", v3);
    -[FMDLocationTracker _loadTrackingInfo](v5, "_loadTrackingInfo");
    v6 = -[FMDTrackedLocationsStore initWithLocationTracker:]([FMDTrackedLocationsStore alloc], "initWithLocationTracker:", v5);
    -[FMDLocationTracker setTrackedLocationsStore:](v5, "setTrackedLocationsStore:", v6);

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022AC28(self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
  objc_msgSend(v5, "stopLocator");

  -[FMDLocationTracker _stopFallbackRetryTimer](self, "_stopFallbackRetryTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
  objc_msgSend(v6, "setDelegate:", 0);

  v7.receiver = self;
  v7.super_class = (Class)FMDLocationTracker;
  -[FMDLocationTracker dealloc](&v7, "dealloc");
}

- (void)registerDelegate:(id)a3
{
  -[FMDLocationTracker setDelegate:](self, "setDelegate:", a3);
  if (-[FMDLocationTracker isTrackingOn](self, "isTrackingOn"))
    -[FMDLocationTracker _startTracking](self, "_startTracking");
}

- (void)deregisterDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));

  if (!v5 || v5 == v4)
    -[FMDLocationTracker _stopTracking](self, "_stopTracking");
  -[FMDLocationTracker setDelegate:](self, "setDelegate:", 0);

}

- (void)updateLocationTrackingInfoWithTrackingStatus:(int64_t)a3 minSLCAccuracyThreshold:(double)a4 locateParams:(id)a5 trackNotifyEnabled:(BOOL)a6 maxLocations:(int64_t)a7 keepAlive:(double)a8 periodicCheckInterval:(double)a9 minDistanceBetweenLocations:(double)a10 minTimeBetweenLocations:(double)a11 minTimeBetweenServerCalls:(double)a12
{
  _BOOL8 v18;
  id v22;
  void *v23;

  v18 = a6;
  v22 = a5;
  -[FMDLocationTracker setMinSLCAccuracyThreshold:](self, "setMinSLCAccuracyThreshold:", a4);
  -[FMDLocationTracker setLocateParams:](self, "setLocateParams:", v22);

  -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", a3);
  -[FMDLocationTracker setTrackNotifyEnabled:](self, "setTrackNotifyEnabled:", v18);
  -[FMDLocationTracker setMaxLocations:](self, "setMaxLocations:", a7);
  -[FMDLocationTracker setKeepAlive:](self, "setKeepAlive:", a8);
  -[FMDLocationTracker setPeriodicCheckInterval:](self, "setPeriodicCheckInterval:", a9);
  -[FMDLocationTracker setMinDistanceBetweenLocations:](self, "setMinDistanceBetweenLocations:", a10);
  -[FMDLocationTracker setMinTimeBetweenLocations:](self, "setMinTimeBetweenLocations:", a11);
  -[FMDLocationTracker setMinTimeBetweenServerCalls:](self, "setMinTimeBetweenServerCalls:", a12);
  if (!-[FMDLocationTracker trackingStatus](self, "trackingStatus"))
    -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", 400);
  -[FMDLocationTracker _storeTrackingInfo](self, "_storeTrackingInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));

  if (v23)
  {
    if (-[FMDLocationTracker isTrackingOn](self, "isTrackingOn"))
      -[FMDLocationTracker _startTracking](self, "_startTracking");
    else
      -[FMDLocationTracker _stopTracking](self, "_stopTracking");
  }
}

- (void)deleteLocationTrackingInfoAndStopTracking
{
  -[FMDLocationTracker _stopTracking](self, "_stopTracking");
  -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", 400);
  -[FMDLocationTracker _storeTrackingInfo](self, "_storeTrackingInfo");
  -[FMDLocationTracker _loadTrackingInfo](self, "_loadTrackingInfo");
}

- (void)didAddNewTrackedLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMDLocationTracker _updateFallbackRetryTimer](self, "_updateFallbackRetryTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));
  objc_msgSend(v5, "didAddNewTrackedLocation:", v4);

}

- (void)actOnTrackedLocationsUsingBlock:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[FMDLocationTracker isTrackingOn](self, "isTrackingOn"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker trackedLocationsStore](self, "trackedLocationsStore"));
    objc_msgSend(v4, "actOnTrackedLocationsUsingBlock:", v5);

  }
}

- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[FMDLocationTracker isTrackingOn](self, "isTrackingOn"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker trackedLocationsStore](self, "trackedLocationsStore"));
    objc_msgSend(v6, "recordLocation:ofType:", v7, v4);

  }
}

- (BOOL)isTrackingOn
{
  return -[FMDLocationTracker trackingStatus](self, "trackingStatus") >= 200
      && -[FMDLocationTracker trackingStatus](self, "trackingStatus") < 400;
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  id v48;
  double v49;
  double v50;
  double v51;
  id v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  CLLocationFMGeoLocatableAdapter *v67;
  void *v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id location;
  uint8_t buf[4];
  _BYTE v75[14];
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    if (!-[FMDLocationTracker isTrackingOn](self, "isTrackingOn"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fm_logID"));

      v24 = sub_1000031B8();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        sub_10022CEA4();

      -[FMDLocationTracker _stopTracking](self, "_stopTracking");
      goto LABEL_12;
    }
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_10022CE28(v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
    v12 = v11 == 0;

    if (v12)
    {
      v26 = sub_100052EEC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend(v8, "type");
        objc_msgSend(v8, "horizontalAccuracy");
        v30 = v29;
        objc_msgSend(v8, "coordinate");
        v32 = v31;
        objc_msgSend(v8, "coordinate");
        *(_DWORD *)buf = 67109889;
        *(_DWORD *)v75 = v28;
        *(_WORD *)&v75[4] = 2049;
        *(_QWORD *)&v75[6] = v30;
        v76 = 2049;
        v77 = v32;
        v78 = 2049;
        v79 = v33;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Processing SLC location with Position Type = %u, Accuracy = %{private}f, Latitude = %{private}f, Longitude = %{private}f", buf, 0x26u);
      }

      objc_msgSend(v8, "horizontalAccuracy");
      if (v34 >= 0.0)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locateParams](self, "locateParams"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("validityDuration")));
        objc_msgSend(v39, "doubleValue");
        v41 = v40;

        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v42, "timeIntervalSinceReferenceDate");
        v44 = v43;

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timestamp"));
        objc_msgSend(v45, "timeIntervalSinceReferenceDate");
        v47 = v46;

        if (v44 - v47 <= v41)
        {
          objc_msgSend(v8, "horizontalAccuracy", v44 - v47);
          v50 = v49;
          -[FMDLocationTracker minSLCAccuracyThreshold](self, "minSLCAccuracyThreshold");
          if (v50 <= v51)
          {
            -[FMDLocationTracker setLastLocation:](self, "setLastLocation:", v8);
            v67 = -[CLLocationFMGeoLocatableAdapter initWithLocation:]([CLLocationFMGeoLocatableAdapter alloc], "initWithLocation:", v8);
            v68 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker trackedLocationsStore](self, "trackedLocationsStore"));
            objc_msgSend(v68, "recordLocation:ofType:", v67, 1);

          }
          else
          {
            v52 = sub_1000031B8();
            v53 = objc_claimAutoreleasedReturnValue(v52);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              sub_10022CDC0(v53, v54, v55, v56, v57, v58, v59, v60);

            objc_initWeak(&location, self);
            v71[0] = _NSConcreteStackBlock;
            v71[1] = 3221225472;
            v71[2] = sub_1000A9034;
            v71[3] = &unk_1002C4C10;
            objc_copyWeak(&v72, &location);
            v61 = objc_retainBlock(v71);
            v69[0] = _NSConcreteStackBlock;
            v69[1] = 3221225472;
            v69[2] = sub_1000A9128;
            v69[3] = &unk_1002C1378;
            objc_copyWeak(&v70, &location);
            v62 = objc_retainBlock(v69);
            -[FMDLocationTracker _startLocateCycleWithLocatorPublishingBlock:andStoppedLocatingBlock:](self, "_startLocateCycleWithLocatorPublishingBlock:andStoppedLocatingBlock:", v61, v62);
            v63 = sub_1000031B8();
            v64 = objc_claimAutoreleasedReturnValue(v63);
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "fm_logID"));
              sub_10022CD6C(v66, (uint64_t)buf, v64, v65);
            }

            objc_destroyWeak(&v70);
            objc_destroyWeak(&v72);
            objc_destroyWeak(&location);
          }
          goto LABEL_12;
        }
        v48 = sub_1000031B8();
        v36 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v75 = v41;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SLC location is older than %.0f seconds. Ignoring this", buf, 0xCu);
        }
      }
      else
      {
        v35 = sub_1000031B8();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "horizontalAccuracy");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v75 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Invalid SLC location found with horizontalAccuracy of %f", buf, 0xCu);
        }
      }

    }
    else
    {
      v13 = sub_1000031B8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_10022CDF4(v14, v15, v16, v17, v18, v19, v20, v21);

    }
LABEL_12:

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a4;
  v5 = sub_1000031B8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10022D024();

}

- (id)newLocationManager
{
  void *v3;
  id v4;

  if (-[FMDLocationTracker locationTrackerType](self, "locationTrackerType"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationManagerFactory sharedInstance](FMDLocationManagerFactory, "sharedInstance"));
  v4 = objc_msgSend(v3, "newLocationManager");

  return v4;
}

- (void)_startTracking
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;

  if (+[FMDPreferencesMgr dontUseSLC](FMDPreferencesMgr, "dontUseSLC"))
  {
    v3 = sub_1000031B8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SLC has been forcibly disabled. Not starting tracking.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    v5 = -[FMDLocationTracker newLocationManager](self, "newLocationManager");
    -[FMDLocationTracker setLocManager:](self, "setLocManager:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
    objc_msgSend(v6, "setDelegate:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
    objc_msgSend(v7, "setDistanceFilter:", kCLDistanceFilterNone);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
    objc_msgSend(v8, "startMonitoringSignificantLocationChanges");

    v4 = objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fm_logID](v4, "fm_logID"));
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling SLC for %@", (uint8_t *)&v16, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[FMDLocationTracker setLastFallbackRetryTime:](self, "setLastFallbackRetryTime:", v12);

    -[FMDLocationTracker _updateFallbackRetryTimer](self, "_updateFallbackRetryTimer");
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fm_logID](v4, "fm_logID"));
      v16 = 138412290;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Tracking is now active for %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)_stopTracking
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));

  if (v4)
  {
    v5 = sub_1000031B8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_logID"));
      v16 = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Disabling SLC for %@, if it was previously enabled", (uint8_t *)&v16, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
    objc_msgSend(v8, "stopMonitoringSignificantLocationChanges");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locManager](self, "locManager"));
    objc_msgSend(v9, "setDelegate:", 0);

    -[FMDLocationTracker setLocManager:](self, "setLocManager:", 0);
  }
  v10 = sub_1000031B8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_logID"));
    v16 = 138412290;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Tracking is now inactive for %@", (uint8_t *)&v16, 0xCu);

  }
  -[FMDLocationTracker _stopFallbackRetryTimer](self, "_stopFallbackRetryTimer");
  -[FMDLocationTracker setLastFallbackRetryTime:](self, "setLastFallbackRetryTime:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker trackedLocationsStore](self, "trackedLocationsStore"));
  objc_msgSend(v13, "deleteAllTrackedLocations");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
    objc_msgSend(v15, "stopLocator");

    -[FMDLocationTracker setLocator:](self, "setLocator:", 0);
  }
  -[FMDLocationTracker setLastLocation:](self, "setLastLocation:", 0);

}

- (void)_startLocateCycleWithLocatorPublishingBlock:(id)a3 andStoppedLocatingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A973C;
  block[3] = &unk_1002C4C60;
  objc_copyWeak(&v13, &location);
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_stopFallbackRetryTimer
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackRetryTimer](self, "fallbackRetryTimer"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackRetryTimer](self, "fallbackRetryTimer"));
    -[FMDLocationTracker setFallbackRetryTimer:](self, "setFallbackRetryTimer:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A9E0C;
    block[3] = &unk_1002C1328;
    v9 = v4;
    v5 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackTimerXPCTransactionName](self, "fallbackTimerXPCTransactionName"));
    objc_msgSend(v6, "endTransaction:", v7);

  }
}

- (void)_updateFallbackRetryTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackRetryTimer](self, "fallbackRetryTimer"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker trackedLocationsStore](self, "trackedLocationsStore"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

  -[FMDLocationTracker _updateFallbackRetryTimerUsingLocation:](self, "_updateFallbackRetryTimerUsingLocation:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackRetryTimer](self, "fallbackRetryTimer"));

  if (v5)
  {
    if (!v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackTimerXPCTransactionName](self, "fallbackTimerXPCTransactionName"));
      objc_msgSend(v6, "beginTransaction:", v7);
LABEL_6:

    }
  }
  else if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackTimerXPCTransactionName](self, "fallbackTimerXPCTransactionName"));
    objc_msgSend(v6, "endTransaction:", v7);
    goto LABEL_6;
  }

}

- (id)fallbackTimerXPCTransactionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TrackingFallbackRetryTimer-%lX"), self);
}

- (void)_updateFallbackRetryTimerUsingLocation:(id)a3
{
  void *v4;
  double v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  _QWORD *v27;
  _QWORD *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  id location;
  _QWORD block[4];
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  NSObject *v50;
  __int16 v51;
  NSObject *v52;
  __int16 v53;
  uint64_t v54;

  v37 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker fallbackRetryTimer](self, "fallbackRetryTimer"));
  if (v4)
  {
    -[FMDLocationTracker setFallbackRetryTimer:](self, "setFallbackRetryTimer:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AA4E4;
    block[3] = &unk_1002C1328;
    v46 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  -[FMDLocationTracker periodicCheckInterval](self, "periodicCheckInterval");
  v6 = v5 > 0.0;
  v7 = sub_1000031B8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Checking whether I need to start a SLC fallback for tracked locations", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
      v12 = objc_msgSend(v11, "locatorRunning");

      if (v12)
      {
        v13 = sub_1000031B8();
        v8 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v14 = "A locate cycle is already in progress. Not starting the fallback now.";
          v15 = v8;
          v16 = 2;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "timeStamp"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker lastFallbackRetryTime](self, "lastFallbackRetryTime"));
    if (v8)
    {
      if (v36)
      {
        v35 = objc_claimAutoreleasedReturnValue(-[NSObject laterDate:](v8, "laterDate:"));
LABEL_19:
        v19 = sub_1000031B8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[FMDLocationTracker periodicCheckInterval](self, "periodicCheckInterval");
          *(_DWORD *)buf = 138413058;
          v48 = v36;
          v49 = 2112;
          v50 = v8;
          v51 = 2112;
          v52 = v35;
          v53 = 2048;
          v54 = v34;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "lastFallbackRetryTime:%@ lastLocationTime:%@ latestRetryTime:%@ periodicCheckInterval:%f", buf, 0x2Au);
        }

        -[FMDLocationTracker periodicCheckInterval](self, "periodicCheckInterval");
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v35, "dateByAddingTimeInterval:"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v23 = objc_msgSend(v22, "compare:", v21) == (id)-1;
        v24 = sub_1000031B8();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v26)
          {
            *(_DWORD *)buf = 138412290;
            v48 = v21;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Scheduling SLC fallback of tracked locations for %@", buf, 0xCu);
          }

          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000AA648;
          v38[3] = &unk_1002C1328;
          v39 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v21, CFSTR("com.apple.icloud.findmydeviced.trackingFallbackRetry"), self, "_updateFallbackRetryTimer", 0);
          v33 = v39;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v38);
          -[FMDLocationTracker setFallbackRetryTimer:](self, "setFallbackRetryTimer:", v33);

        }
        else
        {
          if (v26)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Time to do a SLC fallback for tracked locations", buf, 2u);
          }

          -[FMDLocationTracker setLastFallbackRetryTime:](self, "setLastFallbackRetryTime:", v22);
          objc_initWeak(&location, self);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_1000AA4EC;
          v42[3] = &unk_1002C4C10;
          objc_copyWeak(&v43, &location);
          v27 = objc_retainBlock(v42);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_1000AA5E0;
          v40[3] = &unk_1002C1378;
          objc_copyWeak(&v41, &location);
          v28 = objc_retainBlock(v40);
          -[FMDLocationTracker _startLocateCycleWithLocatorPublishingBlock:andStoppedLocatingBlock:](self, "_startLocateCycleWithLocatorPublishingBlock:andStoppedLocatingBlock:", v27, v28);
          v29 = sub_1000031B8();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locator](self, "locator"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fm_logID"));
            sub_10022D094(v32, (uint64_t)buf, v30, v31);
          }

          objc_destroyWeak(&v41);
          objc_destroyWeak(&v43);
          objc_destroyWeak(&location);
        }

        goto LABEL_31;
      }
      v18 = v8;
    }
    else
    {
      v18 = v36;
    }
    v35 = v18;
    goto LABEL_19;
  }
  if (v9)
  {
    -[FMDLocationTracker periodicCheckInterval](self, "periodicCheckInterval");
    *(_DWORD *)buf = 134217984;
    v48 = v17;
    v14 = "SLC fallback is disabled (interval is %f)";
    v15 = v8;
    v16 = 12;
    goto LABEL_12;
  }
LABEL_31:

}

- (void)_storeTrackingInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[10];
  _QWORD v18[10];

  if ((id)-[FMDLocationTracker trackingStatus](self, "trackingStatus") == (id)400)
  {
    v3 = 0;
  }
  else
  {
    v17[0] = CFSTR("minSLCAccuracyThreshold");
    -[FMDLocationTracker minSLCAccuracyThreshold](self, "minSLCAccuracyThreshold");
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[0] = v16;
    v17[1] = CFSTR("locateParams");
    v4 = objc_claimAutoreleasedReturnValue(-[FMDLocationTracker locateParams](self, "locateParams"));
    v15 = (void *)v4;
    v5 = &__NSDictionary0__struct;
    if (v4)
      v5 = (void *)v4;
    v18[1] = v5;
    v17[2] = CFSTR("trackingStatus");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDLocationTracker trackingStatus](self, "trackingStatus")));
    v18[2] = v14;
    v17[3] = CFSTR("trackNotifyEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDLocationTracker trackNotifyEnabled](self, "trackNotifyEnabled")));
    v18[3] = v6;
    v17[4] = CFSTR("maxLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDLocationTracker maxLocations](self, "maxLocations")));
    v18[4] = v7;
    v17[5] = CFSTR("keepAlive");
    -[FMDLocationTracker keepAlive](self, "keepAlive");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[5] = v8;
    v17[6] = CFSTR("periodicCheckInterval");
    -[FMDLocationTracker periodicCheckInterval](self, "periodicCheckInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[6] = v9;
    v17[7] = CFSTR("minDistanceBetweenLocations");
    -[FMDLocationTracker minDistanceBetweenLocations](self, "minDistanceBetweenLocations");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[7] = v10;
    v17[8] = CFSTR("minTimeBetweenLocations");
    -[FMDLocationTracker minTimeBetweenLocations](self, "minTimeBetweenLocations");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[8] = v11;
    v17[9] = CFSTR("minTimeBetweenServerCalls");
    -[FMDLocationTracker minTimeBetweenServerCalls](self, "minTimeBetweenServerCalls");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v18[9] = v12;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 10));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", -[FMDLocationTracker locationTrackerType](self, "locationTrackerType")));
  +[FMDPreferencesMgr setTrackingInfo:forType:](FMDPreferencesMgr, "setTrackingInfo:forType:", v3, v13);

}

- (void)_loadTrackingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", -[FMDLocationTracker locationTrackerType](self, "locationTrackerType")));
  v14 = (id)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr trackingInfoForType:](FMDPreferencesMgr, "trackingInfoForType:", v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("minSLCAccuracyThreshold")));
  objc_msgSend(v4, "doubleValue");
  -[FMDLocationTracker setMinSLCAccuracyThreshold:](self, "setMinSLCAccuracyThreshold:");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("locateParams")));
  -[FMDLocationTracker setLocateParams:](self, "setLocateParams:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trackingStatus")));
  -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", objc_msgSend(v6, "integerValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trackNotifyEnabled")));
  -[FMDLocationTracker setTrackNotifyEnabled:](self, "setTrackNotifyEnabled:", objc_msgSend(v7, "BOOLValue"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("maxLocations")));
  -[FMDLocationTracker setMaxLocations:](self, "setMaxLocations:", objc_msgSend(v8, "integerValue"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("keepAlive")));
  objc_msgSend(v9, "doubleValue");
  -[FMDLocationTracker setKeepAlive:](self, "setKeepAlive:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("periodicCheckInterval")));
  objc_msgSend(v10, "doubleValue");
  -[FMDLocationTracker setPeriodicCheckInterval:](self, "setPeriodicCheckInterval:");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("minDistanceBetweenLocations")));
  objc_msgSend(v11, "doubleValue");
  -[FMDLocationTracker setMinDistanceBetweenLocations:](self, "setMinDistanceBetweenLocations:");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("minTimeBetweenLocations")));
  objc_msgSend(v12, "doubleValue");
  -[FMDLocationTracker setMinTimeBetweenLocations:](self, "setMinTimeBetweenLocations:");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("minTimeBetweenServerCalls")));
  objc_msgSend(v13, "doubleValue");
  -[FMDLocationTracker setMinTimeBetweenServerCalls:](self, "setMinTimeBetweenServerCalls:");

  if (!-[FMDLocationTracker trackingStatus](self, "trackingStatus"))
    -[FMDLocationTracker setTrackingStatus:](self, "setTrackingStatus:", 400);

}

- (double)minSLCAccuracyThreshold
{
  return self->_minSLCAccuracyThreshold;
}

- (void)setMinSLCAccuracyThreshold:(double)a3
{
  self->_minSLCAccuracyThreshold = a3;
}

- (NSDictionary)locateParams
{
  return self->_locateParams;
}

- (void)setLocateParams:(id)a3
{
  objc_storeStrong((id *)&self->_locateParams, a3);
}

- (int64_t)trackingStatus
{
  return self->_trackingStatus;
}

- (void)setTrackingStatus:(int64_t)a3
{
  self->_trackingStatus = a3;
}

- (BOOL)trackNotifyEnabled
{
  return self->_trackNotifyEnabled;
}

- (void)setTrackNotifyEnabled:(BOOL)a3
{
  self->_trackNotifyEnabled = a3;
}

- (int64_t)maxLocations
{
  return self->_maxLocations;
}

- (void)setMaxLocations:(int64_t)a3
{
  self->_maxLocations = a3;
}

- (double)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(double)a3
{
  self->_keepAlive = a3;
}

- (double)periodicCheckInterval
{
  return self->_periodicCheckInterval;
}

- (void)setPeriodicCheckInterval:(double)a3
{
  self->_periodicCheckInterval = a3;
}

- (double)minDistanceBetweenLocations
{
  return self->_minDistanceBetweenLocations;
}

- (void)setMinDistanceBetweenLocations:(double)a3
{
  self->_minDistanceBetweenLocations = a3;
}

- (double)minTimeBetweenLocations
{
  return self->_minTimeBetweenLocations;
}

- (void)setMinTimeBetweenLocations:(double)a3
{
  self->_minTimeBetweenLocations = a3;
}

- (double)minTimeBetweenServerCalls
{
  return self->_minTimeBetweenServerCalls;
}

- (void)setMinTimeBetweenServerCalls:(double)a3
{
  self->_minTimeBetweenServerCalls = a3;
}

- (unsigned)locationTrackerType
{
  return self->_locationTrackerType;
}

- (void)setLocationTrackerType:(unsigned __int8)a3
{
  self->_locationTrackerType = a3;
}

- (FMDLocationTrackerDelegate)delegate
{
  return (FMDLocationTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)trackingStarted
{
  return self->_trackingStarted;
}

- (void)setTrackingStarted:(BOOL)a3
{
  self->_trackingStarted = a3;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (FMDLocationManaging)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
  objc_storeStrong((id *)&self->_locManager, a3);
}

- (FMDLocator)locator
{
  return self->_locator;
}

- (void)setLocator:(id)a3
{
  objc_storeStrong((id *)&self->_locator, a3);
}

- (PCPersistentTimer)fallbackRetryTimer
{
  return self->_fallbackRetryTimer;
}

- (void)setFallbackRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackRetryTimer, a3);
}

- (NSDate)lastFallbackRetryTime
{
  return self->_lastFallbackRetryTime;
}

- (void)setLastFallbackRetryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastFallbackRetryTime, a3);
}

- (FMDTrackedLocationsStore)trackedLocationsStore
{
  return self->_trackedLocationsStore;
}

- (void)setTrackedLocationsStore:(id)a3
{
  objc_storeStrong((id *)&self->_trackedLocationsStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedLocationsStore, 0);
  objc_storeStrong((id *)&self->_lastFallbackRetryTime, 0);
  objc_storeStrong((id *)&self->_fallbackRetryTimer, 0);
  objc_storeStrong((id *)&self->_locator, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_locateParams, 0);
}

@end
