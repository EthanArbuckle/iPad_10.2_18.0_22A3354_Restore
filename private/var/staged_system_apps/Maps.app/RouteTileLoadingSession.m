@implementation RouteTileLoadingSession

- (RouteTileLoadingSession)initWithRoute:(id)a3 overlayManager:(id)a4 traits:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  RouteTileLoadingSession *v15;
  RouteTileLoadingSession *v16;
  RouteTileLoadingSession *v17;
  GEOMapServiceTraits *v18;
  GEOMapServiceTraits *traits;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  v15 = 0;
  if (v11 && v13)
  {
    v21.receiver = self;
    v21.super_class = (Class)RouteTileLoadingSession;
    v16 = -[RouteTileLoadingSession init](&v21, "init");
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_route, a3);
      objc_storeStrong((id *)&v17->_overlayManager, a4);
      v18 = (GEOMapServiceTraits *)objc_msgSend(v14, "copy");
      traits = v17->_traits;
      v17->_traits = v18;

      -[GEOMapServiceTraits setSource:](v17->_traits, "setSource:", 19);
      v17->_drawDebugOverlay = GEOConfigGetBOOL(MapsConfig_NavPreloadDebugOverlayEnabled, off_1014B3E18);
      v17->_options = a6;
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  RouteTileLoadingDebugOverlay *debugOverlay;
  RouteCellularCoverageDebugOverlay *cellularCoverageOverlay;
  objc_super v7;
  uint8_t buf[16];

  if (self->_preloader)
  {
    v3 = sub_100B134DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "session was deallocated without being stopped, cleaning up.", buf, 2u);
    }

    if (self->_drawDebugOverlay)
    {
      debugOverlay = self->_debugOverlay;
      if (debugOverlay)
        -[OverlayManager removeOverlay:fromProvider:](self->_overlayManager, "removeOverlay:fromProvider:", debugOverlay, self);
      cellularCoverageOverlay = self->_cellularCoverageOverlay;
      if (cellularCoverageOverlay)
        -[OverlayManager removeOverlay:fromProvider:](self->_overlayManager, "removeOverlay:fromProvider:", cellularCoverageOverlay, self);
      -[OverlayManager removeOverlayProvider:](self->_overlayManager, "removeOverlayProvider:", self);
    }
    -[GEORoutePreloader stop](self->_preloader, "stop");
    -[GEORoutePreloader tearDown](self->_preloader, "tearDown");
  }
  v7.receiver = self;
  v7.super_class = (Class)RouteTileLoadingSession;
  -[RouteTileLoadingSession dealloc](&v7, "dealloc");
}

- (void)start
{
  id v2;
  NSObject *v3;
  const char *v4;
  id v6;
  RouteTileLoadingDebugOverlay *v7;
  RouteTileLoadingDebugOverlay *debugOverlay;
  RouteCellularCoverageDebugOverlay *v9;
  void *v10;
  RouteCellularCoverageDebugOverlay *v11;
  RouteCellularCoverageDebugOverlay *cellularCoverageOverlay;
  void *v13;
  unsigned int v14;
  id v15;
  id *v16;
  unint64_t options;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int IsEnabled_ShelbyvilleTerrain;
  GEORoutePreloader *v25;
  GEORoutePreloader *preloader;
  void *v27;
  void *v28;
  void *v29;
  __int16 v30;
  id v31;
  id v32;

  if (self->_preloader)
  {
    v2 = sub_100B134DC();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v30 = 0;
      v4 = "Attempted to start while already preloading";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v30, 2u);
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  if (!-[GEOComposedRoute isOfflineRoute](self->_route, "isOfflineRoute"))
  {
    if (self->_drawDebugOverlay)
    {
      -[OverlayManager addOverlayProvider:](self->_overlayManager, "addOverlayProvider:", self);
      v7 = objc_alloc_init(RouteTileLoadingDebugOverlay);
      debugOverlay = self->_debugOverlay;
      self->_debugOverlay = v7;

      -[OverlayManager addOverlay:level:fromProvider:](self->_overlayManager, "addOverlay:level:fromProvider:", self->_debugOverlay, 0, self);
      v9 = [RouteCellularCoverageDebugOverlay alloc];
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTileLoadingSession route](self, "route"));
      v11 = -[RouteCellularCoverageDebugOverlay initWithRoute:](v9, "initWithRoute:", v10);
      cellularCoverageOverlay = self->_cellularCoverageOverlay;
      self->_cellularCoverageOverlay = v11;

      -[OverlayManager addOverlay:level:fromProvider:](self->_overlayManager, "addOverlay:level:fromProvider:", self->_cellularCoverageOverlay, 1, self);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTileLoadingSession route](self, "route"));
    v14 = objc_msgSend(v13, "transportType");

    if (v14 == 1)
    {
      v15 = objc_alloc_init((Class)GEOTransitRoutePreloadStrategy);
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 1, 11, 15);
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 11, 11, 15);
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 13, 11, 15);
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 37, 11, 15);
      objc_msgSend(v15, "setTraits:", self->_traits);
      v32 = v15;
      v16 = &v32;
LABEL_26:
      v3 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 1));

      v25 = (GEORoutePreloader *)objc_msgSend(objc_alloc((Class)GEORoutePreloader), "initWithRoute:strategies:", self->_route, v3);
      preloader = self->_preloader;
      self->_preloader = v25;

      -[GEORoutePreloader setDelegate:](self->_preloader, "setDelegate:", self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v27, "addObserver:selector:name:object:", self->_preloader, "start", UIApplicationWillEnterForegroundNotification, 0);

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v28, "addObserver:selector:name:object:", self, "_tilesFlushed", VKShouldFlushTileCachesNotification, 0);

      -[GEORoutePreloader start](self->_preloader, "start");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
      objc_msgSend(v29, "listenForLocationUpdates:", self);

      goto LABEL_27;
    }
    v15 = objc_alloc_init((Class)GEONavRoutePreloadStrategy);
    objc_msgSend(v15, "setShouldLoadAssets:", GEOConfigGetBOOL(MapsConfig_RoutePreloaderLoadAssets, off_1014B46B8));
    options = self->_options;
    objc_msgSend(v15, "setForceDisableMetros:", options & 1);
    objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 53, 11, 17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteTileLoadingSession route](self, "route"));
    v19 = objc_msgSend(v18, "transportType");

    if (v19)
    {
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 30, 11, 17);
    }
    else if (!GEOConfigGetBOOL(VectorKitConfig_NavigationOffRouteTrafficDisplayEnabled[0], VectorKitConfig_NavigationOffRouteTrafficDisplayEnabled[1]))
    {
LABEL_16:
      if ((options & 1) != 0)
      {
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 1, 11, 17);
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 20, 11, 17);
      }
      else
      {
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 1, 11, 17, 2);
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 20, 11, 17, 2);
      }
      objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 73, 11, 17);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeTileGroup"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeTileSetForStyle:", 68));

      if (v22)
        v23 = 68;
      else
        v23 = 13;
      IsEnabled_ShelbyvilleTerrain = MapsFeature_IsEnabled_ShelbyvilleTerrain(objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", v23, 11, 17));
      if ((options & 1) == 0 && IsEnabled_ShelbyvilleTerrain)
      {
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 58, 11, 17, 1);
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 66, 11, 17, 1);
        objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:restrictions:", 67, 11, 17, 1);
      }
      v31 = v15;
      v16 = &v31;
      goto LABEL_26;
    }
    objc_msgSend(v15, "addTileSetStyle:betweenZoom:andZoom:", 22, 11, 17);
    goto LABEL_16;
  }
  v6 = sub_100B134DC();
  v3 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v30 = 0;
    v4 = "Attempted to preload tiles for an offline route";
    goto LABEL_7;
  }
LABEL_27:

}

- (void)stop
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  GEORoutePreloader *preloader;
  RouteTileLoadingDebugOverlay *debugOverlay;
  RouteCellularCoverageDebugOverlay *cellularCoverageOverlay;
  uint8_t v10[16];

  if (!self->_preloader)
  {
    v3 = sub_100B134DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Stopping route preloading that wasn't started", v10, 2u);
    }

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v5, "stopListeningForLocationUpdates:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self->_preloader);

  -[GEORoutePreloader stop](self->_preloader, "stop");
  -[GEORoutePreloader tearDown](self->_preloader, "tearDown");
  preloader = self->_preloader;
  self->_preloader = 0;

  if (self->_drawDebugOverlay)
  {
    debugOverlay = self->_debugOverlay;
    if (debugOverlay)
      -[OverlayManager removeOverlay:fromProvider:](self->_overlayManager, "removeOverlay:fromProvider:", debugOverlay, self);
    cellularCoverageOverlay = self->_cellularCoverageOverlay;
    if (cellularCoverageOverlay)
      -[OverlayManager removeOverlay:fromProvider:](self->_overlayManager, "removeOverlay:fromProvider:", cellularCoverageOverlay, self);
    -[OverlayManager removeOverlayProvider:](self->_overlayManager, "removeOverlayProvider:", self);
  }
}

- (void)_tilesFlushed
{
  -[GEORoutePreloader stop](self->_preloader, "stop");
  -[GEORoutePreloader start](self->_preloader, "start");
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lastLocation"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_navigation_routeMatch"));

  v5 = v6;
  if (v6)
  {
    -[GEORoutePreloader updateWithRouteMatch:](self->_preloader, "updateWithRouteMatch:", v6);
    v5 = v6;
  }

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)routePreloader:(void *)a3 loadedTileKey:(__int128 *)a4 source:(uint64_t)a5
{
  id v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;

  v8 = a3;
  if (*(_BYTE *)(a1 + 24))
  {
    v9 = *(void **)(a1 + 32);
    if (a5 == 2)
      objc_msgSend(v9, "addLoadedTileKey:", a4);
    else
      objc_msgSend(v9, "addCachedTileKey:", a4);
    v11 = *a4;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100B13C68;
    v10[3] = &unk_1011AED30;
    v10[4] = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }

}

- (void)routePreloader:(uint64_t)a3 failedToLoadTileKey:(__int128 *)a4 error:
{
  _QWORD v6[5];
  __int128 v7;

  if (*(_BYTE *)(a1 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "addFailedKey:", a4);
    v7 = *a4;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B13D44;
    v6[3] = &unk_1011AED30;
    v6[4] = a1;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  RouteTileLoadingDebugOverlay *v7;
  RouteTileLoadingDebugOverlay *v8;
  RouteCellularCoverageDebugOverlayRenderer *v9;
  RouteTileLoadingDebugOverlayRenderer *debugOverlayRenderer;
  RouteTileLoadingDebugOverlayRenderer *v11;
  RouteTileLoadingDebugOverlayRenderer *v12;
  RouteCellularCoverageDebugOverlayRenderer *v13;

  v6 = a3;
  v7 = (RouteTileLoadingDebugOverlay *)a4;
  v8 = v7;
  if (self->_debugOverlay == v7)
  {
    debugOverlayRenderer = self->_debugOverlayRenderer;
    if (!debugOverlayRenderer)
    {
      v11 = -[RouteTileLoadingDebugOverlayRenderer initWithOverlay:]([RouteTileLoadingDebugOverlayRenderer alloc], "initWithOverlay:", v7);
      v12 = self->_debugOverlayRenderer;
      self->_debugOverlayRenderer = v11;

      debugOverlayRenderer = self->_debugOverlayRenderer;
    }
    v13 = debugOverlayRenderer;
    goto LABEL_8;
  }
  if ((RouteTileLoadingDebugOverlay *)self->_cellularCoverageOverlay == v7)
  {
    v13 = -[RouteCellularCoverageDebugOverlayRenderer initWithOverlay:]([RouteCellularCoverageDebugOverlayRenderer alloc], "initWithOverlay:", v7);
LABEL_8:
    v9 = v13;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (unint64_t)options
{
  return self->_options;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_cellularCoverageOverlay, 0);
  objc_storeStrong((id *)&self->_debugOverlayRenderer, 0);
  objc_storeStrong((id *)&self->_debugOverlay, 0);
  objc_storeStrong((id *)&self->_overlayManager, 0);
  objc_storeStrong((id *)&self->_preloader, 0);
}

@end
