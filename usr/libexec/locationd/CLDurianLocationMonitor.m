@implementation CLDurianLocationMonitor

- (void)stopLeechingLocation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (self->_leechingLocation)
  {
    self->_leechingLocation = 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF20);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location stopLeechingLocation\"}", (uint8_t *)v4, 0x12u);
    }
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  }
}

- (CLDurianLocationMonitor)initWithUniverse:(id)a3
{
  CLDurianLocationMonitor *v4;
  CLDurianLocationMonitor *v5;
  NSObject *v6;
  CLRoutineMonitorServiceProtocol *v7;
  NSObject *v8;
  signed int v9;
  NSObject *v10;
  NSObject *stopActiveLocationRequestTimer;
  _QWORD handler[5];
  objc_super v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;

  v14.receiver = self;
  v14.super_class = (Class)CLDurianLocationMonitor;
  v4 = -[CLDurianLocationMonitor init](&v14, "init");
  v5 = v4;
  if (v4)
  {
    -[CLDurianLocationMonitor setValid:](v4, "setValid:", 1);
    v6 = objc_msgSend(objc_msgSend(a3, "silo"), "queue");
    v5->_locationManager = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/FindMyDevice.framework/"), v5, v6);
    v7 = (CLRoutineMonitorServiceProtocol *)objc_msgSend(objc_msgSend(a3, "vendor"), "proxyForService:", CFSTR("CLRoutineMonitor"));
    v5->_routineMonitor = v7;
    -[CLRoutineMonitorServiceProtocol registerDelegate:inSilo:](v7, "registerDelegate:inSilo:", v5, objc_msgSend(a3, "silo"));
    -[CLRoutineMonitorServiceProtocol setDelegateEntityName:](v5->_routineMonitor, "setDelegateEntityName:", "CLDurianLocationMonitor");
    -[CLDurianLocationMonitor setDesiredAccuracy:](v5, "setDesiredAccuracy:", kCLLocationAccuracyLeech);
    v5->_leechingLocation = 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF20);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/FindMyDevice.framework/"));
      *(_DWORD *)buf = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2049;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location authorization status\", \"authorizationStatus\":%{private}ld}", buf, 0x1Cu);
    }
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
    v5->_stopActiveLocationRequestTimer = (OS_dispatch_source *)v10;
    dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
    stopActiveLocationRequestTimer = v5->_stopActiveLocationRequestTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1014CCB94;
    handler[3] = &unk_10212BB58;
    handler[4] = v5;
    dispatch_source_set_event_handler(stopActiveLocationRequestTimer, handler);
    dispatch_resume((dispatch_object_t)v5->_stopActiveLocationRequestTimer);
    v5->_currentLocationRequests = objc_opt_new(NSMutableArray);
  }
  return v5;
}

- (void)dealloc
{
  NSObject *stopActiveLocationRequestTimer;
  objc_super v4;

  -[CLDurianLocationMonitor setLastEvaluationDate:](self, "setLastEvaluationDate:", 0);
  stopActiveLocationRequestTimer = self->_stopActiveLocationRequestTimer;
  if (stopActiveLocationRequestTimer)
  {
    dispatch_source_cancel(stopActiveLocationRequestTimer);
    self->_stopActiveLocationRequestTimer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDurianLocationMonitor;
  -[CLDurianLocationMonitor dealloc](&v4, "dealloc");
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)startLeechingLocation
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (!self->_leechingLocation)
  {
    self->_leechingLocation = 1;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF20);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 68289026;
      v4[1] = 0;
      v5 = 2082;
      v6 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location startLeechingLocation\"}", (uint8_t *)v4, 0x12u);
    }
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
  }
}

- (void)fetchEstimatedLocationAtDate:(id)a3 handler:(id)a4
{
  NSObject *v7;
  NSDate *v8;
  CLRoutineMonitorServiceProtocol *routineMonitor;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[8];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2082;
    v18 = -[NSString UTF8String](+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", a3, 1, 4), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location fetchEstimatedLocationAtDate\", \"date\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  if (a4)
  {
    if (self->_enabled)
    {
      v8 = +[NSDate date](NSDate, "date");
      routineMonitor = self->_routineMonitor;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1014CCFC0;
      v12[3] = &unk_1021BBF00;
      v12[4] = self;
      v12[5] = a3;
      v12[6] = v8;
      v12[7] = a4;
      -[CLRoutineMonitorServiceProtocol fetchEstimatedLocationAtDate:withReply:](routineMonitor, "fetchEstimatedLocationAtDate:withReply:", a3, v12);
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBF20);
      v11 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289026;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location DurianLocationMonitor is disabled\"}", buf, 0x12u);
      }
      (*((void (**)(id, _QWORD, NSError *))a4 + 2))(a4, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomain, 1, 0));
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF20);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location handler is nil\"}", buf, 0x12u);
    }
  }
}

- (void)fetchCurrentLocationWithHandler:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v8 = 68289026;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location fetchCurrentLocationWithHandler\"}", (uint8_t *)&v8, 0x12u);
  }
  if (a3)
  {
    if (self->_enabled)
    {
      -[NSMutableArray addObject:](-[CLDurianLocationMonitor currentLocationRequests](self, "currentLocationRequests"), "addObject:", _Block_copy(a3));
      -[CLDurianLocationMonitor setLastEvaluationDate:](self, "setLastEvaluationDate:", +[NSDate date](NSDate, "date"));
      -[CLDurianLocationMonitor evaluateLastLocation](self, "evaluateLastLocation");
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBF20);
      v7 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v8 = 68289026;
        v9 = 0;
        v10 = 2082;
        v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location DurianLocationMonitor is disabled\"}", (uint8_t *)&v8, 0x12u);
      }
      (*((void (**)(id, _QWORD, NSError *))a3 + 2))(a3, 0, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomain, 1, 0));
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBF20);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #location handler is nil\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (void)startActiveLocationRequest
{
  double v3;
  NSObject *stopActiveLocationRequestTimer;
  dispatch_time_t v5;

  if (-[NSMutableArray count](-[CLDurianLocationMonitor currentLocationRequests](self, "currentLocationRequests"), "count"))
  {
    -[CLLocationManager desiredAccuracy](self->_locationManager, "desiredAccuracy");
    if (v3 != -1.0)
    {
      -[CLDurianLocationMonitor setDesiredAccuracy:](self, "setDesiredAccuracy:", -1.0);
      stopActiveLocationRequestTimer = self->_stopActiveLocationRequestTimer;
      v5 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(stopActiveLocationRequestTimer, v5, 0x37E11D600uLL, 0x1DCD6500uLL);
    }
  }
}

- (void)stopActiveLocationRequest
{
  double v3;

  -[CLLocationManager desiredAccuracy](self->_locationManager, "desiredAccuracy");
  if (v3 != kCLLocationAccuracyLeech)
  {
    -[CLDurianLocationMonitor setDesiredAccuracy:](self, "setDesiredAccuracy:", 2147483650.0);
    dispatch_source_set_timer((dispatch_source_t)self->_stopActiveLocationRequestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)setDesiredAccuracy:(double)a3
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  double v10;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2050;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location updating desiredAccuracy\", \"desiredAccuracy\":\"%{public}f\"}", (uint8_t *)v6, 0x1Cu);
  }
  -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", a3);
}

- (void)sendLastLocation:(id)a3 error:(id)a4
{
  NSMutableArray *currentLocationRequests;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  currentLocationRequests = self->_currentLocationRequests;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](currentLocationRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(currentLocationRequests);
        v12 = *(void (***)(_QWORD, _QWORD, _QWORD))(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        ((void (**)(_QWORD, id, id))v12)[2](v12, a3, a4);
        _Block_release(v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](currentLocationRequests, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  -[NSMutableArray removeAllObjects](self->_currentLocationRequests, "removeAllObjects");
  -[CLDurianLocationMonitor stopActiveLocationRequest](self, "stopActiveLocationRequest");
}

- (void)evaluateLastLocation
{
  id v3;

  if (-[NSMutableArray count](-[CLDurianLocationMonitor currentLocationRequests](self, "currentLocationRequests"), "count"))
  {
    v3 = -[CLDurianLocationMonitor lastValidLocationWithHorizontalAccuracy:evaluationDate:error:](self, "lastValidLocationWithHorizontalAccuracy:evaluationDate:error:", -[CLDurianLocationMonitor lastEvaluationDate](self, "lastEvaluationDate"), 0, 15.0);
    if (v3)
      -[CLDurianLocationMonitor sendLastLocation:error:](self, "sendLastLocation:error:", v3, 0);
    else
      -[CLDurianLocationMonitor startActiveLocationRequest](self, "startActiveLocationRequest");
  }
}

- (BOOL)isLocation:(id)a3 validOnDate:(id)a4 maxHorizontalAccuracy:(double)a5
{
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  if (!a3)
    return 0;
  objc_msgSend(a3, "horizontalAccuracy");
  if (v8 <= 0.0)
    return 0;
  objc_msgSend(a3, "horizontalAccuracy");
  if (v9 > a5)
    return 0;
  objc_msgSend(a3, "clientLocation");
  if (v16 >= 15.0)
    v11 = v16;
  else
    v11 = 15.0;
  objc_msgSend(a4, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(a3, "clientLocation");
  v14 = v13 - v15;
  if (v13 - v15 < 0.0)
    v14 = -(v13 - v15);
  return v11 >= v14;
}

- (id)lastValidLocationWithHorizontalAccuracy:(double)a3 evaluationDate:(id)a4 error:(id *)a5
{
  NSDate *v6;
  CLLocation *v9;

  v6 = (NSDate *)a4;
  if (!a4)
    v6 = +[NSDate date](NSDate, "date");
  if (-[CLDurianLocationMonitor isLocation:validOnDate:maxHorizontalAccuracy:](self, "isLocation:validOnDate:maxHorizontalAccuracy:", self->_lastlocation, v6, a3))
  {
    return self->_lastlocation;
  }
  v9 = -[CLLocationManager location](self->_locationManager, "location");
  if (!-[CLDurianLocationMonitor isLocation:validOnDate:maxHorizontalAccuracy:](self, "isLocation:validOnDate:maxHorizontalAccuracy:", v9, v6, a3))
  {
    v9 = 0;
    if (a5)
      *a5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCLErrorDomain, 0, 0);
  }
  return v9;
}

- (void)onStopActiveLocationRequestTimerExpiry
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 68289026;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location active request timeout fired\"}", (uint8_t *)&v5, 0x12u);
  }
  v4 = -[CLDurianLocationMonitor lastValidLocationWithHorizontalAccuracy:evaluationDate:error:](self, "lastValidLocationWithHorizontalAccuracy:evaluationDate:error:", -[CLDurianLocationMonitor lastEvaluationDate](self, "lastEvaluationDate", 0), &v5, 250.0);
  -[CLDurianLocationMonitor sendLastLocation:error:](self, "sendLastLocation:error:", v4, v5);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a4);
        -[CLDurianLocationMonitor setLastlocation:](self, "setLastlocation:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
        -[CLDurianLocationMonitor evaluateLastLocation](self, "evaluateLastLocation");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289283;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2049;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location authorization changed\", \"authorizationStatus\":%{private}ld}", (uint8_t *)v7, 0x1Cu);
  }
  self->_enabled = a4 == 3;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBF20);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 68289283;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #location location failed\", \"error\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
  }
  -[CLDurianLocationMonitor sendLastLocation:error:](self, "sendLastLocation:error:", -[CLDurianLocationMonitor lastValidLocationWithHorizontalAccuracy:evaluationDate:error:](self, "lastValidLocationWithHorizontalAccuracy:evaluationDate:error:", -[CLDurianLocationMonitor lastEvaluationDate](self, "lastEvaluationDate", 0), &v7, 250.0), a4);
}

- (int64_t)binTimeInterval:(double)a3
{
  return 10 * (int)(a3 / 10.0);
}

- (void)updateEstimatedLocationMetrics:(id)a3 currentLocation:(id)a4 estimatedLocation:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(objc_msgSend(a4, "timestamp"), "timeIntervalSinceDate:", objc_msgSend(a5, "timestamp"));
  objc_msgSend(a3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("timestampDiff"));
  objc_msgSend(a4, "distanceFromLocation:", a5);
  objc_msgSend(a3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("locationDiff"));
  objc_msgSend(a4, "distanceFromLocation:", a5);
  v9 = v8;
  objc_msgSend(a4, "horizontalAccuracy");
  objc_msgSend(a3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fmax(v9 - v10, 0.0)), CFSTR("locationDistance"));
  objc_msgSend(a4, "horizontalAccuracy");
  v12 = v11;
  objc_msgSend(a5, "horizontalAccuracy");
  objc_msgSend(a3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12 - v13), CFSTR("horizontalAccuracyDiff"));
  objc_msgSend(a5, "horizontalAccuracy");
  if (v14 > 0.0)
  {
    objc_msgSend(a4, "distanceFromLocation:", a5);
    v16 = v15 * 100.0;
    objc_msgSend(a5, "horizontalAccuracy");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 / v17), CFSTR("locationDistanceAccuracyRatio"));
  }
}

- (void)sendEstimatedLocationMetricsAtFirstAttemptForEstimatedLocation:(id)a3 estimationError:(id)a4 timeOfInterest:(id)a5 referenceTime:(id)a6 responseTime:(id)a7
{
  id v13;
  id v14;

  v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(a5, "timeIntervalSinceDate:", a6);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("timeAdjusted"));
  objc_msgSend(a5, "timeIntervalSinceDate:", a6);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianLocationMonitor binTimeInterval:](self, "binTimeInterval:")), CFSTR("timeAdjustedBin"));
  objc_msgSend(a7, "timeIntervalSinceDate:", a6);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("responseDelay"));
  if (a3)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10221DD00, CFSTR("result1"));
    v14 = -[CLDurianLocationMonitor lastValidLocationWithHorizontalAccuracy:evaluationDate:error:](self, "lastValidLocationWithHorizontalAccuracy:evaluationDate:error:", a6, 0, 250.0);
    if (v14)
      -[CLDurianLocationMonitor updateEstimatedLocationMetrics:currentLocation:estimatedLocation:](self, "updateEstimatedLocationMetrics:currentLocation:estimatedLocation:", v13, v14, a3);
  }
  else if (a4)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", &off_10221DD18, CFSTR("result1"));
  }
  AnalyticsSendEvent(CFSTR("com.apple.proximity.durian.estimated_location"), v13);
}

- (void)sendEstimatedLocationMetricsAfterLocationScanWithFirstEstimatedLocation:(id)a3 newLocation:(id)a4 secondEstimatedLocation:(id)a5 error:(id)a6 timeOfInterest:(id)a7 referenceTime:(id)a8 responseTime:(id)a9
{
  id v15;
  _UNKNOWN **v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;

  v15 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(a7, "timeIntervalSinceDate:", a8);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("timeAdjusted"));
  objc_msgSend(a7, "timeIntervalSinceDate:", a8);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianLocationMonitor binTimeInterval:](self, "binTimeInterval:")), CFSTR("timeAdjustedBin"));
  objc_msgSend(a9, "timeIntervalSinceDate:", a8);
  objc_msgSend(v15, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("responseDelay"));
  if (a3)
  {
    v16 = &off_10221DD30;
  }
  else if (-[CLDurianLocationMonitor lastValidLocationWithHorizontalAccuracy:evaluationDate:error:](self, "lastValidLocationWithHorizontalAccuracy:evaluationDate:error:", a8, 0, 250.0))
  {
    v16 = &off_10221DD48;
  }
  else
  {
    v16 = &off_10221DD60;
  }
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("result1"));
  if (a5)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", &off_10221DD00, CFSTR("result2"));
    if (a4)
      -[CLDurianLocationMonitor updateEstimatedLocationMetrics:currentLocation:estimatedLocation:](self, "updateEstimatedLocationMetrics:currentLocation:estimatedLocation:", v15, a4, a5);
  }
  else
  {
    if (a4)
    {
      v23 = &off_10221DD48;
    }
    else if (a6)
    {
      v23 = &off_10221DD18;
    }
    else
    {
      v23 = &off_10221DD60;
    }
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("result2"));
  }
  AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.proximity.durian.estimated_location"), (SEL)v15, v17, v18, v19, v20, v21, v22, a9);
}

- (NSDate)lastEvaluationDate
{
  return self->lastEvaluationDate;
}

- (void)setLastEvaluationDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (CLDurianLocationMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianLocationMonitorDelegate *)a3;
}

- (CLLocation)lastlocation
{
  return self->_lastlocation;
}

- (void)setLastlocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)currentLocationRequests
{
  return self->_currentLocationRequests;
}

- (void)setCurrentLocationRequests:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

@end
