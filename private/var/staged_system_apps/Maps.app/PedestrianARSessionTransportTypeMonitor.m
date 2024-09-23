@implementation PedestrianARSessionTransportTypeMonitor

- (PedestrianARSessionTransportTypeMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6;
  id v7;
  PedestrianARSessionTransportTypeMonitor *v8;
  id v9;
  NSObject *v10;
  id v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  char *v32;
  objc_super v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[PedestrianARSessionTransportTypeMonitor initWithObserver:platformController:]";
      v36 = 2080;
      v37 = "PedestrianARSessionTransportTypeMonitor.m";
      v38 = 1024;
      v39 = 39;
      v40 = 2080;
      v41 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v7)
  {
    v28 = sub_1004318FC();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[PedestrianARSessionTransportTypeMonitor initWithObserver:platformController:]";
      v36 = 2080;
      v37 = "PedestrianARSessionTransportTypeMonitor.m";
      v38 = 1024;
      v39 = 40;
      v40 = 2080;
      v41 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v30 = sub_1004318FC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v32 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)PedestrianARSessionTransportTypeMonitor;
  v8 = -[PedestrianARSessionMonitor initWithObserver:](&v33, "initWithObserver:", v6);
  if (v8)
  {
    v9 = sub_10087BA60();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v35 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v11 = objc_storeWeak((id *)&v8->_platformController, v7);
    objc_msgSend(v7, "addObserver:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&v8->_platformController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    v14 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      v15 = v13;
    else
      v15 = 0;
    v16 = v15;

    -[PedestrianARSessionTransportTypeMonitor setRoutePlanningSession:](v8, "setRoutePlanningSession:", v16);
    v17 = objc_loadWeakRetained((id *)&v8->_platformController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentSession"));

    v19 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      v20 = v18;
    else
      v20 = 0;
    v21 = v20;

    -[PedestrianARSessionTransportTypeMonitor setNavigationSession:](v8, "setNavigationSession:", v21);
    -[PedestrianARSessionTransportTypeMonitor updateState](v8, "updateState");
  }

  return v8;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  PedestrianARSessionTransportTypeMonitor *v10;

  v3 = sub_10087BA60();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  objc_msgSend(v6, "removeObserver:", self);

  v7 = objc_loadWeakRetained((id *)&self->_navigationSession);
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionTransportTypeMonitor;
  -[PedestrianARSessionMonitor dealloc](&v8, "dealloc");
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2;
  void *v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  v2 = MapsConfig_PedestrianARSessionTransportTypeMonitorEnabled;
  v3 = off_1014B3FA8;
  result.var0.var1 = v3;
  *(_QWORD *)&result.var0.var0 = v2;
  return result;
}

- (void)updateState
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  PedestrianARSessionTransportTypeMonitor *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  PedestrianARSessionTransportTypeMonitor *v14;

  v3 = sub_10087BA60();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating state", (uint8_t *)&v13, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor routePlanningSession](self, "routePlanningSession"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor routePlanningSession](self, "routePlanningSession"));
    v7 = objc_msgSend(v6, "currentTransportType") == (id)2;
    v8 = self;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor navigationSession](self, "navigationSession"));

    if (!v9)
    {
      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 0);
      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor navigationSession](self, "navigationSession"));
    if (objc_msgSend(v6, "currentTransportType") == (id)2)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor navigationSession](self, "navigationSession"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRouteCollection"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRoute"));
      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", objc_msgSend(v12, "isWalkingOnlyTransitRoute") ^ 1);

      goto LABEL_6;
    }
    v8 = self;
    v7 = 0;
  }
  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](v8, "setShouldShowPedestrianAR:", v7);
LABEL_6:

}

- (void)setRoutePlanningSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  int v9;
  PedestrianARSessionTransportTypeMonitor *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_10087BA60();
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

- (void)setNavigationSession:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  int v9;
  PedestrianARSessionTransportTypeMonitor *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = sub_10087BA60();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134349314;
    v10 = self;
    v11 = 2112;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating navigation session: %@", (uint8_t *)&v9, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  v8 = objc_storeWeak((id *)&self->_navigationSession, v4);
  objc_msgSend(v4, "addObserver:", self);

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor routePlanningSession](self, "routePlanningSession"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor routePlanningSession](self, "routePlanningSession"));
    v5 = (char *)objc_msgSend(v4, "currentTransportType");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor navigationSession](self, "navigationSession"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionTransportTypeMonitor navigationSession](self, "navigationSession"));
      v5 = (char *)objc_msgSend(v6, "currentTransportType");

    }
    else
    {
      v5 = 0;
    }
  }

  v7 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  if ((unint64_t)(v5 - 1) > 4)
    v10 = CFSTR("Undefined");
  else
    v10 = off_1011D9C50[(_QWORD)(v5 - 1)];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\ntransport type: %@\n"), v8, v10));

  return (NSString *)v11;
}

+ (id)friendlyName
{
  return CFSTR("Transport Type Monitor");
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
  id v13;

  v6 = a5;
  v7 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[PedestrianARSessionTransportTypeMonitor setRoutePlanningSession:](self, "setRoutePlanningSession:", v9);

  v13 = v6;
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
    v11 = v13;
  else
    v11 = 0;
  v12 = v11;

  -[PedestrianARSessionTransportTypeMonitor setNavigationSession:](self, "setNavigationSession:", v12);
  -[PedestrianARSessionTransportTypeMonitor updateState](self, "updateState");

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v6;
  NSObject *v7;
  int v8;
  PedestrianARSessionTransportTypeMonitor *v9;

  v6 = sub_10087BA60();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning changed transport type", (uint8_t *)&v8, 0xCu);
  }

  -[PedestrianARSessionTransportTypeMonitor updateState](self, "updateState");
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  PedestrianARSessionTransportTypeMonitor *v8;

  v5 = sub_10087BA60();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Navigation changed transport type", (uint8_t *)&v7, 0xCu);
  }

  -[PedestrianARSessionTransportTypeMonitor updateState](self, "updateState");
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  PedestrianARSessionTransportTypeMonitor *v9;
  __int16 v10;
  id v11;

  v5 = a4;
  v6 = sub_10087BA60();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Navigation updated route collection: %@", (uint8_t *)&v8, 0x16u);
  }

  -[PedestrianARSessionTransportTypeMonitor updateState](self, "updateState");
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

- (NavigationSession)navigationSession
{
  return (NavigationSession *)objc_loadWeakRetained((id *)&self->_navigationSession);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_destroyWeak((id *)&self->_routePlanningSession);
  objc_destroyWeak((id *)&self->_platformController);
}

@end
