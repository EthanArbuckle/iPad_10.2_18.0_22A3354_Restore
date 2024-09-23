@implementation CLZoneRelevanceTracker

- (void)onLeechedNotification:(int)a3 withData:(NotificationData *)a4
{
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  $AB5116BA7E623E054F959CECB034F4E7 v19;
  __int128 v20;
  char *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  CLDaemonLocation *p_currentLocation;
  __int16 v33;
  int v34;
  __int16 v35;
  NotificationData *v36;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290307;
    v24 = 0;
    v25 = 2082;
    v26 = "";
    v27 = 2050;
    v28 = a3;
    v29 = 1040;
    v30 = 156;
    v31 = 2097;
    p_currentLocation = &self->_currentLocation;
    v33 = 1040;
    v34 = 156;
    v35 = 2097;
    v36 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker, location notification\", \"notification\":%{public, location:CLLocationProvider_Type::Notification}lld, \"_currentLocation\":%{private, location:CLClientLocation}.*P, \"NewLocation\":%{private, location:CLClientLocation}.*P}", buf, 0x3Cu);
  }
  if (a3 == 5)
  {
    if ((sub_100182290((uint64_t)a4) & 1) != 0)
    {
      if (*(double *)((char *)a4 + 76) - *(double *)((char *)&self->_currentLocation.courseAccuracy + 4) >= 0.0)
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021554A0);
        v13 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker Accepting New Location", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021554A0);
          LOWORD(v22[0]) = 0;
          v21 = (char *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#pla #zone-relevance-tracker Accepting New Location", v22, 2);
          sub_100512490("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n", v21);
          if (v21 != (char *)buf)
            free(v21);
        }
        v14 = *((_OWORD *)a4 + 1);
        *(_OWORD *)&self->_currentLocation.suitability = *(_OWORD *)a4;
        *(_OWORD *)&self->_currentLocation.coordinate.longitude = v14;
        v15 = *((_OWORD *)a4 + 2);
        v16 = *((_OWORD *)a4 + 3);
        v17 = *((_OWORD *)a4 + 5);
        *(_OWORD *)&self->_currentLocation.course = *((_OWORD *)a4 + 4);
        *(_OWORD *)&self->_currentLocation.timestamp = v17;
        *(_OWORD *)&self->_currentLocation.altitude = v15;
        *(_OWORD *)&self->_currentLocation.speed = v16;
        v18 = *((_OWORD *)a4 + 6);
        v19 = ($AB5116BA7E623E054F959CECB034F4E7)*((_OWORD *)a4 + 7);
        v20 = *((_OWORD *)a4 + 8);
        *(_OWORD *)&self->_currentLocation.integrity = *(_OWORD *)((char *)a4 + 140);
        self->_currentLocation.rawCoordinate = v19;
        *(_OWORD *)&self->_currentLocation.rawCourse = v20;
        *(_OWORD *)&self->_currentLocation.lifespan = v18;
        sub_100178838(*(_QWORD *)&self->_currentLocation.ellipsoidalAltitude, &self->_currentLocation.suitability);
      }
      else
      {
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021554A0);
        v8 = qword_1022A01D8;
        if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker stale, older than _currentLocation. Not accepting new location", buf, 2u);
        }
        if (sub_1001BFF7C(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1022A01D0 != -1)
            dispatch_once(&qword_1022A01D0, &stru_1021554A0);
          LOWORD(v22[0]) = 0;
          v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#pla #zone-relevance-tracker stale, older than _currentLocation. Not accepting new location", v22, 2, v22[0]);
LABEL_32:
          v11 = (uint8_t *)v9;
          sub_100512490("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
LABEL_33:
          if (v11 != buf)
            free(v11);
        }
      }
    }
    else
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021554A0);
      v12 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker invalid lat/lon. Not accepting new location", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021554A0);
        LOWORD(v22[0]) = 0;
        v9 = _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#pla #zone-relevance-tracker invalid lat/lon. Not accepting new location", v22, 2, v22[0]);
        goto LABEL_32;
      }
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021554A0);
    v10 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67240192;
      v24 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#pla #zone-relevance-tracker: Unexpected notification: %{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021554A0);
      LODWORD(v22[0]) = 67240192;
      HIDWORD(v22[0]) = a3;
      v11 = (uint8_t *)_os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 16, "#pla #zone-relevance-tracker: Unexpected notification: %{public}d", v22, 8);
      sub_100512490("Generic", 1, 0, 0, "-[CLZoneRelevanceTracker onLeechedNotification:withData:]", "%s\n");
      goto LABEL_33;
    }
  }
}

- (CLZoneRelevanceTracker)initWithClientManagerPointer:(void *)a3 andUniverse:(id)a4
{
  CLZoneRelevanceTracker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLZoneRelevanceTracker;
  v6 = -[CLZoneRelevanceTracker init](&v8, "init");
  if (v6)
  {
    v6->_universe = (CLIntersiloUniverse *)a4;
    *(_QWORD *)&v6->_currentLocation.ellipsoidalAltitude = a3;
    *(_QWORD *)&v6->_currentLocation.fromSimulationController = objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/PLAMonitor.bundle"), v6, objc_msgSend(-[CLIntersiloUniverse silo](v6->_universe, "silo"), "queue"));
    LOBYTE(v6->_clientManager) = 1;
    sub_1006AA544();
  }
  return 0;
}

- (void)dealloc
{
  Client *value;
  objc_super v4;

  objc_msgSend(*((id *)self->_locationClient.__ptr_.__value_ + 2), "unregister:forNotification:", *((_QWORD *)self->_locationClient.__ptr_.__value_ + 1), 5);
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);

  *(_QWORD *)&self->_currentLocation.fromSimulationController = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLZoneRelevanceTracker;
  -[CLZoneRelevanceTracker dealloc](&v4, "dealloc");
}

- (void)invalidate
{
  LOBYTE(self->_clientManager) = 0;
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289282;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2082;
    v10 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring started\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v7 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
  {
    v11 = 68289538;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    v17 = 2082;
    v18 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring failed to start\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  }
  v8 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    v9 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    v10 = objc_msgSend(objc_msgSend(a5, "description"), "UTF8String");
    v11 = 68289538;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = v9;
    v17 = 2082;
    v18 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla #zone-relevance-tracker region-monitoring failed to start", "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker region-monitoring failed to start\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker entered circular region\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:](self, "handleEntryExitDelegateCallbackForRegion:withState:", a4, 1);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v6 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2082;
    v11 = objc_msgSend(objc_msgSend(a4, "identifier"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker exited circular-region\", \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v7, 0x1Cu);
  }
  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:](self, "handleEntryExitDelegateCallbackForRegion:withState:", a4, 2);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289538;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = a4;
    v14 = 2082;
    v15 = objc_msgSend(objc_msgSend(a5, "identifier"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker determined state\", \"State\":%{public}d, \"RegionIdentifier/ZoneRelevanceMonitoringId\":%{public, location:escape_only}s}", (uint8_t *)v9, 0x22u);
  }
  -[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:](self, "handleEntryExitDelegateCallbackForRegion:withState:", a5, a4);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  v5 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_ERROR))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#pla locationManager delegate received error\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021554A0);
  }
  v6 = qword_1022A01D8;
  if (os_signpost_enabled((os_log_t)qword_1022A01D8))
  {
    v7 = objc_msgSend(objc_msgSend(a4, "description"), "UTF8String");
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2082;
    v13 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla locationManager delegate received error", "{\"msg%{public}.0s\":\"#pla locationManager delegate received error\", \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)handleEntryExitDelegateCallbackForRegion:(id)a3 withState:(int64_t)a4
{
  id v5;
  char *v6;
  id v7;
  id v8;
  NSObject *v9;
  CLClientKeyPath *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  __int16 v16[8];
  uint8_t buf[8];
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  if (a4)
  {
    v5 = objc_msgSend(a3, "identifier");
    v6 = (char *)objc_msgSend(v5, "rangeOfString:", CFSTR(":"));
    v7 = objc_msgSend(v5, "substringToIndex:", v6);
    v8 = objc_msgSend(v5, "substringFromIndex:", v6 + 1);
    if (LOBYTE(self->_clientManager))
    {
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021554A0);
      v9 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#pla #zone-relevance-tracker recompute auth context", buf, 2u);
      }
      if (sub_1001BFF7C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1022A01D0 != -1)
          dispatch_once(&qword_1022A01D0, &stru_1021554A0);
        v16[0] = 0;
        _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A01D8, 1, "#pla #zone-relevance-tracker recompute auth context", v16, 2);
        v15 = (uint8_t *)v14;
        sub_100512490("Generic", 1, 0, 2, "-[CLZoneRelevanceTracker handleEntryExitDelegateCallbackForRegion:withState:]", "%s\n", v14);
        if (v15 != buf)
          free(v15);
      }
      v10 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", v7);
      v11 = *(_QWORD *)&self->_currentLocation.ellipsoidalAltitude;
      sub_1015A2E04(buf, "");
      sub_100193838(v11, v10, (uint64_t)buf);
      if (SBYTE3(v21) < 0)
        operator delete(*(void **)buf);
    }
    else
    {
      v12 = v8;
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021554A0);
      v13 = qword_1022A01D8;
      if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289538;
        *(_DWORD *)&buf[4] = 0;
        v18 = 2082;
        v19 = "";
        v20 = 2082;
        v21 = objc_msgSend(v7, "UTF8String");
        v22 = 2082;
        v23 = objc_msgSend(v12, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla ClientManager has marked ZoneTracker as invalid, not updating zone relevance\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
      }
    }
  }
}

- (void)startStopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)longitude longitude:(double)latitude radius:(double)a7 shouldStart:(BOOL)a8
{
  _BOOL4 v8;
  NSString *v15;
  CLLocationCoordinate2D v16;
  id v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;

  v8 = a8;
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), a3, CFSTR(":"), a4);
  if (v8)
  {
    v16 = CLLocationCoordinate2DMake(longitude, latitude);
    latitude = v16.latitude;
    longitude = v16.longitude;
    v17 = objc_msgSend(objc_alloc((Class)CLCircularRegion), "initNearbyAllowedWithCenter:radius:identifier:", v15, v16.latitude, v16.longitude, a7);
    objc_msgSend(v17, "setNotifyOnEntry:", 1);
    objc_msgSend(v17, "setNotifyOnExit:", 1);
  }
  else
  {
    v17 = objc_msgSend(objc_alloc((Class)CLCircularRegion), "initWithCenter:radius:identifier:", v15);
  }
  if (v17)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021554A0);
    v18 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v19 = "starting";
      else
        v19 = "stopping";
      *(_DWORD *)buf = 68290562;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = v19;
      v31 = 2050;
      v32 = latitude;
      v33 = 2050;
      v34 = longitude;
      v35 = 2050;
      v36 = a7;
      v37 = 2082;
      v38 = objc_msgSend(a3, "UTF8String");
      v39 = 2082;
      v40 = objc_msgSend(a4, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker for circular-region\", \"monitoring\":%{public, location:escape_only}s, \"latitude\":\"%{public}.7f\", \"longitude\":\"%{public}.7f\", \"radius\":\"%{public}.3f\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x4Eu);
    }
    v20 = *(void **)&self->_currentLocation.fromSimulationController;
    if (v8)
      objc_msgSend(v20, "startMonitoringForRegion:", v17);
    else
      objc_msgSend(v20, "stopMonitoringForRegion:", v17);
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021554A0);
    v21 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289538;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = (const char *)objc_msgSend(a3, "UTF8String");
      v31 = 2082;
      v32 = COERCE_DOUBLE(objc_msgSend(a4, "UTF8String"));
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker cannot create CircularRegion\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021554A0);
    }
    v22 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v23 = (const char *)objc_msgSend(a3, "UTF8String");
      v24 = objc_msgSend(a4, "UTF8String");
      *(_DWORD *)buf = 68289538;
      v26 = 0;
      v27 = 2082;
      v28 = "";
      v29 = 2082;
      v30 = v23;
      v31 = 2082;
      v32 = *(double *)&v24;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#pla #zone-relevance-tracker cannot create CircularRegion", "{\"msg%{public}.0s\":\"#pla #zone-relevance-tracker cannot create CircularRegion\", \"Client\":%{public, location:escape_only}s, \"ZoneId\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
}

- (void)startCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4 latitude:(double)a5 longitude:(double)a6 radius:(double)a7
{
  -[CLZoneRelevanceTracker startStopCircularZoneMonitoringForClient:withZoneId:latitude:longitude:radius:shouldStart:](self, "startStopCircularZoneMonitoringForClient:withZoneId:latitude:longitude:radius:shouldStart:", a3, a4, 1, a5, a6, a7);
}

- (void)stopCircularZoneMonitoringForClient:(id)a3 withZoneId:(id)a4
{
  -[CLZoneRelevanceTracker startStopCircularZoneMonitoringForClient:withZoneId:latitude:longitude:radius:shouldStart:](self, "startStopCircularZoneMonitoringForClient:withZoneId:latitude:longitude:radius:shouldStart:", a3, a4, 0, -1.0, -1.0, 0.0);
}

- (CLDaemonLocation)currentLocation
{
  $AB5116BA7E623E054F959CECB034F4E7 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *($AB5116BA7E623E054F959CECB034F4E7 *)&self->floor;
  *(_OWORD *)&retstr->lifespan = *(_OWORD *)&self->rawCoordinate.longitude;
  retstr->rawCoordinate = v3;
  *(_OWORD *)&retstr->rawCourse = *(_OWORD *)&self->signalEnvironmentType;
  *(_OWORD *)&retstr->integrity = *(_OWORD *)((char *)&self->ellipsoidalAltitude + 4);
  v4 = *(_OWORD *)&self->courseAccuracy;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self->speedAccuracy;
  *(_OWORD *)&retstr->speed = v4;
  v5 = *(_OWORD *)&self->type;
  *(_OWORD *)&retstr->course = *(_OWORD *)&self->confidence;
  *(_OWORD *)&retstr->timestamp = v5;
  v6 = *(_OWORD *)&self->verticalAccuracy;
  *(_OWORD *)&retstr->suitability = *(_OWORD *)&self->horizontalAccuracy;
  *(_OWORD *)&retstr->coordinate.longitude = v6;
  return self;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0xFFFF;
  *(_QWORD *)((char *)self + 36) = 0;
  *(_QWORD *)((char *)self + 28) = 0;
  *(_OWORD *)((char *)self + 44) = xmmword_101BAFC90;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)((char *)self + 60) = _Q0;
  *(_OWORD *)((char *)self + 76) = _Q0;
  *(_OWORD *)((char *)self + 92) = _Q0;
  *((_DWORD *)self + 27) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 14) = 0xBFF0000000000000;
  *((_DWORD *)self + 34) = 0;
  *(_QWORD *)((char *)self + 140) = 0xBFF0000000000000;
  *((_DWORD *)self + 37) = 0x7FFFFFFF;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 19) = 0;
  *((_BYTE *)self + 176) = 0;
  return self;
}

@end
