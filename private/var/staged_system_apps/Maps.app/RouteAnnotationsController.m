@implementation RouteAnnotationsController

- (RouteAnnotationsController)init
{
  RouteAnnotationsController *v2;
  id v3;
  NSObject *v4;
  RouteAnnotationsConfiguration *v5;
  RouteAnnotationsConfiguration *configuration;
  RouteTrafficFeatureCalculator *v7;
  RouteTrafficFeatureCalculator *routeTrafficFeatureCalculator;
  RouteTrafficFeaturesUpdater *v9;
  RouteTrafficFeaturesUpdater *trafficFeaturesUpdater;
  void *v11;
  void *v12;
  void *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *routeContextQueue;
  uint64_t v18;
  NSMutableArray *annotationTextUpdaters;
  objc_super v21;
  uint8_t buf[4];
  RouteAnnotationsController *v23;

  v21.receiver = self;
  v21.super_class = (Class)RouteAnnotationsController;
  v2 = -[RouteAnnotationsController init](&v21, "init");
  if (v2)
  {
    v3 = sub_1007F1D44();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v23 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = objc_alloc_init(RouteAnnotationsConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v5;

    v7 = objc_alloc_init(RouteTrafficFeatureCalculator);
    routeTrafficFeatureCalculator = v2->_routeTrafficFeatureCalculator;
    v2->_routeTrafficFeatureCalculator = v7;

    v9 = objc_alloc_init(RouteTrafficFeaturesUpdater);
    trafficFeaturesUpdater = v2->_trafficFeaturesUpdater;
    v2->_trafficFeaturesUpdater = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v2, CFSTR("__internal__AlwaysShowRouteTraffic"), 0, off_1014B22A8);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
    objc_msgSend(v12, "addObserver:", v2);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
    objc_msgSend(v13, "addObserver:", v2);

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.Maps.RouteAnnotations.RouteContext", v15);
    routeContextQueue = v2->_routeContextQueue;
    v2->_routeContextQueue = (OS_dispatch_queue *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    annotationTextUpdaters = v2->_annotationTextUpdaters;
    v2->_annotationTextUpdaters = (NSMutableArray *)v18;

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  NSString *v19;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  RouteAnnotationsController *v36;

  v3 = sub_1007F1D44();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("__internal__AlwaysShowRouteTraffic"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
  objc_msgSend(v7, "removeObserver:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VKPolylineGroupOverlay polylines](self->_routesGroupOverlay, "polylines"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v9;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composedRoute"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waypoints"));

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
              v19 = NSStringFromSelector("styleAttributes");
              v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
              objc_msgSend(v18, "removeObserver:forKeyPath:", self, v20);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v15);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  v24.receiver = self;
  v24.super_class = (Class)RouteAnnotationsController;
  -[RouteAnnotationsController dealloc](&v24, "dealloc");
}

- (void)setMapView:(id)a3
{
  id v4;
  NSObject *v5;
  VKPolylineGroupOverlay *routesGroupOverlay;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  NSString *v15;
  void *v16;
  id v17;
  NSObject *v18;
  VKPolylineGroupOverlay *v19;
  MKMapView *mapView;
  VKPolylineGroupOverlay *v21;
  MKMapView *v23;
  id *location;
  id obj;
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  RouteAnnotationsController *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  MKMapView *v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v23 = (MKMapView *)a3;
  location = (id *)&self->_mapView;
  if (self->_mapView != v23)
  {
    v4 = sub_1007F1D44();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v39 = self;
      v40 = 2048;
      v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Setting map view: %p", buf, 0x16u);
    }

    routesGroupOverlay = self->_routesGroupOverlay;
    if (routesGroupOverlay)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[VKPolylineGroupOverlay polylines](routesGroupOverlay, "polylines"));
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      if (v27)
      {
        v26 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v26)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v33 = 0u;
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "composedRoute"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypoints"));

            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v11; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v31 != v12)
                    objc_enumerationMutation(v10);
                  v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)j);
                  v15 = NSStringFromSelector("styleAttributes");
                  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
                  objc_msgSend(v14, "removeObserver:forKeyPath:", self, v16);

                }
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
              }
              while (v11);
            }

          }
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
        }
        while (v27);
      }

      v17 = sub_1007F1D44();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = self->_routesGroupOverlay;
        mapView = self->_mapView;
        *(_DWORD *)buf = 134349568;
        v39 = self;
        v40 = 2048;
        v41 = v19;
        v42 = 2048;
        v43 = mapView;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Removing existing routes group overlay: %p from map view: %p", buf, 0x20u);
      }

      -[MKMapView _removePersistentVectorOverlay:](self->_mapView, "_removePersistentVectorOverlay:", self->_routesGroupOverlay);
      v21 = self->_routesGroupOverlay;
      self->_routesGroupOverlay = 0;

    }
    objc_msgSend(*location, "_clearRouteContext");
    objc_storeStrong(location, a3);
    if (*location)
    {
      -[RouteAnnotationsController _updateOverlaysInGroupOverlay](self, "_updateOverlaysInGroupOverlay");
      -[RouteAnnotationsController _updateSelectedOverlayInGroupOverlay](self, "_updateSelectedOverlayInGroupOverlay");
      objc_initWeak((id *)buf, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1007F2414;
      v28[3] = &unk_1011AD4F0;
      objc_copyWeak(&v29, (id *)buf);
      -[RouteAnnotationsController _updateMapViewRouteContextForced:withFinishedHandler:](self, "_updateMapViewRouteContextForced:withFinishedHandler:", 0, v28);
      -[RouteAnnotationsController _updateTrafficFeatures](self, "_updateTrafficFeatures");
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (VKPolylineGroupOverlay)routesGroupOverlay
{
  VKPolylineGroupOverlay *routesGroupOverlay;
  VKPolylineGroupOverlay *v4;
  VKPolylineGroupOverlay *v5;
  void *v6;
  MKMapView *mapView;
  id v8;
  NSObject *v9;
  NSObject *v10;
  VKPolylineGroupOverlay *v11;
  MKMapView *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  VKPolylineGroupOverlay *v17;
  int v19;
  RouteAnnotationsController *v20;
  __int16 v21;
  VKPolylineGroupOverlay *v22;
  __int16 v23;
  MKMapView *v24;

  routesGroupOverlay = self->_routesGroupOverlay;
  if (!routesGroupOverlay)
  {
    v4 = (VKPolylineGroupOverlay *)objc_alloc_init((Class)VKPolylineGroupOverlay);
    v5 = self->_routesGroupOverlay;
    self->_routesGroupOverlay = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[VKPolylineGroupOverlay setShowTraffic:](self->_routesGroupOverlay, "setShowTraffic:", objc_msgSend(v6, "BOOLForKey:", CFSTR("__internal__AlwaysShowRouteTraffic")));

    -[MKMapView _addPersistentVectorOverlay:](self->_mapView, "_addPersistentVectorOverlay:", self->_routesGroupOverlay);
    mapView = self->_mapView;
    v8 = sub_1007F1D44();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (mapView)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = self->_routesGroupOverlay;
        v12 = self->_mapView;
        v19 = 134349568;
        v20 = self;
        v21 = 2048;
        v22 = v11;
        v23 = 2048;
        v24 = v12;
        v13 = "[%{public}p] Created a new routes group overlay %p and map view: %p";
        v14 = v10;
        v15 = OS_LOG_TYPE_INFO;
        v16 = 32;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v19, v16);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v17 = self->_routesGroupOverlay;
      v19 = 134349312;
      v20 = self;
      v21 = 2048;
      v22 = v17;
      v13 = "[%{public}p] Created a new routes group overlay %p but we had no map; this overlay will not be rendered anywhere";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 22;
      goto LABEL_7;
    }

    routesGroupOverlay = self->_routesGroupOverlay;
  }
  return routesGroupOverlay;
}

- (id)_routeContextBuilder
{
  MKRouteContextBuilder *routeContextBuilder;
  MKRouteContextBuilder *v4;
  MKRouteContextBuilder *v5;

  routeContextBuilder = self->_routeContextBuilder;
  if (!routeContextBuilder)
  {
    v4 = (MKRouteContextBuilder *)objc_alloc_init((Class)MKRouteContextBuilder);
    v5 = self->_routeContextBuilder;
    self->_routeContextBuilder = v4;

    routeContextBuilder = self->_routeContextBuilder;
  }
  return routeContextBuilder;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  unsigned int v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014B22A8 == a6)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("__internal__AlwaysShowRouteTraffic")))
    {
      -[RouteAnnotationsController _showRouteTrafficPreferenceChanged](self, "_showRouteTrafficPreferenceChanged");
    }
    else
    {
      v13 = NSStringFromSelector("styleAttributes");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v10, "isEqualToString:", v14);

      if (v15)
      {
        objc_initWeak(&location, self);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_1007F27A8;
        v17[3] = &unk_1011AD4F0;
        objc_copyWeak(&v18, &location);
        -[RouteAnnotationsController _updateMapViewRouteContextForced:withFinishedHandler:](self, "_updateMapViewRouteContextForced:withFinishedHandler:", 1, v17);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        -[RouteAnnotationsController observeValueForKeyPath:ofObject:change:context:](&v16, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, RouteAnnotationsController);
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)RouteAnnotationsController;
    -[RouteAnnotationsController observeValueForKeyPath:ofObject:change:context:](&v20, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v16.receiver, v16.super_class);
  }

}

- (void)_showRouteTrafficPreferenceChanged
{
  id v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v5, "BOOLForKey:", CFSTR("__internal__AlwaysShowRouteTraffic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  objc_msgSend(v4, "setShowTraffic:", v3);

}

- (void)updateConfigurationWithBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  if (a3)
  {
    v4 = (void (**)(id, id))a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v6 = objc_msgSend(v5, "mutableCopy");

    v4[2](v4, v6);
    -[RouteAnnotationsController setConfiguration:](self, "setConfiguration:", v6);

  }
}

- (RouteAnnotationsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  RouteAnnotationsConfiguration *v4;
  id v5;
  NSObject *v6;
  RouteAnnotationsConfiguration *v7;
  RouteAnnotationsConfiguration *v8;
  RouteAnnotationsConfiguration *configuration;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  unint64_t v32;
  RouteAnnotationsConfiguration *v33;
  id v34;
  void *v35;
  id v36;
  int v37;
  unsigned int v38;
  int v39;
  unsigned int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  char v46;
  id v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  unsigned __int8 v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  unsigned __int8 v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  unsigned int v79;
  int v80;
  RouteAnnotationsConfiguration *v81;
  _QWORD v82[4];
  id v83;
  char v84;
  BOOL v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint8_t v95[128];
  uint8_t buf[4];
  RouteAnnotationsController *v97;
  __int16 v98;
  RouteAnnotationsConfiguration *v99;

  v4 = (RouteAnnotationsConfiguration *)a3;
  if (self->_configuration == v4)
    goto LABEL_82;
  v5 = sub_1007F1D44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v97 = self;
    v98 = 2112;
    v99 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating configuration: %@", buf, 0x16u);
  }
  v81 = v4;

  v7 = self->_configuration;
  v8 = (RouteAnnotationsConfiguration *)-[RouteAnnotationsConfiguration copy](v4, "copy");
  configuration = self->_configuration;
  self->_configuration = v8;

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](v7, "routes"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v91 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "unregisterObserver:", self);
        objc_msgSend(v14, "_maps_removeTrafficIncidentsObserver:", self);
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v11);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](self->_configuration, "routes"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(_QWORD *)v87 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j);
        if (!-[RouteAnnotationsConfiguration alternateRoutesEnabled](self->_configuration, "alternateRoutesEnabled"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration selectedRoute](self->_configuration, "selectedRoute"));
          v21 = v19 == v20;

          if (!v21)
            continue;
        }
        objc_msgSend(v19, "registerObserver:", self);
        objc_msgSend(v19, "_maps_addTrafficIncidentsObserver:", self);
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
    }
    while (v16);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](v7, "routes"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](self->_configuration, "routes"));
  v24 = v22 != v23;
  if (v22 == v23)
  {
    v28 = v22;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](v7, "routes"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](self->_configuration, "routes"));
    v27 = objc_msgSend(v25, "isEqualToArray:", v26);

    if ((v27 & 1) != 0)
    {
      v24 = 0;
      goto LABEL_27;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](self->_configuration, "routes"));
    v29 = sub_10039DCD4(v28, &stru_1011C94E0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
    objc_msgSend(v30, "setRoutes:", v22);

  }
LABEL_27:
  v31 = -[RouteAnnotationsConfiguration selectedRouteIndex](v7, "selectedRouteIndex");
  v32 = -[RouteAnnotationsConfiguration selectedRouteIndex](self->_configuration, "selectedRouteIndex");
  v33 = self->_configuration;
  if (v31 == (id)v32 && (v7 != 0) != (v33 == 0))
  {
    HIDWORD(v77) = 0;
    v79 = v24;
  }
  else
  {
    v34 = -[RouteAnnotationsConfiguration selectedRouteIndex](v33, "selectedRouteIndex");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
    objc_msgSend(v35, "setSelectedRouteIndex:", v34);

    v79 = v24 | !-[RouteAnnotationsConfiguration alternateRoutesEnabled](v7, "alternateRoutesEnabled");
    v24 = 1;
    HIDWORD(v77) = 1;
  }
  v36 = -[RouteAnnotationsConfiguration focusedRouteIndex](v7, "focusedRouteIndex");
  v37 = v36 != (id)-[RouteAnnotationsConfiguration focusedRouteIndex](self->_configuration, "focusedRouteIndex") || v24;
  v80 = v37;
  v38 = -[RouteAnnotationsConfiguration alternateRoutesEnabled](v7, "alternateRoutesEnabled");
  v39 = v80;
  v78 = v24;
  if (v38 != -[RouteAnnotationsConfiguration alternateRoutesEnabled](self->_configuration, "alternateRoutesEnabled"))
  {
    v39 = 1;
    v78 = 1;
    v79 = 1;
  }
  v40 = -[RouteAnnotationsConfiguration selectsPolyline](v7, "selectsPolyline");
  if (v40 == -[RouteAnnotationsConfiguration selectsPolyline](self->_configuration, "selectsPolyline"))
  {
    if (-[RouteAnnotationsConfiguration selectsPolyline](self->_configuration, "selectsPolyline"))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "selectedPolyline"));
      LODWORD(v77) = v42 == 0;

    }
    else
    {
      LODWORD(v77) = 0;
    }
  }
  else
  {
    LODWORD(v77) = 1;
  }
  v43 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration originalRouteID](v7, "originalRouteID"));
  v44 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration originalRouteID](self->_configuration, "originalRouteID"));
  if (v43 | v44)
    v76 = objc_msgSend((id)v43, "isEqual:", v44);
  else
    v76 = 1;

  v75 = -[RouteAnnotationsConfiguration routeTrafficFeaturesActive](v7, "routeTrafficFeaturesActive");
  v74 = -[RouteAnnotationsConfiguration routeTrafficFeaturesActive](self->_configuration, "routeTrafficFeaturesActive");
  v45 = -[RouteAnnotationsConfiguration routeMarkerOptions](v7, "routeMarkerOptions");
  if (v45 == (id)-[RouteAnnotationsConfiguration routeMarkerOptions](self->_configuration, "routeMarkerOptions"))
    v46 = v39;
  else
    v46 = 1;
  v47 = -[RouteAnnotationsConfiguration style](v7, "style");
  if (v47 != (id)-[RouteAnnotationsConfiguration style](self->_configuration, "style"))
  {
    v48 = -[RouteAnnotationsConfiguration style](self->_configuration, "style");
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
    objc_msgSend(v49, "setFormattingStyle:", v48);

    v46 = 1;
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration selectedRouteCustomText](v7, "selectedRouteCustomText"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration selectedRouteCustomText](self->_configuration, "selectedRouteCustomText"));
  v52 = v50;
  v53 = v51;
  if (v52 | v53)
  {
    v54 = (void *)v53;
    v55 = objc_msgSend((id)v52, "isEqual:", v53);

    if ((v55 & 1) == 0)
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration selectedRouteCustomText](self->_configuration, "selectedRouteCustomText"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
      objc_msgSend(v57, "setSelectedRouteCustomText:", v56);

      v46 = 1;
    }
  }
  v58 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration transitVehiclePositions](v7, "transitVehiclePositions"));
  v59 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration transitVehiclePositions](self->_configuration, "transitVehiclePositions"));
  if (v58 | v59)
    v60 = objc_msgSend((id)v58, "isEqual:", v59);
  else
    v60 = 1;

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](v7, "anchorPoints"));
  if ((unint64_t)objc_msgSend(v61, "count") > 1)
  {
    v63 = 2;
  }
  else
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](v7, "anchorPoints"));
    v63 = (uint64_t)objc_msgSend(v62, "count");

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](self->_configuration, "anchorPoints"));
  if ((unint64_t)objc_msgSend(v64, "count") > 1)
  {
    v66 = 2;
  }
  else
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](self->_configuration, "anchorPoints"));
    v66 = (uint64_t)objc_msgSend(v65, "count");

  }
  if (v63 != v66)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](v7, "anchorPoints"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration anchorPoints](self->_configuration, "anchorPoints"));
    v69 = objc_msgSend(v67, "isEqual:", v68);

    v39 |= v69 ^ 1;
  }
  v70 = -[RouteAnnotationsConfiguration proximityToCurrentNavigationWaypoint](v7, "proximityToCurrentNavigationWaypoint");
  if (v70 == -[RouteAnnotationsConfiguration proximityToCurrentNavigationWaypoint](self->_configuration, "proximityToCurrentNavigationWaypoint"))
  {
    v71 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration currentNavigationWaypoint](v7, "currentNavigationWaypoint"));
    v72 = objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration currentNavigationWaypoint](self->_configuration, "currentNavigationWaypoint"));
    if (v71 | v72)
      v73 = objc_msgSend((id)v71, "isEqual:", v72) ^ 1;
    else
      v73 = 0;

  }
  else
  {
    v73 = 1;
  }
  if (v76 ^ 1 | v79)
    -[RouteAnnotationsController _updateOverlaysInGroupOverlay](self, "_updateOverlaysInGroupOverlay");
  if (v77)
    -[RouteAnnotationsController _updateSelectedOverlayInGroupOverlay](self, "_updateSelectedOverlayInGroupOverlay");
  if (v80)
    -[RouteAnnotationsController _updateFocusedOverlayInGroupOverlay](self, "_updateFocusedOverlayInGroupOverlay");
  if (v73 | v39)
  {
    objc_initWeak((id *)buf, self);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1007F31D0;
    v82[3] = &unk_1011C9508;
    objc_copyWeak(&v83, (id *)buf);
    v84 = v46;
    v85 = v24;
    -[RouteAnnotationsController _updateMapViewRouteContextForced:withFinishedHandler:](self, "_updateMapViewRouteContextForced:withFinishedHandler:", v73, v82);
    objc_destroyWeak(&v83);
    objc_destroyWeak((id *)buf);
  }
  if (v78 | v75 ^ v74)
    -[RouteAnnotationsController _updateTrafficFeatures](self, "_updateTrafficFeatures");
  if ((v60 & 1) == 0)
    -[RouteAnnotationsController _updateTransitVehiclePositionAnnotations](self, "_updateTransitVehiclePositionAnnotations");

  v4 = v81;
LABEL_82:

}

- (void)_updateOverlaysInGroupOverlay
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  NSString *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  void *v55;
  NSString *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  void *m;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  OriginalRouteDivergencePosition *v80;
  void *v81;
  OriginalRouteDivergencePosition *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  __int128 v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id obj;
  id v103;
  id v104;
  id v105;
  void *v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t v131[128];
  uint8_t buf[4];
  RouteAnnotationsController *v133;
  __int16 v134;
  id v135;
  __int16 v136;
  void *v137;
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routes"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v128;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v128 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
        if ((objc_msgSend(v11, "alternateRoutesEnabled") & 1) != 0)
        {
          v12 = 1;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedRoute"));
          v12 = v10 == v14;

        }
        if (v12 && v10)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v127, v142, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "polylines"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
  v106 = v3;
  if (v18)
  {
    v19 = v18;
    v20 = *(id *)v124;
    v99 = *(id *)v124;
    do
    {
      v21 = 0;
      v103 = v19;
      do
      {
        if (*(id *)v124 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "composedRoute"));
        v24 = objc_msgSend(v3, "containsObject:", v23);

        if (v24)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "composedRoute"));
          objc_msgSend(v3, "removeObject:", v25);
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "focusedLabelsPolyline"));

          if (v22 == v27)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
            objc_msgSend(v28, "setFocusedLabelsPolyline:", 0);

          }
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "composedRoute"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "waypoints"));

          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v120;
            do
            {
              for (j = 0; j != v32; j = (char *)j + 1)
              {
                if (*(_QWORD *)v120 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)j);
                v36 = NSStringFromSelector("styleAttributes");
                v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                objc_msgSend(v35, "removeObserver:forKeyPath:", self, v37);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v119, v140, 16);
            }
            while (v32);
          }

          v38 = sub_1007F1D44();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "composedRoute"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uniqueRouteID"));
            *(_DWORD *)buf = 134349314;
            v133 = self;
            v134 = 2112;
            v135 = v41;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%{public}p] Removing route overlay for %@", buf, 0x16u);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
          objc_msgSend(v25, "removePolyline:", v22);
          v19 = v103;
          v3 = v106;
          v20 = v99;
        }

        v21 = (char *)v21 + 1;
      }
      while (v21 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v141, 16);
    }
    while (v19);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "routes"));

  v100 = v43;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
  if (v44)
  {
    v46 = v44;
    v47 = *(_QWORD *)v116;
    *(_QWORD *)&v45 = 134349570;
    v96 = v45;
    v97 = *(_QWORD *)v116;
    do
    {
      v48 = 0;
      v98 = v46;
      do
      {
        if (*(_QWORD *)v116 != v47)
          objc_enumerationMutation(v100);
        v49 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v48);
        if (objc_msgSend(v3, "containsObject:", v49, v96))
        {
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v104 = v49;
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "waypoints"));
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v138, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v112;
            do
            {
              for (k = 0; k != v52; k = (char *)k + 1)
              {
                if (*(_QWORD *)v112 != v53)
                  objc_enumerationMutation(v50);
                v55 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)k);
                v56 = NSStringFromSelector("styleAttributes");
                v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
                objc_msgSend(v55, "addObserver:forKeyPath:options:context:", self, v57, 0, off_1014B22A8);

              }
              v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v111, v138, 16);
            }
            while (v52);
          }

          v58 = objc_alloc((Class)VKPolylineOverlay);
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "traffic"));
          v60 = objc_msgSend(v58, "initWithComposedRoute:traffic:", v104, v59);

          v61 = sub_1007F1D44();
          v62 = objc_claimAutoreleasedReturnValue(v61);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "uniqueRouteID"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "traffic"));
            *(_DWORD *)buf = v96;
            v133 = self;
            v134 = 2112;
            v135 = v63;
            v136 = 2112;
            v137 = v64;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[%{public}p] Adding route overlay for %@ | %@", buf, 0x20u);

          }
          v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
          objc_msgSend(v65, "addPolyline:", v60);

          v3 = v106;
          v47 = v97;
          v46 = v98;
        }
        v48 = (char *)v48 + 1;
      }
      while (v48 != v46);
      v46 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v115, v139, 16);
    }
    while (v46);
  }

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "originalRouteID"));

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "polylines"));

  v105 = v69;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
  v101 = v67;
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v108;
    do
    {
      for (m = 0; m != v71; m = (char *)m + 1)
      {
        if (*(_QWORD *)v108 != v72)
          objc_enumerationMutation(v105);
        v74 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)m);
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "composedRoute"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "uniqueRouteID"));
        v77 = objc_msgSend(v67, "isEqual:", v76);

        if ((_DWORD)v77)
        {
          v78 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
          v79 = objc_msgSend(v78, "originalRouteDivergenceCoordinate");

          v80 = [OriginalRouteDivergencePosition alloc];
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "composedRoute"));
          v82 = -[OriginalRouteDivergencePosition initWithRouteCoordinate:route:](v80, "initWithRouteCoordinate:route:", v79, v81);

          v83 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
          objc_msgSend(v83, "setSkippedRouteLineSplitAnnotation:", v82);

          if ((objc_msgSend(v74, "skipped") & 1) == 0)
          {
            v84 = sub_1007F1D44();
            v85 = objc_claimAutoreleasedReturnValue(v84);
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              v86 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
              v87 = GEOPolylineCoordinateAsFullString(objc_msgSend(v86, "originalRouteDivergenceCoordinate"));
              v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
              *(_DWORD *)buf = 134349570;
              v133 = self;
              v134 = 2112;
              v135 = v101;
              v136 = 2112;
              v137 = v88;
              _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_INFO, "[%{public}p] Marking route %@ as original route | divergence coordinate: [%@]", buf, 0x20u);

              v67 = v101;
            }

          }
        }
        objc_msgSend(v74, "setSkipped:", v77);
      }
      v71 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
    }
    while (v71);
  }

  v89 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  if ((objc_msgSend(v89, "selectsPolyline") & 1) != 0)
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "selectedPolyline"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "composedRoute"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "selectedRoute"));

    v95 = v106;
    if (v92 != v94)
      -[RouteAnnotationsController _updateSelectedOverlayInGroupOverlay](self, "_updateSelectedOverlayInGroupOverlay");
  }
  else
  {

    v95 = v106;
  }

}

- (void)_updateSelectedOverlayInGroupOverlay
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  RouteAnnotationsController *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "selectsPolyline");

  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "polylines"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "composedRoute"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedRoute"));
          v14 = objc_msgSend(v11, "isEqual:", v13);

          if (v14)
          {
            v7 = v10;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v7 = 0;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectedPolyline"));

  if (v7 != v16)
  {
    v17 = sub_1007F1D44();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "composedRoute"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueRouteID"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traffic"));
      *(_DWORD *)buf = 134349570;
      v31 = self;
      v32 = 2112;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Changing selected route overlay to %@ | %@", buf, 0x20u);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    objc_msgSend(v22, "setSelectedPolyline:", v7);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectedPolyline"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
    objc_msgSend(v25, "setFocusedLabelsPolyline:", v24);

  }
  -[RouteAnnotationsController _updateTrafficFeatures](self, "_updateTrafficFeatures");

}

- (void)_updateFocusedOverlayInGroupOverlay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "focusedRoute"));

  if (v4)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "polylines"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "composedRoute"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "focusedRoute"));
          v14 = objc_msgSend(v11, "isEqual:", v13);

          if (v14)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "focusedPolyline"));

    if (v7 != v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
      objc_msgSend(v17, "setFocusedPolyline:", v7);

    }
    -[RouteAnnotationsController _updateTrafficFeatures](self, "_updateTrafficFeatures");

  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    objc_msgSend(v18, "setFocusedPolyline:", 0);

  }
}

- (void)_updateMapViewRouteContextForced:(BOOL)a3 withFinishedHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, _QWORD);
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  unsigned int v39;
  NSObject *v40;
  id *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned __int8 v54;
  NSObject *routeContextQueue;
  id v56;
  id v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  void (**v66)(id, _QWORD);
  id v67;
  _QWORD block[4];
  id v69;
  void (**v70)(id, _QWORD);
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  RouteAnnotationsController *v75;
  void (**v76)(id, _QWORD);
  id v77[2];
  unsigned __int8 v78;
  _QWORD v79[4];
  id v80;
  uint8_t buf[4];
  RouteAnnotationsController *v82;
  __int16 v83;
  id v84;
  __int16 v85;
  id v86;

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = sub_1007F1D44();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v82 = self;
    v83 = 1024;
    LODWORD(v84) = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Updating route context forced: %d", buf, 0x12u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "polylines"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = sub_1007F1D44();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "polylines"));
      v16 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134349312;
      v82 = self;
      v83 = 2048;
      v84 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] We currently have %lu polylines", buf, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "polylines"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allObjects"));
    v20 = sub_10039DCD4(v19, &stru_1011C9548);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectedRoute"));

    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1007F488C;
    v79[3] = &unk_1011B1A50;
    v24 = v23;
    v80 = v24;
    if (objc_msgSend(v21, "indexOfObjectPassingTest:", v79) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = sub_1007F1D44();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "selectedRoute"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uniqueRouteID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "UUIDString"));
        v30 = sub_10039DCD4(v21, &stru_1011C9568);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
        *(_DWORD *)buf = 134349570;
        v82 = self;
        v83 = 2112;
        v84 = v29;
        v85 = 2112;
        v86 = v31;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "[%{public}p] Currently selected route (%@) is not part of the polylines drawn on the map (%@)", buf, 0x20u);

      }
      if (v6)
        v6[2](v6, 0);
    }
    else
    {
      -[NSMutableArray removeAllObjects](self->_annotationTextUpdaters, "removeAllObjects");
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "routes"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
      v46 = objc_msgSend(v45, "selectedRouteIndex");

      if (v4
        || -[MKMapView _shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:](self->_mapView, "_shouldUpdateSelectedRouteFromRoutes:selectedRouteIndex:", v44, v46))
      {
        v47 = sub_1007F1D44();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          v49 = sub_10039DCD4(v44, &stru_1011C9588);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          *(_DWORD *)buf = 134349570;
          v82 = self;
          v83 = 2112;
          v84 = v50;
          v85 = 2048;
          v86 = v46;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "[%{public}p] Initiating route context update for routes: %@ with selected index: %lu", buf, 0x20u);

        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "currentNavigationWaypoint"));

        v53 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
        v54 = objc_msgSend(v53, "proximityToCurrentNavigationWaypoint");

        objc_initWeak((id *)buf, self);
        routeContextQueue = self->_routeContextQueue;
        v72[0] = _NSConcreteStackBlock;
        v72[1] = 3221225472;
        v72[2] = sub_1007F4910;
        v72[3] = &unk_1011C95B0;
        objc_copyWeak(v77, (id *)buf);
        v73 = v44;
        v74 = v52;
        v78 = v54;
        v77[1] = v46;
        v75 = self;
        v76 = v6;
        v56 = v52;
        dispatch_async(routeContextQueue, v72);

        objc_destroyWeak(v77);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        v60 = sub_1007F1D44();
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = sub_10039DCD4(v44, &stru_1011C95D0);
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          *(_DWORD *)buf = 134349570;
          v82 = self;
          v83 = 2112;
          v84 = v63;
          v85 = 2048;
          v86 = v46;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "[%{public}p] NOT initiating route context update for routes: %@ with selected index: %lu", buf, 0x20u);

        }
        if (v6)
          v6[2](v6, 0);
      }

    }
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "anchorPoints"));
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "anchorPoints"));

      v37 = sub_1007F1D44();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = objc_msgSend(v36, "count");
        *(_DWORD *)buf = 134349312;
        v82 = self;
        v83 = 1024;
        LODWORD(v84) = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] No polylines currently detected, but found %d anchor points", buf, 0x12u);
      }

      objc_initWeak((id *)buf, self);
      v40 = self->_routeContextQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1007F4F48;
      block[3] = &unk_1011B0288;
      v41 = &v71;
      objc_copyWeak(&v71, (id *)buf);
      v69 = v36;
      v70 = v6;
      v42 = v36;
      dispatch_async(v40, block);

    }
    else
    {
      v57 = sub_1007F1D44();
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v82 = self;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}p] No polylines currently detected", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v59 = self->_routeContextQueue;
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = sub_1007F5134;
      v65[3] = &unk_1011B0300;
      v41 = &v67;
      objc_copyWeak(&v67, (id *)buf);
      v65[4] = self;
      v66 = v6;
      dispatch_async(v59, v65);

    }
    objc_destroyWeak(v41);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_updateRouteMarkersInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routes"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[RouteAnnotationsController _updateRouteMarkerForComposedRoute:inContext:](self, "_updateRouteMarkerForComposedRoute:inContext:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), v4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)_updateRouteMarkerForComposedRoute:(id)a3 inContext:(id)a4
{
  id v6;
  MKMapView *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _BOOL8 v43;
  int v44;
  RouteAnnotationsController *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  void *v51;

  v6 = a3;
  v7 = (MKMapView *)a4;
  if (!v7)
    v7 = self->_mapView;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v9 = objc_msgSend(v8, "routeMarkerOptions");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v11 = ((unint64_t)objc_msgSend(v10, "routeMarkerOptions") >> 1) & 1;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedRoute"));

  v14 = (v13 == v6) & v9;
  if (v13 == v6)
    v15 = 0;
  else
    v15 = v11;
  v16 = v14 | v15;
  if ((v14 | v15) == 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "markerInfoForRoute:", v6));

  }
  else
  {
    v18 = 0;
  }
  v19 = sub_1007F1D44();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));
    v22 = CFSTR("NO");
    if (v13 == v6)
      v22 = CFSTR("YES");
    v23 = v22;
    v44 = 134349826;
    v45 = self;
    v46 = 2114;
    v47 = v21;
    v48 = 2114;
    v49 = v23;
    v50 = 2114;
    v51 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), Setting route info: %{public}@", (uint8_t *)&v44, 0x2Au);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeDescription"));
  v25 = objc_msgSend(v18, "etaType");
  v26 = objc_msgSend(v18, "tollCurrency");
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "styleAttributes"));
  -[MKMapView _setRouteContextAnnotationText:etaType:tollCurrency:advisoryStyleAttributes:forRoute:](v7, "_setRouteContextAnnotationText:etaType:tollCurrency:advisoryStyleAttributes:forRoute:", v24, v25, v26, v27, v6);

  -[MKMapView _setAlternateRouteContextAnnotationETAComparison:forRoute:](v7, "_setAlternateRouteContextAnnotationETAComparison:forRoute:", objc_msgSend(v18, "etaComparison"), v6);
  if (v16)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "legs"));
    if ((unint64_t)objc_msgSend(v28, "count") < 2)
    {
      v30 = 0;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeMarkerFormatterController](self, "routeMarkerFormatterController"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "markerInfosForLegsInRoute:", v6));

    }
  }
  else
  {
    v30 = 0;
  }
  v31 = sub_10039DCD4(v30, &stru_1011C9610);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = sub_1007F1D44();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));
    v36 = CFSTR("NO");
    if (v13 == v6)
      v36 = CFSTR("YES");
    v37 = v36;
    v44 = 134349826;
    v45 = self;
    v46 = 2114;
    v47 = v35;
    v48 = 2114;
    v49 = v37;
    v50 = 2114;
    v51 = v30;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), Setting leg infos: %{public}@", (uint8_t *)&v44, 0x2Au);

  }
  if (objc_msgSend(v32, "count"))
    v38 = v32;
  else
    v38 = 0;
  -[MKMapView _setRouteContextAnnotationTexts:forLegsInRoute:](v7, "_setRouteContextAnnotationTexts:forLegsInRoute:", v38, v6);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "focusedRoute"));
  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v42 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "focusedRoute"));
    v43 = v42 == v6;

  }
  else
  {
    v43 = 0;
  }

  -[MKMapView _setRouteContextAnnotationFocus:forRoute:](v7, "_setRouteContextAnnotationFocus:forRoute:", v43, v6);
}

- (void)_updateTrafficFeatures
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  RouteAnnotationsController *v20;
  __int16 v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectedRoute"));

  v5 = sub_1007F1D44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
    *(_DWORD *)buf = 134349314;
    v20 = self;
    v21 = 2114;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@, Updating traffic features for selected route", buf, 0x16u);

  }
  if (v4 && objc_msgSend(v4, "transportType") != 1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedTrafficFeaturesForRoute:", v4));

    v12 = sub_1007F1D44();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v14)
      {
        *(_DWORD *)buf = 134349056;
        v20 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Using cached traffic features", buf, 0xCu);
      }

      -[RouteAnnotationsController _updateTrafficWithInitialTrafficFeatures:](self, "_updateTrafficWithInitialTrafficFeatures:", v10);
    }
    else
    {
      if (v14)
      {
        *(_DWORD *)buf = 134349056;
        v20 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating traffic features", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
      v16 = &_dispatch_main_q;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1007F5AE8;
      v17[3] = &unk_1011C9638;
      objc_copyWeak(&v18, (id *)buf);
      objc_msgSend(v15, "getTrafficFeaturesForRoute:completionQueue:completionHandler:", v4, &_dispatch_main_q, v17);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
      v10 = 0;
    }
  }
  else
  {
    v8 = sub_1007F1D44();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}p] Composed route does not exist or is transit; removing traffic features",
        buf,
        0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    -[RouteAnnotationsController _updateTrafficWithInitialTrafficFeatures:](self, "_updateTrafficWithInitialTrafficFeatures:", v10);
  }

}

- (void)_updateTrafficWithInitialTrafficFeatures:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  char v19;
  uint8_t buf[4];
  RouteAnnotationsController *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;

  v4 = a3;
  v5 = sub_1007F1D44();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349571;
    v21 = self;
    v22 = 2048;
    v23 = objc_msgSend(v4, "count");
    v24 = 2113;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic features with %lu initial features: %{private}@", buf, 0x20u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v8 = objc_msgSend(v7, "alternateRoutesEnabled");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routes"));

  if (!(_DWORD)v8)
    goto LABEL_7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedSharedTrafficFeaturesForRoutes:", v10));

  if (v12)
  {
LABEL_8:
    -[RouteAnnotationsController _continueUpdateTrafficWithInitialTrafficFeatures:sharedTrafficFeatures:routes:includeAlternateRoutes:](self, "_continueUpdateTrafficWithInitialTrafficFeatures:sharedTrafficFeatures:routes:includeAlternateRoutes:", v4, v12, v10, v8);

    goto LABEL_9;
  }
  if (!GEOConfigGetBOOL(MapsConfig_ShowRouteAnnotationsForAlternateRoutes, off_1014B4788))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  objc_initWeak((id *)buf, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
  v14 = &_dispatch_main_q;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1007F5F08;
  v15[3] = &unk_1011C9660;
  objc_copyWeak(&v18, (id *)buf);
  v16 = v4;
  v17 = v10;
  v19 = (char)v8;
  objc_msgSend(v13, "getSharedTrafficFeaturesForRoutes:completionQueue:completionHandler:", v17, &_dispatch_main_q, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
LABEL_9:

}

- (void)_continueUpdateTrafficWithInitialTrafficFeatures:(id)a3 sharedTrafficFeatures:(id)a4 routes:(id)a5 includeAlternateRoutes:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  id *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  BOOL v54;
  id v55;
  id obj;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  id *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51 = v10;
  v52 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithArray:", v10);
  if (v11 && v6)
    objc_msgSend(v52, "addObjectsFromArray:", v11);
  v50 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration", self));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedRoute"));

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v64;
    v54 = v6;
    v53 = *(_QWORD *)v64;
    do
    {
      v17 = 0;
      v55 = v15;
      do
      {
        if (*(_QWORD *)v64 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v17);
        if (v6 || v18 == v58)
        {
          v57 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_trafficIncidentsOnRoute"));
          v20 = objc_msgSend(v19, "copy");

          v21 = objc_msgSend(v20, "mutableCopy");
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsStorageManager sharedInstance](TrafficIncidentsStorageManager, "sharedInstance"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "removedTrafficIncidentFeaturesIds"));

          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          v24 = v20;
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v26; i = (char *)i + 1)
              {
                if (*(_QWORD *)v60 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v29, "setIsOnSelectedRoute:", v18 == v58);
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "uniqueString"));
                v31 = objc_msgSend(v23, "containsObject:", v30);

                if (v31)
                  objc_msgSend(v21, "removeObject:", v29);
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
            }
            while (v26);
          }

          if (objc_msgSend(v21, "count"))
            objc_msgSend(v52, "addObjectsFromArray:", v21);

          LOBYTE(v6) = v54;
          v16 = v53;
          v15 = v55;
          v17 = v57;
        }
        v17 = (char *)v17 + 1;
      }
      while (v17 != v15);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    }
    while (v15);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v33 = objc_msgSend(v32, "state");
  if (MNNavigationServiceStateIsNavigating(v33, v34))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentLayoutManager sharedInstance](TrafficIncidentLayoutManager, "sharedInstance"));
    v36 = objc_msgSend(v35, "isIncidentReportingEnabled");

    v37 = v49;
    if (!v36)
      goto LABEL_31;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[TrafficIncidentsSourceManager sharedInstance](TrafficIncidentsSourceManager, "sharedInstance"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "cachedVKTrafficIncidentFeatureItemsForSelectedRoute:", v58));

    if (objc_msgSend(v32, "count"))
      objc_msgSend(v52, "addObjectsFromArray:", v32);
  }
  else
  {
    v37 = v49;
  }

LABEL_31:
  v39 = sub_1007F1D44();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = objc_msgSend(v52, "count");
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[4], "_mapLayer"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[4], "window"));
    v44 = objc_opt_class(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[4], "window"));
    *(_DWORD *)buf = 134350339;
    v68 = v37;
    v69 = 2048;
    v70 = v41;
    v71 = 2113;
    v72 = v52;
    v73 = 2048;
    v74 = v42;
    v75 = 2112;
    v76 = v44;
    v77 = 2048;
    v78 = v45;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic features with %lu final features: %{private}@ on map view: %p with window: <%@: %p>", buf, 0x3Eu);

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37[4], "_mapLayer"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "array"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "configuration"));
  objc_msgSend(v46, "setExternalTrafficFeatures:areRouteTrafficFeaturesActive:", v47, objc_msgSend(v48, "routeTrafficFeaturesActive"));

}

- (void)_updateTransitVehiclePositionAnnotations
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  RouteAnnotationsController *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transitVehiclePositions"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID"));

    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 1);
      -[RouteAnnotationsController setTransitVehicleAnnotationsByTripID:](self, "setTransitVehicleAnnotationsByTripID:", v6);

    }
  }
  -[RouteAnnotationsController _clearStaleVehiclePositionAnnotations](self, "_clearStaleVehiclePositionAnnotations");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007F6524;
  v8[3] = &unk_1011AC8B0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v8, 0.3);

}

- (void)_updateWaypointCaptions
{
  -[MKMapView _updateWaypointCaptions](self->_mapView, "_updateWaypointCaptions");
}

- (void)_updateRouteOverlayForRouteIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  void *v45;
  NSString *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  RouteAnnotationsController *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  __CFString *v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  unint64_t v81;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routes"));
  v7 = objc_msgSend(v6, "count");

  if ((unint64_t)v7 > a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a3));

    v11 = sub_1007F1D44();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uniqueRouteID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
      v15 = objc_msgSend(v14, "selectedRouteIndex");
      v16 = CFSTR("NO");
      if (v15 == (id)a3)
        v16 = CFSTR("YES");
      v17 = v16;
      *(_DWORD *)buf = 134350082;
      v73 = self;
      v74 = 2114;
      v75 = v13;
      v76 = 2114;
      v77 = v17;
      v78 = 2080;
      v79 = "-[RouteAnnotationsController _updateRouteOverlayForRouteIndex:]";
      v80 = 2048;
      v81 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Route: %{public}@ (isSelected: %{public}@), %s %lu", buf, 0x34u);

    }
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "polylines"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v66;
LABEL_8:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v66 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "composedRoute"));
        v26 = objc_msgSend(v25, "isEqual:", v10);

        if ((v26 & 1) != 0)
          break;
        if (v21 == (id)++v23)
        {
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
          if (v21)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      v28 = v24;

      if (!v28)
        goto LABEL_36;
      v55 = (id)a3;
      v56 = v28;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "composedRoute"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "waypoints"));

      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v62 != v33)
              objc_enumerationMutation(v30);
            v35 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
            v36 = NSStringFromSelector("styleAttributes");
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
            objc_msgSend(v35, "removeObserver:forKeyPath:", self, v37);

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v32);
      }

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
      objc_msgSend(v38, "removePolyline:", v56);

      -[MKMapView _clearRouteContext](self->_mapView, "_clearRouteContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
      objc_msgSend(v39, "forceLayout");

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waypoints"));
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v58;
        do
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(_QWORD *)v58 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
            v46 = NSStringFromSelector("styleAttributes");
            v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
            objc_msgSend(v45, "addObserver:forKeyPath:options:context:", self, v47, 0, off_1014B22A8);

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
        }
        while (v42);
      }

      v48 = objc_alloc((Class)VKPolylineOverlay);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traffic"));
      v50 = objc_msgSend(v48, "initWithComposedRoute:traffic:", v10, v49);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
      objc_msgSend(v51, "addPolyline:", v50);

      v52 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
      if (objc_msgSend(v52, "selectedRouteIndex") == v55)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
        v54 = objc_msgSend(v53, "selectsPolyline");

        v27 = v56;
        if (v54)
          -[RouteAnnotationsController _updateSelectedOverlayInGroupOverlay](self, "_updateSelectedOverlayInGroupOverlay");
      }
      else
      {

        v27 = v56;
      }
      -[RouteAnnotationsController _updateMapViewRouteContextForced:withFinishedHandler:](self, "_updateMapViewRouteContextForced:withFinishedHandler:", 0, 0);
      -[RouteAnnotationsController _updateTrafficFeatures](self, "_updateTrafficFeatures");

    }
    else
    {
LABEL_14:
      v27 = v19;
    }

LABEL_36:
  }
}

- (void)_updateAnnotationForVehiclePosition:(id)a3
{
  void *v4;
  void *v5;
  TransitVehiclePositionAnnotation *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "tripID")));
  v6 = (TransitVehiclePositionAnnotation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    -[TransitVehiclePositionAnnotation updateVehiclePosition:](v6, "updateVehiclePosition:", v9);
  }
  else
  {
    v6 = -[TransitVehiclePositionAnnotation initWithVehiclePosition:]([TransitVehiclePositionAnnotation alloc], "initWithVehiclePosition:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "tripID")));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v6);
  }

}

- (void)_clearStaleVehiclePositionAnnotations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitVehiclePositions"));
  v8 = sub_10039DCD4(v7, &stru_1011C96A0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v5, "removeObjectsInArray:", v9);
  if (objc_msgSend(v5, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID", (_QWORD)v20));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v16));

          if (v18)
            objc_msgSend(v10, "addObject:", v18);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController transitVehicleAnnotationsByTripID](self, "transitVehicleAnnotationsByTripID"));
    objc_msgSend(v19, "removeObjectsForKeys:", v11);

    -[MKMapView removeAnnotations:](self->_mapView, "removeAnnotations:", v10);
  }

}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectForRouteRemainingAtLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double x;
  double v12;
  double y;
  double v14;
  double width;
  double v16;
  double height;
  MKMapPoint v18;
  double v19;
  double v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  CLLocationCoordinate2D v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  char *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CLLocationCoordinate2D v49;
  MKMapRect v50;
  MKMapRect v51;
  MKMapRect v52;
  MKMapRect v53;
  $C79183323B9A0D5602617FF3BE5395AC result;
  MKMapRect v55;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedRoute"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
  v8 = v7;
  if (v7 && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route")), v9, v9 == v6))
  {
    v29 = (char *)objc_msgSend(v8, "stepIndex");
    v30 = objc_msgSend(v8, "routeCoordinate");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", v29));
    objc_msgSend(v6, "_maps_boundingRectForStep:fromPoint:", v32, v30);
    x = v33;
    y = v34;
    width = v35;
    height = v36;

    while (1)
    {
      ++v29;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
      v38 = (char *)objc_msgSend(v37, "count");

      if (v29 >= v38)
        break;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v29));
      objc_msgSend(v6, "_maps_boundingRectForStep:", v40);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.width = width;
      v52.size.height = height;
      v55.origin.x = v42;
      v55.origin.y = v44;
      v55.size.width = v46;
      v55.size.height = v48;
      v53 = MKMapRectUnion(v52, v55);
      x = v53.origin.x;
      y = v53.origin.y;
      width = v53.size.width;
      height = v53.size.height;
    }
  }
  else
  {
    objc_msgSend(v6, "_maps_boundingMapRect");
    x = v10;
    y = v12;
    width = v14;
    height = v16;
  }
  if (v4)
  {
    objc_msgSend(v4, "coordinate");
    v18 = MKMapPointForCoordinate(v49);
    v19 = v18.x;
    v20 = v18.y;
    v21 = y == MKMapRectNull.origin.y && x == MKMapRectNull.origin.x;
    if (v21 || width == 0.0 || height == 0.0)
    {
      v24 = MKCoordinateForMapPoint(v18);
      v51.origin.x = MKMapRectMakeWithRadialDistance(v24.latitude, v24.longitude, 100.0);
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      v51 = MKMapRectUnion(v50, *(MKMapRect *)&v19);
    }
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
  }

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.var1.var1 = v28;
  result.var1.var0 = v27;
  result.var0.var1 = v26;
  result.var0.var0 = v25;
  return result;
}

- (void)updateMatchedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedRoute"));

  if (v6)
  {
    if (objc_msgSend(v4, "state") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));

      if (v8 == v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
        objc_msgSend(v9, "setRouteUserOffset:", objc_msgSend(v10, "routeCoordinate"));

        if (objc_msgSend(v6, "transportType") != 1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cachedTrafficFeaturesForRoute:", v6));

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController trafficFeaturesUpdater](self, "trafficFeaturesUpdater"));
            objc_msgSend(v13, "updateTrafficFeatures:onRoute:forLocation:", v12, v6, v4);

          }
          else
          {
            objc_initWeak(&location, self);
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
            v15 = &_dispatch_main_q;
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_1007F7324;
            v16[3] = &unk_1011C96C8;
            v17 = v6;
            objc_copyWeak(&v19, &location);
            v18 = v4;
            objc_msgSend(v14, "getTrafficFeaturesForRoute:completionQueue:completionHandler:", v17, &_dispatch_main_q, v16);

            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }

        }
      }
    }
  }

}

- (RouteMarkerFormatterController)routeMarkerFormatterController
{
  RouteMarkerFormatterController *routeMarkerFormatterController;
  RouteMarkerFormatterController *v4;
  RouteMarkerFormatterController *v5;

  routeMarkerFormatterController = self->_routeMarkerFormatterController;
  if (!routeMarkerFormatterController)
  {
    v4 = -[RouteMarkerFormatterController initWithDelegate:]([RouteMarkerFormatterController alloc], "initWithDelegate:", self);
    v5 = self->_routeMarkerFormatterController;
    self->_routeMarkerFormatterController = v4;

    routeMarkerFormatterController = self->_routeMarkerFormatterController;
  }
  return routeMarkerFormatterController;
}

- (void)routeMarkerFormatterController:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v5 = a4;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[RouteAnnotationsController _updateRouteMarkerForComposedRoute:inContext:](self, "_updateRouteMarkerForComposedRoute:inContext:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), 0);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uniqueRouteID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1007F75E0;
  v12[3] = &unk_1011B1A50;
  v11 = v7;
  v13 = v11;
  v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", v12);

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    -[RouteAnnotationsController _updateRouteOverlayForRouteIndex:](self, "_updateRouteOverlayForRouteIndex:", v10);

}

- (void)composedRoute:(id)a3 didUpdateTrafficIncidentsOnRoute:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  id v29;
  RouteAnnotationsController *val;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  RouteAnnotationsController *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];

  v6 = a3;
  v29 = a4;
  val = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
  objc_msgSend(v7, "clearCachedTrafficFeaturesForRoute:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routeTrafficFeatureCalculator](self, "routeTrafficFeatureCalculator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController configuration](self, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routes"));
  objc_msgSend(v8, "clearCachedSharedTrafficFeaturesForRoutes:", v10);

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsController routesGroupOverlay](self, "routesGroupOverlay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "polylines"));

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "composedRoute"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueRouteID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (v20)
        {
          v13 = v16;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  v21 = sub_1007F1D44();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueRouteID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traffic"));
    *(_DWORD *)buf = 134349570;
    v39 = val;
    v40 = 2112;
    v41 = v23;
    v42 = 2112;
    v43 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] Updating traffic for %@ | %@", buf, 0x20u);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traffic"));
  objc_msgSend(v13, "updateTraffic:", v25);

  objc_initWeak((id *)buf, val);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1007F79A8;
  v31[3] = &unk_1011AC888;
  objc_copyWeak(&v33, (id *)buf);
  v26 = v6;
  v32 = v26;
  -[RouteAnnotationsController _updateMapViewRouteContextForced:withFinishedHandler:](val, "_updateMapViewRouteContextForced:withFinishedHandler:", 1, v31);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_maps_trafficIncidentsOnRoute"));
  v28 = objc_msgSend(v27, "count") == 0;

  if (!v28)
    -[RouteAnnotationsController _updateTrafficFeatures](val, "_updateTrafficFeatures");

  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (RouteTrafficFeatureCalculator)routeTrafficFeatureCalculator
{
  return self->_routeTrafficFeatureCalculator;
}

- (void)setRouteTrafficFeatureCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_routeTrafficFeatureCalculator, a3);
}

- (RouteTrafficFeaturesUpdater)trafficFeaturesUpdater
{
  return self->_trafficFeaturesUpdater;
}

- (void)setTrafficFeaturesUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_trafficFeaturesUpdater, a3);
}

- (void)setRoutesGroupOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_routesGroupOverlay, a3);
}

- (void)setRouteMarkerFormatterController:(id)a3
{
  objc_storeStrong((id *)&self->_routeMarkerFormatterController, a3);
}

- (NSMutableDictionary)transitVehicleAnnotationsByTripID
{
  return self->_transitVehicleAnnotationsByTripID;
}

- (void)setTransitVehicleAnnotationsByTripID:(id)a3
{
  objc_storeStrong((id *)&self->_transitVehicleAnnotationsByTripID, a3);
}

- (NSMutableArray)annotationTextUpdaters
{
  return self->_annotationTextUpdaters;
}

- (void)setAnnotationTextUpdaters:(id)a3
{
  objc_storeStrong((id *)&self->_annotationTextUpdaters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTextUpdaters, 0);
  objc_storeStrong((id *)&self->_transitVehicleAnnotationsByTripID, 0);
  objc_storeStrong((id *)&self->_routeMarkerFormatterController, 0);
  objc_storeStrong((id *)&self->_routesGroupOverlay, 0);
  objc_storeStrong((id *)&self->_trafficFeaturesUpdater, 0);
  objc_storeStrong((id *)&self->_routeTrafficFeatureCalculator, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_routeContextBuilder, 0);
  objc_storeStrong((id *)&self->_routeContextQueue, 0);
}

@end
