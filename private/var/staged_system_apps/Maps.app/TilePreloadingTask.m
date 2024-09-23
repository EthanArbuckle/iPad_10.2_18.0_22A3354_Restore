@implementation TilePreloadingTask

- (TilePreloadingTask)initWithNavigationService:(id)a3 carDisplayController:(id)a4
{
  id v7;
  id v8;
  TilePreloadingTask *v9;
  TilePreloadingTask *v10;
  CarDisplayController *carDisplayController;
  NSString *v12;
  void *v13;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v15 = sub_1004318FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[TilePreloadingTask initWithNavigationService:carDisplayController:]";
      v23 = 2080;
      v24 = "TilePreloadingTask.m";
      v25 = 1024;
      v26 = 53;
      v27 = 2080;
      v28 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)TilePreloadingTask;
  v9 = -[TilePreloadingTask init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_carDisplayController, a4);
    objc_storeStrong((id *)&v10->_navigationService, a3);
    -[MNNavigationService openForClient:](v10->_navigationService, "openForClient:", v10);
    carDisplayController = v10->_carDisplayController;
    v12 = NSStringFromSelector("state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[CarDisplayController addObserver:forKeyPath:options:context:](carDisplayController, "addObserver:forKeyPath:options:context:", v10, v13, 0, 0);

  }
  return v10;
}

- (void)dealloc
{
  CarDisplayController *carDisplayController;
  NSString *v4;
  void *v5;
  objc_super v6;

  carDisplayController = self->_carDisplayController;
  v4 = NSStringFromSelector("state");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[CarDisplayController removeObserver:forKeyPath:context:](carDisplayController, "removeObserver:forKeyPath:context:", self, v5, 0);

  -[MNNavigationService closeForClient:](self->_navigationService, "closeForClient:", self);
  v6.receiver = self;
  v6.super_class = (Class)TilePreloadingTask;
  -[TilePreloadingTask dealloc](&v6, "dealloc");
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
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v6 = a5;
  v7 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[TilePreloadingTask setObservedRoutePlanningSession:](self, "setObservedRoutePlanningSession:", v9);

  v20 = v6;
  v10 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v20, v10) & 1) != 0)
    v11 = v20;
  else
    v11 = 0;
  v12 = v11;

  -[TilePreloadingTask setObservedNavigationSession:](self, "setObservedNavigationSession:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "platformController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));

  v15 = v14;
  v16 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "overlayManager"));
  -[TilePreloadingTask setOverlayManager:](self, "setOverlayManager:", v19);

  -[TilePreloadingTask _clearPreloadingIfNecessary](self, "_clearPreloadingIfNecessary");
}

- (void)_clearPreloadingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedNavigationSession](self, "observedNavigationSession"));

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask navigationService](self, "navigationService"));
      objc_msgSend(v5, "setRoutesForPreview:selectedRouteIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appSessionController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentlyNavigatingPlatformController"));

      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask navigationService](self, "navigationService"));
        objc_msgSend(v9, "stopNavigationWithReason:", 2);

      }
      -[TilePreloadingTask setTileLoadingSession:](self, "setTileLoadingSession:", 0);
    }
  }
}

- (void)setObservedRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *observedRoutePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](observedRoutePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_observedRoutePlanningSession, "addObserver:", self);
    v5 = v7;
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

- (void)setTileLoadingSession:(id)a3
{
  RouteTileLoadingSession *v5;
  RouteTileLoadingSession *v6;
  RouteTileLoadingSession **p_tileLoadingSession;
  RouteTileLoadingSession *tileLoadingSession;
  RouteTileLoadingSession *v9;

  v5 = (RouteTileLoadingSession *)a3;
  tileLoadingSession = self->_tileLoadingSession;
  p_tileLoadingSession = &self->_tileLoadingSession;
  v6 = tileLoadingSession;
  if (tileLoadingSession != v5)
  {
    v9 = v5;
    -[RouteTileLoadingSession stop](v6, "stop");
    objc_storeStrong((id *)p_tileLoadingSession, a3);
    -[RouteTileLoadingSession start](*p_tileLoadingSession, "start");
    v5 = v9;
  }

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  if (a4 == 1)
    -[TilePreloadingTask _updateRoutePreloadingAndNavService](self, "_updateRoutePreloadingAndNavService", a3);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;

  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));

  if (v8 != v7)
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315906;
      v15 = "-[TilePreloadingTask routePlanningSession:didUpdateRouteCollectionResult:forTransportType:]";
      v16 = 2080;
      v17 = "TilePreloadingTask.m";
      v18 = 1024;
      v19 = 159;
      v20 = 2080;
      v21 = "session == self.observedRoutePlanningSession";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v14, 0x26u);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v14 = 138412290;
        v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
  if (objc_msgSend(v7, "currentTransportType") == (id)a5)
    -[TilePreloadingTask _updateRoutePreloadingAndNavService](self, "_updateRoutePreloadingAndNavService");

}

- (void)_updateRoutePreloadingAndNavService
{
  -[TilePreloadingTask _updateNavServiceWithCurrentRouteCollectionInSession](self, "_updateNavServiceWithCurrentRouteCollectionInSession");
  -[TilePreloadingTask _updateRoutePreloadingSessionWithCurrentRouteCollectionInSession](self, "_updateRoutePreloadingSessionWithCurrentRouteCollectionInSession");
}

- (void)_updateRoutePreloadingSessionWithCurrentRouteCollectionInSession
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  RouteTileLoadingSession *v14;
  void *v15;
  void *v16;
  RouteTileLoadingSession *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask currentRouteCollection](self, "currentRouteCollection"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));

  if (!v18)
    goto LABEL_10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "origin"));
  if ((objc_msgSend(v4, "isCurrentLocation") & 1) == 0)
  {

    goto LABEL_10;
  }
  v5 = objc_msgSend(v18, "isOfflineRoute");

  if ((v5 & 1) != 0)
  {
LABEL_10:
    -[TilePreloadingTask setTileLoadingSession:](self, "setTileLoadingSession:", 0);
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask tileLoadingSession](self, "tileLoadingSession"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "route"));
  v8 = objc_msgSend(v18, "isEqual:", v7);

  if ((GEOConfigGetBOOL(MapsConfig_StarkEnableMaps357, off_1014B4798) & 1) == 0
    && (id)-[CarDisplayController state](self->_carDisplayController, "state") == (id)2
    || GEOConfigGetBOOL(VectorKitDebugConfig_DisableMetros[0], VectorKitDebugConfig_DisableMetros[1]))
  {
    v9 = 1;
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    v9 = 0;
    if (!v8)
    {
LABEL_15:
      v14 = [RouteTileLoadingSession alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask overlayManager](self, "overlayManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask traitsForPreloadingSession](self, "traitsForPreloadingSession"));
      v17 = -[RouteTileLoadingSession initWithRoute:overlayManager:traits:options:](v14, "initWithRoute:overlayManager:traits:options:", v18, v15, v16, v9);
      -[TilePreloadingTask setTileLoadingSession:](self, "setTileLoadingSession:", v17);

      goto LABEL_11;
    }
  }
  v10 = objc_claimAutoreleasedReturnValue(-[TilePreloadingTask tileLoadingSession](self, "tileLoadingSession"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask tileLoadingSession](self, "tileLoadingSession"));
    v13 = objc_msgSend(v12, "options");

    if ((id)v9 != v13)
      goto LABEL_15;
  }
LABEL_11:

}

- (void)_updateNavServiceWithCurrentRouteCollectionInSession
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask currentRouteCollection](self, "currentRouteCollection"));
  v7 = v3;
  if (v3)
    v4 = (uint64_t)objc_msgSend(v3, "currentRouteIndex");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask navigationService](self, "navigationService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routes"));
  objc_msgSend(v5, "setRoutesForPreview:selectedRouteIndex:", v6, v4);

}

- (RouteCollection)currentRouteCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedNavigationSession](self, "observedNavigationSession"));
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRouteCollection"));

  return (RouteCollection *)v6;
}

- (id)traitsForPreloadingSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedRoutePlanningSession](self, "observedRoutePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TilePreloadingTask observedNavigationSession](self, "observedNavigationSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traits"));

  }
  return v7;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  CarDisplayController *v11;
  id v12;
  NSString *v13;
  void *v14;
  CarDisplayController *carDisplayController;
  objc_super v16;

  v10 = a3;
  v11 = (CarDisplayController *)a4;
  v12 = a5;
  v13 = NSStringFromSelector("state");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!objc_msgSend(v10, "isEqualToString:", v14))
  {

    goto LABEL_5;
  }
  carDisplayController = self->_carDisplayController;

  if (carDisplayController != v11)
  {
LABEL_5:
    v16.receiver = self;
    v16.super_class = (Class)TilePreloadingTask;
    -[TilePreloadingTask observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_6;
  }
  -[TilePreloadingTask _updateRoutePreloadingSessionWithCurrentRouteCollectionInSession](self, "_updateRoutePreloadingSessionWithCurrentRouteCollectionInSession");
LABEL_6:

}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (CarDisplayController)carDisplayController
{
  return self->_carDisplayController;
}

- (void)setCarDisplayController:(id)a3
{
  objc_storeStrong((id *)&self->_carDisplayController, a3);
}

- (OverlayManager)overlayManager
{
  return self->_overlayManager;
}

- (void)setOverlayManager:(id)a3
{
  objc_storeStrong((id *)&self->_overlayManager, a3);
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (RouteTileLoadingSession)tileLoadingSession
{
  return self->_tileLoadingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileLoadingSession, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_overlayManager, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);
}

@end
