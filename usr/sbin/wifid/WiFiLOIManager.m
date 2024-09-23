@implementation WiFiLOIManager

- (void)_locationUpdateNotificationHandler:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (objc_msgSend(a3, "object"))
  {
    v5 = objc_msgSend(a3, "object");
    v6 = objc_opt_class(CLLocation);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = objc_msgSend(a3, "object");
      v8 = +[WiFiLOIManager sharedWiFiLOIManager](WiFiLOIManager, "sharedWiFiLOIManager");
      objc_msgSend(v7, "coordinate");
      v10 = v9;
      objc_msgSend(v7, "coordinate");
      v12 = v11;
      objc_msgSend(v7, "horizontalAccuracy");
      if (objc_msgSend(v8, "ingestLocationUpdateWithLat:andLon:andAccuracy:", v10, v12, v13))
        -[WiFiLOIManager setLastLocation:](self, "setLastLocation:", v7);
    }
  }
}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  double v9;
  double v10;
  BOOL v11;
  _QWORD v13[8];
  _QWORD v14[6];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_10002FA28;
  v14[4] = sub_10002F94C;
  v14[5] = self;
  if (-[WiFiLOIManager deviceIsAssociated](self, "deviceIsAssociated")
    && ((-[WiFiLOIManager bestLatitudeReading](self, "bestLatitudeReading"), v9 == 0.0)
     || (-[WiFiLOIManager bestLongitudeReading](self, "bestLongitudeReading"), v10 == 0.0)))
  {
    v11 = 0;
    if (a5 < 100.1 && a4 != 0.0 && a5 != 0.0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100034DD4;
      v13[3] = &unk_10022EB28;
      v13[4] = v14;
      *(double *)&v13[5] = a5;
      *(double *)&v13[6] = a3;
      *(double *)&v13[7] = a4;
      dispatch_async((dispatch_queue_t)-[WiFiLOIManager dispatchQueue](self, "dispatchQueue"), v13);
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }
  _Block_object_dispose(v14, 8);
  return v11;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

+ (id)sharedWiFiLOIManager
{
  uint64_t v3;
  void *v4;
  id v5;

  if (!objc_opt_class(CLLocation, a2))
    return 0;
  v4 = (void *)objc_opt_class(WiFiLOIManager, v3);
  objc_sync_enter(v4);
  v5 = (id)qword_10026D550;
  if (!qword_10026D550)
  {
    v5 = objc_alloc_init((Class)a1);
    qword_10026D550 = (uint64_t)v5;
  }
  objc_sync_exit(v4);
  return v5;
}

- (WiFiLOIManager)init
{
  WiFiLOIManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WiFiLOIManager;
  v2 = -[WiFiLOIManager init](&v7, "init");
  if (!v2)
  {
LABEL_7:

    v2 = 0;
    goto LABEL_8;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = dispatch_queue_create("com.apple.wifid.wifiloimanagerq", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    v5 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: null _dispatchQueue", "-[WiFiLOIManager init]");
    objc_autoreleasePoolPop(v5);
    goto LABEL_7;
  }
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", v2, "_locationUpdateNotificationHandler:", CFSTR("com.apple.wifid.locationUpdateNotification"), 0);
LABEL_8:
  qword_10026D550 = (uint64_t)v2;
  return v2;
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  objc_super v4;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);

  self->_lastLocation = 0;
  v4.receiver = self;
  v4.super_class = (Class)WiFiLOIManager;
  -[WiFiLOIManager dealloc](&v4, "dealloc");
}

- (int)queryLOITypeAtLatestLocation
{
  void *v3;
  id v4;
  const void *v5;
  int v6;
  void *v8;
  void *v9;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_msgSend(objc_msgSend(+[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager"), "latestLocation"), "copy");
  if (v4)
  {
    v5 = v4;
    if (+[WiFiLocationManager isLocationValid:uptoSeconds:isHighAccuracy:](WiFiLocationManager, "isLocationValid:uptoSeconds:isHighAccuracy:", v4, 0, 300.0))
    {
      v6 = -[WiFiLOIManager query:andMaximumDistanceInMeters:](self, "query:andMaximumDistanceInMeters:", v5, 200.0);
    }
    else
    {
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Current location is stale", "-[WiFiLOIManager queryLOITypeAtLatestLocation]");
      objc_autoreleasePoolPop(v9);
      v6 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Location unavailable for LOI query", "-[WiFiLOIManager queryLOITypeAtLatestLocation]");
    objc_autoreleasePoolPop(v8);
    v6 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v6;
}

- (int)queryLOITypeAtLastLocation
{
  void *v3;
  int v4;
  void *v6;

  v3 = objc_autoreleasePoolPush();
  if (-[WiFiLOIManager lastLocation](self, "lastLocation"))
  {
    v4 = -[WiFiLOIManager query:andMaximumDistanceInMeters:](self, "query:andMaximumDistanceInMeters:", -[WiFiLOIManager lastLocation](self, "lastLocation"), 100.1);
  }
  else
  {
    v6 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s can't determine current location to query CR LOIs with", "-[WiFiLOIManager queryLOITypeAtLastLocation]");
    objc_autoreleasePoolPop(v6);
    v4 = 0;
  }
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (int)queryLOITypeAtLocationAndMaxDistance:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  void *v7;
  int v8;
  void *v10;

  v7 = objc_autoreleasePoolPush();
  if (a3)
  {
    v8 = -[WiFiLOIManager query:andMaximumDistanceInMeters:](self, "query:andMaximumDistanceInMeters:", a3, a4);
  }
  else
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s Location NULL", "-[WiFiLOIManager queryLOITypeAtLocationAndMaxDistance:andMaximumDistanceInMeters:]");
    objc_autoreleasePoolPop(v10);
    v8 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v8;
}

- (void)asyncQueryLOITypeAtLatestLocationWithCompletion:(id)a3
{
  void *v5;
  _QWORD v6[6];

  v5 = objc_autoreleasePoolPush();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000347C4;
  v6[3] = &unk_10022EAB0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)-[WiFiLOIManager dispatchQueue](self, "dispatchQueue"), v6);
  objc_autoreleasePoolPop(v5);
}

- (int)query:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  _QWORD v17[7];
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v6 = objc_autoreleasePoolPush();
  if (a3)
  {
    v7 = dispatch_semaphore_create(0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100034B60;
    v18[3] = &unk_10022EAD8;
    v18[6] = &v31;
    v18[7] = &v23;
    v18[4] = v7;
    v18[5] = &v35;
    objc_msgSend(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"), "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", a3, v18, a4);
    v8 = dispatch_time(0, 6000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      *((_BYTE *)v24 + 24) = 1;
      v9 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s gave up waiting for a CoreRoutine. Bailing to avoid a hang", "-[WiFiLOIManager query:andMaximumDistanceInMeters:]");
      objc_autoreleasePoolPop(v9);
    }
    dispatch_release(v7);
    v10 = dispatch_semaphore_create(0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100034CA0;
    v17[3] = &unk_10022EB00;
    v17[5] = &v27;
    v17[6] = &v19;
    v17[4] = v10;
    objc_msgSend(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager"), "fetchLocationsOfInterestVisitedSinceDate:withHandler:", +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0), v17);
    v11 = dispatch_time(0, 6000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      *((_BYTE *)v20 + 24) = 1;
      v12 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s gave up waiting for a CoreRoutine. Bailing to avoid a hang", "-[WiFiLOIManager query:andMaximumDistanceInMeters:]");
      objc_autoreleasePoolPop(v12);
    }
    dispatch_release(v10);
  }
  else if (qword_10026DD20)
  {
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s location required to query CR LOIs with", "-[WiFiLOIManager query:andMaximumDistanceInMeters:]");
  }
  objc_autoreleasePoolPop(v6);
  if (*((_BYTE *)v28 + 24))
  {
    if (*((_BYTE *)v32 + 24))
      v13 = 3;
    else
      v13 = 1;
    if (*((_BYTE *)v32 + 24))
      v14 = 4;
    else
      v14 = 2;
    if (*((_BYTE *)v36 + 24))
      v15 = v14;
    else
      v15 = v13;
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

@end
