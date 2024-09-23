@implementation VLFSessionLocationSignalEnvironmentMonitor

- (VLFSessionLocationSignalEnvironmentMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionLocationSignalEnvironmentMonitor *v8;
  VLFSessionLocationSignalEnvironmentMonitor *v9;
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
      v25 = "-[VLFSessionLocationSignalEnvironmentMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationSignalEnvironmentMonitor.m";
      v28 = 1024;
      v29 = 46;
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
      v25 = "-[VLFSessionLocationSignalEnvironmentMonitor initWithObserver:locationManager:]";
      v26 = 2080;
      v27 = "VLFSessionLocationSignalEnvironmentMonitor.m";
      v28 = 1024;
      v29 = 47;
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
  v23.super_class = (Class)VLFSessionLocationSignalEnvironmentMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v23, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    objc_msgSend(*p_locationManager, "addObserver:", v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationSignalEnvironmentAllowRural, off_1014B3F48, &_dispatch_main_q, v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationSignalEnvironmentAllowUrban, off_1014B3F58, &_dispatch_main_q, v9);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrban, off_1014B3F68, &_dispatch_main_q, v9);
    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrbanCanyon, off_1014B3F78, &_dispatch_main_q, v9);

    _GEOConfigAddDelegateListenerForKey(MapsConfig_VLFSessionLocationSignalEnvironmentAllowFoliage, off_1014B3F88, &_dispatch_main_q, v9);
    -[VLFSessionLocationSignalEnvironmentMonitor _buildAllowedLocationSignalEnvironments](v9, "_buildAllowedLocationSignalEnvironments");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_locationManager, "lastLocation"));
    -[VLFSessionLocationSignalEnvironmentMonitor _updateStateWithLocation:](v9, "_updateStateWithLocation:", v11);

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
  v4.super_class = (Class)VLFSessionLocationSignalEnvironmentMonitor;
  -[VLFSessionLocationSignalEnvironmentMonitor dealloc](&v4, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentMonitorEnabled, off_1014B3F38);
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
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  int64_t v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  unsigned int v20;
  const __CFString *v21;
  id v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  const __CFString *v26;
  void *v27;
  VLFSessionLocationSignalEnvironmentMonitor *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  void *v35;
  int v36;
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
        v36 = 136316418;
        *(_QWORD *)v37 = "-[VLFSessionLocationSignalEnvironmentMonitor _updateStateWithLocation:]";
        *(_WORD *)&v37[8] = 2080;
        *(_QWORD *)&v37[10] = "VLFSessionLocationSignalEnvironmentMonitor.m";
        *(_WORD *)&v37[18] = 1024;
        *(_DWORD *)&v37[20] = 85;
        v38 = 2080;
        v39 = "dispatch_get_main_queue()";
        v40 = 2080;
        v41 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v42 = 2080;
        v43 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v36,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v33 = sub_1004318FC();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v36 = 138412290;
          *(_QWORD *)v37 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v36, 0xCu);

        }
      }
    }
  }
  v8 = sub_1002B9EE4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v10)
    {
      v11 = objc_msgSend(v4, "signalEnvironmentType") - 1;
      if (v11 > 5)
        v12 = CFSTR("Unavailable");
      else
        v12 = off_1011AFC88[v11];
      v36 = 138412290;
      *(_QWORD *)v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Got location with signal environment: %@", (uint8_t *)&v36, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationSignalEnvironmentMonitor allowedLocationSignalEnvironments](self, "allowedLocationSignalEnvironments"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "signalEnvironmentType")));
    v15 = objc_msgSend(v13, "containsObject:", v14);

    v16 = -[VLFSessionMonitor state](self, "state");
    if (v15)
    {
      if (v16 != 2)
      {
        v17 = sub_1002B9EE4();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = objc_msgSend(v4, "signalEnvironmentType");
          v20 = objc_msgSend(v4, "signalEnvironmentType") - 1;
          if (v20 > 5)
            v21 = CFSTR("Unavailable");
          else
            v21 = off_1011AFC88[v20];
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationSignalEnvironmentMonitor allowedLocationSignalEnvironments](self, "allowedLocationSignalEnvironments"));
          v36 = 67109634;
          *(_DWORD *)v37 = v19;
          *(_WORD *)&v37[4] = 2112;
          *(_QWORD *)&v37[6] = v21;
          *(_WORD *)&v37[14] = 2112;
          *(_QWORD *)&v37[16] = v30;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Location signal environment (%d:%@) is in the allowed set (%@); updating state",
            (uint8_t *)&v36,
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
        v22 = sub_1002B9EE4();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v4, "signalEnvironmentType");
          v25 = objc_msgSend(v4, "signalEnvironmentType") - 1;
          if (v25 > 5)
            v26 = CFSTR("Unavailable");
          else
            v26 = off_1011AFC88[v25];
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationSignalEnvironmentMonitor allowedLocationSignalEnvironments](self, "allowedLocationSignalEnvironments"));
          v36 = 67109634;
          *(_DWORD *)v37 = v24;
          *(_WORD *)&v37[4] = 2112;
          *(_QWORD *)&v37[6] = v26;
          *(_WORD *)&v37[14] = 2112;
          *(_QWORD *)&v37[16] = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Location signal environment (%d:%@) is NOT in the allowed set (%@); updating state",
            (uint8_t *)&v36,
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
      LOWORD(v36) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring",
        (uint8_t *)&v36,
        2u);
    }

  }
}

- (void)_buildAllowedLocationSignalEnvironments
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
  NSObject *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;

  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v27 = 136316418;
        v28 = "-[VLFSessionLocationSignalEnvironmentMonitor _buildAllowedLocationSignalEnvironments]";
        v29 = 2080;
        v30 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        v31 = 1024;
        v32 = 111;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v27,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v24 = sub_1004318FC();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v27 = 138412290;
          v28 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

        }
      }
    }
  }
  v6 = sub_1002B9EE4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Generating allowed location signal environments", (uint8_t *)&v27, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowRural, off_1014B3F48))
  {
    v9 = sub_1002B9EE4();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Rural is allowed", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126C988);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowUrban, off_1014B3F58))
  {
    v11 = sub_1002B9EE4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Urban is allowed", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126C9A0);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrban, off_1014B3F68))
  {
    v13 = sub_1002B9EE4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Dense Urban is allowed", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126C9B8);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrbanCanyon, off_1014B3F78))
  {
    v15 = sub_1002B9EE4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Dense Urban Canyon is allowed", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126C9D0);
  }
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowFoliage, off_1014B3F88))
  {
    v17 = sub_1002B9EE4();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Foliage is allowed", (uint8_t *)&v27, 2u);
    }

    objc_msgSend(v8, "addObject:", &off_10126C9E8);
  }
  v19 = sub_1002B9EE4();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    v28 = (const char *)v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Generated allowed location signal environments: %@", (uint8_t *)&v27, 0xCu);
  }

  v21 = objc_msgSend(v8, "copy");
  -[VLFSessionLocationSignalEnvironmentMonitor setAllowedLocationSignalEnvironments:](self, "setAllowedLocationSignalEnvironments:", v21);

}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationSignalEnvironmentMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationSignalEnvironmentMonitorAffectsBannerVisibilityKey"));

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
  unsigned int v11;
  const __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v36 = v5;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v35 = v6;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v34 = v7;
  v8 = -[VLFSessionMonitor state](self, "state");
  v9 = CFSTR("Hide");
  if (v8 == 1)
    v9 = CFSTR("EnablePuck");
  if (v8 == 2)
    v9 = CFSTR("EnablePuckAndBanner");
  v32 = v9;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationSignalEnvironmentMonitor locationManager](self, "locationManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastLocation"));
  v11 = objc_msgSend(v10, "signalEnvironmentType") - 1;
  if (v11 > 5)
    v12 = CFSTR("Unavailable");
  else
    v12 = off_1011AFC88[v11];
  if (GEOConfigGetBOOL(MapsConfig_VLFSessionLocationSignalEnvironmentAllowRural, off_1014B3F48))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  v14 = MapsConfig_VLFSessionLocationSignalEnvironmentAllowUrban;
  v15 = off_1014B3F58;
  v16 = v13;
  if (GEOConfigGetBOOL(v14, v15))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v19 = MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrban;
  v18 = off_1014B3F68;
  v20 = v17;
  if (GEOConfigGetBOOL(v19, v18))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  v22 = MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrbanCanyon;
  v23 = off_1014B3F78;
  v24 = v21;
  if (GEOConfigGetBOOL(v22, v23))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v26 = MapsConfig_VLFSessionLocationSignalEnvironmentAllowFoliage;
  v27 = off_1014B3F88;
  v28 = v25;
  if (GEOConfigGetBOOL(v26, v27))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\ncurrentEnvironmentSignal: %@,\nRural: %@,\nUrban: %@,\nDenseUrban: %@,\nDenseUrbanCanyon: %@,\nFoliage: %@>"), v37, v36, v35, v34, v32, v12, v16, v20, v24, v28, v29));

  return (NSString *)v30;
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
        v17 = "-[VLFSessionLocationSignalEnvironmentMonitor locationManager:didUpdateLocation:]";
        v18 = 2080;
        v19 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        v20 = 1024;
        v21 = 179;
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
  -[VLFSessionLocationSignalEnvironmentMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v7);

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
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  char *v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;

  var1 = a3.var1;
  var0 = a3.var0;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label != v7)
  {
    v8 = !label || v7 == 0;
    if (v8 || strcmp(label, v7))
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v27 = 136316418;
        v28 = "-[VLFSessionLocationSignalEnvironmentMonitor valueChangedForGEOConfigKey:]";
        v29 = 2080;
        v30 = "VLFSessionLocationSignalEnvironmentMonitor.m";
        v31 = 1024;
        v32 = 188;
        v33 = 2080;
        v34 = "dispatch_get_main_queue()";
        v35 = 2080;
        v36 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v37 = 2080;
        v38 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v27,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v24 = sub_1004318FC();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v27 = 138412290;
          v28 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

        }
      }
    }
  }
  v9 = var0 == (_DWORD)MapsConfig_VLFSessionLocationSignalEnvironmentAllowRural && var1 == off_1014B3F48;
  if (v9
    || (var0 == (_DWORD)MapsConfig_VLFSessionLocationSignalEnvironmentAllowUrban
      ? (v10 = var1 == off_1014B3F58)
      : (v10 = 0),
        v10
     || (var0 == (_DWORD)MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrban
       ? (v11 = var1 == off_1014B3F68)
       : (v11 = 0),
         v11
      || (var0 == (_DWORD)MapsConfig_VLFSessionLocationSignalEnvironmentAllowDenseUrbanCanyon
        ? (v12 = var1 == off_1014B3F78)
        : (v12 = 0),
          v12
       || (var0 == (_DWORD)MapsConfig_VLFSessionLocationSignalEnvironmentAllowFoliage
         ? (v13 = var1 == off_1014B3F88)
         : (v13 = 0),
           v13)))))
  {
    v19 = sub_1002B9EE4();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Allowed location signal environments geo defaults changed; updating allowed set and current state",
        (uint8_t *)&v27,
        2u);
    }

    -[VLFSessionLocationSignalEnvironmentMonitor _buildAllowedLocationSignalEnvironments](self, "_buildAllowedLocationSignalEnvironments");
    v17 = objc_claimAutoreleasedReturnValue(-[VLFSessionLocationSignalEnvironmentMonitor locationManager](self, "locationManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastLocation](v17, "lastLocation"));
    -[VLFSessionLocationSignalEnvironmentMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v21);

    goto LABEL_35;
  }
  v14 = sub_1004318FC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v27 = 136315650;
    v28 = "-[VLFSessionLocationSignalEnvironmentMonitor valueChangedForGEOConfigKey:]";
    v29 = 2080;
    v30 = "VLFSessionLocationSignalEnvironmentMonitor.m";
    v31 = 1024;
    v32 = 200;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v27, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v27 = 138412290;
      v28 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v27, 0xCu);

    }
LABEL_35:

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

- (NSSet)allowedLocationSignalEnvironments
{
  return self->_allowedLocationSignalEnvironments;
}

- (void)setAllowedLocationSignalEnvironments:(id)a3
{
  objc_storeStrong((id *)&self->_allowedLocationSignalEnvironments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedLocationSignalEnvironments, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
