@implementation NavigationLocationProvider

- (NavigationLocationProvider)init
{
  NavigationLocationProvider *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  _QWORD block[4];
  NavigationLocationProvider *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NavigationLocationProvider;
  v2 = -[NavigationLocationProvider init](&v9, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v3, "registerObserver:", v2);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v5 = objc_msgSend(v4, "isInternalInstall");

    if (v5)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100429998;
      block[3] = &unk_1011AC860;
      v8 = v2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  unsigned int v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011B6050);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)NavigationLocationProvider;
  -[NavigationLocationProvider dealloc](&v6, "dealloc");
}

- (id)_console
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_debugConsole"));
  return v5;
}

- (void)_updateDebugLocationConsoleForLocation:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;
  void *v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[28];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v8 = objc_msgSend(v7, "navigationTransportType");

    if (v8 != 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
      v38 = objc_msgSend(v9, "routeCoordinate");
      LODWORD(v10) = (unint64_t)objc_msgSend(v9, "routeCoordinate") >> 32;
      objc_msgSend(v4, "coordinate");
      v12 = v11;
      objc_msgSend(v4, "coordinate");
      v14 = v13;
      objc_msgSend(v4, "horizontalAccuracy");
      v16 = v15;
      objc_msgSend(v4, "course");
      v18 = v17;
      if (v4)
      {
        objc_msgSend(v4, "clientLocation");
        v19 = *(_QWORD *)((char *)&v46 + 4);
      }
      else
      {
        v49 = 0u;
        memset(v50, 0, sizeof(v50));
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v19 = 0;
        v42 = 0u;
      }
      v20 = v10;
      objc_msgSend(v4, "speed");
      v22 = v21;
      v23 = objc_msgSend(v9, "stepIndex");
      objc_msgSend(v9, "distanceFromRoute");
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "step"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "geoStep"));
      v28 = objc_msgSend(v27, "maneuverType");
      v29 = CFSTR("NO_TURN");
      switch((int)v28)
      {
        case 0:
          break;
        case 1:
          v29 = CFSTR("LEFT_TURN");
          break;
        case 2:
          v29 = CFSTR("RIGHT_TURN");
          break;
        case 3:
          v29 = CFSTR("STRAIGHT_AHEAD");
          break;
        case 4:
          v29 = CFSTR("U_TURN");
          break;
        case 5:
          v29 = CFSTR("FOLLOW_ROAD");
          break;
        case 6:
          v29 = CFSTR("ENTER_ROUNDABOUT");
          break;
        case 7:
          v29 = CFSTR("EXIT_ROUNDABOUT");
          break;
        case 11:
          v29 = CFSTR("OFF_RAMP");
          break;
        case 12:
          v29 = CFSTR("ON_RAMP");
          break;
        case 16:
          v29 = CFSTR("ARRIVE_END_OF_NAVIGATION");
          break;
        case 17:
          v29 = CFSTR("START_ROUTE");
          break;
        case 18:
          v29 = CFSTR("ARRIVE_AT_DESTINATION");
          break;
        case 20:
          v29 = CFSTR("KEEP_LEFT");
          break;
        case 21:
          v29 = CFSTR("KEEP_RIGHT");
          break;
        case 22:
          v29 = CFSTR("ENTER_FERRY");
          break;
        case 23:
          v29 = CFSTR("EXIT_FERRY");
          break;
        case 24:
          v29 = CFSTR("CHANGE_FERRY");
          break;
        case 25:
          v29 = CFSTR("START_ROUTE_WITH_U_TURN");
          break;
        case 26:
          v29 = CFSTR("U_TURN_AT_ROUNDABOUT");
          break;
        case 27:
          v29 = CFSTR("LEFT_TURN_AT_END");
          break;
        case 28:
          v29 = CFSTR("RIGHT_TURN_AT_END");
          break;
        case 29:
          v29 = CFSTR("HIGHWAY_OFF_RAMP_LEFT");
          break;
        case 30:
          v29 = CFSTR("HIGHWAY_OFF_RAMP_RIGHT");
          break;
        case 33:
          v29 = CFSTR("ARRIVE_AT_DESTINATION_LEFT");
          break;
        case 34:
          v29 = CFSTR("ARRIVE_AT_DESTINATION_RIGHT");
          break;
        case 35:
          v29 = CFSTR("U_TURN_WHEN_POSSIBLE");
          break;
        case 39:
          v29 = CFSTR("ARRIVE_END_OF_DIRECTIONS");
          break;
        case 41:
          v29 = CFSTR("ROUNDABOUT_EXIT_1");
          break;
        case 42:
          v29 = CFSTR("ROUNDABOUT_EXIT_2");
          break;
        case 43:
          v29 = CFSTR("ROUNDABOUT_EXIT_3");
          break;
        case 44:
          v29 = CFSTR("ROUNDABOUT_EXIT_4");
          break;
        case 45:
          v29 = CFSTR("ROUNDABOUT_EXIT_5");
          break;
        case 46:
          v29 = CFSTR("ROUNDABOUT_EXIT_6");
          break;
        case 47:
          v29 = CFSTR("ROUNDABOUT_EXIT_7");
          break;
        case 48:
          v29 = CFSTR("ROUNDABOUT_EXIT_8");
          break;
        case 49:
          v29 = CFSTR("ROUNDABOUT_EXIT_9");
          break;
        case 50:
          v29 = CFSTR("ROUNDABOUT_EXIT_10");
          break;
        case 51:
          v29 = CFSTR("ROUNDABOUT_EXIT_11");
          break;
        case 52:
          v29 = CFSTR("ROUNDABOUT_EXIT_12");
          break;
        case 53:
          v29 = CFSTR("ROUNDABOUT_EXIT_13");
          break;
        case 54:
          v29 = CFSTR("ROUNDABOUT_EXIT_14");
          break;
        case 55:
          v29 = CFSTR("ROUNDABOUT_EXIT_15");
          break;
        case 56:
          v29 = CFSTR("ROUNDABOUT_EXIT_16");
          break;
        case 57:
          v29 = CFSTR("ROUNDABOUT_EXIT_17");
          break;
        case 58:
          v29 = CFSTR("ROUNDABOUT_EXIT_18");
          break;
        case 59:
          v29 = CFSTR("ROUNDABOUT_EXIT_19");
          break;
        case 60:
          v29 = CFSTR("SHARP_LEFT_TURN");
          break;
        case 61:
          v29 = CFSTR("SHARP_RIGHT_TURN");
          break;
        case 62:
          v29 = CFSTR("SLIGHT_LEFT_TURN");
          break;
        case 63:
          v29 = CFSTR("SLIGHT_RIGHT_TURN");
          break;
        case 64:
          v29 = CFSTR("CHANGE_HIGHWAY");
          break;
        case 65:
          v29 = CFSTR("CHANGE_HIGHWAY_LEFT");
          break;
        case 66:
          v29 = CFSTR("CHANGE_HIGHWAY_RIGHT");
          break;
        case 80:
          v29 = CFSTR("TOLL_STATION");
          break;
        case 81:
          v29 = CFSTR("ENTER_TUNNEL");
          break;
        case 82:
          v29 = CFSTR("WAYPOINT_STOP");
          break;
        case 83:
          v29 = CFSTR("WAYPOINT_STOP_LEFT");
          break;
        case 84:
          v29 = CFSTR("WAYPOINT_STOP_RIGHT");
          break;
        case 85:
          v29 = CFSTR("RESUME_ROUTE");
          break;
        case 86:
          v29 = CFSTR("RESUME_ROUTE_WITH_U_TURN");
          break;
        case 87:
          v29 = CFSTR("CUSTOM");
          break;
        case 88:
          v29 = CFSTR("TURN_AROUND");
          break;
        default:
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v28));
          break;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString lowercaseString](v29, "lowercaseString"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "step"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "maneuverRoadName"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%u, %0.2f]  (%0.5f, %0.5f)±%0.0fm  %0.0f°±%0.0f°  %0.1fm/s\nStep %d  Dist: %0.1f  (%@ > %@)"), v38, *(_QWORD *)&v20, v12, v14, v16, v18, v19, v22, v23, v25, v30, v32));

      v34 = objc_msgSend(v4, "state");
      if (v34 == (id)2)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      }
      else if (v34 == (id)1)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
      }
      else
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10042A16C;
      block[3] = &unk_1011AD238;
      block[4] = self;
      v40 = v33;
      v41 = v35;
      v36 = v35;
      v37 = v33;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }

}

- (NSBundle)effectiveBundle
{
  return 0;
}

- (NSString)effectiveBundleIdentifier
{
  return 0;
}

- (double)desiredAccuracy
{
  return kCLLocationAccuracyBestForNavigation;
}

- (double)distanceFilter
{
  return kCLDistanceFilterNone;
}

- (BOOL)matchInfoEnabled
{
  return 1;
}

- (BOOL)fusionInfoEnabled
{
  return 1;
}

- (int)headingOrientation
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "headingOrientation");

  return v3;
}

- (void)setHeadingOrientation:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "setHeadingOrientation:", v3);

}

- (double)expectedGpsUpdateInterval
{
  return 1.0;
}

- (int)authorizationStatus
{
  return 3;
}

- (void)authorizationStatusOnQueue:(id)a3 result:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    if (!a3)
    {
      v7 = &_dispatch_main_q;
      v8 = &_dispatch_main_q;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10042A370;
    v9[3] = &unk_1011ACAD0;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v7, v9);
    if (!a3)

  }
}

- (int64_t)accuracyAuthorization
{
  return 0;
}

- (void)accuracyAuthorizationOnQueue:(id)a3 result:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    if (!a3)
    {
      v7 = &_dispatch_main_q;
      v8 = &_dispatch_main_q;
    }
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10042A450;
    v9[3] = &unk_1011ACAD0;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v7, v9);
    if (!a3)

  }
}

- (int64_t)activityType
{
  return 2;
}

- (BOOL)usesCLMapCorrection
{
  return +[CLLocationManager mapCorrectionAvailable](CLLocationManager, "mapCorrectionAvailable");
}

- (BOOL)shouldShiftIfNecessary
{
  return 0;
}

- (BOOL)isTracePlayer
{
  return 0;
}

- (double)timeScale
{
  return 1.0;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  if (v6)
  {
    v7 = sub_1004339CC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2080;
      v16 = "-[NavigationLocationProvider navigationService:didUpdateMatchedLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[Maps] %@ Received - in %s", (uint8_t *)&v13, 0x16u);
    }

    -[NavigationLocationProvider _updateDebugLocationConsoleForLocation:](self, "_updateDebugLocationConsoleForLocation:", v5);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "locationProvider:didUpdateLocation:", self, v5);

    v10 = sub_1004339CC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2080;
      v16 = "-[NavigationLocationProvider navigationService:didUpdateMatchedLocation:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Maps] %@ Processed - in %s", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    -[NavigationLocationProvider _updateDebugLocationConsoleForLocation:](self, "_updateDebugLocationConsoleForLocation:", v5);
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "locationProvider:didUpdateLocation:", self, v5);

  }
}

- (void)navigationService:(id)a3 didUpdateHeading:(double)a4 accuracy:(double)a5
{
  uint64_t v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  _OWORD v12[2];
  double v13;
  double v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate", a3);
  memset(v12, 0, sizeof(v12));
  v13 = a4;
  v14 = a5;
  v15 = v8;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(objc_alloc((Class)CLHeading), "initWithClientHeading:", v12);
  if (qword_1014D2538 != -1)
    dispatch_once(&qword_1014D2538, &stru_1011B6070);
  v10 = qword_1014D2530;
  if (os_log_type_enabled((os_log_t)qword_1014D2530, OS_LOG_TYPE_INFO))
  {
    LODWORD(v12[0]) = 134218240;
    *(double *)((char *)v12 + 4) = a4;
    WORD6(v12[0]) = 2048;
    *(double *)((char *)v12 + 14) = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Got updated heading: %f, accuracy: %f", (uint8_t *)v12, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "locationProvider:didUpdateHeading:", self, v9);

}

- (MKLocationProviderDelegate)delegate
{
  return (MKLocationProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
