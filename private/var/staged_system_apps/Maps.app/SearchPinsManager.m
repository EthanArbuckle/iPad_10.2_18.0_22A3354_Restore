@implementation SearchPinsManager

- (SearchPinsManager)initWithMapViewCameraController:(id)a3
{
  id v5;
  SearchPinsManager *v6;
  id v7;
  NSObject *v8;
  SearchPinsManager *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SearchResultsItemSource *v16;
  SearchResultsItemSource *searchResultsItemSource;
  SearchResultsItemSource *v18;
  SearchResultsItemSource *droppedPinsItemSource;
  SearchResultsItemSource *v20;
  SearchResultsItemSource *collectionPinsItemSource;
  SearchResultsItemSource *v22;
  SearchResultsItemSource *singleSearchResultItemSource;
  RouteStartEndItemSource *v24;
  RouteStartEndItemSource *routeStartEndItemSource;
  PlaceCardLinkedPlacesItemSource *v26;
  PlaceCardLinkedPlacesItemSource *placeCardLinkedPlacesItemSource;
  SearchDotPlacesItemSource *v28;
  SearchDotPlacesItemSource *searchDotPlacesItemSource;
  uint64_t v30;
  NSHashTable *poiShapeLoadingObservers;
  objc_super v33;
  uint8_t buf[4];
  void *v35;

  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SearchPinsManager;
  v6 = -[SearchPinsManager init](&v33, "init");
  if (v6)
  {
    v7 = sub_1008AF4EC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      objc_storeStrong((id *)&v6->_mapCameraController, a3);
      v16 = objc_alloc_init(SearchResultsItemSource);
      searchResultsItemSource = v6->_searchResultsItemSource;
      v6->_searchResultsItemSource = v16;

      -[SearchResultsItemSource setMode:](v6->_searchResultsItemSource, "setMode:", 0);
      -[SearchResultsItemSource setPreferredDisplayedSearchResultType:](v6->_searchResultsItemSource, "setPreferredDisplayedSearchResultType:", 1);
      v18 = objc_alloc_init(SearchResultsItemSource);
      droppedPinsItemSource = v6->_droppedPinsItemSource;
      v6->_droppedPinsItemSource = v18;

      -[SearchResultsItemSource setMode:](v6->_droppedPinsItemSource, "setMode:", 1);
      v20 = objc_alloc_init(SearchResultsItemSource);
      collectionPinsItemSource = v6->_collectionPinsItemSource;
      v6->_collectionPinsItemSource = v20;

      -[SearchResultsItemSource setMode:](v6->_collectionPinsItemSource, "setMode:", 0);
      v22 = objc_alloc_init(SearchResultsItemSource);
      singleSearchResultItemSource = v6->_singleSearchResultItemSource;
      v6->_singleSearchResultItemSource = v22;

      -[SearchResultsItemSource setMode:](v6->_singleSearchResultItemSource, "setMode:", 0);
      v24 = objc_alloc_init(RouteStartEndItemSource);
      routeStartEndItemSource = v6->_routeStartEndItemSource;
      v6->_routeStartEndItemSource = v24;

      v26 = objc_alloc_init(PlaceCardLinkedPlacesItemSource);
      placeCardLinkedPlacesItemSource = v6->_placeCardLinkedPlacesItemSource;
      v6->_placeCardLinkedPlacesItemSource = v26;

      v28 = objc_alloc_init(SearchDotPlacesItemSource);
      searchDotPlacesItemSource = v6->_searchDotPlacesItemSource;
      v6->_searchDotPlacesItemSource = v28;

      v30 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
      poiShapeLoadingObservers = v6->_poiShapeLoadingObservers;
      v6->_poiShapeLoadingObservers = (NSHashTable *)v30;

      goto LABEL_10;
    }
    v9 = v6;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  SearchResult *hiddenStartPin;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocating", buf, 0xCu);

  }
  -[SearchPinsManager _clearShowSearchResultsAnimation](self, "_clearShowSearchResultsAnimation");
  hiddenStartPin = self->_hiddenStartPin;
  self->_hiddenStartPin = 0;

  v14.receiver = self;
  v14.super_class = (Class)SearchPinsManager;
  -[SearchPinsManager dealloc](&v14, "dealloc");
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapCameraController](self, "mapCameraController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (void)setMapCameraController:(id)a3
{
  MapCameraController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MapCameraController *v16;

  v5 = (MapCameraController *)a3;
  if (self->_mapCameraController != v5)
  {
    v16 = v5;
    objc_storeStrong((id *)&self->_mapCameraController, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsItemSource](self, "searchResultsItemSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsItemSource](self, "searchResultsItemSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchResults"));
    objc_msgSend(v6, "setSearchResults:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager droppedPinsItemSource](self, "droppedPinsItemSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager droppedPinsItemSource](self, "droppedPinsItemSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchResults"));
    objc_msgSend(v9, "setSearchResults:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
    objc_msgSend(v12, "setStartLocation:endLocations:", self->_startPin, self->_endPins);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchDotPlaces"));
    objc_msgSend(v13, "setSearchDotPlaces:", v15);

    v5 = v16;
  }

}

- (void)setCustomPOIsController:(id)a3
{
  id WeakRetained;
  void *v5;
  NSUInteger v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_customPOIsController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_customPOIsController, obj);
    v5 = obj;
    if (obj)
    {
      if (self->_startPin)
        -[SearchPinsManager _startLoadingNewStartPOIShape](self, "_startLoadingNewStartPOIShape");
      v6 = -[NSArray count](self->_endPins, "count");
      v5 = obj;
      if (v6)
      {
        -[SearchPinsManager _startLoadingNewEndPOIShapes](self, "_startLoadingNewEndPOIShapes");
        v5 = obj;
      }
    }
  }

}

- (id)allSearchResults
{
  return -[SearchResultsItemSource searchResults](self->_searchResultsItemSource, "searchResults");
}

- (id)_setOfPinsForPinType:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager allSearchResults](self, "allSearchResults"));
  v6 = v5;
  if ((v3 & 1) != 0 && objc_msgSend(v5, "count"))
    v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", v6);
  else
    v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 3);
  v8 = v7;
  if ((v3 & 2) != 0 && self->_startPin)
    objc_msgSend(v7, "addObject:");
  if ((v3 & 4) != 0 && -[NSArray count](self->_endPins, "count"))
    objc_msgSend(v8, "addObjectsFromArray:", self->_endPins);
  if ((v3 & 8) != 0 && self->_droppedPin)
    objc_msgSend(v8, "addObject:");

  return v8;
}

- (SearchResult)endPin
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager endPins](self, "endPins"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (SearchResult *)v3;
}

- (void)setSearchPins:(id)a3 selectedPin:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  NSObject *v18;
  SearchPinsManager *v19;
  id *p_isa;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  id v28;
  unsigned int v29;
  __CFString *v30;
  __CFString *v31;
  id v32;
  NSObject *v33;
  SearchPinsManager *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  unsigned int v42;
  unsigned int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  __CFString *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  __CFString *v53;
  _BYTE v54[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SearchPinsManager clearSearchPins](self, "clearSearchPins");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager _setOfPinsForPinType:](self, "_setOfPinsForPinType:", 6));
  v11 = objc_msgSend(v8, "mutableCopy");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "removeObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v14);
  }

  -[SearchPinsManager dropPinsForSearchResults:animate:](self, "dropPinsForSearchResults:animate:", v11, v5);
  v17 = sub_1008AF4EC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v42 = v5;
    v19 = self;
    p_isa = (id *)&v19->super.isa;
    if (!v19)
    {
      v26 = CFSTR("<nil>");
      goto LABEL_17;
    }
    v21 = (objc_class *)objc_opt_class(v19);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, p_isa, v25));

        goto LABEL_15;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, p_isa));
LABEL_15:

LABEL_17:
    v27 = v26;
    v28 = objc_msgSend(v8, "count");
    v29 = objc_msgSend(p_isa[11], "shouldHideSearchResults");

    v30 = CFSTR("NO");
    if (v29)
      v30 = CFSTR("YES");
    v31 = v30;
    *(_DWORD *)buf = 138543874;
    v49 = v26;
    v50 = 2048;
    v51 = v28;
    v52 = 2112;
    v53 = v31;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}@] Setting %lu search results for SearchResultsItemSource. SearchResultsItemSource hiding results: %@", buf, 0x20u);

    v5 = v42;
  }

  if (!-[SearchResultsItemSource shouldHideSearchResults](self->_searchResultsItemSource, "shouldHideSearchResults"))
    goto LABEL_29;
  v32 = sub_1008AF4EC();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    v43 = v5;
    v34 = self;
    v35 = (objc_class *)objc_opt_class(v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

    *(_DWORD *)buf = 138543618;
    v49 = v40;
    v50 = 2112;
    v51 = v8;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}@] Setting search results:\n(%@) but results were hidden. Unhiding them.", buf, 0x16u);

    v5 = v43;
  }

  -[SearchResultsItemSource setShouldHideSearchResults:](self->_searchResultsItemSource, "setShouldHideSearchResults:", 0);
LABEL_29:
  -[SearchResultsItemSource setSearchResults:](self->_searchResultsItemSource, "setSearchResults:", v8);
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  objc_msgSend(v41, "_setApplicationState:", 0);

  if (v9)
    -[SearchPinsManager selectLabelMarkerForSearchResult:animated:](self, "selectLabelMarkerForSearchResult:animated:", v9, v5);

}

- (void)setStartPin:(id)a3 endPin:(id)a4
{
  -[SearchPinsManager setStartPin:endPin:useAlternateDirectionsPins:](self, "setStartPin:endPin:useAlternateDirectionsPins:", a3, a4, 0);
}

- (void)setStartPin:(id)a3 endPins:(id)a4
{
  -[SearchPinsManager setStartPin:endPins:useAlternateDirectionsPins:](self, "setStartPin:endPins:useAlternateDirectionsPins:", a3, a4, 0);
}

- (void)setStartPin:(id)a3 endPin:(id)a4 useAlternateDirectionsPins:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v5 = a5;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v12 = v8;
    v10 = a3;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    -[SearchPinsManager setStartPin:endPins:useAlternateDirectionsPins:](self, "setStartPin:endPins:useAlternateDirectionsPins:", v10, v11, v5, v12);

  }
  else
  {
    v11 = a3;
    -[SearchPinsManager setStartPin:endPins:useAlternateDirectionsPins:](self, "setStartPin:endPins:useAlternateDirectionsPins:", v11, 0, v5);
  }

}

- (void)setStartPin:(id)a3 endPins:(id)a4 useAlternateDirectionsPins:(BOOL)a5
{
  int v5;
  unint64_t v8;
  int useAlternateDirectionsPins;
  unsigned int v10;
  int v11;
  id v12;
  BOOL v13;
  BOOL *v14;
  NSArray *endPins;
  void *v16;
  SearchResult **p_startPin;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  SearchPinsManager *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  SearchResult *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  NSArray *v41;
  NSArray *v42;
  id v43;
  NSObject *v44;
  SearchPinsManager *v45;
  objc_class *v46;
  NSString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSArray *v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL v56;
  id v57;
  NSObject *v58;
  SearchPinsManager *v59;
  objc_class *v60;
  NSString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  BOOL v80;
  uint8_t v81[128];
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  NSArray *v85;

  v5 = a5;
  v8 = (unint64_t)a3;
  v69 = a4;
  -[SearchPinsManager _completeShowSearchResultsAnimation](self, "_completeShowSearchResultsAnimation");
  useAlternateDirectionsPins = self->_useAlternateDirectionsPins;
  v68 = (void *)v8;
  if (useAlternateDirectionsPins == v5)
  {
    if (v8 | (unint64_t)self->_startPin)
    {
      v10 = objc_msgSend((id)v8, "isEqualToSearchResult:forPurpose:");
      useAlternateDirectionsPins = self->_useAlternateDirectionsPins;
    }
    else
    {
      v10 = 1;
      useAlternateDirectionsPins = v5;
    }
    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 1;
  }
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 0;
  if (useAlternateDirectionsPins == v5)
  {
    v12 = -[NSArray count](self->_endPins, "count");
    v13 = v12 != objc_msgSend(v69, "count");
    v14 = (BOOL *)(v78 + 3);
  }
  else
  {
    v14 = &v80;
    v13 = 1;
  }
  v80 = v13;
  if (!*v14)
  {
    endPins = self->_endPins;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1008B06B0;
    v74[3] = &unk_1011BE900;
    v75 = v69;
    v76 = &v77;
    -[NSArray enumerateObjectsUsingBlock:](endPins, "enumerateObjectsUsingBlock:", v74);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager _setOfPinsForPinType:](self, "_setOfPinsForPinType:", 9));
  self->_useAlternateDirectionsPins = v5;
  if (v11)
  {
    p_startPin = &self->_startPin;
    if (self->_startPin)
      -[SearchPinsManager _clearStartPin](self, "_clearStartPin");
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_searchResultMemberEqualToResult:forPurpose:", v68, 1));
    v19 = (void *)v18;
    if (v18)
      v20 = (void *)v18;
    else
      v20 = v68;
    objc_storeStrong((id *)&self->_startPin, v20);
    -[SearchResult setAppearance:](*p_startPin, "setAppearance:", 2);
    v21 = sub_1008AF4EC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      goto LABEL_25;
    v23 = self;
    v24 = (objc_class *)objc_opt_class(v23);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && (objc_msgSend(v27, "isEqualToString:", v26) & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_24;
      }

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_24:

    v30 = *p_startPin;
    *(_DWORD *)buf = 138543618;
    v83 = v29;
    v84 = 2112;
    v85 = (NSArray *)v30;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Setting start pin: %@", buf, 0x16u);

LABEL_25:
  }
  if (*((_BYTE *)v78 + 24))
  {
    if (self->_endPins)
      -[SearchPinsManager _clearEndPins](self, "_clearEndPins");
    v31 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v69, "count"));
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v32 = v69;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    if (v33)
    {
      v34 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v34)
            objc_enumerationMutation(v32);
          v36 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
          v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_maps_searchResultMemberEqualToResult:forPurpose:", v36, 1));
          v38 = (void *)v37;
          if (v37)
            v39 = (void *)v37;
          else
            v39 = v36;
          v40 = v39;
          objc_msgSend(v40, "setAppearance:", 1);
          objc_msgSend(v31, "addObject:", v40);

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
      }
      while (v33);
    }

    v41 = (NSArray *)objc_msgSend(v31, "copy");
    v42 = self->_endPins;
    self->_endPins = v41;

    v43 = sub_1008AF4EC();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      goto LABEL_46;
    v45 = self;
    v46 = (objc_class *)objc_opt_class(v45);
    v47 = NSStringFromClass(v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if ((objc_opt_respondsToSelector(v45, "accessibilityIdentifier") & 1) != 0)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v45, "performSelector:", "accessibilityIdentifier"));
      v50 = v49;
      if (v49 && (objc_msgSend(v49, "isEqualToString:", v48) & 1) == 0)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v48, v45, v50));

        goto LABEL_45;
      }

    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v48, v45));
LABEL_45:

    v52 = self->_endPins;
    *(_DWORD *)buf = 138543618;
    v83 = v51;
    v84 = 2112;
    v85 = v52;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "[%{public}@] Setting end pins: %@", buf, 0x16u);

LABEL_46:
  }
  if ((v11 & 1) != 0 || *((_BYTE *)v78 + 24))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
    objc_msgSend(v53, "setStartLocation:endLocations:", self->_startPin, self->_endPins);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v54, "clearSelection");

    if (v11 && self->_startPin)
      -[SearchPinsManager _startLoadingNewStartPOIShape](self, "_startLoadingNewStartPOIShape");
    if (*((_BYTE *)v78 + 24) && -[NSArray count](self->_endPins, "count"))
      -[SearchPinsManager _startLoadingNewEndPOIShapes](self, "_startLoadingNewEndPOIShapes");
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    v56 = sub_1002A8AA0(v55) == 5;

    if (v56)
      goto LABEL_64;
    v57 = sub_1008AF4EC();
    v58 = objc_claimAutoreleasedReturnValue(v57);
    if (!os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
LABEL_63:

      v66 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsItemSource](self, "searchResultsItemSource"));
      objc_msgSend(v66, "setShouldHideSearchResults:", 1);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
      objc_msgSend(v67, "setShouldHideSearchDotPlaces:", 1);

LABEL_64:
      -[SearchPinsManager _updateDroppedPinVisibility](self, "_updateDroppedPinVisibility");
      goto LABEL_65;
    }
    v59 = self;
    v60 = (objc_class *)objc_opt_class(v59);
    v61 = NSStringFromClass(v60);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    if ((objc_opt_respondsToSelector(v59, "accessibilityIdentifier") & 1) != 0)
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v59, "performSelector:", "accessibilityIdentifier"));
      v64 = v63;
      if (v63 && (objc_msgSend(v63, "isEqualToString:", v62) & 1) == 0)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v62, v59, v64));

        goto LABEL_62;
      }

    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v62, v59));
LABEL_62:

    *(_DWORD *)buf = 138543362;
    v83 = v65;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%{public}@] searchResultsItemSource will hide search results.", buf, 0xCu);

    goto LABEL_63;
  }
LABEL_65:

  _Block_object_dispose(&v77, 8);
}

- (void)setDroppedPin:(id)a3 animated:(BOOL)a4 shouldSelect:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  SearchResult *v8;
  SearchResultsItemSource *droppedPinsItemSource;
  void *v10;
  SearchResult *droppedPin;
  SearchResult *v12;
  void *v13;
  char v14;
  void *v15;
  SearchResult *v16;

  v5 = a5;
  v6 = a4;
  v8 = (SearchResult *)a3;
  if (self->_droppedPin)
    -[SearchPinsManager clearDroppedPin](self, "clearDroppedPin");
  droppedPinsItemSource = self->_droppedPinsItemSource;
  v16 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  -[SearchResultsItemSource setSearchResults:](droppedPinsItemSource, "setSearchResults:", v10);

  droppedPin = self->_droppedPin;
  self->_droppedPin = v8;
  v12 = v8;

  -[SearchPinsManager _updateDroppedPinVisibility](self, "_updateDroppedPinVisibility");
  if (v5)
    -[SearchPinsManager selectDroppedPinIsAnimated:](self, "selectDroppedPinIsAnimated:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "setNeedsUserActivityUpdate");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
    objc_msgSend(v15, "setNeedsUserActivityUpdate");

  }
}

- (void)selectDroppedPinIsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SearchResult *droppedPin;
  SearchResult *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  SearchResult *v10;

  v3 = a3;
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    -[SearchPinsManager selectLabelMarkerForSearchResult:animated:](self, "selectLabelMarkerForSearchResult:animated:", droppedPin, v3);
    v6 = self->_droppedPin;
    v9 = CFSTR("selectedSearchResult");
    v10 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), self, v7);

  }
}

- (BOOL)canSelectPin:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  unsigned __int8 v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager allSearchResults](self, "allSearchResults"));
  v6 = objc_msgSend(v5, "_maps_containsSearchResultEqualToResult:forPurpose:", v4, 5);

  v7 = objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](self->_droppedPinsItemSource, "searchResults"));
  v8 = objc_msgSend((id)v7, "_maps_containsSearchResultEqualToResult:forPurpose:", v4, 5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](self->_singleSearchResultItemSource, "searchResults"));
  LOBYTE(v7) = objc_msgSend(v9, "_maps_containsSearchResultEqualToResult:forPurpose:", v4, 5);

  return v6 | v8 | v7;
}

- (BOOL)disableStartPin
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
  v3 = ((unint64_t)objc_msgSend(v2, "visibilityMask") & 1) == 0;

  return v3;
}

- (void)setDisableStartPin:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
  objc_msgSend(v4, "setVisibilityMask:", (unint64_t)objc_msgSend(v4, "visibilityMask") & 0xFFFFFFFFFFFFFFFELL | !v3);

}

- (BOOL)disableEndPins
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
  v3 = ((unint64_t)objc_msgSend(v2, "visibilityMask") & 4) == 0;

  return v3;
}

- (void)setDisableEndPins:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
  v4 = (unint64_t)objc_msgSend(v6, "visibilityMask") & 0xFFFFFFFFFFFFFFF9;
  v5 = 6;
  if (v3)
    v5 = 0;
  objc_msgSend(v6, "setVisibilityMask:", v4 | v5);

}

- (void)_clearStartPin
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchResult *startPin;
  uint64_t v14;
  SearchResult *v15;
  SearchResult *hiddenStartPin;
  uint8_t buf[4];
  void *v18;

  if (!self->_startPin)
    return;
  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing start pin", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager _setOfPinsForPinType:](self, "_setOfPinsForPinType:", 9));
  if (objc_msgSend(v12, "containsObject:", self->_startPin))
  {
    startPin = self->_startPin;
    if (startPin == self->_droppedPin)
      v14 = 3;
    else
      v14 = 1;
    -[SearchResult setAppearance:](startPin, "setAppearance:", v14);
  }
  v15 = self->_startPin;
  self->_startPin = 0;

  hiddenStartPin = self->_hiddenStartPin;
  self->_hiddenStartPin = 0;

  -[SearchPinsManager _setStartPOIShape:](self, "_setStartPOIShape:", 0);
}

- (void)_clearEndPins
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  SearchResult *v18;
  uint64_t v19;
  NSArray *endPins;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;

  if (!-[NSArray count](self->_endPins, "count"))
    return;
  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing end pins", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager _setOfPinsForPinType:](self, "_setOfPinsForPinType:", 9));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_endPins;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(SearchResult **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "containsObject:", v18))
        {
          if (v18 == self->_droppedPin)
            v19 = 3;
          else
            v19 = 1;
          -[SearchResult setAppearance:](v18, "setAppearance:", v19);
        }
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  endPins = self->_endPins;
  self->_endPins = 0;

  -[SearchPinsManager _setEndPOIShapes:](self, "_setEndPOIShapes:", 0);
}

- (void)clearDirectionsPins
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Clearing directions pins.", buf, 0xCu);

  }
  -[SearchPinsManager _clearStartPin](self, "_clearStartPin");
  -[SearchPinsManager _clearEndPins](self, "_clearEndPins");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager routeStartEndItemSource](self, "routeStartEndItemSource"));
  objc_msgSend(v13, "clearStartAndEndLocations");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsItemSource](self, "searchResultsItemSource"));
  objc_msgSend(v14, "setShouldHideSearchResults:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
  objc_msgSend(v15, "setShouldHideSearchDotPlaces:", 0);

  -[SearchPinsManager _updateDroppedPinVisibility](self, "_updateDroppedPinVisibility");
}

- (void)clearSearchPins
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  SearchPinsManager *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  SearchPinsManager *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  NSObject *v41;
  SearchPinsManager *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  uint8_t buf[4];
  __CFString *v50;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will clear search pins.", buf, 0xCu);

  }
  -[SearchPinsManager _clearShowSearchResultsAnimation](self, "_clearShowSearchResultsAnimation");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  objc_msgSend(v13, "setSuggestedApplicationState:", 0);

  if (self->_selectedLabelMarker)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    objc_msgSend(v14, "_deselectLabelMarkerAnimated:", 0);

  }
  if (!self->_startPin && !-[NSArray count](self->_endPins, "count"))
  {
    v15 = sub_1008AF4EC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
LABEL_22:

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "preferredConfiguration"));

      if (objc_msgSend(v25, "conformsToProtocol:", &OBJC_PROTOCOL___MKMapConfigurationHiking))
        v26 = v25;
      else
        v26 = 0;
      v27 = v26;

      objc_msgSend(v27, "setShowsTopographicFeatures:", 0);
      goto LABEL_26;
    }
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_21;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_21:

    *(_DWORD *)buf = 138543362;
    v50 = v23;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Clearing the topographic map", buf, 0xCu);

    goto LABEL_22;
  }
LABEL_26:
  v28 = sub_1008AF4EC();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    goto LABEL_33;
  v30 = self;
  v31 = (objc_class *)objc_opt_class(v30);
  v32 = NSStringFromClass(v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v30, "performSelector:", "accessibilityIdentifier"));
    v35 = v34;
    if (v34 && !objc_msgSend(v34, "isEqualToString:", v33))
    {
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v33, v30, v35));

      goto LABEL_32;
    }

  }
  v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v33, v30));
LABEL_32:

  *(_DWORD *)buf = 138543362;
  v50 = v36;
  _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] SearchResultsItemSource is clearing search results.", buf, 0xCu);

LABEL_33:
  -[SearchResultsItemSource setSearchResults:](self->_searchResultsItemSource, "setSearchResults:", &__NSArray0__struct);
  -[SearchDotPlacesItemSource setSearchDotPlaces:](self->_searchDotPlacesItemSource, "setSearchDotPlaces:", &__NSArray0__struct);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  v38 = objc_opt_respondsToSelector(v37, "setNeedsUserActivityUpdate");

  if ((v38 & 1) != 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
    objc_msgSend(v39, "setNeedsUserActivityUpdate");

  }
  v40 = sub_1008AF4EC();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_41;
      }

    }
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_41:

    *(_DWORD *)buf = 138543362;
    v50 = v48;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}@] Clearing search pins completed", buf, 0xCu);

  }
}

- (void)clearDroppedPin
{
  void *v3;
  id v4;
  NSObject *v5;
  SearchPinsManager *v6;
  SearchPinsManager *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  SearchPinsManager *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  SearchResult *droppedPin;
  uint8_t buf[4];
  __CFString *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager customPOIsController](self, "customPOIsController"));

  if (v3)
  {
    v4 = sub_1008AF4EC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      -[SearchResultsItemSource setSearchResults:](self->_droppedPinsItemSource, "setSearchResults:", &__NSArray0__struct);
      goto LABEL_13;
    }
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Clearing DroppedPinsItemSource.", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_13:
  if (!self->_droppedPin)
    return;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapSelectionManager](self, "mapSelectionManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "customLabelMarker"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchResult"));

  if (v16 && objc_msgSend(v16, "type") == 3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v17, "clearSelection");

  }
  v18 = sub_1008AF4EC();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = self;
    v21 = (objc_class *)objc_opt_class(v20);
    v22 = NSStringFromClass(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
      v25 = v24;
      if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

        goto LABEL_23;
      }

    }
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_23:

    *(_DWORD *)buf = 138543362;
    v29 = v26;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Setting dropped pin to nil.", buf, 0xCu);

  }
  droppedPin = self->_droppedPin;
  self->_droppedPin = 0;

}

- (void)clearSingleResultPins
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  SearchPinsManager *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  SearchResultsItemSource *searchResultsItemSource;
  void *v26;
  void *v27;
  SearchDotPlacesItemSource *searchDotPlacesItemSource;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  SearchPinsManager *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  const char *v41;
  SearchPinsManager *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  uint8_t buf[4];
  __CFString *v49;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will clear single result pins.", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](self->_singleSearchResultItemSource, "searchResults"));
  v14 = objc_msgSend(v13, "count");

  v15 = sub_1008AF4EC();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v14)
  {
    if (!v17)
      goto LABEL_36;
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        goto LABEL_34;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_34:

    *(_DWORD *)buf = 138543362;
    v49 = v40;
    v41 = "[%{public}@] No single result pins to clear, returning.";
    goto LABEL_35;
  }
  if (!v17)
    goto LABEL_19;
  v18 = self;
  v19 = (objc_class *)objc_opt_class(v18);
  v20 = NSStringFromClass(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
    v23 = v22;
    if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
    {
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

      goto LABEL_18;
    }

  }
  v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_18:

  *(_DWORD *)buf = 138543362;
  v49 = v24;
  _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] _singleSearchResultItemSource is clearing search results.", buf, 0xCu);

LABEL_19:
  -[SearchResultsItemSource setSearchResults:](self->_singleSearchResultItemSource, "setSearchResults:", &__NSArray0__struct);
  searchResultsItemSource = self->_searchResultsItemSource;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsItemSource](self, "searchResultsItemSource"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "searchResults"));
  -[SearchResultsItemSource setSearchResults:](searchResultsItemSource, "setSearchResults:", v27);

  searchDotPlacesItemSource = self->_searchDotPlacesItemSource;
  v29 = objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v29, "searchDotPlaces"));
  -[SearchDotPlacesItemSource setSearchDotPlaces:](searchDotPlacesItemSource, "setSearchDotPlaces:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  LOBYTE(v29) = objc_opt_respondsToSelector(v31, "setNeedsUserActivityUpdate");

  if ((v29 & 1) != 0)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
    objc_msgSend(v32, "setNeedsUserActivityUpdate");

  }
  v33 = sub_1008AF4EC();
  v16 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v34 = self;
    v35 = (objc_class *)objc_opt_class(v34);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

    *(_DWORD *)buf = 138543362;
    v49 = v40;
    v41 = "[%{public}@] Clearing single result pins completed";
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, v41, buf, 0xCu);

  }
LABEL_36:

}

- (void)clearCollectionPins
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  SearchPinsManager *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  char v27;
  void *v28;
  id v29;
  SearchPinsManager *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  const char *v37;
  SearchPinsManager *v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  void *v42;
  void *v43;
  uint8_t buf[4];
  __CFString *v45;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v45 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will clear collection pins.", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  objc_msgSend(v13, "setSuggestedApplicationState:", 0);

  if (self->_selectedLabelMarker)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    objc_msgSend(v14, "_deselectLabelMarkerAnimated:", 0);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](self->_collectionPinsItemSource, "searchResults"));

  v16 = sub_1008AF4EC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
  if (!v15)
  {
    if (!v18)
      goto LABEL_38;
    v38 = self;
    v39 = (objc_class *)objc_opt_class(v38);
    v40 = NSStringFromClass(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if ((objc_opt_respondsToSelector(v38, "accessibilityIdentifier") & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v38, "performSelector:", "accessibilityIdentifier"));
      v43 = v42;
      if (v42 && !objc_msgSend(v42, "isEqualToString:", v41))
      {
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v41, v38, v43));

        goto LABEL_36;
      }

    }
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v41, v38));
LABEL_36:

    *(_DWORD *)buf = 138543362;
    v45 = v36;
    v37 = "[%{public}@] No collections pins to clear, returning.";
    goto LABEL_37;
  }
  if (!v18)
    goto LABEL_21;
  v19 = self;
  v20 = (objc_class *)objc_opt_class(v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if ((objc_opt_respondsToSelector(v19, "accessibilityIdentifier") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v19, "performSelector:", "accessibilityIdentifier"));
    v24 = v23;
    if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
    {
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v19, v24));

      goto LABEL_20;
    }

  }
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v19));
LABEL_20:

  *(_DWORD *)buf = 138543362;
  v45 = v25;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] CollectionPinsItemSource is clearing search results.", buf, 0xCu);

LABEL_21:
  -[SearchResultsItemSource setSearchResults:](self->_collectionPinsItemSource, "setSearchResults:", &__NSArray0__struct);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  v27 = objc_opt_respondsToSelector(v26, "setNeedsUserActivityUpdate");

  if ((v27 & 1) != 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
    objc_msgSend(v28, "setNeedsUserActivityUpdate");

  }
  v29 = sub_1008AF4EC();
  v17 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v30 = self;
    v31 = (objc_class *)objc_opt_class(v30);
    v32 = NSStringFromClass(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v30, "performSelector:", "accessibilityIdentifier"));
      v35 = v34;
      if (v34 && !objc_msgSend(v34, "isEqualToString:", v33))
      {
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v33, v30, v35));

        goto LABEL_29;
      }

    }
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v33, v30));
LABEL_29:

    *(_DWORD *)buf = 138543362;
    v45 = v36;
    v37 = "[%{public}@] Clearing collection pins completed";
LABEL_37:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v37, buf, 0xCu);

  }
LABEL_38:

}

- (BOOL)_isShowingDirectionsPins
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager startPin](self, "startPin"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager endPin](self, "endPin"));
    v4 = v5 != 0;

  }
  return v4;
}

- (void)setSingleSearchPinFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 completion:(id)a8
{
  -[SearchPinsManager setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:](self, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:", a3, a4, a5, a6, a7, self->_singleSearchResultItemSource, a8);
}

- (void)setCollectionsPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6
{
  -[SearchPinsManager setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:](self, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:", a3, a4, a5, 0, a6, self->_collectionPinsItemSource, 0);
}

- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  -[SearchPinsManager setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:](self, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:historyItem:animated:itemSource:completion:", a3, a4, a5, 0, a6, self->_searchResultsItemSource, a7);
}

- (void)setSearchPinsFromSearchInfo:(id)a3 scrollToResults:(BOOL)a4 displayPlaceCardForResult:(id)a5 historyItem:(id)a6 animated:(BOOL)a7 itemSource:(id)a8 completion:(id)a9
{
  id v13;
  id v14;
  id v15;
  SearchResultsItemSource *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  SearchResultsItemSource *collectionPinsItemSource;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  SearchPinsManager *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  SearchResultsItemSource *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  id v60;
  NSObject *v61;
  SearchPinsManager *v62;
  objc_class *v63;
  NSString *v64;
  void *v65;
  SearchResultsItemSource *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  unsigned __int8 v72;
  void *v73;
  void *v74;
  uint64_t v75;
  _BOOL4 v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[5];
  id v85;
  id v86;
  SearchResultsItemSource *v87;
  id v88;
  _QWORD v89[5];
  id v90;
  id v91;
  SearchResultsItemSource *v92;
  id v93;
  id v94;
  id v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  id v99;

  v76 = a4;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = (SearchResultsItemSource *)a8;
  v17 = a9;
  if (self->_startPin && -[NSArray count](self->_endPins, "count") && self->_searchResultsItemSource == v16)
    -[SearchResultsItemSource setShouldHideSearchResults:](v16, "setShouldHideSearchResults:", 0);
  if (self->_searchResultsItemSource == v16)
    -[SearchPinsManager clearSearchPins](self, "clearSearchPins");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  objc_msgSend(v18, "setSuggestedApplicationState:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  objc_msgSend(v19, "setUserTrackingMode:animated:", 0, 0);

  if (objc_msgSend(v13, "mapDisplayType") == 1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "preferredConfiguration"));

    if (objc_msgSend(v21, "conformsToProtocol:", &OBJC_PROTOCOL___MKMapConfigurationHiking))
      v22 = v21;
    else
      v22 = 0;
    v23 = v22;

    objc_msgSend(v23, "setShowsTopographicFeatures:", 1);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  objc_msgSend(v24, "_selectAnnotation:animated:", 0, 0);

  self->_hasAutoSelectedResult = 1;
  v83 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectedResult"));
  v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapRegion"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
  v81 = v14;
  if (self->_singleSearchResultItemSource == v16)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager allSearchResults](self, "allSearchResults"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v29));

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](self->_collectionPinsItemSource, "searchResults"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "arrayByAddingObjectsFromArray:", v27));
    v25 = v30;
  }
  else
  {
    collectionPinsItemSource = self->_collectionPinsItemSource;
    if (collectionPinsItemSource == v16)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager allSearchResults](self, "allSearchResults"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v31));

      if (!v14)
        goto LABEL_19;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItem"));
      v25 = (void *)v82;
      v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "_displayMapRegion"));
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource searchResults](collectionPinsItemSource, "searchResults"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v27));
    }
  }

LABEL_19:
  v32 = sub_1008AF4EC();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    goto LABEL_26;
  v34 = self;
  v35 = (objc_class *)objc_opt_class(v34);
  v36 = NSStringFromClass(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v78 = v13;
  if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
    v39 = v38;
    if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
    {
      v40 = v16;
      v41 = v17;
      v42 = v15;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

      goto LABEL_25;
    }

  }
  v40 = v16;
  v41 = v17;
  v42 = v15;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_25:

  *(_DWORD *)buf = 138543618;
  v97 = v43;
  v98 = 2048;
  v99 = objc_msgSend(v28, "count");
  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "[%{public}@] Setting search results with determining Region:%lu", buf, 0x16u);

  v15 = v42;
  v17 = v41;
  v16 = v40;
  v13 = v78;
LABEL_26:

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager venuesManager](self, "venuesManager"));
  v94 = 0;
  v95 = 0;
  v93 = v28;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchFieldItem"));
  objc_msgSend(v44, "getMinZoom:maxZoom:resultsForDeterminingRegion:forDisplayingResults:fromSearch:", &v95, &v94, &v93, v28, v45);
  v46 = v95;
  v80 = v94;
  v47 = v93;

  if (!objc_msgSend(v47, "count"))
  {

    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
    v46 = 0;
    v52 = v47;
    v47 = (id)v53;
LABEL_32:
    v48 = (void *)v83;

    if (!v83)
      goto LABEL_35;
LABEL_38:
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapSelectionManager](self, "mapSelectionManager"));
    objc_msgSend(v59, "suspendUpdates");

    v60 = sub_1008AF4EC();
    v61 = objc_claimAutoreleasedReturnValue(v60);
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
LABEL_45:

      v72 = objc_msgSend(v13, "disableAdditionalViewportPadding");
      v89[0] = _NSConcreteStackBlock;
      v89[1] = 3221225472;
      v89[2] = sub_1008B2D2C;
      v89[3] = &unk_1011DA5D8;
      v89[4] = self;
      v90 = v13;
      v91 = v48;
      v92 = v16;
      LOBYTE(v75) = v72;
      v55 = (void *)v82;
      v56 = v80;
      -[SearchPinsManager _animateShowingSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:](self, "_animateShowingSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v47, v91, v15, v82, v46, v80, v75, v89);

      v57 = v90;
      goto LABEL_46;
    }
    v77 = v15;
    v62 = self;
    v63 = (objc_class *)objc_opt_class(v62);
    v64 = NSStringFromClass(v63);
    v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
    if ((objc_opt_respondsToSelector(v62, "accessibilityIdentifier") & 1) != 0)
    {
      v79 = v13;
      v66 = v16;
      v67 = v17;
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v62, "performSelector:", "accessibilityIdentifier"));
      v69 = v68;
      if (v68 && !objc_msgSend(v68, "isEqualToString:", v65))
      {
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v65, v62, v69));

        v17 = v67;
        v16 = v66;
        v13 = v79;
        goto LABEL_44;
      }

      v17 = v67;
      v16 = v66;
      v13 = v79;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v65, v62));
LABEL_44:

    v71 = objc_msgSend(v47, "count");
    *(_DWORD *)buf = 138543618;
    v97 = v70;
    v98 = 2048;
    v99 = v71;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "[%{public}@] Animate showing search results. Count: %lu", buf, 0x16u);

    v15 = v77;
    v48 = (void *)v83;
    goto LABEL_45;
  }
  v48 = (void *)v83;
  if (v83 && (objc_msgSend(v47, "containsObject:", v83) & 1) == 0)
  {

    v58 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
    v46 = 0;
    v47 = (id)v58;
    goto LABEL_38;
  }
  v49 = objc_msgSend(v47, "count");
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
  v51 = objc_msgSend(v50, "count");

  if (v49 < v51)
  {
    v52 = (void *)v82;
    v82 = 0;
    goto LABEL_32;
  }
  v48 = (void *)v83;
  if (v83)
    goto LABEL_38;
LABEL_35:
  if (!v76)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "searchDotPlaces"));
    -[SearchPinsManager dropPinsForSearchResults:searchDotPlaces:selectedSearchResult:animate:itemSource:](self, "dropPinsForSearchResults:searchDotPlaces:selectedSearchResult:animate:itemSource:", v73, v74, v81, 1, v16);

    v55 = (void *)v82;
    v56 = v80;
    goto LABEL_47;
  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapSelectionManager](self, "mapSelectionManager"));
  objc_msgSend(v54, "suspendUpdates");

  LOBYTE(v54) = objc_msgSend(v13, "disableAdditionalViewportPadding");
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472;
  v84[2] = sub_1008B2E0C;
  v84[3] = &unk_1011DA600;
  v84[4] = self;
  v85 = v13;
  v86 = v81;
  v87 = v16;
  v88 = v17;
  LOBYTE(v75) = (_BYTE)v54;
  v55 = (void *)v82;
  v56 = v80;
  -[SearchPinsManager _animateShowingSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:](self, "_animateShowingSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v47, v86, v15, v82, v46, v80, v75, v84);

  v57 = v85;
LABEL_46:

LABEL_47:
}

- (void)_animateShowingSearchResults:(id)a3 selectedSearchResult:(id)a4 historyItem:(id)a5 suggestedMapRegion:(id)a6 minZoom:(id)a7 maxZoom:(id)a8 disableAdditionalViewportPadding:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  SearchPinsManager *v25;
  SearchPinsManager *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  SearchPinsManagerShowSearchResultsAnimation *v33;
  void *v34;
  id v35;
  SearchPinsManagerShowSearchResultsAnimation *v36;
  SearchPinsManagerShowSearchResultsAnimation *showSearchResultsAnimation;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id v44;
  uint8_t buf[4];
  __CFString *v46;
  __int16 v47;
  id v48;

  v16 = a3;
  v17 = a6;
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a5;
  v22 = a4;
  -[SearchPinsManager _clearShowSearchResultsAnimation](self, "_clearShowSearchResultsAnimation");
  v23 = sub_1008AF4EC();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v42 = v17;
    v25 = self;
    v26 = v25;
    v41 = v18;
    if (!v25)
    {
      v32 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v40 = v16;
    v27 = (objc_class *)objc_opt_class(v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "isEqualToString:", v29))
      {
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_8;
      }

    }
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_8:

    v16 = v40;
LABEL_10:

    *(_DWORD *)buf = 138543618;
    v46 = v32;
    v47 = 2048;
    v48 = objc_msgSend(v16, "count");
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}@] Initializing animation for %lu results", buf, 0x16u);

    v18 = v41;
    v17 = v42;
  }

  v33 = [SearchPinsManagerShowSearchResultsAnimation alloc];
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapCameraController](self, "mapCameraController"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1008B3240;
  v43[3] = &unk_1011DA628;
  v35 = v18;
  v43[4] = self;
  v44 = v35;
  LOBYTE(v39) = a9;
  v36 = -[SearchPinsManagerShowSearchResultsAnimation initWithSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:mapCameraController:minZoom:maxZoom:disableAdditionalViewportPadding:completion:](v33, "initWithSearchResults:selectedSearchResult:historyItem:suggestedMapRegion:mapCameraController:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v16, v22, v21, v17, v34, v20, v19, v39, v43);

  showSearchResultsAnimation = self->_showSearchResultsAnimation;
  self->_showSearchResultsAnimation = v36;

  -[SearchPinsManagerShowSearchResultsAnimation start](self->_showSearchResultsAnimation, "start");
  if (GEOConfigGetBOOL(MapsConfig_DebugDrawSearchResultsViewportFrame, off_1014B3298))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsDebugOverlay](self, "searchResultsDebugOverlay"));
    objc_msgSend(v38, "drawDebugMapRegionsWithSearchResults:suggestedMapRegion:", v16, v17);

  }
}

- (void)mapViewDidBecomeFullyDrawn
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  id *p_isa;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  uint8_t buf[4];
  __CFString *v15;
  __int16 v16;
  void *v17;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    p_isa = (id *)&v5->super.isa;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, p_isa, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, p_isa));
LABEL_8:

LABEL_10:
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[2], "debugDescription"));
    *(_DWORD *)buf = 138543618;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Map view is fully drawn, proceeding with dropping pins using animation: %@", buf, 0x16u);

  }
  -[SearchPinsManagerShowSearchResultsAnimation proceedWithDroppingPins:](self->_showSearchResultsAnimation, "proceedWithDroppingPins:", 1);
}

- (void)_clearShowSearchResultsAnimation
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  id *p_isa;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  SearchPinsManagerShowSearchResultsAnimation *showSearchResultsAnimation;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  void *v22;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v5 = self;
  p_isa = (id *)&v5->super.isa;
  if (!v5)
  {
    v12 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v7 = (objc_class *)objc_opt_class(v5);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
    v11 = v10;
    if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, p_isa, v11));

      goto LABEL_8;
    }

  }
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, p_isa));
LABEL_8:

LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa[2], "debugDescription"));
  *(_DWORD *)buf = 138543618;
  v20 = v12;
  v21 = 2112;
  v22 = v13;
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Cancelling search result animation: %@", buf, 0x16u);

LABEL_11:
  -[SearchPinsManagerShowSearchResultsAnimation cancel](self->_showSearchResultsAnimation, "cancel");
  showSearchResultsAnimation = self->_showSearchResultsAnimation;
  self->_showSearchResultsAnimation = 0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsDebugOverlay](self, "searchResultsDebugOverlay"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "polygons"));
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchResultsDebugOverlay](self, "searchResultsDebugOverlay"));
    objc_msgSend(v18, "removeDrawnDebugMapRegions");

  }
}

- (void)_completeShowSearchResultsAnimation
{
  -[SearchPinsManagerShowSearchResultsAnimation proceedWithDroppingPins:](self->_showSearchResultsAnimation, "proceedWithDroppingPins:", 0);
  -[SearchPinsManager _clearShowSearchResultsAnimation](self, "_clearShowSearchResultsAnimation");
}

- (UIEdgeInsets)carRecommendedMapPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  UIEdgeInsetsMakeWithEdges(15, a2, 20.0);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)selectLabelMarkerForSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id WeakRetained;
  void *v14;
  id v15;
  NSObject *v16;
  SearchPinsManager *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource keysForSearchResult:](self->_searchResultsItemSource, "keysForSearchResult:", v6));
  if (!objc_msgSend(v7, "count"))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource keysForSearchResult:](self->_droppedPinsItemSource, "keysForSearchResult:", v6));

    v7 = (void *)v8;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(-[SearchResultsItemSource keysForSearchResult:](self->_singleSearchResultItemSource, "keysForSearchResult:", v6));

    v7 = (void *)v9;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStartEndItemSource itemMatchingLocation:](self->_routeStartEndItemSource, "itemMatchingLocation:", v6));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keys"));

    v7 = (void *)v11;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v15 = sub_1008AF4EC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      goto LABEL_20;
    }
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_16;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_16:

    *(_DWORD *)buf = 138543618;
    v27 = v23;
    v28 = 2112;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[%{public}@] No keys found for search result: %@", buf, 0x16u);

    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "autocompletePerson"));

  WeakRetained = objc_loadWeakRetained((id *)&self->_mapSelectionManager);
  v14 = WeakRetained;
  if (v12)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1008B3AE0;
    v25[3] = &unk_1011DA650;
    v25[4] = self;
    objc_msgSend(WeakRetained, "selectLabelMarkerWithKeys:animated:restoreRegion:completion:", v7, v4, 0, v25);
  }
  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1008B3AEC;
    v24[3] = &unk_1011DA650;
    v24[4] = self;
    objc_msgSend(WeakRetained, "selectLabelMarkerWithKeys:animated:completion:", v7, v4, v24);
  }

LABEL_20:
}

- (void)dropPinsForSearchResults:(id)a3 selectedSearchResult:(id)a4 animate:(BOOL)a5
{
  -[SearchPinsManager dropPinsForSearchResults:searchDotPlaces:selectedSearchResult:animate:itemSource:](self, "dropPinsForSearchResults:searchDotPlaces:selectedSearchResult:animate:itemSource:", a3, 0, a4, a5, self->_searchResultsItemSource);
}

- (void)dropPinsForSearchResults:(id)a3 searchDotPlaces:(id)a4 selectedSearchResult:(id)a5 animate:(BOOL)a6 itemSource:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  SearchPinsManager *v18;
  id *p_isa;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  unsigned int v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  id v32;
  id v33;
  NSObject *v34;
  SearchPinsManager *v35;
  objc_class *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  const __CFString *v48;
  id v49;
  uint8_t buf[4];
  __CFString *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  __CFString *v57;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a4;
  v16 = sub_1008AF4EC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v18 = self;
  p_isa = (id *)&v18->super.isa;
  v47 = v8;
  if (!v18)
  {
    v25 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v20 = (objc_class *)objc_opt_class(v18);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
    v24 = v23;
    if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
    {
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, p_isa, v24));

      goto LABEL_8;
    }

  }
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, p_isa));
LABEL_8:

LABEL_10:
  v26 = v25;
  v27 = objc_msgSend(v12, "count");
  v28 = objc_msgSend(p_isa[11], "shouldHideSearchResults");

  v29 = CFSTR("NO");
  if (v28)
    v29 = CFSTR("YES");
  v30 = v29;
  *(_DWORD *)buf = 138544130;
  v51 = v25;
  v52 = 2048;
  v53 = v27;
  v54 = 2112;
  v55 = v14;
  v56 = 2112;
  v57 = v30;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}@] Setting %lu results for %@. Hiding Results: %@", buf, 0x2Au);

  v8 = v47;
LABEL_13:

  objc_msgSend(v14, "setSearchResults:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager searchDotPlacesItemSource](self, "searchDotPlacesItemSource"));
  v32 = objc_msgSend(v15, "copy");

  objc_msgSend(v31, "setSearchDotPlaces:", v32);
  if (!-[SearchResultsItemSource shouldHideSearchResults](self->_searchResultsItemSource, "shouldHideSearchResults"))
    goto LABEL_22;
  v33 = sub_1008AF4EC();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = self;
    v36 = (objc_class *)objc_opt_class(v35);
    v37 = NSStringFromClass(v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if ((objc_opt_respondsToSelector(v35, "accessibilityIdentifier") & 1) != 0)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v35, "performSelector:", "accessibilityIdentifier"));
      v40 = v39;
      if (v39 && !objc_msgSend(v39, "isEqualToString:", v38))
      {
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v38, v35, v40));

        goto LABEL_20;
      }

    }
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v38, v35));
LABEL_20:

    *(_DWORD *)buf = 138543362;
    v51 = v41;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "[%{public}@] SearchResultsItemSource is hiding results but we are setting search results. So unhide them", buf, 0xCu);

  }
  -[SearchResultsItemSource setShouldHideSearchResults:](self->_searchResultsItemSource, "setShouldHideSearchResults:", 0);
LABEL_22:
  if (v13)
    -[SearchPinsManager selectLabelMarkerForSearchResult:animated:](self, "selectLabelMarkerForSearchResult:animated:", v13, v8);
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
  v43 = objc_opt_respondsToSelector(v42, "setNeedsUserActivityUpdate");

  if ((v43 & 1) != 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager delegate](self, "delegate"));
    objc_msgSend(v44, "setNeedsUserActivityUpdate");

  }
  if (v13)
  {
    v48 = CFSTR("selectedSearchResult");
    v49 = v13;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1));
  }
  else
  {
    v45 = 0;
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v46, "postNotificationName:object:userInfo:", CFSTR("MapsPinsDroppedForSearchResultsNotification"), self, v45);

}

- (void)dropPinsForSearchResults:(id)a3 animate:(BOOL)a4
{
  -[SearchPinsManager dropPinsForSearchResults:selectedSearchResult:animate:](self, "dropPinsForSearchResults:selectedSearchResult:animate:", a3, 0, a4);
}

- (void)selectAndShowSearchResult:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  SearchPinsManager *v14;
  SearchPinsManager *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  SearchPinsManagerShowSearchResultsAnimation *showSearchResultsAnimation;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;
  uint8_t buf[4];
  __CFString *v31;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = -[SearchPinsManager canSelectPin:](self, "canSelectPin:", v6);
  if (v8 != (id)5)
  {
    if ((v9 & 1) != 0)
      goto LABEL_16;
    v12 = sub_1008AF4EC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_12;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v31 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Asked to show a search result not in the search pins manager!", buf, 0xCu);

LABEL_15:
    goto LABEL_16;
  }
  if ((v9 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapCameraController](self, "mapCameraController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1008B4288;
    v27[3] = &unk_1011B4060;
    v27[4] = self;
    v28 = v6;
    v29 = v4;
    objc_msgSend(v10, "frameMapItem:animated:completion:", v11, 1, v27);

    goto LABEL_20;
  }
LABEL_16:
  if (v6)
  {
    if (self->_showSearchResultsAnimation)
    {
      objc_initWeak((id *)buf, self);
      showSearchResultsAnimation = self->_showSearchResultsAnimation;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1008B42E4;
      v23[3] = &unk_1011DA678;
      objc_copyWeak(&v25, (id *)buf);
      v24 = v6;
      v26 = v4;
      -[SearchPinsManagerShowSearchResultsAnimation addCompletion:](showSearchResultsAnimation, "addCompletion:", v23);

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[SearchPinsManager selectLabelMarkerForSearchResult:animated:](self, "selectLabelMarkerForSearchResult:animated:", v6, v4);
    }
  }
LABEL_20:

}

- (void)mapSelectionManagerDidDeselectSearchResult:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[SearchPinsManager clearSingleResultPins](self, "clearSingleResultPins", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  if (sub_1002A8AA0(v6) == 5)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager allSearchResults](self, "allSearchResults"));
    v5 = objc_msgSend(v4, "count");

    if (v5 == (id)1)
      -[SearchPinsManager clearSearchPins](self, "clearSearchPins");
  }
}

- (void)showLinkedPlacesAndPolygonForPlaceCardItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager placeCardLinkedPlacesItemSource](self, "placeCardLinkedPlacesItemSource"));
  objc_msgSend(v5, "updateForPlaceCardItem:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager placeCardLinkedPlacesItemSource](self, "placeCardLinkedPlacesItemSource"));
  v6 = objc_msgSend(v8, "featureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  objc_msgSend(v7, "_setSelectedFeatureID:", v6);

}

- (void)clearLinkedPlacesAndPolygon
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager placeCardLinkedPlacesItemSource](self, "placeCardLinkedPlacesItemSource"));
  objc_msgSend(v3, "updateForPlaceCardItem:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  objc_msgSend(v4, "_setSelectedFeatureID:", 0);

}

- (POIShape)startPOIShapeIfLoaded
{
  return self->_startPOIShape;
}

- (NSArray)endPOIShapesIfLoaded
{
  NSArray *v3;
  void *v4;
  NSArray *endPOIShapes;

  v3 = -[NSArray count](self->_endPins, "count");
  if (v3)
  {
    v4 = -[NSArray count](self->_endPOIShapes, "count");
    if (v4 == (void *)-[NSArray count](self->_endPins, "count"))
      endPOIShapes = self->_endPOIShapes;
    else
      endPOIShapes = 0;
    v3 = endPOIShapes;
  }
  return v3;
}

- (void)addPOIShapeLoadingObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  SearchPinsManager *v7;
  SearchPinsManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_1008AF4EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding observer: %@", buf, 0x16u);

  }
  -[NSHashTable addObject:](self->_poiShapeLoadingObservers, "addObject:", v4);

}

- (void)removePOIShapeLoadingObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  SearchPinsManager *v7;
  SearchPinsManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_1008AF4EC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v14;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Removing observer: %@", buf, 0x16u);

  }
  -[NSHashTable removeObject:](self->_poiShapeLoadingObservers, "removeObject:", v4);

}

- (void)_setStartPOIShape:(id)a3
{
  POIShape *v5;
  id v6;
  NSObject *v7;
  SearchPinsManager *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  POIShape *v20;

  v5 = (POIShape *)a3;
  if (self->_startPOIShape == v5)
    goto LABEL_13;
  v6 = sub_1008AF4EC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Setting start POI shape: %@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_startPOIShape, a3);
  v15 = objc_claimAutoreleasedReturnValue(-[SearchPinsManager endPOIShapesIfLoaded](self, "endPOIShapesIfLoaded"));
  v16 = (void *)v15;
  if (v5 && v15)
    -[SearchPinsManager _notifyDidLoadStartPOIShape:endPOIShapes:](self, "_notifyDidLoadStartPOIShape:endPOIShapes:", v5, v15);

LABEL_13:
}

- (void)_setEndPOIShapes:(id)a3
{
  id v5;
  NSArray *endPOIShapes;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  SearchPinsManager *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;

  v5 = a3;
  endPOIShapes = self->_endPOIShapes;
  v7 = (unint64_t)v5;
  v8 = endPOIShapes;
  if (!(v7 | (unint64_t)v8))
    goto LABEL_14;
  v9 = v8;
  v10 = objc_msgSend((id)v7, "isEqual:", v8);

  if ((v10 & 1) != 0)
    goto LABEL_14;
  v11 = sub_1008AF4EC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = self;
    v14 = (objc_class *)objc_opt_class(v13);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_9;
      }

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

    *(_DWORD *)buf = 138543618;
    v23 = v19;
    v24 = 2112;
    v25 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] Setting end POI shapes: %@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_endPOIShapes, a3);
  v20 = objc_claimAutoreleasedReturnValue(-[SearchPinsManager startPOIShapeIfLoaded](self, "startPOIShapeIfLoaded"));
  v21 = (void *)v20;
  if (v7 && v20)
    -[SearchPinsManager _notifyDidLoadStartPOIShape:endPOIShapes:](self, "_notifyDidLoadStartPOIShape:endPOIShapes:", v20, v7);

LABEL_14:
}

- (void)_notifyDidLoadStartPOIShape:(id)a3 endPOIShapes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  SearchPinsManager *v12;
  SearchPinsManager *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  SearchPinsManager *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  SearchPinsManager *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  id v38;
  uint64_t v39;
  id v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = sub_1008AF4EC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    goto LABEL_11;
  v12 = self;
  v13 = v12;
  if (!v12)
  {
    v19 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v14 = (objc_class *)objc_opt_class(v12);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
    v18 = v17;
    if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

      goto LABEL_8;
    }

  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_8:

  v8 = v6;
LABEL_10:

  *(_DWORD *)buf = 138543874;
  v48 = v19;
  v49 = 2112;
  v50 = v8;
  v51 = 2112;
  v52 = v9;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}@] Notifying start and end POI shapes have finished loading: %@, %@", buf, 0x20u);

LABEL_11:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_poiShapeLoadingObservers, "allObjects"));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v20;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v21)
    goto LABEL_27;
  v22 = v21;
  v23 = *(_QWORD *)v43;
  v39 = *(_QWORD *)v43;
  do
  {
    v24 = 0;
    v40 = v22;
    do
    {
      if (*(_QWORD *)v43 != v23)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v24);
      v26 = sub_1008AF4EC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = v9;
        v29 = self;
        v30 = (objc_class *)objc_opt_class(v29);
        v31 = NSStringFromClass(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) == 0)
          goto LABEL_21;
        v33 = self;
        v34 = v8;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
        v36 = v35;
        if (v35 && !objc_msgSend(v35, "isEqualToString:", v32))
        {
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v36));

          v8 = v34;
          self = v33;
        }
        else
        {

          v8 = v34;
          self = v33;
LABEL_21:
          v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
        }

        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2112;
        v50 = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] Notifying observer %@", buf, 0x16u);

        v9 = v28;
        v23 = v39;
        v22 = v40;
      }

      objc_msgSend(v25, "poiShapeLoader:didLoadStartPOIShape:endPOIShapes:", self, v8, v9);
      v24 = (char *)v24 + 1;
    }
    while (v22 != v24);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    v22 = v38;
  }
  while (v38);
LABEL_27:

}

- (void)_startLoadingNewStartPOIShape
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  SearchPinsManager *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  SearchPinsManager *v17;
  SearchPinsManager *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint8_t buf[4];
  __CFString *v27;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will start loading POI shape for start pin", buf, 0xCu);

  }
  -[SearchPinsManager _setStartPOIShape:](self, "_setStartPOIShape:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  if (!v13)
  {
    v16 = sub_1008AF4EC();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    v17 = self;
    v18 = v17;
    if (!v17)
    {
      v24 = CFSTR("<nil>");
      goto LABEL_26;
    }
    v19 = (objc_class *)objc_opt_class(v17);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_21;
      }

    }
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_21:

LABEL_26:
    *(_DWORD *)buf = 138543362;
    v27 = v24;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}@] Map view is nil; will not load start POI shape",
      buf,
      0xCu);

    goto LABEL_27;
  }
  v14 = objc_claimAutoreleasedReturnValue(-[SearchPinsManager startPin](self, "startPin"));
  if (-[NSObject isDynamicCurrentLocation](v14, "isDynamicCurrentLocation"))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[POIShapeFactory userLocationPOIShapeWithMapView:](POIShapeFactory, "userLocationPOIShapeWithMapView:", v13));
LABEL_24:
    v25 = (void *)v15;
    -[SearchPinsManager _setStartPOIShape:](self, "_setStartPOIShape:", v15);

    goto LABEL_27;
  }
  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[POIShapeFactory searchResultWaypointPOIShapeWithMapView:searchResult:](POIShapeFactory, "searchResultWaypointPOIShapeWithMapView:searchResult:", v13, v14));
    goto LABEL_24;
  }
LABEL_27:

}

- (void)_startLoadingNewEndPOIShapes
{
  id v3;
  NSObject *v4;
  SearchPinsManager *v5;
  id *p_isa;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  NSArray *endPins;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  SearchPinsManager *v21;
  SearchPinsManager *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  _QWORD v29[4];
  NSObject *v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  id v34;

  v3 = sub_1008AF4EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    p_isa = (id *)&v5->super.isa;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, p_isa, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, p_isa));
LABEL_8:

LABEL_10:
    v13 = objc_msgSend(p_isa[9], "count");
    *(_DWORD *)buf = 138543618;
    v32 = v12;
    v33 = 2048;
    v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] Will start loading POI shape for %lu end pins", buf, 0x16u);

  }
  -[SearchPinsManager _setEndPOIShapes:](self, "_setEndPOIShapes:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v15 = v14;
  if (!v14)
  {
    v20 = sub_1008AF4EC();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    v21 = self;
    v22 = v21;
    if (!v21)
    {
      v28 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v23 = (objc_class *)objc_opt_class(v21);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_20;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_20:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v32 = v28;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Map view is nil; will not load end POI shapes",
      buf,
      0xCu);

    goto LABEL_23;
  }
  endPins = self->_endPins;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1008B5630;
  v29[3] = &unk_1011DA6A0;
  v30 = v14;
  v17 = sub_10039DCD4(endPins, v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[SearchPinsManager _setEndPOIShapes:](self, "_setEndPOIShapes:", v18);

  v19 = v30;
LABEL_23:

}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  if (self->_droppedPin)
    -[SearchPinsManager _updateDroppedPinVisibility](self, "_updateDroppedPinVisibility", a3, a4, a5);
}

- (void)_updateDroppedPinVisibility
{
  _BOOL4 v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  SearchResultsItemSource *droppedPinsItemSource;
  uint64_t v9;
  _BOOL8 v10;
  id v11;

  if (self->_startPin)
    v3 = 1;
  else
    v3 = -[NSArray count](self->_endPins, "count") != 0;
  v4 = -[SearchResultRepr hasFloorOrdinal](self->_droppedPin, "hasFloorOrdinal");
  if (v4)
  {
    v4 = -[SearchPinsManager _canDroppedPinBeVisibleInVenue](self, "_canDroppedPinBeVisibleInVenue");
    if (!v4)
    {
      droppedPinsItemSource = self->_droppedPinsItemSource;
      v9 = 1;
      goto LABEL_11;
    }
  }
  IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v4, v5);
  if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
    || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
        (IsEnabled_Maps420 & 1) != 0)
    || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
  {
    droppedPinsItemSource = self->_droppedPinsItemSource;
    v9 = 0;
LABEL_11:
    -[SearchResultsItemSource setShouldHideSearchResults:](droppedPinsItemSource, "setShouldHideSearchResults:", v9);
    return;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v10 = sub_1002A8AA0(v11) != 5 && v3;
  -[SearchResultsItemSource setShouldHideSearchResults:](self->_droppedPinsItemSource, "setShouldHideSearchResults:", v10);

}

- (BOOL)_canDroppedPinBeVisibleInVenue
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;

  -[SearchResult coordinate](self->_droppedPin, "coordinate");
  v4 = v3;
  -[SearchResult coordinate](self->_droppedPin, "coordinate");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueAtLocation:withMarginForError:", 0, v4, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v11 = objc_msgSend(v10, "displayedFloorOrdinalForBuildingsInVenue:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "venueWithFocus"));
  v14 = objc_msgSend(v13, "venueID");
  v15 = 0;
  if (v14 == objc_msgSend(v9, "venueID"))
    v15 = -[SearchResultRepr floorOrdinal](self->_droppedPin, "floorOrdinal") == v11;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "venueWithFocus"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "venueWithFocus"));
    v20 = objc_msgSend(v19, "venueID");
    v21 = v20 != objc_msgSend(v9, "venueID");

  }
  else
  {
    v21 = 1;
  }

  return v15 || v21;
}

- (SearchResultsDebugOverlay)searchResultsDebugOverlay
{
  SearchResultsDebugOverlay *searchResultsDebugOverlay;
  SearchResultsDebugOverlay *v4;
  void *v5;
  SearchResultsDebugOverlay *v6;
  SearchResultsDebugOverlay *v7;

  searchResultsDebugOverlay = self->_searchResultsDebugOverlay;
  if (!searchResultsDebugOverlay)
  {
    v4 = [SearchResultsDebugOverlay alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchPinsManager mapView](self, "mapView"));
    v6 = -[SearchResultsDebugOverlay initWithMapView:](v4, "initWithMapView:", v5);
    v7 = self->_searchResultsDebugOverlay;
    self->_searchResultsDebugOverlay = v6;

    searchResultsDebugOverlay = self->_searchResultsDebugOverlay;
  }
  return searchResultsDebugOverlay;
}

- (SearchResult)startPin
{
  return self->_startPin;
}

- (NSArray)endPins
{
  return self->_endPins;
}

- (SearchResult)droppedPin
{
  return self->_droppedPin;
}

- (BOOL)useAlternateDirectionsPins
{
  return self->_useAlternateDirectionsPins;
}

- (BOOL)hasAutoSelectedResult
{
  return self->_hasAutoSelectedResult;
}

- (SearchResultsItemSource)searchResultsItemSource
{
  return self->_searchResultsItemSource;
}

- (SearchResultsItemSource)droppedPinsItemSource
{
  return self->_droppedPinsItemSource;
}

- (SearchResultsItemSource)collectionPinsItemSource
{
  return self->_collectionPinsItemSource;
}

- (SearchResultsItemSource)singleSearchResultItemSource
{
  return self->_singleSearchResultItemSource;
}

- (SearchPinsManagerDelegate)delegate
{
  return (SearchPinsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RouteStartEndItemSource)routeStartEndItemSource
{
  return self->_routeStartEndItemSource;
}

- (PlaceCardLinkedPlacesItemSource)placeCardLinkedPlacesItemSource
{
  return self->_placeCardLinkedPlacesItemSource;
}

- (SearchDotPlacesItemSource)searchDotPlacesItemSource
{
  return self->_searchDotPlacesItemSource;
}

- (MapCameraController)mapCameraController
{
  return self->_mapCameraController;
}

- (CustomPOIsController)customPOIsController
{
  return (CustomPOIsController *)objc_loadWeakRetained((id *)&self->_customPOIsController);
}

- (MapSelectionManager)mapSelectionManager
{
  return (MapSelectionManager *)objc_loadWeakRetained((id *)&self->_mapSelectionManager);
}

- (void)setMapSelectionManager:(id)a3
{
  objc_storeWeak((id *)&self->_mapSelectionManager, a3);
}

- (VenuesManager)venuesManager
{
  return (VenuesManager *)objc_loadWeakRetained((id *)&self->_venuesManager);
}

- (void)setVenuesManager:(id)a3
{
  objc_storeWeak((id *)&self->_venuesManager, a3);
}

- (void)setSearchResultsDebugOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsDebugOverlay, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsDebugOverlay, 0);
  objc_destroyWeak((id *)&self->_venuesManager);
  objc_destroyWeak((id *)&self->_mapSelectionManager);
  objc_destroyWeak((id *)&self->_customPOIsController);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_searchDotPlacesItemSource, 0);
  objc_storeStrong((id *)&self->_placeCardLinkedPlacesItemSource, 0);
  objc_storeStrong((id *)&self->_routeStartEndItemSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleSearchResultItemSource, 0);
  objc_storeStrong((id *)&self->_collectionPinsItemSource, 0);
  objc_storeStrong((id *)&self->_droppedPinsItemSource, 0);
  objc_storeStrong((id *)&self->_searchResultsItemSource, 0);
  objc_storeStrong((id *)&self->_droppedPin, 0);
  objc_storeStrong((id *)&self->_endPins, 0);
  objc_storeStrong((id *)&self->_startPin, 0);
  objc_storeStrong((id *)&self->_poiShapeLoadingObservers, 0);
  objc_storeStrong((id *)&self->_endPOIShapes, 0);
  objc_storeStrong((id *)&self->_startPOIShape, 0);
  objc_storeStrong((id *)&self->_selectedLabelMarker, 0);
  objc_storeStrong((id *)&self->_showSearchResultsAnimation, 0);
  objc_storeStrong((id *)&self->_hiddenStartPin, 0);
}

@end
