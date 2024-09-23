@implementation CLWorkoutGeoFenceController

- (CLWorkoutGeoFenceController)initWithDelegate:(id)a3 withSilo:(id)a4
{
  CLWorkoutGeoFenceController *v7;
  CLWorkoutGeoFenceController *v8;
  CLDispatchSilo *silo;
  _QWORD v11[6];
  objc_super v12;

  objc_msgSend(a4, "assertInside");
  v12.receiver = self;
  v12.super_class = (Class)CLWorkoutGeoFenceController;
  v7 = -[CLWorkoutGeoFenceController init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    -[CLWorkoutGeoFenceController setDelegate:](v7, "setDelegate:", a3);
    v8->_silo = (CLDispatchSilo *)a4;
    -[CLWorkoutGeoFenceController setFenceIdentifier:](v8, "setFenceIdentifier:", CFSTR("com.apple.locationd.workout.geofence"));
    v8->_regionState = 0;
    v8->_authorizationStatus = 0;
    v8->_fenceRadius = 200.0;
    silo = v8->_silo;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10133A70C;
    v11[3] = &unk_10212BB30;
    v11[4] = v8;
    v11[5] = a4;
    -[CLDispatchSilo async:](silo, "async:", v11);
  }
  return v8;
}

- (void)dealloc
{
  CLDispatchSilo *silo;
  CLDispatchSilo *v4;
  CLDispatchSilo **p_silo;
  objc_super v6;
  _QWORD v7[5];

  if (self->_inWorkout)
    sub_10194DA0C();
  p_silo = &self->_silo;
  silo = self->_silo;
  v4 = p_silo[1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10133A870;
  v7[3] = &unk_10212BB58;
  v7[4] = v4;
  -[CLDispatchSilo async:](silo, "async:", v7);
  self->_locationManager = 0;
  self->_delegate = 0;

  self->_silo = 0;
  self->_fenceIdentifier = 0;

  self->_installedRegion = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutGeoFenceController;
  -[CLWorkoutGeoFenceController dealloc](&v6, "dealloc");
}

- (void)startGeoFenceWithRadius:(double)a3
{
  NSObject *v5;
  CLDispatchSilo *silo;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  _QWORD v12[5];
  _WORD v13[8];
  uint8_t buf[1640];

  -[CLDispatchSilo assertInside](self->_silo, "assertInside");
  self->_inWorkout = 1;
  self->_fenceRadius = a3;
  if (self->_locationManager
    && -[CLWorkoutGeoFenceController isGeoFenceAuthorizedAndPossible](self, "isGeoFenceAuthorizedAndPossible"))
  {
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v5 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Starting geofence", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Starting geofence", v13, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CLWorkoutGeoFenceController uninstallCurrentFence](self, "uninstallCurrentFence");
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
    silo = self->_silo;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10133AE24;
    v12[3] = &unk_10212BB58;
    v12[4] = self;
    sub_10133ABC4((dispatch_source_t *)&self->_locationUpdateTimer, 60, silo, v12);
  }
  else
  {
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v7 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc Could not start geofence, check authorizations", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      v13[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Could not start geofence, check authorizations", v13, 2);
      v9 = (uint8_t *)v8;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v8);
      if (v9 != buf)
        free(v9);
    }
  }
}

- (void)stopGeoFence
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  -[CLDispatchSilo assertInside](self->_silo, "assertInside");
  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Stopping geofence", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Stopping geofence", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController stopGeoFence]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  -[CLWorkoutGeoFenceController uninstallCurrentFence](self, "uninstallCurrentFence");
  -[CLWorkoutGeoFenceController cancelTimers](self, "cancelTimers");
  -[CLWorkoutGeoFenceController reset](self, "reset");
}

- (void)reset
{
  self->_regionState = 0;
  *(_DWORD *)&self->_isFenceInstalled = 0;
  -[CLWorkoutGeoFenceController setInstalledRegion:](self, "setInstalledRegion:", 0);
}

- (BOOL)isGeoFenceAuthorizedAndPossible
{
  BOOL result;

  result = +[CLLocationManager isMonitoringAvailableForClass:](CLLocationManager, "isMonitoringAvailableForClass:", objc_opt_class(CLCircularRegion, a2));
  if (self->_authorizationStatus != 4)
    return 0;
  return result;
}

- (void)uninstallCurrentFence
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;
  const char *v10;
  uint8_t *v11;
  const char *v12;
  uint8_t *v13;
  _WORD v14[8];
  uint8_t buf[1640];

  if (-[CLWorkoutGeoFenceController installedRegion](self, "installedRegion"))
  {
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v3 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Installed region exists at stop workout, uninstalling", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Installed region exists at stop workout, uninstalling", v14, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CLLocationManager stopMonitoringForRegion:](self->_locationManager, "stopMonitoringForRegion:", -[CLWorkoutGeoFenceController installedRegion](self, "installedRegion"));
  }
  else
  {
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v4 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#gfc Generating temporary region to uninstall just in case", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      v14[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Generating temporary region to uninstall just in case", v14, 2);
      v13 = (uint8_t *)v12;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v12);
      if (v13 != buf)
        free(v13);
    }
    v5 = objc_msgSend(objc_alloc((Class)CLLocation), "initWithLatitude:longitude:", 0.0, 0.0);
    v6 = objc_alloc((Class)CLCircularRegion);
    objc_msgSend(v5, "coordinate");
    v9 = objc_msgSend(v6, "initNearbyAllowedWithCenter:radius:identifier:", -[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier"), v7, v8, 200.0);
    -[CLLocationManager stopMonitoringForRegion:](self->_locationManager, "stopMonitoringForRegion:", v9);

  }
  *(_WORD *)&self->_isFenceInstalled = 0;
  self->_isMonitoringRegion = 0;
}

- (void)installFenceWithCenter:(id)a3
{
  NSObject *v5;
  double fenceRadius;
  id v7;
  double v8;
  double v9;
  id v10;
  double v11;
  const char *v12;
  uint8_t *v13;
  int v14;
  double v15;
  uint8_t buf[4];
  double v17;

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v5 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    fenceRadius = self->_fenceRadius;
    *(_DWORD *)buf = 134217984;
    v17 = fenceRadius;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Installing fence with radius %f", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v11 = self->_fenceRadius;
    v14 = 134217984;
    v15 = v11;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Installing fence with radius %f", COERCE_DOUBLE(&v14));
    v13 = (uint8_t *)v12;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController installFenceWithCenter:]", "%s\n", v12);
    if (v13 != buf)
      free(v13);
  }
  v7 = objc_alloc((Class)CLCircularRegion);
  objc_msgSend(a3, "coordinate");
  v10 = objc_msgSend(v7, "initNearbyAllowedWithCenter:radius:identifier:", -[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier"), v8, v9, self->_fenceRadius);
  -[CLLocationManager startMonitoringForRegion:](self->_locationManager, "startMonitoringForRegion:", v10);

}

- (void)cancelTimers
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Canceling all timers", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Canceling all timers", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController cancelTimers]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10133B758((dispatch_source_t *)&self->_geoFenceTimer);
  sub_10133B758((dispatch_source_t *)&self->_locationUpdateTimer);
}

- (void)onGeoFenceTimerFire
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out fence monitoring", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Timed out fence monitoring", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController onGeoFenceTimerFire]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10133B758((dispatch_source_t *)&self->_geoFenceTimer);
  if (self->_inWorkout)
    -[CLWorkoutGeoFenceControllerDelegate didTimeoutGeoFence](-[CLWorkoutGeoFenceController delegate](self, "delegate"), "didTimeoutGeoFence");
}

- (void)onLocationUpdateTimerFire
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  _WORD v6[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v3 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out location updates", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v6[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Timed out location updates", v6, 2);
    v5 = (uint8_t *)v4;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController onLocationUpdateTimerFire]", "%s\n", v4);
    if (v5 != buf)
      free(v5);
  }
  sub_10133B758((dispatch_source_t *)&self->_locationUpdateTimer);
  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  double v9;
  CLLocationAccuracy v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  uint8_t *v16;
  const char *v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;

  if (self->_inWorkout)
  {
    v5 = objc_msgSend(a4, "lastObject", a3);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v6 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(v5, "timestamp");
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      *(_DWORD *)buf = 138412546;
      v25 = v7;
      v26 = 2048;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#gfc Received new location, timestamp %@, time since now %f", buf, 0x16u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      v12 = qword_10229FE68;
      v13 = objc_msgSend(v5, "timestamp");
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      v20 = 138412546;
      v21 = v13;
      v22 = 2048;
      v23 = v14;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v12, 2, "#gfc Received new location, timestamp %@, time since now %f", &v20, 22);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    if (!self->_isFenceInstalled && !self->_isAttemptingFenceInstall)
    {
      objc_msgSend(objc_msgSend(v5, "timestamp"), "timeIntervalSinceNow");
      if (fabs(v9) < 15.0)
      {
        objc_msgSend(v5, "horizontalAccuracy");
        if (v10 < kCLLocationAccuracyHundredMeters)
        {
          if (qword_10229FE60 != -1)
            dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
          v11 = qword_10229FE68;
          if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#gfc Attempting to install fence", buf, 2u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FE60 != -1)
              dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
            LOWORD(v20) = 0;
            LODWORD(v19) = 2;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Attempting to install fence", &v20, v19);
            v18 = (uint8_t *)v17;
            sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]", "%s\n", v17);
            if (v18 != buf)
              free(v18);
          }
          self->_isAttemptingFenceInstall = 1;
          -[CLWorkoutGeoFenceController installFenceWithCenter:](self, "installFenceWithCenter:", v5);
          sub_10133B758((dispatch_source_t *)&self->_locationUpdateTimer);
          -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
        }
      }
    }
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  _WORD v8[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v5 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Exited fence", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v8[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Exited fence", v8, 2);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didExitRegion:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  if (self->_inWorkout)
    -[CLWorkoutGeoFenceControllerDelegate didExitGeoFence](-[CLWorkoutGeoFenceController delegate](self, "delegate"), "didExitGeoFence");
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v5 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Generic failure with error %@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v8 = 138412290;
    v9 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Generic failure with error %@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didFailWithError:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  id v11;
  uint8_t buf[4];
  id v13;

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v7 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc Monitoring failed with error %@, stopping updates", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v10 = 138412290;
    v11 = a5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Monitoring failed with error %@, stopping updates", &v10, 12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:monitoringDidFailForRegion:withError:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (self->_inWorkout)
  {
    self->_isMonitoringRegion = 0;
    if (!self->_isFenceInstalled)
      self->_isAttemptingFenceInstall = 0;
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  NSObject *v6;
  CLDispatchSilo *silo;
  const char *v8;
  uint8_t *v9;
  _QWORD v10[5];
  _WORD v11[8];
  uint8_t buf[1640];

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v6 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Started monitoring", buf, 2u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v11[0] = 0;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Started monitoring", v11, 2);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didStartMonitoringForRegion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (self->_inWorkout)
  {
    -[CLWorkoutGeoFenceController setInstalledRegion:](self, "setInstalledRegion:", a4);
    *(_WORD *)&self->_isFenceInstalled = 1;
    self->_isMonitoringRegion = 1;
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10133C834;
    v10[3] = &unk_10212BB58;
    v10[4] = self;
    sub_10133ABC4((dispatch_source_t *)&self->_geoFenceTimer, 5400, silo, v10);
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  int v10;
  int64_t v11;
  uint8_t buf[4];
  int64_t v13;

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v7 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#gfc Determined state %ld", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v10 = 134217984;
    v11 = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 2, "#gfc Determined state %ld", &v10);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didDetermineState:forRegion:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  if (self->_inWorkout)
    self->_regionState = a4;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;

  if (qword_10229FE60 != -1)
    dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
  v6 = qword_10229FE68;
  if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Received auth update %d", buf, 8u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v12[0] = 67109120;
    v12[1] = a4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc Received auth update %d", v12);
    v9 = (uint8_t *)v8;
    sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]", "%s\n", v8);
    if (v9 != buf)
      free(v9);
  }
  self->_authorizationStatus = a4;
  if (a4 != 4)
  {
    if (qword_10229FE60 != -1)
      dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
    v7 = qword_10229FE68;
    if (os_log_type_enabled((os_log_t)qword_10229FE68, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc No longer authorized, stopping geofence", buf, 2u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FE60 != -1)
        dispatch_once(&qword_10229FE60, &stru_1021AF6F8);
      LOWORD(v12[0]) = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FE68, 0, "#gfc No longer authorized, stopping geofence", v12, 2);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    -[CLWorkoutGeoFenceController stopGeoFence](self, "stopGeoFence");
  }
}

- (CLWorkoutGeoFenceControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLWorkoutGeoFenceControllerDelegate *)a3;
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLRegion)installedRegion
{
  return self->_installedRegion;
}

- (void)setInstalledRegion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
