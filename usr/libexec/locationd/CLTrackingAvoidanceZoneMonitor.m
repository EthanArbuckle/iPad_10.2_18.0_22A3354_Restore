@implementation CLTrackingAvoidanceZoneMonitor

- (BOOL)onLocationUpdate:(id)a3
{
  _BOOL4 v5;
  void *wrappedAvengerZoneMonitor;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  int v12;
  _BOOL4 v13;
  NSObject *v14;
  const char *v15;
  _BOOL4 isInZone;
  char v18;
  double v19[2];
  uint64_t v20;
  uint8_t buf[8];
  _BYTE v22[10];
  __int16 v23;
  const char *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;

  v5 = -[CLTrackingAvoidanceZoneMonitor _updateLocation:](self, "_updateLocation:");
  if (v5)
  {
    wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
    objc_msgSend(a3, "coordinate");
    *(_QWORD *)buf = v7;
    *(_QWORD *)v22 = v8;
    objc_msgSend(a3, "coordinate");
    v19[1] = v9;
    v20 = v10;
    objc_msgSend(a3, "horizontalAccuracy");
    v19[0] = v11;
    v18 = 1;
    v12 = sub_100179958((uint64_t)wrappedAvengerZoneMonitor, (double *)buf, (double *)&v20, v19, &v18);
    if (self->_isInZone == v12)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      v13 = v12;
      if (qword_1022A0130 != -1)
        dispatch_once(&qword_1022A0130, &stru_1021B23B0);
      v14 = qword_1022A0138;
      if (os_log_type_enabled((os_log_t)qword_1022A0138, OS_LOG_TYPE_DEBUG))
      {
        v15 = -[NSString UTF8String](self->_timeZone, "UTF8String");
        isInZone = self->_isInZone;
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v22 = 2082;
        *(_QWORD *)&v22[2] = "";
        v23 = 2082;
        v24 = v15;
        v25 = 1026;
        v26 = isInZone;
        v27 = 1026;
        v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ZoneMonitor changed classfication\", \"timeZone\":%{public, location:escape_only}s, \"oldIsInZone\":%{public}hhd, \"newIsInZone\":%{public}hhd}", buf, 0x28u);
      }
      self->_isInZone = v13;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_updateLocation:(id)a3
{
  CLLocation *location;

  if (!a3)
    return 0;
  location = self->_location;
  if (location)
  {
    if (location == a3
      || (id)-[NSDate compare:](-[CLLocation timestamp](location, "timestamp"), "compare:", objc_msgSend(a3, "timestamp")) == (id)1)
    {
      return 0;
    }

  }
  self->_location = (CLLocation *)a3;
  return 1;
}

- (CLTrackingAvoidanceZoneMonitor)init
{
  -[CLTrackingAvoidanceZoneMonitor doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (CLTrackingAvoidanceZoneMonitor)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4
{
  void *__p;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLTrackingAvoidanceZoneMonitor;
  if (-[CLTrackingAvoidanceZoneMonitor init](&v7, "init"))
  {
    sub_1015A2E04(&__p, (char *)objc_msgSend(a3, "UTF8String"));
    operator new();
  }
  return 0;
}

- (BOOL)locationIsInZoneWithLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5
{
  void *wrappedAvengerZoneMonitor;
  char v7;
  double v8;
  double v9;
  double v10;

  v10 = a3;
  v8 = a5;
  v9 = a4;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  v7 = 1;
  return sub_100179958((uint64_t)wrappedAvengerZoneMonitor, &v10, &v9, &v8, &v7);
}

- (void)dealloc
{
  void *wrappedAvengerZoneMonitor;
  objc_super v4;

  self->_timeZone = 0;
  self->_location = 0;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  if (wrappedAvengerZoneMonitor)
    (*(void (**)(void *))(*(_QWORD *)wrappedAvengerZoneMonitor + 8))(wrappedAvengerZoneMonitor);
  v4.receiver = self;
  v4.super_class = (Class)CLTrackingAvoidanceZoneMonitor;
  -[CLTrackingAvoidanceZoneMonitor dealloc](&v4, "dealloc");
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (BOOL)isInZone
{
  return self->_isInZone;
}

@end
