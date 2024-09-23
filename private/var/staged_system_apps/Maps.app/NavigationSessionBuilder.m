@implementation NavigationSessionBuilder

- (NavigationSessionBuilder)initWithRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4 mapServiceTraits:(id)a5 sessionInitiator:(unint64_t)a6 isResumingMultipointRoute:(BOOL)a7 tracePlaybackPath:(id)a8
{
  id v15;
  id v16;
  id v17;
  NavigationSessionBuilder *v18;
  NavigationSessionBuilder *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  NSString *v23;
  NSString *tracePlaybackPath;
  objc_super v26;

  v15 = a3;
  v16 = a5;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)NavigationSessionBuilder;
  v18 = -[NavigationSessionBuilder init](&v26, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_routeCollection, a3);
    v20 = *(_OWORD *)&a4->shouldSimulateLocations;
    v21 = *(_OWORD *)&a4->guidanceType;
    v22 = *(_OWORD *)&a4->isReconnecting;
    v19->_navigationDetailsOptions.navigationModeContext = a4->navigationModeContext;
    *(_OWORD *)&v19->_navigationDetailsOptions.guidanceType = v21;
    *(_OWORD *)&v19->_navigationDetailsOptions.isReconnecting = v22;
    *(_OWORD *)&v19->_navigationDetailsOptions.shouldSimulateLocations = v20;
    objc_storeStrong((id *)&v19->_mapServiceTraits, a5);
    v19->_mapsSessionInitiator = a6;
    v19->_isResumingMultipointRoute = a7;
    v23 = (NSString *)objc_msgSend(v17, "copy");
    tracePlaybackPath = v19->_tracePlaybackPath;
    v19->_tracePlaybackPath = v23;

  }
  return v19;
}

- (id)build
{
  NSString *tracePlaybackPath;
  StartNavigationDetailsBuilder *v4;
  StartNavigationDetailsBuilder *v5;
  StartNavigationDetailsBuilder *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  __int128 v12;
  NavigationSessionConfiguration *v13;
  void *v14;
  NavigationSessionConfiguration *v15;
  NavigationSession *v16;
  _OWORD v18[3];
  unint64_t navigationModeContext;
  uint8_t buf[16];

  tracePlaybackPath = self->_tracePlaybackPath;
  v4 = [StartNavigationDetailsBuilder alloc];
  if (tracePlaybackPath)
    v5 = -[StartNavigationDetailsBuilder initWithTracePlaybackPath:routeCollection:](v4, "initWithTracePlaybackPath:routeCollection:", self->_tracePlaybackPath, self->_routeCollection);
  else
    v5 = -[StartNavigationDetailsBuilder initWithRouteCollection:](v4, "initWithRouteCollection:", self->_routeCollection);
  v6 = v5;
  -[GEOMapServiceTraits useOnlineToOfflineFailoverRequestModeIfAllowed](self->_mapServiceTraits, "useOnlineToOfflineFailoverRequestModeIfAllowed");
  -[StartNavigationDetailsBuilder setTraits:](v6, "setTraits:", self->_mapServiceTraits);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteCollection currentRoute](self->_routeCollection, "currentRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeAttributes"));
  v9 = objc_msgSend(v8, "hasTimepoint");

  if (v9)
  {
    self->_navigationDetailsOptions.preferredNavigationType = 2;
    v10 = sub_100431C0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Changing navigation type to stepping as this is a planned trip", buf, 2u);
    }

  }
  v12 = *(_OWORD *)&self->_navigationDetailsOptions.guidanceType;
  v18[0] = *(_OWORD *)&self->_navigationDetailsOptions.shouldSimulateLocations;
  v18[1] = v12;
  v18[2] = *(_OWORD *)&self->_navigationDetailsOptions.isReconnecting;
  navigationModeContext = self->_navigationDetailsOptions.navigationModeContext;
  -[StartNavigationDetailsBuilder setOptions:](v6, "setOptions:", v18);
  -[StartNavigationDetailsBuilder setIsResumingMultipointRoute:](v6, "setIsResumingMultipointRoute:", self->_isResumingMultipointRoute);
  v13 = [NavigationSessionConfiguration alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder buildNavigationDetails](v6, "buildNavigationDetails"));
  v15 = -[NavigationSessionConfiguration initWithStartNavigationDetails:routeCollection:traits:isETAOnlyMode:](v13, "initWithStartNavigationDetails:routeCollection:traits:isETAOnlyMode:", v14, self->_routeCollection, self->_mapServiceTraits, self->_navigationDetailsOptions.isETAOnlyMode);

  v16 = -[NavigationSession initWithInitiator:configuration:]([NavigationSession alloc], "initWithInitiator:configuration:", self->_mapsSessionInitiator, v15);
  return v16;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (void)setRouteCollection:(id)a3
{
  objc_storeStrong((id *)&self->_routeCollection, a3);
}

- (NavigationDetailsOptions)navigationDetailsOptions
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].preferredNavigationType;
  *(_OWORD *)&retstr->shouldSimulateLocations = *(_OWORD *)&self->navigationModeContext;
  *(_OWORD *)&retstr->guidanceType = v3;
  *(_OWORD *)&retstr->isReconnecting = *(_OWORD *)&self[1].navigationMode;
  retstr->navigationModeContext = self[1].guidanceLevelOverride;
  return self;
}

- (void)setNavigationDetailsOptions:(NavigationDetailsOptions *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->shouldSimulateLocations;
  v4 = *(_OWORD *)&a3->guidanceType;
  v5 = *(_OWORD *)&a3->isReconnecting;
  self->_navigationDetailsOptions.navigationModeContext = a3->navigationModeContext;
  *(_OWORD *)&self->_navigationDetailsOptions.guidanceType = v4;
  *(_OWORD *)&self->_navigationDetailsOptions.isReconnecting = v5;
  *(_OWORD *)&self->_navigationDetailsOptions.shouldSimulateLocations = v3;
}

- (GEOMapServiceTraits)mapServiceTraits
{
  return self->_mapServiceTraits;
}

- (void)setMapServiceTraits:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceTraits, a3);
}

- (unint64_t)mapsSessionInitiator
{
  return self->_mapsSessionInitiator;
}

- (void)setMapsSessionInitiator:(unint64_t)a3
{
  self->_mapsSessionInitiator = a3;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (void)setTracePlaybackPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
  objc_storeStrong((id *)&self->_mapServiceTraits, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
}

@end
