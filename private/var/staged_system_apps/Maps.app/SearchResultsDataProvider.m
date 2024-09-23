@implementation SearchResultsDataProvider

- (SearchResultsDataProvider)init
{
  SearchResultsDataProvider *v2;
  uint64_t v3;
  NSMutableDictionary *venues;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchResultsDataProvider;
  v2 = -[SearchResultsDataProvider init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    venues = v2->_venues;
    v2->_venues = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setActionCoordinator:(id)a3
{
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchSessionManager"));
    objc_msgSend(v6, "removeObserver:", self);

    v7 = objc_storeWeak((id *)&self->_actionCoordinator, obj);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "searchSessionManager"));
    objc_msgSend(v8, "addObserver:", self);

    -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
  }

}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "searchSessionManager"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)SearchResultsDataProvider;
  -[SearchResultsDataProvider dealloc](&v5, "dealloc");
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3)
      -[NSMutableDictionary removeAllObjects](self->_venues, "removeAllObjects");
  }
}

- (BOOL)_isItemVenue:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapItem"));
    v6 = objc_msgSend(v5, "_venueFeatureType") == (id)1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)searchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  SearchResult *v10;

  if (-[SearchResultsDataProvider isInVenueBrowseMode](self, "isInVenueBrowseMode"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_venues, "allValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueCardItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venueMapItem"));

    if (v6)
    {
      v7 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
      v10 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

      return (NSArray *)v8;
    }

  }
  return self->_searchResults;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (BOOL)isInVenueBrowseMode
{
  return !-[NSArray count](self->_searchResults, "count")
      && -[NSMutableDictionary count](self->_venues, "count") == (id)1;
}

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  id v5;
  NSObject *v6;
  SearchSession *searchSession;
  _BOOL4 active;
  int isLoading;
  unsigned int v10;
  SearchInfo *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  unsigned int v19;
  void *v20;
  NSString *v21;
  NSString *errorString;
  NSArray *v23;
  NSArray *v24;
  unsigned int v25;
  NSArray *v26;
  NSArray *searchResults;
  RelatedSearchSuggestion *v28;
  NSString *v29;
  void *v30;
  void *v31;
  double v32;
  RelatedSearchSuggestion *v33;
  RelatedSearchSuggestion *relatedSuggestion;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  GEORelatedSearchSuggestion *v41;
  int v42;
  int v43;
  NSArray *v44;
  NSArray *suggestions;
  id v46;
  NSObject *v47;
  objc_class *v48;
  NSString *v49;
  SearchSession *v50;
  NSString *v51;
  void *v52;
  int v53;
  unsigned int v54;
  __CFString *v55;
  void *v56;
  __CFString *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  NSString *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  __CFString *v68;
  SearchSession *v69;
  __CFString *v70;
  void *v71;
  NSUInteger v72;
  unsigned int v73;
  SearchInfo *v74;
  int v75;
  unsigned int v76;
  int v77;
  int v78;
  int v79;
  const char *aSelector;
  SEL aSelectora;
  GEORelatedSearchSuggestion *v82;
  void *v83;
  void *v84;
  int v85;
  NSArray *v86;
  _BOOL4 v87;
  NSArray *v88;
  uint8_t buf[4];
  SearchSession *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  _BYTE v94[14];
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  NSString *v102;
  uint64_t v103;

  v87 = a3;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    active = self->_active;
    *(_DWORD *)buf = 138412546;
    v90 = searchSession;
    v91 = 1024;
    LODWORD(v92) = active;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will notify observers for Search Session: %@, Active: %d", buf, 0x12u);
  }

  if (self->_active)
  {
    isLoading = self->_isLoading;
    v10 = -[SearchSession isLoading](self->_searchSession, "isLoading");
    if (isLoading != v10)
      self->_isLoading = -[SearchSession isLoading](self->_searchSession, "isLoading");
    v11 = (SearchInfo *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResultsSearchInfo](self->_searchSession, "currentResultsSearchInfo"));
    aSelector = a2;
    if (-[SearchInfo singleResultMode](v11, "singleResultMode"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](v11, "results"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v14 = -[SearchResultsDataProvider _isItemVenue:](self, "_isItemVenue:", v13);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession suggestion](self->_searchSession, "suggestion"));
      v16 = (v15 == 0) & ~v14;
    }
    else
    {
      v16 = 0;
    }
    if (-[SearchSession isSpotlightPunchInSearch](self->_searchSession, "isSpotlightPunchInSearch"))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      if (v18 == (id)5)
        v16 = 0;
    }
    if (v11 == self->_searchInfo)
    {
      v78 = 0;
      v79 = 1;
    }
    else
    {
      v19 = -[SearchInfo isEqual:](v11, "isEqual:");
      v78 = v19 ^ 1;
      if (((v19 | v16) & 1) != 0)
      {
        v79 = v19;
      }
      else
      {
        objc_storeStrong((id *)&self->_searchInfo, v11);
        if (!self->_originalSearchInfo)
          objc_storeStrong((id *)&self->_originalSearchInfo, v11);
        v79 = 0;
      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession lastError](self->_searchSession, "lastError"));
    if (v20)
    {

    }
    else if (-[SearchInfo searchResultType](v11, "searchResultType") != 2)
    {
      v21 = 0;
      goto LABEL_23;
    }
    v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _searchSessionErrorString](self, "_searchSessionErrorString"));
LABEL_23:
    errorString = self->_errorString;
    if (errorString == v21 || (-[NSString isEqual:](errorString, "isEqual:", v21) & 1) != 0)
    {
      v77 = 1;
    }
    else
    {
      objc_storeStrong((id *)&self->_errorString, v21);
      v77 = 0;
    }
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _orderedCurrentSearchResults](self, "_orderedCurrentSearchResults"));
    v86 = v23;
    if (v23 == self->_searchResults)
    {
      v75 = 0;
      v25 = 1;
    }
    else
    {
      v24 = v23;
      v25 = -[NSArray isEqual:](v23, "isEqual:");
      v75 = v25 ^ 1;
      if (((v25 | v16) & 1) == 0)
      {
        v26 = (NSArray *)-[NSArray copy](v24, "copy");
        searchResults = self->_searchResults;
        self->_searchResults = v26;

        -[NSMutableDictionary removeAllObjects](self->_venues, "removeAllObjects");
        v76 = 0;
LABEL_34:
        if (-[SearchInfo hasRelatedSearchSuggestion](v11, "hasRelatedSearchSuggestion"))
        {
          v28 = [RelatedSearchSuggestion alloc];
          v29 = v21;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo resultDisplayHeader](v11, "resultDisplayHeader"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo substitutes](v11, "substitutes"));
          -[SearchInfo dymSuggestionVisibleTime](v11, "dymSuggestionVisibleTime");
          v33 = -[RelatedSearchSuggestion initWithResultDisplayHeader:substitutes:visibleTime:showCloseButton:](v28, "initWithResultDisplayHeader:substitutes:visibleTime:showCloseButton:", v30, v31, -[SearchInfo showDymSuggestionCloseButton](v11, "showDymSuggestionCloseButton"), v32);
          relatedSuggestion = self->_relatedSuggestion;
          self->_relatedSuggestion = v33;

          v21 = v29;
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo suggestions](self->_originalSearchInfo, "suggestions"));
        v36 = objc_claimAutoreleasedReturnValue(-[SearchInfo defaultSuggestion](self->_originalSearchInfo, "defaultSuggestion"));
        if (v36 && objc_msgSend(v35, "count"))
        {
          v103 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v103, 1));
          v88 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v35));

          v38 = objc_claimAutoreleasedReturnValue(-[SearchSession suggestion](self->_searchSession, "suggestion"));
          v39 = (void *)v38;
          if (v38)
            v40 = (void *)v38;
          else
            v40 = (void *)v36;
          v41 = v40;

        }
        else
        {
          v88 = 0;
          v41 = 0;
        }
        v82 = v41;
        v83 = (void *)v36;
        if (v41 == self->_currentSuggestion
          || (-[GEORelatedSearchSuggestion isEqual:](v41, "isEqual:") & 1) != 0)
        {
          v42 = 0;
        }
        else
        {
          objc_storeStrong((id *)&self->_currentSuggestion, v41);
          v42 = 1;
        }
        v85 = v16;
        v84 = v35;
        if (v88 == self->_suggestions || (-[NSArray isEqual:](v88, "isEqual:") & 1) != 0)
        {
          v43 = 0;
        }
        else
        {
          v44 = (NSArray *)-[NSArray copy](v88, "copy");
          suggestions = self->_suggestions;
          self->_suggestions = v44;

          v43 = 1;
        }
        v46 = sub_100432EDC();
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = (objc_class *)objc_opt_class(self);
          v49 = NSStringFromClass(v48);
          v74 = v11;
          v50 = (SearchSession *)objc_claimAutoreleasedReturnValue(v49);
          v51 = NSStringFromSelector(aSelector);
          v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
          v73 = v10;
          v53 = isLoading;
          v54 = -[NSArray count](self->_searchResults, "count");
          v55 = sub_10039E4FC(v78);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v57 = sub_10039E4FC(v75);
          aSelectora = (SEL)v21;
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          v59 = sub_10039E4FC(v42);
          v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
          v61 = sub_10039E4FC(v43);
          v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
          v63 = self->_errorString;
          *(_DWORD *)buf = 138414082;
          v90 = v50;
          v91 = 2112;
          v92 = v52;
          v93 = 1024;
          *(_DWORD *)v94 = v54;
          isLoading = v53;
          v10 = v73;
          *(_WORD *)&v94[4] = 2112;
          *(_QWORD *)&v94[6] = v56;
          v95 = 2112;
          v96 = v58;
          v97 = 2112;
          v98 = v60;
          v99 = 2112;
          v100 = v62;
          v101 = 2112;
          v102 = v63;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@ %@, # searchResults = %d, searchInfoDidChange = %@, searchResultsDidChange = %@, currentSuggetionDidChange = %@, suggestionsDidChange = %@, Error String: %@", buf, 0x4Eu);

          v21 = (NSString *)aSelectora;
          v11 = v74;
        }

        if (isLoading == v10 && ((v85 | v79 & v77 & v76) & 1) != 0)
        {
          -[SearchResultsDataProvider _notifyObservers](self, "_notifyObservers");
          v64 = sub_100432EDC();
          v65 = objc_claimAutoreleasedReturnValue(v64);
          v67 = v83;
          v66 = v84;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v68 = sub_10039E4FC(0);
            v69 = (SearchSession *)objc_claimAutoreleasedReturnValue(v68);
            v70 = sub_10039E4FC(v85);
            v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
            v72 = -[NSArray count](v86, "count");
            *(_DWORD *)buf = 138412802;
            v90 = v69;
            v91 = 2112;
            v92 = v71;
            v93 = 2048;
            *(_QWORD *)v94 = v72;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "loadingDidChange : %@ ignoredSingleResult: %@ Search result count: %ld", buf, 0x20u);

          }
        }
        else
        {
          v67 = v83;
          v66 = v84;
          if (v87)
            -[SearchResultsDataProvider _notifyObservers](self, "_notifyObservers");
        }

        return;
      }
    }
    v76 = v25;
    if (!self->_searchSession && -[SearchResultsDataProvider isInVenueBrowseMode](self, "isInVenueBrowseMode"))
    {
      -[NSMutableDictionary removeAllObjects](self->_venues, "removeAllObjects");
      -[SearchResultsDataProvider _notifyObservers](self, "_notifyObservers");
    }
    goto LABEL_34;
  }
}

- (void)_notifyObservers
{
  id v3;
  NSObject *v4;
  GEOObserverHashTable *observers;
  SearchSession *searchSession;
  _BOOL4 active;
  int v8;
  GEOObserverHashTable *v9;
  __int16 v10;
  SearchSession *v11;
  __int16 v12;
  _BOOL4 v13;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    observers = self->_observers;
    searchSession = self->_searchSession;
    active = self->_active;
    v8 = 138412802;
    v9 = observers;
    v10 = 2112;
    v11 = searchSession;
    v12 = 1024;
    v13 = active;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Notifying observers : %@ for Search Session: %@, Active: %d", (uint8_t *)&v8, 0x1Cu);
  }

  if (self->_active)
    -[GEOObserverHashTable homeDataProvidingObjectDidUpdate:](self->_observers, "homeDataProvidingObjectDidUpdate:", self);
}

- (void)searchSessionManagerReceiveEVChargersUpdate:(id)a3
{
  -[GEOObserverHashTable evChargersDidReceiveUpdate:](self->_observers, "evChargersDidReceiveUpdate:", a3);
}

- (id)_orderedCurrentSearchResults
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SearchListOrderedDataSource *v13;
  void *v14;
  AlphabeticallyOrderedDataSource *v15;
  id v16;
  NSObject *v17;
  SearchSession *v18;
  const char *v19;
  id v20;
  id v21;
  NSObject *v22;
  SearchSession *searchSession;
  id v24;
  SearchSession *v25;
  id v26;
  int v28;
  SearchSession *v29;
  __int16 v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self->_searchSession, "currentResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResultsSearchInfo](self->_searchSession, "currentResultsSearchInfo"));
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v28 = 134218242;
    v29 = (SearchSession *)objc_msgSend(v3, "count");
    v30 = 2112;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[SearchResultsDataProvider] SearchResultsCount:%ld searchInfo: %@", (uint8_t *)&v28, 0x16u);
  }

  if (MapsFeature_IsEnabled_SearchAndDiscovery(v7))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchSectionList"));
    if (!v8
      || (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchSectionList")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSections")),
          v12 = objc_msgSend(v11, "count"),
          v11,
          v10,
          v9,
          !v12))
    {
      v21 = sub_10043222C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        searchSession = self->_searchSession;
        v28 = 138412290;
        v29 = searchSession;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[SearchResultsDataProvider] Search session is missing section list: %@. Using alphabetical ordering.", (uint8_t *)&v28, 0xCu);
      }

      v15 = -[AlphabeticallyOrderedDataSource initWithAlphabeticallySortableObject:]([AlphabeticallyOrderedDataSource alloc], "initWithAlphabeticallySortableObject:", v3);
      v24 = sub_10043222C();
      v17 = objc_claimAutoreleasedReturnValue(v24);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v18 = (SearchSession *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v15, "orderedObjects"));
      v25 = (SearchSession *)-[SearchSession count](v18, "count");
      v28 = 134217984;
      v29 = v25;
      v19 = "[SearchResultsDataProvider] AlphabeticallyOrderedDataSource objects count: %ld";
      goto LABEL_15;
    }
    v13 = [SearchListOrderedDataSource alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchSectionList"));
    v15 = -[SearchListOrderedDataSource initWithObjects:searchSectionList:](v13, "initWithObjects:searchSectionList:", v3, v14);

    v16 = sub_100432EDC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (SearchSession *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v15, "orderedObjects"));
      v28 = 138412290;
      v29 = v18;
      v19 = "[SearchResultsDataProvider] ListOrderedDataSource objects: %@)";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v28, 0xCu);

    }
  }
  else
  {
    if (objc_msgSend(v4, "sortOrder") != (id)1)
    {
      v26 = v3;
      goto LABEL_18;
    }
    v15 = -[AlphabeticallyOrderedDataSource initWithAlphabeticallySortableObject:]([AlphabeticallyOrderedDataSource alloc], "initWithAlphabeticallySortableObject:", v3);
    v20 = sub_100432EDC();
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (SearchSession *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v15, "orderedObjects"));
      v28 = 138412290;
      v29 = v18;
      v19 = "[SearchResultsDataProvider] AlphabeticallyOrderedDataSource objects: %@)";
      goto LABEL_15;
    }
  }
LABEL_16:

  v26 = (id)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v15, "orderedObjects"));
LABEL_18:

  return v26;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___HomeDataProvidingObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (id)_searchSessionErrorString
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = MKCurrentNetworkConnectionFailureDiagnosis(self, a2);
  if ((unint64_t)(v3 - 1) < 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("NoSearchResults_NoNetworkConnection_Mac");
LABEL_6:
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

    return v2;
  }
  if (v3 == 4 || !v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("no_result_key");
    goto LABEL_6;
  }
  return v2;
}

- (id)_identifierForMapItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "_maps_isVenueOrBuilding")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueIdentifier")),
        v6 = objc_msgSend(v5, "_hasVenueID"),
        v5,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_venueInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "venueID")));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_identifierForVenueCardItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "isVenueItem"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "venueID")));
  else
    v4 = 0;

  return v4;
}

- (id)venueProviderForMapItem:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _identifierForMapItem:](self, "_identifierForMapItem:", a3));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v4));
  else
    v5 = 0;

  return v5;
}

- (void)downloadVenueInfoForMapItem:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider venueProviderForMapItem:](self, "venueProviderForMapItem:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v5, "performSearchWithActionCoordination:", v4);

}

- (void)addVenueProviderForMapItem:(id)a3
{
  void *v4;
  SearchResultVenueSubDataProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  VenueSearchCardItem *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _identifierForMapItem:](self, "_identifierForMapItem:"));
  v5 = (SearchResultVenueSubDataProvider *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = -[SearchResultVenueSubDataProvider initWithDelegate:]([SearchResultVenueSubDataProvider alloc], "initWithDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_venues, "setObject:forKeyedSubscript:", v5, v4);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultVenueSubDataProvider venueCardItem](v5, "venueCardItem"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_browseCategories"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    v9 = -[VenueSearchCardItem initWithMapItem:searchCategory:]([VenueSearchCardItem alloc], "initWithMapItem:searchCategory:", v10, v8);
    -[SearchResultVenueSubDataProvider setVenueCardItem:](v5, "setVenueCardItem:", v9);

  }
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  void *v4;
  SearchResultVenueSubDataProvider *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _identifierForVenueCardItem:](self, "_identifierForVenueCardItem:", v7));
    if (v4)
    {
      v5 = (SearchResultVenueSubDataProvider *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v4));
      if (!v5)
      {
        v5 = -[SearchResultVenueSubDataProvider initWithDelegate:]([SearchResultVenueSubDataProvider alloc], "initWithDelegate:", self);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_venues, "setObject:forKeyedSubscript:", v5, v4);
      }
    }
    else
    {
      v5 = 0;
    }
    -[SearchResultVenueSubDataProvider setVenueCardItem:](v5, "setVenueCardItem:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider actionCoordinator](self, "actionCoordinator"));
    -[SearchResultVenueSubDataProvider performSearchWithActionCoordination:](v5, "performSearchWithActionCoordination:", v6);

  }
  else
  {
    objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___VenueAutoCompleteCategoryCardItem);
  }

}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueCategoryItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "venueIdentifier"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "venueID")));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "integerValue"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contentDownloader"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueCategoryItem"));
      v17 = objc_msgSend(v16, "isAutoCompleteCategory");

      if (v17)
        objc_msgSend(v15, "searchDidReceiveAutoCompleteSubcategories:", v9);
      objc_msgSend(v15, "searchDidReceiveResults:", v18);
    }

  }
}

- (void)selectCategory:(id)a3 forVenueWithVenueIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a4, "venueID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v9));
  objc_msgSend(v7, "setCurrentCategory:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v7, "performSearchWithActionCoordination:", v8);

}

- (void)performSearchForSuggestion:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  SearchFieldItem *v8;

  if (a3)
  {
    v4 = a3;
    v8 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSuggestion:](v8, "setSuggestion:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_actionCoordinator);
    objc_msgSend(WeakRetained, "viewController:doSearchItem:withUserInfo:", 0, v8, 0);

    -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBarDisplayToken"));

    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2020, 101, v7);
  }
}

- (void)_updateCurrentSearchSession
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider actionCoordinator](self, "actionCoordinator"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSearchSession"));

  -[SearchResultsDataProvider _setSearchSession:](self, "_setSearchSession:", v4);
}

- (void)_setSearchSession:(id)a3
{
  SearchSession *v4;
  SearchSession *v5;
  SearchSession *v6;
  SearchSession *searchSession;
  SearchInfo *originalSearchInfo;
  RelatedSearchSuggestion *relatedSuggestion;
  id v10;
  NSObject *v11;
  SearchSession *v12;
  SearchInfo *v13;
  int v14;
  SearchSession *v15;
  __int16 v16;
  SearchInfo *v17;

  v4 = (SearchSession *)a3;
  v5 = v4;
  if (self->_searchSession != v4 && (-[SearchSession isEqual:](v4, "isEqual:") & 1) == 0)
  {
    if (-[SearchSession isInvalidated](v5, "isInvalidated"))
      v6 = 0;
    else
      v6 = v5;
    searchSession = self->_searchSession;
    self->_searchSession = v6;

    originalSearchInfo = self->_originalSearchInfo;
    self->_originalSearchInfo = 0;

    relatedSuggestion = self->_relatedSuggestion;
    self->_relatedSuggestion = 0;

  }
  v10 = sub_100432EDC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = self->_searchSession;
    v13 = self->_originalSearchInfo;
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated Search Session : %@ Search Info: %@", (uint8_t *)&v14, 0x16u);
  }

  -[SearchResultsDataProvider _updateAndNotifyObservers:](self, "_updateAndNotifyObservers:", 1);
}

- (void)venueCategoryContentDownloaderDidStart:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  VenueSearchCardItem *v17;
  void *v18;
  VenueSearchCardItem *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v6 = a4;
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class(self);
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v20 = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v20, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider _identifierForMapItem:](self, "_identifierForMapItem:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_venues, "objectForKeyedSubscript:", v13));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "venueCardItem"));

    if (!v16)
    {
      v17 = [VenueSearchCardItem alloc];
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentCategory"));
      v19 = -[VenueSearchCardItem initWithMapItem:searchCategory:](v17, "initWithMapItem:searchCategory:", v6, v18);
      objc_msgSend(v15, "setVenueCardItem:", v19);

    }
  }

}

- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v5 = a4;
  v6 = sub_100432EDC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412546;
    v10 = (id)objc_opt_class(self);
    v11 = 2114;
    v12 = v5;
    v8 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@ failed to download venue info with error: %{public}@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)venueCategoryContentDownloaderDidFail:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)venueCategoryContentDownloaderDidCancel:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_opt_class(self);
    v8 = v7;
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSString *v14;
  void *v15;
  NSMutableDictionary *venues;
  _QWORD v17[4];
  id v18;
  id v19;
  SearchResultsDataProvider *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;

  v8 = a3;
  v9 = a4;
  v10 = sub_100432EDC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_opt_class(self);
    v13 = v12;
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2112;
    v24 = v15;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

  }
  if (v8)
  {
    venues = self->_venues;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100345808;
    v17[3] = &unk_1011B24B0;
    v18 = v8;
    v19 = v9;
    v20 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](venues, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class(self);
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v13, 0x16u);

  }
}

- (void)searchSessionManagerSessionDidFail
{
  id v3;
  NSObject *v4;
  SearchSession *searchSession;
  int v6;
  SearchSession *v7;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    v6 = 138412290;
    v7 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Search Session did fail for session: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
}

- (void)searchSessionManagerSessionDidInvalidate
{
  id v3;
  NSObject *v4;
  SearchSession *searchSession;
  int v6;
  SearchSession *v7;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    v6 = 138412290;
    v7 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Search Session did invalidate for session: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
}

- (void)searchSessionManagerSessionDidReceiveUpdate
{
  id v3;
  NSObject *v4;
  SearchSession *searchSession;
  int v6;
  SearchSession *v7;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    v6 = 138412290;
    v7 = searchSession;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Session did receive update for session: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
}

- (void)searchSessionManagerSessionWillPerformSearch
{
  id v3;
  NSObject *v4;
  SearchSession *searchSession;
  SearchInfo *originalSearchInfo;
  int v7;
  SearchSession *v8;
  __int16 v9;
  SearchInfo *v10;

  v3 = sub_100432EDC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    searchSession = self->_searchSession;
    originalSearchInfo = self->_originalSearchInfo;
    v7 = 138412546;
    v8 = searchSession;
    v9 = 2112;
    v10 = originalSearchInfo;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Session will perform search: %@, original search info: %@", (uint8_t *)&v7, 0x16u);
  }

  -[SearchResultsDataProvider _updateCurrentSearchSession](self, "_updateCurrentSearchSession");
}

- (BOOL)active
{
  return self->_active;
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (GEORelatedSearchSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (RelatedSearchSuggestion)relatedSuggestion
{
  return self->_relatedSuggestion;
}

- (NSString)errorString
{
  return self->_errorString;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorString, 0);
  objc_storeStrong((id *)&self->_relatedSuggestion, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_originalSearchInfo, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_venues, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
