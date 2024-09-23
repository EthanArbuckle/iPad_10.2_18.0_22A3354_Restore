@implementation AppStateManager

- (AppStateManager)initWithPlatformController:(id)a3
{
  id v5;
  AppStateManager *v6;
  AppStateManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AppStateManager;
  v6 = -[AppStateManager init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    v7->_defaultZoomLevel = GEOConfigGetUInteger(MapsConfig_DefaultZoomLevelAtLaunch, off_1014B3088);
  }

  return v7;
}

- (id)iosChrome
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));

  return v3;
}

- (void)openSearchWithQuery:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  SearchFieldItem *v7;
  id WeakRetained;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "opening search with query: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v7, "setSearchString:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
  objc_msgSend(v9, "viewController:doSearchItem:withUserInfo:", 0, v7, 0);

}

- (void)openMapsSuggestion:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "opening suggestion: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
  objc_msgSend(v8, "viewController:openMapsSuggestionEntry:withUserInfo:", 0, v4, 0);

}

- (void)openTransitIncidents:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "opening transit incident: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
  objc_msgSend(v8, "viewController:openTransitIncidents:fromView:withUserInfo:", 0, v4, 0, 0);

}

- (void)openCommuteEntry:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "opening commute entry: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
  objc_msgSend(v8, "viewController:openCommuteEntry:", 0, v4);

}

- (id)mapsActivityWithFidelity:(unint64_t)a3
{
  unint64_t v3;
  MapsActivity *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  void *m;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *j;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unint64_t v86;
  MapsActivity *v87;
  void *v88;
  void *v89;
  AppStateManager *v90;
  id obj;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];

  if ((a3 & 0xFFFFFFF) != 0)
  {
    v3 = a3;
    v5 = objc_alloc_init(MapsActivity);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));

    if ((v3 & 2) != 0)
    {
      v8 = objc_alloc_init((Class)GEOURLOptions);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "camera"));
      objc_msgSend(v9, "centerCoordinate");
      if (v11 >= -180.0 && v11 <= 180.0 && v10 >= -90.0 && v10 <= 90.0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoCamera"));
        objc_msgSend(v8, "setCamera:", v12);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
      v14 = (unint64_t)objc_msgSend(v13, "displayedViewMode") - 1;
      if (v14 > 6)
        v15 = 0;
      else
        v15 = dword_100E3F0B8[v14];
      objc_msgSend(v8, "setMapType:", v15);

      v16 = objc_msgSend(v7, "userTrackingMode");
      if (v16 == (id)1)
        v17 = 1;
      else
        v17 = 2 * (v16 == (id)2);
      objc_msgSend(v8, "setUserTrackingMode:", v17);
      -[MapsActivity setDisplayOptions:](v5, "setDisplayOptions:", v8);
      WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentTransitLineItem"));

      if (v20)
      {
        -[MapsActivity setSelectedTransitFeatureID:](v5, "setSelectedTransitFeatureID:", objc_msgSend(v20, "muid"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
        -[MapsActivity setSelectedTransitLineName:](v5, "setSelectedTransitLineName:", v21);

        v22 = objc_msgSend(objc_alloc((Class)MSPTransitStorageLineItem), "initWithLineItem:", v20);
        -[MapsActivity setLineItem:](v5, "setLineItem:", v22);

      }
    }
    if ((v3 & 1) != 0)
    {
      v23 = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "baseActionCoordinator"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentSearchSession"));

      v26 = objc_loadWeakRetained((id *)&self->_appCoordinator);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "baseActionCoordinator"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentMapItem"));

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentResultsSearchInfo"));
      LODWORD(v27) = objc_msgSend(v29, "isSearchAlongRoute");

      if ((_DWORD)v27)
      {

        v25 = 0;
      }
      v89 = v7;
      v90 = self;
      v30 = objc_alloc((Class)GEOSearchCategoryStorage);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchFieldItem"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "searchCategory"));
      v33 = objc_msgSend(v30, "initWithSearchCategory:", v32);
      -[MapsActivity setSearchCategoryStorage:](v5, "setSearchCategoryStorage:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchFieldItem"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "searchString"));
      -[MapsActivity setSearchString:](v5, "setSearchString:", v35);

      v88 = v25;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchInfo"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "results"));

      v92 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v37, "count"));
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      obj = v37;
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
      if (v38)
      {
        v39 = v38;
        v40 = 0;
        v41 = 0;
        v42 = *(_QWORD *)v106;
        do
        {
          for (i = 0; i != v39; i = (char *)i + 1)
          {
            if (*(_QWORD *)v106 != v42)
              objc_enumerationMutation(obj);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i), "mapItem"));
            v45 = v44;
            if (!v40)
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "name"));
            if (v45 == v28
              || objc_msgSend(v45, "_muid") && (v46 = objc_msgSend(v45, "_muid"), v46 == objc_msgSend(v28, "_muid")))
            {
              -[MapsActivity setSelectedPlaceIndex:](v5, "setSelectedPlaceIndex:", (char *)i + v41);
            }
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "_geoMapItem"));

            if (v47)
              objc_msgSend(v92, "addObject:", v45);

          }
          v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
          v41 += (uint64_t)i;
        }
        while (v39);
      }
      else
      {
        v40 = 0;
      }

      v48 = objc_alloc_init((Class)NSMutableArray);
      if ((v3 & 0x10) != 0)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v57 = v92;
        v63 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
        if (v63)
        {
          v64 = v63;
          v65 = *(_QWORD *)v94;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(_QWORD *)v94 != v65)
                objc_enumerationMutation(v57);
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j), "_geoMapItemStorageForPersistence"));
              if (v67)
                objc_msgSend(v48, "addObject:", v67);

            }
            v64 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
          }
          while (v64);
        }
      }
      else
      {
        v86 = v3;
        v87 = v5;
        v49 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v92, "count"));
        v101 = 0u;
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v50 = v92;
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v102;
          do
          {
            for (k = 0; k != v52; k = (char *)k + 1)
            {
              if (*(_QWORD *)v102 != v53)
                objc_enumerationMutation(v50);
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1)
                                                                                 + 8 * (_QWORD)k), "_geoMapItem"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "_mapItemByStrippingOptionalData"));

              if (v56)
                objc_msgSend(v49, "addObject:", v56);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
          }
          while (v52);
        }

        v99 = 0u;
        v100 = 0u;
        v97 = 0u;
        v98 = 0u;
        v57 = v49;
        v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
        if (v58)
        {
          v59 = v58;
          v60 = *(_QWORD *)v98;
          do
          {
            for (m = 0; m != v59; m = (char *)m + 1)
            {
              if (*(_QWORD *)v98 != v60)
                objc_enumerationMutation(v57);
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)m)));
              if (v62)
                objc_msgSend(v48, "addObject:", v62);

            }
            v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
          }
          while (v59);
        }

        v3 = v86;
        v5 = v87;
      }

      -[MapsActivity setSearchPlaces:](v5, "setSearchPlaces:", v48);
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity searchString](v5, "searchString"));

      if (!v68)
        -[MapsActivity setSearchString:](v5, "setSearchString:", v40);
      if (v28)
        -[MapsActivity setIsPresentingSelectedPlace:](v5, "setIsPresentingSelectedPlace:", 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPinsController sharedController](MapsPinsController, "sharedController"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "droppedPin"));

      if (v70)
      {
        -[MapsActivity setDroppedPin:](v5, "setDroppedPin:", v70);
        -[MapsActivity setIsDroppedPinPresented:](v5, "setIsDroppedPinPresented:", 0);
        -[MapsActivity setIsDroppedPinSelected:](v5, "setIsDroppedPinSelected:", 0);
        if (v28)
        {
          objc_msgSend(v28, "_coordinate");
          v72 = v71;
          v74 = v73;
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "latLng"));
          objc_msgSend(v75, "lat");
          v77 = v76;
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "latLng"));
          objc_msgSend(v78, "lng");
          if (vabdd_f64(v72, v77) >= 0.00000000999999994)
          {

          }
          else
          {
            v80 = vabdd_f64(v74, v79);

            if (v80 < 0.00000000999999994)
            {
              -[MapsActivity setIsDroppedPinSelected:](v5, "setIsDroppedPinSelected:", 1);
              if (-[MapsActivity isPresentingSelectedPlace](v5, "isPresentingSelectedPlace"))
                -[MapsActivity setIsDroppedPinPresented:](v5, "setIsDroppedPinPresented:", 1);
            }
          }
        }
      }
      if (-[MapsActivity isPresentingSelectedPlace](v5, "isPresentingSelectedPlace")
        && !-[MapsActivity isDroppedPinPresented](v5, "isDroppedPinPresented")
        && !-[MapsActivity hasSelectedPlaceIndex](v5, "hasSelectedPlaceIndex"))
      {
        if ((v3 & 0x10) != 0)
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_geoMapItemStorageForPersistence"));
          -[MapsActivity setPresentedMapItem:](v5, "setPresentedMapItem:", v82);
        }
        else
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_geoMapItem"));
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "_mapItemByStrippingOptionalData"));

          v83 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v82));
          -[MapsActivity setPresentedMapItem:](v5, "setPresentedMapItem:", v83);

        }
      }

      v7 = v89;
      self = v90;
    }
    if ((v3 & 0xC) != 0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager directionsPlanWithFidelity:](self, "directionsPlanWithFidelity:", v3));
      -[MapsActivity setDirectionsPlan:](v5, "setDirectionsPlan:", v84);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)directionsPlanWithFidelity:(unint64_t)a3
{
  void *v4;
  void *v5;
  RoutePlanningSessionDirectionsPlanBuilder *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager platformController](self, "platformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionStack"));

  if (objc_msgSend(v5, "count"))
  {
    v6 = sub_1003C915C(v5, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "buildDirectionsPlan"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)resetNonActivityStateForMapView:(id)a3
{
  _objc_msgSend(a3, "resetDisplayedFloorOrdinalForAllVenues");
}

- (void)setMapsActivity:(id)a3 assumedSourceFidelity:(unint64_t)a4 source:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  uint64_t Log;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint64_t v33;
  void *v34;
  double v35;
  CLLocationDegrees v36;
  CLLocationDegrees v37;
  CLLocationCoordinate2D v38;
  double v39;
  double v40;
  double v41;
  SearchFieldItem *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  SearchFieldItem *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  double v58;
  double v59;
  void *i;
  void *v61;
  void *v62;
  id v63;
  SearchResult *v64;
  id v65;
  _QWORD *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  void *v70;
  void *v71;
  id WeakRetained;
  IncompleteTransitLineItem *v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  IncompleteTransitLineItem *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  double v87;
  CLLocationDegrees v88;
  void *v89;
  void *v90;
  CLLocationDegrees v91;
  CLLocationCoordinate2D v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  SearchFieldItem *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  unsigned __int8 v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  _BOOL4 v113;
  unint64_t v114;
  id v115;
  void *v116;
  void *v117;
  void *v119;
  id v121;
  void *v122;
  id v123;
  _QWORD v124[4];
  id v125;
  id location;
  _QWORD v127[4];
  id v128;
  _QWORD *v129;
  _QWORD v130[4];
  id v131;
  AppStateManager *v132;
  _BYTE *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD block[4];
  id v139;
  id v140;
  int64_t v141;
  void *v142;
  uint8_t v143[128];
  _BYTE buf[24];
  uint64_t (*v145)(uint64_t, uint64_t);
  void (*v146)(uint64_t);
  id v147;

  v6 = a3;
  if ((+[UIApplication shouldMakeUIForDefaultPNG](UIApplication, "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v114 = a4;
    v117 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

    v9 = sub_100431A4C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "setting Maps activity (tag %@)", buf, 0xCu);
    }

    global_queue = dispatch_get_global_queue(-2, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B85590;
    block[3] = &unk_1011B15B0;
    v115 = v8;
    v139 = v115;
    v141 = a5;
    v121 = v117;
    v140 = v121;
    dispatch_async(v12, block);

    if (!v121)
      goto LABEL_97;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
    v14 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = a5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v121;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "setting Maps activity from source: %ld : state: %@", buf, 0x16u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));

    -[AppStateManager resetNonActivityStateForMapView:](self, "resetNonActivityStateForMapView:", v116);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "displayOptions"));
    v119 = v16;
    if (v16)
    {
      if (objc_msgSend(v16, "hasCamera"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "camera"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapCamera"));

        objc_msgSend(v18, "centerCoordinate");
        v21 = 0;
        v22 = 1;
        if (v20 >= -180.0 && v20 <= 180.0 && v19 >= -90.0 && v19 <= 90.0)
        {
          objc_msgSend(v116, "setCamera:", v18);
          v22 = 0;
          v21 = 1;
        }

      }
      else
      {
        v21 = 0;
        v22 = 1;
      }
      if (objc_msgSend(v119, "hasMapType")
        && !+[UIApplication _maps_isAnySceneConnectedForRole:](UIApplication, "_maps_isAnySceneConnectedForRole:", _UIWindowSceneSessionRoleCarPlay))
      {
        v23 = objc_msgSend(v119, "mapType") - 1;
        if (v23 > 3)
          v24 = 0;
        else
          v24 = qword_100E3F0D8[v23];
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "settingsController"));
        v27 = objc_msgSend(v26, "bestMapViewModeForViewMode:ignoringLabelPreference:", v24, objc_msgSend(v119, "ignoreLabelPreference"));

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
        objc_msgSend(v28, "updateViewMode:animated:", v27, 0);

      }
      if (objc_msgSend(v119, "hasEnableTraffic"))
      {
        v29 = objc_msgSend(v119, "enableTraffic");
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "settingsController"));
        objc_msgSend(v31, "setUserDesiresTraffic:", v29);

      }
      if (objc_msgSend(v119, "hasUserTrackingMode"))
      {
        v32 = objc_msgSend(v119, "userTrackingMode");
        if (v32 == 1)
          v33 = 1;
        else
          v33 = 2 * (v32 == 2);
        objc_msgSend(v116, "setUserTrackingMode:", v33);
        v22 = 0;
      }
      if (objc_msgSend(v119, "hasCenterSpan"))
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "centerSpan"));
        objc_msgSend(v34, "latitude");
        v36 = v35;
        objc_msgSend(v34, "longitude");
        v38 = CLLocationCoordinate2DMake(v36, v37);
        objc_msgSend(v34, "latitudeDelta");
        v40 = v39;
        objc_msgSend(v34, "longitudeDelta");
        objc_msgSend(v116, "setRegion:animated:", 0, v38.latitude, v38.longitude, v40, v41);

        v22 = 0;
      }
      v113 = v21 != 0;
      if (objc_msgSend(v119, "hasUserTrackingMode")
        && objc_msgSend(v119, "hasUserTrackingMode")
        && objc_msgSend(v119, "hasPitchedWhileTracking")
        && objc_msgSend(v119, "pitchedWhileTracking"))
      {
        objc_msgSend(v116, "_enter3DMode");
        if (!v22)
        {
LABEL_40:
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v145 = sub_100B85650;
          v146 = sub_100B85660;
          v147 = 0;
          if (objc_msgSend(v121, "hasSearchString"))
          {
            v42 = objc_alloc_init(SearchFieldItem);
            v43 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v42;

            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchString"));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setSearchString:", v44);

          }
          if (objc_msgSend(v121, "hasSearchCategoryStorage"))
          {
            v45 = objc_alloc((Class)GEOSearchCategory);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchCategoryStorage"));
            v47 = objc_msgSend(v45, "initWithStorage:", v46);

            if (v47)
            {
              v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
              if (!v48)
              {
                v49 = objc_alloc_init(SearchFieldItem);
                v50 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v49;

                v48 = *(void **)(*(_QWORD *)&buf[8] + 40);
              }
              objc_msgSend(v48, "setSearchCategory:", v47);
            }

          }
          v51 = objc_alloc((Class)NSMutableArray);
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchPlaces"));
          v123 = objc_msgSend(v51, "initWithCapacity:", objc_msgSend(v52, "count"));

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchPlaces"));
          if (v53)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchPlaces"));
            v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v54, "count")));

            v136 = 0u;
            v137 = 0u;
            v134 = 0u;
            v135 = 0u;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "searchPlaces"));
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
            if (v56)
            {
              v57 = *(_QWORD *)v135;
              v58 = MKCoordinateInvalid[0];
              v59 = MKCoordinateInvalid[1];
              do
              {
                for (i = 0; i != v56; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v135 != v57)
                    objc_enumerationMutation(v55);
                  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1)
                                                                                     + 8 * (_QWORD)i), "data"));
                  v62 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForSerializedMapItemStorage:](GEOMapItemStorage, "mapItemStorageForSerializedMapItemStorage:", v61));

                  if (objc_msgSend(v62, "_hasMUID"))
                  {
                    if (!objc_msgSend(v62, "_muid"))
                      goto LABEL_62;
                    v63 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", objc_msgSend(v62, "_muid"), 0, v58, v59);
                    if (v63)
                      objc_msgSend(v122, "addObject:", v63);
                  }
                  else
                  {
                    v63 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v62, 0);
                    v64 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v63);
                    if (v64)
                      objc_msgSend(v123, "addObject:", v64);

                  }
LABEL_62:

                }
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v134, v143, 16);
              }
              while (v56);
            }

            v130[0] = _NSConcreteStackBlock;
            v130[1] = 3221225472;
            v130[2] = sub_100B85668;
            v130[3] = &unk_1011E7488;
            v65 = v121;
            v133 = buf;
            v131 = v65;
            v132 = self;
            v66 = objc_retainBlock(v130);
            if (objc_msgSend(v122, "count")
              && ((v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "directionsPlan"))) == 0
               || (v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "directionsPlan")),
                   v69 = objc_msgSend(v68, "isPlayingTrace"),
                   v68,
                   v67,
                   v69)))
            {
              v70 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
              v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "ticketForIdentifiers:traits:", v122, 0));

              v127[0] = _NSConcreteStackBlock;
              v127[1] = 3221225472;
              v127[2] = sub_100B857C0;
              v127[3] = &unk_1011ADA50;
              v128 = v123;
              v129 = v66;
              objc_msgSend(v71, "submitWithHandler:networkActivity:", v127, &stru_1011E74A8);

            }
            else if (objc_msgSend(v123, "count"))
            {
              ((void (*)(_QWORD *, id))v66[2])(v66, v123);
            }

          }
          if (objc_msgSend(v121, "hasLineItem"))
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
            v73 = (IncompleteTransitLineItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
            v74 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "lineItem"));
            if (a5 == 3)
              v75 = 3;
            else
              v75 = 0;
            -[IncompleteTransitLineItem setCurrentTransitLineItem:zoomToMapRegion:preferredLayout:](v73, "setCurrentTransitLineItem:zoomToMapRegion:preferredLayout:", v74, !v113, v75);
          }
          else
          {
            if (!objc_msgSend(v121, "hasSelectedTransitFeatureID"))
            {
LABEL_81:
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "droppedPin"));

              if (v81)
              {
                v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "droppedPin"));
                if (objc_msgSend(v82, "hasFloorOrdinal"))
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "droppedPin"));
                  v84 = (uint64_t)objc_msgSend(v83, "floorOrdinal");

                }
                else
                {
                  v84 = 0x7FFFFFFFLL;
                }

                v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "droppedPin"));
                v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "latLng"));
                objc_msgSend(v86, "lat");
                v88 = v87;
                v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "droppedPin"));
                v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "latLng"));
                objc_msgSend(v90, "lng");
                v92 = CLLocationCoordinate2DMake(v88, v91);
                v93 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", v84, v92.latitude, v92.longitude));

                v94 = (void *)objc_claimAutoreleasedReturnValue(+[CustomSearchManager sharedManager](CustomSearchManager, "sharedManager"));
                objc_msgSend(v94, "setCustomSearchResult:animated:shouldSelectOnMap:", v93, 0, 0);

                if (objc_msgSend(v121, "isDroppedPinSelected"))
                {
                  v95 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
                  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "searchPinsManager"));

                  objc_msgSend(v96, "selectDroppedPinIsAnimated:", 0);
                }

              }
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "presentedMapItem"));

              if (v97)
              {
                objc_initWeak(&location, self);
                v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "presentedMapItem"));
                v124[0] = _NSConcreteStackBlock;
                v124[1] = 3221225472;
                v124[2] = sub_100B858E8;
                v124[3] = &unk_1011C9FC8;
                objc_copyWeak(&v125, &location);
                v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "searchResultForFidelity:refinedHandler:", v114, v124));

                if (v99)
                {
                  v100 = objc_alloc_init(SearchFieldItem);
                  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "title"));
                  -[SearchFieldItem setSearchString:](v100, "setSearchString:", v101);

                  v102 = objc_loadWeakRetained((id *)&self->_appCoordinator);
                  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "baseActionCoordinator"));
                  v142 = v99;
                  v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v142, 1));
                  v105 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v104));
                  objc_msgSend(v103, "restoreSearchForItem:withResults:", v100, v105);

                }
                objc_destroyWeak(&v125);
                objc_destroyWeak(&location);
              }
              v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "directionsPlan"));
              v107 = objc_msgSend(v106, "isPlayingTrace");

              if ((v107 & 1) == 0)
              {
                v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "directionsPlan"));
                -[AppStateManager setDirectionsPlan:source:](self, "setDirectionsPlan:source:", v108, a5);

              }
              v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "userCreatedCollectionID"));

              if (v109)
              {
                v110 = objc_loadWeakRetained((id *)&self->_appCoordinator);
                v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "baseActionCoordinator"));
                v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "userCreatedCollectionID"));
                objc_msgSend(v111, "viewController:showCollectionWithID:", 0, v112);

              }
              _Block_object_dispose(buf, 8);

LABEL_97:
              v6 = v117;
              goto LABEL_98;
            }
            v76 = objc_alloc((Class)MKMapItemIdentifier);
            v77 = objc_msgSend(v121, "selectedTransitFeatureID");
            WeakRetained = objc_msgSend(v76, "initWithMUID:resultProviderID:coordinate:", v77, 0, MKCoordinateInvalid[0], MKCoordinateInvalid[1]);
            if (!WeakRetained)
            {
LABEL_80:

              goto LABEL_81;
            }
            v78 = [IncompleteTransitLineItem alloc];
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "selectedTransitLineName"));
            v73 = -[IncompleteTransitLineItem initWithIdentifier:name:](v78, "initWithIdentifier:name:", WeakRetained, v79);

            v74 = objc_loadWeakRetained((id *)&self->_appCoordinator);
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "baseActionCoordinator"));
            objc_msgSend(v80, "setCurrentTransitLineItem:zoomToMapRegion:", v73, !v113);

          }
          goto LABEL_80;
        }
      }
      else if (!v22)
      {
        goto LABEL_40;
      }
    }
    else
    {
      v113 = 0;
    }
    objc_msgSend(v116, "setUserTrackingMode:", 1);
    goto LABEL_40;
  }
LABEL_98:

}

- (BOOL)_shouldSkipStateRestorationForDirectionPlan:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  _QWORD *v27;
  _QWORD *v28;
  double Double;
  _BOOL4 v30;
  _BOOL4 v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  char isKindOfClass;
  id v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  uint64_t v43;
  char v44;
  id v45;
  int v47;
  __CFString *v48;
  __int16 v49;
  double v50;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeRequestStorage"));
  v8 = objc_msgSend(v7, "transportType");

  v9 = 0;
  if (a4 == 6 && v8 - 7 <= 0xFFFFFFFC)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentLocation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "latLng"));
    objc_msgSend(v12, "coordinate");
    v14 = v13;
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeRequestStorage"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waypoints"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "latLng"));
    objc_msgSend(v20, "coordinate");
    v22 = v21;
    v24 = v23;

    v26 = GEOCalculateDistance(v25, v14, v16, v22, v24);
    if (v8)
      v27 = &MapsConfig_DirectionsRestorationLocationChangeWalkingTransitCyclingThreshold;
    else
      v27 = &MapsConfig_DirectionsRestorationLocationChangeDrivingThreshold;
    v28 = &off_1014B2E48;
    if (v8)
      v28 = &off_1014B2E58;
    Double = GEOConfigGetDouble(*v27, *v28);
    if (fabs(v14) >= 0.00000000999999994 || fabs(v16) >= 0.00000000999999994)
    {
      v31 = fabs(v22) >= 0.00000000999999994;
      if (fabs(v24) >= 0.00000000999999994)
        v31 = 1;
      v30 = v26 < Double && v31;
    }
    else
    {
      v30 = 0;
    }
    v32 = sub_100B85D6C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = CFSTR("NO");
      if (v30)
        v34 = CFSTR("YES");
      v35 = v34;
      v47 = 138412546;
      v48 = v35;
      v49 = 2048;
      v50 = v26;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Ignoring direction plan %@ for location change %f", (uint8_t *)&v47, 0x16u);

    }
    if (v30)
      goto LABEL_29;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self->_platformController, "currentSession"));
    v37 = objc_opt_class(RoutePlanningSession);
    isKindOfClass = objc_opt_isKindOfClass(v36, v37);

    if ((isKindOfClass & 1) != 0)
    {
      v39 = sub_100B85D6C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
LABEL_28:

LABEL_29:
        v9 = 1;
        goto LABEL_30;
      }
      LOWORD(v47) = 0;
      v41 = "Ignoring direction plan state restoration because the user is in route planning";
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PlatformController currentSession](self->_platformController, "currentSession"));
      v43 = objc_opt_class(NavigationSession);
      v44 = objc_opt_isKindOfClass(v42, v43);

      if ((v44 & 1) == 0)
      {
        v9 = 0;
        goto LABEL_30;
      }
      v45 = sub_100B85D6C();
      v40 = objc_claimAutoreleasedReturnValue(v45);
      if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        goto LABEL_28;
      LOWORD(v47) = 0;
      v41 = "Ignoring direction plan state restoration because the user is in navigation";
    }
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, v41, (uint8_t *)&v47, 2u);
    goto LABEL_28;
  }
LABEL_30:

  return v9;
}

- (void)setDirectionsPlan:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  id v13;
  DrivePreferences *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  AppStateManager *v35;
  uint64_t v36;
  void *j;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  unsigned int v43;
  uint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  DirectionItem *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  DrivePreferences *v57;
  DrivePreferences *v58;
  void *v59;
  DrivePreferences *v60;
  DrivePreferences *v61;
  void *v62;
  DrivePreferences *v63;
  DrivePreferences *v64;
  TransitPreferences *v65;
  void *v66;
  void *v67;
  TransitPreferences *v68;
  void *v69;
  void *v70;
  void *v71;
  WalkPreferences *v72;
  void *v73;
  void *v74;
  WalkPreferences *v75;
  CyclePreferences *v76;
  void *v77;
  void *v78;
  CyclePreferences *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  unsigned int v85;
  id v86;
  NSObject *v87;
  id v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  double v106;
  double v107;
  void *v108;
  id v109;
  NSObject *v110;
  id v111;
  void *v112;
  void *v113;
  __CFString *v114;
  void *v115;
  void *v116;
  __CFString *v117;
  void *v118;
  id WeakRetained;
  void *v120;
  id v121;
  NSObject *v122;
  AppStateManager *v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[4];
  char v143;
  _QWORD block[4];
  id v145;
  DrivePreferences *v146;
  int64_t v147;
  uint8_t buf[4];
  id v149;
  __int16 v150;
  __CFString *v151;
  _BYTE v152[128];
  _BYTE v153[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));

  v9 = sub_100431A4C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v149 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "setting directions plan (tag %@)", buf, 0xCu);
  }

  global_queue = dispatch_get_global_queue(-2, 0);
  v12 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B86E30;
  block[3] = &unk_1011B15B0;
  v13 = v8;
  v145 = v13;
  v147 = a4;
  v14 = (DrivePreferences *)v6;
  v146 = v14;
  dispatch_async(v12, block);

  if (v14
    && !-[AppStateManager _shouldSkipStateRestorationForDirectionPlan:source:](self, "_shouldSkipStateRestorationForDirectionPlan:source:", v14, a4))
  {
    v128 = v13;
    v15 = sub_100B85D6C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetDirectionsPlan", ", buf, 2u);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AppStateManager iosChrome](self, "iosChrome"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapView"));

    v127 = v18;
    v124 = objc_msgSend(v18, "userTrackingMode");
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences routeRequestStorage](v14, "routeRequestStorage"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "waypoints"));
    v19 = objc_msgSend(v132, "count");
    v20 = objc_alloc_init((Class)NSMutableArray);
    v133 = objc_alloc_init((Class)NSMutableDictionary);
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_100B86F74;
    v142[3] = &unk_1011E74C8;
    v143 = ((unint64_t)a4 > 5) | (0xAu >> a4) & 1;
    v21 = objc_retainBlock(v142);
    v130 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences originString](v14, "originString"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences destinationString](v14, "destinationString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences planningWaypoints](v14, "planningWaypoints"));
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v24 = (id)objc_claimAutoreleasedReturnValue(-[DrivePreferences planningWaypoints](v14, "planningWaypoints"));
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
      if (v25)
      {
        v26 = v25;
        v123 = self;
        v27 = *(_QWORD *)v139;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v139 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v29, "hasWaypoint"))
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "waypoint"));
              v31 = (id)((uint64_t (*)(_QWORD *, void *))v21[2])(v21, v30);
            }
            else
            {
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "searchString"));
              v31 = sub_100B86EF0(v30);
            }
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
            objc_msgSend(v20, "addObject:", v32);

          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v138, v153, 16);
        }
        while (v26);
        self = v123;
      }
LABEL_30:
      v40 = v131;
LABEL_31:

      goto LABEL_32;
    }
    if ((unint64_t)v19 >= 2)
    {
      if (((unint64_t)a4 > 5) | (0xAu >> a4) & 1)
        objc_msgSend(v133, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("DirectionsAttemptCachedRouteKey"));
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v24 = v132;
      v33 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
      if (v33)
      {
        v34 = v33;
        v35 = self;
        v36 = *(_QWORD *)v135;
        do
        {
          for (j = 0; j != v34; j = (char *)j + 1)
          {
            if (*(_QWORD *)v135 != v36)
              objc_enumerationMutation(v24);
            v38 = ((uint64_t (*)(_QWORD *, _QWORD))v21[2])(v21, *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)j));
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            objc_msgSend(v20, "addObject:", v39);

          }
          v34 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v134, v152, 16);
        }
        while (v34);
        self = v35;
      }
      goto LABEL_30;
    }
    if (v19 == (id)1)
    {
      v40 = v131;
      if (v130)
      {
        v45 = sub_100B86EF0(v130);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        objc_msgSend(v20, "addObject:", v46);

LABEL_42:
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "firstObject"));
        v47 = ((uint64_t (*)(_QWORD *, id))v21[2])(v21, v24);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        objc_msgSend(v20, "addObject:", v48);

        goto LABEL_31;
      }
      if (!v129)
      {
        v115 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v115));
        objc_msgSend(v20, "addObject:", v116);

        goto LABEL_42;
      }
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "firstObject"));
      v97 = ((uint64_t (*)(_QWORD *, void *))v21[2])(v21, v96);
      v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
      objc_msgSend(v20, "addObject:", v98);

      v95 = v129;
    }
    else
    {
      v40 = v131;
      if (!v130 || !v129)
      {
LABEL_32:
        if ((unint64_t)objc_msgSend(v20, "count") <= 1)
        {
          v41 = sub_100431A4C();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Applying MapsActivity: Not enough waypoints in directions plan", buf, 2u);
          }
LABEL_121:

          v13 = v128;
          goto LABEL_122;
        }
        if (objc_msgSend(v40, "hasTransportType"))
        {
          v43 = objc_msgSend(v40, "transportType") - 1;
          if (v43 > 5)
            v44 = 1;
          else
            v44 = qword_100E3F0F8[v43];
        }
        else
        {
          v44 = 0;
        }
        v49 = [DirectionItem alloc];
        v50 = objc_msgSend(v20, "copy");
        v42 = -[DirectionItem initWithItems:transportType:](v49, "initWithItems:transportType:", v50, v44);

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "destinationRouteData"));
        -[NSObject setPersistentData:](v42, "setPersistentData:", v51);

        if (!-[DrivePreferences hasDisplayMethod](v14, "hasDisplayMethod"))
          goto LABEL_118;
        if (-[DrivePreferences hasCurrentRouteIndex](v14, "hasCurrentRouteIndex"))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[DrivePreferences currentRouteIndex](v14, "currentRouteIndex")));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v52, CFSTR("DirectionsRouteIndexKey"));

        }
        if (-[DrivePreferences hasCurrentRouteStep](v14, "hasCurrentRouteStep"))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[DrivePreferences currentRouteStep](v14, "currentRouteStep")));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v53, CFSTR("DirectionsStepIndex"));

        }
        if (objc_msgSend(v40, "hasRouteHandle"))
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "routeHandle"));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v54, CFSTR("DirectionsRouteHandle"));

        }
        if (-[DrivePreferences hasDepartureTime](v14, "hasDepartureTime"))
        {
          -[DrivePreferences departureTime](v14, "departureTime");
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v55, CFSTR("DirectionsDepartureDateKey"));

        }
        if (-[DrivePreferences hasArrivalTime](v14, "hasArrivalTime"))
        {
          -[DrivePreferences arrivalTime](v14, "arrivalTime");
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
          objc_msgSend(v133, "setObject:forKeyedSubscript:", v56, CFSTR("DirectionsArrivalDateKey"));

        }
        v40 = v131;
        if (objc_msgSend(v131, "hasAutomobileOptions"))
        {
          v57 = [DrivePreferences alloc];
          v58 = (DrivePreferences *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "automobileOptions"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v60 = -[DrivePreferences initWithAutomobileOptions:defaults:](v57, "initWithAutomobileOptions:defaults:", v58, v59);
          -[NSObject setDrivePreferences:](v42, "setDrivePreferences:", v60);

        }
        else
        {
          if ((-[DrivePreferences hasAvoidTolls](v14, "hasAvoidTolls") & 1) == 0
            && !-[DrivePreferences hasAvoidHighways](v14, "hasAvoidHighways"))
          {
LABEL_67:
            if (objc_msgSend(v131, "hasTransitOptions"))
            {
              v65 = [TransitPreferences alloc];
              v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "transitOptions"));
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
              v68 = -[TransitPreferences initWithTransitOptions:defaults:](v65, "initWithTransitOptions:defaults:", v66, v67);
              -[NSObject setTransitPreferences:](v42, "setTransitPreferences:", v68);

            }
            else
            {
              if (-[DrivePreferences hasTransitPreferences](v14, "hasTransitPreferences"))
              {
                v69 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences transitPreferences](v14, "transitPreferences"));
                v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v69, "avoidedTransitModes")));
                objc_msgSend(v133, "setObject:forKeyedSubscript:", v70, CFSTR("DirectionsAvoidedTransitModesKey"));

              }
              if (-[DrivePreferences hasTransitPrioritization](v14, "hasTransitPrioritization"))
              {
                v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[DrivePreferences transitPrioritization](v14, "transitPrioritization")));
                objc_msgSend(v133, "setObject:forKeyedSubscript:", v71, CFSTR("DirectionsSortOptionKey"));

              }
              if (!-[DrivePreferences hasTransitSurchargeOption](v14, "hasTransitSurchargeOption"))
              {
LABEL_76:
                if (objc_msgSend(v131, "hasWalkingOptions"))
                {
                  v72 = [WalkPreferences alloc];
                  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "walkingOptions"));
                  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                  v75 = -[WalkPreferences initWithWalkingOptions:defaults:](v72, "initWithWalkingOptions:defaults:", v73, v74);
                  -[NSObject setWalkPreferences:](v42, "setWalkPreferences:", v75);

                }
                if (objc_msgSend(v131, "hasCyclingOptions"))
                {
                  v76 = [CyclePreferences alloc];
                  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "cyclingOptions"));
                  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                  v79 = -[CyclePreferences initWithCyclingOptions:defaults:](v76, "initWithCyclingOptions:defaults:", v77, v78);
                  -[NSObject setCyclePreferences:](v42, "setCyclePreferences:", v79);

                }
                if (-[DrivePreferences hasShouldRestoreLowGuidance](v14, "hasShouldRestoreLowGuidance"))
                {
                  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[DrivePreferences shouldRestoreLowGuidance](v14, "shouldRestoreLowGuidance")));
                  objc_msgSend(v133, "setObject:forKeyedSubscript:", v80, CFSTR("DirectionsShouldRestoreLowGuidanceKey"));

                }
                v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v124));
                objc_msgSend(v133, "setObject:forKeyedSubscript:", v81, CFSTR("DirectionsTrackingModeKey"));

                v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
                objc_msgSend(v133, "setObject:forKeyedSubscript:", v82, CFSTR("DirectionsSourceKey"));

                if (-[DrivePreferences hasCompanionRouteContextData](v14, "hasCompanionRouteContextData"))
                {
                  v83 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences companionRouteContextData](v14, "companionRouteContextData"));
                  v84 = objc_msgSend(objc_alloc((Class)GEOCompanionRouteContext), "initWithData:", v83);
                  objc_msgSend(v133, "setObject:forKeyedSubscript:", v84, CFSTR("DirectionsCompanionRouteContextKey"));

                }
                v85 = -[DrivePreferences displayMethod](v14, "displayMethod");
                if (v85 < 2)
                {
                  v86 = sub_100431A4C();
                  v87 = objc_claimAutoreleasedReturnValue(v86);
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_INFO, "Performing direction plan for route planning...", buf, 2u);
                  }
                  goto LABEL_116;
                }
                if (v85 == 2)
                {
                  v88 = sub_100431A4C();
                  v89 = objc_claimAutoreleasedReturnValue(v88);
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_INFO, "Performing direction plan for active navigation...", buf, 2u);
                  }

                  v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject items](v42, "items"));
                  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "firstObject"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "searchResult"));
                  if (objc_msgSend(v92, "isDynamicCurrentLocation"))
                  {

                  }
                  else
                  {
                    v125 = v90;
                    v100 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject persistentData](v42, "persistentData"));

                    if (!v100)
                    {
LABEL_105:
                      if (!GEOConfigGetBOOL(MapsConfig_ShareETAEnableStateRestoration, off_1014B4928))
                      {
LABEL_117:
                        WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
                        v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "baseActionCoordinator"));
                        objc_msgSend(v120, "setCurrentDirectionItem:withOptions:", v42, v133);

                        goto LABEL_118;
                      }
                      v109 = sub_100431A4C();
                      v110 = objc_claimAutoreleasedReturnValue(v109);
                      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
                      {
                        v126 = -[DrivePreferences handlesForSharingETAsCount](v14, "handlesForSharingETAsCount");
                        v111 = (id)objc_claimAutoreleasedReturnValue(-[DrivePreferences handlesForSharingETAs](v14, "handlesForSharingETAs"));
                        v112 = v111;
                        if (v111)
                        {
                          if (objc_msgSend(v111, "count"))
                          {
                            v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "componentsJoinedByString:", CFSTR(", ")));
                            v114 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v112, v113));

                          }
                          else
                          {
                            v114 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v112));
                          }
                        }
                        else
                        {
                          v114 = CFSTR("<nil>");
                        }

                        v117 = v114;
                        *(_DWORD *)buf = 134218242;
                        v149 = v126;
                        v150 = 2112;
                        v151 = v117;
                        _os_log_impl((void *)&_mh_execute_header, v110, OS_LOG_TYPE_INFO, "Found %lu handles in directions plan for trip sharing: %@", buf, 0x16u);

                      }
                      v118 = (void *)objc_claimAutoreleasedReturnValue(-[DrivePreferences handlesForSharingETAs](v14, "handlesForSharingETAs"));
                      v87 = objc_claimAutoreleasedReturnValue(+[MSPSharedTripContact contactsFromHandles:](MSPSharedTripContact, "contactsFromHandles:", v118));

                      if (-[NSObject count](v87, "count"))
                        objc_msgSend(v133, "setObject:forKeyedSubscript:", v87, CFSTR("DirectionsPreviousContactsForTripSharing"));
LABEL_116:

                      goto LABEL_117;
                    }
                  }
                  if (a4 == 5)
                  {
                    v101 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 5.0));
                    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "objectForKey:", CFSTR("NavigationAutoLaunchDelayKey")));

                    if (v103)
                      v104 = v103;
                    else
                      v104 = v101;
                    v105 = v104;

                    objc_msgSend(v105, "doubleValue");
                    v107 = v106;

                    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v107));
                    objc_msgSend(v133, "setObject:forKeyedSubscript:", v108, CFSTR("DirectionsNavigationAutoLaunchDelayKey"));

                  }
                  else
                  {
                    objc_msgSend(v133, "setObject:forKeyedSubscript:", &off_101270A80, CFSTR("DirectionsNavigationAutoLaunchDelayKey"));
                  }
                  goto LABEL_105;
                }
LABEL_118:
                v121 = sub_100B85D6C();
                v122 = objc_claimAutoreleasedReturnValue(v121);
                if (os_signpost_enabled(v122))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v122, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetDirectionsPlan", ", buf, 2u);
                }

                goto LABEL_121;
              }
              v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[DrivePreferences transitSurchargeOption](v14, "transitSurchargeOption")));
              objc_msgSend(v133, "setObject:forKeyedSubscript:", v66, CFSTR("DirectionsTransitSurchargeOptionKey"));
            }

            goto LABEL_76;
          }
          v61 = [DrivePreferences alloc];
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v58 = -[DrivePreferences initWithDefaults:](v61, "initWithDefaults:", v62);

          if (-[DrivePreferences hasAvoidTolls](v14, "hasAvoidTolls"))
            v63 = v14;
          else
            v63 = v58;
          -[DrivePreferences setAvoidTolls:](v58, "setAvoidTolls:", -[DrivePreferences avoidTolls](v63, "avoidTolls"));
          if (-[DrivePreferences hasAvoidHighways](v14, "hasAvoidHighways"))
            v64 = v14;
          else
            v64 = v58;
          -[DrivePreferences setAvoidHighways:](v58, "setAvoidHighways:", -[DrivePreferences avoidHighways](v64, "avoidHighways"));
          -[NSObject setDrivePreferences:](v42, "setDrivePreferences:", v58);
        }

        goto LABEL_67;
      }
      v93 = sub_100B86EF0(v130);
      v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
      objc_msgSend(v20, "addObject:", v94);

      v95 = v129;
    }
    v99 = sub_100B86EF0(v95);
    v24 = (id)objc_claimAutoreleasedReturnValue(v99);
    objc_msgSend(v20, "addObject:", v24);
    goto LABEL_31;
  }
LABEL_122:

}

- (BOOL)tryMovingStepModeToStepAtIndex:(unint64_t)a3 forRouteWithHandle:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  AppCoordinator **p_appCoordinator;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  int v34;
  unint64_t v35;
  __int16 v36;
  id v37;

  v6 = a4;
  v7 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "AppStateManager");
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v34 = 134218242;
    v35 = a3;
    v36 = 2112;
    v37 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "try moving stepping mode to stepIndex: %ld – routeHandle: %@", (uint8_t *)&v34, 0x16u);
  }

  p_appCoordinator = &self->_appCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentIOSBasedContext"));
  v14 = objc_loadWeakRetained((id *)p_appCoordinator);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stepModeController"));

  if (v13 == v15)
  {
    v22 = objc_loadWeakRetained((id *)p_appCoordinator);
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stepModeController"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject route](v17, "route"));
    if (objc_msgSend(v23, "transportType") == 1)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "suggestedRoute"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "routeHandle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitData"));
      v27 = objc_msgSend(v25, "isEqualToData:", v26);

      if ((v27 & 1) == 0)
      {
LABEL_9:
        v28 = GEOFindOrCreateLog(v7, "AppStateManager");
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v34) = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "current route ID does not match routeHandle, aborting.", (uint8_t *)&v34, 2u);
        }
        v21 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "serverRouteID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeID"));
      v32 = objc_msgSend(v30, "isEqualToData:", v31);

      if ((v32 & 1) == 0)
        goto LABEL_9;
    }
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stepAtIndex:", a3));
    -[NSObject updateWithDisplayedStep:](v17, "updateWithDisplayedStep:", v29);
    v21 = 1;
LABEL_14:

    goto LABEL_15;
  }
  v16 = GEOFindOrCreateLog(v7, "AppStateManager");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = objc_loadWeakRetained((id *)p_appCoordinator);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "chromeViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentIOSBasedContext"));
    v34 = 138412290;
    v35 = (unint64_t)v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "current mode %@ is not stepModeController, aborting.", (uint8_t *)&v34, 0xCu);

  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (void)setPPTTestDirectionsPlan:(id)a3
{
  -[AppStateManager setDirectionsPlan:source:](self, "setDirectionsPlan:source:", a3, 4);
}

- (AppCoordinator)appCoordinator
{
  return (AppCoordinator *)objc_loadWeakRetained((id *)&self->_appCoordinator);
}

- (void)setAppCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_appCoordinator, a3);
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
  objc_storeStrong((id *)&self->_platformController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end
