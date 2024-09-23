@implementation SearchManager

- (void)dealloc
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager activeSearchTicket](self, "activeSearchTicket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
    *(_DWORD *)buf = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Dealloc is called. %@: SearchFieldItem: %@: ", buf, 0x16u);

  }
  -[SearchManager cancelSearch](self, "cancelSearch");
  -[SearchManager reset](self, "reset");
  v8.receiver = self;
  v8.super_class = (Class)SearchManager;
  -[SearchManager dealloc](&v8, "dealloc");
}

- (void)reset
{
  id v3;
  NSObject *v4;
  void *v5;
  GEOSearchSessionData *searchSessionData;
  void *v7;
  void *v8;
  GEOMapServiceTraits *activeTraits;
  int v10;
  void *v11;
  __int16 v12;
  GEOSearchSessionData *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;

  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    searchSessionData = self->_searchSessionData;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager activeSearchTicket](self, "activeSearchTicket"));
    v10 = 138413058;
    v11 = v5;
    v12 = 2112;
    v13 = searchSessionData;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Reset is called. Call stack: %@. Search Session: %@, Search field: %@, active ticket: %@", (uint8_t *)&v10, 0x2Au);

  }
  activeTraits = self->_activeTraits;
  self->_activeTraits = 0;

  -[SearchManager cancelSearch](self, "cancelSearch");
  -[SearchManager setSearchFieldItem:](self, "setSearchFieldItem:", 0);
}

- (void)_submitCategorySearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  unsigned int v16;
  id location;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v8, "searchManager:willProcessSearchFieldItem:", self, v9);

  -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", v7);
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1002935F4;
  v19[4] = sub_100293604;
  v20 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10029360C;
  v18[3] = &unk_1011AEF80;
  v18[4] = v19;
  v10 = objc_retainBlock(v18);
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100293694;
  v13[3] = &unk_1011AEFA8;
  objc_copyWeak(&v15, &location);
  v11 = v7;
  v14 = v11;
  v16 = a4;
  objc_msgSend(v11, "submitWithRefinedHandler:networkActivity:", v13, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SearchManagerSearchForStringRequestSentNotification"), 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  _Block_object_dispose(v19, 8);
}

- (void)_submitTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 origin:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  SearchManager *v17;
  id v18;
  unsigned int v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;

  v7 = a3;
  -[SearchManager reset](self, "reset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v8, "searchManager:willProcessSearchFieldItem:", self, v9);

  -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", v7);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1002935F4;
  v21[4] = sub_100293604;
  v22 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100293968;
  v20[3] = &unk_1011AEF80;
  v20[4] = v21;
  v10 = objc_retainBlock(v20);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1002939F0;
  v16 = &unk_1011AEFD0;
  v17 = self;
  v11 = v7;
  v18 = v11;
  v19 = a4;
  objc_msgSend(v11, "submitWithHandler:networkActivity:", &v13, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", v13, v14, v15, v16, v17));
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SearchManagerSearchForStringRequestSentNotification"), 0);

  _Block_object_dispose(v21, 8);
}

- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6
{
  -[SearchManager _submitSearchTicket:defaultSearchResultType:saveToHistory:origin:completionTitle:](self, "_submitSearchTicket:defaultSearchResultType:saveToHistory:origin:completionTitle:", a3, *(_QWORD *)&a4, a5, a6, 0);
}

- (void)_submitSearchTicket:(id)a3 defaultSearchResultType:(unsigned int)a4 saveToHistory:(BOOL)a5 origin:(int64_t)a6 completionTitle:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23[2];
  unsigned int v24;
  BOOL v25;
  id location;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;

  v12 = a3;
  v13 = a7;
  -[SearchManager reset](self, "reset");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v14, "searchManager:willProcessSearchFieldItem:", self, v15);

  -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", v12);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_1002935F4;
  v28[4] = sub_100293604;
  v29 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100293D28;
  v27[3] = &unk_1011AEF80;
  v27[4] = v28;
  v16 = objc_retainBlock(v27);
  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100293DB0;
  v20[3] = &unk_1011AEFF8;
  objc_copyWeak(v23, &location);
  v17 = v12;
  v24 = a4;
  v25 = a5;
  v21 = v17;
  v23[1] = (id)a6;
  v18 = v13;
  v22 = v18;
  objc_msgSend(v17, "submitWithRefinedHandler:networkActivity:", v20, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v19, "postNotificationName:object:", CFSTR("SearchManagerSearchForStringRequestSentNotification"), 0);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
}

- (void)searchForSearchFieldItem:(id)a3 traits:(id)a4 source:(int)a5 isRedoOrAutoRedoSearch:(BOOL)a6 searchSessionData:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  id IsEnabled_OptimizeSearchResultComponents;
  id v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  GEOSearchSessionData *searchSessionData;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  GEOSearchSessionData *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NavigationRouteHistoryInfoProvider *v50;
  void *v51;
  NavigationRouteHistoryInfoProvider *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  _QWORD v76[5];
  id v77;
  id v78;
  int v79;
  BOOL v80;
  _QWORD v81[5];
  id v82;
  id v83;
  int v84;
  BOOL v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  GEOSearchSessionData *v89;
  __int16 v90;
  void *v91;

  v8 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
  v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchResult"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completion"));
  v74 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestion"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentCategory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "historyItem"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "externalURLQuery"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueCategoryItem"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "placeCategoryItem"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "childPlace"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapKitHandle"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressString"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "autocompletePerson"));
  -[SearchManager setSearchFieldItem:](self, "setSearchFieldItem:", v11);
  objc_storeStrong((id *)&self->_searchSessionData, a7);
  IsEnabled_OptimizeSearchResultComponents = (id)MapsFeature_IsEnabled_OptimizeSearchResultComponents();
  if ((_DWORD)IsEnabled_OptimizeSearchResultComponents)
  {
    v16 = sub_10043222C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = v8;
      v19 = v13;
      searchSessionData = self->_searchSessionData;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recentAutocompleteSessionData"));
      *(_DWORD *)buf = 138412802;
      v87 = v11;
      v88 = 2112;
      v89 = searchSessionData;
      v13 = v19;
      v8 = v18;
      v90 = 2112;
      v91 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Performing optimized search request for: %@, searchSessionData: %@, acSessionData: %@", buf, 0x20u);

    }
    IsEnabled_OptimizeSearchResultComponents = objc_msgSend(v12, "setOptimizeSearchRequestComponents:", 1);
  }
  if (MapsFeature_IsEnabled_SearchAndDiscovery(IsEnabled_OptimizeSearchResultComponents))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "collectedAnalytics"));
    objc_msgSend(v12, "setUserActionMetadata:", v23);

    v24 = sub_10043222C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (GEOSearchSessionData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userActionMetadata"));
      *(_DWORD *)buf = 138412546;
      v87 = v11;
      v88 = 2112;
      v89 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Adding search session user action data for %@. \nActions: %@", buf, 0x16u);

    }
  }
  if (!v14)
  {
    v30 = (void *)v74;
    if (v74)
    {
      -[SearchManager _searchForSuggestion:traits:source:](self, "_searchForSuggestion:traits:source:", v74, v12, v8);
      v29 = v66;
      v28 = (void *)v67;
      goto LABEL_17;
    }
    v29 = v66;
    if (v75)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "query"));
      objc_msgSend(v75, "coordinate");
      v33 = v32;
      v35 = v34;
      v36 = objc_msgSend(v75, "muid");
      v37 = objc_msgSend(v75, "resultProviderId");
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "contentProvider"));
      v39 = v36;
      v30 = 0;
      -[SearchManager _searchForExternalURLQuery:coordinate:muid:resultProviderId:contentProvider:traits:source:](self, "_searchForExternalURLQuery:coordinate:muid:resultProviderId:contentProvider:traits:source:", v31, v39, v37, v38, v12, 1, v33, v35);

      v28 = (void *)v67;
      goto LABEL_17;
    }
    if (v73)
    {
      v41 = objc_msgSend(v12, "navigating");
      v42 = +[MKMapService searchMaxResults](MKMapService, "searchMaxResults");
      v28 = (void *)v67;
      if (v41)
      {
        LODWORD(v61) = v42;
        -[SearchManager _submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:](self, "_submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:", v73, 0, 0, v12, 0, v8, v61);
      }
      else
      {
        -[SearchManager _searchForCategory:traits:defaultSearchResultType:source:maxResults:](self, "_searchForCategory:traits:defaultSearchResultType:source:maxResults:", v73, v12, 0, v8, v42);
      }
      goto LABEL_12;
    }
    v28 = (void *)v67;
    if (v72)
    {
      if (!objc_msgSend(v72, "isAutoCompleteCategory"))
      {
        -[SearchManager _searchForVenueCategoryItem:traits:source:](self, "_searchForVenueCategoryItem:traits:source:", v72, v12, v8);
        goto LABEL_17;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "searchCategory"));
      -[SearchManager _searchForCategory:traits:defaultSearchResultType:source:maxResults:](self, "_searchForCategory:traits:defaultSearchResultType:source:maxResults:", v43, v12, 0, v8, +[MKMapService venuesCategorySearchMaxResults](MKMapService, "venuesCategorySearchMaxResults"));
      goto LABEL_24;
    }
    if (v71)
    {
      -[SearchManager _searchForPlaceCategoryItem:traits:source:](self, "_searchForPlaceCategoryItem:traits:source:", v71, v12, v8);
      goto LABEL_17;
    }
    if (v66)
    {
      if (!objc_msgSend(v12, "navigating"))
      {
        -[SearchManager _searchForCompletion:traits:source:](self, "_searchForCompletion:traits:source:", v66, v12, v8);
        goto LABEL_17;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "queryLine"));
      LODWORD(v61) = +[MKMapService searchMaxResults](MKMapService, "searchMaxResults");
      -[SearchManager _submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:](self, "_submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:", 0, v43, v66, v12, 0, v8, v61);
LABEL_24:

      goto LABEL_12;
    }
    if (v70)
    {
      -[SearchManager _searchForChildPlace:traits:source:](self, "_searchForChildPlace:traits:source:", v70, v12, v8);
      goto LABEL_17;
    }
    if (v69)
    {
      -[SearchManager _searchForMapKitHandle:traits:source:](self, "_searchForMapKitHandle:traits:source:", v69, v12, v8);
      goto LABEL_17;
    }
    if (v67)
      goto LABEL_17;
    v62 = v13;
    if (v68)
    {
      -[SearchManager _searchForAddress:traits:source:](self, "_searchForAddress:traits:source:", v68, v12, v8);
LABEL_40:
      v29 = 0;
      v28 = 0;
      v30 = 0;
      goto LABEL_17;
    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coreRecentContact"));

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coreRecentContact"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "address"));

      -[SearchManager _searchForAddressString:label:defaultSearchResultType:traits:source:](self, "_searchForAddressString:label:defaultSearchResultType:traits:source:", v46, 0, 0, v12, v8);
    }
    else if (v65)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "addressStringLabel"));
      -[SearchManager _searchForAddressString:label:defaultSearchResultType:traits:source:](self, "_searchForAddressString:label:defaultSearchResultType:traits:source:", v65, v47, 0, v12, v8);

    }
    else
    {
      if (v64)
      {
        -[SearchManager _searchForAutocompletePerson:traits:source:](self, "_searchForAutocompletePerson:traits:source:", v64, v12, v8);
        goto LABEL_40;
      }
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchString"));
      if (v48
        || (v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchImplicitFilterInfo"))) != 0)
      {

      }
      else
      {
        v29 = 0;
        v28 = 0;
        v30 = 0;
        if ((objc_msgSend(v11, "isSpotlightSearch") & 1) == 0)
          goto LABEL_17;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchString"));
      if (objc_msgSend(v12, "navigating"))
      {
        v50 = [NavigationRouteHistoryInfoProvider alloc];
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        v52 = -[NavigationRouteHistoryInfoProvider initWithNavigationService:](v50, "initWithNavigationService:", v51);

        v53 = objc_alloc_init((Class)GEOAddStopRouteInfo);
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider originalWaypointRouteRepresentation](v52, "originalWaypointRouteRepresentation"));
        objc_msgSend(v53, "setOriginalWaypointRouteRepresentation:", v54);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider legacyRouteRepresentation](v52, "legacyRouteRepresentation"));
        objc_msgSend(v53, "setZilchData:", v55);

        v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider sessionState](v52, "sessionState"));
        objc_msgSend(v53, "setSessionState:", v56);

        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeId](v52, "routeId"));
        objc_msgSend(v53, "setRouteId:", v57);

        v58 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeAttributes](v52, "routeAttributes"));
        objc_msgSend(v53, "setRouteAttributes:", v58);

        objc_msgSend(v12, "setAddStopRouteInfo:", v53);
      }
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "completedQuery"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "retainedSearchMetadata"));
      -[SearchManager _searchForString:traits:defaultSearchResultType:completedQuery:retainedSearchMetadata:source:](self, "_searchForString:traits:defaultSearchResultType:completedQuery:retainedSearchMetadata:source:", v49, v12, 0, v59, v60, v8);

    }
    v13 = v62;
    v14 = 0;
    goto LABEL_11;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "historyEntry"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_100294A08;
  v81[3] = &unk_1011AF020;
  v81[4] = self;
  v82 = v14;
  v83 = v12;
  v84 = v8;
  v85 = a6;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100294A28;
  v76[3] = &unk_1011AF068;
  v76[4] = self;
  v77 = v82;
  v78 = v83;
  v79 = v8;
  v80 = a6;
  objc_msgSend(v27, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v81, &stru_1011AF040, v76, &stru_1011AF088);

LABEL_11:
  v29 = v66;
  v28 = (void *)v67;
LABEL_12:
  v30 = (void *)v74;
LABEL_17:
  v40 = objc_msgSend(v12, "copy");
  -[SearchManager setActiveTraits:](self, "setActiveTraits:", v40);

}

- (void)_searchForAutocompletePerson:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  void *v17;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v18;
  void *v19;
  void *v20;
  void *v21;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v22;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *searchFriendshipCoordinator;
  _TtC4Maps33SearchFindMyFriendshipCoordinator *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  SearchManager *v29;
  id v30;
  id v31;
  int v32;
  uint8_t buf[16];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  -[SearchManager reset](self, "reset");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v10, "searchManager:willProcessSearchFieldItem:", self, v11);

  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v14 = objc_msgSend(v13, "isUsingOfflineMaps");

  if (v14)
  {
    v15 = sub_10043222C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Maps is offline, will only build contacts even though we have handle.", buf, 2u);
    }

    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));

  if (!v17)
  {
LABEL_7:
    -[SearchManager _searchForContactAddressedForAutocompletePerson:searchResults:traits:source:](self, "_searchForContactAddressedForAutocompletePerson:searchResults:traits:source:", v8, v12, v9, v5);
    goto LABEL_8;
  }
  v18 = [_TtC4Maps33SearchFindMyFriendshipCoordinator alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "handle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "handleIdentifier"));
  v22 = -[SearchFindMyFriendshipCoordinator initWith:](v18, "initWith:", v21);
  searchFriendshipCoordinator = self->_searchFriendshipCoordinator;
  self->_searchFriendshipCoordinator = v22;

  v24 = self->_searchFriendshipCoordinator;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "handle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "handle"));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100294C94;
  v27[3] = &unk_1011AF0D8;
  v28 = v8;
  v29 = self;
  v30 = v12;
  v31 = v9;
  v32 = v5;
  -[SearchFindMyFriendshipCoordinator getLatestLocationsFor:completion:](v24, "getLatestLocationsFor:completion:", v26, v27);

LABEL_8:
}

- (void)_searchForContactAddressedForAutocompletePerson:(id)a3 searchResults:(id)a4 traits:(id)a5 source:(int)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  dispatch_group_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  dispatch_queue_global_t global_queue;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  id v36;
  id location;
  _QWORD v38[4];
  NSObject *v39;
  id v40;
  id v41;
  SearchManager *v42;
  id v43;
  id v44;
  __int128 *p_buf;
  _QWORD *v46;
  uint64_t *v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_10043229C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contact"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Rev geo addresses for ContactIdentifier:%@", (uint8_t *)&buf, 0xCu);

  }
  v16 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x3032000000;
  v58 = sub_1002935F4;
  v59 = sub_100293604;
  v60 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contact"));
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_1002935F4;
  v54 = sub_100293604;
  v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_1002935F4;
  v48[4] = sub_100293604;
  v49 = 0;
  if (objc_msgSend(v10, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
    v19 = (void *)v51[5];
    v51[5] = v18;

  }
  v20 = objc_alloc_init((Class)CNPostalAddressFormatter);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "postalAddresses"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10029568C;
  v38[3] = &unk_1011AF128;
  v22 = v16;
  v39 = v22;
  v23 = v20;
  v40 = v23;
  p_buf = &buf;
  v24 = v11;
  v46 = v48;
  v41 = v24;
  v42 = self;
  v25 = v9;
  v43 = v25;
  v47 = &v50;
  v26 = v10;
  v44 = v26;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v38);

  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(25, 0);
  v28 = objc_claimAutoreleasedReturnValue(global_queue);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100295C7C;
  v31[3] = &unk_1011AF1D8;
  objc_copyWeak(&v36, &location);
  v31[4] = self;
  v32 = v26;
  v33 = v25;
  v34 = v48;
  v35 = &v50;
  v29 = v25;
  v30 = v26;
  dispatch_group_notify(v22, v28, v31);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)correctedSearchResultsFrom:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = sub_10039E080(v3, &stru_1011AF218);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    objc_msgSend(v4, "addObject:", v7);

  }
  v8 = sub_10039E080(v3, &stru_1011AF238);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v9);
  v10 = sub_10039E080(v3, &stru_1011AF258);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v11);
  v12 = sub_10039E080(v3, &stru_1011AF278);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v13);
  v14 = sub_10039E080(v3, &stru_1011AF298);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (objc_msgSend(v15, "count"))
    objc_msgSend(v4, "addObjectsFromArray:", v15);

  return v4;
}

- (id)orderedSearchResults:(id)a3 itemsToFrame:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "mutableCopy");
  while (1)
  {
    if (objc_msgSend(v7, "count") == (id)4 || objc_msgSend(v7, "count") == (id)4)
    {
      v13 = v7;
      goto LABEL_26;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager closestSearchResultOfType:fromSearchResults:](self, "closestSearchResultOfType:fromSearchResults:", 1, v8));
    if (v9 && (objc_msgSend(v7, "containsObject:", v9) & 1) == 0)
    {
      objc_msgSend(v8, "removeObject:", v9);
      objc_msgSend(v7, "addObject:", v9);
    }
    if (objc_msgSend(v7, "count") == (id)4)
    {
      v14 = v7;
      goto LABEL_25;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager closestSearchResultOfType:fromSearchResults:](self, "closestSearchResultOfType:fromSearchResults:", 2, v8));
    if (v10 && (objc_msgSend(v7, "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(v8, "removeObject:", v10);
      objc_msgSend(v7, "addObject:", v10);
    }
    if (objc_msgSend(v7, "count") == (id)4)
    {
      v15 = v7;
      goto LABEL_24;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager closestSearchResultOfType:fromSearchResults:](self, "closestSearchResultOfType:fromSearchResults:", 3, v8));
    if (v11 && (objc_msgSend(v7, "containsObject:", v11) & 1) == 0)
    {
      objc_msgSend(v8, "removeObject:", v11);
      objc_msgSend(v7, "addObject:", v11);
    }
    if (objc_msgSend(v7, "count") == (id)4)
      break;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager closestSearchResultOfType:fromSearchResults:](self, "closestSearchResultOfType:fromSearchResults:", 0, v8));
    if (v12)
    {
      if ((objc_msgSend(v7, "containsObject:", v12) & 1) == 0)
      {
        objc_msgSend(v8, "removeObject:", v12);
        objc_msgSend(v7, "addObject:", v12);
      }
    }

  }
  v16 = v7;

LABEL_24:
LABEL_25:

LABEL_26:
  return v7;
}

- (id)closestSearchResultOfType:(unsigned int)a3 fromSearchResults:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD v17[4];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[4];
  unsigned int v25;

  v5 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100296800;
  v24[3] = &unk_1011AF2B8;
  v25 = a3;
  v6 = sub_10039E080(v5, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (objc_msgSend(v7, "count"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = sub_1002935F4;
    v22 = sub_100293604;
    v23 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
    if (objc_msgSend(v7, "count"))
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v10 = (void *)v19[5];
      v19[5] = v9;

      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x2020000000;
      v17[3] = 0x43E0000000000000;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100296830;
      v13[3] = &unk_1011AF2E0;
      v14 = v8;
      v15 = v17;
      v16 = &v18;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

      _Block_object_dispose(v17, 8);
    }
    v11 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_searchForString:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 completedQuery:(id)a6 retainedSearchMetadata:(id)a7 source:(int)a8
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = *(_QWORD *)&a8;
  v12 = a4;
  v13 = a7;
  v14 = a3;
  objc_msgSend(v12, "setSource:", v8);
  v15 = objc_msgSend(v12, "navigating");
  v16 = objc_msgSend(v12, "searchOriginationType");
  if (v16 <= 3)
  {
    v17 = (v16 & 0xF) == 0;
    objc_msgSend(v12, "setSupportDirectionIntentSearch:", v17);
    objc_msgSend(v12, "setSupportUnresolvedDirectionIntent:", v17);
    objc_msgSend(v12, "setSupportStructuredRapAffordance:", v17);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "updatedTraitsForCurrentGarageState:", v12));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "ticketForSearchQuery:completionItem:retainedSearch:traits:searchSessionData:", v14, 0, v13, v21, self->_searchSessionData));

  -[SearchManager _submitSearchTicket:defaultSearchResultType:saveToHistory:origin:](self, "_submitSearchTicket:defaultSearchResultType:saveToHistory:origin:", v20, 0, v15 ^ 1, (((_DWORD)v8 - 6) & 0xFFFFFFF9) == 0);
}

- (void)_searchForSuggestion:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  -[SearchManager reset](self, "reset");
  objc_msgSend(v8, "setSource:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "updatedTraitsForCurrentGarageState:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForSearchQuery:completionItem:relatedSearchSuggestion:maxResults:traits:searchSessionData:", &stru_1011EB268, 0, v9, +[MKMapService searchMaxResults](MKMapService, "searchMaxResults"), v13, self->_searchSessionData));

  -[SearchManager _submitCategorySearchTicket:defaultSearchResultType:origin:](self, "_submitCategorySearchTicket:defaultSearchResultType:origin:", v12, 0, (((_DWORD)v5 - 6) & 0xFFFFFFF9) == 0);
}

- (void)_searchForCategory:(id)a3 traits:(id)a4 defaultSearchResultType:(unsigned int)a5 source:(int)a6 maxResults:(unsigned int)a7
{
  uint64_t v8;
  uint64_t v9;
  id v12;
  id v13;
  unsigned int v14;
  _BOOL8 v15;
  void *v16;
  uint64_t v17;
  id v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v12 = a4;
  v13 = a3;
  -[SearchManager reset](self, "reset");
  objc_msgSend(v12, "setSource:", v8);
  v14 = objc_msgSend(v12, "searchOriginationType");
  if (v14 <= 3)
  {
    v15 = (v14 & 0xF) == 0;
    objc_msgSend(v12, "setSupportDirectionIntentSearch:", v15);
    objc_msgSend(v12, "setSupportUnresolvedDirectionIntent:", v15);
    objc_msgSend(v12, "setSupportStructuredRapAffordance:", v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updatedTraitsForCurrentGarageState:", v12));

  LODWORD(v17) = a7;
  -[SearchManager _submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:](self, "_submitTicketForSearchForCategory:searchQuery:completionItem:traits:defaultSearchResultType:source:maxResults:", v13, 0, 0, v18, v9, v8, v17);

}

- (void)_submitTicketForSearchForCategory:(id)a3 searchQuery:(id)a4 completionItem:(id)a5 traits:(id)a6 defaultSearchResultType:(unsigned int)a7 source:(int)a8 maxResults:(unsigned int)a9
{
  SearchManager *v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  NavigationRouteHistoryInfoProvider *v18;
  void *v19;
  NavigationRouteHistoryInfoProvider *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  id v34;

  v9 = *(SearchManager **)&a8;
  v34 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a3;
  if (objc_msgSend(v15, "navigating"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "updatedTraitsForCurrentGarageState:", v15));

    v18 = [NavigationRouteHistoryInfoProvider alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v20 = -[NavigationRouteHistoryInfoProvider initWithNavigationService:](v18, "initWithNavigationService:", v19);

    objc_msgSend(v33, "setSource:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geoCompletionItem"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider originalWaypointRouteRepresentation](v20, "originalWaypointRouteRepresentation"));
    v23 = objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider legacyRouteRepresentation](v20, "legacyRouteRepresentation"));
    v32 = (int)v9;
    v9 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider sessionState](v20, "sessionState"));
    v31 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeId](v20, "routeId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider routeAttributes](v20, "routeAttributes"));
    LODWORD(v29) = +[MKMapService searchMaxResults](MKMapService, "searchMaxResults");
    v27 = (void *)v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "ticketForSearchAlongRouteWithCategory:searchQuery:completionItem:originalWaypointRouteData:zilchData:sessionState:routeId:routeAttributes:maxResults:traits:searchSessionData:", v16, v34, v21, v22, v23, v24, v25, v26, v29, v33, v9->_searchSessionData));

    v14 = v31;
    self = v9;
    LODWORD(v9) = v32;

    v16 = v30;
    v15 = v33;
  }
  else
  {
    v20 = (NavigationRouteHistoryInfoProvider *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationRouteHistoryInfoProvider ticketForCategory:maxResults:traits:searchSessionData:](v20, "ticketForCategory:maxResults:traits:searchSessionData:", v16, a9, v15, self->_searchSessionData));
  }

  -[SearchManager _submitCategorySearchTicket:defaultSearchResultType:origin:](self, "_submitCategorySearchTicket:defaultSearchResultType:origin:", v28, 0, (((_DWORD)v9 - 6) & 0xFFFFFFF9) == 0);
}

- (void)_searchForVenueCategoryItem:(id)a3 traits:(id)a4 source:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchCategory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueIdentifier"));

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForSearchCategory:venueIdentifier:maxResults:traits:", v11, v12, +[MKMapService venuesCategorySearchMaxResults](MKMapService, "venuesCategorySearchMaxResults"), v8));
  -[SearchManager _submitCategorySearchTicket:defaultSearchResultType:origin:](self, "_submitCategorySearchTicket:defaultSearchResultType:origin:", v13, 0, ((a5 - 6) & 0xFFFFFFF9) == 0);

}

- (void)_searchForPlaceCategoryItem:(id)a3 traits:(id)a4 source:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchCategory"));
  v12 = objc_msgSend(v9, "parentMuid");

  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForPlaceLookupWithSearchCategory:parentMuid:traits:", v11, v12, v8));
  -[SearchManager _submitCategorySearchTicket:defaultSearchResultType:origin:](self, "_submitCategorySearchTicket:defaultSearchResultType:origin:", v13, 0, ((a5 - 6) & 0xFFFFFFF9) == 0);

}

- (void)_searchForCompletion:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "setSource:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchVirtualGarageManager sharedSearchVirtualGarageManager](SearchVirtualGarageManager, "sharedSearchVirtualGarageManager"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "updatedTraitsForCurrentGarageState:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queryLine"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoCompletionItem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ticketForSearchQuery:completionItem:traits:searchSessionData:", v12, v13, v17, self->_searchSessionData));

  v15 = objc_msgSend(v17, "navigating") ^ 1;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));

  -[SearchManager _submitSearchTicket:defaultSearchResultType:saveToHistory:origin:completionTitle:](self, "_submitSearchTicket:defaultSearchResultType:saveToHistory:origin:completionTitle:", v14, 0, v15, (((_DWORD)v5 - 6) & 0xFFFFFFF9) == 0, v16);
}

- (void)_searchForExternalURLQuery:(id)a3 coordinate:(CLLocationCoordinate2D)a4 muid:(unint64_t)a5 resultProviderId:(int)a6 contentProvider:(id)a7 traits:(id)a8 source:(int)a9
{
  uint64_t v9;
  uint64_t v11;
  double longitude;
  double latitude;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v9 = *(_QWORD *)&a9;
  v11 = *(_QWORD *)&a6;
  longitude = a4.longitude;
  latitude = a4.latitude;
  v17 = a8;
  v18 = a7;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v21 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithMUID:resultProviderID:coordinate:", a5, v11, latitude, longitude);
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ticketForURLQuery:identifier:resultProviderId:contentProvider:traits:source:", v19, v21, v11, v18, v17, v9));

  LODWORD(v9) = objc_msgSend(v17, "navigating");
  -[SearchManager _submitSearchTicket:defaultSearchResultType:saveToHistory:origin:](self, "_submitSearchTicket:defaultSearchResultType:saveToHistory:origin:", v22, 0, v9 ^ 1, 0);

}

- (void)_searchForChildPlace:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "setSource:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ticketForChildPlace:traits:", v9, v8));

  -[SearchManager _submitTicket:defaultSearchResultType:origin:](self, "_submitTicket:defaultSearchResultType:origin:", v11, 0, (((_DWORD)v5 - 6) & 0xFFFFFFF9) == 0);
}

- (void)_searchForMapKitHandle:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  _QWORD v9[5];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  objc_msgSend(a4, "setSource:", v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10029740C;
  v9[3] = &unk_1011AF308;
  v9[4] = self;
  +[MKMapItem _mapItemFromHandle:completionHandler:](MKMapItem, "_mapItemFromHandle:completionHandler:", v8, v9);

}

- (void)_forwardGeocodeAddress:(id)a3 addressString:(id)a4 addressBookAddress:(id)a5 label:(id)a6 defaultSearchResultType:(unsigned int)a7 traits:(id)a8 source:(int)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  SEL v42;
  unsigned int v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint64_t *v47;
  SEL v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v16 = a3;
  v35 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  -[SearchManager reset](self, "reset");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v20, "searchManager:willProcessSearchFieldItem:", self, v21);

  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_1002935F4;
  v54 = sub_100293604;
  v55 = 0;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100297968;
  v44[3] = &unk_1011AF330;
  v47 = &v50;
  v48 = a2;
  v44[4] = self;
  v22 = v17;
  v45 = v22;
  v49 = a7;
  v23 = v18;
  v46 = v23;
  v24 = objc_retainBlock(v44);
  objc_msgSend(v19, "setSource:", a9);
  if (!v22 || !objc_msgSend(v22, "isValid") || !objc_msgSend(v22, "isMeCard"))
  {
    if (v16)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ticketForForwardGeocodeAddress:traits:", v16, v19));
    }
    else
    {
      if (!v35 || !objc_msgSend(v35, "length"))
        goto LABEL_9;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ticketForForwardGeocodeString:traits:", v35, v19));
    }
    v31 = (void *)v51[5];
    v51[5] = v30;

LABEL_9:
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x3032000000;
    v37[3] = sub_1002935F4;
    v37[4] = sub_100293604;
    v38 = 0;
    v32 = (void *)v51[5];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100297C8C;
    v36[3] = &unk_1011AEF80;
    v36[4] = v37;
    objc_msgSend(v32, "submitWithRefinedHandler:networkActivity:", v24, v36);
    _Block_object_dispose(v37, 8);

    goto LABEL_10;
  }
  v33 = v16;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "addressValue"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "addressForIdentifier:", v26));

  if (v27)
  {
    v28 = v27;

    v22 = v28;
  }
  else
  {
    v27 = 0;
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100297B50;
  v39[3] = &unk_1011AF358;
  v41 = &v50;
  v42 = a2;
  v39[4] = self;
  v43 = a7;
  v22 = v22;
  v40 = v22;
  objc_msgSend(v22, "forwardGeocodeAddress:", v39);

  v16 = v33;
LABEL_10:

  _Block_object_dispose(&v50, 8);
}

- (void)_searchForAddressString:(id)a3 label:(id)a4 defaultSearchResultType:(unsigned int)a5 traits:(id)a6 source:(int)a7
{
  uint64_t v7;

  LODWORD(v7) = a7;
  -[SearchManager _forwardGeocodeAddress:addressString:addressBookAddress:label:defaultSearchResultType:traits:source:](self, "_forwardGeocodeAddress:addressString:addressBookAddress:label:defaultSearchResultType:traits:source:", 0, a3, 0, a4, *(_QWORD *)&a5, a6, v7);
}

- (void)_searchForAddress:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;

  v19 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contact"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapsData"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v12, "searchManager:willProcessSearchFieldItem:", self, v13);

  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contact"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapsData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compositeName"));

    v17 = (id)objc_claimAutoreleasedReturnValue(+[MKMapItem ticketForMapsDataString:name:](MKMapItem, "ticketForMapsDataString:name:", v15, v16));
    -[SearchManager _submitSearchTicket:defaultSearchResultType:saveToHistory:origin:](self, "_submitSearchTicket:defaultSearchResultType:saveToHistory:origin:", v17, 0, 0, 0);
  }
  else
  {
    v17 = objc_msgSend(objc_alloc((Class)GEOAddress), "initWithAddressBookAddress:", v9);
    LODWORD(v18) = a6;
    -[SearchManager _forwardGeocodeAddress:addressString:addressBookAddress:label:defaultSearchResultType:traits:source:](self, "_forwardGeocodeAddress:addressString:addressBookAddress:label:defaultSearchResultType:traits:source:", v17, 0, v9, 0, 0, v19, v18);

  }
}

- (void)_searchForSearchInfo:(id)a3 completedQuery:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedResult"));
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "results"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));

    if (v13)
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "title"));
    else
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "singleLineAddress"));
    v8 = (void *)v14;

  }
  if ((objc_msgSend(v6, "shouldPreserveResults") & 1) == 0)
  {
    -[SearchManager reset](self, "reset");
    -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
    objc_msgSend(v15, "searchManager:willProcessSearchFieldItem:", self, v16);

  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100298044;
  v18[3] = &unk_1011AC8B0;
  v18[4] = self;
  v19 = v6;
  v17 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

}

- (void)_searchForSearchResults:(id)a3 completedQuery:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", a3));
  -[SearchManager _searchForSearchInfo:completedQuery:](self, "_searchForSearchInfo:completedQuery:", v7, v6);

}

- (void)_searchForHistoryItem:(id)a3 completedQuery:(id)a4 traits:(id)a5 source:(int)a6 isRedoOrAutoRedoSearch:(BOOL)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  SearchManager *v41;
  id v42;
  id v43;
  uint64_t *v44;
  int v45;
  _QWORD v46[4];
  id v47;
  SearchManager *v48;
  uint64_t *v49;
  int v50;
  BOOL v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  void *v56;

  v8 = *(_QWORD *)&a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v15 = objc_opt_class(HistoryEntryRecentsItem);
  v16 = v12;
  if ((objc_opt_isKindOfClass(v16, v15) & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "historyEntry"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10029848C;
  v46[3] = &unk_1011AF380;
  v49 = &v52;
  v50 = v8;
  v51 = a7;
  v47 = v14;
  v48 = self;
  v37 = _NSConcreteStackBlock;
  v38 = 3221225472;
  v39 = sub_100298538;
  v40 = &unk_1011AF3C8;
  v44 = &v52;
  v41 = self;
  v20 = v47;
  v42 = v20;
  v45 = v8;
  v21 = v13;
  v43 = v21;
  objc_msgSend(v19, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v46, &stru_1011AF3A0, &v37, &stru_1011AF3E8);

  v22 = objc_opt_class(SearchResultHistoryItem);
  v23 = v16;
  if ((objc_opt_isKindOfClass(v23, v22) & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    *((_BYTE *)v53 + 24) = 1;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchResult", v37, v38, v39, v40, v41, v42));
    v56 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
    -[SearchManager _searchForSearchResults:completedQuery:](self, "_searchForSearchResults:completedQuery:", v27, v21);

  }
  v28 = objc_opt_class(AddressBookAddress);
  v29 = v23;
  if ((objc_opt_isKindOfClass(v29, v28) & 1) != 0)
    v30 = v29;
  else
    v30 = 0;
  v31 = v30;

  if (v31)
  {
    *((_BYTE *)v53 + 24) = 1;
    -[SearchManager _searchForAddress:completedQuery:traits:source:](self, "_searchForAddress:completedQuery:traits:source:", v31, v21, v20, v8);
  }
  v32 = objc_opt_class(CRRecentContact);
  v33 = v29;
  if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0)
    v34 = v33;
  else
    v34 = 0;
  v35 = v34;

  if (v35)
  {
    *((_BYTE *)v53 + 24) = 1;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "address"));
    -[SearchManager _searchForAddressString:label:defaultSearchResultType:traits:source:](self, "_searchForAddressString:label:defaultSearchResultType:traits:source:", v36, 0, 0, v20, v8);

  }
  _Block_object_dispose(&v52, 8);

}

- (void)_resolveRefinementForSearch:(id)a3 atIndex:(unint64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithSearchInfo:refinedIndex:](SearchInfo, "searchInfoWithSearchInfo:refinedIndex:", a3, a4));
  if (v5)
  {
    -[SearchManager reset](self, "reset");
    -[SearchManager _searchReceivedResults:](self, "_searchReceivedResults:", v5);
  }
  else
  {
    -[SearchManager _searchFailedWithError:](self, "_searchFailedWithError:", 0);
  }

}

- (void)_searchForAddress:(id)a3 traits:(id)a4 source:(int)a5
{
  -[SearchManager _searchForAddress:completedQuery:traits:source:](self, "_searchForAddress:completedQuery:traits:source:", a3, 0, a4, *(_QWORD *)&a5);
}

- (void)_searchForBookmarkSearchResult:(id)a3 origin:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SearchManager *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;

  v5 = a3;
  if (objc_msgSend(v5, "originalType") == 3)
  {
    v21 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    -[SearchManager _searchForSearchResults:completedQuery:](self, "_searchForSearchResults:completedQuery:", v6, 0);
  }
  else
  {
    -[SearchManager reset](self, "reset");
    -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
    objc_msgSend(v7, "searchManager:willProcessSearchFieldItem:", self, v8);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultTraits"));
    objc_msgSend(v9, "setSource:", 17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ticketForMapItemToRefine:traits:", v10, v9));

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = sub_1002935F4;
    v19[4] = sub_100293604;
    v20 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1002989E0;
    v18[3] = &unk_1011AEF80;
    v18[4] = v19;
    v12 = objc_retainBlock(v18);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100298A68;
    v14[3] = &unk_1011AF410;
    v15 = v5;
    v13 = v11;
    v16 = v13;
    v17 = self;
    objc_msgSend(v13, "submitWithRefinedHandler:networkActivity:", v14, v12);

    _Block_object_dispose(v19, 8);
  }

}

- (void)cancelSearch
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager activeSearchTicket](self, "activeSearchTicket"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Search is being cancelled, ticket %@:", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager activeSearchTicket](self, "activeSearchTicket"));
  objc_msgSend(v6, "cancel");

}

- (void)_handleGeocoderError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  objc_msgSend(v5, "searchManager:didReceiveSearchInfo:searchSessionData:error:", self, 0, 0, v4);

}

- (void)_searchFailedWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[SearchManager _searchFailedWithError:ticket:enableStructuredRAPAffordance:](self, "_searchFailedWithError:ticket:enableStructuredRAPAffordance:", v4, 0, -[SearchManager _shouldEnableRAPForNoResultsWithError:](self, "_shouldEnableRAPForNoResultsWithError:", v4));

}

- (void)_searchFailedWithError:(id)a3 ticket:(id)a4 enableStructuredRAPAffordance:(BOOL)a5
{
  uint64_t IsEnabled_RAPSydney;
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  IsEnabled_RAPSydney = a5;
  v19 = a4;
  v8 = a3;
  v9 = -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", 0);
  if ((_DWORD)IsEnabled_RAPSydney)
  {
    if (_MKRAPIsAvailable(v9) && (sub_1003DDB84() & 1) == 0)
      IsEnabled_RAPSydney = MapsFeature_IsEnabled_RAPSydney();
    else
      IsEnabled_RAPSydney = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchAutoRedoThreshold"));
  if (v10)
  {
    v11 = 1;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "searchRedoButtonThreshold"));
    v11 = v12 != 0;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resultRefinementGroup"));
  if (v13)
    v14 = 1;
  else
    v14 = IsEnabled_RAPSydney;
  if ((v14 & 1) != 0 || v11)
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:ticket:](SearchInfo, "searchInfoWithResults:ticket:", &__NSArray0__struct, v19));
  else
    v15 = 0;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resultRefinementGroup"));
  objc_msgSend(v15, "setResultRefinementGroup:", v16);

  objc_msgSend(v15, "setEnableStructuredRAPAffordance:", IsEnabled_RAPSydney);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchSessionData"));
  objc_msgSend(v17, "searchManager:didReceiveSearchInfo:searchSessionData:error:", self, v15, v18, v8);

}

- (void)_searchCanceled
{
  id v3;

  -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  objc_msgSend(v3, "searchManager:didReceiveSearchInfo:searchSessionData:error:", self, 0, 0, 0);

}

- (void)_searchReceivedResults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
    v12 = 138412546;
    v13 = v7;
    v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Search received %@: Search Info: %@", (uint8_t *)&v12, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager searchFieldItem](self, "searchFieldItem"));
  objc_msgSend(v4, "setSearchFieldItem:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager activeTraits](self, "activeTraits"));
  objc_msgSend(v4, "setSearchAlongRoute:", objc_msgSend(v9, "navigating"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchManager delegate](self, "delegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchSessionData"));
  objc_msgSend(v10, "searchManager:didReceiveSearchInfo:searchSessionData:error:", self, v4, v11, 0);

  -[SearchManager setActiveSearchTicket:](self, "setActiveSearchTicket:", 0);
}

- (BOOL)_shouldEnableRAPForNoResultsWithError:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", GEOErrorShouldEnableRAPForNoResultsKey));

  v5 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (SearchManagerDelegate)delegate
{
  return (SearchManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SearchFieldItem)searchFieldItem
{
  return self->_searchFieldItem;
}

- (void)setSearchFieldItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MKMapServiceTicket)activeSearchTicket
{
  return self->_activeSearchTicket;
}

- (void)setActiveSearchTicket:(id)a3
{
  objc_storeStrong((id *)&self->_activeSearchTicket, a3);
}

- (GEOMapServiceTraits)activeTraits
{
  return self->_activeTraits;
}

- (void)setActiveTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTraits, 0);
  objc_storeStrong((id *)&self->_activeSearchTicket, 0);
  objc_storeStrong((id *)&self->_searchFieldItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_searchFriendshipCoordinator, 0);
}

@end
