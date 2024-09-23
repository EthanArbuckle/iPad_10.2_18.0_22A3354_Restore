@implementation SearchSessionManager

- (SearchSessionManager)init
{
  SearchSessionManager *v2;
  GEOObserverHashTable *v3;
  GEOObserverHashTable *observers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SearchSessionManager;
  v2 = -[SearchSessionManager init](&v7, "init");
  if (v2)
  {
    v3 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___SearchSessionManagerObserver, 0);
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_searchSessionWillStart:", CFSTR("SearchSessionWillStart"), 0);

  }
  return v2;
}

- (SearchSession)currentSearchSession
{
  return self->_searchSession;
}

- (void)_searchSessionWillStart:(id)a3
{
  SearchSession *v4;
  SearchSession *v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  SearchSession *obj;

  v4 = (SearchSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = v4;
  if (v4)
  {
    if (self->_searchSession != v4)
    {
      obj = v4;
      v6 = -[SearchSession origin](v4, "origin");
      v5 = obj;
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResultsSearchInfo](obj, "currentResultsSearchInfo"));
        v8 = objc_msgSend(v7, "isSearchAlongRoute");

        v5 = obj;
        if ((v8 & 1) == 0)
        {
          objc_storeStrong((id *)&self->_searchSession, obj);
          -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
          v5 = obj;
        }
      }
    }
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v4 = a3;
  v5 = sub_100C3F570();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchSessionWillPerformSearch: %@", (uint8_t *)&v15, 0xCu);
  }

  if (-[SearchSessionManager isSearchAlongTheRoute](self, "isSearchAlongTheRoute"))
  {
    -[SearchSessionManager _handleSearchAlongRouteSearchSession:](self, "_handleSearchAlongRouteSearchSession:", v4);
  }
  else
  {
    v7 = objc_msgSend(v4, "isVenueQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
    if ((v7 & 1) == 0 && (objc_msgSend(v4, "restoreSingleResult") & 1) == 0)
    {
      if ((id)-[SearchSessionManager _userInterfaceIdiom](self, "_userInterfaceIdiom") != (id)5)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
        objc_msgSend(v9, "presentLoadingResults");

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
        objc_msgSend(v10, "updateResultsViewContent");

      }
      -[SearchSessionManager _handleUpdateSearchFieldWithSearchFieldItem:](self, "_handleUpdateSearchFieldWithSearchFieldItem:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
      objc_msgSend(v11, "searchSessionManagerSessionWillPerformSearch");

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate"));
    objc_msgSend(v12, "updateFloatingControlsWithSearchSession:", v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueCategoryItem"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    objc_msgSend(v14, "presentVenueCategoryWithVenueCategoryItem:", v13);

  }
}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v4 = a3;
  v5 = sub_100C3F570();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "searchSessionDidChangeSearchFieldItem: %@", (uint8_t *)&v9, 0xCu);
  }

  if (-[SearchSessionManager isSearchAlongTheRoute](self, "isSearchAlongTheRoute"))
  {
    -[SearchSessionManager _handleSearchAlongRouteSearchSession:](self, "_handleSearchAlongRouteSearchSession:", v4);
  }
  else
  {
    if ((objc_msgSend(v4, "isVenueQuery") & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
      -[SearchSessionManager _handleUpdateSearchFieldWithSearchFieldItem:](self, "_handleUpdateSearchFieldWithSearchFieldItem:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate"));
    objc_msgSend(v8, "updateFloatingControlsWithSearchSession:", v4);

  }
}

- (void)refreshedEVChargersReceieved:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
  v5 = objc_msgSend(v4, "searchSessionShouldUpdateEVChargers");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));
    objc_msgSend(v7, "setSearchPins:selectedPin:animated:", v10, 0, 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
    objc_msgSend(v8, "searchSessionManagerReceiveEVChargersUpdate:", v10);

    if (-[SearchSession isVenueQuery](self->_searchSession, "isVenueQuery"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate"));
      objc_msgSend(v9, "receivedVenueEVChargersUpdate:", v10);

    }
  }

}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SearchSessionManager *v21;
  uint8_t buf[4];
  id v23;

  v4 = a3;
  v5 = sub_100C3F570();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received results for searchSession: %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchSessionData"));
  -[SearchSessionManager setPreviousSearchSessionData:](self, "setPreviousSearchSessionData:", v8);

  if (!-[SearchSessionManager isSearchAlongTheRoute](self, "isSearchAlongTheRoute"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientResolvedResult"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "clientResolvedResult"));
      objc_msgSend(v11, "viewController:selectClientResolvedItem:fromSearchInfo:withUserInfo:", 0, v12, v9, 0);
      goto LABEL_12;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionIntent"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
      objc_msgSend(v14, "clearSearch");

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "directionIntent"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "results"));
      objc_msgSend(v11, "viewController:doDirectionIntent:withSearchResults:", 0, v12, v15);
    }
    else
    {
      if (!objc_msgSend(v9, "singlePlaceCollection"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisher"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
        if (!v17)
        {
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_100C3FAAC;
          v18[3] = &unk_1011AD238;
          v19 = v4;
          v20 = v9;
          v21 = self;
          objc_msgSend(v11, "deferPresentingMapPopoversInsideBlock:", v18);

          v16 = v19;
          goto LABEL_14;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "publisher"));
        objc_msgSend(v11, "viewControllerShowPublisher:replaceViewController:", v12, MapsFeature_IsEnabled_SearchAndDiscovery(v12) ^ 1);
LABEL_12:

        if ((id)-[SearchSessionManager _userInterfaceIdiom](self, "_userInterfaceIdiom") != (id)5)
        {
LABEL_15:

          goto LABEL_16;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
        objc_msgSend(v16, "searchSessionManagerSessionDidReceiveUpdate");
LABEL_14:

        goto LABEL_15;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollections"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      objc_msgSend(v11, "viewController:showFullyClientizedCuratedCollection:replaceViewController:", 0, v15, MapsFeature_IsEnabled_SearchAndDiscovery(v15) ^ 1);
    }

    goto LABEL_12;
  }
  -[SearchSessionManager _handleSearchAlongRouteSearchSession:](self, "_handleSearchAlongRouteSearchSession:", v4);
LABEL_16:

}

- (void)searchSessionDidFail:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;

  v4 = a3;
  v5 = sub_100C3F570();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "SearchSession did fail: %@", (uint8_t *)&v17, 0xCu);
  }

  if (-[SearchSessionManager isSearchAlongTheRoute](self, "isSearchAlongTheRoute"))
  {
    -[SearchSessionManager _handleSearchAlongRouteSearchSession:](self, "_handleSearchAlongRouteSearchSession:", v4);
    goto LABEL_11;
  }
  if ((id)-[SearchSessionManager _userInterfaceIdiom](self, "_userInterfaceIdiom") == (id)5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    objc_msgSend(v7, "presentLoadingResults");

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traits"));
    v9 = objc_msgSend(v8, "searchOriginationType");

    if (v9 != 1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
      v11 = objc_msgSend(v10, "isRoutePlanningPresented");

      if ((v11 & 1) != 0)
        goto LABEL_11;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
  objc_msgSend(v12, "searchSessionManagerSessionDidFail");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate"));
  objc_msgSend(v13, "updateFloatingControlsWithSearchSession:", v4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
  v15 = objc_msgSend(v14, "code");

  if (v15 == (id)-8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    objc_msgSend(v16, "clearSearchPins");

  }
LABEL_11:

}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  SearchSession *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  SearchSession *v12;
  __int16 v13;
  unint64_t v14;

  v6 = (SearchSession *)a3;
  if (self->_searchSession == v6)
  {
    v7 = sub_100C3F570();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2048;
      v14 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "searchSessionDidInvalidate: %@. Reason: %lu", (uint8_t *)&v11, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    objc_msgSend(v9, "clearSearch");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager observers](self, "observers"));
    objc_msgSend(v10, "searchSessionManagerSessionDidInvalidate");

  }
}

- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 recentAutocompleteSessionData:(id)a5
{
  -[SearchSessionManager performSearchForSearchItem:withUserInfo:refinementsQuery:recentAutocompleteSessionData:](self, "performSearchForSearchItem:withUserInfo:refinementsQuery:recentAutocompleteSessionData:", a3, a4, 0, a5);
}

- (void)performSearchForSearchItem:(id)a3 withUserInfo:(id)a4 refinementsQuery:(id)a5 recentAutocompleteSessionData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t Integer;
  uint64_t v51;
  uint64_t IsEnabled_HikingiOS;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  void *v60;
  SearchSession *searchSession;
  SearchSession *v62;
  SearchSession *v63;
  SearchSession *v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  id v72;
  unsigned int v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  _BYTE v77[18];

  v10 = a3;
  v11 = a4;
  v72 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
  v14 = objc_msgSend(v13, "newTraits");

  v15 = sub_100C3F570();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v75 = v10;
    v76 = 2112;
    *(_QWORD *)v77 = v11;
    *(_WORD *)&v77[8] = 2112;
    *(_QWORD *)&v77[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Performing search for item: %@. dict: %@. session data: %@", buf, 0x20u);
  }

  v17 = sub_100432B5C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = objc_msgSend(v14, "timeSinceMapViewportChanged");
    *(_DWORD *)buf = 138412802;
    v75 = v10;
    v76 = 1024;
    *(_DWORD *)v77 = v19;
    *(_WORD *)&v77[4] = 2112;
    *(_QWORD *)&v77[6] = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Performing search for item: %@, timeSinceMapViewportChanged: %u,  session data: %@", buf, 0x1Cu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SuggestionSearch")));
  v71 = objc_msgSend(v20, "BOOLValue");

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AutoRedoSearch")));
  v70 = objc_msgSend(v21, "BOOLValue");

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("LowFuelSearch")));
  v67 = objc_msgSend(v22, "BOOLValue");

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ReuseSearchSession")));
  v69 = objc_msgSend(v23, "BOOLValue");

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ResultRefinementsBarSearch")));
  v68 = objc_msgSend(v24, "BOOLValue");

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SearchAlongRoute")));
  v26 = objc_msgSend(v25, "BOOLValue");

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kAddStopFromWaypointEditor")));
  v73 = objc_msgSend(v27, "BOOLValue");

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsServerProvidedWaypoint")));
  v29 = objc_msgSend(v28, "BOOLValue");

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NoHistoryEntry")));
  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NoHistoryEntry")));
    v66 = objc_msgSend(v31, "BOOLValue") ^ 1;

  }
  else
  {
    v66 = 1;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits_Source")));

  if (v32)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits_Source")));
    v34 = (uint64_t)objc_msgSend(v33, "integerValue");

  }
  else
  {
    v34 = 2;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
  objc_msgSend(v35, "isTouristHere");
  objc_msgSend(v14, "setIsTourist:");

  objc_msgSend(v14, "setNavigating:", v26);
  objc_msgSend(v14, "setSource:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "autocompleteSessionData"));
  objc_msgSend(v14, "setRecentAutocompleteSessionData:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits")));
  if (v37)
  {
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("GEOMapServiceTraits")));

    v14 = (id)v38;
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery(objc_msgSend(v14, "setSearchOriginationType:", 0)))
  {
    if ((id)-[SearchSessionManager _userInterfaceIdiom](self, "_userInterfaceIdiom") != (id)5)
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsRoutePlanningPresented")));

      if (v39)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("IsRoutePlanningPresented")));
        v41 = objc_msgSend(v40, "BOOLValue");

        if (v41)
          objc_msgSend(v14, "setSearchOriginationType:", 1);
      }
    }
  }
  if ((_DWORD)v26)
    objc_msgSend(v14, "setSearchOriginationType:", 2);
  if (objc_msgSend(v10, "isSpotlightSearch"))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "punchInDetails"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "spotlightEncodedString"));
    objc_msgSend(v14, "setSpotlightSearchPunchinEncodedString:", v43);

  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SAROtherEVStationRequest")));

  if (v44)
  {
    objc_msgSend(v14, "setSearchOriginationType:", 3);
    v45 = objc_alloc_init((Class)GEOSearchImplicitFilterInfo);
    objc_msgSend(v45, "setSearchImplicitType:", 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("SARImplicitRequestMUID")));
    objc_msgSend(v45, "setSearchAlongRouteMuid:", v46);

    objc_msgSend(v14, "setSearchImplicitFilterInfo:", v45);
  }
  if (v73)
  {
    objc_msgSend(v14, "setSearchOriginationType:", 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager searchOriginationPreviousLatlng](self, "searchOriginationPreviousLatlng"));

    if (!v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kAddStopPreviousLocationLatLng")));
      -[SearchSessionManager setSearchOriginationPreviousLatlng:](self, "setSearchOriginationPreviousLatlng:", v48);

    }
    objc_msgSend(v14, "setSearchOriginationEditingServerWaypoints:", v29);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager searchOriginationPreviousLatlng](self, "searchOriginationPreviousLatlng"));
    objc_msgSend(v14, "setSearchOriginationPreviousLatlng:", v49);

  }
  if (MapsFeature_IsEnabled_ShelbyvilleSearch(objc_msgSend(v14, "addSupportedSearchTierType:", 1)))
  {
    Integer = GEOConfigGetInteger(MapsConfig_SearchRequestAuxiliaryTierNumberOfResults, off_1014B3DD8);
    if (Integer >= 1)
    {
      v51 = Integer;
      objc_msgSend(v14, "addSupportedSearchTierType:", 2);
      objc_msgSend(v14, "setAuxiliaryTierNumResults:", v51);
    }
    objc_msgSend(v14, "addKnownRefinementType:", 1);
    objc_msgSend(v14, "addKnownRefinementType:", 3);
    if (MapsFeature_IsEnabled_SearchAndDiscovery(objc_msgSend(v14, "addKnownRefinementType:", 4)))
      objc_msgSend(v14, "addKnownRefinementType:", 5);
    objc_msgSend(v14, "addSupportedPlaceSummaryFormatType:", 1);
    objc_msgSend(v14, "addSupportedPlaceSummaryFormatType:", 2);
    objc_msgSend(v14, "addSupportedPlaceSummaryFormatType:", 3);
  }
  objc_msgSend(v14, "useOnlineToOfflineFailoverRequestModeIfAllowed");
  IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
  if ((IsEnabled_HikingiOS & 1) != 0)
  {
    v53 = 35;
  }
  else if (MapsFeature_IsEnabled_SearchAndDiscovery(IsEnabled_HikingiOS))
  {
    v53 = 31;
  }
  else
  {
    v53 = 28;
  }
  objc_msgSend(v14, "setPlaceSummaryRevision:", v53);
  v54 = objc_claimAutoreleasedReturnValue(-[SearchSessionManager lastSearchSessionViewport](self, "lastSearchSessionViewport"));
  if (v54)
  {
    v55 = (void *)v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager lastSearchSessionViewport](self, "lastSearchSessionViewport"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "mapRegion"));
    v58 = objc_msgSend(v57, "isValid");

    if (v58)
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager lastSearchSessionViewport](self, "lastSearchSessionViewport"));
      objc_msgSend(v14, "setPreviousSearchViewport:", v59);

    }
  }
  objc_msgSend(v14, "setResultRefinementQuery:", v72);
  if (v71)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestion"));
    -[SearchSession setSource:](self->_searchSession, "setSource:", v34);
    -[SearchSession suggestionSearch:withTraits:](self->_searchSession, "suggestionSearch:withTraits:", v60, v14);

  }
  else if (v70)
  {
    objc_msgSend(v14, "setSearchRequestType:", 2);
    -[SearchSession setSource:](self->_searchSession, "setSource:", v34);
    -[SearchSession redoSearchWithTraits:](self->_searchSession, "redoSearchWithTraits:", v14);
  }
  else
  {
    searchSession = self->_searchSession;
    if (!v69 || !searchSession)
    {
      -[SearchSession removeObserver:](searchSession, "removeObserver:", self);
      -[SearchSession invalidateWithReason:](self->_searchSession, "invalidateWithReason:", 1);
      v62 = self->_searchSession;
      self->_searchSession = 0;

      v63 = -[SearchSession initWithOrigin:options:]([SearchSession alloc], "initWithOrigin:options:", 2 * ((_DWORD)v34 == 1), v67);
      v64 = self->_searchSession;
      self->_searchSession = v63;

      -[SearchSession setTraits:](self->_searchSession, "setTraits:", v14);
      -[SearchSession setSource:](self->_searchSession, "setSource:", v34);
      -[SearchSession setShouldCreateHistoryEntry:](self->_searchSession, "setShouldCreateHistoryEntry:", v66);
      -[SearchSession setIsResultRefinementsBarSearch:](self->_searchSession, "setIsResultRefinementsBarSearch:", v68);
      -[SearchSession setIsAddStopFromWaypointEditor:](self->_searchSession, "setIsAddStopFromWaypointEditor:", v73);
      v65 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager previousSearchSessionData](self, "previousSearchSessionData"));
      -[SearchSession setSearchSessionData:](self->_searchSession, "setSearchSessionData:", v65);

      -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
      searchSession = self->_searchSession;
    }
    -[SearchSession startSearch:](searchSession, "startSearch:", v10);
  }

}

- (void)restoreSearchForItem:(id)a3 withResults:(id)a4 sessionOrigin:(unint64_t)a5
{
  SearchSession *searchSession;
  id v9;
  SearchSession *v10;
  SearchSession *v11;
  id v12;

  searchSession = self->_searchSession;
  v9 = a4;
  v12 = a3;
  -[SearchSession removeObserver:](searchSession, "removeObserver:", self);
  -[SearchSession invalidate](self->_searchSession, "invalidate");
  v10 = -[SearchSession initWithOrigin:]([SearchSession alloc], "initWithOrigin:", a5);
  v11 = self->_searchSession;
  self->_searchSession = v10;

  -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
  -[SearchSession restoreSearchForItem:withResults:](self->_searchSession, "restoreSearchForItem:withResults:", v12, v9);

}

- (void)clearSearchSession
{
  id v3;
  NSObject *v4;
  SearchSession *searchSession;
  SearchSession *v6;
  GEOLatLng *searchOriginationPreviousLatlng;
  int v8;
  SearchSession *v9;

  if (self->_searchSession)
  {
    v3 = sub_100C3F570();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      searchSession = self->_searchSession;
      v8 = 138412290;
      v9 = searchSession;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Cleaning search session: %@", (uint8_t *)&v8, 0xCu);
    }

    -[SearchSession invalidate](self->_searchSession, "invalidate");
    -[SearchSession removeObserver:](self->_searchSession, "removeObserver:", self);
    v6 = self->_searchSession;
    self->_searchSession = 0;

    searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
    self->_searchOriginationPreviousLatlng = 0;

  }
}

- (void)clearLastSearchSessionViewport
{
  -[SearchSessionManager setLastSearchSessionViewport:](self, "setLastSearchSessionViewport:", 0);
}

- (void)_handleUpdateSearchFieldWithSearchFieldItem:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self->_searchSession, "searchFieldItem"));
  objc_msgSend(v5, "updateSearchFieldWithSearchFieldItem:", v4);

}

- (void)_clearSearchField
{
  SearchFieldItem *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchSessionManager delegate](self, "delegate"));
  v2 = objc_alloc_init(SearchFieldItem);
  objc_msgSend(v3, "updateSearchFieldWithSearchFieldItem:", v2);

}

- (BOOL)singleResultMode
{
  return -[SearchSession singleResultMode](self->_searchSession, "singleResultMode");
}

- (int64_t)_userInterfaceIdiom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "appCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  return (int64_t)v6;
}

- (BOOL)isSearchAlongTheRoute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
  if (objc_msgSend(v4, "isNavigationTurnByTurnOrStepping"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "navModeController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navActionCoordinator"));
    if ((objc_msgSend(v8, "isSearchingAlongTheRoute") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager currentSearchSession](self, "currentSearchSession"));
      v9 = objc_msgSend(v10, "origin") == (id)1;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleSearchAlongRouteSearchSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));

  v6 = sub_100C3F570();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
      v21 = 138412546;
      v22 = v4;
      v23 = 2112;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SAR: Received error for searchSession: %@, Error: %@", (uint8_t *)&v21, 0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "navModeController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navActionCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
    objc_msgSend(v13, "setCurrentSearchInfo:error:", 0, v14);
  }
  else
  {
    if (v8)
    {
      v21 = 138412290;
      v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SAR: Opening search session %@.", (uint8_t *)&v21, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchInfo"));
    objc_msgSend(v10, "setSearchAlongRoute:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
    objc_msgSend(v10, "setSearchFieldItem:", v15);

    if (objc_msgSend(v4, "isSpotlightPunchInSearch"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager _spotlightMatchingSearchResult:searchInfo:](self, "_spotlightMatchingSearchResult:searchInfo:", v4, v10));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "results"));
      v18 = objc_msgSend(v17, "indexOfObject:", v16);

      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "results"));
        v20 = objc_msgSend(v19, "count");

        if (v18 < v20)
          objc_msgSend(v10, "setSelectedIndex:", v18);
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navModeController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "navActionCoordinator"));
    objc_msgSend(v14, "setCurrentSearchInfo:", v10);
  }

}

- (void)_presentLoadingResults:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!objc_msgSend(v5, "isSuggestionSearch")
    || (objc_msgSend(v5, "isRedoOrAutoRedoSearchType") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSessionManager coordinator](self, "coordinator"));
    objc_msgSend(v4, "presentLoadingResults");

  }
}

- (id)_spotlightMatchingSearchResult:(id)a3 searchInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v5 = a3;
  v6 = a4;
  v27 = v5;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentResults"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "spotlightMapsIdentifier"));
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
        break;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_identifier"));

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "_identifier"));
        objc_msgSend(v28, "addObject:", v20);

      }
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    v22 = v12;
    v21 = v27;
    objc_msgSend(v27, "setSpotlightMatchingResultFound:", 1);

    if (v22)
      goto LABEL_16;
  }
  else
  {
LABEL_11:

    v21 = v27;
  }
  objc_msgSend(v21, "setSpotlightMatchingResultFound:", 0);
  v23 = sub_100C3F570();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "spotlightMapsIdentifier"));
    *(_DWORD *)buf = 138478083;
    v34 = v25;
    v35 = 2113;
    v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Spotlight punch in search result doesn't have the requested muid in the response. MUID is %{private}@ And the search results identifiers are: %{private}@", buf, 0x16u);

  }
  v22 = 0;
LABEL_16:

  return v22;
}

- (SearchSessionManagerDelegate)delegate
{
  return (SearchSessionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ActionCoordination)coordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (GEOPDViewportInfo)lastSearchSessionViewport
{
  return self->_lastSearchSessionViewport;
}

- (void)setLastSearchSessionViewport:(id)a3
{
  objc_storeStrong((id *)&self->_lastSearchSessionViewport, a3);
}

- (GEOLatLng)searchOriginationPreviousLatlng
{
  return self->_searchOriginationPreviousLatlng;
}

- (void)setSearchOriginationPreviousLatlng:(id)a3
{
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, a3);
}

- (GEOSearchSessionData)previousSearchSessionData
{
  return self->_previousSearchSessionData;
}

- (void)setPreviousSearchSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_previousSearchSessionData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousSearchSessionData, 0);
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_lastSearchSessionViewport, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchSession, 0);
}

@end
