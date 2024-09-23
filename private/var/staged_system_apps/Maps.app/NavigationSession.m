@implementation NavigationSession

- (void)selectRoute:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v4, "switchToRoute:", v3);

}

- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4
{
  id v6;
  void *v7;
  NavigationSession *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = -[NavigationSession initWithInitiator:configuration:navigationService:](self, "initWithInitiator:configuration:navigationService:", a3, v6, v7);

  return v8;
}

- (NavigationSession)initWithInitiator:(unint64_t)a3 configuration:(id)a4 navigationService:(id)a5
{
  id v9;
  id v10;
  NavigationSession *v11;
  id v12;
  NSObject *v13;
  NavigationSession *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  NSString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  GEOObserverHashTable *v26;
  GEOObserverHashTable *observers;
  NavdNavigationStateProvider *v28;
  void *v29;
  NavdNavigationStateProvider *v30;
  NavigationStateProvider *navigationStateProvider;
  NavdRouteCollectionUpdateProvider *v32;
  void *v33;
  NavdRouteCollectionUpdateProvider *v34;
  RouteCollectionUpdateProvider *routeCollectionUpdateProvider;
  _TtC4Maps28NavigationWaypointController *v36;
  void *v37;
  _TtC4Maps28NavigationWaypointController *v38;
  _TtC4Maps28NavigationWaypointController *waypointController;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  id v50;

  v9 = a4;
  v10 = a5;
  v42.receiver = self;
  v42.super_class = (Class)NavigationSession;
  v11 = -[NavigationSession init](&v42, "init");
  if (v11)
  {
    v12 = sub_100431C0C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v11->_sessionInitiator = a3;
      objc_storeStrong((id *)&v11->_configuration, a4);
      v26 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___NavigationSessionObserver, 0);
      observers = v11->_observers;
      v11->_observers = v26;

      v28 = [NavdNavigationStateProvider alloc];
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionConfiguration startNavigationDetails](v11->_configuration, "startNavigationDetails"));
      v30 = -[NavdNavigationStateProvider initWithNavigationService:startNavigationDetails:](v28, "initWithNavigationService:startNavigationDetails:", v10, v29);
      navigationStateProvider = v11->_navigationStateProvider;
      v11->_navigationStateProvider = (NavigationStateProvider *)v30;

      -[NavigationStateProvider setDelegate:](v11->_navigationStateProvider, "setDelegate:", v11);
      v32 = [NavdRouteCollectionUpdateProvider alloc];
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionConfiguration routeCollection](v11->_configuration, "routeCollection"));
      v34 = -[NavdRouteCollectionUpdateProvider initWithNavigationService:routeCollection:](v32, "initWithNavigationService:routeCollection:", v10, v33);
      routeCollectionUpdateProvider = v11->_routeCollectionUpdateProvider;
      v11->_routeCollectionUpdateProvider = (RouteCollectionUpdateProvider *)v34;

      -[RouteCollectionUpdateProvider setDelegate:](v11->_routeCollectionUpdateProvider, "setDelegate:", v11);
      objc_storeStrong((id *)&v11->_navigationService, a5);
      -[MNNavigationService openForClient:](v11->_navigationService, "openForClient:", v11);
      -[MNNavigationService registerObserver:](v11->_navigationService, "registerObserver:", v11);
      v36 = [_TtC4Maps28NavigationWaypointController alloc];
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v38 = -[NavigationWaypointController initWithService:](v36, "initWithService:", v37);
      waypointController = v11->_waypointController;
      v11->_waypointController = v38;

      goto LABEL_13;
    }
    v41 = v9;
    v14 = v11;
    v15 = (objc_class *)objc_opt_class(v14);
    v16 = NSStringFromClass(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

        goto LABEL_8;
      }

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
LABEL_8:

    v21 = (objc_class *)objc_opt_class(v14);
    v22 = NSStringFromClass(v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = (void *)v23;
    if (a3 - 1 > 7)
      v25 = CFSTR("Unknown");
    else
      v25 = *(&off_1011B7818 + a3 - 1);
    v9 = v41;
    *(_DWORD *)buf = 138544130;
    v44 = v20;
    v45 = 2112;
    v46 = v23;
    v47 = 2112;
    v48 = v25;
    v49 = 2112;
    v50 = v41;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}@] %@ is being initialized - initiator=%@ configuration=%@", buf, 0x2Au);

    goto LABEL_12;
  }
LABEL_13:

  return v11;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  NavigationSession *v5;
  NavigationSession *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  NavigationSession *v18;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ is being deallocated", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
  objc_msgSend(v13, "stopAllSharingWithCompletion:", 0);

  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  -[MNNavigationService closeForClient:](self->_navigationService, "closeForClient:", self);
  v14.receiver = self;
  v14.super_class = (Class)NavigationSession;
  -[NavigationSession dealloc](&v14, "dealloc");
}

- (GEOComposedWaypoint)destination
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self, "currentRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));

  return (GEOComposedWaypoint *)v4;
}

- (void)setNavigationStateProvider:(id)a3
{
  NavigationStateProvider *v5;
  NavigationStateProvider *navigationStateProvider;
  NavigationStateProvider *v7;

  v5 = (NavigationStateProvider *)a3;
  navigationStateProvider = self->_navigationStateProvider;
  if (navigationStateProvider != v5)
  {
    v7 = v5;
    -[NavigationStateProvider setDelegate:](navigationStateProvider, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_navigationStateProvider, a3);
    -[NavigationStateProvider setDelegate:](self->_navigationStateProvider, "setDelegate:", self);
    v5 = v7;
  }

}

- (void)setRouteCollectionUpdateProvider:(id)a3
{
  RouteCollectionUpdateProvider *v5;
  RouteCollectionUpdateProvider *routeCollectionUpdateProvider;
  RouteCollectionUpdateProvider *v7;

  v5 = (RouteCollectionUpdateProvider *)a3;
  routeCollectionUpdateProvider = self->_routeCollectionUpdateProvider;
  if (routeCollectionUpdateProvider != v5)
  {
    v7 = v5;
    -[RouteCollectionUpdateProvider setDelegate:](routeCollectionUpdateProvider, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_routeCollectionUpdateProvider, a3);
    -[RouteCollectionUpdateProvider setDelegate:](self->_routeCollectionUpdateProvider, "setDelegate:", self);
    v5 = v7;
  }

}

- (int64_t)navigationType
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "startNavigationDetails"));
  v4 = objc_msgSend(v3, "navigationType");

  return (int64_t)v4;
}

- (unint64_t)guidanceType
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "startNavigationDetails"));
  v4 = objc_msgSend(v3, "guidanceType");

  return (unint64_t)v4;
}

- (RouteCollection)currentRouteCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession routeCollectionUpdateProvider](self, "routeCollectionUpdateProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRouteCollection"));

  return (RouteCollection *)v3;
}

- (int64_t)currentTransportType
{
  void *v2;
  void *v3;
  unsigned int v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self, "currentRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));
  v4 = objc_msgSend(v3, "transportType") - 1;
  if (v4 > 5)
    v5 = 1;
  else
    v5 = qword_100E373D8[v4];

  return v5;
}

- (NSString)currentDestinationString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession currentRouteCollection](self, "currentRouteCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  return (NSString *)v5;
}

- (unint64_t)sessionState
{
  void *v3;
  id v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
  v4 = objc_msgSend(v3, "navigationState");

  if (v4 == (id)1)
  {
    if (-[NavigationSession hasStartedNavigation](self, "hasStartedNavigation"))
      return 2;
    else
      return 0;
  }
  else if (v4 == (id)2)
  {
    v5 = 1;
    -[NavigationSession setHasStartedNavigation:](self, "setHasStartedNavigation:", 1);
  }
  else
  {
    return 0;
  }
  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NavigationSession *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ - adding observer %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v7, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NavigationSession *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ - remove observer %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v7, "unregisterObserver:", v4);

}

- (void)resume
{
  id v3;
  NSObject *v4;
  NavigationSession *v5;
  NavigationSession *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  NavigationSession *v23;
  __int16 v24;
  const __CFString *v25;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_15;
  v5 = self;
  v6 = v5;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
  v13 = -[NavigationSession sessionState](v6, "sessionState");
  v14 = CFSTR("NotStarted");
  if (v13 == (id)1)
    v14 = CFSTR("Running");
  *(_DWORD *)buf = 138543874;
  v21 = v12;
  v22 = 2112;
  v23 = v6;
  if (v13 == (id)2)
    v14 = CFSTR("Suspended");
  v24 = 2112;
  v25 = v14;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %@ - start requested, state=%@", buf, 0x20u);

LABEL_15:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
  v16 = objc_msgSend(v15, "navigationState");

  if (v16 == (id)2)
  {
    -[NavigationSession _startAutomaticETASharingIfNeeded:](self, "_startAutomaticETASharingIfNeeded:", GEOConfigGetUInteger(MapsConfig_SharedTripAutomaticSharingRetryCount, off_1014B3AE8));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
    objc_msgSend(v17, "mapsSession:didChangeState:", self, -[NavigationSession sessionState](self, "sessionState"));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sharedTripPrefetchContext"));
    +[SharedTripSuggestionsDataSource prefetchSuggestionsAndCapabilitiesWithContext:](SharedTripSuggestionsDataSource, "prefetchSuggestionsAndCapabilitiesWithContext:", v19);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
    objc_msgSend(v17, "setNavigationState:", 2);
  }

}

- (void)suspendWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  NavigationSession *v7;
  NavigationSession *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  id suspendCompletionHandler;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  NavigationSession *v25;
  __int16 v26;
  const __CFString *v27;

  v4 = (void (**)(_QWORD))a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    goto LABEL_15;
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
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
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
  v15 = -[NavigationSession sessionState](v8, "sessionState");
  v16 = CFSTR("NotStarted");
  if (v15 == (id)1)
    v16 = CFSTR("Running");
  *(_DWORD *)buf = 138543874;
  v23 = v14;
  v24 = 2112;
  v25 = v8;
  if (v15 == (id)2)
    v16 = CFSTR("Suspended");
  v26 = 2112;
  v27 = v16;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] %@ - suspend requested, state=%@", buf, 0x20u);

LABEL_15:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
  v18 = objc_msgSend(v17, "navigationState");

  if (v18 == (id)1)
  {
    v4[2](v4);
  }
  else
  {
    v19 = objc_msgSend(v4, "copy");
    suspendCompletionHandler = self->_suspendCompletionHandler;
    self->_suspendCompletionHandler = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
    objc_msgSend(v21, "setNavigationState:", 1);

  }
}

- (void)prepareToReplayCurrentState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v2, "snapshotCurrentObservers");

}

- (void)replayCurrentState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v3, "removeSnapshottedObservers");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v4, "mapsSession:didChangeState:", self, -[NavigationSession sessionState](self, "sessionState"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v5, "restoreOriginalObservers");

}

- (void)cleanupStateReplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v2, "clearSnapshottedObservers");

}

- (void)_startAutomaticETASharingIfNeeded:(unint64_t)a3
{
  void *v5;
  id v6;
  int64_t v7;
  NSMutableArray *pendingAutomaticSharingContacts;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  __CFString *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  id v27;
  const __CFString *v28;
  id v29;
  _QWORD v30[5];
  __CFString *v31;
  unint64_t v32;
  uint8_t buf[4];
  NavigationSession *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  unint64_t v38;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession navigationStateProvider](self, "navigationStateProvider"));
  v6 = objc_msgSend(v5, "navigationState");

  if (v6 != (id)2)
  {
    v22 = sub_100431C0C();
    v21 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v34 = self;
    v23 = "%@ - will not start automatic sharing, navigation not active";
    v24 = v21;
    v25 = OS_LOG_TYPE_ERROR;
    goto LABEL_15;
  }
  v7 = -[NavigationSession currentTransportType](self, "currentTransportType");
  if ((MSPSharedTripSharingSupportedForTransportType() & 1) == 0)
  {
    v27 = sub_100431C0C();
    v21 = objc_claimAutoreleasedReturnValue(v27);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    if ((unint64_t)(v7 - 1) > 4)
      v28 = CFSTR("Undefined");
    else
      v28 = *(&off_1011B7858 + v7 - 1);
    *(_DWORD *)buf = 138412546;
    v34 = self;
    v35 = 2112;
    v36 = v28;
    v23 = "%@ - will not start automatic sharing, current transport type is not supported (%@)";
    v24 = v21;
    v25 = OS_LOG_TYPE_ERROR;
    v26 = 22;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, v26);
    goto LABEL_24;
  }
  pendingAutomaticSharingContacts = self->_pendingAutomaticSharingContacts;
  if (!pendingAutomaticSharingContacts)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession configuration](self, "configuration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sharedTripPrefetchContext"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "automaticSharingContacts"));
    v12 = v11;
    if (!v11)
      v11 = &__NSArray0__struct;
    v13 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
    v14 = self->_pendingAutomaticSharingContacts;
    self->_pendingAutomaticSharingContacts = v13;

    v15 = sub_100431C0C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (const __CFString *)-[NSMutableArray count](self->_pendingAutomaticSharingContacts, "count");
      *(_DWORD *)buf = 138412546;
      v34 = self;
      v35 = 2048;
      v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@ - preparing to handle %lu automatic sharing contacts", buf, 0x16u);
    }

    pendingAutomaticSharingContacts = self->_pendingAutomaticSharingContacts;
  }
  if (!-[NSMutableArray count](pendingAutomaticSharingContacts, "count"))
  {
    v29 = sub_100431C0C();
    v21 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    *(_DWORD *)buf = 138412290;
    v34 = self;
    v23 = "%@ - will not start automatic sharing, no pending contacts";
    v24 = v21;
    v25 = OS_LOG_TYPE_INFO;
LABEL_15:
    v26 = 12;
    goto LABEL_23;
  }
  v18 = (__CFString *)-[NSMutableArray copy](self->_pendingAutomaticSharingContacts, "copy");
  v19 = sub_100431C0C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412803;
    v34 = self;
    v35 = 2113;
    v36 = v18;
    v37 = 2048;
    v38 = a3;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ - will start automatic sharing with %{private}@, remaining retries %lu", buf, 0x20u);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100469508;
  v30[3] = &unk_1011B77F8;
  v31 = v18;
  v32 = a3;
  v30[4] = self;
  v21 = v18;
  -[NSObject enumerateObjectsWithOptions:usingBlock:](v21, "enumerateObjectsWithOptions:usingBlock:", 1, v30);

LABEL_24:
}

- (void)_scheduleAutomaticSharingRetry:(unint64_t)a3
{
  double Double;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSTimer *v10;
  NSTimer *automaticSharingRetryTimer;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  NavigationSession *v15;
  __int16 v16;
  double v17;
  __int16 v18;
  unint64_t v19;

  if (!self->_automaticSharingRetryTimer)
  {
    Double = GEOConfigGetDouble(MapsConfig_SharedTripAutomaticSharingRetryInterval, off_1014B3AF8);
    v6 = sub_100431C0C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v15 = self;
      v16 = 2048;
      v17 = Double;
      v18 = 2048;
      v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ - scheduling automatic sharing in %#.1fs, %lu remaining retries", buf, 0x20u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3, CFSTR("retries")));
    v13 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v10 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_retryAutomaticSharing:", v9, 0, Double));
    automaticSharingRetryTimer = self->_automaticSharingRetryTimer;
    self->_automaticSharingRetryTimer = v10;

  }
}

- (void)_retryAutomaticSharing:(id)a3
{
  void *v4;
  NSTimer *automaticSharingRetryTimer;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  NavigationSession *v11;
  __int16 v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  -[NSTimer invalidate](self->_automaticSharingRetryTimer, "invalidate");
  automaticSharingRetryTimer = self->_automaticSharingRetryTimer;
  self->_automaticSharingRetryTimer = 0;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("retries")));
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = sub_100431C0C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = self;
    v12 = 2048;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ - performing scheduled retry of automatic sharing, %lu remaining retries", (uint8_t *)&v10, 0x16u);
  }

  -[NavigationSession _startAutomaticETASharingIfNeeded:](self, "_startAutomaticETASharingIfNeeded:", v7);
}

- (void)navigationStateProvider:(id)a3 didChangeNavigationState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NavigationSession *v8;
  NavigationSession *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  id v16;
  const __CFString *v17;
  id suspendCompletionHandler;
  void (**v19)(_QWORD);
  id v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  NavigationSession *v25;
  __int16 v26;
  const __CFString *v27;

  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    goto LABEL_15;
  v8 = self;
  v9 = v8;
  if (!v8)
  {
    v15 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v10 = (objc_class *)objc_opt_class(v8);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
    v14 = v13;
    if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
    {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

      goto LABEL_8;
    }

  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
  v16 = -[NavigationSession sessionState](v9, "sessionState");
  v17 = CFSTR("NotStarted");
  if (v16 == (id)1)
    v17 = CFSTR("Running");
  *(_DWORD *)buf = 138543874;
  v23 = v15;
  v24 = 2112;
  v25 = v9;
  if (v16 == (id)2)
    v17 = CFSTR("Suspended");
  v26 = 2112;
  v27 = v17;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] %@ - state updated state=%@", buf, 0x20u);

LABEL_15:
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      suspendCompletionHandler = self->_suspendCompletionHandler;
      if (suspendCompletionHandler)
      {
        v19 = (void (**)(_QWORD))objc_retainBlock(suspendCompletionHandler);
        v20 = self->_suspendCompletionHandler;
        self->_suspendCompletionHandler = 0;

        v19[2](v19);
      }
    }
    -[NavigationSession guidanceType](self, "guidanceType");
    goto LABEL_20;
  }
  -[NavigationSession _startAutomaticETASharingIfNeeded:](self, "_startAutomaticETASharingIfNeeded:", GEOConfigGetUInteger(MapsConfig_SharedTripAutomaticSharingRetryCount, off_1014B3AE8));
  if ((id)-[NavigationSession guidanceType](self, "guidanceType") != (id)2)
  {
LABEL_20:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
    objc_msgSend(v21, "mapsSession:didChangeState:", self, -[NavigationSession sessionState](self, "sessionState"));

  }
}

- (void)navigationService:(id)a3 didFinishLoadingTrace:(id)a4
{
  -[NavigationSession setCurrentlyPlayingTraceInfo:](self, "setCurrentlyPlayingTraceInfo:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  void *v8;
  uint64_t v9;
  id v10;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers", a3, *(_QWORD *)&a4, a5, a6));
  if ((a4 - 1) > 5)
    v9 = 1;
  else
    v9 = qword_100E373D8[a4 - 1];
  v10 = v8;
  objc_msgSend(v8, "navigationSession:didChangeCurrentTransportType:", self, v9);

}

- (void)routeCollectionUpdateProvider:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NavigationSession *v11;
  __int16 v12;
  void *v13;

  v5 = a4;
  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDescription"));
    v10 = 138412547;
    v11 = self;
    v12 = 2113;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ - routeCollection updated collection=%{private}@", (uint8_t *)&v10, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSession observers](self, "observers"));
  objc_msgSend(v9, "navigationSession:didUpdateRouteCollection:", self, v5);

}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (NavigationSessionConfiguration)configuration
{
  return self->_configuration;
}

- (NavigationStateProvider)navigationStateProvider
{
  return self->_navigationStateProvider;
}

- (RouteCollectionUpdateProvider)routeCollectionUpdateProvider
{
  return self->_routeCollectionUpdateProvider;
}

- (MNNavigationTraceInfo)currentlyPlayingTraceInfo
{
  return self->_currentlyPlayingTraceInfo;
}

- (void)setCurrentlyPlayingTraceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyPlayingTraceInfo, a3);
}

- (_TtC4Maps28NavigationWaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
  objc_storeStrong((id *)&self->_waypointController, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)hasStartedNavigation
{
  return self->_hasStartedNavigation;
}

- (void)setHasStartedNavigation:(BOOL)a3
{
  self->_hasStartedNavigation = a3;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_currentlyPlayingTraceInfo, 0);
  objc_storeStrong((id *)&self->_routeCollectionUpdateProvider, 0);
  objc_storeStrong((id *)&self->_navigationStateProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong(&self->_suspendCompletionHandler, 0);
  objc_storeStrong((id *)&self->_automaticSharingRetryTimer, 0);
  objc_storeStrong((id *)&self->_pendingAutomaticSharingContacts, 0);
}

- (BOOL)isCarNavigationCompatible
{
  int64_t v3;

  v3 = -[NavigationSession navigationType](self, "navigationType");
  return (id)-[NavigationSession currentTransportType](self, "currentTransportType") == (id)1 && v3 == 3;
}

@end
