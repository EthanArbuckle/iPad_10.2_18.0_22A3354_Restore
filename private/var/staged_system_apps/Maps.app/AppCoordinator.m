@implementation AppCoordinator

- (AppCoordinator)initWithPlatformController:(id)a3
{
  id v5;
  AppCoordinator *v6;
  AppCoordinator *v7;
  AppStateManager *v8;
  AppStateManager *appStateManager;
  AnalyticsMonitor *v10;
  AnalyticsMonitor *analyticsMonitor;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AppCoordinator;
  v6 = -[AppCoordinator init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    -[PlatformController addObserver:](v7->_platformController, "addObserver:", v7);
    v8 = -[AppStateManager initWithPlatformController:]([AppStateManager alloc], "initWithPlatformController:", v7->_platformController);
    appStateManager = v7->_appStateManager;
    v7->_appStateManager = v8;

    -[AppStateManager setAppCoordinator:](v7->_appStateManager, "setAppCoordinator:", v7);
    v10 = objc_alloc_init(AnalyticsMonitor);
    analyticsMonitor = v7->_analyticsMonitor;
    v7->_analyticsMonitor = v10;

  }
  return v7;
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **p_vtable;
  void *i;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  char *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  char *v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  unsigned __int8 v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  NSObject *v75;
  id v76;
  NSObject *v77;
  char *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  AppCoordinator *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id obj;
  id v90;
  uint64_t v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  int v102;
  _BYTE v103[128];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator observedNavigationSession](self, "observedNavigationSession"));
  v10 = v7;
  v11 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;

  v14 = v8;
  v15 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "meCard"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));

  if (v13 && v17)
  {
    v81 = v17;
    v82 = v14;
    v84 = self;
    v85 = v9;
    v86 = v10;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "configuration"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sharedTripPrefetchContext"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "automaticSharingContacts"));
    v80 = v21;
    objc_msgSend(v21, "setAutomaticSharingContacts:", v23);

    v90 = objc_alloc_init((Class)NSMutableArray);
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v83 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "waypointConfiguration"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "requests"));

    obj = v25;
    v26 = v87;
    v92 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
    if (!v92)
      goto LABEL_69;
    p_vtable = &OBJC_METACLASS___TwoLinesOutlineCellActionModel.vtable;
    v91 = *(_QWORD *)v94;
    while (1)
    {
      for (i = 0; i != v92; i = (char *)i + 1)
      {
        if (*(_QWORD *)v94 != v91)
          objc_enumerationMutation(obj);
        v29 = *(id *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
        v30 = objc_opt_class(p_vtable + 162);
        if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
          v31 = v29;
        else
          v31 = 0;
        v32 = v31;

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "address"));
          v34 = objc_msgSend(v33, "isMeCard");

          if ((v34 & 1) == 0)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "contact"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromCNContact:](MSPSharedTripContact, "contactsFromCNContact:", v35));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));

            if (v37)
            {
              objc_msgSend(v90, "addObject:", v37);
            }
            else
            {
              v38 = sub_1004318FC();
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v98 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                v99 = 2080;
                v100 = "AppCoordinator.m";
                v101 = 1024;
                v102 = 165;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100A70734())
              {
                v40 = sub_1004318FC();
                v41 = objc_claimAutoreleasedReturnValue(v40);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                {
                  v42 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                  *(_DWORD *)buf = 138412290;
                  v98 = v42;
                  _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                }
              }
            }

          }
        }
        v43 = v29;
        v44 = objc_opt_class(_TtC4Maps27FindMyHandleWaypointRequest);
        if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0)
          v45 = v43;
        else
          v45 = 0;
        v46 = v45;

        if (v46)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contact"));

          if (v47)
          {
            v48 = objc_alloc((Class)MSPSharedTripContact);
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contact"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "handleIdentifier"));
            v51 = objc_msgSend(v48, "initWithContact:handle:", v49, v50);

            if (v51)
            {
              objc_msgSend(v90, "addObject:", v51);
            }
            else
            {
              v52 = sub_1004318FC();
              v53 = objc_claimAutoreleasedReturnValue(v52);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v98 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                v99 = 2080;
                v100 = "AppCoordinator.m";
                v101 = 1024;
                v102 = 176;
                _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
              }

              if (sub_100A70734())
              {
                v54 = sub_1004318FC();
                v55 = objc_claimAutoreleasedReturnValue(v54);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  v56 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                  *(_DWORD *)buf = 138412290;
                  v98 = v56;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                }
              }
            }

          }
        }
        v57 = v43;
        v58 = objc_opt_class(GEOComposedWaypointRequest);
        if ((objc_opt_isKindOfClass(v57, v58) & 1) != 0)
          v59 = v57;
        else
          v59 = 0;
        v60 = v59;

        if (v60)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "waypoint"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "findMyHandle"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "contact"));

          if (v63)
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "findMyHandle"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contact"));

            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "findMyHandle"));
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "identifier"));
LABEL_50:

            if (v65)
            {
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "identifier"));
              v70 = objc_msgSend(v69, "isEqualToString:", v26);

              if ((v70 & 1) != 0)
              {
                p_vtable = (void **)(&OBJC_METACLASS___TwoLinesOutlineCellActionModel + 24);
              }
              else
              {
                if (v67)
                {
                  v71 = objc_msgSend(objc_alloc((Class)MSPSharedTripContact), "initWithContact:handle:", v65, v67);
                }
                else
                {
                  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "addressBookAddress"));
                  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "contact"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromCNContact:](MSPSharedTripContact, "contactsFromCNContact:", v72));
                  v71 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "firstObject"));

                  v26 = v87;
                }
                p_vtable = (void **)(&OBJC_METACLASS___TwoLinesOutlineCellActionModel + 24);
                if (v71)
                {
                  objc_msgSend(v90, "addObject:", v71);
                }
                else
                {
                  v74 = sub_1004318FC();
                  v75 = objc_claimAutoreleasedReturnValue(v74);
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315650;
                    v98 = "-[AppCoordinator platformController:willChangeCurrentSessionFromSession:toSession:]";
                    v99 = 2080;
                    v100 = "AppCoordinator.m";
                    v101 = 1024;
                    v102 = 206;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
                  }

                  p_vtable = (void **)(&OBJC_METACLASS___TwoLinesOutlineCellActionModel + 24);
                  if (sub_100A70734())
                  {
                    v76 = sub_1004318FC();
                    v77 = objc_claimAutoreleasedReturnValue(v76);
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                    {
                      v78 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                      *(_DWORD *)buf = 138412290;
                      v98 = v78;
                      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

                      v26 = v87;
                    }

                    p_vtable = (void **)(&OBJC_METACLASS___TwoLinesOutlineCellActionModel + 24);
                  }
                }

              }
            }
          }
          else
          {
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "addressBookAddress"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "contact"));

            if (v65)
            {
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "addressBookAddress"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "contact"));
              v67 = 0;
              goto LABEL_50;
            }
            v67 = 0;
          }

        }
      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      if (!v92)
      {
LABEL_69:

        v79 = objc_msgSend(v90, "copy");
        objc_msgSend(v80, "setRoutingToContacts:", v79);

        v9 = v85;
        v10 = v86;
        v13 = v83;
        self = v84;
        v17 = v81;
        v14 = v82;
        break;
      }
    }
  }
  -[AppCoordinator setObservedNavigationSession:](self, "setObservedNavigationSession:", v17);
  if (v9 && objc_msgSend(v9, "guidanceType") != (id)2)
    -[AppCoordinator _navigationSessionStopped:movingToSession:](self, "_navigationSessionStopped:movingToSession:", v9, v14);

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  GuidanceObserver *v12;
  id v13;

  v6 = objc_claimAutoreleasedReturnValue(-[AppCoordinator observedNavigationSession](self, "observedNavigationSession", a3, a4, a5));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator observedNavigationSession](self, "observedNavigationSession"));
    v9 = objc_msgSend(v8, "guidanceType");

    if (v9 == (id)2)
    {
      v13 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator observedNavigationSession](self, "observedNavigationSession"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRouteCollection"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRoute"));
      v12 = objc_opt_new(GuidanceObserver);
      -[AppCoordinator enterPedestrianARWithRoute:guidanceObserver:](self, "enterPedestrianARWithRoute:guidanceObserver:", v11, v12);

    }
  }
}

- (void)setObservedNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *observedNavigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](observedNavigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    -[NavigationSession addObserver:](self->_observedNavigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  if (v8)
    -[AppCoordinator _navigationSession:didChangeState:](self, "_navigationSession:didChangeState:", v8, a4);

}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "navigationType") == (id)3 || objc_msgSend(v8, "navigationType") == (id)2)
  {
    v6 = -[AppCoordinator _analyticsPipelineTransportModeForMSPTransportType:](self, "_analyticsPipelineTransportModeForMSPTransportType:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
    objc_msgSend(v7, "setMapUiShownActiveNavMode:", v6);

  }
}

- (void)_navigationSession:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 1)
    -[AppCoordinator _navigationSessionRunning:](self, "_navigationSessionRunning:", a3);
}

- (void)_navigationSessionRunning:(id)a3
{
  id v4;
  id v5;
  id v7;
  NSObject *v8;
  AppCoordinator *v9;
  AppCoordinator *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  id v17;
  NSObject *v18;
  AppCoordinator *v19;
  AppCoordinator *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char isKindOfClass;
  id v33;
  NSObject *v34;
  AppCoordinator *v35;
  AppCoordinator *v36;
  objc_class *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  NavModeController *v44;
  NavModeController *v45;
  void *v46;
  StepModeController *v47;
  StepModeController *stepModeController;
  id v49;
  NSObject *v50;
  AppCoordinator *v51;
  objc_class *v52;
  NSString *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  char v63;
  id v64;
  AppCoordinator *v65;
  AppCoordinator *v66;
  objc_class *v67;
  NSString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NavModeController *v73;
  NavModeController *v74;
  void *v75;
  StepModeController *v76;
  StepModeController *v77;
  const char *v78;
  id v79;
  AppCoordinator *v80;
  objc_class *v81;
  NSString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  uint8_t buf[4];
  __CFString *v92;
  __int16 v93;
  void *v94;

  v4 = a3;
  v5 = objc_msgSend(v4, "navigationType");
  if (v5 == (id)2 || v5 == (id)4)
  {
    v7 = sub_100431C0C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_24;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_13;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_13:

LABEL_24:
    *(_DWORD *)buf = 138543362;
    v92 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Navigation started stepping; will push step or transit mode",
      buf,
      0xCu);

LABEL_25:
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_1002D2EFC;
    v87[3] = &unk_1011AC8B0;
    v87[4] = self;
    v27 = &v88;
    v88 = v4;
    v28 = objc_retainBlock(v87);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topContext"));
    v31 = objc_opt_class(MapsCustomRouteViewContext);
    isKindOfClass = objc_opt_isKindOfClass(v30, v31);

    if ((isKindOfClass & 1) != 0)
    {
      v33 = sub_100431C0C();
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        goto LABEL_75;
      v35 = self;
      v36 = v35;
      if (!v35)
      {
        v42 = CFSTR("<nil>");
        goto LABEL_60;
      }
      v37 = (objc_class *)objc_opt_class(v35);
      v38 = NSStringFromClass(v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      if ((objc_opt_respondsToSelector(v36, "accessibilityIdentifier") & 1) != 0)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v36, "performSelector:", "accessibilityIdentifier"));
        v41 = v40;
        if (v40 && !objc_msgSend(v40, "isEqualToString:", v39))
        {
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v39, v36, v41));

          goto LABEL_33;
        }

      }
      v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v39, v36));
LABEL_33:

LABEL_60:
      *(_DWORD *)buf = 138543362;
      v92 = v42;
      v78 = "[%{public}@] User is starting stepping nav to a custom or curated route; leaving current context in place";
LABEL_74:
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, v78, buf, 0xCu);

      goto LABEL_75;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v44 = (NavModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topContext"));
    v45 = v44;
    if (v44 == self->_navModeController)
    {

    }
    else
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
      v47 = (StepModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topContext"));
      stepModeController = self->_stepModeController;

      if (v47 != stepModeController)
        goto LABEL_76;
    }
    v49 = sub_100431C0C();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      goto LABEL_70;
    v51 = self;
    v52 = (objc_class *)objc_opt_class(v51);
    v53 = NSStringFromClass(v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
    if ((objc_opt_respondsToSelector(v51, "accessibilityIdentifier") & 1) != 0)
    {
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v51, "performSelector:", "accessibilityIdentifier"));
      v56 = v55;
      if (v55 && !objc_msgSend(v55, "isEqualToString:", v54))
      {
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v54, v51, v56));

        goto LABEL_44;
      }

    }
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v54, v51));
LABEL_44:

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](v51, "chromeViewController"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topContext"));
    *(_DWORD *)buf = 138543618;
    v92 = v57;
    v93 = 2112;
    v94 = v59;
LABEL_69:
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}@] Current top mode is the nav mode or the step mode (%@); popping to root context first",
      buf,
      0x16u);

    goto LABEL_70;
  }
  if (v5 == (id)3)
  {
    v17 = sub_100431C0C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_47:

      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_1002D2C58;
      v89[3] = &unk_1011AC8B0;
      v89[4] = self;
      v27 = &v90;
      v90 = v4;
      v28 = objc_retainBlock(v89);
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "topContext"));
      v62 = objc_opt_class(MapsCustomRouteViewContext);
      v63 = objc_opt_isKindOfClass(v61, v62);

      if ((v63 & 1) != 0)
      {
        v64 = sub_100431C0C();
        v34 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          v65 = self;
          v66 = v65;
          if (!v65)
          {
            v42 = CFSTR("<nil>");
            goto LABEL_73;
          }
          v67 = (objc_class *)objc_opt_class(v65);
          v68 = NSStringFromClass(v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
          if ((objc_opt_respondsToSelector(v66, "accessibilityIdentifier") & 1) != 0)
          {
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v66, "performSelector:", "accessibilityIdentifier"));
            v71 = v70;
            if (v70 && !objc_msgSend(v70, "isEqualToString:", v69))
            {
              v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v69, v66, v71));

              goto LABEL_55;
            }

          }
          v42 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v69, v66));
LABEL_55:

LABEL_73:
          *(_DWORD *)buf = 138543362;
          v92 = v42;
          v78 = "[%{public}@] User is starting tbt nav to a custom or curated route; leaving current context in place";
          goto LABEL_74;
        }
LABEL_75:

        goto LABEL_76;
      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
      v73 = (NavModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "topContext"));
      v74 = v73;
      if (v73 == self->_navModeController)
      {

        goto LABEL_62;
      }
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
      v76 = (StepModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topContext"));
      v77 = self->_stepModeController;

      if (v76 == v77)
      {
LABEL_62:
        v79 = sub_100431C0C();
        v50 = objc_claimAutoreleasedReturnValue(v79);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v80 = self;
          v81 = (objc_class *)objc_opt_class(v80);
          v82 = NSStringFromClass(v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          if ((objc_opt_respondsToSelector(v80, "accessibilityIdentifier") & 1) != 0)
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v80, "performSelector:", "accessibilityIdentifier"));
            v85 = v84;
            if (v84 && !objc_msgSend(v84, "isEqualToString:", v83))
            {
              v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v83, v80, v85));

              goto LABEL_68;
            }

          }
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v83, v80));
LABEL_68:

          v58 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](v80, "chromeViewController"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "topContext"));
          *(_DWORD *)buf = 138543618;
          v92 = v57;
          v93 = 2112;
          v94 = v59;
          goto LABEL_69;
        }
LABEL_70:

        v86 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
        objc_msgSend(v86, "popToRootContextAnimated:completion:", 0, v28);

LABEL_77:
        goto LABEL_78;
      }
LABEL_76:
      ((void (*)(_QWORD *))v28[2])(v28);
      goto LABEL_77;
    }
    v19 = self;
    v20 = v19;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_46;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_22;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_22:

LABEL_46:
    *(_DWORD *)buf = 138543362;
    v92 = v26;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Navigation started turn-by-turn; will push nav mode",
      buf,
      0xCu);

    goto LABEL_47;
  }
LABEL_78:

}

- (void)_navigationSessionStopped:(id)a3 movingToSession:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  _QWORD *v16;
  id v17;
  id v18;
  NSObject *v19;
  AppCoordinator *v20;
  AppCoordinator *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  NSObject *v29;
  AppCoordinator *v30;
  AppCoordinator *v31;
  objc_class *v32;
  NSString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  char v45;
  id location;
  uint8_t buf[4];
  __CFString *v48;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = 1;
  }
  else
  {
    v12 = v7;
    v13 = objc_opt_class(RideBookingPlanningSession);
    isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    v11 = (v12 != 0) & isKindOfClass;
  }

  objc_initWeak(&location, self);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1002D354C;
  v42[3] = &unk_1011B0408;
  objc_copyWeak(&v44, &location);
  v45 = v11;
  v15 = v6;
  v43 = v15;
  v16 = objc_retainBlock(v42);
  v17 = objc_msgSend(v15, "navigationType");
  if (v17 == (id)2)
    goto LABEL_10;
  if (v17 != (id)3)
  {
    if (v17 != (id)4)
      goto LABEL_36;
LABEL_10:
    v18 = sub_100431C0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet))
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_lockScreenSceneDelegate](UIApplication, "_maps_lockScreenSceneDelegate"));
        objc_msgSend(v38, "mapsAppCoordinatorWillEndLockscreenSession");

      }
      -[AppCoordinator _popSteppingModeWithCompletion:](self, "_popSteppingModeWithCompletion:", v16);
      goto LABEL_36;
    }
    v20 = self;
    v21 = v20;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
      goto LABEL_27;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && (objc_msgSend(v25, "isEqualToString:", v24) & 1) == 0)
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_17;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_17:

LABEL_27:
    *(_DWORD *)buf = 138543362;
    v48 = v27;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Stepping navigation stopped; will pop step mode",
      buf,
      0xCu);

    goto LABEL_28;
  }
  v28 = sub_100431C0C();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = self;
    v31 = v30;
    if (!v30)
    {
      v37 = CFSTR("<nil>");
      goto LABEL_32;
    }
    v32 = (objc_class *)objc_opt_class(v30);
    v33 = NSStringFromClass(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    if ((objc_opt_respondsToSelector(v31, "accessibilityIdentifier") & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v31, "performSelector:", "accessibilityIdentifier"));
      v36 = v35;
      if (v35 && (objc_msgSend(v35, "isEqualToString:", v34) & 1) == 0)
      {
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v34, v31, v36));

        goto LABEL_25;
      }

    }
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v34, v31));
LABEL_25:

LABEL_32:
    *(_DWORD *)buf = 138543362;
    v48 = v37;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] Turn-by-turn navigation stopped; will pop nav mode",
      buf,
      0xCu);

  }
  if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_lockScreenSceneDelegate](UIApplication, "_maps_lockScreenSceneDelegate"));
    objc_msgSend(v39, "mapsAppCoordinatorWillEndLockscreenSession");

  }
  -[AppCoordinator _popNavModeWithCompletion:](self, "_popNavModeWithCompletion:", v16);
LABEL_36:
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v40, "setMapUiShownActiveNavMode:", 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[GEOAPSharedStateData sharedData](GEOAPSharedStateData, "sharedData"));
  objc_msgSend(v41, "setHasMapUiShownActiveNavMode:", 0);

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);

}

- (BOOL)isNavigationTurnByTurnOrStepping
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator observedNavigationSession](self, "observedNavigationSession"));
  if (!v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appSessionController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentlyNavigatingPlatformController"));

    if (v5 != v8)
    {
      v3 = 0;
      LOBYTE(v4) = 0;
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSession"));

    v11 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v3, v11) & 1) != 0)
      v12 = v3;
    else
      v12 = 0;
    v4 = v12;

    if (!v4)
    {
      v3 = 0;
      goto LABEL_7;
    }
  }
  LOBYTE(v4) = objc_msgSend(v3, "navigationType") == (id)3 || objc_msgSend(v3, "navigationType") == (id)2;
LABEL_7:

  return (char)v4;
}

- (int)_analyticsPipelineTransportModeForMSPTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 5)
    return a3;
  else
    return 0;
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topIOSBasedContext"));
  v7 = objc_opt_respondsToSelector(v6, "getCurrentSceneTitleWithCompletion:");

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_chromeViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topIOSBasedContext"));
    objc_msgSend(v9, "getCurrentSceneTitleWithCompletion:", v10);

  }
}

- (BaseModeController)baseModeController
{
  BaseModeController *baseModeController;
  BaseModeController *v4;
  void *v5;
  BaseModeController *v6;
  BaseModeController *v7;

  baseModeController = self->_baseModeController;
  if (!baseModeController)
  {
    v4 = [BaseModeController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v6 = -[BaseModeController initWithPlatformController:](v4, "initWithPlatformController:", v5);
    v7 = self->_baseModeController;
    self->_baseModeController = v6;

    baseModeController = self->_baseModeController;
  }
  return baseModeController;
}

- (ActionCoordination)baseActionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionCoordinator"));

  return (ActionCoordination *)v3;
}

- (void)startSearchModeWithCompletion:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));

  if (v5 != v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
    objc_msgSend(v7, "setAppCoordinator:", self);

    v8 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));
    objc_msgSend(v8, "pushContext:animated:completion:", v9, 0, v10);

  }
}

- (void)openSearch:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AppCoordinator startSearchModeWithCompletion:](self, "startSearchModeWithCompletion:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v8, "viewController:doSearchItem:withUserInfo:", 0, v7, v6);

}

- (void)openSearch:(id)a3 andResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  _UNKNOWN **v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isSearchAlongRoute"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v9 = objc_msgSend(v8, "isCarAppSceneHostingNavigation");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v13 = CFSTR("Source");
      v14 = &off_10126CAC0;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v12 = objc_msgSend(v10, "processSearchFieldItem:searchInfo:userInfo:", v6, v7, v11);

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
      objc_msgSend(v10, "setCurrentSearchInfo:", v7);
    }
  }
  else
  {
    -[AppCoordinator startSearchModeWithCompletion:](self, "startSearchModeWithCompletion:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
    objc_msgSend(v10, "restoreSearchForItem:withResults:sessionOrigin:", v6, v7, 2);
  }

}

- (void)addStopWithMapItem:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] adding stop with MapItem: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v16, "detourToMapItem:", v4);

}

- (void)addStopWithWaypoint:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] adding stop with waypoint: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v16, "detourToWaypoint:", v4);

}

- (void)openCollection:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D3F44;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v7);

}

- (BOOL)isRoutePlanningPresented
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  v3 = objc_msgSend(v2, "isRoutePlanningPresented");

  return v3;
}

- (void)toggleRoutePlanning
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002D402C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v4);

}

- (void)enterRoutePlanningWithDirectionItem:(id)a3 withUserInfo:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D4118;
  v11[3] = &unk_1011AD238;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v11);

}

- (void)enterRouteCreationWithMapItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_hikeAssociatedInfo"));
  v9 = objc_msgSend(v8, "encryptedTourMuid");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002D4288;
  v12[3] = &unk_1011B0480;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v13 = v10;
  v11 = v7;
  v14 = v11;
  +[MapsSavedRoutesManager fetchSavedRoutesWithTourMuid:completion:](MapsSavedRoutesManager, "fetchSavedRoutesWithTourMuid:completion:", v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)enterRouteCreationWithRoute:(id)a3 originMapItem:(id)a4 destinationMapItem:(id)a5 userInfo:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  MapsCustomRouteViewContext *v22;
  id WeakRetained;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!-[AppCoordinator isPresentingRouteCreation](self, "isPresentingRouteCreation"))
  {
    -[AppCoordinator setIsPresentingRouteCreation:](self, "setIsPresentingRouteCreation:", 1);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1002D47C8;
    v26[3] = &unk_1011ACAD0;
    v26[4] = self;
    v27 = v16;
    v17 = objc_retainBlock(v26);
    v18 = sub_1004320DC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Presenting route editing", buf, 2u);
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DirectionsRouteUUIDKey")));
      v22 = -[MapsCustomRouteViewContext initWithExistingRoute:]([MapsCustomRouteViewContext alloc], "initWithExistingRoute:", v12);
      -[MapsCustomRouteViewContext setHistoryUUID:](v22, "setHistoryUUID:", v21);
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138477827;
        v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Presenting route creation with mapItem: %{private}@", buf, 0xCu);
      }

      if (v14)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mapSelectionManager"));
        objc_msgSend(v24, "selectMapItem:animated:", v14, 1);

      }
      if (v13)
      {
        v28 = v13;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
      }
      else
      {
        v21 = 0;
      }
      v22 = -[MapsRouteCreationContext initWithExistingMapItems:]([MapsRouteCreationContext alloc], "initWithExistingMapItems:", v21);
    }
    v25 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(v25, "pushContext:animated:completion:", v22, 1, v17);

  }
}

- (void)openParentMapItem:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D4894;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v7);

}

- (void)openRelatedMapItems:(id)a3 withTitle:(id)a4 originalMapItem:(id)a5 analyticsDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002D49E0;
  v19[3] = &unk_1011B04A8;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v19);

}

- (void)openCuratedCollectionWithIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D4AC0;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v7);

}

- (void)openGuidesHomeWithGuideLocation:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D4B9C;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v7);

}

- (void)openPublisherWithIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D4C78;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v7);

}

- (void)openAllCuratedCollections
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002D4D28;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v4);

}

- (void)openCuratedCollectionsList:(id)a3 usingTitle:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002D4E14;
  v11[3] = &unk_1011AD238;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v11);

}

- (void)presentPOIEnrichmentWithCoordinator:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v5, "viewControllerPresentPOIEnrichmentWithCoordinator:", v4);

}

- (void)openUserProfile
{
  id WeakRetained;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002D4F1C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v4);

}

- (void)openVehicleList
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "virtualGarageForceFetchAllVehicles");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v4, "viewControllerPresentVirtualGarage:", 0);

}

- (void)viewControllerShowOfflineMaps:(id)a3
{
  id WeakRetained;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002D501C;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v5);

}

- (void)viewControllerShowExpiredOfflineMaps:(id)a3
{
  id WeakRetained;
  _QWORD v5[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002D50C0;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v5);

}

- (void)showOfflineMapRegionSelectorForRegion:(id)a3 name:(id)a4 pushDataManagementFirst:(BOOL)a5
{
  id v8;
  id v9;
  id WeakRetained;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v8 = a3;
  v9 = a4;
  if (GEOSupportsOfflineMaps())
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002D51C4;
    v11[3] = &unk_1011AED08;
    v14 = a5;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 1, v11);

  }
}

- (NavModeController)navModeController
{
  NavModeController *navModeController;
  NavModeController *v4;
  void *v5;
  NavModeController *v6;
  NavModeController *v7;

  navModeController = self->_navModeController;
  if (!navModeController)
  {
    v4 = [NavModeController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v6 = -[NavModeController initWithPlatformController:](v4, "initWithPlatformController:", v5);
    v7 = self->_navModeController;
    self->_navModeController = v6;

    navModeController = self->_navModeController;
  }
  return navModeController;
}

- (IOSTransitNavigationContext)transitNavigationContext
{
  IOSTransitNavigationContext *transitNavigationContext;
  IOSTransitNavigationContext *v4;
  IOSTransitNavigationContext *v5;

  transitNavigationContext = self->_transitNavigationContext;
  if (!transitNavigationContext)
  {
    v4 = objc_alloc_init(IOSTransitNavigationContext);
    v5 = self->_transitNavigationContext;
    self->_transitNavigationContext = v4;

    transitNavigationContext = self->_transitNavigationContext;
  }
  return transitNavigationContext;
}

- (NavActionCoordination)navActionCoordinator
{
  return -[NavModeController actionCoordinator](self->_navModeController, "actionCoordinator");
}

- (StepActionCoordination)stepActionCoordinator
{
  return -[StepModeController actionCoordinator](self->_stepModeController, "actionCoordinator");
}

- (void)startNavigationWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4
{
  id v6;
  __int128 v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  AppCoordinator *v16;
  AppCoordinator *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
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
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  AppCoordinator *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unint64_t navigationModeContext;
  id location;
  uint8_t buf[4];
  __CFString *v53;

  v6 = a3;
  objc_initWeak(&location, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1002D5838;
  v43[3] = &unk_1011B04F8;
  objc_copyWeak(&v46, &location);
  v36 = v6;
  v44 = v36;
  v45 = self;
  v7 = *(_OWORD *)&a4->guidanceType;
  v47 = *(_OWORD *)&a4->shouldSimulateLocations;
  v48 = v7;
  v49 = *(_OWORD *)&a4->isReconnecting;
  navigationModeContext = a4->navigationModeContext;
  v8 = objc_retainBlock(v43);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appSessionController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentlyNavigatingPlatformController"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v13 = v11 == v12;

    if (!v13)
    {
      v14 = sub_100431C0C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
LABEL_14:

        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Route in Progress"), CFSTR("localized string not found"), 0));

        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Are you sure you want to end navigation?"), CFSTR("localized string not found"), 0));

        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v35, v34, 1));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("localized string not found"), 0));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = sub_1002D6080;
        v41[3] = &unk_1011AFA88;
        objc_copyWeak(&v42, &location);
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 1, v41));
        objc_msgSend(v26, "addAction:", v29);

        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("End Navigation"), CFSTR("localized string not found"), 0));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1002D6208;
        v37[3] = &unk_1011B0548;
        objc_copyWeak(&v40, &location);
        v38 = v11;
        v39 = v8;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v31, 0, v37));
        objc_msgSend(v26, "addAction:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
        objc_msgSend(v33, "_maps_topMostPresentViewController:animated:completion:", v26, 1, 0);

        objc_destroyWeak(&v40);
        objc_destroyWeak(&v42);

        goto LABEL_15;
      }
      v16 = self;
      v17 = v16;
      if (!v16)
      {
        v23 = CFSTR("<nil>");
        goto LABEL_13;
      }
      v18 = (objc_class *)objc_opt_class(v16);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
        v22 = v21;
        if (v21 && (objc_msgSend(v21, "isEqualToString:", v20) & 1) == 0)
        {
          v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

          goto LABEL_10;
        }

      }
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_10:

LABEL_13:
      *(_DWORD *)buf = 138543362;
      v53 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%{public}@] Ask for kMapsInterruptionMaybeEndNavigation", buf, 0xCu);

      goto LABEL_14;
    }
  }
  ((void (*)(_QWORD *))v8[2])(v8);
LABEL_15:

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);

}

- (void)endNavigationWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002D6820;
  v7[3] = &unk_1011B0520;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6 = objc_retainBlock(v7);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    ((void (*)(_QWORD *))v6[2])(v6);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)endNavigationAndReturnToRoutePlanning:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id dismissNavigationCompletion;
  void *v25;
  void *v26;
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  unint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  MapsCustomRouteViewContext *v45;
  id v46;
  void *v47;
  MapsCustomRouteViewContext *v48;
  void *v49;
  void **v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  uint8_t buf[4];
  __CFString *v55;
  __int16 v56;
  _BOOL4 v57;

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v55 = v14;
  v56 = 1024;
  v57 = v3;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] endNavigationAndReturnToRoutePlanning: %d", buf, 0x12u);

LABEL_11:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentSession"));

  v17 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = v16;
  else
    v18 = 0;
  v19 = v18;

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sessionStack"));
    v22 = sub_10039E1FC(v21, &stru_1011B0588);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    dismissNavigationCompletion = self->_dismissNavigationCompletion;
    self->_dismissNavigationCompletion = 0;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v26 = v25;
    if (v3)
    {
      objc_msgSend(v25, "popUntil:", &stru_1011B05C8);
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v25, "clearSessions");

    p_chromeViewController = &self->_chromeViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contexts"));
    v30 = objc_msgSend(v29, "count");

    if (!v30)
    {
LABEL_34:

      goto LABEL_35;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentRouteCollection"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentRoute"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "destination"));

    v34 = objc_opt_class(GEOComposedWaypointToRoute);
    if ((objc_opt_isKindOfClass(v33, v34) & 1) != 0)
      v35 = v33;
    else
      v35 = 0;
    v36 = v35;

    if (v36)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "route"));
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentRouteCollection"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "currentRoute"));

    }
    v38 = (unint64_t)objc_msgSend(v26, "source") & 0xFFFFFFFFFFFFFFFELL;
    v39 = objc_loadWeakRetained((id *)p_chromeViewController);
    v40 = v39;
    if (v38 == 2)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "contexts"));
      v42 = objc_msgSend(v41, "indexOfObjectPassingTest:", &stru_1011B0608);

      if (v42 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = (MapsCustomRouteViewContext *)objc_loadWeakRetained((id *)p_chromeViewController);
        v46 = (id)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext contexts](v48, "contexts"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "_maps_subarrayToIndex:", v42));
        -[MapsCustomRouteViewContext setContexts:animated:completion:](v48, "setContexts:animated:completion:", v47, 1, 0);
        v45 = v48;
        goto LABEL_32;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configuration"));
      v44 = objc_msgSend(v43, "source");

      if (v44 == (id)1)
      {
        v45 = -[MapsCustomRouteViewContext initWithExistingRoute:]([MapsCustomRouteViewContext alloc], "initWithExistingRoute:", v26);
        v46 = objc_loadWeakRetained((id *)p_chromeViewController);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contexts"));
        v48 = (MapsCustomRouteViewContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "firstObject"));
        v53[0] = v48;
        v53[1] = v45;
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 2));
        objc_msgSend(v46, "setContexts:animated:completion:", v49, 1, 0);

LABEL_32:
        goto LABEL_33;
      }
      v45 = (MapsCustomRouteViewContext *)objc_loadWeakRetained((id *)p_chromeViewController);
      v46 = (id)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext contexts](v45, "contexts"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
      v52 = v47;
      v50 = &v52;
    }
    else
    {
      v45 = (MapsCustomRouteViewContext *)v39;
      v46 = (id)objc_claimAutoreleasedReturnValue(-[MapsCustomRouteViewContext contexts](v45, "contexts"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "firstObject"));
      v51 = v47;
      v50 = &v51;
    }
    v48 = (MapsCustomRouteViewContext *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 1));
    -[MapsCustomRouteViewContext setContexts:animated:completion:](v45, "setContexts:animated:completion:", v48, 1, 0);

    goto LABEL_32;
  }
LABEL_35:

}

- (BOOL)applyPendingActionIfNeeded
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsActionController"));
  v5 = objc_msgSend(v4, "pendingAction");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapsActionController"));
    objc_msgSend(v7, "navigationEnded");

  }
  return v5;
}

- (void)_popNavModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id WeakRetained;
  NavModeController *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char isKindOfClass;
  id v25;
  NavModeController *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  NavModeController *navModeController;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  NavModeController *v36;
  id v37;
  char v38;
  uint8_t buf[4];
  __CFString *v40;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v40 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Popping nav mode", buf, 0xCu);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapsActionController"));
  v17 = objc_msgSend(v16, "pendingAction");

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "updateThemeForVisualEffectStyle:", 0);

  v19 = self->_navModeController;
  v20 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "window"));
  v23 = objc_opt_class(EventSourceWindow);
  isKindOfClass = objc_opt_isKindOfClass(v22, v23);

  objc_initWeak((id *)buf, self);
  v25 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1002D7378;
  v35[3] = &unk_1011B0630;
  v38 = isKindOfClass & 1;
  v26 = v19;
  v36 = v26;
  objc_copyWeak(&v37, (id *)buf);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1002D748C;
  v32[3] = &unk_1011B0658;
  objc_copyWeak(&v34, (id *)buf);
  v27 = v4;
  v33 = v27;
  objc_msgSend(v25, "scheduleCoordinatedContextChange:completionHandler:", v35, v32);

  if ((v17 & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
    v29 = objc_msgSend(v28, "visibleViewModeBeforeDoingDirectionItem") == (id)3;

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
      objc_msgSend(v30, "updateViewMode:animated:", 3, 0);

    }
  }
  navModeController = self->_navModeController;
  self->_navModeController = 0;

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v37);

  objc_destroyWeak((id *)buf);
}

- (void)_popSteppingModeWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id WeakRetained;
  StepModeController *v16;
  StepModeController *v17;
  id v18;
  IOSTransitNavigationContext *v19;
  IOSTransitNavigationContext *transitNavigationContext;
  id v21;
  NSObject *v22;
  AppCoordinator *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  StepModeController *stepModeController;
  IOSTransitNavigationContext *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  void *v43;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v41 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Popping step mode", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v16 = (StepModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v17 = v16;
  if (v16 == self->_stepModeController)
  {

    goto LABEL_22;
  }
  v18 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v19 = (IOSTransitNavigationContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topContext"));
  transitNavigationContext = self->_transitNavigationContext;

  if (v19 == transitNavigationContext)
  {
LABEL_22:
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
    objc_msgSend(v32, "setAppCoordinator:", 0);

    stepModeController = self->_stepModeController;
    self->_stepModeController = 0;

    v34 = self->_transitNavigationContext;
    self->_transitNavigationContext = 0;

    v35 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(v35, "updateThemeForVisualEffectStyle:", 0);

    v36 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1002D7928;
    v38[3] = &unk_1011AE240;
    v38[4] = self;
    v39 = v4;
    objc_msgSend(v36, "popContextAnimated:completion:", 1, v38);

    v37 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(v37, "commitCoordinatedContextChange");

    goto LABEL_23;
  }
  v21 = sub_100431C0C();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = self;
    v24 = (objc_class *)objc_opt_class(v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_19;
      }

    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_19:

    v30 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topContext"));
    *(_DWORD *)buf = 138543618;
    v41 = v29;
    v42 = 2112;
    v43 = v31;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] The top mode is currently not the step mode nor the transit mode (%@); will apply pending action and return",
      buf,
      0x16u);

  }
  -[AppCoordinator applyPendingActionIfNeeded](self, "applyPendingActionIfNeeded");
LABEL_23:

}

- (void)displayTransitSchedulesForMapItem:(id)a3 departureSequence:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _TtC4Maps23TransitSchedulesContext *v9;

  v6 = a4;
  v7 = a3;
  v9 = -[TransitSchedulesContext initWithMapItem:departureSequence:]([_TtC4Maps23TransitSchedulesContext alloc], "initWithMapItem:departureSequence:", v7, v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "pushContext:animated:completion:", v9, 1, 0);

}

- (void)displayTransitSchedulesForRouteStep:(id)a3
{
  id v4;
  id WeakRetained;
  _TtC4Maps23TransitSchedulesContext *v6;

  v4 = a3;
  v6 = -[TransitSchedulesContext initWithRouteStep:]([_TtC4Maps23TransitSchedulesContext alloc], "initWithRouteStep:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "pushContext:animated:completion:", v6, 1, 0);

}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v8, "displayIncidentReportSubmissionWithItem:report:", v7, v6);

}

- (void)startRideBookingSessionWithRideBookingRideOption:(id)a3
{
  id v4;
  RidesharingModeController *v5;
  RidesharingModeController *ridesharingModeController;
  RidesharingModeController *v7;
  id WeakRetained;

  v4 = a3;
  v5 = -[RidesharingModeController initWithRideOption:]([RidesharingModeController alloc], "initWithRideOption:", v4);

  ridesharingModeController = self->_ridesharingModeController;
  self->_ridesharingModeController = v5;
  v7 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "pushContext:animated:completion:", v7, 1, 0);

}

- (void)continueRideBookingSessionWithApplicationIdentifier:(id)a3
{
  id v4;
  RidesharingModeController *v5;
  RidesharingModeController *ridesharingModeController;
  RidesharingModeController *v7;
  id WeakRetained;

  v4 = a3;
  v5 = -[RidesharingModeController initWithApplicationIdentifier:]([RidesharingModeController alloc], "initWithApplicationIdentifier:", v4);

  ridesharingModeController = self->_ridesharingModeController;
  self->_ridesharingModeController = v5;
  v7 = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  objc_msgSend(WeakRetained, "pushContext:animated:completion:", v7, 1, 0);

}

- (void)dismissRidesharingSessionAndReturnToRoutePlanning:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[5];

  v3 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002D7D50;
  v15[3] = &unk_1011AC860;
  v15[4] = self;
  v5 = objc_retainBlock(v15);
  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v8 = WeakRetained;
  if (v3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator ridesharingModeController](self, "ridesharingModeController"));

    if (v9 == v10)
    {
      v12 = objc_loadWeakRetained((id *)p_chromeViewController);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1002D7E5C;
      v13[3] = &unk_1011ADA00;
      v14 = v5;
      objc_msgSend(v12, "popContextAnimated:completion:", 1, v13);

    }
    else
    {
      ((void (*)(_QWORD *))v5[2])(v5);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "popToRootContextAnimated:completion:", 0, 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    objc_msgSend(v11, "clearSessions");

  }
}

- (void)showFullscreenDirectionsList
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002D7EC0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)hideFullscreenDirectionsList
{
  -[NavModeController setShowFullScreenDirectionsList:](self->_navModeController, "setShowFullScreenDirectionsList:", 0);
}

- (void)enterFlyoverForMapItem:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  FlyoverModeController *v10;

  p_chromeViewController = &self->_chromeViewController;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_currentContainerViewController"));
  objc_msgSend(v7, "setContaineesHidden:", 1);

  v10 = -[FlyoverModeController initWithMapItem:]([FlyoverModeController alloc], "initWithMapItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverModeController actionCoordinator](v10, "actionCoordinator"));
  objc_msgSend(v8, "setAppCoordinator:", self);
  v9 = objc_loadWeakRetained((id *)p_chromeViewController);
  objc_msgSend(v9, "pushContext:animated:completion:", v10, 1, 0);

}

- (void)exitFlyover
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v5 = objc_opt_class(FlyoverModeController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    objc_msgSend(v7, "popContextAnimated:completion:", 1, 0);

  }
}

- (void)shareItem:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  MapsActivityViewController *v10;
  MapsActivityViewController *shareViewController;
  MapsActivityViewController *v12;
  id v13;

  v8 = a5;
  v13 = a4;
  v9 = a3;
  v10 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v9);

  -[MapsActivityViewController setMapsActivityDelegate:](v10, "setMapsActivityDelegate:", self);
  shareViewController = self->_shareViewController;
  self->_shareViewController = v10;
  v12 = v10;

  -[AppCoordinator _presentActivityViewController:sourceView:completion:](self, "_presentActivityViewController:sourceView:completion:", self->_shareViewController, v13, v8);
}

- (void)shareCollection:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PersonalCollectionShareItemSource *v12;
  MapsActivityViewController *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  char *v19;
  int v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "canShare") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharingURL"));
    if (v11)
    {
      v12 = -[PersonalCollectionShareItemSource initWithCollectionHandlerInfo:]([PersonalCollectionShareItemSource alloc], "initWithCollectionHandlerInfo:", v8);
      v13 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v12);
      -[AppCoordinator _presentActivityViewController:sourceView:completion:](self, "_presentActivityViewController:sourceView:completion:", v13, v9, v10);

    }
  }
  else
  {
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempting to share an empty collection. Share action should be disabled or hidden on the UI")));
      v20 = 136315906;
      v21 = "-[AppCoordinator shareCollection:sourceView:completion:]";
      v22 = 2080;
      v23 = "AppCoordinator.m";
      v24 = 1024;
      v25 = 1046;
      v26 = 2112;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", (uint8_t *)&v20, 0x26u);

    }
    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v20 = 138412290;
        v21 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);

      }
    }
  }

}

- (void)shareCuratedCollection:(id)a3 withRefinedMapItems:(id)a4 sourceView:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CuratedCollectionShareItemSource *v14;
  MapsActivityViewController *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "collectionURL"));
  if (v13)
  {
    v14 = -[CuratedCollectionShareItemSource initWithPlaceCollection:refinedMapItems:]([CuratedCollectionShareItemSource alloc], "initWithPlaceCollection:refinedMapItems:", v16, v10);
    v15 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v14);
    -[AppCoordinator _presentActivityViewController:sourceView:completion:](self, "_presentActivityViewController:sourceView:completion:", v15, v11, v12);

  }
}

- (void)sharePublisher:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CuratedCollectionShareItemSource *v11;
  MapsActivityViewController *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisherURL"));
  if (v10)
  {
    v11 = -[CuratedCollectionShareItemSource initWithPublisher:]([CuratedCollectionShareItemSource alloc], "initWithPublisher:", v13);
    v12 = -[MapsActivityViewController initWithShareItem:]([MapsActivityViewController alloc], "initWithShareItem:", v11);
    -[AppCoordinator _presentActivityViewController:sourceView:completion:](self, "_presentActivityViewController:sourceView:completion:", v12, v8, v9);

  }
}

- (void)_presentActivityViewController:(id)a3 sourceView:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double MidX;
  double v14;
  double MidY;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  CGRect v29;
  CGRect v30;

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = v8;
    v11 = a3;
    objc_msgSend(v10, "bounds");
    MidX = v12;
    MidY = v14;
    v17 = v16;
    v19 = v18;
  }
  else
  {
    v20 = a3;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "view"));

    objc_msgSend(v10, "bounds");
    MidX = CGRectGetMidX(v29);
    objc_msgSend(v10, "bounds");
    MidY = CGRectGetMidY(v30);
    v17 = 1.0;
    v19 = 1.0;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "popoverPresentationController"));
  objc_msgSend(v22, "setSourceView:", v10);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "popoverPresentationController"));
  objc_msgSend(v23, "setSourceRect:", MidX, MidY, v17, v19);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "popoverPresentationController"));
  objc_msgSend(v24, "setPermittedArrowDirections:", 15);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1002D8684;
  v27[3] = &unk_1011ADA00;
  v28 = v9;
  v26 = v9;
  objc_msgSend(v25, "_maps_topMostPresentViewController:animated:completion:", a3, 1, v27);

}

- (void)startTableBookingFlowFromMapItem:(id)a3
{
  id v4;
  void *v5;
  PlaceCardItem *v6;

  v4 = a3;
  v6 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v5, "viewController:displayTableBookingFor:", 0, v6);

}

- (void)editLocationForParkedCar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  objc_msgSend(v5, "viewController:editLocationForParkedCar:", 0, v4);

}

- (void)archiveMapsActivity
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator mapsSceneDelegate](self, "mapsSceneDelegate"));
  objc_msgSend(v2, "archiveMapsActivity");

}

- (void)setNeedsUserActivityUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator mapsSceneDelegate](self, "mapsSceneDelegate"));
  objc_msgSend(v2, "setNeedsUserActivityUpdate");

}

- (MKMapView)mapsActivityMapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (void)mapsActivityViewControllerPrint:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));
    objc_msgSend(v5, "printRoute:", v6);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSession currentSearchSession](SearchSession, "currentSearchSession"));
    objc_msgSend(v5, "printSearchResultFromSession:", v6);
  }

}

- (void)mapsActivityViewControllerPresentRoutingApps:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));

  if (v5 == v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
    objc_msgSend(v7, "presentRoutePlanningViewType:", 6);

  }
}

- (void)mapsActivityViewController:(id)a3 activityCompleted:(BOOL)a4
{
  -[AppCoordinator dismissShareIfNeededAnimated:](self, "dismissShareIfNeededAnimated:", 1, a4);
}

- (void)dismissShareIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  MapsActivityViewController *v6;
  MapsActivityViewController *shareViewController;
  void *v8;
  MapsActivityViewController *v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v6 = (MapsActivityViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
  shareViewController = self->_shareViewController;

  if (v6 == shareViewController)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v3, 0);

  }
  v9 = self->_shareViewController;
  self->_shareViewController = 0;

}

- (void)displayOrScheduleDisplayOfEnqueuedFixedProblem:(id)a3
{
  id v4;
  id fixedProblemCompletion;

  v4 = objc_msgSend(a3, "copy");
  fixedProblemCompletion = self->_fixedProblemCompletion;
  self->_fixedProblemCompletion = v4;

  -[AppCoordinator _displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:](self, "_displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:", 0);
}

- (void)displayAnyEnqueuedFixedProblemNotification
{
  -[AppCoordinator _displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:](self, "_displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:", 1);
}

- (void)_displayOrScheduleDisplayOfEnqueuedFixedProblemInvokedAfterWait:(BOOL)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id fixedProblemCompletion;
  _QWORD v13[4];
  id v14;
  BOOL v15;

  if (self->_fixedProblemCompletion)
  {
    p_chromeViewController = &self->_chromeViewController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));

    if (v7 == v8)
    {
      v9 = objc_retainBlock(self->_fixedProblemCompletion);
      v10 = objc_loadWeakRetained((id *)p_chromeViewController);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1002D8AF0;
      v13[3] = &unk_1011B06A0;
      v14 = v9;
      v15 = a3;
      v11 = v9;
      objc_msgSend(v10, "dismissAllModalViewsIfPresentAnimated:completion:", 1, v13);

      fixedProblemCompletion = self->_fixedProblemCompletion;
      self->_fixedProblemCompletion = 0;

    }
  }
}

- (void)openSharedTrips
{
  -[AppCoordinator openSharedTrip:](self, "openSharedTrip:", 0);
}

- (void)_openSharedTrip:(id)a3
{
  __CFString *v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  AppCoordinator *v18;
  AppCoordinator *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  id v26;
  NSObject *v27;
  AppCoordinator *v28;
  AppCoordinator *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  id v36;
  AppCoordinator *v37;
  AppCoordinator *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  __CFString *v49;
  id v50;
  __CFString *v51;
  uint64_t UInteger;
  __CFString *v53;
  uint64_t v54;
  _QWORD v55[4];
  __CFString *v56;
  AppCoordinator *v57;
  _QWORD v58[5];
  __CFString *v59;
  __CFString *v60;
  uint8_t buf[4];
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  unint64_t v68;
  __int16 v69;
  unsigned int v70;

  v4 = (__CFString *)a3;
  if (MSPSharedTripReceivingAvailable())
  {
    v5 = sub_10043237C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      if (v4)
      {
        if (-[__CFString disallowDetailsForChina](v4, "disallowDetailsForChina"))
        {
          v16 = sub_10043237C();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
LABEL_48:

            -[AppCoordinator presentChinaAlertForSharedTrip:](self, "presentChinaAlertForSharedTrip:", v4);
            goto LABEL_59;
          }
          v18 = self;
          v19 = v18;
          if (!v18)
          {
            v25 = CFSTR("<nil>");
            goto LABEL_47;
          }
          v20 = (objc_class *)objc_opt_class(v18);
          v21 = NSStringFromClass(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
          if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
            v24 = v23;
            if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
            {
              v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

              goto LABEL_21;
            }

          }
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_21:

LABEL_47:
          *(_DWORD *)buf = 138543618;
          v62 = v25;
          v63 = 2112;
          v64 = v4;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip is not allowed for China: %@", buf, 0x16u);

          goto LABEL_48;
        }
        if (-[__CFString disallowDetailsForTransportType](v4, "disallowDetailsForTransportType"))
        {
          v26 = sub_10043237C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = self;
            v29 = v28;
            if (!v28)
            {
              v35 = CFSTR("<nil>");
              goto LABEL_51;
            }
            v30 = (objc_class *)objc_opt_class(v28);
            v31 = NSStringFromClass(v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
            {
              v33 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
              v34 = v33;
              if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
              {
                v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

                goto LABEL_30;
              }

            }
            v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_30:

LABEL_51:
            v49 = v35;
            v50 = -[__CFString transportType](v4, "transportType");
            if (v50 >= 7)
              v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v50));
            else
              v51 = off_1011B0738[(int)v50];
            UInteger = GEOConfigGetUInteger(GEOConfigMSPShareETASupportedReceivingTransportTypes[0], GEOConfigMSPShareETASupportedReceivingTransportTypes[1]);
            *(_DWORD *)buf = 138544130;
            v62 = v49;
            v63 = 2112;
            v64 = v51;
            v65 = 2048;
            v66 = UInteger;
            v67 = 2112;
            v68 = (unint64_t)v4;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip is not allowed for transport type: %@. Allowed transport type bitmask: %lu. Trip: %@", buf, 0x2Au);

          }
LABEL_58:

          -[AppCoordinator presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:](self, "presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:", v4);
          goto LABEL_59;
        }
        if (-[__CFString disallowDetailsForProtocolVersion](v4, "disallowDetailsForProtocolVersion"))
        {
          v36 = sub_10043237C();
          v27 = objc_claimAutoreleasedReturnValue(v36);
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_58;
          v37 = self;
          v38 = v37;
          if (!v37)
          {
            v44 = CFSTR("<nil>");
            goto LABEL_57;
          }
          v39 = (objc_class *)objc_opt_class(v37);
          v40 = NSStringFromClass(v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
          if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
            v43 = v42;
            if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
            {
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

              goto LABEL_39;
            }

          }
          v44 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_39:

LABEL_57:
          v53 = (__CFString *)-[__CFString protocolVersion](v4, "protocolVersion");
          v54 = GEOConfigGetUInteger(MapsConfig_ShareETASupportedReceivedProtocolVersion, off_1014B3638);
          *(_DWORD *)buf = 138544130;
          v62 = v44;
          v63 = 2048;
          v64 = v53;
          v65 = 2048;
          v66 = v54;
          v67 = 2112;
          v68 = (unint64_t)v4;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Shared trip protocol (%lu) is greater than ours (%lu). Trip: %@", buf, 0x2Au);

          goto LABEL_58;
        }
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
      if (sub_1002A8AA0(v45) == 5)
      {
        if (!v4)
        {
LABEL_45:

          goto LABEL_59;
        }
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_1002D9268;
        v58[3] = &unk_1011AD238;
        v58[4] = self;
        v59 = v45;
        v60 = v4;
        objc_msgSend(v46, "popToRootContextAnimated:completion:", 1, v58);

        v47 = v59;
      }
      else
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_1002D9434;
        v55[3] = &unk_1011B06C8;
        v56 = v4;
        v57 = self;
        objc_msgSend(v48, "scheduleCoordinatedContextChange:completionHandler:", v55, 0);

        v47 = v56;
      }

      goto LABEL_45;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_11:
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString groupIdentifier](v4, "groupIdentifier"));
    *(_DWORD *)buf = 138544386;
    v62 = v14;
    v63 = 2112;
    v64 = v15;
    v65 = 2048;
    v66 = -[__CFString transportType](v4, "transportType");
    v67 = 2048;
    v68 = -[__CFString protocolVersion](v4, "protocolVersion");
    v69 = 1024;
    v70 = -[__CFString referenceFrame](v4, "referenceFrame");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Opening shared trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);

    goto LABEL_12;
  }
LABEL_59:

}

- (void)openSharedTrip:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  AppCoordinator *v7;
  AppCoordinator *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  unsigned int v30;

  v4 = a3;
  v5 = sub_10043237C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));
    *(_DWORD *)buf = 138544386;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2048;
    v26 = objc_msgSend(v4, "transportType");
    v27 = 2048;
    v28 = objc_msgSend(v4, "protocolVersion");
    v29 = 1024;
    v30 = objc_msgSend(v4, "referenceFrame");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Refreshing shared trip: %@, transportType: %lu, protocolVersion: %lu, referenceFrame: %d", buf, 0x30u);

  }
  objc_initWeak((id *)buf, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002D9814;
  v18[3] = &unk_1011B0718;
  v17 = v4;
  v19 = v17;
  objc_copyWeak(&v20, (id *)buf);
  objc_msgSend(v16, "refreshReceivedTripsWithCompletion:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);

}

- (void)closeSharedTrips
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == (id)5)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseModeController](self, "baseModeController"));
    objc_msgSend(v11, "showSharedTrip:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contexts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v9 = objc_opt_class(IOSSharedTripsContext);
    isKindOfClass = objc_opt_isKindOfClass(v8, v9);

    if ((isKindOfClass & 1) == 0)
      return;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    objc_msgSend(v11, "popContextAnimated:completion:", 1, 0);
  }

}

- (void)presentChinaAlertForSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK [Alert dismissal]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitleForDisallowedDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertMessageForChinaError"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0));
  objc_msgSend(v8, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v10, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);

}

- (void)presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK [Alert dismissal]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitleForDisallowedDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertMessageForTransportOrProtocolError"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0));
  objc_msgSend(v8, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v10, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);

}

- (void)presentAlertForMissingSharedTrip:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OK [Alert dismissal]"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitleForDisallowedDetails"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertMessageForClosedTrip"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v6, v7, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, 0));
  objc_msgSend(v8, "addAction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v10, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0);

}

- (id)lookAroundActionCoordinator
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  int v18;
  void *v19;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v5 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContext"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));
    return v9;
  }
  else
  {
    v11 = sub_100431B9C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_loadWeakRetained((id *)p_chromeViewController);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topContext"));
      v15 = (objc_class *)objc_opt_class(v14);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = 138412290;
      v19 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Error: lookAroundActionCoordinator requested while topContext=%@", (uint8_t *)&v18, 0xCu);

    }
    return 0;
  }
}

- (void)enterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5 originFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v10;
  id v13;
  id WeakRetained;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  LookAroundModeController *v18;
  void *v19;
  id v20;
  id v21;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v21 = a3;
  v13 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v16 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);

  if ((isKindOfClass & 1) == 0)
  {
    v18 = -[LookAroundModeController initWithEntryPoint:lookAroundView:showsFullScreen:originFrame:]([LookAroundModeController alloc], "initWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v21, v13, v10, x, y, width, height);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundModeController actionCoordinator](v18, "actionCoordinator"));
    objc_msgSend(v19, "setAppCoordinator:", self);
    v20 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    objc_msgSend(v20, "pushContext:animated:completion:", v18, 1, 0);

  }
}

- (void)exitLookAround
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  AppCoordinator *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t v38;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  v6 = objc_opt_class(LookAroundModeController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_chromeViewController);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topContext"));

    v10 = objc_loadWeakRetained((id *)p_chromeViewController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapView"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lookAroundView"));
    objc_msgSend(v12, "setNavigatingEnabled:", 0);
    objc_msgSend(v12, "setPanningEnabled:", 0);
    objc_msgSend(v12, "setZoomingEnabled:", 0);
    objc_msgSend(v12, "setShowsRoadLabels:", 0);
    objc_msgSend(v12, "setShowsPointLabels:", 0);
    if (!objc_msgSend(v12, "hasEnteredLookAround"))
    {
      v18 = 0;
LABEL_15:
      v28 = objc_loadWeakRetained((id *)p_chromeViewController);
      objc_msgSend(v28, "popContextAnimated:completion:", 1, v18);

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionCoordinator"));
      objc_msgSend(v29, "setAppCoordinator:", 0);

      return;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
    if (!v13)
    {
      objc_msgSend(v11, "centerCoordinate");
      v20 = v19;
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
      objc_msgSend(v23, "clearSearch");

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
      objc_msgSend(v24, "presentSearchAnimated:", 0);

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1002DA3BC;
      v35[3] = &unk_1011AED30;
      v36 = v11;
      v37 = v20;
      v38 = v22;
      v18 = objc_retainBlock(v35);
      v16 = v36;
LABEL_14:

      goto LABEL_15;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentMapItem"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_geoMapItem"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_geoMapItem"));
    if ((GEOMapItemIsEqualToMapItemForPurpose(v16, v17, 5) & 1) != 0)
      goto LABEL_5;
    if (sub_1002A8AA0(v11) == 5)
    {
      if (sub_1002A8AA0(v11) != 5)
      {
LABEL_5:
        objc_msgSend(v13, "_coordinate");
        objc_msgSend(v11, "setCenterCoordinate:animated:", 1);
        v18 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1002DA430;
      v30[3] = &unk_1011AC8B0;
      v30[4] = self;
      v31 = v13;
      v18 = objc_retainBlock(v30);
      v25 = v31;
    }
    else
    {
      objc_msgSend(v11, "_deselectLabelMarkerAnimated:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
      objc_msgSend(v26, "clearSearch");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
      objc_msgSend(v27, "presentSearchAnimated:", 0);

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1002DA3D0;
      v32[3] = &unk_1011AC8B0;
      v33 = v13;
      v34 = self;
      v18 = objc_retainBlock(v32);
      v25 = v33;
    }

    goto LABEL_13;
  }
}

- (void)enterPedestrianARWithRoute:(id)a3 guidanceObserver:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  PedestrianARContext *v11;
  void *v12;
  void *v13;
  PedestrianARContext *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContext"));
  v9 = objc_opt_class(PedestrianARContext);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);

  if ((isKindOfClass & 1) == 0)
  {
    v11 = [PedestrianARContext alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator platformController](self, "platformController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v14 = -[PedestrianARContext initWithRoute:platformController:guidanceObserver:navigationService:](v11, "initWithRoute:platformController:guidanceObserver:navigationService:", v17, v12, v6, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    objc_msgSend(v15, "pushContext:animated:completion:", v14, 1, 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    objc_msgSend(v16, "commitCoordinatedContextChange");

  }
}

- (void)exitPedestrianAR
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topContext"));
  v5 = objc_opt_class(PedestrianARContext);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002DA680;
    v9[3] = &unk_1011AC860;
    v9[4] = self;
    objc_msgSend(v7, "popContextAnimated:completion:", 1, v9);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "commitCoordinatedContextChange");

  }
}

- (MKMapView)mapViewForPPTTest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (void)setPPTTestViewMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "updateViewMode:animated:", a3, v4);

}

- (void)pptTestResetForLaunchURL
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v2, "resetForLaunchURLWithOptions:", 0);

}

- (void)pptTestPresentPlaceCardForSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPlaceCardProtocol))
    objc_msgSend(v6, "pptTestPresentPlaceCardForSearchResult:animated:", v7, v4);

}

- (BOOL)pptTestCanResizePlacecard
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPlaceCardProtocol))
    v3 = objc_msgSend(v2, "pptTestCanResizePlacecard");
  else
    v3 = 0;

  return v3;
}

- (void)pptTestMaximizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPlaceCardProtocol))
    objc_msgSend(v4, "pptTestMaximizePlaceCardAnimated:", v3);

}

- (void)pptTestMinimizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPlaceCardProtocol))
    objc_msgSend(v4, "pptTestMinimizePlaceCardAnimated:", v3);

}

- (void)pptTestMediumizePlaceCardAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestPlaceCardProtocol))
    objc_msgSend(v4, "pptTestMediumizePlaceCardAnimated:", v3);

}

- (void)pptTestSearchRetainQueryForSelectedSearchCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v4, "pptTestSearchRetainQueryForSelectedSearchCompletion:", v5);

}

- (void)pptTestSearchNearbyCategoryWithIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v4, "pptTestSearchNearbyCategoryWithIndex:", a3);

}

- (void)pptTestAutocompleteSearchForFieldItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v4, "pptTestAutocompleteSearchForFieldItem:", v5);

}

- (void)pptTestSearchEndEditing
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptTestSearchEndEditing");

}

- (void)pptTestSearchForFieldItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v4, "pptTestSearchForFieldItem:", v5);

}

- (void)pptTestRefreshSearch
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptTestRefreshSearch");

}

- (void)pptTestEnterSearchMode
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptTestEnterSearchMode");

}

- (void)pptTestSearchCancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptTestSearchCancel");

}

- (void)pptSelectFirstCuratedGuide
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptSelectFirstCuratedGuide");

}

- (void)pptSelectSeeAllCuratedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptSelectSeeAllCuratedCollections");

}

- (void)pptSelectFirstGuidePublisher
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v2, "pptSelectFirstGuidePublisher");

}

- (void)pptSelectACSuggestionMatchingAddress:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSearchProtocol))
    objc_msgSend(v4, "pptSelectACSuggestionMatchingAddress:", v5);

}

- (void)pptTestCreateCustomSearchResultForDroppedPinAtPoint:(CLLocationCoordinate2D)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double longitude;
  double latitude;
  id v7;

  v4 = a4;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestETAProtocol))
    objc_msgSend(v7, "pptTestCreateCustomSearchResultForDroppedPinAtPoint:animated:", v4, latitude, longitude);

}

- (void)setPPTTestDirectionsPlan:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator appStateManager](self, "appStateManager"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestRouteProtocol))
    objc_msgSend(v4, "setPPTTestDirectionsPlan:", v5);

}

- (void)pptTestPresentDirectionsDetails
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol))
    objc_msgSend(v2, "pptTestPresentDirectionsDetails");

}

- (UIViewController)pptTestContaineeForDirectionsDetails
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestContaineeForDirectionsDetails"));
  else
    v3 = 0;

  return (UIViewController *)v3;
}

- (UIScrollView)pptTestScrollViewForDirectionsDetails
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestDirectionsDetailsProtocol))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestScrollViewForDirectionsDetails"));
  else
    v3 = 0;

  return (UIScrollView *)v3;
}

- (void)pptTestDoDirectionItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceProtocol))
    objc_msgSend(v4, "pptTestDoDirectionItem:", v5);

}

- (void)pptTestStartNavigation
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestNavigationProtocol))
    objc_msgSend(v2, "pptTestStartNavigation");

}

- (void)pptTestEndNavigation
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  v5 = objc_msgSend(WeakRetained, "isTopContext:", v4);

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v7, "stopNavigationWithReason:", 10);
  }
  else
  {
    if (-[AppCoordinator pptTestSupportStepping](self, "pptTestSupportStepping"))
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
    else
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
    v7 = v6;
    if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestNavigationProtocol))
      objc_msgSend(v7, "pptTestEndNavigation");
  }

}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestNavigationProtocol))
    objc_msgSend(v2, "pptTestTransitionBetweenFullAndLightGuidance");

}

- (void)pptTestOpenCommuteEntry:(id)a3
{
  -[AppStateManager openCommuteEntry:](self->_appStateManager, "openCommuteEntry:", a3);
}

- (BOOL)pptTestSupportStepping
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  if ((objc_msgSend(v3, "isTopContext:", self->_stepModeController) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
    v4 = objc_msgSend(v5, "isTopContext:", v6);

  }
  return v4;
}

- (int64_t)pptTestCurrentStepIndex
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  v5 = objc_msgSend(WeakRetained, "isTopContext:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
    if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = objc_msgSend(v6, "pptTestCurrentStepIndex");
LABEL_6:

  return (int64_t)v7;
}

- (BOOL)pptTestHasNextStep
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  v5 = objc_msgSend(WeakRetained, "isTopContext:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
    if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = objc_msgSend(v6, "pptTestHasNextStep");
LABEL_6:

  return v7;
}

- (void)pptTestMoveToNextStep
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  v5 = objc_msgSend(WeakRetained, "isTopContext:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
LABEL_4:
    v9 = v6;
    objc_msgSend(v6, "pptTestMoveToNextStep");
    v6 = v9;
    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
  v7 = objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol);
  v6 = v8;
  if (v7)
    goto LABEL_4;
LABEL_5:

}

- (BOOL)pptTestMoveToBoardStep
{
  id WeakRetained;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned __int8 v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  v5 = objc_msgSend(WeakRetained, "isTopContext:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
    if (!objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestGuidanceStepProtocol))
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  v7 = objc_msgSend(v6, "pptTestMoveToBoardStep");
LABEL_6:

  return v7;
}

- (void)pptTestPauseRealtimeTransitUpdates
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "pauseRealtimeUpdates");

}

- (void)pptTestResumeRealtimeTransitUpdates
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v2, "resumeRealtimeUpdates");

}

- (void)pptTestStartTracePlaybackFromPath:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "debugController:choseTraceAtPath:startNav:", 0, v4, 1);

}

- (void)pptTestOpenSettings
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestSettingsProtocol))
    objc_msgSend(v2, "pptTestOpenSettings");

}

- (UIScrollView)pptTestScrollViewForProactive
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestProactiveProtocol))
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestScrollViewForProactive"));
  else
    v3 = 0;

  return (UIScrollView *)v3;
}

- (void)pptTestOpenRecents
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestRecentsProtocol))
    objc_msgSend(v2, "pptTestOpenRecents");

}

- (void)pptTestEnterAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestARProtocol))
    objc_msgSend(v2, "pptTestEnterAR");

}

- (void)pptTestExitAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestARProtocol))
    objc_msgSend(v2, "pptTestExitAR");

}

- (void)pptTestOpenCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestCollectionsProtocol))
    objc_msgSend(v2, "pptTestOpenCollections");

}

- (void)pptTestOpenFirstCollection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestCollectionsProtocol))
    objc_msgSend(v2, "pptTestOpenFirstCollection");

}

- (BOOL)pptTestCanUpdateTrayLayout
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator _pptChromeTrayCoordinatorForCurrentMode](self, "_pptChromeTrayCoordinatorForCurrentMode"));
  v3 = objc_msgSend(v2, "pptTestCanUpdateTrayLayout");

  return v3;
}

- (void)pptTestUpdateTrayLayout:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator _pptChromeTrayCoordinatorForCurrentMode](self, "_pptChromeTrayCoordinatorForCurrentMode"));
  objc_msgSend(v6, "pptTestUpdateTrayLayout:animated:", a3, v4);

}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator _pptChromeTrayCoordinatorForCurrentMode](self, "_pptChromeTrayCoordinatorForCurrentMode"));
  LOBYTE(a3) = objc_msgSend(v4, "pptTestIsTrayType:", a3);

  return a3;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[AppCoordinator _pptChromeTrayCoordinatorForCurrentMode](self, "_pptChromeTrayCoordinatorForCurrentMode"));
  objc_msgSend(v6, "pptTestDismissTrayAnimated:assertTrayType:", v5, a4);

}

- (UIScrollView)pptTestScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator _pptChromeTrayCoordinatorForCurrentMode](self, "_pptChromeTrayCoordinatorForCurrentMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestScrollView"));

  return (UIScrollView *)v3;
}

- (id)_pptChromeTrayCoordinatorForCurrentMode
{
  IOSBasedChromeViewController **p_chromeViewController;
  id WeakRetained;
  BaseModeController *v5;
  BaseModeController *baseModeController;
  id v7;
  NavModeController *v8;
  NavModeController *navModeController;
  id v10;
  StepModeController *v11;
  StepModeController *stepModeController;
  id v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  void *v21;
  id v22;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v5 = (BaseModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "topContext"));
  baseModeController = self->_baseModeController;

  if (v5 == baseModeController)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_chromeViewController);
    v8 = (NavModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topContext"));
    navModeController = self->_navModeController;

    if (v8 == navModeController)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator navActionCoordinator](self, "navActionCoordinator"));
    }
    else
    {
      v10 = objc_loadWeakRetained((id *)p_chromeViewController);
      v11 = (StepModeController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topContext"));
      stepModeController = self->_stepModeController;

      if (v11 == stepModeController)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator stepActionCoordinator](self, "stepActionCoordinator"));
      }
      else
      {
        v13 = objc_loadWeakRetained((id *)p_chromeViewController);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topContext"));
        v15 = objc_opt_class(LookAroundModeController);
        isKindOfClass = objc_opt_isKindOfClass(v14, v15);

        if ((isKindOfClass & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator lookAroundActionCoordinator](self, "lookAroundActionCoordinator"));
        }
        else
        {
          v18 = objc_loadWeakRetained((id *)p_chromeViewController);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
          v20 = objc_msgSend(v18, "isTopContext:", v19);

          if (!v20)
          {
            v22 = 0;
            v21 = 0;
            goto LABEL_14;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator transitNavigationContext](self, "transitNavigationContext"));
        }
      }
    }
  }
  v21 = v17;
  if (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestChromeTrayProtocol))
  {
    v22 = v21;
    v21 = v22;
  }
  else
  {
    v22 = 0;
  }
LABEL_14:

  return v22;
}

- (void)pptTestPresentPlacecardWithMapItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestVenuesProtocol))
    objc_msgSend(v4, "pptTestPresentPlacecardWithMapItem:", v5);

}

- (void)pptTestPresentVenueForMapItem:(id)a3 searchCategory:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestVenuesProtocol))
    objc_msgSend(v7, "pptTestPresentVenueForMapItem:searchCategory:", v8, v6);

}

- (void)pptTestSelectVenueSearchResult:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator"));
  if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestVenuesProtocol))
    objc_msgSend(v4, "pptTestSelectVenueSearchResult:", v5);

}

- (void)pptTestEnterLookAroundWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topContext"));

  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestLookAroundProtocol))
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12
    || ((v10 = (void *)objc_claimAutoreleasedReturnValue(-[AppCoordinator baseActionCoordinator](self, "baseActionCoordinator")),
         !objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___PPTTestLookAroundProtocol))
      ? (v13 = 0)
      : (v13 = v10),
        v14 = v13,
        v10,
        v14))
  {
    objc_msgSend(v10, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v15, v8, v5);

  }
}

- (RidesharingModeController)ridesharingModeController
{
  return self->_ridesharingModeController;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (AppStateManager)appStateManager
{
  return self->_appStateManager;
}

- (void)setAppStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_appStateManager, a3);
}

- (MapsSceneDelegate)mapsSceneDelegate
{
  return (MapsSceneDelegate *)objc_loadWeakRetained((id *)&self->_mapsSceneDelegate);
}

- (void)setMapsSceneDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapsSceneDelegate, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (StepModeController)stepModeController
{
  return self->_stepModeController;
}

- (FlyoverActionCoordination)flyoverActionCoordinator
{
  return self->_flyoverActionCoordinator;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (BOOL)isPresentingRouteCreation
{
  return self->_isPresentingRouteCreation;
}

- (void)setIsPresentingRouteCreation:(BOOL)a3
{
  self->_isPresentingRouteCreation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_flyoverActionCoordinator, 0);
  objc_storeStrong((id *)&self->_stepModeController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_mapsSceneDelegate);
  objc_storeStrong((id *)&self->_appStateManager, 0);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_transitNavigationContext, 0);
  objc_storeStrong((id *)&self->_ridesharingModeController, 0);
  objc_storeStrong((id *)&self->_navModeController, 0);
  objc_storeStrong((id *)&self->_baseModeController, 0);
  objc_storeStrong(&self->_dismissNavigationCompletion, 0);
  objc_storeStrong(&self->_fixedProblemCompletion, 0);
  objc_storeStrong((id *)&self->_analyticsMonitor, 0);
  objc_storeStrong((id *)&self->_shareViewController, 0);
}

@end
