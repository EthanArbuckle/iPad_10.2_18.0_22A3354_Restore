@implementation VLFVIOSessionLocationAccuracyMonitor

- (VLFVIOSessionLocationAccuracyMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VLFVIOSessionLocationAccuracyMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  objc_super v21;
  uint8_t buf[4];
  VLFVIOSessionLocationAccuracyMonitor *v23;
  __int16 v24;
  void *v25;

  v21.receiver = self;
  v21.super_class = (Class)VLFVIOSessionLocationAccuracyMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v21, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_100809960();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v23 = v4;
      v24 = 2112;
      v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor configuration](v4, "configuration"));
    v11 = objc_msgSend(v10, "isVLF");

    if (!v11)
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v16 = sub_100809960();
      v15 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class(v4);
        v18 = NSStringFromClass(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 134349314;
        v23 = v4;
        v24 = 2112;
        v25 = v19;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}p] %@ will not run because the session is not configured for VLF", buf, 0x16u);

      }
      goto LABEL_9;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v12, "_addObserver:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v14 = objc_msgSend(v13, "state");

    if (v14 == (id)1)
    {
      v15 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      -[NSObject startLocationUpdateWithObserver:](v15, "startLocationUpdateWithObserver:", v4);
LABEL_9:

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
  objc_super v10;
  uint8_t buf[4];
  VLFVIOSessionLocationAccuracyMonitor *v12;
  __int16 v13;
  void *v14;

  v3 = sub_100809960();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
  objc_msgSend(v8, "_removeObserver:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v9, "stopLocationUpdateWithObserver:", self);

  v10.receiver = self;
  v10.super_class = (Class)VLFVIOSessionLocationAccuracyMonitor;
  -[VLFVIOSessionLocationAccuracyMonitor dealloc](&v10, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p accuracyThreshold: %f>"), v5, self, GEOConfigGetDouble(MapsConfig_VLFVIOTeardownLocationAccuracyThreshold, off_1014B3A28));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_VLFVIOTeardownLocationAccuracyEnabled, off_1014B3A18);
}

- (BOOL)shouldDisableVIOSession
{
  const char *label;
  const char *v3;
  BOOL v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v3 = dispatch_queue_get_label(0);
  if (label != v3)
  {
    v4 = !label || v3 == 0;
    if (v4 || strcmp(label, v3))
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v15 = 136316418;
        v16 = "-[VLFVIOSessionLocationAccuracyMonitor shouldDisableVIOSession]";
        v17 = 2080;
        v18 = "VLFVIOSessionLocationAccuracyMonitor.m";
        v19 = 1024;
        v20 = 73;
        v21 = 2080;
        v22 = "dispatch_get_main_queue()";
        v23 = 2080;
        v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v25 = 2080;
        v26 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v15,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));
  objc_msgSend(v6, "horizontalAccuracy");
  v8 = v7 >= GEOConfigGetDouble(MapsConfig_VLFVIOTeardownLocationAccuracyThreshold, off_1014B3A28);

  return v8;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  double Double;
  double v10;
  id v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  VLFVIOSessionLocationAccuracyMonitor *v22;
  int v23;
  VLFVIOSessionLocationAccuracyMonitor *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = (VLFVIOSessionLocationAccuracyMonitor *)"-[VLFVIOSessionLocationAccuracyMonitor locationManagerUpdatedLocation:]";
        v25 = 2080;
        v26 = "VLFVIOSessionLocationAccuracyMonitor.m";
        v27 = 1024;
        *(_DWORD *)v28 = 82;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = "dispatch_get_main_queue()";
        v29 = 2080;
        v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v31 = 2080;
        v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v23,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (VLFVIOSessionLocationAccuracyMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  if (!v8)
  {
    v17 = sub_100809960();
    v16 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v23 = 134349056;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Location was nil; ignoring update",
        (uint8_t *)&v23,
        0xCu);
    }
    goto LABEL_14;
  }
  Double = GEOConfigGetDouble(MapsConfig_VLFVIOTeardownLocationAccuracyThreshold, off_1014B3A28);
  objc_msgSend(v8, "horizontalAccuracy");
  if (v10 >= Double)
  {
    v11 = sub_100809960();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "horizontalAccuracy");
      v23 = 134349569;
      v24 = self;
      v25 = 2049;
      v26 = v13;
      v27 = 2049;
      *(double *)v28 = Double;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Location horizontal accuracy (%{private}f) went above the threshold (%{private}f); disabling VIO session",
        (uint8_t *)&v23,
        0x20u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v14, "recordSessionDisableEvent:", 6);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
    objc_msgSend(v15, "_removeObserver:", self);

    v16 = objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    -[NSObject stopLocationUpdateWithObserver:](v16, "stopLocationUpdateWithObserver:", self);
LABEL_14:

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
  block[2] = sub_10080A148;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

@end
