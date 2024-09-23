@implementation RoutePlanningSessionConfiguration

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 traits:(id)a4 existingTiming:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NavdRouteLoadingTaskFactory *v19;
  void *v20;
  NavdRouteLoadingTaskFactory *v21;
  RoutePlanningSessionConfiguration *v22;

  v9 = a6;
  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [NavdRouteLoadingTaskFactory alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v21 = -[NavdRouteLoadingTaskFactory initWithUserDefaults:existingTiming:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:](v19, "initWithUserDefaults:existingTiming:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:", v20, v16, v17, v9, v15, v14);

  v22 = -[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:](self, "initWithWaypointRequests:routeLoadingTaskFactory:traits:", v18, v21, v17);
  return v22;
}

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  RoutePlanningSessionConfiguration *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCompanionRouteContext context](GEOCompanionRouteContext, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v13 = -[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext:locationManager:](self, "initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext:locationManager:", v10, v9, v8, v11, v12);

  return v13;
}

- (id)configurationByModifyingRouteLoadingTaskFactory:(id)a3 andDedupingWaypointRequests:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  RoutePlanningSessionConfiguration *v13;
  void *v14;
  void *v15;
  RoutePlanningSessionConfiguration *v16;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id obj;
  id v25;
  NSMutableArray *v26;
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE buf[24];
  __int128 v33;
  id v34;
  _BYTE v35[128];

  v5 = a3;
  v25 = a4;
  if (!v5)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[RoutePlanningSessionConfiguration(Modification) configurationByModifyingRouteLoadingTaskFac"
                           "tory:andDedupingWaypointRequests:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "RoutePlanningSessionConfiguration+Extras.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v33) = 50;
      WORD2(v33) = 2080;
      *(_QWORD *)((char *)&v33 + 6) = "newRouteLoadingTaskFactory != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v26 = objc_opt_new(NSMutableArray);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration waypointRequests](self, "waypointRequests"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&v33 = sub_100979C48;
        *((_QWORD *)&v33 + 1) = sub_100979C58;
        v34 = 0;
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100979C60;
        v27[3] = &unk_1011DD1E8;
        v27[4] = v9;
        v27[5] = buf;
        objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v27);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        else
          v10 = v9;
        -[NSMutableArray addObject:](v26, "addObject:", v10);
        _Block_object_dispose(buf, 8);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration traits](self, "traits"));
  v12 = objc_msgSend(v11, "copyByIncrementingSessionCounters");

  v13 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration companionContext](v13, "companionContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v16 = -[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext:locationManager:](v13, "initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext:locationManager:", v26, v5, v12, v14, v15);

  return v16;
}

- (RoutePlanningSessionConfiguration)initWithWaypointRequests:(id)a3 routeLoadingTaskFactory:(id)a4 traits:(id)a5 companionContext:(id)a6 locationManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  RoutePlanningSessionConfiguration *v17;
  NSArray *v18;
  NSArray *waypointRequests;
  GEOMapServiceTraits *v20;
  GEOMapServiceTraits *traits;
  GEOCompanionRouteContext *v22;
  GEOCompanionRouteContext *companionContext;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  char *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  char *v49;
  objc_super v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((unint64_t)objc_msgSend(v12, "count") <= 1)
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      v53 = 2080;
      v54 = "RoutePlanningSessionConfiguration.m";
      v55 = 1024;
      v56 = 35;
      v57 = 2080;
      v58 = "waypointRequests.count >= 2";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v52 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      v53 = 2080;
      v54 = "RoutePlanningSessionConfiguration.m";
      v55 = 1024;
      v56 = 36;
      v57 = 2080;
      v58 = "taskFactory != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v52 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v14)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      v53 = 2080;
      v54 = "RoutePlanningSessionConfiguration.m";
      v55 = 1024;
      v56 = 37;
      v57 = 2080;
      v58 = "traits != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v52 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v15)
  {
    v40 = sub_1004318FC();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      v53 = 2080;
      v54 = "RoutePlanningSessionConfiguration.m";
      v55 = 1024;
      v56 = 38;
      v57 = 2080;
      v58 = "companionContext != nil";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v42 = sub_1004318FC();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v52 = v44;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v16)
  {
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v52 = "-[RoutePlanningSessionConfiguration initWithWaypointRequests:routeLoadingTaskFactory:traits:companionContext"
            ":locationManager:]";
      v53 = 2080;
      v54 = "RoutePlanningSessionConfiguration.m";
      v55 = 1024;
      v56 = 39;
      v57 = 2080;
      v58 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v52 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v50.receiver = self;
  v50.super_class = (Class)RoutePlanningSessionConfiguration;
  v17 = -[RoutePlanningSessionConfiguration init](&v50, "init");
  if (v17)
  {
    v18 = (NSArray *)objc_msgSend(v12, "copy");
    waypointRequests = v17->_waypointRequests;
    v17->_waypointRequests = v18;

    objc_storeStrong((id *)&v17->_routeLoadingTaskFactory, a4);
    v20 = (GEOMapServiceTraits *)objc_msgSend(v14, "copy");
    traits = v17->_traits;
    v17->_traits = v20;

    v22 = (GEOCompanionRouteContext *)objc_msgSend(v15, "copy");
    companionContext = v17->_companionContext;
    v17->_companionContext = v22;

    v17->_ignoreMapType = 1;
    v17->_initialTransportType = 0;
    objc_storeStrong((id *)&v17->_locationManager, a7);
  }

  return v17;
}

- (id)description
{
  id v3;
  id v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  unint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v20;

  v3 = objc_alloc((Class)NSMutableString);
  v20.receiver = self;
  v20.super_class = (Class)RoutePlanningSessionConfiguration;
  v4 = -[RoutePlanningSessionConfiguration description](&v20, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v3, "initWithString:", v5);

  objc_msgSend(v6, "appendFormat:", CFSTR("\nwaypointRequests:(%@)"), self->_waypointRequests);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nrouteLoadingTaskFactory:(%@)"), self->_routeLoadingTaskFactory);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ntraits:(%p)"), self->_traits);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ncompanionContext:(%@)"), self->_companionContext);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ncountryConfiguration:(%@)"), self->_countryConfiguration);
  if (-[RoutePlanningSessionConfiguration isNavigationTracePlayback](self, "isNavigationTracePlayback"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("\nisNavigationTracePlayback:(%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration tracePlaybackPath](self, "tracePlaybackPath"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\ntracePlaybackPath:(%@)"), v8);

  if (-[RoutePlanningSessionConfiguration shouldAutoLaunchNavigation](self, "shouldAutoLaunchNavigation"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("\nshouldAutoLaunchNavigation:(%@)"), v9);
  objc_msgSend(v6, "appendFormat:", CFSTR("\nnavigationAutoLaunchDelay:(%@)"), self->_navigationAutoLaunchDelay);
  if (-[RoutePlanningSessionConfiguration areInitialRoutesBeingFetchedExternally](self, "areInitialRoutesBeingFetchedExternally"))
  {
    v10 = CFSTR("YES");
  }
  else
  {
    v10 = CFSTR("NO");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("\nareInitialRoutesBeingFetchedExternally:(%@)"), v10);
  if (-[RoutePlanningSessionConfiguration ignoreMapType](self, "ignoreMapType"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v6, "appendFormat:", CFSTR("\nignoreMapType:(%@)"), v11);
  v12 = self->_initialTransportType - 1;
  if (v12 > 4)
    v13 = CFSTR("Undefined");
  else
    v13 = *(&off_1011E11F0 + v12);
  objc_msgSend(v6, "appendFormat:", CFSTR("\ninitialTransportType:(%@)"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration supportedTransportTypes](self, "supportedTransportTypes"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\nsupportedTransportTypes:(%@)"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration automaticSharingContacts](self, "automaticSharingContacts"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\nautomatic sharing:(%@)"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration shortcutIdentifier](self, "shortcutIdentifier"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\nshortcutIdentifier:(%@)"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration originalHistoryEntryIdentifier](self, "originalHistoryEntryIdentifier"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\noriginalHistoryEntryIdentifier:(%@)"), v17);

  v18 = objc_msgSend(v6, "copy");
  return v18;
}

- (void)setCountryConfiguration:(id)a3
{
  GEOCountryConfiguration *v5;
  GEOCountryConfiguration *countryConfiguration;
  void *v7;
  GEOCountryConfiguration *v8;

  v5 = (GEOCountryConfiguration *)a3;
  if (self->_countryConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_countryConfiguration, a3);
    countryConfiguration = self->_countryConfiguration;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
    objc_msgSend(v7, "setCountryConfiguration:", countryConfiguration);

    v5 = v8;
  }

}

- (GEOCountryConfiguration)countryConfiguration
{
  GEOCountryConfiguration *countryConfiguration;

  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
    return countryConfiguration;
  else
    return (GEOCountryConfiguration *)(id)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
}

- (RoutePlanningWaypointRequest)originWaypointRequest
{
  return (RoutePlanningWaypointRequest *)-[NSArray firstObject](self->_waypointRequests, "firstObject");
}

- (RoutePlanningWaypointRequest)destinationWaypointRequest
{
  return (RoutePlanningWaypointRequest *)-[NSArray lastObject](self->_waypointRequests, "lastObject");
}

- (BOOL)isNavigationTracePlayback
{
  void *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = objc_opt_class(TraceRouteLoadingTaskFactory);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

- (NSString)tracePlaybackPath
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = objc_opt_class(TraceRouteLoadingTaskFactory);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tracePath"));
  return (NSString *)v6;
}

- (NSSet)supportedTransportTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supportedTransportTypes"));

  return (NSSet *)v3;
}

- (BOOL)hasTransportType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "supportedTransportTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  return v7;
}

- (BOOL)shouldAutoLaunchNavigation
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration navigationAutoLaunchDelay](self, "navigationAutoLaunchDelay"));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isResumingMultipointRoute
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = objc_msgSend(v2, "isResumingMultipointRoute");

  return v3;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resumeRouteHandle"));

  return (GEOResumeRouteHandle *)v3;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "persistentData"));

  return (GEOComposedGeometryRoutePersistentData *)v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  RoutePlanningSessionConfiguration *v7;
  uint64_t v8;
  RoutePlanningSessionConfiguration *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  int v24;

  v7 = (RoutePlanningSessionConfiguration *)a3;
  if (v7 == self)
  {
    v12 = 1;
  }
  else
  {
    v8 = objc_opt_class(RoutePlanningSessionConfiguration);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration waypointRequests](v9, "waypointRequests"));
      if (v10 || self->_waypointRequests)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration waypointRequests](v9, "waypointRequests"));
        if (!objc_msgSend(v3, "isEqual:", self->_waypointRequests))
        {
          v12 = 0;
          goto LABEL_48;
        }
        v11 = 1;
      }
      else
      {
        v11 = 0;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](v9, "routeLoadingTaskFactory"));
      if (v13 || self->_routeLoadingTaskFactory)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration routeLoadingTaskFactory](v9, "routeLoadingTaskFactory"));
        if (!objc_msgSend(v4, "isEqual:", self->_routeLoadingTaskFactory))
        {
          v12 = 0;
LABEL_47:

          if ((v11 & 1) == 0)
          {
LABEL_49:

            goto LABEL_50;
          }
LABEL_48:

          goto LABEL_49;
        }
        v24 = 1;
      }
      else
      {
        v24 = 0;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration traits](v9, "traits"));
      if (v14 || self->_traits)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration traits](v9, "traits"));
        if (!objc_msgSend(v5, "isEqual:", self->_traits))
        {
          v12 = 0;
          goto LABEL_46;
        }
        v23 = 1;
      }
      else
      {
        v23 = 0;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration companionContext](v9, "companionContext"));
      if (v22 || self->_companionContext)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration companionContext](v9, "companionContext"));
        if (!objc_msgSend(v21, "isEqual:", self->_companionContext))
        {
          v12 = 0;
          goto LABEL_45;
        }
        v20 = 1;
      }
      else
      {
        v20 = 0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration navigationAutoLaunchDelay](v9, "navigationAutoLaunchDelay"));
      if (v19 || self->_navigationAutoLaunchDelay)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionConfiguration navigationAutoLaunchDelay](v9, "navigationAutoLaunchDelay"));
        if (!objc_msgSend(v18, "isEqual:", self->_navigationAutoLaunchDelay))
        {
          v12 = 0;
          goto LABEL_44;
        }
        v17 = 1;
      }
      else
      {
        v17 = 0;
      }
      if (self->_initialRoutesBeingFetchedExternally == -[RoutePlanningSessionConfiguration areInitialRoutesBeingFetchedExternally](v9, "areInitialRoutesBeingFetchedExternally")&& self->_ignoreMapType == -[RoutePlanningSessionConfiguration ignoreMapType](v9, "ignoreMapType"))
      {
        v12 = -[RoutePlanningSessionConfiguration initialTransportType](v9, "initialTransportType") == self->_initialTransportType;
        v15 = v12;
        if ((v17 & 1) == 0)
          goto LABEL_38;
      }
      else
      {
        v12 = 0;
        v15 = 0;
        if (!v17)
        {
LABEL_38:
          v12 = v15;

          if (!v20)
            goto LABEL_39;
          goto LABEL_45;
        }
      }
LABEL_44:

      if ((v20 & 1) == 0)
      {
LABEL_39:

        if (!v23)
          goto LABEL_40;
        goto LABEL_46;
      }
LABEL_45:

      if ((v23 & 1) == 0)
      {
LABEL_40:

        if (!v24)
          goto LABEL_41;
        goto LABEL_47;
      }
LABEL_46:

      if ((v24 & 1) == 0)
      {
LABEL_41:

        if (!v11)
          goto LABEL_49;
        goto LABEL_48;
      }
      goto LABEL_47;
    }
    v12 = 0;
  }
LABEL_50:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (unint64_t)-[NSArray hash](self->_waypointRequests, "hash");
  v4 = (unint64_t)-[RouteLoadingTaskFactory hash](self->_routeLoadingTaskFactory, "hash") ^ v3;
  v5 = (unint64_t)-[GEOMapServiceTraits hash](self->_traits, "hash");
  v6 = v4 ^ v5 ^ (unint64_t)-[GEOCompanionRouteContext hash](self->_companionContext, "hash");
  return v6 ^ (unint64_t)-[NSNumber hash](self->_navigationAutoLaunchDelay, "hash");
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (RouteLoadingTaskFactory)routeLoadingTaskFactory
{
  return self->_routeLoadingTaskFactory;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEOCompanionRouteContext)companionContext
{
  return self->_companionContext;
}

- (void)setCompanionContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (NSNumber)navigationAutoLaunchDelay
{
  return self->_navigationAutoLaunchDelay;
}

- (void)setNavigationAutoLaunchDelay:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)automaticSharingContacts
{
  return self->_automaticSharingContacts;
}

- (void)setAutomaticSharingContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldRestoreCamera
{
  return self->_shouldRestoreCamera;
}

- (void)setShouldRestoreCamera:(BOOL)a3
{
  self->_shouldRestoreCamera = a3;
}

- (BOOL)shouldRestoreToLowGuidance
{
  return self->_shouldRestoreToLowGuidance;
}

- (void)setShouldRestoreToLowGuidance:(BOOL)a3
{
  self->_shouldRestoreToLowGuidance = a3;
}

- (BOOL)shouldStartShortestRoute
{
  return self->_shouldStartShortestRoute;
}

- (void)setShouldStartShortestRoute:(BOOL)a3
{
  self->_shouldStartShortestRoute = a3;
}

- (BOOL)shouldStartFastestRoute
{
  return self->_shouldStartFastestRoute;
}

- (void)setShouldStartFastestRoute:(BOOL)a3
{
  self->_shouldStartFastestRoute = a3;
}

- (NSUUID)originalHistoryEntryIdentifier
{
  return self->_originalHistoryEntryIdentifier;
}

- (void)setOriginalHistoryEntryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)areInitialRoutesBeingFetchedExternally
{
  return self->_initialRoutesBeingFetchedExternally;
}

- (void)setInitialRoutesBeingFetchedExternally:(BOOL)a3
{
  self->_initialRoutesBeingFetchedExternally = a3;
}

- (BOOL)ignoreMapType
{
  return self->_ignoreMapType;
}

- (void)setIgnoreMapType:(BOOL)a3
{
  self->_ignoreMapType = a3;
}

- (int64_t)initialTransportType
{
  return self->_initialTransportType;
}

- (void)setInitialTransportType:(int64_t)a3
{
  self->_initialTransportType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalHistoryEntryIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_automaticSharingContacts, 0);
  objc_storeStrong((id *)&self->_navigationAutoLaunchDelay, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_companionContext, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_routeLoadingTaskFactory, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end
