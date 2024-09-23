@implementation VLFVIOSessionFusedLocationMonitor

- (VLFVIOSessionFusedLocationMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VLFVIOSessionFusedLocationMonitor *v4;
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
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  const char *v22;
  id v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  id v28;
  objc_super v30;
  uint8_t buf[4];
  VLFVIOSessionFusedLocationMonitor *v32;
  __int16 v33;
  void *v34;

  v30.receiver = self;
  v30.super_class = (Class)VLFVIOSessionFusedLocationMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v30, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_100B1AB04();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v32 = v4;
      v33 = 2112;
      v34 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor configuration](v4, "configuration"));
    v11 = objc_msgSend(v10, "isVLF");

    if (!v11)
    {
      -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
      v23 = sub_100B1AB04();
      v18 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class(v4);
        v25 = NSStringFromClass(v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 134349314;
        v32 = v4;
        v33 = 2112;
        v34 = v21;
        v22 = "[%{public}p] %@ will not run because the session is not configured for VLF";
        goto LABEL_11;
      }
LABEL_15:

      return v4;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
    v14 = objc_opt_class(ARReplayConfiguration);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("VLFSessionIgnoreFusedLocationForReplayKey"));

      if (v16)
      {
        -[VIOSessionMonitor setEnabled:](v4, "setEnabled:", 0);
        v17 = sub_100B1AB04();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = (objc_class *)objc_opt_class(v4);
          v20 = NSStringFromClass(v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          *(_DWORD *)buf = 134349314;
          v32 = v4;
          v33 = 2112;
          v34 = v21;
          v22 = "[%{public}p] %@ will not run because VLF was run from an ARKit recording, so the fused flag will not be set";
LABEL_11:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else
    {

    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    objc_msgSend(v26, "_addObserver:", v4);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](v4, "session"));
    v28 = objc_msgSend(v27, "state");

    if (v28 == (id)1)
    {
      v18 = objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
      -[NSObject addObserver:](v18, "addObserver:", v4);
      goto LABEL_15;
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
  VLFVIOSessionFusedLocationMonitor *v12;
  __int16 v13;
  void *v14;

  v3 = sub_100B1AB04();
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

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  objc_msgSend(v9, "removeObserver:", self);

  v10.receiver = self;
  v10.super_class = (Class)VLFVIOSessionFusedLocationMonitor;
  -[VLFVIOSessionFusedLocationMonitor dealloc](&v10, "dealloc");
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastLocation"));
  v8 = objc_msgSend(v7, "isCoordinateFused");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p isCoordinateFused: %@>"), v5, self, v9));

  return (NSString *)v10;
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_VLFVIOTeardownFusedLocationEnabled, off_1014B3B98);
}

- (BOOL)shouldDisableVIOSession
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastLocation"));

  if (v3)
    v4 = objc_msgSend(v3, "isCoordinateFused") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  _QWORD block[4];
  id v6[2];
  id location;

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B1AE20;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6;
  char *v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  VLFVIOSessionFusedLocationMonitor *v22;
  int v23;
  VLFVIOSessionFusedLocationMonitor *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;

  v6 = a3;
  v7 = (char *)a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = 136316418;
        v24 = (VLFVIOSessionFusedLocationMonitor *)"-[VLFVIOSessionFusedLocationMonitor locationManager:didUpdateLocation:]";
        v25 = 2080;
        v26 = "VLFVIOSessionFusedLocationMonitor.m";
        v27 = 1024;
        v28 = 108;
        v29 = 2080;
        v30 = "dispatch_get_main_queue()";
        v31 = 2080;
        v32 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v33 = 2080;
        v34 = dispatch_queue_get_label(0);
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
          v22 = (VLFVIOSessionFusedLocationMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
  }
  v11 = sub_100B1AB04();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134349315;
    v24 = self;
    v25 = 2113;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}p] Got location update: %{private}@", (uint8_t *)&v23, 0x16u);
  }

  if ((objc_msgSend(v7, "isCoordinateFused") & 1) == 0)
  {
    v13 = sub_100B1AB04();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v23 = 134349056;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Location update is no longer fused; disabling VIO session",
        (uint8_t *)&v23,
        0xCu);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
    objc_msgSend(v15, "recordSessionDisableEvent:", 7);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor session](self, "session"));
    objc_msgSend(v16, "_removeObserver:", self);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[VLFLocationManager sharedLocationManager](VLFLocationManager, "sharedLocationManager"));
    objc_msgSend(v17, "removeObserver:", self);

  }
}

@end
