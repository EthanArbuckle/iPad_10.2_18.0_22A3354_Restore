@implementation PedestrianARSessionRoutePlanningConfigurationMonitor

- (PedestrianARSessionRoutePlanningConfigurationMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6;
  id v7;
  PedestrianARSessionRoutePlanningConfigurationMonitor *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  char *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARSessionRoutePlanningConfigurationMonitor initWithObserver:platformController:]";
      v21 = 2080;
      v22 = "PedestrianARSessionRoutePlanningConfigurationMonitor.m";
      v23 = 1024;
      v24 = 37;
      v25 = 2080;
      v26 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PedestrianARSessionRoutePlanningConfigurationMonitor;
  v8 = -[PedestrianARSessionMonitor initWithObserver:](&v18, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_10044CE08();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v20 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11 = objc_storeWeak((id *)&v8->_platformController, v7);
    objc_msgSend(v7, "addObserver:", v8);

    -[PedestrianARSessionRoutePlanningConfigurationMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  objc_super v7;
  uint8_t buf[4];
  PedestrianARSessionRoutePlanningConfigurationMonitor *v9;

  v3 = sub_10044CE08();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  objc_msgSend(v6, "removeObserver:", self);

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARSessionRoutePlanningConfigurationMonitor;
  -[PedestrianARSessionMonitor dealloc](&v7, "dealloc");
}

+ (BOOL)isEnabled
{
  return 1;
}

- (void)updateState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  int v22;
  PedestrianARSessionRoutePlanningConfigurationMonitor *v23;
  __int16 v24;
  __CFString *v25;

  v3 = sub_10044CE08();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v22 = 134349056;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating state", (uint8_t *)&v22, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedWaypoints"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin"));
    v9 = objc_msgSend(v8, "isCurrentLocation");

    v10 = sub_10044CE08();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v9)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v13 = v12;
      v22 = 134349314;
      v23 = self;
      v24 = 2112;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Is origin current location: %@", (uint8_t *)&v22, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentRouteCollection"));
    v16 = objc_msgSend(v15, "count");

    v17 = sub_10044CE08();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      if (v16)
        v19 = CFSTR("YES");
      else
        v19 = CFSTR("NO");
      v20 = v19;
      v22 = 134349314;
      v23 = self;
      v24 = 2112;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Has a route: %@", (uint8_t *)&v22, 0x16u);

    }
    if (v16)
      v21 = v9;
    else
      v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", v21);
}

- (void)setRoutePlanningSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  int v9;
  PedestrianARSessionRoutePlanningConfigurationMonitor *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_10044CE08();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating route planning session: %@", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v8 = objc_storeWeak((id *)&self->_routePlanningSession, v4);
  objc_msgSend(v4, "addObserver:", self);

}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v17;

  v3 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
  if (v17)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedWaypoints"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "origin"));
  if (objc_msgSend(v9, "isCurrentLocation"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRoutePlanningConfigurationMonitor routePlanningSession](self, "routePlanningSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentRouteCollection"));
  if (v13)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nis in route planning: %@\nis origin current location: %@\nhas route: %@\n"), v4, v6, v11, v14));

  return (NSString *)v15;
}

+ (id)friendlyName
{
  return CFSTR("Route Planning Configuration Monitor");
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
  -[PedestrianARSessionRoutePlanningConfigurationMonitor setRoutePlanningSession:](self, "setRoutePlanningSession:", v8);

  -[PedestrianARSessionRoutePlanningConfigurationMonitor updateState](self, "updateState");
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  PedestrianARSessionRoutePlanningConfigurationMonitor *v9;
  __int16 v10;
  id v11;

  v5 = a4;
  v6 = sub_10044CE08();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning session finished resolving waypoints: %@", (uint8_t *)&v8, 0x16u);
  }

  -[PedestrianARSessionRoutePlanningConfigurationMonitor updateState](self, "updateState");
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  PedestrianARSessionRoutePlanningConfigurationMonitor *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;

  v7 = a4;
  v8 = sub_10044CE08();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(a5 - 1) > 4)
      v10 = CFSTR("Undefined");
    else
      v10 = off_1011B7280[a5 - 1];
    v11 = 134349570;
    v12 = self;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning session updated its route collection: %@ for transport type: %@", (uint8_t *)&v11, 0x20u);
  }

  -[PedestrianARSessionRoutePlanningConfigurationMonitor updateState](self, "updateState");
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return (RoutePlanningSession *)objc_loadWeakRetained((id *)&self->_routePlanningSession);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routePlanningSession);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
