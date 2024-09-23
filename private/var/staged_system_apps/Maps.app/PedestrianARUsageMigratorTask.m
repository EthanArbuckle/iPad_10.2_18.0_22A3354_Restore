@implementation PedestrianARUsageMigratorTask

- (PedestrianARUsageMigratorTask)initWithUsageTracker:(id)a3
{
  id v5;
  PedestrianARUsageMigratorTask *v6;
  id v7;
  NSObject *v8;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;

  v5 = a3;
  if (!v5)
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[PedestrianARUsageMigratorTask initWithUsageTracker:]";
      v18 = 2080;
      v19 = "PedestrianARUsageMigratorTask.m";
      v20 = 1024;
      v21 = 45;
      v22 = 2080;
      v23 = "usageTracker != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PedestrianARUsageMigratorTask;
  v6 = -[PedestrianARUsageMigratorTask init](&v15, "init");
  if (v6)
  {
    v7 = sub_1008EF45C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v17 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v6->_usageTracker, a3);
  }

  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  PedestrianARUsageMigratorTask *v7;

  v3 = sub_1008EF45C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)PedestrianARUsageMigratorTask;
  -[PedestrianARUsageMigratorTask dealloc](&v5, "dealloc");
}

- (void)setRoutePlanningSession:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  id WeakRetained;
  id v9;
  id obj;

  v4 = a3;
  v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_routePlanningSession);
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    obj = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
      objc_msgSend(WeakRetained, "removeObserver:", self);

      v9 = objc_storeWeak((id *)&self->_routePlanningSession, obj);
      objc_msgSend(obj, "addObserver:", self);

      v6 = (unint64_t)obj;
    }
  }

}

- (void)setNavigationSession:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  id WeakRetained;
  id v9;
  id obj;

  v4 = a3;
  v5 = (unint64_t)objc_loadWeakRetained((id *)&self->_navigationSession);
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    obj = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)obj;
    if ((v7 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);
      objc_msgSend(WeakRetained, "removeObserver:", self);

      v9 = objc_storeWeak((id *)&self->_navigationSession, obj);
      objc_msgSend(obj, "addObserver:", self);

      v6 = (unint64_t)obj;
    }
  }

}

- (void)setRouteCollection:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  PedestrianARUsageMigratorTask *v18;

  v5 = a3;
  v6 = self->_routeCollection;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection currentRoute](self->_routeCollection, "currentRoute"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueRouteID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "currentRoute"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueRouteID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));

      if (v11 && v14 && (objc_msgSend(v11, "isEqualToString:", v14) & 1) == 0)
      {
        v15 = sub_1008EF45C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = 134349056;
          v18 = self;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Detected route ID changed; migrating usage flags now",
            (uint8_t *)&v17,
            0xCu);
        }

        -[PedestrianARSessionUsageTracker migrateUsageFromRoute:toRoute:](self->_usageTracker, "migrateUsageFromRoute:toRoute:", v11, v14);
      }
      objc_storeStrong((id *)&self->_routeCollection, a3);

    }
  }

}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a5;
  v7 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[PedestrianARUsageMigratorTask setRoutePlanningSession:](self, "setRoutePlanningSession:", v9);

  v17 = v6;
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v17, v10) & 1) != 0)
    v11 = v17;
  else
    v11 = 0;
  v12 = v11;

  -[PedestrianARUsageMigratorTask setNavigationSession:](self, "setNavigationSession:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARUsageMigratorTask routePlanningSession](self, "routePlanningSession"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentRouteCollection"));
  if (v14)
  {
    -[PedestrianARUsageMigratorTask setRouteCollection:](self, "setRouteCollection:", v14);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARUsageMigratorTask navigationSession](self, "navigationSession"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRouteCollection"));
    -[PedestrianARUsageMigratorTask setRouteCollection:](self, "setRouteCollection:", v16);

  }
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  -[PedestrianARUsageMigratorTask setRouteCollection:](self, "setRouteCollection:", a4);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "currentRouteCollection"));
  -[PedestrianARUsageMigratorTask setRouteCollection:](self, "setRouteCollection:", v6);

}

- (PedestrianARSessionUsageTracker)usageTracker
{
  return self->_usageTracker;
}

- (void)setUsageTracker:(id)a3
{
  objc_storeStrong((id *)&self->_usageTracker, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return (RoutePlanningSession *)objc_loadWeakRetained((id *)&self->_routePlanningSession);
}

- (NavigationSession)navigationSession
{
  return (NavigationSession *)objc_loadWeakRetained((id *)&self->_navigationSession);
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_destroyWeak((id *)&self->_routePlanningSession);
  objc_storeStrong((id *)&self->_usageTracker, 0);
}

@end
