@implementation MapsAstronomicalConditionMonitor

- (MapsAstronomicalConditionMonitor)init
{
  char *v2;
  GEOAlmanac *v3;
  void *v4;
  GEOAlmanac *v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MapsAstronomicalConditionMonitor;
  v2 = -[MapsBaseLightMonitor init](&v12, "init");
  if (v2)
  {
    v3 = objc_opt_new(GEOAlmanac);
    v4 = *(void **)(v2 + 17);
    *(_QWORD *)(v2 + 17) = v3;

    v5 = objc_opt_new(GEOAlmanac);
    v6 = *(void **)(v2 + 25);
    *(_QWORD *)(v2 + 25) = v5;

    *(_QWORD *)(v2 + 49) = 0;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.Maps.AstronomicalConditionMonitor.compute", v8);
    v10 = *(void **)(v2 + 33);
    *(_QWORD *)(v2 + 33) = v9;

  }
  return (MapsAstronomicalConditionMonitor *)v2;
}

- (void)setCurrentLocation:(id)a3
{
  id v5;
  void *v6;
  void **v7;
  id v8;
  double v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = v5;
  v7 = (void **)((char *)&self->_astronomicalCondition + 1);
  v8 = *(id *)((char *)&self->_astronomicalCondition + 1);
  if (v8 != v5)
  {
    if (v5)
    {
      if (!v8)
      {
        v16 = sub_1004317AC();
        v11 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v17 = 138412290;
          v18 = v6;
          v13 = "Calculating condition with first currrentLocation: %@";
          v14 = v11;
          v15 = 12;
          goto LABEL_10;
        }
LABEL_11:

        objc_storeStrong((id *)((char *)&self->_astronomicalCondition + 1), a3);
        -[MapsAstronomicalConditionMonitor computeAstronomicalConditionForTime:currentLocation:](self, "computeAstronomicalConditionForTime:currentLocation:", v6, CFAbsoluteTimeGetCurrent());
        goto LABEL_12;
      }
      objc_msgSend(v5, "distanceFromLocation:");
      if (v9 > 3000.0)
      {
        v10 = sub_1004317AC();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = *v7;
          v17 = 138412546;
          v18 = v12;
          v19 = 2112;
          v20 = v6;
          v13 = "currentLocation moved significantly from %@ to %@";
          v14 = v11;
          v15 = 22;
LABEL_10:
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v17, v15);
          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    else
    {
      *v7 = 0;

    }
  }
LABEL_12:

}

- (void)_setMonitoring:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v5 = -[MapsBaseLightMonitor _isMonitoring](self, "_isMonitoring");
  v12.receiver = self;
  v12.super_class = (Class)MapsAstronomicalConditionMonitor;
  -[MapsBaseLightMonitor _setMonitoring:](&v12, "_setMonitoring:", v3);
  if (v5 != v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v7 = v6;
    if (v3)
    {
      objc_msgSend(v6, "listenForLocationUpdates:", self);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "timeDidChangeSignificantly", UIApplicationSignificantTimeChangeNotification, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastLocation"));
      -[MapsAstronomicalConditionMonitor setCurrentLocation:](self, "setCurrentLocation:", v10);

      -[MapsAstronomicalConditionMonitor scheduleTimeCheck](self, "scheduleTimeCheck");
    }
    else
    {
      objc_msgSend(v6, "stopListeningForLocationUpdates:", self);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v11, "removeObserver:name:object:", self, UIApplicationSignificantTimeChangeNotification, 0);

      -[MapsAstronomicalConditionMonitor setCurrentLocation:](self, "setCurrentLocation:", 0);
      -[MapsAstronomicalConditionMonitor setTimeCheckTimer:](self, "setTimeCheckTimer:", 0);
      -[MapsAstronomicalConditionMonitor setAstronomicalCondition:](self, "setAstronomicalCondition:", 0);
    }
  }
}

- (int64_t)astronomicalCondition
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  uint8_t buf[4];
  __CFString *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("MapsDebugAstronomicalLightLevelKey")));

  if ((objc_opt_respondsToSelector(v4, "integerValue") & 1) != 0)
  {
    v5 = (unint64_t)objc_msgSend(v4, "integerValue");
    v6 = sub_1004317AC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 4)
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), v5));
      else
        v8 = off_1011DBC68[v5];
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using override astronomical condition: %@", buf, 0xCu);

    }
  }
  else
  {
    v5 = *(_QWORD *)(&self->_isBeforeSolarTransit + 1);
  }

  return v5;
}

- (void)setAstronomicalCondition:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint8_t buf[4];
  __CFString *v12;
  __int16 v13;
  __CFString *v14;

  if (*(_QWORD *)(&self->_isBeforeSolarTransit + 1) != a3)
  {
    v5 = sub_1004317AC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(&self->_isBeforeSolarTransit + 1);
      if (v7 >= 4)
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), *(_QWORD *)(&self->_isBeforeSolarTransit + 1)));
      else
        v8 = off_1011DBC68[v7];
      v9 = v8;
      if ((unint64_t)a3 >= 4)
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Unknown: %ld>"), a3));
      else
        v10 = off_1011DBC68[a3];
      *(_DWORD *)buf = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changing condition from %@ to %@", buf, 0x16u);

    }
    *(_QWORD *)(&self->_isBeforeSolarTransit + 1) = a3;
    -[MapsBaseLightMonitor _notifyDidChange](self, "_notifyDidChange");
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastLocation"));
  -[MapsAstronomicalConditionMonitor setCurrentLocation:](self, "setCurrentLocation:", v4);

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)scheduleTimeCheck
{
  id v3;
  void *v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = &_dispatch_main_q;
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_10090BC10;
  v8 = &unk_1011AE190;
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, &v5, 300.0));
  -[MapsAstronomicalConditionMonitor setTimeCheckTimer:](self, "setTimeCheckTimer:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)timeDidChangeSignificantly
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAstronomicalConditionMonitor currentLocation](self, "currentLocation"));
  if (v3)
  {
    -[MapsAstronomicalConditionMonitor computeAstronomicalConditionForTime:currentLocation:](self, "computeAstronomicalConditionForTime:currentLocation:", v3, CFAbsoluteTimeGetCurrent());
  }
  else
  {
    v4 = sub_1004317AC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "-timeDidChangeSignificantly cannot compute astronomical condition without a current location", v6, 2u);
    }

  }
}

- (void)computeAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = *(NSObject **)((char *)&self->_twilightAlmanac + 1);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10090BDA8;
  v9[3] = &unk_1011B9268;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

- (int64_t)_computeOnQueueAstronomicalConditionForTime:(double)a3 currentLocation:(id)a4 isBeforeSolarTransit:(BOOL *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *i;
  void *v27;
  double v28;
  double v29;
  id v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int64_t v38;
  uint64_t v40;
  _BOOL4 v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  _BOOL4 v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];

  v42 = a4;
  objc_msgSend(v42, "coordinate");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(&self->super._monitoring + 1), "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", v8, v10, a3, GEOConfigGetDouble(MapsConfig_NightModeDayTwilightBoundaryInDegrees, off_1014B3658));
  objc_msgSend(*(id *)((char *)&self->_daylightAlmanac + 1), "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", v9, v11, a3, GEOConfigGetDouble(MapsConfig_NightModeTwilightNightBoundaryInDegrees, off_1014B3668));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
  v13 = objc_opt_new(NSMutableArray);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "previousTransit"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "previousTransit"));
    -[NSMutableArray addObject:](v13, "addObject:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "transit"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "transit"));
    -[NSMutableArray addObject:](v13, "addObject:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "nextTransit"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "nextTransit"));
    -[NSMutableArray addObject:](v13, "addObject:", v19);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v20 = v13;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v44;
    v25 = 1.79769313e308;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v27, "timeIntervalSinceDate:", v12);
        v29 = fabs(v28);
        if (v29 < v25)
        {
          v30 = v27;

          v25 = v29;
          v23 = v30;
        }
      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v43, v63, 16);
    }
    while (v22);

    if (v23)
    {
      v31 = objc_msgSend(v12, "compare:", v23) == (id)-1;
      goto LABEL_20;
    }
  }
  else
  {

    v23 = 0;
  }
  v31 = 0;
LABEL_20:
  *a5 = v31;
  v32 = sub_1004317AC();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v34 = *(void **)(&self->super._monitoring + 1);
    v40 = *(uint64_t *)((char *)&self->_daylightAlmanac + 1);
    v41 = *a5;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "previousTransit"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "transit"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->super._monitoring + 1), "nextTransit"));
    *(_DWORD *)buf = 138414082;
    v48 = v42;
    v49 = 2112;
    v50 = v12;
    v51 = 2112;
    v52 = v34;
    v53 = 2112;
    v54 = v40;
    v55 = 1024;
    v56 = v41;
    v57 = 2112;
    v58 = v35;
    v59 = 2112;
    v60 = v36;
    v61 = 2112;
    v62 = v37;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "computeAstronomicalCondition updated conditions for %@ at %@; daylightAlmanac: %@ twilightAlamanac: %@; isBeforeSo"
      "larTransit: %d; transits: %@ %@ %@",
      buf,
      0x4Eu);

  }
  if ((objc_msgSend(*(id *)(&self->super._monitoring + 1), "isDayLightForTime:", a3) & 1) != 0)
  {
    v38 = 3;
  }
  else if (objc_msgSend(*(id *)((char *)&self->_daylightAlmanac + 1), "isDayLightForTime:", a3))
  {
    v38 = 2;
  }
  else
  {
    v38 = 1;
  }

  return v38;
}

- (BOOL)isBeforeSolarTransit
{
  return BYTE1(self->_computeQueue);
}

- (CLLocation)currentLocation
{
  return *(CLLocation **)((char *)&self->_astronomicalCondition + 1);
}

- (GCDTimer)timeCheckTimer
{
  return *(GCDTimer **)((char *)&self->_currentLocation + 1);
}

- (void)setTimeCheckTimer:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_currentLocation + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_currentLocation + 1), 0);
  objc_storeStrong((id *)((char *)&self->_astronomicalCondition + 1), 0);
  objc_storeStrong((id *)((char *)&self->_twilightAlmanac + 1), 0);
  objc_storeStrong((id *)((char *)&self->_daylightAlmanac + 1), 0);
  objc_storeStrong((id *)(&self->super._monitoring + 1), 0);
}

@end
