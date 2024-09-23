@implementation PedestrianARVKRenderer

- (PedestrianARVKRenderer)initWithMapView:(id)a3 navigationService:(id)a4 mapViewDelegate:(id)a5 guidanceObserver:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PedestrianARVKRenderer *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    v20 = sub_1004318FC();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      v43 = 2080;
      v44 = "PedestrianARVKRenderer.m";
      v45 = 1024;
      v46 = 96;
      v47 = 2080;
      v48 = "mapView != nil";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v12)
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      v43 = 2080;
      v44 = "PedestrianARVKRenderer.m";
      v45 = 1024;
      v46 = 97;
      v47 = 2080;
      v48 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      v43 = 2080;
      v44 = "PedestrianARVKRenderer.m";
      v45 = 1024;
      v46 = 98;
      v47 = 2080;
      v48 = "mapViewDelegate != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v14)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARVKRenderer initWithMapView:navigationService:mapViewDelegate:guidanceObserver:]";
      v43 = 2080;
      v44 = "PedestrianARVKRenderer.m";
      v45 = 1024;
      v46 = 99;
      v47 = 2080;
      v48 = "guidanceObserver != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PedestrianARVKRenderer;
  v15 = -[PedestrianARVKRenderer init](&v40, "init");
  if (v15)
  {
    v16 = sub_1007E2B68();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v42 = (const char *)v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v15->_mapView, a3);
    objc_storeStrong((id *)&v15->_navigationService, a4);
    objc_storeWeak((id *)&v15->_mapViewDelegate, v13);
    objc_storeStrong((id *)&v15->_guidanceObserver, a6);
    v15->_lastManeuverStepIndex = -1;
    -[MNNavigationService registerObserver:](v15->_navigationService, "registerObserver:", v15);
    -[GuidanceObserver addOutlet:forOwner:](v15->_guidanceObserver, "addOutlet:forOwner:", v15, 0);
    -[GuidanceObserver repeatAllUpdatesForOutlet:](v15->_guidanceObserver, "repeatAllUpdatesForOutlet:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v18, "addObserver:forKeyPath:options:context:", v15, CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"), 1, 0);

  }
  return v15;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  PedestrianARVKRenderer *v8;

  v3 = sub_1007E2B68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocing", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

  -[GuidanceObserver removeOutlet:](self->_guidanceObserver, "removeOutlet:", self);
  -[MNNavigationService unregisterObserver:](self->_navigationService, "unregisterObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)PedestrianARVKRenderer;
  -[PedestrianARVKRenderer dealloc](&v6, "dealloc");
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  PedestrianARVKRenderer *v11;
  __int16 v12;
  GEOComposedRoute *v13;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    v6 = sub_1007E2B68();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 134349314;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Got a new route: %@", (uint8_t *)&v10, 0x16u);
    }

    v8 = objc_msgSend(objc_alloc((Class)VKRouteContext), "initWithComposedRoute:useType:", v5, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
    objc_msgSend(v9, "setRouteContext:", v8);

    -[PedestrianARVKRenderer clearAnchors](self, "clearAnchors");
    -[PedestrianARVKRenderer setGuidanceInfos:](self, "setGuidanceInfos:", 0);

  }
}

- (void)setShouldGenerateFeatures:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  PedestrianARVKRenderer *v10;
  __int16 v11;
  __CFString *v12;

  if (self->_shouldGenerateFeatures != a3)
  {
    v3 = a3;
    v5 = sub_1007E2B68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 134349314;
      v10 = self;
      v11 = 2112;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Setting shouldGenerateFeatures: %@", (uint8_t *)&v9, 0x16u);

    }
    self->_shouldGenerateFeatures = v3;
    if (v3)
      -[PedestrianARVKRenderer rebuildAnchors](self, "rebuildAnchors");
    else
      -[PedestrianARVKRenderer clearAnchors](self, "clearAnchors");
  }
}

- (void)setShouldShowFeatures:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  PedestrianARVKRenderer *v13;
  __int16 v14;
  __CFString *v15;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
  v6 = objc_msgSend(v5, "showsRoadLabels");

  if (v6 != v3)
  {
    v7 = sub_1007E2B68();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v10 = v9;
      v12 = 134349314;
      v13 = self;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Setting shouldShowFeatures: %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
    objc_msgSend(v11, "setShowsRoadLabels:", v3);

  }
}

- (BOOL)shouldShowFeatures
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
  v3 = objc_msgSend(v2, "showsRoadLabels");

  return v3;
}

- (void)rebuildAnchors
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  PedestrianARVKRenderer *v30;
  int v31;
  PedestrianARVKRenderer *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));

  if (!v3)
  {
    v22 = sub_1007E2B68();
    v13 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    v31 = 134349056;
    v32 = self;
    v23 = "[%{public}p] Cannot rebuild anchors without a route";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v31, 0xCu);
    goto LABEL_24;
  }
  if (!-[PedestrianARVKRenderer shouldGenerateFeatures](self, "shouldGenerateFeatures"))
  {
    v24 = sub_1007E2B68();
    v13 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    v31 = 134349056;
    v32 = self;
    v23 = "[%{public}p] Cannot rebuild anchors while shouldGenerateFeatures is false";
    goto LABEL_23;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer guidanceInfos](self, "guidanceInfos"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    v25 = sub_1007E2B68();
    v13 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_24;
    v31 = 134349056;
    v32 = self;
    v23 = "[%{public}p] Cannot rebuild anchors without first AR guidance info callback";
    goto LABEL_23;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "steps"));
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v26 = sub_1004318FC();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v31 = 136315906;
      v32 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer rebuildAnchors]";
      v33 = 2080;
      v34 = "PedestrianARVKRenderer.m";
      v35 = 1024;
      v36 = 200;
      v37 = 2080;
      v38 = "self.route.steps.count > 0";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v31, 0x26u);
    }

    if (sub_100A70734())
    {
      v28 = sub_1004318FC();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (PedestrianARVKRenderer *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v31 = 138412290;
        v32 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v31, 0xCu);

      }
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "steps"));
  v11 = objc_msgSend(v10, "count");

  v12 = sub_1007E2B68();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (!v14)
      goto LABEL_24;
    v31 = 134349056;
    v32 = self;
    v23 = "[%{public}p] Current route has no steps. Cannot rebuild anchors.";
    goto LABEL_23;
  }
  if (v14)
  {
    v31 = 134349056;
    v32 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Rebuilding anchors", (uint8_t *)&v31, 0xCu);
  }

  v13 = objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer maneuverEntries](self, "maneuverEntries"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer arrivalEntry](self, "arrivalEntry"));
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[NSObject arrayByAddingObject:](v13, "arrayByAddingObject:", v15));

    v13 = v16;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer continueEntries](self, "continueEntries"));
  if (objc_msgSend(v17, "count"))
  {
    v18 = objc_claimAutoreleasedReturnValue(-[NSObject arrayByAddingObjectsFromArray:](v13, "arrayByAddingObjectsFromArray:", v17));

    v13 = v18;
  }
  v19 = sub_1007E2B68();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v31 = 134349314;
    v32 = self;
    v33 = 2112;
    v34 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Rebuilt anchors: %@", (uint8_t *)&v31, 0x16u);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapViewDelegate](self, "mapViewDelegate"));
  objc_msgSend(v21, "updateFeatureMapping:", v13);

LABEL_24:
}

- (void)clearAnchors
{
  id v3;
  NSObject *v4;
  NSArray *maneuverEntries;
  PedestrianARVKFeatureMapEntry *arrivalEntry;
  NSArray *continueEntries;
  void *v8;
  int v9;
  PedestrianARVKRenderer *v10;

  v3 = sub_1007E2B68();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v9 = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Clearing anchors", (uint8_t *)&v9, 0xCu);
  }

  maneuverEntries = self->_maneuverEntries;
  self->_maneuverEntries = 0;

  arrivalEntry = self->_arrivalEntry;
  self->_arrivalEntry = 0;

  continueEntries = self->_continueEntries;
  self->_continueEntries = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapViewDelegate](self, "mapViewDelegate"));
  objc_msgSend(v8, "updateFeatureMapping:", 0);

}

- (NSArray)maneuverEntries
{
  PedestrianARVKRenderer *v2;
  NSArray *maneuverEntries;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  PedestrianARVKRenderer *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  PedestrianARVKFeatureMapEntry *v41;
  id v42;
  NSObject *v43;
  NSArray *v44;
  NSArray *v45;
  id obj;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  PedestrianARVKRenderer *v56;
  __int16 v57;
  void *v58;

  v2 = self;
  maneuverEntries = self->_maneuverEntries;
  if (!maneuverEntries)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer maneuverGuidanceInfos](v2, "maneuverGuidanceInfos"));
    v5 = sub_1007E2B68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349314;
      v56 = v2;
      v57 = 2112;
      v58 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating maneuver entries from guidance infos: %@", buf, 0x16u);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v7)
    {
      v8 = v7;
      v48 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v51 != v48)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
          v11 = v2;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](v2, "route"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stepAtIndex:", objc_msgSend(v10, "stepIndex")));

          v14 = objc_alloc((Class)VKARWalkingManeuverFeature);
          objc_msgSend(v10, "locationCoordinate");
          v16 = v15;
          v18 = v17;
          v20 = v19;
          v21 = objc_msgSend(v13, "endRouteCoordinate");
          objc_msgSend(v10, "heading");
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
          v25 = objc_msgSend(v14, "initWithDisplayLocation:routeCoordinate:maneuverHeading:displayText:", v21, v24, v16, v18, v20, v23);

          v26 = sub_1007E2B68();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            v28 = (objc_class *)objc_opt_class(v25);
            v29 = NSStringFromClass(v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            objc_msgSend(v10, "locationCoordinate");
            v32 = v31;
            objc_msgSend(v10, "locationCoordinate");
            v34 = v33;
            objc_msgSend(v10, "locationCoordinate");
            v36 = v35;
            objc_msgSend(v10, "heading");
            v38 = v37;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p, location: {%f, %f, %f}, heading: %f, text: %@>"), v30, v25, v32, v34, v36, v38, v39));
            *(_DWORD *)buf = 134349314;
            v56 = v11;
            v57 = 2112;
            v58 = v40;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[%{public}p] Generated maneuver feature: %@", buf, 0x16u);

          }
          v41 = -[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]([PedestrianARVKFeatureMapEntry alloc], "initWithFeature:guidanceInfo:", v25, v10);
          objc_msgSend(v49, "addObject:", v41);

          v2 = v11;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v8);
    }

    v42 = sub_1007E2B68();
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v56 = v2;
      v57 = 2112;
      v58 = v49;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}p] Generated maneuver entries: %@", buf, 0x16u);
    }

    v44 = (NSArray *)objc_msgSend(v49, "copy");
    v45 = v2->_maneuverEntries;
    v2->_maneuverEntries = v44;

    maneuverEntries = v2->_maneuverEntries;
  }
  return maneuverEntries;
}

- (PedestrianARVKFeatureMapEntry)arrivalEntry
{
  PedestrianARVKFeatureMapEntry *arrivalEntry;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  void *v30;
  PedestrianARVKFeatureMapEntry *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  id v37;
  void *v38;
  unsigned int v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  double v43;
  double v44;
  double v45;
  __double2 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  NSObject *v55;
  objc_class *v56;
  NSString *v57;
  void *v58;
  void *v59;
  PedestrianARVKFeatureMapEntry *v60;
  PedestrianARVKFeatureMapEntry *v61;
  uint8_t buf[4];
  PedestrianARVKRenderer *v64;
  __int16 v65;
  void *v66;

  arrivalEntry = self->_arrivalEntry;
  if (arrivalEntry)
  {
LABEL_25:
    v31 = arrivalEntry;
    return v31;
  }
  v4 = sub_1007E2B68();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v64 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating arrival entry", buf, 0xCu);
  }

  v6 = objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer arrivalGuidanceInfo](self, "arrivalGuidanceInfo"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "steps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));

    objc_msgSend(v10, "endGeoCoordinate");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "legs"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "destinationDisplayInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arInfo"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "destination"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "geoMapItem"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_styleAttributes"));
    v26 = v25;
    if (v25)
      v27 = v25;
    else
      v27 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes markerStyleAttributes](GEOFeatureStyleAttributes, "markerStyleAttributes"));
    v32 = v27;

    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "storefrontFaceGeometrys"));
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = sub_1007E2B68();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v64 = self;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor with real look-around storefront data", buf, 0xCu);
      }

      v37 = objc_msgSend(objc_alloc((Class)VKARWalkingArrivalFeature), "initWithARInfo:undulationProvider:iconStyleAttributes:", v21, &stru_1011C8F70, v32);
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v39 = objc_msgSend(v38, "BOOLForKey:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

      v40 = sub_1007E2B68();
      v41 = objc_claimAutoreleasedReturnValue(v40);
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
      if (v39)
      {
        if (v42)
        {
          *(_DWORD *)buf = 134349056;
          v64 = self;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor with fake look-around storefront data", buf, 0xCu);
        }

        v43 = sin(v12 * 0.0174532925);
        v44 = 6378137.0 / sqrt(v43 * -0.00669437999 * v43 + 1.0);
        v45 = v43 * (v16 * 0.0174532925 + v44);
        v46 = __sincos_stret(v14 * 0.0174532925);
        v47 = (void *)objc_opt_new(GEOPDOrientedPosition);
        objc_msgSend(v47, "setX:", v46.__cosval * v45);
        objc_msgSend(v47, "setY:", v46.__sinval * v45);
        objc_msgSend(v47, "setZ:", v43 * (v16 * 0.0174532925 + v44 * 0.99330562));
        v48 = (void *)objc_opt_new(GEOPDOrientedBoundingBox);
        objc_msgSend(v48, "setPosition:", v47);
        v49 = (void *)objc_opt_new(GEOARInfo);

        objc_msgSend(v49, "addStorefrontFaceGeometry:", v48);
        v37 = objc_msgSend(objc_alloc((Class)VKARWalkingArrivalFeature), "initWithARInfo:undulationProvider:iconStyleAttributes:", v49, &stru_1011C8F90, v32);

        v21 = v49;
      }
      else
      {
        if (v42)
        {
          *(_DWORD *)buf = 134349056;
          v64 = self;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Generating arrival anchor without look-around storefront data", buf, 0xCu);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](self, "route"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "steps"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "lastObject"));

        v53 = objc_alloc((Class)VKARWalkingArrivalFeature);
        objc_msgSend(v52, "endGeoCoordinate");
        v37 = objc_msgSend(v53, "initWithPosition:iconStyleAttributes:", v32);

      }
    }
    v54 = sub_1007E2B68();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v56 = (objc_class *)objc_opt_class(v37);
      v57 = NSStringFromClass(v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p, location: {%f, %f, %f}, arInfo: %@, styleAttributes: %@>"), v58, v37, *(_QWORD *)&v12, *(_QWORD *)&v14, *(_QWORD *)&v16, v21, v32));
      *(_DWORD *)buf = 134349314;
      v64 = self;
      v65 = 2112;
      v66 = v59;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%{public}p] Generated arrival feature: %@", buf, 0x16u);

    }
    v60 = -[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]([PedestrianARVKFeatureMapEntry alloc], "initWithFeature:guidanceInfo:", v37, v7);
    v61 = self->_arrivalEntry;
    self->_arrivalEntry = v60;

    arrivalEntry = self->_arrivalEntry;
    goto LABEL_25;
  }
  v28 = sub_1007E2B68();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer guidanceInfos](self, "guidanceInfos"));
    *(_DWORD *)buf = 134349314;
    v64 = self;
    v65 = 2112;
    v66 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}p] There is no arrival guidance info; cannot generate arrival entry: %@",
      buf,
      0x16u);

  }
  v31 = 0;
  return v31;
}

- (NSArray)continueEntries
{
  PedestrianARVKRenderer *v2;
  NSArray *continueEntries;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *i;
  void *v10;
  id v11;
  PedestrianARVKRenderer *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  PedestrianARVKFeatureMapEntry *v28;
  id v29;
  NSObject *v30;
  NSArray *v31;
  NSArray *v32;
  id obj;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  PedestrianARVKRenderer *v43;
  __int16 v44;
  void *v45;

  v2 = self;
  continueEntries = self->_continueEntries;
  if (!continueEntries)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer continueGuidanceInfos](v2, "continueGuidanceInfos"));
    v5 = sub_1007E2B68();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349314;
      v43 = v2;
      v44 = 2112;
      v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Generating continue entries with continue infos: %@", buf, 0x16u);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v7)
    {
      v8 = v7;
      v35 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v35)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          v11 = objc_alloc((Class)VKARWalkingContinueFeature);
          v12 = v2;
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer route](v2, "route"));
          v14 = objc_msgSend(v10, "locationCoordinateRange");
          v16 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
          v18 = objc_msgSend(v11, "initWithRoute:range:displayText:continuePriority:", v13, v14, v16, v17, objc_msgSend(v10, "priority"));

          v19 = sub_1007E2B68();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = (objc_class *)objc_opt_class(v18);
            v22 = NSStringFromClass(v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
            v24 = GEOPolylineCoordinateRangeAsString(objc_msgSend(v10, "locationCoordinateRange"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrowLabel"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p, range: %@, text: %@>"), v23, v18, v25, v26));
            *(_DWORD *)buf = 134349314;
            v43 = v12;
            v44 = 2112;
            v45 = v27;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Generated continue feature: %@", buf, 0x16u);

          }
          v28 = -[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]([PedestrianARVKFeatureMapEntry alloc], "initWithFeature:guidanceInfo:", v18, v10);
          objc_msgSend(v36, "addObject:", v28);

          v2 = v12;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v8);
    }

    v29 = sub_1007E2B68();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v43 = v2;
      v44 = 2112;
      v45 = v36;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}p] Generated continue entries: %@", buf, 0x16u);
    }

    v31 = (NSArray *)objc_msgSend(v36, "copy");
    v32 = v2->_continueEntries;
    v2->_continueEntries = v31;

    continueEntries = v2->_continueEntries;
  }
  return continueEntries;
}

- (MNGuidanceARInfo)arrivalGuidanceInfo
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer guidanceInfos](self, "guidanceInfos"));
  v3 = sub_10039E1FC(v2, &stru_1011C8FB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (MNGuidanceARInfo *)v4;
}

- (NSArray)maneuverGuidanceInfos
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer guidanceInfos](self, "guidanceInfos"));
  v3 = sub_10039E080(v2, &stru_1011C8FD0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (NSArray)continueGuidanceInfos
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer guidanceInfos](self, "guidanceInfos"));
  v3 = sub_10039E080(v2, &stru_1011C8FF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (void)setGuidanceInfos:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NSArray *guidanceInfos;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 v16;
  id v17;
  NSObject *v18;
  int v19;
  id v20;
  NSArray *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  NSArray *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  NSArray *v38;
  void *v39;
  id v40;
  NSObject *v41;
  NSArray *v42;
  void *v43;
  BOOL v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  unint64_t v51;
  unint64_t v52;
  unsigned __int8 v53;
  id v54;
  NSObject *v55;
  char v56;
  id v57;
  NSArray *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  NSArray *v63;
  id v64;
  void *v65;
  NSArray *continueEntries;
  id v67;
  NSObject *v68;
  id v69;
  id v70;
  uint64_t v71;
  NSArray *v72;
  void *i;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  PedestrianARVKFeatureMapEntry *arrivalEntry;
  void *v81;
  int v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  NSArray *maneuverEntries;
  void *v88;
  id v89;
  NSObject *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *j;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  id v101;
  id v102;
  int v103;
  int v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  void *v110;
  id v111;
  int v112;
  char obj;
  char obja;
  NSArray *objb;
  PedestrianARVKRenderer *v116;
  _QWORD v117[5];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[5];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  uint8_t v128[128];
  uint8_t buf[4];
  PedestrianARVKRenderer *v130;
  __int16 v131;
  NSArray *v132;
  __int16 v133;
  id v134;

  v5 = a3;
  v6 = sub_1007E2B68();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    guidanceInfos = self->_guidanceInfos;
    *(_DWORD *)buf = 134349570;
    v130 = self;
    v131 = 2112;
    v132 = guidanceInfos;
    v133 = 2112;
    v134 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Updating guidance info; old: %@, new: %@",
      buf,
      0x20u);
  }

  objc_storeStrong((id *)&self->_guidanceInfos, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer continueGuidanceInfos](self, "continueGuidanceInfos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", &stru_1011C9010));

  v11 = sub_10039DCD4(self->_continueEntries, &stru_1011C9030);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sortedArrayUsingComparator:", &stru_1011C9050));

  v14 = v10;
  v15 = v13;
  if (v14 | v15
    && (v16 = objc_msgSend((id)v14, "isEqual:", v15),
        (id)v15,
        (id)v14,
        (v16 & 1) == 0))
  {
    v24 = sub_1007E2B68();
    v18 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v25 = sub_10039DCD4((void *)v15, &stru_1011C9090);
      v26 = (NSArray *)objc_claimAutoreleasedReturnValue(v25);
      v27 = sub_10039DCD4((void *)v14, &stru_1011C90B0);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 134349570;
      v130 = self;
      v131 = 2112;
      v132 = v26;
      v133 = 2112;
      v134 = v28;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Continue entries are different: existing: %@, new: %@", buf, 0x20u);

    }
    v19 = 0;
  }
  else
  {
    v17 = sub_1007E2B68();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = 1;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = sub_10039DCD4((void *)v15, &stru_1011C90D0);
      v21 = (NSArray *)objc_claimAutoreleasedReturnValue(v20);
      v22 = sub_10039DCD4((void *)v14, &stru_1011C90F0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 134349570;
      v130 = self;
      v131 = 2112;
      v132 = v21;
      v133 = 2112;
      v134 = v23;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Continue entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);

    }
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer arrivalGuidanceInfo](self, "arrivalGuidanceInfo"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKFeatureMapEntry guidanceInfo](self->_arrivalEntry, "guidanceInfo"));
  v31 = v29;
  v32 = v30;
  v33 = (void *)v31;
  v34 = (void *)v32;
  v110 = (void *)v32;
  v111 = v5;
  if (v31 | v32
    && (v35 = objc_msgSend((id)v31, "isEqual:", v32),
        v34,
        (id)v31,
        (v35 & 1) == 0))
  {
    v40 = sub_1007E2B68();
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mapsShortDescription"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "mapsShortDescription"));
      *(_DWORD *)buf = 134349570;
      v130 = self;
      v131 = 2112;
      v132 = v42;
      v133 = 2112;
      v134 = v43;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] Arrival entries: existing: %@, new: %@", buf, 0x20u);

      v34 = v110;
    }

    if (v31)
      v44 = v34 == 0;
    else
      v44 = 1;
    v45 = v44;
    v112 = v45;
  }
  else
  {
    v36 = sub_1007E2B68();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v38 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mapsShortDescription"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v31, "mapsShortDescription"));
      *(_DWORD *)buf = 134349570;
      v130 = self;
      v131 = 2112;
      v132 = v38;
      v133 = 2112;
      v134 = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%{public}p] Arrival entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);

    }
    v112 = 0;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer maneuverGuidanceInfos](self, "maneuverGuidanceInfos"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "sortedArrayUsingComparator:", &stru_1011C9110));

  v48 = sub_10039DCD4(self->_maneuverEntries, &stru_1011C9130);
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "sortedArrayUsingComparator:", &stru_1011C9150));

  v51 = v47;
  v52 = v50;
  v116 = self;
  if (v51 | v52
    && (v53 = objc_msgSend((id)v51, "isEqual:", v52),
        (id)v52,
        (id)v51,
        (v53 & 1) == 0))
  {
    v61 = sub_1007E2B68();
    v55 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v62 = sub_10039DCD4((void *)v52, &stru_1011C9170);
      v63 = (NSArray *)objc_claimAutoreleasedReturnValue(v62);
      v64 = sub_10039DCD4((void *)v51, &stru_1011C9190);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      *(_DWORD *)buf = 134349570;
      v130 = v116;
      v131 = 2112;
      v132 = v63;
      v133 = 2112;
      v134 = v65;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver entries are different: existing: %@, new: %@", buf, 0x20u);

      self = v116;
    }
    v56 = 0;
  }
  else
  {
    v54 = sub_1007E2B68();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    v56 = 1;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      v57 = sub_10039DCD4((void *)v52, &stru_1011C91B0);
      v58 = (NSArray *)objc_claimAutoreleasedReturnValue(v57);
      v59 = sub_10039DCD4((void *)v51, &stru_1011C91D0);
      v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
      *(_DWORD *)buf = 134349570;
      v130 = v116;
      v131 = 2112;
      v132 = v58;
      v133 = 2112;
      v134 = v60;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver entries are both nil or equal: existing: %@, new: %@", buf, 0x20u);

      self = v116;
      v56 = 1;
    }
  }

  continueEntries = self->_continueEntries;
  if ((v19 & 1) != 0)
  {
    if (!continueEntries)
      goto LABEL_47;
    obj = v56;
    v67 = sub_1007E2B68();
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v130 = self;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "[%{public}p] Updating continue entries mapping", buf, 0xCu);
    }

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    continueEntries = self->_continueEntries;
    v69 = -[NSArray countByEnumeratingWithState:objects:count:](continueEntries, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
    if (v69)
    {
      v70 = v69;
      v108 = v52;
      v101 = (id)v51;
      v102 = (id)v31;
      v103 = v19;
      v105 = v15;
      v71 = *(_QWORD *)v124;
      do
      {
        v72 = continueEntries;
        for (i = 0; i != v70; i = (char *)i + 1)
        {
          if (*(_QWORD *)v124 != v71)
            objc_enumerationMutation(v72);
          v74 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * (_QWORD)i);
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "feature", v101, v102));
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer continueGuidanceInfos](v116, "continueGuidanceInfos"));
          v122[0] = _NSConcreteStackBlock;
          v122[1] = 3221225472;
          v122[2] = sub_1007E529C;
          v122[3] = &unk_1011B6CF8;
          v122[4] = v74;
          v77 = sub_10039E1FC(v76, v122);
          v78 = (void *)objc_claimAutoreleasedReturnValue(v77);

          v79 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapViewDelegate](v116, "mapViewDelegate"));
          objc_msgSend(v79, "updateGuidanceInfo:forFeature:", v78, v75);

        }
        continueEntries = v72;
        v70 = -[NSArray countByEnumeratingWithState:objects:count:](v72, "countByEnumeratingWithState:objects:count:", &v123, v128, 16);
      }
      while (v70);
      self = v116;
      v15 = v105;
      v19 = v103;
      v51 = (unint64_t)v101;
      v33 = v102;
      v52 = v108;
    }
    else
    {
      self = v116;
    }
    v56 = obj;
  }
  else
  {
    self->_continueEntries = 0;
  }

LABEL_47:
  arrivalEntry = self->_arrivalEntry;
  if (v112)
  {
    self->_arrivalEntry = 0;
  }
  else
  {
    if (!arrivalEntry)
      goto LABEL_54;
    obja = v56;
    v109 = v52;
    v81 = v33;
    v82 = v19;
    v83 = sub_1007E2B68();
    v84 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v130 = self;
      _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_INFO, "[%{public}p] Updating arrival entry mapping", buf, 0xCu);
    }

    arrivalEntry = (PedestrianARVKFeatureMapEntry *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapViewDelegate](self, "mapViewDelegate"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer arrivalGuidanceInfo](self, "arrivalGuidanceInfo"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKFeatureMapEntry feature](self->_arrivalEntry, "feature"));
    -[PedestrianARVKFeatureMapEntry updateGuidanceInfo:forFeature:](arrivalEntry, "updateGuidanceInfo:forFeature:", v85, v86);

    v19 = v82;
    v33 = v81;
    v52 = v109;
    v56 = obja;
  }

LABEL_54:
  maneuverEntries = self->_maneuverEntries;
  if ((v56 & 1) == 0)
  {
    self->_maneuverEntries = 0;

    v88 = v111;
LABEL_69:
    -[PedestrianARVKRenderer rebuildAnchors](self, "rebuildAnchors", v101, v102);
    goto LABEL_70;
  }
  v88 = v111;
  if (maneuverEntries)
  {
    v107 = v14;
    v101 = (id)v51;
    v102 = v33;
    v104 = v19;
    v106 = v15;
    v89 = sub_1007E2B68();
    v90 = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v130 = self;
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "[%{public}p] Updating maneuver entries mapping", buf, 0xCu);
    }

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    objb = self->_maneuverEntries;
    v91 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v119;
      do
      {
        for (j = 0; j != v92; j = (char *)j + 1)
        {
          if (*(_QWORD *)v119 != v93)
            objc_enumerationMutation(objb);
          v95 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * (_QWORD)j);
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "feature", v101, v102));
          v97 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer maneuverGuidanceInfos](v116, "maneuverGuidanceInfos"));
          v117[0] = _NSConcreteStackBlock;
          v117[1] = 3221225472;
          v117[2] = sub_1007E52E8;
          v117[3] = &unk_1011B6CF8;
          v117[4] = v95;
          v98 = sub_10039E1FC(v97, v117);
          v99 = (void *)objc_claimAutoreleasedReturnValue(v98);

          v100 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapViewDelegate](v116, "mapViewDelegate"));
          objc_msgSend(v100, "updateGuidanceInfo:forFeature:", v99, v96);

        }
        v92 = -[NSArray countByEnumeratingWithState:objects:count:](objb, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
      }
      while (v92);
    }

    v88 = v111;
    self = v116;
    v15 = v106;
    v14 = v107;
    v19 = v104;
    v51 = (unint64_t)v101;
    v33 = v102;
  }
  if ((v112 | v19 ^ 1) == 1)
    goto LABEL_69;
LABEL_70:

}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6;
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  PedestrianARVKRenderer *v28;
  int v29;
  PedestrianARVKRenderer *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  _BYTE v34[24];
  __int16 v35;
  const char *v36;

  v6 = a3;
  v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = 136316418;
        v30 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer navigationService:didUpdateMatchedLocation:]";
        v31 = 2080;
        v32 = "PedestrianARVKRenderer.m";
        v33 = 1024;
        *(_DWORD *)v34 = 481;
        *(_WORD *)&v34[4] = 2080;
        *(_QWORD *)&v34[6] = "dispatch_get_main_queue()";
        *(_WORD *)&v34[14] = 2080;
        *(_QWORD *)&v34[16] = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v35 = 2080;
        v36 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v29,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v26 = sub_1004318FC();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (PedestrianARVKRenderer *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v29 = 138412290;
          v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);

        }
      }
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));

  v12 = sub_1007E2B68();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v14)
    {
      objc_msgSend(v7, "coordinate");
      v16 = v15;
      objc_msgSend(v7, "coordinate");
      v18 = v17;
      objc_msgSend(v7, "altitude");
      v29 = 134349825;
      v30 = self;
      v31 = 2049;
      v32 = v16;
      v33 = 2049;
      *(_QWORD *)v34 = v18;
      *(_WORD *)&v34[8] = 2049;
      *(_QWORD *)&v34[10] = v19;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Got location update: %{private}0.6f, %{private}0.6f, %{private}0.6f", (uint8_t *)&v29, 0x2Au);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
    objc_msgSend(v20, "setRouteUserOffset:", objc_msgSend(v21, "routeCoordinate"));

    v13 = objc_claimAutoreleasedReturnValue(-[PedestrianARVKRenderer mapView](self, "mapView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject userLocationAnimator](v13, "userLocationAnimator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeMatch"));
    objc_msgSend(v22, "updateLocation:routeMatch:", v7, v23);

  }
  else if (v14)
  {
    v29 = 134349056;
    v30 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Location update had no route match; ignoring",
      (uint8_t *)&v29,
      0xCu);
  }

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v7;
  const char *label;
  const char *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  unint64_t v13;
  NSArray *maneuverEntries;
  NSArray *continueEntries;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  PedestrianARVKRenderer *v20;
  int v21;
  PedestrianARVKRenderer *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  _BYTE v26[14];
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;

  v7 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v21 = 136316418;
        v22 = (PedestrianARVKRenderer *)"-[PedestrianARVKRenderer navigationService:didUpdateStepIndex:segmentIndex:]";
        v23 = 2080;
        v24 = "PedestrianARVKRenderer.m";
        v25 = 1024;
        *(_DWORD *)v26 = 496;
        *(_WORD *)&v26[4] = 2080;
        *(_QWORD *)&v26[6] = "dispatch_get_main_queue()";
        v27 = 2080;
        v28 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v21,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (PedestrianARVKRenderer *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v21 = 138412290;
          v22 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

        }
      }
    }
  }
  if (-[PedestrianARVKRenderer lastManeuverStepIndex](self, "lastManeuverStepIndex") != a4)
  {
    v11 = sub_1007E2B68();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = -[PedestrianARVKRenderer lastManeuverStepIndex](self, "lastManeuverStepIndex");
      v21 = 134349568;
      v22 = self;
      v23 = 2048;
      v24 = (const char *)v13;
      v25 = 2048;
      *(_QWORD *)v26 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Maneuver step index changed; previous: %lu, current: %lu",
        (uint8_t *)&v21,
        0x20u);
    }

    -[PedestrianARVKRenderer setLastManeuverStepIndex:](self, "setLastManeuverStepIndex:", a4);
    maneuverEntries = self->_maneuverEntries;
    self->_maneuverEntries = 0;

    continueEntries = self->_continueEntries;
    self->_continueEntries = 0;

    -[PedestrianARVKRenderer rebuildAnchors](self, "rebuildAnchors");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  PedestrianARVKFeatureMapEntry *arrivalEntry;
  objc_super v21;
  uint8_t buf[4];
  PedestrianARVKRenderer *v23;
  __int16 v24;
  __CFString *v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v13 != v11)
  {

LABEL_9:
    v21.receiver = self;
    v21.super_class = (Class)PedestrianARVKRenderer;
    -[PedestrianARVKRenderer observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
    goto LABEL_10;
  }
  v14 = objc_msgSend(v10, "isEqualToString:", CFSTR("PedestrianARInjectFakeStorefrontArrivalDataKey"));

  if (!v14)
    goto LABEL_9;
  v15 = sub_1007E2B68();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    v18 = CFSTR("YES");
    if (!v17)
      v18 = CFSTR("NO");
    v19 = v18;
    *(_DWORD *)buf = 134349314;
    v23 = self;
    v24 = 2112;
    v25 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Debug force show arrival key was toggled: %@", buf, 0x16u);

  }
  arrivalEntry = self->_arrivalEntry;
  self->_arrivalEntry = 0;

  -[PedestrianARVKRenderer rebuildAnchors](self, "rebuildAnchors");
LABEL_10:

}

- (void)updateARSigns:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  PedestrianARVKRenderer *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = sub_1007E2B68();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134349314;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Got updated AR guidance infos: %@", (uint8_t *)&v7, 0x16u);
  }

  -[PedestrianARVKRenderer setGuidanceInfos:](self, "setGuidanceInfos:", v4);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)shouldGenerateFeatures
{
  return self->_shouldGenerateFeatures;
}

- (VKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (PedestrianARVKMapViewMapDelegate)mapViewDelegate
{
  return (PedestrianARVKMapViewMapDelegate *)objc_loadWeakRetained((id *)&self->_mapViewDelegate);
}

- (void)setMapViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mapViewDelegate, a3);
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (void)setGuidanceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_guidanceObserver, a3);
}

- (void)setArrivalEntry:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalEntry, a3);
}

- (void)setManeuverEntries:(id)a3
{
  objc_storeStrong((id *)&self->_maneuverEntries, a3);
}

- (void)setContinueEntries:(id)a3
{
  objc_storeStrong((id *)&self->_continueEntries, a3);
}

- (unint64_t)lastManeuverStepIndex
{
  return self->_lastManeuverStepIndex;
}

- (void)setLastManeuverStepIndex:(unint64_t)a3
{
  self->_lastManeuverStepIndex = a3;
}

- (NSArray)guidanceInfos
{
  return self->_guidanceInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceInfos, 0);
  objc_storeStrong((id *)&self->_continueEntries, 0);
  objc_storeStrong((id *)&self->_maneuverEntries, 0);
  objc_storeStrong((id *)&self->_arrivalEntry, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_destroyWeak((id *)&self->_mapViewDelegate);
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
