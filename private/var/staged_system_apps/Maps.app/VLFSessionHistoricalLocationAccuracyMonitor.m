@implementation VLFSessionHistoricalLocationAccuracyMonitor

- (VLFSessionHistoricalLocationAccuracyMonitor)initWithObserver:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  VLFSessionHistoricalLocationAccuracyMonitor *v8;
  MapsRingBuffer *v9;
  MapsRingBuffer *v10;
  MapsRingBuffer *historicalLocationAccuracies;
  void *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFSessionHistoricalLocationAccuracyMonitor initWithObserver:locationManager:]";
      v27 = 2080;
      v28 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
      v29 = 1024;
      v30 = 37;
      v31 = 2080;
      v32 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[VLFSessionHistoricalLocationAccuracyMonitor initWithObserver:locationManager:]";
      v27 = 2080;
      v28 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
      v29 = 1024;
      v30 = 38;
      v31 = 2080;
      v32 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v26 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)VLFSessionHistoricalLocationAccuracyMonitor;
  v8 = -[VLFSessionMonitor initWithObserver:](&v24, "initWithObserver:", v6);
  if (v8)
  {
    v9 = [MapsRingBuffer alloc];
    v10 = -[MapsRingBuffer initWithLength:](v9, "initWithLength:", GEOConfigGetUInteger(MapsConfig_VLFSessionEligibleLocationUpdateWindowSize, off_1014B3D98));
    historicalLocationAccuracies = v8->_historicalLocationAccuracies;
    v8->_historicalLocationAccuracies = v10;

    objc_storeStrong((id *)&v8->_locationManager, a4);
    -[MKLocationManager listenForLocationUpdates:](v8->_locationManager, "listenForLocationUpdates:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v12, "addObserver:selector:name:object:", v8, "applicationDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[MKLocationManager stopListeningForLocationUpdates:](self->_locationManager, "stopListeningForLocationUpdates:", self);
  v3.receiver = self;
  v3.super_class = (Class)VLFSessionHistoricalLocationAccuracyMonitor;
  -[VLFSessionHistoricalLocationAccuracyMonitor dealloc](&v3, "dealloc");
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL(MapsConfig_VLFSessionHistoricalLocationAccuracyMonitorEnabled, off_1014B3D88);
}

- (void)_updateStateWithLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double Double;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  double v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  double v38;
  __int16 v39;
  double v40;

  v4 = a3;
  v5 = sub_100419530();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (!v4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got nil location; ignoring", buf, 2u);
    }
    goto LABEL_23;
  }
  if (v7)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    *(_DWORD *)buf = 134283521;
    v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Got location with horizontal accuracy: %{private}f", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  objc_msgSend(v4, "horizontalAccuracy");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "push:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  v12 = objc_msgSend(v11, "count");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  v14 = objc_msgSend(v13, "length");

  if (v12 < v14)
  {
    v15 = sub_100419530();
    v6 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
      v17 = COERCE_DOUBLE(objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
      v19 = COERCE_DOUBLE(objc_msgSend(v18, "length"));
      *(_DWORD *)buf = 134218240;
      v38 = v17;
      v39 = 2048;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Still waiting for more location updates; got %lu/%lu",
        buf,
        0x16u);

    }
LABEL_23:

    goto LABEL_24;
  }
  Double = GEOConfigGetDouble(MapKitConfig_UserLocation_MinAccuracyUncertainty[0], MapKitConfig_UserLocation_MinAccuracyUncertainty[1]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies", 0));
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v6);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v25, "doubleValue");
        if (v26 < Double)
        {
          v29 = sub_100419530();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "doubleValue");
            *(_DWORD *)buf = 134283777;
            v38 = v31;
            v39 = 2049;
            v40 = Double;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Found a historical location with less than the minimum required horizontal accuracy (%{private}f)|(%{private}f)", buf, 0x16u);
          }

          -[VLFSessionMonitor setState:](self, "setState:", 0);
          goto LABEL_23;
        }
      }
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v22)
        continue;
      break;
    }
  }

  v27 = sub_100419530();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283521;
    v38 = Double;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "All historical locations satisfy the minimum required horizontal accuracy (%{private}f)", buf, 0xCu);
  }

  -[VLFSessionMonitor setState:](self, "setState:", 2);
LABEL_24:

}

+ (BOOL)affectsPuckVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionHistoricalLocationAccuracyMonitorAffectsPuckVisibilityKey"));

  return v3;
}

+ (BOOL)affectsBannerVisibility
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VLFSessionHistoricalLocationAccuracyMonitorAffectsBannerVisibilityKey"));

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
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v4);
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
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  v15 = objc_msgSend(v14, "count");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  v17 = objc_msgSend(v16, "length");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "debugDescription"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: isEnabled: %@, affectsPuckVisibility: %@, affectsBannerVisibility: %@, currentState: %@, historicalLocationAccuraciesCount: %lu, historicalLocationAccuraciesRequired: %lu, historicalLocationAccuracies: %@>"), v22, v6, v8, v10, v13, v15, v17, v19));

  return (NSString *)v20;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
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

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[VLFSessionHistoricalLocationAccuracyMonitor locationManagerUpdatedLocation:]";
        v16 = 2080;
        v17 = "VLFSessionHistoricalLocationAccuracyMonitor.m";
        v18 = 1024;
        v19 = 126;
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
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  -[VLFSessionHistoricalLocationAccuracyMonitor _updateStateWithLocation:](self, "_updateStateWithLocation:", v8);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_100419530();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "App backgrounded; clearing historical locations",
      v7,
      2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VLFSessionHistoricalLocationAccuracyMonitor historicalLocationAccuracies](self, "historicalLocationAccuracies"));
  objc_msgSend(v6, "removeAllObjects");

  -[VLFSessionMonitor setState:](self, "setState:", 0);
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (MapsRingBuffer)historicalLocationAccuracies
{
  return self->_historicalLocationAccuracies;
}

- (void)setHistoricalLocationAccuracies:(id)a3
{
  objc_storeStrong((id *)&self->_historicalLocationAccuracies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalLocationAccuracies, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
