@implementation CarSessionController

+ (id)sharedInstance
{
  if (qword_1014D2DE8 != -1)
    dispatch_once(&qword_1014D2DE8, &stru_1011BFF38);
  return (id)qword_1014D2DE0;
}

- (CarSessionController)init
{
  CarSessionController *v2;
  NSMutableSet *v3;
  NSMutableSet *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CarSessionController;
  v2 = -[CarSessionController init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 4);
    observers = v2->_observers;
    v2->_observers = v3;

    v2->_active = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CarSessionController setActive:](self, "setActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CarSessionController;
  -[CarSessionController dealloc](&v3, "dealloc");
}

- (NSSet)sessionObservers
{
  CarSessionController *v2;
  void *v3;
  id v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v2, "observers"));
  v4 = objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSSet *)v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  CarSessionController *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  id v15;
  void *v16;
  id v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __CFString *v27;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
  {
    objc_sync_exit(v5);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
    objc_msgSend(v8, "addObject:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
      -[CarSessionController setActive:](v5, "setActive:", 1);
    v11 = sub_10043372C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class(v4);
      v14 = NSStringFromClass(v13);
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
      v17 = objc_msgSend(v16, "count");
      v18 = -[CarSessionController isActive](v5, "isActive");
      v19 = CFSTR("NO");
      if (v18)
        v19 = CFSTR("YES");
      v20 = v19;
      v22 = 138412802;
      v23 = v15;
      v24 = 2048;
      v25 = v17;
      v26 = 2112;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "addObserver: %@, observersCount: %lu, active: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_sync_exit(v5);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "postNotificationName:object:", off_1014B0350, v5);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  CarSessionController *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  id v15;
  void *v16;
  id v17;
  unsigned int v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __CFString *v27;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
    objc_msgSend(v8, "removeObject:", v4);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
    v10 = objc_msgSend(v9, "count");

    if (!v10)
      -[CarSessionController setActive:](v5, "setActive:", 0);
    v11 = sub_10043372C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class(v4);
      v14 = NSStringFromClass(v13);
      v15 = (id)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController observers](v5, "observers"));
      v17 = objc_msgSend(v16, "count");
      v18 = -[CarSessionController isActive](v5, "isActive");
      v19 = CFSTR("NO");
      if (v18)
        v19 = CFSTR("YES");
      v20 = v19;
      v22 = 138412802;
      v23 = v15;
      v24 = 2048;
      v25 = v17;
      v26 = 2112;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "removeObserver: %@, observersCount: %lu, active: %@", (uint8_t *)&v22, 0x20u);

    }
    objc_sync_exit(v5);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "postNotificationName:object:", off_1014B0350, v5);

  }
  else
  {
    objc_sync_exit(v5);

  }
}

- (void)setActive:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;

  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
      objc_msgSend(v4, "addObserver:", self);

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v5, "registerObserver:", self);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
      objc_msgSend(v6, "registerObserver:", self);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentSession"));
      -[CarSessionController _handleIncomingSession:](self, "_handleIncomingSession:", v8);

    }
    else
    {
      -[CarSessionController _handleIncomingSession:](self, "_handleIncomingSession:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
      objc_msgSend(v9, "removeObserver:", self);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      objc_msgSend(v10, "unregisterObserver:", self);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarRouteGeniusService sharedService](CarRouteGeniusService, "sharedService"));
      objc_msgSend(v7, "unregisterObserver:", self);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    objc_msgSend(v11, "_carSessionController_updateNavigationHostingState");

    v12 = sub_10043372C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      if (self->_active)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      v16 = 138412290;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "setActive: %@, updating navigation hosting state", (uint8_t *)&v16, 0xCu);

    }
  }
}

- (PlatformController)platformController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "platformController"));

  return (PlatformController *)v3;
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;

  v6 = a4;
  v7 = a5;
  v8 = sub_10043372C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (objc_class *)objc_opt_class(v7);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v33 = 138412546;
    v34 = v12;
    v35 = 2112;
    v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "willChangeCurrentSessionFromSession from: %@ to: %@", (uint8_t *)&v33, 0x16u);

  }
  v16 = v6;
  v17 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
    v18 = v16;
  else
    v18 = 0;
  v19 = v18;

  v20 = v7;
  v21 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    v22 = v20;
  else
    v22 = 0;
  v23 = v22;

  if (v19)
  {
    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "configuration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "automaticSharingContacts"));
      v26 = objc_msgSend(v25, "count");

      if (v26)
      {
        v27 = sub_10043372C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(v33) = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Adding automatic sharing contacts from planning session to navigation session", (uint8_t *)&v33, 2u);
        }

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "configuration"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "automaticSharingContacts"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "configuration"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sharedTripPrefetchContext"));
        objc_msgSend(v32, "setAutomaticSharingContacts:", v30);

      }
    }
  }

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  char v32;
  id v33;
  uint64_t v34;
  char v35;
  id v36;
  uint64_t v37;
  char v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;

  v7 = a4;
  v8 = a5;
  v9 = sub_10043372C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(v7);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (objc_class *)objc_opt_class(v8);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v43 = 138412546;
    v44 = v13;
    v45 = 2112;
    v46 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "didChangeCurrentSessionFromSession from: %@ to: %@", (uint8_t *)&v43, 0x16u);

  }
  v17 = v8;
  v18 = objc_opt_class(RouteGeniusSession);
  isKindOfClass = objc_opt_isKindOfClass(v17, v18);

  if (!v17 || (isKindOfClass & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "routeGeniusManager"));
    objc_msgSend(v21, "deactivateForAllChromes");

  }
  -[CarSessionController _handleIncomingSession:](self, "_handleIncomingSession:", v17);
  v22 = v7;
  v23 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
    v24 = v22;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    v26 = v17;
    v27 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      v28 = v26;
    else
      v28 = 0;
    v29 = v28;

    if (v29)
    {

    }
    else
    {
      v30 = v26;
      v31 = objc_opt_class(RoutePlanningSession);
      v32 = objc_opt_isKindOfClass(v30, v31);

      if (!v17 || (v32 & 1) == 0)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
        objc_msgSend(v42, "endRoutePlanning");

        goto LABEL_24;
      }
    }
  }
  v33 = v22;
  v34 = objc_opt_class(NavigationSession);
  v35 = objc_opt_isKindOfClass(v33, v34);

  if (v33 && (v35 & 1) != 0)
  {
    -[CarSessionController _stopNavigation](self, "_stopNavigation");
LABEL_24:
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v40, "dismissCurrentInterruptionOfKind:", 8);
    goto LABEL_25;
  }
  v36 = v33;
  v37 = objc_opt_class(RouteGeniusSession);
  v38 = objc_opt_isKindOfClass(v36, v37);

  if (v33 && (v38 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v39, "endRouteGenius");

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "routeGeniusManager"));
    objc_msgSend(v41, "deactivateForAllChromes");

LABEL_25:
  }

}

- (void)_handleIncomingSession:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  -[CarSessionController setRoutePlanningSession:](self, "setRoutePlanningSession:", v7);

  v8 = v4;
  v9 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  -[CarSessionController setNavigationSession:](self, "setNavigationSession:", v11);
  v15 = v8;
  v12 = objc_opt_class(RouteGeniusSession);
  if ((objc_opt_isKindOfClass(v15, v12) & 1) != 0)
    v13 = v15;
  else
    v13 = 0;
  v14 = v13;

  -[CarSessionController setRouteGeniusSession:](self, "setRouteGeniusSession:", v14);
  if (v15)
    -[CarSessionController mapsSession:didChangeState:](self, "mapsSession:didChangeState:", v15, objc_msgSend(v15, "sessionState"));

}

- (void)_handleTransportType:(int64_t)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v4 = sub_10043372C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4)
      v6 = CFSTR("Undefined");
    else
      v6 = off_1011BFF80[a3 - 1];
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_handleTransportType: %@", (uint8_t *)&v10, 0xCu);
  }

  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    if (a3 == 1)
    {
      objc_msgSend(v7, "dismissCurrentInterruptionOfKind:", 8);
    }
    else
    {
      v8 = CarInterruptionUserInfoWithMSPTransportType(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v7, "interruptApplicationWithKind:userInfo:completionHandler:", 8, v9, 0);

    }
  }
}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *navigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setRouteGeniusSession:(id)a3
{
  RouteGeniusSession *v5;
  RouteGeniusSession *routeGeniusSession;
  RouteGeniusSession *v7;

  v5 = (RouteGeniusSession *)a3;
  routeGeniusSession = self->_routeGeniusSession;
  if (routeGeniusSession != v5)
  {
    v7 = v5;
    -[RouteGeniusSession removeObserver:](routeGeniusSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routeGeniusSession, a3);
    -[RouteGeniusSession addObserver:](self->_routeGeniusSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;

  v6 = a3;
  v7 = sub_10043372C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class(v6);
    v10 = NSStringFromClass(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    v13 = CFSTR("NotStarted");
    if (a4 == 1)
      v13 = CFSTR("Running");
    if (a4 == 2)
      v13 = CFSTR("Suspended");
    v35 = 138412546;
    v36 = v11;
    v37 = 2112;
    v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "mapsSession:didChangeState: class: %@, state: %@", (uint8_t *)&v35, 0x16u);

  }
  v14 = objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));
  if (!v14)
    goto LABEL_12;
  v15 = (void *)v14;
  v16 = v6;
  v17 = objc_opt_class(NavigationSession);
  v18 = (objc_opt_isKindOfClass(v16, v17) & 1) != 0 ? v16 : 0;
  v19 = v18;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));
  if (v19 == v20)
  {
    -[CarSessionController _navigationSessionDidChangeState:](self, "_navigationSessionDidChangeState:", a4);
  }
  else
  {
LABEL_12:
    v21 = objc_claimAutoreleasedReturnValue(-[CarSessionController routePlanningSession](self, "routePlanningSession"));
    if (!v21)
      goto LABEL_17;
    v22 = (void *)v21;
    v23 = v6;
    v24 = objc_opt_class(RoutePlanningSession);
    v25 = (objc_opt_isKindOfClass(v23, v24) & 1) != 0 ? v23 : 0;
    v26 = v25;

    v27 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController routePlanningSession](self, "routePlanningSession"));
    if (v26 == v27)
    {
      -[CarSessionController _routePlanningSessionDidChangeState:](self, "_routePlanningSessionDidChangeState:", a4);
    }
    else
    {
LABEL_17:
      v28 = objc_claimAutoreleasedReturnValue(-[CarSessionController routeGeniusSession](self, "routeGeniusSession"));
      if (v28)
      {
        v29 = (void *)v28;
        v30 = v6;
        v31 = objc_opt_class(RouteGeniusSession);
        if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
          v32 = v30;
        else
          v32 = 0;
        v33 = v32;

        v34 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController routeGeniusSession](self, "routeGeniusSession"));
        if (v33 == v34)
          -[CarSessionController _routeGeniusSessionDidChangeState:](self, "_routeGeniusSessionDidChangeState:", a4);
      }
    }
  }

}

- (void)_navigationSessionDidChangeState:(unint64_t)a3
{
  if (a3 == 2)
  {
    -[CarSessionController _stopNavigation](self, "_stopNavigation");
  }
  else if (a3 == 1)
  {
    -[CarSessionController _startNavigatingAnimated:](self, "_startNavigatingAnimated:");
  }
}

- (void)_startNavigatingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  __CFString *v23;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRouteCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "origin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geoMapItem"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));

  if (!objc_msgSend(v6, "isMultipointRoute")
    && v8
    && v10
    && GEOConfigGetBOOL(GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[0], GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[1]))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
    objc_msgSend(v11, "captureActualTransportationMode:originMapItem:destinationMapItem:", 0, v8, v10);

  }
  v12 = sub_10043372C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    v15 = v14;
    v22 = 138412290;
    v23 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Navigation will launch animated=%@", (uint8_t *)&v22, 0xCu);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v17 = objc_msgSend(v16, "isCurrentlyConnectedToCarAppScene");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v18, "setIsConnectedToCarplay:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NavigationFeedbackCollector sharedFeedbackCollector](NavigationFeedbackCollector, "sharedFeedbackCollector"));
  objc_msgSend(v19, "setIsConnectedToCarplay:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  v21 = v20;
  if (v3)
    objc_msgSend(v20, "displayNavigation");
  else
    objc_msgSend(v20, "launchIntoNavigation");

  objc_msgSend(v16, "_carSessionController_updateNavigationHostingState");
}

- (void)_stopNavigation
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t);
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[8];
  const __CFString *v15;
  void *v16;

  v3 = sub_10043372C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Navigation will stop running", v14, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
  objc_msgSend(v5, "endNavigation");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  objc_msgSend(v6, "_carSessionController_updateNavigationHostingState");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationEndedHandler](self, "navigationEndedHandler"));
  if (v7)
  {
    v8 = (void (**)(id, uint64_t))objc_retainBlock(self->_navigationEndedHandler);
    -[CarSessionController setNavigationEndedHandler:](self, "setNavigationEndedHandler:", 0);
    v8[2](v8, 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v10 = objc_msgSend(v9, "isDetour");

    if (!v10)
      return;
    v8 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "originalDestination"));
    v15 = CFSTR("isOriginalDestination");
    v16 = &__kCFBooleanTrue;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v8, "displayRoutePlanningForDestination:userInfo:", v12, v13);

  }
}

- (void)endNavigationIfNeededWithPrompt:(BOOL)a3 andPerformBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];
  id location[2];

  v6 = a4;
  -[CarSessionController setNavigationEndedHandler:](self, "setNavigationEndedHandler:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));

  if (v7)
  {
    if (a3)
    {
      objc_initWeak(location, self);
      v8 = sub_10043372C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CarSessionController : Will prompt kMapsInterruptionMaybeEndNavigation", buf, 2u);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1006A127C;
      v13[3] = &unk_1011BFF60;
      objc_copyWeak(&v15, location);
      v14 = v6;
      objc_msgSend(v10, "interruptApplicationWithKind:userInfo:completionHandler:", 7, 0, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(location);
    }
    else
    {
      v11 = sub_10043372C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CarSessionController : Will not kMapsInterruptionMaybeEndNavigation, ending navigation and performing block immediately", (uint8_t *)location, 2u);
      }

      -[CarSessionController _promptToEndNavigationAccepted:](self, "_promptToEndNavigationAccepted:", v6);
    }
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }

}

- (void)_promptToEndNavigationAccepted:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  id navigationEndedHandler;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v5 = objc_msgSend(v4, "isInNavigatingState");

  if (v5)
  {
    v6 = objc_msgSend(v9, "copy");
    navigationEndedHandler = self->_navigationEndedHandler;
    self->_navigationEndedHandler = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v8, "stopNavigationWithReason:", 2);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));

  if (v6 == v5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController navigationSession](self, "navigationSession"));
    -[CarSessionController _handleTransportType:](self, "_handleTransportType:", objc_msgSend(v9, "currentTransportType"));

  }
  else
  {
    v7 = sub_10043372C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Navigation session didUpdateRouteCollection:, but currentSession is not navigation.", buf, 2u);
    }

  }
}

- (void)navigationServicePredictingDidArrive:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController", a3));
  objc_msgSend(v3, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(RouteGeniusSession));

}

- (void)navigationService:(id)a3 didUpdateArrivalInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  int v12;
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "arrivalState") && objc_msgSend(v6, "arrivalState") != (id)-1)
  {
    v7 = sub_10043372C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CarSessionController: didUpdateArrivalInfo: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
    v10 = objc_msgSend(v9, "isLegIndexOfLastLeg:", objc_msgSend(v6, "legIndex"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v11, "displayNavigation");

    }
  }

}

- (void)_routePlanningSessionDidChangeState:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a3 == 2)
  {
    if (!GEOConfigGetBOOL(GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[0], GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[1]))return;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
    objc_msgSend(v8, "cancelCapturingAnalytics");
  }
  else
  {
    if (a3 != 1)
      return;
    if (GEOConfigGetBOOL(GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[0], GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[1]))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
      objc_msgSend(v4, "capturePredictedTransportationMode:", 0);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController routePlanningSession](self, "routePlanningSession"));
    v6 = objc_msgSend(v5, "sessionInitiator");

    if (v6 != (id)2)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v7, "displayRoutePlanningForExistingRoute");

    }
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CarSessionController routePlanningSession](self, "routePlanningSession"));
    -[CarSessionController _handleTransportType:](self, "_handleTransportType:", objc_msgSend(v8, "currentTransportType"));
  }

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  _BOOL4 v14;

  v5 = a5;
  v8 = sub_10043372C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a4 - 1) > 4)
      v10 = CFSTR("Undefined");
    else
      v10 = off_1011BFF80[a4 - 1];
    v11 = 138412546;
    v12 = v10;
    v13 = 1024;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "routePlanningSession:didChangeCurrentTransportType %@ userInitiated:%d", (uint8_t *)&v11, 0x12u);
  }

  -[CarSessionController _handleTransportType:](self, "_handleTransportType:", a4);
}

- (void)_routeGeniusSessionDidChangeState:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v4 = sub_10043372C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NotStarted");
    if (a3 == 1)
      v6 = CFSTR("Running");
    if (a3 == 2)
      v6 = CFSTR("Suspended");
    v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_routeGeniusSessionDidChangeState: %@", (uint8_t *)&v10, 0xCu);
  }

  if (a3 == 2)
  {
    if (GEOConfigGetBOOL(GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[0], GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[1]))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
      objc_msgSend(v9, "cancelCapturingAnalytics");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v8, "endRouteGenius");
  }
  else
  {
    if (a3 != 1)
      return;
    if (GEOConfigGetBOOL(GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[0], GEOConfigMapsSuggestionsPredictorShouldCollectCarPlayAnalytics[1]))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
      objc_msgSend(v7, "capturePredictedTransportationMode:", 0);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v8, "displayRouteGenius");
  }

}

- (void)didUpdateRouteGenius:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  id v12;
  RouteGeniusSession *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];
  uint8_t buf[16];
  uint8_t v21[16];

  v4 = a3;
  if (!v4)
  {
    v14 = sub_10043372C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "didUpdateRouteGenius with nil entry, will pop RG session.", v21, 2u);
    }

    v13 = (RouteGeniusSession *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
    -[RouteGeniusSession clearIfCurrentSessionIsKindOfClass:](v13, "clearIfCurrentSessionIsKindOfClass:", objc_opt_class(RouteGeniusSession));
    goto LABEL_12;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionStack"));
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v16 = sub_10043372C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "RG: pushing routeGeniusSession on platform sessionStack.", v19, 2u);
    }

    v13 = objc_alloc_init(RouteGeniusSession);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
    objc_msgSend(v18, "pushSession:", v13);

    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSessionController platformController](self, "platformController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentSession"));
  v10 = objc_opt_class(RouteGeniusSession);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) == 0)
  {
    v12 = sub_10043372C();
    v13 = (RouteGeniusSession *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v13->super, OS_LOG_TYPE_ERROR, "didUpdateRouteGenius, but the platform controller is in an invalid state.", buf, 2u);
    }
LABEL_12:

  }
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (RouteGeniusSession)routeGeniusSession
{
  return self->_routeGeniusSession;
}

- (id)navigationEndedHandler
{
  return self->_navigationEndedHandler;
}

- (void)setNavigationEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_navigationEndedHandler, 0);
  objc_storeStrong((id *)&self->_routeGeniusSession, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
}

@end
