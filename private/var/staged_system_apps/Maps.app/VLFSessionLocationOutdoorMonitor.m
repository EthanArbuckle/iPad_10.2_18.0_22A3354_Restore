@implementation VLFSessionLocationOutdoorMonitor

- (VLFSessionLocationOutdoorMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionLocationOutdoorMonitor *v8;
  VLFSessionLocationOutdoorMonitor *v9;
  id *p_locationManager;
  MapsRingBuffer *v11;
  id v12;
  id v13;
  MapsRingBuffer *v14;
  MapsRingBuffer *historicalLocations;
  void *v16;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[VLFSessionLocationOutdoorMonitor initWithObserver:locationManager:]";
      v31 = 2080;
      v32 = "VLFSessionLocationOutdoorMonitor.m";
      v33 = 1024;
      v34 = 49;
      v35 = 2080;
      v36 = "observer != nil";
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
        v30 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[VLFSessionLocationOutdoorMonitor initWithObserver:locationManager:]";
      v31 = 2080;
      v32 = "VLFSessionLocationOutdoorMonitor.m";
      v33 = 1024;
      v34 = 50;
      v35 = 2080;
      v36 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v30 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)VLFSessionLocationOutdoorMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v28, "initWithObserver:", v6);
  v9 = v8;
  if (v8)
  {
    p_locationManager = (id *)&v8->_locationManager;
    objc_storeStrong((id *)&v8->_locationManager, a4);
    objc_msgSend(*p_locationManager, "addObserver:", v9);
    v11 = [MapsRingBuffer alloc];
    v12 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](v9, "consecutiveOutdoorCount");
    if (v12 <= (id)-[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](v9, "consecutiveIndoorCount"))
      v13 = -[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](v9, "consecutiveIndoorCount");
    else
      v13 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](v9, "consecutiveOutdoorCount");
    v14 = -[MapsRingBuffer initWithLength:](v11, "initWithLength:", v13);
    historicalLocations = v9->_historicalLocations;
    v9->_historicalLocations = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_locationManager, "lastLocation"));
    -[VLFSessionLocationOutdoorMonitor _updateStateWithLocation:](v9, "_updateStateWithLocation:", v16);

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[VLFLocationManager removeObserver:](self->_locationManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionLocationOutdoorMonitor;
  -[VLFSessionLocationOutdoorMonitor dealloc](&v3, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionLocationOutdoorMonitorEnabled, off_1014B4318);
}

- (double)confidenceThreshold
{
  return GEOConfigGetDouble(MapsConfig_VLFSessionLocationOutdoorMonitorConfidenceThreshold, off_1014B4328);
}

- (unint64_t)consecutiveOutdoorCount
{
  return GEOConfigGetUInteger(MapsConfig_VLFSessionLocationOutdoorMonitorConsecutiveOutdoorCount, off_1014B4338);
}

- (unint64_t)consecutiveIndoorCount
{
  return GEOConfigGetUInteger(MapsConfig_VLFSessionLocationOutdoorMonitorConsecutiveIndoorCount, off_1014B4348);
}

- (BOOL)_satisfiesConsecutiveProbabilitiesForOutdoor:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  NSObject *v18;
  double v19;
  BOOL v20;
  __int16 v22[8];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  if (a3)
    v5 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](self, "consecutiveOutdoorCount");
  else
    v5 = -[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](self, "consecutiveIndoorCount");
  v6 = v5;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationOutdoorMonitor historicalLocations](self, "historicalLocations"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (v3)
        {
          objc_msgSend(v13, "probabilityPositionContextStateOutdoor");
          v15 = v14;
        }
        else
        {
          objc_msgSend(v13, "probabilityPositionContextStateIndoor");
          v15 = v16;
          if (fabs(v16 + 1.0) <= 2.22044605e-16)
          {
            v17 = sub_100842618();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v22[0] = 0;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Got a -1 probability while checking indoor; counting it as 1.0",
                (uint8_t *)v22,
                2u);
            }

            v15 = 1.0;
          }
        }
        -[VLFSessionLocationOutdoorMonitor confidenceThreshold](self, "confidenceThreshold");
        if (v15 >= v19)
          ++v10;
        else
          v10 = 0;
        if (v10 >= v6)
        {
          v20 = 1;
          goto LABEL_23;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
  v20 = 0;
LABEL_23:

  return v20;
}

- (void)_flipState
{
  id v3;
  NSObject *v4;
  int64_t v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  v3 = sub_100842618();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = -[VLFSessionMonitor state](self, "state");
    v6 = CFSTR("Hide");
    if (v5 == 1)
      v6 = CFSTR("EnablePuck");
    if (v5 == 2)
      v6 = CFSTR("EnablePuckAndBanner");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Flipping current state: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VLFSessionMonitor setState:](self, "setState:", 2 * (-[VLFSessionMonitor state](self, "state") == 0));
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  const char *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const char *v18;
  id v19;
  int64_t v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136316418;
        v30 = "-[VLFSessionLocationOutdoorMonitor _updateStateWithLocation:]";
        v31 = 2080;
        v32 = "VLFSessionLocationOutdoorMonitor.m";
        v33 = 1024;
        v34 = 131;
        v35 = 2080;
        v36 = "dispatch_get_main_queue()";
        v37 = 2080;
        v38 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v39 = 2080;
        v40 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v29,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v29 = 138412290;
          v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

        }
      }
    }
  }
  if (!v4)
  {
    v13 = sub_100842618();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v29) = 0;
      v15 = "Got nil location; ignoring";
      v16 = v14;
      v17 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, v15, (uint8_t *)&v29, v17);
    }
LABEL_17:

    goto LABEL_18;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationOutdoorMonitor historicalLocations](self, "historicalLocations"));
  objc_msgSend(v8, "push:", v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationOutdoorMonitor historicalLocations](self, "historicalLocations"));
  v10 = (const char *)objc_msgSend(v9, "count");

  v11 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](self, "consecutiveOutdoorCount");
  if (v11 >= -[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](self, "consecutiveIndoorCount"))
    v12 = -[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](self, "consecutiveIndoorCount");
  else
    v12 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](self, "consecutiveOutdoorCount");
  v18 = (const char *)v12;
  if ((unint64_t)v10 < v12)
  {
    v19 = sub_100842618();
    v14 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v29 = 134218240;
      v30 = v10;
      v31 = 2048;
      v32 = v18;
      v15 = "Still waiting for more location updates; got %lu/%lu";
      v16 = v14;
      v17 = 22;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v20 = -[VLFSessionMonitor state](self, "state");
  if (-[VLFSessionLocationOutdoorMonitor _satisfiesConsecutiveProbabilitiesForOutdoor:](self, "_satisfiesConsecutiveProbabilitiesForOutdoor:", v20 == 0))
  {
    v21 = sub_100842618();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("indoor");
      if (!v20)
        v23 = CFSTR("outdoor");
      v29 = 138412290;
      v30 = (const char *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Current location history satisfies requirements for %@; flipping state",
        (uint8_t *)&v29,
        0xCu);
    }

    -[VLFSessionLocationOutdoorMonitor _flipState](self, "_flipState");
  }
LABEL_18:

}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationOutdoorMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionLocationOutdoorMonitorAffectsBannerVisibilityKey"));

  return v3;
}

- (NSString)debugDescription
{
  objc_class *v3;
  NSString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend((id)objc_opt_class(self), "isEnabled"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  if (objc_msgSend((id)objc_opt_class(self), "affectsPuckVisibility"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v8 = v7;
  if (objc_msgSend((id)objc_opt_class(self), "affectsBannerVisibility"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  v11 = -[VLFSessionMonitor state](self, "state");
  v12 = CFSTR("Hide");
  if (v11 == 1)
    v12 = CFSTR("EnablePuck");
  if (v11 == 2)
    v13 = CFSTR("EnablePuckAndBanner");
  else
    v13 = v12;
  -[VLFSessionLocationOutdoorMonitor confidenceThreshold](self, "confidenceThreshold");
  v15 = v14;
  v16 = -[VLFSessionLocationOutdoorMonitor consecutiveOutdoorCount](self, "consecutiveOutdoorCount");
  v17 = -[VLFSessionLocationOutdoorMonitor consecutiveIndoorCount](self, "consecutiveIndoorCount");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionLocationOutdoorMonitor historicalLocations](self, "historicalLocations"));
  v19 = sub_10039DCD4(v18, &stru_1011D8E48);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "reverseObjectEnumerator"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@\nisEnabled: %@,\naffectsPuckVisibility: %@,\naffectsBannerVisibility: %@,\ncurrentState: %@,\nthreshold: %f,\noutdoor consecutive: %lu,\nindoor consecutive: %lu,\nlocations: %@>"), v25, v6, v8, v10, v13, v15, v16, v17, v22));

  return (NSString *)v23;
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
        v17 = "-[VLFSessionLocationOutdoorMonitor locationManager:didUpdateLocation:]";
        v18 = 2080;
        v19 = "VLFSessionLocationOutdoorMonitor.m";
        v20 = 1024;
        v21 = 187;
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
  -[VLFSessionLocationOutdoorMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v7);

}

- (VLFLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (MapsRingBuffer)historicalLocations
{
  return self->_historicalLocations;
}

- (void)setHistoricalLocations:(id)a3
{
  objc_storeStrong((id *)&self->_historicalLocations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalLocations, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
