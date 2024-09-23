@implementation CarRouteGeniusManager

- (CarRouteGeniusManager)init
{
  CarRouteGeniusManager *v2;
  void *v3;
  void *v4;
  CarRouteGeniusVehicleBatteryMonitor *v5;
  void *v6;
  void *v7;
  CarRouteGeniusVehicleBatteryMonitor *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CarRouteGeniusManager;
  v2 = -[CarRouteGeniusManager init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    -[CarRouteGeniusManager setActiveChromes:](v2, "setActiveChromes:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    -[CarRouteGeniusManager setPreciseLocationEnabled:](v2, "setPreciseLocationEnabled:", objc_msgSend(v4, "isAuthorizedForPreciseLocation"));

    if (IsEVRoutingSupported())
    {
      v5 = [CarRouteGeniusVehicleBatteryMonitor alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
      v8 = -[CarRouteGeniusVehicleBatteryMonitor initWithRouteGeniusService:virtualGarageService:callbackQueue:](v5, "initWithRouteGeniusService:virtualGarageService:callbackQueue:", v6, v7, &_dispatch_main_q);
      -[CarRouteGeniusManager setVehicleMonitor:](v2, "setVehicleMonitor:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager vehicleMonitor](v2, "vehicleMonitor"));
      objc_msgSend(v9, "setDelegate:", v2);

    }
  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[16];

  if (self->_active)
  {
    v3 = sub_1004336BC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "dealloc of CarRGManager: stopping RG service", buf, 2u);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    objc_msgSend(v5, "stop");

  }
  v6.receiver = self;
  v6.super_class = (Class)CarRouteGeniusManager;
  -[CarRouteGeniusManager dealloc](&v6, "dealloc");
}

- (void)activateIfPossibleForChrome:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  unint64_t v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char isKindOfClass;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  __CFString *v32;
  id v33;
  char *v34;
  id v35;
  const char *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  char *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  const char *v63;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v53 = "-[CarRouteGeniusManager activateIfPossibleForChrome:]";
        v54 = 2080;
        v55 = "CarRouteGeniusManager.m";
        v56 = 1024;
        v57 = 70;
        v58 = 2080;
        v59 = "dispatch_get_main_queue()";
        v60 = 2080;
        v61 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v62 = 2080;
        v63 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v49 = sub_1004318FC();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v53 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = v4;
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___CarSceneTyping))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_msgSend(v10, "sceneType");
  v12 = (unint64_t)v11 >= 4;
  v13 = (unint64_t)v11 - 4;
  if (!v12)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    v18 = objc_msgSend(v17, "currentCountrySupportsRouteGenius");

    if ((v18 & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v20 = objc_msgSend(v19, "state");

      if (!v8 || (unint64_t)v20 >= 2)
      {
        v35 = sub_1004336BC();
        v15 = objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          goto LABEL_40;
        v28 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v36 = (const char *)-[NSObject state](v28, "state");
        *(_DWORD *)buf = 134217984;
        v53 = v36;
        v37 = "activateIfPossibleForChrome: not activating RGManager because MNNavigationService is in state=%lu";
        v38 = v15;
        v39 = 12;
        goto LABEL_38;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "platformController"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sessionStack](v15, "sessionStack"));
      if (objc_msgSend(v22, "count"))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sessionStack](v15, "sessionStack"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
        v25 = objc_opt_class(RouteGeniusSession);
        isKindOfClass = objc_opt_isKindOfClass(v24, v25);

        if ((isKindOfClass & 1) == 0)
        {
          v27 = sub_1004336BC();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = (id)objc_claimAutoreleasedReturnValue(-[NSObject sessionStack](v15, "sessionStack"));
            v30 = v29;
            if (v29)
            {
              if (objc_msgSend(v29, "count"))
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", ")));
                v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v30, v31));

              }
              else
              {
                v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v30));
              }
            }
            else
            {
              v32 = CFSTR("<nil>");
            }

            *(_DWORD *)buf = 138412290;
            v53 = (const char *)v32;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager because the current platform sessionStack is not empty. sessionStack: %@", buf, 0xCu);

          }
          goto LABEL_39;
        }
      }
      else
      {

      }
      v40 = sub_1004336BC();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        v42 = objc_opt_class(v8);
        *(_DWORD *)buf = 138412546;
        v53 = (const char *)v42;
        v54 = 2048;
        v55 = (const char *)v8;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: adding new active chrome: <%@: %p>", buf, 0x16u);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager activeChromes](self, "activeChromes"));
      objc_msgSend(v43, "addObject:", v8);

      if (-[CarRouteGeniusManager isPreciseLocationEnabled](self, "isPreciseLocationEnabled"))
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager activeChromes](self, "activeChromes"));
        v45 = objc_msgSend(v44, "count");

        if (v45)
          -[CarRouteGeniusManager setActive:](self, "setActive:", 1);
        goto LABEL_40;
      }
      v46 = sub_1004336BC();
      v28 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v37 = "activateIfPossibleForChrome: precise location is not enabled. Will not activate RG manager.";
        v38 = v28;
        v39 = 2;
LABEL_38:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, v37, buf, v39);
      }
    }
    else
    {
      v33 = sub_1004336BC();
      v15 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        goto LABEL_40;
      v28 = objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
      v34 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject countryCode](v28, "countryCode"));
      *(_DWORD *)buf = 138412290;
      v53 = v34;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager because we're in a country (%@) that does not support RG.", buf, 0xCu);

    }
LABEL_39:

    goto LABEL_40;
  }
  v14 = sub_10043364C();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    if (v13 > 3)
      v16 = CFSTR(".Unknown");
    else
      v16 = off_1011DBAF0[v13];
    *(_DWORD *)buf = 134218242;
    v53 = (const char *)v8;
    v54 = 2112;
    v55 = (const char *)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "activateIfPossibleForChrome: not activating RGManager for chrome: %p because it is not a supported sceneType: %@", buf, 0x16u);
  }
LABEL_40:

}

- (void)deactivateForChrome:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  id v8;
  id v9;
  _QWORD *v10;
  const char *v11;
  const char *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  CarRouteGeniusManager *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v25 = "-[CarRouteGeniusManager deactivateForChrome:]";
        v26 = 2080;
        v27 = "CarRouteGeniusManager.m";
        v28 = 1024;
        v29 = 109;
        v30 = 2080;
        v31 = "dispatch_get_main_queue()";
        v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v20 = sub_1009078CC;
  v21 = &unk_1011AC8B0;
  v8 = v4;
  v22 = v8;
  v23 = self;
  v9 = &_dispatch_main_q;
  v10 = v19;
  v11 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v12 = dispatch_queue_get_label(0);
  if (v11 == v12 || v11 && v12 && !strcmp(v11, v12))
  {
    v13 = objc_autoreleasePoolPush();
    v20((uint64_t)v10);
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v10);
  }

}

- (void)deactivateForAllChromes
{
  id v3;
  id v4;
  _QWORD *v5;
  const char *label;
  const char *v7;
  BOOL v8;
  void *v9;
  _QWORD v10[2];
  id (*v11)(uint64_t);
  void *v12;
  CarRouteGeniusManager *v13;

  v3 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_100907AC8;
  v12 = &unk_1011AC860;
  v13 = self;
  v4 = &_dispatch_main_q;
  v5 = v10;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v7 = dispatch_queue_get_label(0);
  if (label == v7 || (label ? (v8 = v7 == 0) : (v8 = 1), !v8 && !strcmp(label, v7)))
  {
    v9 = objc_autoreleasePoolPush();
    v11((uint64_t)v5);
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
  }

}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;

  if (self->_active != a3)
  {
    v3 = a3;
    v5 = sub_1004336BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_active)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      if (v3)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = v9;
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "setting route genius active:%@=>%@", (uint8_t *)&v14, 0x16u);

    }
    self->_active = v3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager vehicleMonitor](self, "vehicleMonitor"));
    objc_msgSend(v11, "setActive:", v3);

    -[CarRouteGeniusManager setRetryCount:](self, "setRetryCount:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    v13 = v12;
    if (v3)
    {
      objc_msgSend(v12, "registerObserver:", self);

      -[CarRouteGeniusManager startPredictingDestinationIfNeeded](self, "startPredictingDestinationIfNeeded");
    }
    else
    {
      objc_msgSend(v12, "unregisterObserver:", self);

      -[CarRouteGeniusManager stopPredictingDestinationIfNeeded](self, "stopPredictingDestinationIfNeeded");
    }
  }
}

- (void)setPreciseLocationEnabled:(BOOL)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  __CFString *v18;

  if (self->_preciseLocationEnabled != a3)
  {
    self->_preciseLocationEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager activeChromes](self, "activeChromes"));
      -[CarRouteGeniusManager setActive:](self, "setActive:", objc_msgSend(v4, "count") != 0);

    }
    else
    {
      -[CarRouteGeniusManager setActive:](self, "setActive:", 0);
    }
    v5 = sub_1004336BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_preciseLocationEnabled)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager activeChromes](self, "activeChromes"));
      v10 = objc_msgSend(v9, "count");
      if (-[CarRouteGeniusManager isActive](self, "isActive"))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = v11;
      v13 = 138412802;
      v14 = v8;
      v15 = 2048;
      v16 = v10;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarRouteGeniusManager: precise location was set to %@. activeChromes.count: %ld. -> active: %@", (uint8_t *)&v13, 0x20u);

    }
  }
}

- (void)_startPredictingRetryTimer
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  unint64_t v12;
  unsigned int v13;
  __CFString *v14;
  __CFString *v15;
  unint64_t v16;
  unsigned int v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  __CFString *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = objc_msgSend(v3, "state");

  if (v4 == (id)1)
  {
    v5 = sub_1004336BC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      *(_DWORD *)buf = 134217984;
      v24 = objc_msgSend(v7, "state");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Predicting retry timer not needed state=%lu", buf, 0xCu);

    }
    -[CarRouteGeniusManager _stopPredictingRetryTimer](self, "_stopPredictingRetryTimer");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager predictingRetryTimer](self, "predictingRetryTimer"));

    v9 = sub_1004336BC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v11)
      {
        v12 = -[CarRouteGeniusManager retryCount](self, "retryCount");
        v13 = -[CarRouteGeniusManager isActive](self, "isActive");
        v14 = CFSTR("NO");
        if (v13)
          v14 = CFSTR("YES");
        v15 = v14;
        *(_DWORD *)buf = 134218242;
        v24 = (id)v12;
        v25 = 2112;
        v26 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Predicting retry timer already running retryCount=%lu routeGeniusActive=%@", buf, 0x16u);

      }
    }
    else
    {
      if (v11)
      {
        v16 = -[CarRouteGeniusManager retryCount](self, "retryCount");
        v17 = -[CarRouteGeniusManager isActive](self, "isActive");
        v18 = CFSTR("NO");
        if (v17)
          v18 = CFSTR("YES");
        v19 = v18;
        *(_DWORD *)buf = 134218242;
        v24 = (id)v16;
        v25 = 2112;
        v26 = v19;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Predicting retry timer being started retryCount=%lu routeGeniusActive=%@", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100908114;
      v21[3] = &unk_1011ADF20;
      objc_copyWeak(&v22, (id *)buf);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v21, 2.0));
      -[CarRouteGeniusManager setPredictingRetryTimer:](self, "setPredictingRetryTimer:", v20);

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)_stopPredictingRetryTimer
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping predicting retry timer", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarRouteGeniusManager predictingRetryTimer](self, "predictingRetryTimer"));
  objc_msgSend(v5, "invalidate");

  -[CarRouteGeniusManager setPredictingRetryTimer:](self, "setPredictingRetryTimer:", 0);
  -[CarRouteGeniusManager setRetryCount:](self, "setRetryCount:", 0);
}

- (void)startPredictingDestinationIfNeeded
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[CarRouteGeniusManager isActive](self, "isActive");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    v7 = v6;
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "startPredictingDestinationIfNeeded routeGeniusActive=%@", (uint8_t *)&v9, 0xCu);

  }
  if (-[CarRouteGeniusManager isActive](self, "isActive"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    objc_msgSend(v8, "start");

  }
}

- (void)stopPredictingDestinationIfNeeded
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  int v16;
  __CFString *v17;

  v3 = sub_1004336BC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = -[CarRouteGeniusManager isActive](self, "isActive");
    v6 = CFSTR("NO");
    if (v5)
      v6 = CFSTR("YES");
    v7 = v6;
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "stopPredictingDestinationIfNeeded routeGeniusActive=%@", (uint8_t *)&v16, 0xCu);

  }
  if (!-[CarRouteGeniusManager isActive](self, "isActive"))
  {
    -[CarRouteGeniusManager _stopPredictingRetryTimer](self, "_stopPredictingRetryTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
    objc_msgSend(v8, "stop");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "platformController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSession"));
    v12 = objc_opt_class(NavigationSession);
    isKindOfClass = objc_opt_isKindOfClass(v11, v12);

    if ((isKindOfClass & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "platformController"));
      objc_msgSend(v15, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(RouteGeniusSession));

    }
  }
}

+ (id)sharedDebugPanelChrome
{
  if (qword_1014D3990 != -1)
    dispatch_once(&qword_1014D3990, &stru_1011DBAD0);
  return (id)qword_1014D3988;
}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_1004336BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "didUpdateRouteGenius:entry: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4)
  {
    -[CarRouteGeniusManager _stopPredictingRetryTimer](self, "_stopPredictingRetryTimer");
  }
  else if (-[CarRouteGeniusManager isActive](self, "isActive"))
  {
    -[CarRouteGeniusManager _startPredictingRetryTimer](self, "_startPredictingRetryTimer");
  }

}

- (void)vehicleBatteryChangedSignificantly
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sub_1004336BC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "vehicleBatteryChangedSignificantly -> will force a reroute", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
  objc_msgSend(v4, "forceReroute");

}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)isPreciseLocationEnabled
{
  return self->_preciseLocationEnabled;
}

- (NSTimer)predictingRetryTimer
{
  return self->_predictingRetryTimer;
}

- (void)setPredictingRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_predictingRetryTimer, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (NSHashTable)activeChromes
{
  return self->_activeChromes;
}

- (void)setActiveChromes:(id)a3
{
  objc_storeStrong((id *)&self->_activeChromes, a3);
}

- (CarRouteGeniusVehicleBatteryMonitor)vehicleMonitor
{
  return self->_vehicleMonitor;
}

- (void)setVehicleMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleMonitor, 0);
  objc_storeStrong((id *)&self->_activeChromes, 0);
  objc_storeStrong((id *)&self->_predictingRetryTimer, 0);
}

@end
