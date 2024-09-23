@implementation RouteRequestBuilder

- (RouteRequestBuilder)initWithWaypointSet:(id)a3 maximumRouteCount:(unint64_t)a4 routeAttributesBuilders:(id)a5 currentUserLocation:(id)a6 initiator:(unint64_t)a7 traits:(id)a8 isResumingMultipointRoute:(BOOL)a9 resumeRouteHandle:(id)a10 persistentData:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RouteRequestBuilder *v21;
  RouteRequestBuilder *v22;
  NSArray *v23;
  NSArray *routeAttributesBuilders;
  GEOLocation *v25;
  GEOLocation *currentUserLocation;
  id v30;
  objc_super v31;

  v16 = a3;
  v30 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  v31.receiver = self;
  v31.super_class = (Class)RouteRequestBuilder;
  v21 = -[RouteRequestBuilder init](&v31, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_waypointSet, a3);
    v22->_maximumRouteCount = a4;
    v23 = (NSArray *)objc_msgSend(v30, "copy");
    routeAttributesBuilders = v22->_routeAttributesBuilders;
    v22->_routeAttributesBuilders = v23;

    v25 = (GEOLocation *)objc_msgSend(v17, "copy");
    currentUserLocation = v22->_currentUserLocation;
    v22->_currentUserLocation = v25;

    v22->_initiator = a7;
    objc_storeStrong((id *)&v22->_traits, a8);
    v22->_isResumingMultipointRoute = a9;
    objc_storeStrong((id *)&v22->_resumeRouteHandle, a10);
    objc_storeStrong((id *)&v22->_persistentData, a11);
  }

  return v22;
}

- (id)buildDirectionsRequestDetails
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  RouteRequestBuilder *v13;
  void *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  char IsEnabled_Maps182;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  id v47;
  int IsEnabled_DrivingMultiWaypointRoutes;
  NSMutableArray *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  RouteRequestBuilder *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEORouteAttributes defaultRouteAttributes](GEORouteAttributes, "defaultRouteAttributes"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder routeAttributesBuilders](self, "routeAttributesBuilders"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v52;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v52 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v8), "fillRouteAttributes:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v6);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder waypointSet](self, "waypointSet"));
  v10 = objc_msgSend(v9, "areAllValidWaypoints");

  if ((v10 & 1) == 0)
  {
    v11 = sub_100431C0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (RouteRequestBuilder *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder waypointSet](self, "waypointSet"));
      *(_DWORD *)buf = 138412290;
      v56 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "making a directions request with waypoints: %@", buf, 0xCu);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder waypointSet](self, "waypointSet"));
  v15 = (unint64_t)objc_msgSend(v14, "count");

  if (v15 <= 1)
  {
    v16 = sub_100431C0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder waypointSet](self, "waypointSet"));
      *(_DWORD *)buf = 134218242;
      v56 = (RouteRequestBuilder *)v15;
      v57 = 2112;
      v58 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Invalid number of waypoints: %lu, waypointSet: %@", buf, 0x16u);

    }
  }
  v19 = objc_msgSend(v3, "mainTransportType");
  switch((int)v19)
  {
    case 1:
    case 6:
      if (v15 >= 2)
        v15 = 2;
      goto LABEL_26;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_22;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_22:
      v22 = 2;
      if (v15 < 2)
        v22 = v15;
      if ((IsEnabled_Maps182 & 1) == 0)
        goto LABEL_25;
      goto LABEL_26;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v19, v20);
      v22 = 2;
      if (v15 < 2)
        v22 = v15;
      if (IsEnabled_DrivingMultiWaypointRoutes)
        goto LABEL_26;
LABEL_25:
      v15 = v22;
LABEL_26:
      v50 = objc_opt_new(NSMutableArray);
      if (v15)
      {
        for (i = 0; i != v15; ++i)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder waypointSet](self, "waypointSet"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "waypointAtIndex:", i));

          if (v25)
          {
            v26 = objc_alloc((Class)GEOMapRegion);
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "latLng"));
            objc_msgSend(v27, "lat");
            v29 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "latLng"));
            objc_msgSend(v30, "lng");
            v32 = objc_msgSend(v26, "initWithLatitude:longitude:", v29, v31);

            v33 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
            objc_msgSend(v25, "setIsOutsideOfflineDownloadedRegion:", objc_msgSend(v33, "isRegionDownloaded:requireFullyDownloaded:", v32, 1) ^ 1);

            v34 = objc_msgSend(v25, "copy");
            -[NSMutableArray addObject:](v50, "addObject:", v34);

          }
        }
      }
      v35 = objc_msgSend(objc_alloc((Class)MNDirectionsRequestDetails), "initWithWaypoints:routeAttributes:", v50, v3);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder traits](self, "traits"));
      objc_msgSend(v35, "setTraits:", v36);

      objc_msgSend(v35, "setMaxRouteCount:", -[RouteRequestBuilder maximumRouteCount](self, "maximumRouteCount"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder currentUserLocation](self, "currentUserLocation"));
      objc_msgSend(v35, "setCurrentUserLocation:", v37);

      objc_msgSend(v35, "setIsResumingMultipointRoute:", -[RouteRequestBuilder isResumingMultipointRoute](self, "isResumingMultipointRoute"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder resumeRouteHandle](self, "resumeRouteHandle"));
      objc_msgSend(v35, "setResumeRouteHandle:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder persistentData](self, "persistentData"));
      objc_msgSend(v35, "setPersistentData:", v39);

      v40 = objc_alloc_init((Class)GEODirectionsRequestFeedback);
      objc_msgSend(v40, "setPurpose:", 4);
      objc_msgSend(v40, "setSource:", -[RouteRequestBuilder sourceFromInitiator](self, "sourceFromInitiator"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bundleIdentifier"));
      objc_msgSend(v40, "setRequestingAppId:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteRequestBuilder appIdentifierForInitiator](self, "appIdentifierForInitiator"));
      objc_msgSend(v40, "setAppIdentifier:", v43);

      objc_msgSend(v35, "setDirectionsRequestFeedback:", v40);
      if (+[PedestrianARSessionTask isPedestrianARModeSupported](PedestrianARSessionTask, "isPedestrianARModeSupported"))
      {
        v44 = objc_opt_new(GEOCommonOptions);
        -[NSObject setSupportsArMode:](v44, "setSupportsArMode:", 1);
        objc_msgSend(v35, "setCommonOptions:", v44);
        v45 = sub_100431C0C();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "[%{public}p] Marking route request with supportsArMode", buf, 0xCu);
        }

      }
      else
      {
        v47 = sub_100431C0C();
        v44 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v56 = self;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "[%{public}p] NOT marking route request with supportsArMode", buf, 0xCu);
        }
      }

      return v35;
  }
}

- (int)sourceFromInitiator
{
  unint64_t v2;

  v2 = -[RouteRequestBuilder initiator](self, "initiator");
  if (v2 > 8)
    return 2;
  else
    return dword_100E3760C[v2];
}

- (id)appIdentifierForInitiator
{
  if ((id)-[RouteRequestBuilder initiator](self, "initiator") == (id)4)
    return CFSTR("com.apple.AssistantServices");
  else
    return 0;
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (unint64_t)maximumRouteCount
{
  return self->_maximumRouteCount;
}

- (NSArray)routeAttributesBuilders
{
  return self->_routeAttributesBuilders;
}

- (GEOLocation)currentUserLocation
{
  return self->_currentUserLocation;
}

- (unint64_t)initiator
{
  return self->_initiator;
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

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
  objc_storeStrong((id *)&self->_resumeRouteHandle, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_routeAttributesBuilders, 0);
  objc_storeStrong((id *)&self->_waypointSet, 0);
}

@end
