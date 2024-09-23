@implementation VLFSessionLocationTypeMonitor

- (VLFSessionLocationTypeMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionLocationTypeMonitor *v8;
  VLFSessionLocationTypeMonitor *v9;
  id *p_locationManager;
  void *v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionLocationTypeMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationTypeMonitor.m";
      v28 = 1024;
      v29 = 55;
      v30 = 2080;
      v31 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v25 = "-[VLFSessionLocationTypeMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationTypeMonitor.m";
      v28 = 1024;
      v29 = 56;
      v30 = 2080;
      v31 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VLFSessionLocationTypeMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v23, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    objc_msgSend(*p_locationManager, "addObserver:", v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationTypeAllowGPS, off_1014B3CA8, &_dispatch_main_q, v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationTypeAllowWiFi, off_1014B3CB8, &_dispatch_main_q, v9);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationTypeAllowWiFi2, off_1014B3CC8, &_dispatch_main_q, v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationTypeAllowPipeline, off_1014B3CD8, &_dispatch_main_q, v9);

    -[VLFSessionLocationTypeMonitor _buildAllowedLocationTypes](v9, "_buildAllowedLocationTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_locationManager, "lastLocation"));
    -[VLFSessionLocationTypeMonitor _updateStateWithLocation:](v9, "_updateStateWithLocation:", v11);

  }
  return v9;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  -[VLFLocationManager removeObserver:](self->_locationManager, "removeObserver:", self);
  GEOConfigRemoveDelegateListenerForAllKeys(self, v3);
  v4.receiver = self;
  v4.super_class = (Class)VLFSessionLocationTypeMonitor;
  -[VLFSessionLocationTypeMonitor dealloc](&v4, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeMonitorEnabled, off_1014B3C98);
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int64_t v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  unsigned int v24;
  id v25;
  void *v26;
  void *v27;
  VLFSessionLocationTypeMonitor *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint8_t buf[4];
  _BYTE v37[24];
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v31 = sub_1004318FC();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)v37 = "-[VLFSessionLocationTypeMonitor _updateStateWithLocation:]";
        *(_WORD *)&v37[8] = 2080;
        *(_QWORD *)&v37[10] = "VLFSessionLocationTypeMonitor.m";
        *(_WORD *)&v37[18] = 1024;
        *(_DWORD *)&v37[20] = 93;
        v38 = 2080;
        v39 = "dispatch_get_main_queue()";
        v40 = 2080;
        v41 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v42 = 2080;
        v43 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v33 = sub_1004318FC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v37 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = sub_1006BB34C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v10)
    {
      v11 = objc_msgSend(v4, "type");
      if (v11 < 0xF && ((0x5FFFu >> (char)v11) & 1) != 0)
        v12 = *(&off_1011C0468 + (int)v11);
      else
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v11));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Got location with type: %@", buf, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationTypeMonitor allowedLocationTypes](self, "allowedLocationTypes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "type")));
    v15 = objc_msgSend(v13, "containsObject:", v14);

    v16 = -[VLFSessionMonitor state](self, "state");
    if (v15)
    {
      if (v16 != 2)
      {
        v17 = sub_1006BB34C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = objc_msgSend(v4, "type");
          v20 = objc_msgSend(v4, "type");
          if (v20 < 0xF && ((0x5FFFu >> (char)v20) & 1) != 0)
            v21 = *(&off_1011C0468 + (int)v20);
          else
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v20));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationTypeMonitor allowedLocationTypes](self, "allowedLocationTypes"));
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v37 = v19;
          *(_WORD *)&v37[4] = 2112;
          *(_QWORD *)&v37[6] = v21;
          *(_WORD *)&v37[14] = 2112;
          *(_QWORD *)&v37[16] = v30;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Location type (%d:%@) is in the allowed set (%@); updating state",
            buf,
            0x1Cu);

        }
      }
      v28 = self;
      v29 = 2;
    }
    else
    {
      if (v16)
      {
        v22 = sub_1006BB34C();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v4, "type");
          v25 = objc_msgSend(v4, "type");
          if (v25 < 0xF && ((0x5FFFu >> (char)v25) & 1) != 0)
            v26 = *(&off_1011C0468 + (int)v25);
          else
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationTypeMonitor allowedLocationTypes](self, "allowedLocationTypes"));
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v37 = v24;
          *(_WORD *)&v37[4] = 2112;
          *(_QWORD *)&v37[6] = v26;
          *(_WORD *)&v37[14] = 2112;
          *(_QWORD *)&v37[16] = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Location type (%d:%@) is NOT in the allowed set (%@); updating state",
            buf,
            0x1Cu);

        }
      }
      v28 = self;
      v29 = 0;
    }
    -[VLFSessionMonitor setState:](v28, "setState:", v29);
  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring", buf, 2u);
    }

  }
}

- (void)_buildAllowedLocationTypes
{
  const char *label;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = 136316418;
        v26 = "-[VLFSessionLocationTypeMonitor _buildAllowedLocationTypes]";
        v27 = 2080;
        v28 = "VLFSessionLocationTypeMonitor.m";
        v29 = 1024;
        v30 = 119;
        v31 = 2080;
        v32 = "dispatch_get_main_queue()";
        v33 = 2080;
        v34 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v35 = 2080;
        v36 = dispatch_queue_get_label(0);
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
          v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v25 = 138412290;
          v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

        }
      }
    }
  }
  v6 = sub_1006BB34C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Generating allowed location types", (uint8_t *)&v25, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeAllowGPS, off_1014B3CA8))
  {
    v9 = sub_1006BB34C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "GPS is allowed", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126E668);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeAllowWiFi, off_1014B3CB8))
  {
    v11 = sub_1006BB34C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "WiFi is allowed", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126E680);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeAllowWiFi2, off_1014B3CC8))
  {
    v13 = sub_1006BB34C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "WiFi2 is allowed", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126E698);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeAllowPipeline, off_1014B3CD8))
  {
    v15 = sub_1006BB34C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Pipeline is allowed", (uint8_t *)&v25, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126E6B0);
  }
  v17 = sub_1006BB34C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = (const char *)v8;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Generated allowed location types: %@", (uint8_t *)&v25, 0xCu);
  }

  v19 = objc_msgSend(v8, "copy");
  -[VLFSessionLocationTypeMonitor setAllowedLocationTypes:](self, "setAllowedLocationTypes:", v19);

}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationTypeMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationTypeMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v32 = v5;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v31 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v30 = v7;
  v8 = -[VLFSessionMonitor state](self, "state");
  v9 = CFSTR("Hide");
  if (v8 == 1)
    v9 = CFSTR("EnablePuck");
  if (v8 == 2)
    v9 = CFSTR("EnablePuckAndBanner");
  v28 = v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationTypeMonitor locationManager](self, "locationManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastLocation"));
  v11 = objc_msgSend(v10, "type");
  if (v11 < 0xF && ((0x5FFFu >> (char)v11) & 1) != 0)
    v12 = *(&off_1011C0468 + (int)v11);
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v11));
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationTypeAllowGPS, off_1014B3CA8))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v15 = MapsConfig_VLFSessionLocationTypeAllowWiFi;
  v14 = off_1014B3CB8;
  v16 = v13;
  if (GEOConfigGetBOOL(v15, v14))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = MapsConfig_VLFSessionLocationTypeAllowWiFi2;
  v19 = off_1014B3CC8;
  v20 = v17;
  if (GEOConfigGetBOOL(v18, v19))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v22 = MapsConfig_VLFSessionLocationTypeAllowPipeline;
  v23 = off_1014B3CD8;
  v24 = v21;
  if (GEOConfigGetBOOL(v22, v23))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, currentLocationType: %@, allowed: GPS: %@, WiFi: %@, WiFi2: %@, Pipeline: %@>"), v33, v32, v31, v30, v28, v12, v16, v20, v24, v25));

  return (NSString *)v26;
}

- (void)locationManager:(id)a3 didUpdateLocation:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136316418;
        v17 = "-[VLFSessionLocationTypeMonitor locationManager:didUpdateLocation:]";
        v18 = 2080;
        v19 = "VLFSessionLocationTypeMonitor.m";
        v20 = 1024;
        v21 = 181;
        v22 = 2080;
        v23 = "dispatch_get_main_queue()";
        v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v26 = 2080;
        v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v16,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v16 = 138412290;
          v17 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v16, 0xCu);

        }
      }
    }
  }
  -[VLFSessionLocationTypeMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v7);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;
  const char *label;
  const char *v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  var1 = a3.var1;
  var0 = a3.var0;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = 136316418;
        v27 = "-[VLFSessionLocationTypeMonitor valueChangedForGEOConfigKey:]";
        v28 = 2080;
        v29 = "VLFSessionLocationTypeMonitor.m";
        v30 = 1024;
        v31 = 190;
        v32 = 2080;
        v33 = "dispatch_get_main_queue()";
        v34 = 2080;
        v35 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v36 = 2080;
        v37 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v26,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v26 = 138412290;
          v27 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

        }
      }
    }
  }
  v9 = var0 == (_DWORD)MapsConfig_VLFSessionLocationTypeAllowGPS && var1 == off_1014B3CA8;
  if (v9
    || (var0 == (_DWORD)MapsConfig_VLFSessionLocationTypeAllowWiFi ? (v10 = var1 == off_1014B3CB8) : (v10 = 0),
        v10
     || (var0 == (_DWORD)MapsConfig_VLFSessionLocationTypeAllowWiFi2 ? (v11 = var1 == off_1014B3CC8) : (v11 = 0),
         v11
      || (var0 == (_DWORD)MapsConfig_VLFSessionLocationTypeAllowPipeline ? (v12 = var1 == off_1014B3CD8) : (v12 = 0), v12))))
  {
    v18 = sub_1006BB34C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Allowed location type geo defaults changed; updating allowed set and current state",
        (uint8_t *)&v26,
        2u);
    }

    -[VLFSessionLocationTypeMonitor _buildAllowedLocationTypes](self, "_buildAllowedLocationTypes");
    v16 = objc_claimAutoreleasedReturnValue(-[VLFSessionLocationTypeMonitor locationManager](self, "locationManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastLocation](v16, "lastLocation"));
    -[VLFSessionLocationTypeMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v20);

    goto LABEL_31;
  }
  v13 = sub_1004318FC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v26 = 136315650;
    v27 = "-[VLFSessionLocationTypeMonitor valueChangedForGEOConfigKey:]";
    v28 = 2080;
    v29 = "VLFSessionLocationTypeMonitor.m";
    v30 = 1024;
    v31 = 201;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v26, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v26 = 138412290;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v26, 0xCu);

    }
LABEL_31:

  }
}

- (VLFLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (NSSet)allowedLocationTypes
{
  return self->_allowedLocationTypes;
}

- (void)setAllowedLocationTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedLocationTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLocationTypes, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
