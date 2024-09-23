@implementation RoutePlanningSessionRouteLoadedNotifier

- (RoutePlanningSessionRouteLoadedNotifier)initWithPlatformController:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  RoutePlanningSessionRouteLoadedNotifier *v8;
  id v9;
  id handler;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  char *v17;
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
  if (!v7)
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v26 = "-[RoutePlanningSessionRouteLoadedNotifier initWithPlatformController:handler:]";
      v27 = 2080;
      v28 = "RoutePlanningSessionRouteLoadedNotifier.m";
      v29 = 1024;
      v30 = 38;
      v31 = 2080;
      v32 = "handler != nil";
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
  v24.super_class = (Class)RoutePlanningSessionRouteLoadedNotifier;
  v8 = -[RoutePlanningSessionRouteLoadedNotifier init](&v24, "init");
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    handler = v8->_handler;
    v8->_handler = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionStack"));
    v12 = sub_10039E080(v11, &stru_1011D9D20);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    -[RoutePlanningSessionRouteLoadedNotifier setObservedRoutePlanningSession:](v8, "setObservedRoutePlanningSession:", v14);

    v15 = sub_100882D38();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (char *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionRouteLoadedNotifier observedRoutePlanningSession](v8, "observedRoutePlanningSession"));
      *(_DWORD *)buf = 138412290;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Initiated a loader notifier with current routePlanningSession: %@", buf, 0xCu);

    }
  }

  return v8;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[RoutePlanningSessionRouteLoadedNotifier setObservedRoutePlanningSession:](self, "setObservedRoutePlanningSession:", v8);

}

- (void)setObservedRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *v6;
  RoutePlanningSession *observedRoutePlanningSession;
  id v8;
  NSObject *v9;
  RoutePlanningSession *v10;
  void *v11;
  id v12;
  NSObject *v13;
  int v14;
  RoutePlanningSession *v15;
  __int16 v16;
  RoutePlanningSession *v17;

  v5 = (RoutePlanningSession *)a3;
  v6 = v5;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    if (!v5 && observedRoutePlanningSession)
      -[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromOutgoingSession:](self, "_createAndSaveHistoryEntryFromOutgoingSession:");
    v8 = sub_100882D38();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_observedRoutePlanningSession;
      v14 = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "setObservedRoutePlanningSession from: %@ to %@", (uint8_t *)&v14, 0x16u);
    }

    -[RoutePlanningSession removeObserver:](self->_observedRoutePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_observedRoutePlanningSession, "addObserver:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession currentRouteCollection](self->_observedRoutePlanningSession, "currentRouteCollection"));

    if (v11)
    {
      v12 = sub_100882D38();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "observedRoutePlanningSession has a loaded routeCollection. Will proceed to saving a history entry.", (uint8_t *)&v14, 2u);
      }

      -[RoutePlanningSessionRouteLoadedNotifier _updateCurrentRouteHistoryEntryFromSession:](self, "_updateCurrentRouteHistoryEntryFromSession:", self->_observedRoutePlanningSession);
    }
  }

}

- (void)setCurrentRouteHistoryEntry:(id)a3
{
  HistoryEntryRecentsItem *v5;
  id v6;
  NSObject *v7;
  HistoryEntryRecentsItem *currentRouteHistoryEntry;
  id v9;
  NSObject *v10;
  void *v11;
  HistoryEntryRecentsItem *v12;
  void *v13;
  HistoryEntryRecentsItem *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  HistoryEntryRecentsItem *v19;
  __int16 v20;
  HistoryEntryRecentsItem *v21;

  v5 = (HistoryEntryRecentsItem *)a3;
  if (self->_currentRouteHistoryEntry != v5)
  {
    v6 = sub_100882D38();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      currentRouteHistoryEntry = self->_currentRouteHistoryEntry;
      v18 = 138412546;
      v19 = currentRouteHistoryEntry;
      v20 = 2112;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will update currentRouteHistoryEntry from: %@ to %@", (uint8_t *)&v18, 0x16u);
    }

    objc_storeStrong((id *)&self->_currentRouteHistoryEntry, a3);
    v9 = sub_100882D38();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self->_observedRoutePlanningSession, "configuration"));
      v12 = (HistoryEntryRecentsItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalHistoryEntryIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v5, "historyEntry"));
      v14 = (HistoryEntryRecentsItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storageIdentifier"));
      v18 = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will update session originalHistoryEntryIdentifier from %@ to %@", (uint8_t *)&v18, 0x16u);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HistoryEntryRecentsItem historyEntry](v5, "historyEntry"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storageIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSession configuration](self->_observedRoutePlanningSession, "configuration"));
    objc_msgSend(v17, "setOriginalHistoryEntryIdentifier:", v16);

  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeCollectionForTransportType:", a4));

  if (v8)
  {
    v9 = sub_100882D38();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "routePlanningSession:didChangeCurrentTransportType will save updated session: %@", (uint8_t *)&v11, 0xCu);
    }

    -[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromUpdatedSession:](self, "_createAndSaveHistoryEntryFromUpdatedSession:", v7);
  }

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  char *v8;
  id v9;
  char *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v8 = (char *)a3;
  v9 = a4;
  v10 = (char *)objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionRouteLoadedNotifier observedRoutePlanningSession](self, "observedRoutePlanningSession"));

  if (v10 != v8)
  {
    v16 = sub_1004318FC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315906;
      v22 = "-[RoutePlanningSessionRouteLoadedNotifier routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
      v23 = 2080;
      v24 = "RoutePlanningSessionRouteLoadedNotifier.m";
      v25 = 1024;
      v26 = 118;
      v27 = 2080;
      v28 = "session == self.observedRoutePlanningSession";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v21, 0x26u);
    }

    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
  }
  if (objc_msgSend(v8, "currentTransportType") == (id)a5)
  {
    v11 = objc_msgSend(v9, "isSuccess");
    v12 = sub_100882D38();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didUpdateRouteCollectionResult was successful, will create a resume item with session: %@", (uint8_t *)&v21, 0xCu);
      }

      -[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromUpdatedSession:](self, "_createAndSaveHistoryEntryFromUpdatedSession:", v8);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v21 = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "didUpdateRouteCollectionResult but it was not successful, will not create a resume item. session: %@", (uint8_t *)&v21, 0xCu);
      }

    }
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[RoutePlanningSessionRouteLoadedNotifier handler](self, "handler"));
    ((void (**)(_QWORD, id))v15)[2](v15, v9);

  }
}

+ (id)_createAndSaveHistoryEntryFromSession:(id)a3 selectedRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  char *v47;
  id v48;
  NSObject *v49;
  void *v51;
  unsigned __int8 v52;
  id v53;
  NSObject *v54;
  id v55;
  NSObject *v56;
  char *v57;
  id v58;
  int v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  const char *v66;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeCollectionForTransportType:", objc_msgSend(v5, "currentTransportType")));
  v8 = v7;
  if (v6)
  {
    v9 = v6;
LABEL_4:
    v10 = sub_100882D38();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
      v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "originalHistoryEntryIdentifier"));
      v59 = 138412290;
      v60 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saving route as recent using identifier: %@", (uint8_t *)&v59, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "originalHistoryEntryIdentifier"));
    v16 = (char *)objc_claimAutoreleasedReturnValue(+[HistoryEntryRecentsItem saveRoute:withOriginalHistoryIdentifier:editBlock:completionBlock:](HistoryEntryRecentsItem, "saveRoute:withOriginalHistoryIdentifier:editBlock:completionBlock:", v9, v15, 0, &stru_1011D9D40));

    v17 = sub_100882D38();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v59 = 138412546;
      v60 = v16;
      v61 = 2112;
      v62 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Created a historyRecentsItem: %@ from session: %@", (uint8_t *)&v59, 0x16u);
    }

    if (v16)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originalHistoryEntryIdentifier"));

      if (!v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storageIdentifier"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
        objc_msgSend(v23, "setOriginalHistoryEntryIdentifier:", v22);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
      objc_msgSend(v24, "clearAll");

      v25 = (unint64_t)objc_msgSend(v5, "currentTransportType");
      if (v25 > 4 || ((1 << v25) & 0x19) == 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storageIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        objc_msgSend(v28, "setHistoryItemIdentifier:", v27);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeInitializerData](v9, "routeInitializerData"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "directionsRequest"));
        objc_msgSend(v29, "recordNewRequest:", v31);

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeInitializerData](v9, "routeInitializerData"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "directionsResponse"));
        objc_msgSend(v32, "recordNewResponse:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        objc_msgSend(v35, "recordNewRoute:", v9);

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes"));
        objc_msgSend(v36, "setSelectedRoute:fromRouteList:", v9, v37);

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypoints"));
        LOBYTE(v37) = objc_msgSend(v38, "areAllValidWaypoints");

        if ((v37 & 1) == 0)
        {
          v39 = sub_100431F8C();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v59) = 0;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Found NSNulls in resolved waypoints.", (uint8_t *)&v59, 2u);
          }

        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypoints"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "waypointsOrNull"));
        v43 = sub_10039E080(v42, &stru_1011D9D60);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        objc_msgSend(v45, "recordWaypoints:startWaypointSearchTicket:endWaypointSearchTicket:", v44, 0, 0);

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "reportAProblemRecorder"));
        objc_msgSend(v46, "setOriginatingDeviceFromOrigin:", 0);

      }
      v47 = v16;
    }
    else
    {
      v48 = sub_100882D38();
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v59) = 0;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Cannot save RAP history with because we failed to construct historyEntry.", (uint8_t *)&v59, 2u);
      }

    }
    goto LABEL_23;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentRoute"));
  if (v9)
    goto LABEL_4;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
  v52 = objc_msgSend(v51, "isNavigationTracePlayback");

  if ((v52 & 1) == 0)
  {
    v53 = sub_1004318FC();
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      v59 = 136315906;
      v60 = "+[RoutePlanningSessionRouteLoadedNotifier _createAndSaveHistoryEntryFromSession:selectedRoute:]";
      v61 = 2080;
      v62 = "RoutePlanningSessionRouteLoadedNotifier.m";
      v63 = 1024;
      v64 = 156;
      v65 = 2080;
      v66 = "composedRoute != nil || session.configuration.isNavigationTracePlayback";
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v59, 0x26u);
    }

    if (sub_100A70734())
    {
      v55 = sub_1004318FC();
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v57 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v59 = 138412290;
        v60 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v59, 0xCu);

      }
    }
  }
  v58 = sub_100882D38();
  v9 = objc_claimAutoreleasedReturnValue(v58);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v59) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Cannot save RAP history with a nil route.", (uint8_t *)&v59, 2u);
  }
  v16 = 0;
LABEL_23:

  return v16;
}

- (void)_updateCurrentRouteHistoryEntryFromSession:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_createAndSaveHistoryEntryFromSession:selectedRoute:", v4, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);

  -[RoutePlanningSessionRouteLoadedNotifier setCurrentRouteHistoryEntry:](self, "setCurrentRouteHistoryEntry:", v6);
}

- (void)_createAndSaveHistoryEntryFromUpdatedSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeCollectionForTransportType:", objc_msgSend(v4, "currentTransportType")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
  v8 = objc_msgSend(v7, "count");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  v11 = sub_100882D38();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v10 == (id)5 && (unint64_t)v8 <= 2)
  {
    if (v13)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromUpdatedSession nonMPR on macOS, ignoring", (uint8_t *)&v14, 2u);
    }

  }
  else
  {
    if (v13)
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromUpdatedSession will create and save route from session: %@", (uint8_t *)&v14, 0xCu);
    }

    -[RoutePlanningSessionRouteLoadedNotifier _updateCurrentRouteHistoryEntryFromSession:](self, "_updateCurrentRouteHistoryEntryFromSession:", v4);
  }

}

- (void)_createAndSaveHistoryEntryFromOutgoingSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];
  uint8_t v15[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == (id)5)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeCollectionForTransportType:", objc_msgSend(v4, "currentTransportType")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject currentRoute](v7, "currentRoute"));
    v9 = sub_100882D38();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession will create and save route", buf, 2u);
      }

      -[RoutePlanningSessionRouteLoadedNotifier _updateCurrentRouteHistoryEntryFromSession:](self, "_updateCurrentRouteHistoryEntryFromSession:", v4);
    }
    else
    {
      if (v11)
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession does not have currentRoute. Ignoring", v13, 2u);
      }

    }
  }
  else
  {
    v12 = sub_100882D38();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_createAndSaveHistoryEntryFromOutgoingSession not on macOS, ignoring", v15, 2u);
    }
  }

}

- (HistoryEntryRecentsItem)currentRouteHistoryEntry
{
  return self->_currentRouteHistoryEntry;
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_currentRouteHistoryEntry, 0);
}

@end
