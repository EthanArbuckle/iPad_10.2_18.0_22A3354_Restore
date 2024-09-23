@implementation StartNavigationDetailsBuilder

+ (NavigationDetailsOptions)defaultNavigationDetailsOptions
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  NavigationDetailsOptions *result;
  char BOOL;

  *(_QWORD *)&retstr->isReconnecting = 0;
  *(_OWORD *)&retstr->shouldSimulateLocations = 0u;
  *(_OWORD *)&retstr->guidanceType = 0u;
  *(_OWORD *)&retstr->guidanceLevelOverride = xmmword_100E34E90;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v5 = objc_msgSend(v4, "isAuthorizedForPreciseLocation");

  if ((v5 & 1) == 0)
    *(_OWORD *)&retstr->preferredNavigationType = xmmword_100E34EA0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v7 = objc_msgSend(v6, "isInternalInstall");

  if (v7)
  {
    BOOL = GEOConfigGetBOOL(NavigationConfig_SimulationEnabled[0], NavigationConfig_SimulationEnabled[1]);
    result = (NavigationDetailsOptions *)GEOConfigGetBOOL(NavigationConfig_SimulationShouldShowPrompt[0], NavigationConfig_SimulationShouldShowPrompt[1]);
    retstr->shouldSimulateLocations = BOOL & (result ^ 1);
  }
  return result;
}

- (StartNavigationDetailsBuilder)initWithRouteCollection:(id)a3
{
  id v5;
  StartNavigationDetailsBuilder *v6;
  StartNavigationDetailsBuilder *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  unint64_t v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)StartNavigationDetailsBuilder;
  v6 = -[StartNavigationDetailsBuilder init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_routeCollection, a3);
    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions](StartNavigationDetailsBuilder, "defaultNavigationDetailsOptions");
    *(_OWORD *)&v7->_options.shouldSimulateLocations = v9;
    *(_OWORD *)&v7->_options.guidanceType = v10;
    *(_OWORD *)&v7->_options.isReconnecting = v11;
    v7->_options.navigationModeContext = v12;
  }

  return v7;
}

- (StartNavigationDetailsBuilder)initWithTracePlaybackPath:(id)a3 routeCollection:(id)a4
{
  id v7;
  id v8;
  StartNavigationDetailsBuilder *v9;
  StartNavigationDetailsBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)StartNavigationDetailsBuilder;
  v9 = -[StartNavigationDetailsBuilder init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracePlaybackPath, a3);
    v10->_options.preferredNavigationType = 0;
    v10->_options.guidanceType = 0;
    *(_WORD *)&v10->_options.isReconnecting = 0;
    v10->_options.navigationMode = 0;
    *(_OWORD *)&v10->_options.guidanceLevelOverride = xmmword_100E34E90;
    v10->_options.shouldSimulateLocations = 1;
    objc_storeStrong((id *)&v10->_routeCollection, a4);
  }

  return v10;
}

- (id)buildNavigationDetails
{
  id v3;
  void *v4;
  void *v5;
  uint64_t Integer;
  id v7;
  int BOOL;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
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
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  unsigned __int8 v57;
  char v58;
  uint64_t v59;
  uint8_t buf[4];
  __CFString *v61;
  __int16 v62;
  __CFString *v63;

  v3 = objc_alloc_init((Class)MNStartNavigationDetails);
  -[StartNavigationDetailsBuilder options](self, "options");
  objc_msgSend(v3, "setGuidanceType:", v59);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder tracePlaybackPath](self, "tracePlaybackPath"));
  objc_msgSend(v3, "setTracePlaybackPath:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder traceRecordingNameOverride](self, "traceRecordingNameOverride"));
  objc_msgSend(v3, "setTraceRecordingNameOverride:", v5);

  -[StartNavigationDetailsBuilder options](self, "options");
  if (v58)
    Integer = GEOConfigGetInteger(NavigationConfig_SimulationType[0], NavigationConfig_SimulationType[1]);
  else
    Integer = 0;
  objc_msgSend(v3, "setSimulationType:", Integer);
  -[StartNavigationDetailsBuilder options](self, "options");
  objc_msgSend(v3, "setIsReconnecting:", v57);
  v7 = objc_msgSend(v3, "simulationType");
  if (GEOConfigGetBOOL(NavigationConfig_TraceRecordingEnabled[0], NavigationConfig_TraceRecordingEnabled[1]))
  {
    -[StartNavigationDetailsBuilder options](self, "options");
    if (v56 == 2)
      BOOL = GEOConfigGetBOOL(NavigationConfig_TraceRecordingRoutePreviewGuidanceEnabled[0], NavigationConfig_TraceRecordingRoutePreviewGuidanceEnabled[1]);
    else
      BOOL = 1;
  }
  else
  {
    BOOL = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tracePlaybackPath"));
  if (v9)
  {
LABEL_23:

    goto LABEL_24;
  }
  if (v7 == (id)-1)
    v10 = 1;
  else
    v10 = BOOL;
  if (v10 == 1)
  {
    v11 = sub_10043214C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (v7 == (id)-1)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = v13;
      if (BOOL)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      v16 = v15;
      *(_DWORD *)buf = 138543618;
      v61 = v14;
      v62 = 2114;
      v63 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "adding traceRecordingData: forceTraceRecordingForSimulation: %{public}@, shouldRecordTrace: %{public}@", buf, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentRoute"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_traceRecordingData"));

    objc_msgSend(v3, "setTraceRecordingData:", v9);
    goto LABEL_23;
  }
LABEL_24:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routes"));
  objc_msgSend(v3, "setRoutes:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
  objc_msgSend(v3, "setSelectedRouteIndex:", objc_msgSend(v21, "currentRouteIndex"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastLocation"));

  if (v23)
  {
    v24 = objc_msgSend(objc_alloc((Class)MNLocation), "initWithCLLocation:", v23);
    objc_msgSend(v3, "setInitialUserLocation:", v24);

  }
  else
  {
    objc_msgSend(v3, "setInitialUserLocation:", 0);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeAttributes](self, "routeAttributes"));
  objc_msgSend(v3, "setRouteAttributes:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentRoute"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "routeInitializerData"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "directionsRequest"));
  objc_msgSend(v3, "setDirectionsRequest:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentRoute"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "routeInitializerData"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "directionsResponse"));
  objc_msgSend(v3, "setDirectionsResponse:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder traits](self, "traits"));
  objc_msgSend(v3, "setTraits:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bundleIdentifier"));
  objc_msgSend(v3, "setRequestingAppIdentifier:", v36);

  -[StartNavigationDetailsBuilder options](self, "options");
  v37 = v55;
  if (!v55)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "currentRoute"));
    -[StartNavigationDetailsBuilder options](self, "options");
    v37 = objc_msgSend(v39, "suggestedNavigationModeForLocation:context:", v23, v54);

  }
  v40 = 4;
  if (v37 == (id)2)
    v40 = 2;
  if (v37 == (id)1)
    v41 = 3;
  else
    v41 = v40;
  -[StartNavigationDetailsBuilder options](self, "options");
  if (v53)
  {
    -[StartNavigationDetailsBuilder options](self, "options");
    v41 = v52;
    if (!v52)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentRoute"));
      if (MNTransportTypeSupportsTurnByTurn(objc_msgSend(v43, "transportType")))
        v41 = 3;
      else
        v41 = 2;

    }
  }
  -[StartNavigationDetailsBuilder options](self, "options");
  if (v51)
  {
    -[StartNavigationDetailsBuilder options](self, "options");
    if (v50 != 1)
    {
      -[StartNavigationDetailsBuilder options](self, "options");
      v41 = v49;
      if (v49 == 3)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "currentRoute"));
        v46 = MNTransportTypeSupportsTurnByTurn(objc_msgSend(v45, "transportType"));

        if (v46)
          v41 = 3;
        else
          v41 = 2;
      }
    }
  }
  objc_msgSend(v3, "setNavigationType:", v41);
  -[StartNavigationDetailsBuilder options](self, "options");
  objc_msgSend(v3, "setGuidanceLevelOverride:", v48);
  objc_msgSend(v3, "setIsResumingMultipointRoute:", -[StartNavigationDetailsBuilder isResumingMultipointRoute](self, "isResumingMultipointRoute"));

  return v3;
}

- (void)setCountryConfiguration:(id)a3
{
  GEOCountryConfiguration *v5;
  GEOCountryConfiguration **p_countryConfiguration;
  GEOCountryConfiguration *countryConfiguration;
  GEOCountryConfiguration *v8;

  v5 = (GEOCountryConfiguration *)a3;
  countryConfiguration = self->_countryConfiguration;
  p_countryConfiguration = &self->_countryConfiguration;
  if (countryConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_countryConfiguration, a3);
    v5 = v8;
  }

}

- (GEOCountryConfiguration)countryConfiguration
{
  GEOCountryConfiguration *countryConfiguration;

  countryConfiguration = self->_countryConfiguration;
  if (countryConfiguration)
    return countryConfiguration;
  else
    return (GEOCountryConfiguration *)(id)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
}

- (void)setRouteAttributes:(id)a3
{
  id v5;
  GEORouteAttributes **p_routeAttributes;
  GEORouteAttributes *routeAttributes;
  id v8;

  v5 = a3;
  routeAttributes = self->_routeAttributes;
  p_routeAttributes = &self->_routeAttributes;
  v8 = v5;
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", routeAttributes) & 1) == 0)
    objc_storeStrong((id *)p_routeAttributes, a3);

}

- (GEORouteAttributes)routeAttributes
{
  GEORouteAttributes *routeAttributes;
  GEORouteAttributes *v3;
  void *v4;
  void *v5;

  routeAttributes = self->_routeAttributes;
  if (routeAttributes)
  {
    v3 = routeAttributes;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StartNavigationDetailsBuilder routeCollection](self, "routeCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));
    v3 = (GEORouteAttributes *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAttributes"));

  }
  return v3;
}

- (NavigationDetailsOptions)options
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].navigationMode;
  *(_OWORD *)&retstr->shouldSimulateLocations = *(_OWORD *)&self[1].preferredNavigationType;
  *(_OWORD *)&retstr->guidanceType = v3;
  *(_OWORD *)&retstr->isReconnecting = *(_OWORD *)&self[1].guidanceLevelOverride;
  retstr->navigationModeContext = *(_QWORD *)&self[2].shouldSimulateLocations;
  return self;
}

- (void)setOptions:(NavigationDetailsOptions *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->shouldSimulateLocations;
  v4 = *(_OWORD *)&a3->guidanceType;
  v5 = *(_OWORD *)&a3->isReconnecting;
  self->_options.navigationModeContext = a3->navigationModeContext;
  *(_OWORD *)&self->_options.guidanceType = v4;
  *(_OWORD *)&self->_options.isReconnecting = v5;
  *(_OWORD *)&self->_options.shouldSimulateLocations = v3;
}

- (NSString)traceRecordingNameOverride
{
  return self->_traceRecordingNameOverride;
}

- (void)setTraceRecordingNameOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  self->_isResumingMultipointRoute = a3;
}

- (RouteCollection)routeCollection
{
  return self->_routeCollection;
}

- (NSString)tracePlaybackPath
{
  return self->_tracePlaybackPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracePlaybackPath, 0);
  objc_storeStrong((id *)&self->_routeCollection, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_traceRecordingNameOverride, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
}

@end
