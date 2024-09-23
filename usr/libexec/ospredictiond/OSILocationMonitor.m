@implementation OSILocationMonitor

- (OSILocationMonitor)init
{
  OSILocationMonitor *v2;
  os_log_t v3;
  OS_os_log *log;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callbackQueue;
  uint64_t v13;
  RTRoutineManager *routine;
  dispatch_semaphore_t v15;
  OS_dispatch_semaphore *authorizationSemaphore;
  CLLocationManager *v17;
  CLLocationManager *locationManager;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)OSILocationMonitor;
  v2 = -[OSILocationMonitor init](&v20, "init");
  if (v2)
  {
    v3 = os_log_create("com.apple.osintelligence", "locationmonitor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.osintelligence.locationmonitor.queue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.osintelligence.locsignalmonitor.callbackqueue", v10);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"));
    routine = v2->_routine;
    v2->_routine = (RTRoutineManager *)v13;

    v15 = dispatch_semaphore_create(0);
    authorizationSemaphore = v2->_authorizationSemaphore;
    v2->_authorizationSemaphore = (OS_dispatch_semaphore *)v15;

    v17 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"), v2, v2->_callbackQueue);
    locationManager = v2->_locationManager;
    v2->_locationManager = v17;

    -[CLLocationManager setDesiredAccuracy:](v2->_locationManager, "setDesiredAccuracy:", 100.0);
  }
  return v2;
}

- (BOOL)inTypicalLocation
{
  OS_os_log *log;
  NSObject *authorizationSemaphore;
  dispatch_time_t v5;
  unsigned int v6;
  id v7;
  void *v8;
  OS_os_log *v9;
  const char *v10;
  uint8_t *v11;
  void *v12;
  __int16 v14;
  __int16 v15;
  id v16;
  uint8_t buf[16];

  if (-[OSILocationMonitor notAuthorizedForLocation](self, "notAuthorizedForLocation"))
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Not authorized for location", buf, 2u);
    }
    goto LABEL_9;
  }
  authorizationSemaphore = self->_authorizationSemaphore;
  v5 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(authorizationSemaphore, v5);
  v16 = 0;
  v6 = -[OSILocationMonitor inTypicalLocationWithError:](self, "inTypicalLocationWithError:", &v16);
  v7 = v16;
  v8 = v7;
  if (v6)
  {
    v9 = self->_log;
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = 0;
    v10 = "In a typical location";
    v11 = (uint8_t *)&v15;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, v10, v11, 2u);
    goto LABEL_15;
  }
  if (!v7)
  {
    v9 = self->_log;
    if (!os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v14 = 0;
    v10 = "Not in a typical location";
    v11 = (uint8_t *)&v14;
    goto LABEL_14;
  }

LABEL_9:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSILocationMonitor likelyToBeInKnownArea](self, "likelyToBeInKnownArea"));
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_10003EC38();
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("value")));
  LOBYTE(v6) = objc_msgSend(v12, "BOOLValue");

LABEL_15:
  return v6;
}

- (BOOL)inTypicalLocationWithError:(id *)a3
{
  NSObject *queue;
  OS_os_log *log;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000196B4;
  block[3] = &unk_100060B48;
  block[4] = self;
  dispatch_sync(queue, block);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_currentLocation)
      v7 = CFSTR("Have Location");
    else
      v7 = 0;
    *(_DWORD *)buf = 138412290;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Current location: %@", buf, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OSILocationMonitor currentLocation](self, "currentLocation"));
  v9 = -[OSILocationMonitor locationIsUncertain:](self, "locationIsUncertain:", v8);

  if (v9)
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OSILocationMonitor currentLocation](self, "currentLocation"));
  v11 = -[OSILocationMonitor locationIsUncertain:](self, "locationIsUncertain:", v10);

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[OSILocationMonitor requestLocationSemaphore](self, "requestLocationSemaphore"));
    if (v12)
    {
      v13 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v12, v13);
    }
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");

  }
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OSILocationMonitor currentLocation](self, "currentLocation"));
    if (v16)
      v17 = CFSTR("Have Location");
    else
      v17 = 0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CLLocationManager location](self->_locationManager, "location"));
    if (v18)
      v19 = CFSTR("Have Location");
    else
      v19 = 0;
    *(_DWORD *)buf = 138412546;
    v30 = v17;
    v31 = 2112;
    v32 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Current location %@, Location manager location: %@", buf, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OSILocationMonitor currentLocation](self, "currentLocation"));
  v21 = v20;
  if (v20)
    v22 = v20;
  else
    v22 = (id)objc_claimAutoreleasedReturnValue(-[CLLocationManager location](self->_locationManager, "location"));
  v23 = v22;

  v24 = -[OSILocationMonitor locationOfInterestFoundNear:withError:](self, "locationOfInterestFoundNear:withError:", v23, a3);
  v25 = self->_queue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100019718;
  v27[3] = &unk_100060B48;
  v27[4] = self;
  dispatch_sync(v25, v27);

  return v24;
}

- (BOOL)locationOfInterestFoundNear:(id)a3 withError:(id *)a4
{
  id v6;
  OS_os_log *log;
  BOOL v8;
  dispatch_semaphore_t v9;
  RTRoutineManager *routine;
  NSObject *v11;
  dispatch_time_t v12;
  dispatch_semaphore_t v13;
  RTRoutineManager *v14;
  void *v15;
  dispatch_time_t v16;
  _QWORD v18[5];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[5];
  NSObject *v26;
  _QWORD *v27;
  uint8_t *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  if (-[OSILocationMonitor locationIsUncertain:](self, "locationIsUncertain:", v6))
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location is uncertain; assuming conservatively we are not in typical location.",
        buf,
        2u);
    }
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ospredictiond"), 1, &off_100065890));
  }
  else
  {
    *(_QWORD *)buf = 0;
    v32 = buf;
    v33 = 0x3032000000;
    v34 = sub_100019AF0;
    v35 = sub_100019B00;
    v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = sub_100019AF0;
    v29[4] = sub_100019B00;
    v30 = 0;
    v9 = dispatch_semaphore_create(0);
    routine = self->_routine;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100019B08;
    v25[3] = &unk_100060D88;
    v27 = v29;
    v25[4] = self;
    v11 = v9;
    v26 = v11;
    v28 = buf;
    -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](routine, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v6, v25, 200.0);
    v12 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        sub_10003ECA0();
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ospredictiond"), 2, &off_1000658B8));
    }
    else if (objc_msgSend(*((id *)v32 + 5), "count"))
    {
      v8 = 1;
    }
    else
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v13 = dispatch_semaphore_create(0);

      v14 = self->_routine;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -259200.0));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100019CA8;
      v18[3] = &unk_100060DB0;
      v18[4] = self;
      v20 = &v21;
      v11 = v13;
      v19 = v11;
      -[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:](v14, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v15, v18);

      v16 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v11, v16))
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          sub_10003ECA0();
        v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.osintelligence"), 2, &off_1000658E0));
      }
      else
      {
        v8 = *((_BYTE *)v22 + 24) == 0;
      }

      _Block_object_dispose(&v21, 8);
    }

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(buf, 8);

  }
  return v8;
}

- (BOOL)locationIsUncertain:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  OS_os_log *v10;
  BOOL v11;
  int v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    if (v6 <= 200.0)
    {
      v11 = 0;
      goto LABEL_9;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = log;
      objc_msgSend(v5, "horizontalAccuracy");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Horizontal accuracy: %@. Returning uncertain", (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "No location: Returning uncertain", (uint8_t *)&v13, 2u);
    }
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (BOOL)notAuthorizedForLocation
{
  int authorizationStatus;
  BOOL v3;

  authorizationStatus = self->_authorizationStatus;
  if (authorizationStatus)
    v3 = authorizationStatus == 3;
  else
    v3 = 1;
  return !v3;
}

- (id)likelyToBeInKnownArea
{
  void *v3;
  int64_t v4;
  int64_t v5;
  OS_os_log *log;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  unsigned int v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v16;
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = -[OSILocationMonitor inKnownMicrolocation](self, "inKnownMicrolocation");
  if (v4 != -1)
  {
    v5 = v4;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Microlocation"), CFSTR("reason"));
    log = self->_log;
    v7 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v17 = 0;
        v8 = "In a known micro-location; Not opting out of the feature";
        v9 = (uint8_t *)&v17;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v7)
    {
      LOWORD(v16) = 0;
      v13 = "Not In a known micro-location; Opting out of the feature";
      v14 = (uint8_t *)&v16;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("TimeZone"), CFSTR("reason"));
  v10 = -[OSILocationMonitor isInSameTimeZone](self, "isInSameTimeZone");
  log = self->_log;
  v11 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v11)
    {
      *(_WORD *)v18 = 0;
      v13 = "Device has been through multiple timezones; Opting out of feature";
      v14 = v18;
      goto LABEL_14;
    }
LABEL_15:
    v12 = &__kCFBooleanFalse;
    goto LABEL_16;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    v8 = "Device has has been in consistent timezones; Not opting out of feature";
    v9 = buf;
    goto LABEL_8;
  }
LABEL_9:
  v12 = &__kCFBooleanTrue;
LABEL_16:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("value"), v16);
  return v3;
}

- (int64_t)inKnownMicrolocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  OS_os_log *log;
  _BOOL4 v14;
  int64_t v15;
  OS_os_log *v16;
  uint8_t v18[8];
  _QWORD v19[8];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastPluggedInDate](OSIntelligenceUtilities, "lastPluggedInDate"));
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = BiomeLibrary();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "Location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "MicroLocationVisit"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisher"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001A2C8;
  v20[3] = &unk_100060AA8;
  v20[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001A328;
  v19[3] = &unk_100060DD8;
  v19[7] = v5;
  v19[4] = self;
  v19[5] = &v25;
  v19[6] = &v21;
  v11 = objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v20, v19);

  if (*((_BYTE *)v26 + 24))
  {
    v12 = *((unsigned __int8 *)v22 + 24);
    log = self->_log;
    v14 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time", v18, 2u);
      }
      v15 = 1;
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "No matching microlocation found", v18, 2u);
      }
      v15 = 0;
    }
  }
  else
  {
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "No microlocations found. Falling back to TimeZone check", v18, 2u);
    }
    v15 = -1;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

- (BOOL)isInSameTimeZone
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  OS_os_log *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  OS_os_log *log;
  int v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  int v31;
  int v32;
  int v33;
  _QWORD v34[10];
  _QWORD v35[5];
  _QWORD v36[6];
  _QWORD v37[3];
  int v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  int v52;
  _QWORD v53[5];
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  _BYTE v67[16];

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_100019AF0;
  v59 = sub_100019B00;
  v60 = 0;
  v3 = BiomeLibrary(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "Device"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "TimeZone"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "last"));
  v54[1] = 3221225472;
  v54[2] = sub_10001A9CC;
  v54[3] = &unk_100060AA8;
  v54[4] = self;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10001AA2C;
  v53[3] = &unk_100060E00;
  v53[4] = &v55;
  v54[0] = _NSConcreteStackBlock;
  v9 = objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v54, v53);

  if (v56[5])
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)v56[5], "secondsFromGMT");
      sub_10003EDC0((uint64_t)v67, v10, v11, v12);
    }

    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = sub_100019AF0;
    v39[4] = sub_100019B00;
    v40 = 0;
    v15 = BiomeLibrary(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "Device"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "Power"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "PluggedIn"));

    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = -1;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisher"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "publisher"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "orderedMergeWithOther:comparator:", v21, &stru_100060E20));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001AAFC;
    v36[3] = &unk_100060E48;
    v36[4] = v39;
    v36[5] = v37;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "filterWithIsIncluded:", v36));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10001AC2C;
    v35[3] = &unk_100060AA8;
    v35[4] = self;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10001ACD8;
    v34[3] = &unk_100060E70;
    v34[4] = self;
    v34[5] = &v41;
    v34[6] = v39;
    v34[7] = &v55;
    v34[8] = &v49;
    v34[9] = &v45;
    v24 = objc_msgSend(v23, "sinkWithCompletion:receiveInput:", v35, v34);

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG))
    {
      v31 = *((_DWORD *)v46 + 6);
      v32 = *((_DWORD *)v50 + 6);
      v33 = *((unsigned __int8 *)v42 + 24);
      *(_DWORD *)buf = 67109632;
      v62 = v31;
      v63 = 1024;
      v64 = v32;
      v65 = 1024;
      v66 = v33;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEBUG, "differentTimeZone: %d - sameTimeZone: %d, foundEvents %d", buf, 0x14u);
    }
    v26 = *((_DWORD *)v46 + 6);
    if (v26)
    {
      v27 = *((_DWORD *)v50 + 6);
      v28 = v27 >= 11 && v27 / v26 > 3;
    }
    else
    {
      v28 = 1;
    }
    _Block_object_dispose(v37, 8);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
  else
  {
    v29 = objc_claimAutoreleasedReturnValue(-[OSILocationMonitor log](self, "log"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_10003ED94();

    v28 = 0;
  }

  _Block_object_dispose(&v55, 8);
  return v28;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  OS_os_log *log;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = objc_msgSend(a3, "authorizationStatus");
  log = self->_log;
  v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v4 == 3)
  {
    if (v6)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Authorized for OSIntelligence", (uint8_t *)&v9, 2u);
    }
  }
  else if (v6)
  {
    v7 = log;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Authorization status: %@", (uint8_t *)&v9, 0xCu);

  }
  self->_authorizationStatus = (int)v4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_authorizationSemaphore);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    sub_10003EF44();
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B088;
  v8[3] = &unk_100060E98;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(queue, v8);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  OS_os_log *log;
  int v7;
  id v8;

  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (RTRoutineManager)routine
{
  return self->_routine;
}

- (void)setRoutine:(id)a3
{
  objc_storeStrong((id *)&self->_routine, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (OS_dispatch_semaphore)requestLocationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestLocationSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationSemaphore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_requestLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_routine, 0);
}

@end
