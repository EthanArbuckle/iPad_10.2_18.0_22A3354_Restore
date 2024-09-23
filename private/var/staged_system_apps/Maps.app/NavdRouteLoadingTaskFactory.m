@implementation NavdRouteLoadingTaskFactory

- (id)_timing:(id)a3 forTransportType:(int64_t)a4
{
  id v5;
  uint64_t v6;
  NSSet *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;

  v5 = a3;
  if (MapsFeature_IsEnabled_Maps357RoutePlanning(v5, v6))
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126FDC0, &off_10126FDD8, 0);
  else
    v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10126FDC0, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  if (objc_msgSend(v8, "containsObject:", v9))
    v10 = v5;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
  v11 = v10;

  return v11;
}

- (id)factoryByModifyingTransitPreferences:(id)a3 timing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NavdRouteLoadingTaskFactory *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009A6B00;
  v10[3] = &unk_1011DD9A0;
  v11 = a3;
  v12 = self;
  v13 = a4;
  v6 = v13;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory _configurationByModifyingTransportTypeInfoDictionary:](self, "_configurationByModifyingTransportTypeInfoDictionary:", v10));

  return v8;
}

- (id)factoryByModifyingDrivePreferences:(id)a3 timing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NavdRouteLoadingTaskFactory *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009A6CD0;
  v10[3] = &unk_1011DD9A0;
  v11 = a3;
  v12 = self;
  v13 = a4;
  v6 = v13;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory _configurationByModifyingTransportTypeInfoDictionary:](self, "_configurationByModifyingTransportTypeInfoDictionary:", v10));

  return v8;
}

- (id)factoryByModifyingWalkPreferences:(id)a3 timing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NavdRouteLoadingTaskFactory *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009A6EA0;
  v10[3] = &unk_1011DD9A0;
  v11 = a3;
  v12 = self;
  v13 = a4;
  v6 = v13;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory _configurationByModifyingTransportTypeInfoDictionary:](self, "_configurationByModifyingTransportTypeInfoDictionary:", v10));

  return v8;
}

- (id)factoryByModifyingCyclePreferences:(id)a3 timing:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  NavdRouteLoadingTaskFactory *v12;
  id v13;

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009A6FE4;
  v10[3] = &unk_1011DD9A0;
  v11 = a3;
  v12 = self;
  v13 = a4;
  v6 = v13;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory _configurationByModifyingTransportTypeInfoDictionary:](self, "_configurationByModifyingTransportTypeInfoDictionary:", v10));

  return v8;
}

- (id)_configurationByModifyingTransportTypeInfoDictionary:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  id v7;
  RequestTransportTypeInformation *v8;
  NavdRouteLoadingTaskFactory *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  NavdRouteLoadingTaskFactory *v14;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory transportTypeInformation](self, "transportTypeInformation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transportTypeInfoProviders"));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (v4)
    v4[2](v4, v7);
  v8 = -[RequestTransportTypeInformation initWithDictionary:]([RequestTransportTypeInformation alloc], "initWithDictionary:", v7);
  v9 = [NavdRouteLoadingTaskFactory alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory traits](self, "traits"));
  v11 = -[NavdRouteLoadingTaskFactory isResumingMultipointRoute](self, "isResumingMultipointRoute");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory resumeRouteHandle](self, "resumeRouteHandle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory persistentData](self, "persistentData"));
  v14 = -[NavdRouteLoadingTaskFactory initWithTransportTypes:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:](v9, "initWithTransportTypes:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:", v8, v10, v11, v12, v13);

  return v14;
}

- (NavdRouteLoadingTaskFactory)initWithUserDefaults:(id)a3 existingTiming:(id)a4 traits:(id)a5 isResumingMultipointRoute:(BOOL)a6 resumeRouteHandle:(id)a7 persistentData:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  RequestTransportTypeInformation *v16;
  WalkingRequestInfoProvider *v17;
  CyclingRequestInfoProvider *v18;
  CyclePreferences *v19;
  CyclingRequestInfoProvider *v20;
  DrivingRequestInfoProvider *v21;
  DrivePreferences *v22;
  DrivingRequestInfoProvider *v23;
  TransitRequestInfoProvider *v24;
  TransitPreferences *v25;
  TransitRequestInfoProvider *v26;
  void *v27;
  RequestTransportTypeInformation *v28;
  NavdRouteLoadingTaskFactory *v29;
  WalkingRequestInfoProvider *v31;
  WalkPreferences *v32;
  void *v33;
  id v34;
  id v35;
  id v37;
  _BOOL4 v38;
  _QWORD v39[4];
  _QWORD v40[4];

  v38 = a6;
  v12 = a3;
  v13 = a4;
  v37 = a5;
  v35 = a7;
  v33 = v13;
  v34 = a8;
  if (v13)
    v14 = v13;
  else
    v14 = (id)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
  v15 = v14;
  v16 = [RequestTransportTypeInformation alloc];
  v39[0] = &off_10126FDF0;
  v17 = [WalkingRequestInfoProvider alloc];
  v32 = -[WalkPreferences initWithDefaults:]([WalkPreferences alloc], "initWithDefaults:", v12);
  v31 = -[WalkingRequestInfoProvider initWithPreferences:timing:](v17, "initWithPreferences:timing:", v32, v15);
  v40[0] = v31;
  v39[1] = &off_10126FE08;
  v18 = [CyclingRequestInfoProvider alloc];
  v19 = -[CyclePreferences initWithDefaults:]([CyclePreferences alloc], "initWithDefaults:", v12);
  v20 = -[CyclingRequestInfoProvider initWithPreferences:timing:](v18, "initWithPreferences:timing:", v19, v15);
  v40[1] = v20;
  v39[2] = &off_10126FDD8;
  v21 = [DrivingRequestInfoProvider alloc];
  v22 = -[DrivePreferences initWithDefaults:]([DrivePreferences alloc], "initWithDefaults:", v12);
  v23 = -[DrivingRequestInfoProvider initWithPreferences:timing:](v21, "initWithPreferences:timing:", v22, v15);
  v40[2] = v23;
  v39[3] = &off_10126FDC0;
  v24 = [TransitRequestInfoProvider alloc];
  v25 = -[WatchSyncedPreferences initWithDefaults:]([TransitPreferences alloc], "initWithDefaults:", v12);
  v26 = -[TransitRequestInfoProvider initWithPreferences:timing:](v24, "initWithPreferences:timing:", v25, v15);
  v40[3] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 4));
  v28 = -[RequestTransportTypeInformation initWithDictionary:](v16, "initWithDictionary:", v27);

  v29 = -[NavdRouteLoadingTaskFactory initWithTransportTypes:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:](self, "initWithTransportTypes:traits:isResumingMultipointRoute:resumeRouteHandle:persistentData:", v28, v37, v38, v35, v34);
  return v29;
}

- (NavdRouteLoadingTaskFactory)initWithTransportTypes:(id)a3 traits:(id)a4 isResumingMultipointRoute:(BOOL)a5 resumeRouteHandle:(id)a6 persistentData:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NavdRouteLoadingTaskFactory *v17;
  NavdRouteLoadingTaskFactory *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NavdRouteLoadingTaskFactory;
  v17 = -[NavdRouteLoadingTaskFactory init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transportTypeInformation, a3);
    objc_storeStrong((id *)&v18->_traits, a4);
    v18->_isResumingMultipointRoute = a5;
    objc_storeStrong((id *)&v18->_resumeRouteHandle, a6);
    objc_storeStrong((id *)&v18->_persistentData, a7);
  }

  return v18;
}

- (NSSet)supportedTransportTypes
{
  NSSet *supportedTransportTypes;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  supportedTransportTypes = self->_supportedTransportTypes;
  if (!supportedTransportTypes)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory transportTypeInformation](self, "transportTypeInformation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transportTypeInfoProviders"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v8 = self->_supportedTransportTypes;
    self->_supportedTransportTypes = v7;

    supportedTransportTypes = self->_supportedTransportTypes;
  }
  return supportedTransportTypes;
}

- (void)setCountryConfiguration:(id)a3
{
  GEOCountryConfiguration *v5;
  GEOCountryConfiguration *v6;

  v5 = (GEOCountryConfiguration *)a3;
  if (self->_countryConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_countryConfiguration, a3);
    -[RouteRequestBuilderFactory setCountryConfiguration:](self->_routeRequestBuilderFactory, "setCountryConfiguration:", self->_countryConfiguration);
    v5 = v6;
  }

}

- (void)setTraits:(id)a3
{
  GEOMapServiceTraits *v5;

  v5 = (GEOMapServiceTraits *)a3;
  if (self->_traits != v5)
  {
    objc_storeStrong((id *)&self->_traits, a3);
    -[RouteRequestBuilderFactory setTraits:](self->_routeRequestBuilderFactory, "setTraits:", v5);
  }

}

- (void)setIsResumingMultipointRoute:(BOOL)a3
{
  if (self->_isResumingMultipointRoute != a3)
  {
    self->_isResumingMultipointRoute = a3;
    -[RouteRequestBuilderFactory setIsResumingMultipointRoute:](self->_routeRequestBuilderFactory, "setIsResumingMultipointRoute:");
  }
}

- (void)setResumeRouteHandle:(id)a3
{
  GEOResumeRouteHandle *v5;

  v5 = (GEOResumeRouteHandle *)a3;
  if (self->_resumeRouteHandle != v5)
  {
    objc_storeStrong((id *)&self->_resumeRouteHandle, a3);
    -[RouteRequestBuilderFactory setResumeRouteHandle:](self->_routeRequestBuilderFactory, "setResumeRouteHandle:", v5);
  }

}

- (void)setPersistentData:(id)a3
{
  GEOComposedGeometryRoutePersistentData *v5;

  v5 = (GEOComposedGeometryRoutePersistentData *)a3;
  if (self->_persistentData != v5)
  {
    objc_storeStrong((id *)&self->_persistentData, a3);
    -[RouteRequestBuilderFactory setPersistentData:](self->_routeRequestBuilderFactory, "setPersistentData:", v5);
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

- (id)taskForTransportType:(int64_t)a3 waypointSet:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  RouteRequestBuilderFactory *routeRequestBuilderFactory;
  RouteLoadingNavigationServiceTask *v10;
  RouteRequestBuilderFactory *v11;
  RouteRequestBuilderFactory *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  RouteLoadingNavigationServiceTask *v17;
  void *v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory transportTypeInformation](self, "transportTypeInformation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "requestInfoProviderForTransportType:", a3));

  objc_msgSend(v8, "updateWithRefinedWaypoints:", v6);
  if (v8)
  {
    routeRequestBuilderFactory = self->_routeRequestBuilderFactory;
    if (routeRequestBuilderFactory)
    {
      -[RouteRequestBuilderFactory setTransportTypeRequestInfoProvider:](routeRequestBuilderFactory, "setTransportTypeRequestInfoProvider:", v8);
      -[RouteRequestBuilderFactory setWaypointSet:](self->_routeRequestBuilderFactory, "setWaypointSet:", v6);
    }
    else
    {
      v11 = -[RouteRequestBuilderFactory initWithTransportTypeRequestInfoProvider:waypointSet:]([RouteRequestBuilderFactory alloc], "initWithTransportTypeRequestInfoProvider:waypointSet:", v8, v6);
      v12 = self->_routeRequestBuilderFactory;
      self->_routeRequestBuilderFactory = v11;

      if (self->_countryConfiguration)
        -[RouteRequestBuilderFactory setCountryConfiguration:](self->_routeRequestBuilderFactory, "setCountryConfiguration:");
    }
    -[RouteRequestBuilderFactory setInitiator:](self->_routeRequestBuilderFactory, "setInitiator:", self->_initiator);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory traits](self, "traits"));
    -[RouteRequestBuilderFactory setTraits:](self->_routeRequestBuilderFactory, "setTraits:", v13);

    -[RouteRequestBuilderFactory setIsResumingMultipointRoute:](self->_routeRequestBuilderFactory, "setIsResumingMultipointRoute:", -[NavdRouteLoadingTaskFactory isResumingMultipointRoute](self, "isResumingMultipointRoute"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory resumeRouteHandle](self, "resumeRouteHandle"));
    -[RouteRequestBuilderFactory setResumeRouteHandle:](self->_routeRequestBuilderFactory, "setResumeRouteHandle:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteLoadingTaskFactory persistentData](self, "persistentData"));
    -[RouteRequestBuilderFactory setPersistentData:](self->_routeRequestBuilderFactory, "setPersistentData:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilderFactory makeRouteRequestBuilder](self->_routeRequestBuilderFactory, "makeRouteRequestBuilder"));
    v17 = [RouteLoadingNavigationServiceTask alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v10 = -[RouteLoadingNavigationServiceTask initWithNavigationService:routeRequestDetailsBuilder:](v17, "initWithNavigationService:routeRequestDetailsBuilder:", v18, v16);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)taskForRoutes:(id)a3
{
  id v3;
  RouteUpdatingNavigationServiceTask *v4;

  v3 = a3;
  v4 = -[RouteUpdatingNavigationServiceTask initWithRoutes:]([RouteUpdatingNavigationServiceTask alloc], "initWithRoutes:", v3);

  return v4;
}

- (unint64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(unint64_t)a3
{
  self->_initiator = a3;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (BOOL)isResumingMultipointRoute
{
  return self->_isResumingMultipointRoute;
}

- (GEOResumeRouteHandle)resumeRouteHandle
{
  return self->_resumeRouteHandle;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (RequestTransportTypeInformation)transportTypeInformation
{
  return self->_transportTypeInformation;
}

- (RouteRequestBuilderFactory)routeRequestBuilderFactory
{
  return self->_routeRequestBuilderFactory;
}

- (void)setRouteRequestBuilderFactory:(id)a3
{
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeRequestBuilderFactory, 0);
  objc_storeStrong((id *)&self->_transportTypeInformation, 0);
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_countryConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedTransportTypes, 0);
}

@end
