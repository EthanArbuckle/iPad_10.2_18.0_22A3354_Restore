@implementation VIOSessionSunsetSunriseMonitor

- (VIOSessionSunsetSunriseMonitor)initWithStateManager:(id)a3 platformController:(id)a4
{
  VIOSessionSunsetSunriseMonitor *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  objc_super v11;
  uint8_t buf[4];
  VIOSessionSunsetSunriseMonitor *v13;
  __int16 v14;
  void *v15;

  v11.receiver = self;
  v11.super_class = (Class)VIOSessionSunsetSunriseMonitor;
  v4 = -[VIOSessionMonitor initWithStateManager:platformController:](&v11, "initWithStateManager:platformController:", a3, a4);
  if (v4)
  {
    v5 = sub_1006C8ED8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class(v4);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      *(_DWORD *)buf = 134349314;
      v13 = v4;
      v14 = 2112;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Enabling %@", buf, 0x16u);

    }
    v4->_wasNightTimeAtStartOfSession = -[VIOSessionSunsetSunriseMonitor isCurrentlyNightTime](v4, "isCurrentlyNightTime");
    -[VIOSessionSunsetSunriseMonitor reportStateToStateManager](v4, "reportStateToStateManager");
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
  objc_super v8;
  uint8_t buf[4];
  VIOSessionSunsetSunriseMonitor *v10;
  __int16 v11;
  void *v12;

  v3 = sub_1006C8ED8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(self);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Disabling %@", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)VIOSessionSunsetSunriseMonitor;
  -[VIOSessionSunsetSunriseMonitor dealloc](&v8, "dealloc");
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL(MapsConfig_OpticalHeadingSessionThrottlerEnableSunsetSunriseMonitor, off_1014B3618);
}

- (BOOL)shouldDisableVIOSession
{
  return self->_wasNightTimeAtStartOfSession;
}

- (BOOL)isCurrentlyNightTime
{
  void *v3;
  double Double;
  id v5;
  NSObject *v6;
  char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  VIOSessionSunsetSunriseMonitor *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  id v24;
  id v25;
  const char *v26;
  id v27;
  id v28;
  int v29;
  VIOSessionSunsetSunriseMonitor *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  if (objc_msgSend(v3, "hasLocation"))
  {
    Double = GEOConfigGetDouble(MapsConfig_OpticalHeadingSessionThrottlerSunsetSunriseOffsetThreshold, off_1014B35D8);
    v5 = sub_1006C8ED8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v29 = 134349827;
      v30 = self;
      v31 = 2113;
      v32 = v7;
      v33 = 2112;
      v34 = v8;
      v35 = 2048;
      v36 = Double;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] LocationManager has a last location: %{private}@; calculating sunset/sunrise times with current dat"
        "e: %@, and offset threshold: %f",
        (uint8_t *)&v29,
        0x2Au);

    }
    v9 = objc_claimAutoreleasedReturnValue(+[SunsetSunriseCalculator sharedCalculator](SunsetSunriseCalculator, "sharedCalculator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastLocation"));
    v11 = objc_msgSend((id)v9, "currentStateForLocation:offsetThreshold:", v10, Double);

    switch((unint64_t)v11)
    {
      case 0uLL:
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v29 = 136315650;
          v30 = (VIOSessionSunsetSunriseMonitor *)"-[VIOSessionSunsetSunriseMonitor isCurrentlyNightTime]";
          v31 = 2080;
          v32 = "VIOSessionSunsetSunriseMonitor.m";
          v33 = 1024;
          LODWORD(v34) = 93;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v29, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (VIOSessionSunsetSunriseMonitor *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v29 = 138412290;
            v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

          }
        }
        v17 = sub_1006C8ED8();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        v29 = 134349056;
        v30 = self;
        v19 = "[%{public}p] Unknown sunset/sunrise state; not disabling VIO session";
        v20 = v18;
        v21 = OS_LOG_TYPE_ERROR;
        goto LABEL_16;
      case 1uLL:
        v24 = sub_1006C8ED8();
        v18 = objc_claimAutoreleasedReturnValue(v24);
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_17;
        v29 = 134349056;
        v30 = self;
        v19 = "[%{public}p] Not disabling VIO session because it's currently day time";
        goto LABEL_15;
      case 2uLL:
        v25 = sub_1006C8ED8();
        v18 = objc_claimAutoreleasedReturnValue(v25);
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_18;
        v29 = 134349056;
        v30 = self;
        v26 = "[%{public}p] Disabling VIO session because we're shortly before sunset";
        goto LABEL_28;
      case 3uLL:
        v27 = sub_1006C8ED8();
        v18 = objc_claimAutoreleasedReturnValue(v27);
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_18;
        v29 = 134349056;
        v30 = self;
        v26 = "[%{public}p] Disabling VIO session because we're between sunset and sunrise";
        goto LABEL_28;
      case 4uLL:
        v28 = sub_1006C8ED8();
        v18 = objc_claimAutoreleasedReturnValue(v28);
        LOBYTE(v9) = 1;
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          goto LABEL_18;
        v29 = 134349056;
        v30 = self;
        v26 = "[%{public}p] Disabling VIO session because we're shortly after sunrise";
LABEL_28:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v29, 0xCu);
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }
  v22 = sub_1006C8ED8();
  v18 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v29 = 134349056;
    v30 = self;
    v19 = "[%{public}p] LocationManager doesn't have a last location; not disabling VIO session.";
LABEL_15:
    v20 = v18;
    v21 = OS_LOG_TYPE_INFO;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v29, 0xCu);
  }
LABEL_17:
  LOBYTE(v9) = 0;
LABEL_18:

LABEL_19:
  return v9 & 1;
}

- (void)reportStateToStateManager
{
  const char *label;
  const char *v4;
  BOOL v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VIOSessionSunsetSunriseMonitor reportStateToStateManager]";
        v16 = 2080;
        v17 = "VIOSessionSunsetSunriseMonitor.m";
        v18 = 1024;
        v19 = 106;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  v6 = -[VIOSessionSunsetSunriseMonitor shouldDisableVIOSession](self, "shouldDisableVIOSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VIOSessionMonitor stateManager](self, "stateManager"));
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "recordSessionDisableEvent:", 3);
  else
    objc_msgSend(v7, "resetSessionDisableEvent:", 3);

}

- (BOOL)wasNightTimeAtStartOfSession
{
  return self->_wasNightTimeAtStartOfSession;
}

- (void)setWasNightTimeAtStartOfSession:(BOOL)a3
{
  self->_wasNightTimeAtStartOfSession = a3;
}

@end
