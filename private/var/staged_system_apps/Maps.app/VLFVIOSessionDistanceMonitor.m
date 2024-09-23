@implementation VLFVIOSessionDistanceMonitor

- (VLFVIOSessionDistanceMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VLFVIOSessionDistanceMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  id v16;
  NSObject *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  const char *v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  CLLocation *vlfLocation;
  void *v31;
  id v32;
  objc_super v34;
  uint8_t buf[4];
  VLFVIOSessionDistanceMonitor *v36;
  __int16 v37;
  void *v38;

  v34.receiver = self;
  v34.super_class = (Class)VLFVIOSessionDistanceMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v34, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1004755E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v36 = v4;
      v37 = 2112;
      v38 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor configuration](v4, "configuration"));
    v11 = objc_msgSend(v10, "isVLF");

    if (!v11)
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v22 = sub_1004755E8();
      v17 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v23 = (objc_class *)objc_opt_class(v4);
        v24 = NSStringFromClass(v23);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
        *(_DWORD *)buf = 134349314;
        v36 = v4;
        v37 = 2112;
        v38 = v20;
        v21 = "[%{public}p] %@ will not run because the session is not configured for VLF";
        goto LABEL_10;
      }
LABEL_13:

      return v4;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSession"));
    v14 = objc_opt_class(NavigationSession);
    isKindOfClass = objc_opt_isKindOfClass(v13, v14);

    if ((isKindOfClass & 1) != 0)
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v16 = sub_1004755E8();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class(v4);
        v19 = NSStringFromClass(v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
        *(_DWORD *)buf = 134349314;
        v36 = v4;
        v37 = 2112;
        v38 = v20;
        v21 = "[%{public}p] %@ will not run because we are currently navigating";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](v4, "platformController"));
    objc_msgSend(v25, "addObserver:", v4);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v26, "_addObserver:", v4);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "technique"));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "vlfLocation"));
    vlfLocation = v4->_vlfLocation;
    v4->_vlfLocation = (CLLocation *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v32 = objc_msgSend(v31, "state");

    if (v32 == (id)1)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      -[NSObject startLocationUpdateWithObserver:](v17, "startLocationUpdateWithObserver:", v4);
      goto LABEL_13;
    }
  }
  return v4;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  VLFVIOSessionDistanceMonitor *v13;
  __int16 v14;
  void *v15;

  v3 = sub_1004755E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
  objc_msgSend(v8, "removeObserver:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  objc_msgSend(v9, "_removeObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v10, "stopLocationUpdateWithObserver:", self);

  v11.receiver = self;
  v11.super_class = (Class)VLFVIOSessionDistanceMonitor;
  -[VLFVIOSessionDistanceMonitor dealloc](&v11, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  double Double;
  uint64_t v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  Double = GEOConfigGetDouble(MapsConfig_VLFVIOTeardownDistanceThreshold, off_1014B3B58);
  -[VLFVIOSessionDistanceMonitor _distanceFromOrigin](self, "_distanceFromOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p distanceThreshold: %f distanceFromOrigin: %f>"), v5, self, *(_QWORD *)&Double, v7));

  return (NSString *)v8;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_VLFVIOTeardownDistanceEnabled, off_1014B3B48);
}

- (BOOL)shouldDisableVIOSession
{
  double v2;

  -[VLFVIOSessionDistanceMonitor _distanceFromOrigin](self, "_distanceFromOrigin");
  return v2 >= GEOConfigGetDouble(MapsConfig_VLFVIOTeardownDistanceThreshold, off_1014B3B58);
}

- (double)_distanceFromOrigin
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CLLocationDegrees v7;
  double v8;
  CLLocationDegrees v9;
  double v10;
  double v11;
  CLLocationDegrees v12;
  CLLocationDegrees v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  const char *v21;
  id v22;
  id v23;
  id v24;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  _QWORD v31[2];
  uint8_t buf[4];
  VLFVIOSessionDistanceMonitor *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  CLLocationCoordinate2D v38;
  CLLocationCoordinate2D v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VLFVIOSessionDistanceMonitor vlfLocation](self, "vlfLocation"));
  objc_msgSend(v4, "coordinate");
  v7 = v6;
  v9 = v8;
  *(double *)v31 = v6;
  *(double *)&v31[1] = v8;
  objc_msgSend(v5, "coordinate");
  v29 = v10;
  v30 = v11;
  if (!v4)
  {
    v19 = sub_1004755E8();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_DWORD *)buf = 134349056;
    v33 = self;
    v21 = "[%{public}p] Current location is nil; ignoring";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);
    goto LABEL_16;
  }
  if (!v5)
  {
    v22 = sub_1004755E8();
    v20 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_DWORD *)buf = 134349056;
    v33 = self;
    v21 = "[%{public}p] Origin location is nil; ignoring";
    goto LABEL_15;
  }
  v12 = v10;
  v13 = v11;
  v38.latitude = v7;
  v38.longitude = v9;
  if (!CLLocationCoordinate2DIsValid(v38))
  {
    v23 = sub_1004755E8();
    v20 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_16;
    *(_DWORD *)buf = 134349056;
    v33 = self;
    v21 = "[%{public}p] Current coordinate is invalid; ignoring";
    goto LABEL_15;
  }
  v39.latitude = v12;
  v39.longitude = v13;
  if (!CLLocationCoordinate2DIsValid(v39))
  {
    v24 = sub_1004755E8();
    v20 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v33 = self;
      v21 = "[%{public}p] Origin coordinate is invalid; ignoring";
      goto LABEL_15;
    }
LABEL_16:

    v18 = 0.0;
    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp", *(_QWORD *)&v29, *(_QWORD *)&v30));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v17 <= 0.0)
  {
    v26 = sub_1004755E8();
    v20 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timestamp"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timestamp"));
      *(_DWORD *)buf = 134349570;
      v33 = self;
      v34 = 2112;
      v35 = v27;
      v36 = 2112;
      v37 = v28;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}p] Current location estimate (%@) was obtained before VLF fix occurred (%@); waiting for a location up"
        "date before calculating true distance",
        buf,
        0x20u);

    }
    goto LABEL_16;
  }
  v18 = CLLocationCoordinate2DGetDistanceFrom(v31, &v29);
LABEL_17:

  return v18;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  double Double;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  VLFVIOSessionDistanceMonitor *v24;
  int v25;
  VLFVIOSessionDistanceMonitor *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  _BYTE v30[14];
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  CLLocationCoordinate2D v35;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316418;
        v26 = (VLFVIOSessionDistanceMonitor *)"-[VLFVIOSessionDistanceMonitor locationManagerUpdatedLocation:]";
        v27 = 2080;
        v28 = "VLFVIOSessionDistanceMonitor.m";
        v29 = 1024;
        *(_DWORD *)v30 = 123;
        *(_WORD *)&v30[4] = 2080;
        *(_QWORD *)&v30[6] = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v25,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (VLFVIOSessionDistanceMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v25 = 138412290;
          v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  v9 = v8;
  if (!v8 || (objc_msgSend(v8, "coordinate"), !CLLocationCoordinate2DIsValid(v35)))
  {
    v19 = sub_1004755E8();
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v25 = 134349056;
      v26 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Location was nil or invalid; ignoring update",
        (uint8_t *)&v25,
        0xCu);
    }
    goto LABEL_15;
  }
  Double = GEOConfigGetDouble(MapsConfig_VLFVIOTeardownDistanceThreshold, off_1014B3B58);
  -[VLFVIOSessionDistanceMonitor _distanceFromOrigin](self, "_distanceFromOrigin");
  if (v11 >= Double)
  {
    v12 = v11;
    v13 = sub_1004755E8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v25 = 134349569;
      v26 = self;
      v27 = 2049;
      v28 = *(const char **)&v12;
      v29 = 2049;
      *(double *)v30 = Double;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Distance traveled from origin (%{private}f) is larger than the threshold (%{private}f); disabling VIO session",
        (uint8_t *)&v25,
        0x20u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v15, "recordSessionDisableEvent:", 9);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
    objc_msgSend(v16, "removeObserver:", self);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
    objc_msgSend(v17, "_removeObserver:", self);

    v18 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    -[NSObject stopLocationUpdateWithObserver:](v18, "stopLocationUpdateWithObserver:", self);
LABEL_15:

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100475F34;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  VLFVIOSessionDistanceMonitor *v15;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = sub_1004755E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Navigation started; stop monitoring location updates",
        (uint8_t *)&v14,
        0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor platformController](self, "platformController"));
    objc_msgSend(v11, "removeObserver:", self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
    objc_msgSend(v12, "_removeObserver:", self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v13, "stopLocationUpdateWithObserver:", self);

    -[VIOSessionMonitor setEnabled:](self, "setEnabled:", 0);
  }
}

- (CLLocation)vlfLocation
{
  return self->_vlfLocation;
}

- (void)setVlfLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfLocation, 0);
}

@end
