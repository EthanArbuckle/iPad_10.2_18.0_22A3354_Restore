@implementation CarSearchResultsModeController

- (CarSearchResultsModeController)initWithSearchSession:(id)a3
{
  id v4;
  CarSearchResultsModeController *v5;
  CarSearchResultsModeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = -[CarSearchResultsModeController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CarSearchResultsModeController setSearchSession:](v5, "setSearchSession:", v4);
    -[CarSearchResultsModeController _setup](v6, "_setup");
  }

  return v6;
}

- (CarSearchResultsModeController)initWithSearchInfo:(id)a3
{
  id v4;
  CarSearchResultsModeController *v5;
  CarSearchResultsModeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = -[CarSearchResultsModeController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CarSearchResultsModeController setSearchInfo:](v5, "setSearchInfo:", v4);
    -[CarSearchResultsModeController _setup](v6, "_setup");
  }

  return v6;
}

- (CarSearchResultsModeController)initWithSearchResults:(id)a3
{
  id v4;
  CarSearchResultsModeController *v5;
  CarSearchResultsModeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarSearchResultsModeController;
  v5 = -[CarSearchResultsModeController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CarSearchResultsModeController setSearchResults:](v5, "setSearchResults:", v4);
    -[CarSearchResultsModeController _setup](v6, "_setup");
  }

  return v6;
}

- (CarSearchResultsModeController)initWithCategory:(id)a3
{
  id v5;
  CarSearchResultsModeController *v6;
  CarSearchResultsModeController *v7;
  uint64_t v8;
  NSString *cardTitle;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CarSearchResultsModeController;
  v6 = -[CarSearchResultsModeController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_category, a3);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
    cardTitle = v7->_cardTitle;
    v7->_cardTitle = (NSString *)v8;

    -[CarSearchResultsModeController _setup](v7, "_setup");
  }

  return v7;
}

- (CarSearchResultsModeController)initWithCollection:(id)a3
{
  id v4;
  CarSearchResultsModeController *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *cardTitle;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarSearchResultsModeController;
  v5 = -[CarSearchResultsModeController init](&v10, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "handlerType") == (id)4)
    {
      v6 = objc_opt_class(CuratedCollectionHandler);
      if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
        -[CarSearchResultsModeController _setupForCuratedCollection:](v5, "_setupForCuratedCollection:", v4);
    }
    else
    {
      -[CarSearchResultsModeController _setupForUserCollection:](v5, "_setupForUserCollection:", v4);
    }
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    cardTitle = v5->_cardTitle;
    v5->_cardTitle = (NSString *)v7;

    -[CarSearchResultsModeController _setup](v5, "_setup");
  }

  return v5;
}

- (void)_setupForUserCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  SearchResult *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  objc_msgSend(v3, "setSortType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(MKMapItem);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = v11;
          v14 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v13);

          objc_msgSend(v5, "addObject:", v14);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = objc_msgSend(v5, "copy");
  -[CarSearchResultsModeController setSearchResults:](self, "setSearchResults:", v15);

}

- (void)_setupForCuratedCollection:(id)a3
{
  void *v4;
  CuratedCollectionResolver *v5;
  void *v6;
  CuratedCollectionResolver *v7;
  CuratedCollectionResolver *curatedCollectionResolver;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "curatedCollectionIdentifier"));

  if (v4)
  {
    v5 = [CuratedCollectionResolver alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "curatedCollectionIdentifier"));
    v7 = -[CuratedCollectionResolver initWithCuratedCollectionIdentifier:delegate:](v5, "initWithCuratedCollectionIdentifier:delegate:", v6, self);
    curatedCollectionResolver = self->_curatedCollectionResolver;
    self->_curatedCollectionResolver = v7;

  }
  -[CuratedCollectionResolver resolveCollection](self->_curatedCollectionResolver, "resolveCollection");

}

- (void)_setup
{
  CarSearchResultsCardViewController *v3;
  CarSearchResultsCardViewController *searchResultsCard;
  void *v5;
  void *v6;
  void *v7;
  CLLocation *lastFetchedFromLocation;

  v3 = -[CarSearchResultsCardViewController initWithSearchResults:cellStyle:delegate:]([CarSearchResultsCardViewController alloc], "initWithSearchResults:cellStyle:delegate:", self->_searchResults, -[SearchInfo isChainResults](self->_searchInfo, "isChainResults"), self);
  searchResultsCard = self->_searchResultsCard;
  self->_searchResultsCard = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTraits"));
  -[BrowseManager setTraits:](self->_browseManager, "setTraits:", v7);

  lastFetchedFromLocation = self->_lastFetchedFromLocation;
  self->_lastFetchedFromLocation = 0;

}

- (BrowseManager)browseManager
{
  BrowseManager *browseManager;
  BrowseManager *v4;
  BrowseManager *v5;
  void *v6;
  void *v7;
  void *v8;

  browseManager = self->_browseManager;
  if (!browseManager)
  {
    v4 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", CFSTR("Stark"));
    v5 = self->_browseManager;
    self->_browseManager = v4;

    -[BrowseManager readCategoriesFromDiskIfNeeded](self->_browseManager, "readCategoriesFromDiskIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));

    browseManager = self->_browseManager;
    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BrowseManager cachedCategories](browseManager, "cachedCategories"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
      -[CarSearchResultsModeController setCategory:](self, "setCategory:", v8);

      browseManager = self->_browseManager;
    }
  }
  return browseManager;
}

- (void)setSearchSession:(id)a3
{
  SearchSession *v5;
  SearchSession *searchSession;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *cardTitle;
  NSString *v12;
  NSString *v13;
  void *v14;
  SearchSession *v15;

  v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  if (searchSession != v5)
  {
    v15 = v5;
    -[SearchSession removeObserver:](searchSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_searchSession, a3);
    -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerDisplayName"));
    v9 = v8;
    if (v8)
    {
      v10 = v8;
      cardTitle = self->_cardTitle;
      self->_cardTitle = v10;
    }
    else
    {
      cardTitle = (NSString *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self->_searchSession, "searchFieldItem"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString searchString](cardTitle, "searchString"));
      v13 = self->_cardTitle;
      self->_cardTitle = v12;

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
    -[CarSearchResultsModeController setSearchInfo:](self, "setSearchInfo:", v14);

    v5 = v15;
  }

}

- (void)setSearchResults:(id)a3
{
  NSArray *v5;
  NSArray *searchResults;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqualToArray:", self->_searchResults) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fullSearchResults, a3);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "carShortenedArray"));
    searchResults = self->_searchResults;
    self->_searchResults = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchPinsManager"));
    objc_msgSend(v8, "setSearchPins:selectedPin:animated:", self->_searchResults, 0, 0);

    -[CarSearchResultsCardViewController setSearchResults:](self->_searchResultsCard, "setSearchResults:", self->_searchResults);
  }

}

- (void)setSearchInfo:(id)a3
{
  SearchInfo *v5;
  void *v6;
  SearchInfo *v7;

  v5 = (SearchInfo *)a3;
  if (self->_searchInfo != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_searchInfo, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchInfo results](self->_searchInfo, "results"));
    -[CarSearchResultsModeController setSearchResults:](self, "setSearchResults:", v6);

    v5 = v7;
  }

}

- (void)setCardTitle:(id)a3
{
  NSString *v5;
  void *v6;
  NSString *v7;

  v5 = (NSString *)a3;
  if (self->_cardTitle != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_cardTitle, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v6, "updateCardsForContext:animated:", self, 0);

    v5 = v7;
  }

}

- (BOOL)showsMapView
{
  return 1;
}

- (void)configureFocusContainerGuideController:(id)a3
{
  objc_msgSend(a3, "setActiveEdges:", 0);
}

- (id)desiredCards
{
  const __CFString *v3;

  v3 = CFSTR("primary");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v7 = a3;
  if (!objc_msgSend(a4, "isEqualToString:", CFSTR("primary")))
    goto LABEL_10;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController cardTitle](self, "cardTitle"));
  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController cardTitle](self, "cardTitle"));
    if (objc_msgSend(v4, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController cardTitle](self, "cardTitle"));
      objc_msgSend(v7, "setTitle:", v9);

LABEL_6:
      goto LABEL_7;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CarPlay_Search_Title"), CFSTR("localized string not found"), 0));
  objc_msgSend(v7, "setTitle:", v11);

  if (v8)
    goto LABEL_6;
LABEL_7:

  objc_msgSend(v7, "setContent:", self->_searchResultsCard);
  HIDWORD(v30) = 0;
  *(_DWORD *)((char *)&v30 + 1) = 0;
  v20 = xmmword_100E34B90;
  v21 = xmmword_100E2D550;
  v22 = 3;
  v23 = 1148846080;
  v24 = 2;
  LODWORD(v25) = 1148846080;
  v26 = 0;
  v27 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v28 = _Q0;
  v29 = _Q0;
  LOBYTE(v30) = 1;
  v31 = 8;
  LOBYTE(v32) = 0;
  if (v7)
    objc_msgSend(v7, "setLayout:", &v20);
  objc_msgSend(v7, "setAccessory:", 1, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "overlayController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "overlayContentView"));
  objc_msgSend(v19, "setAccessibilityViewIsModal:", 1);

LABEL_10:
}

- (BOOL)wantsNavigationDisplay
{
  return 0;
}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchResultsItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a4;
  -[CarSearchResultsModeController _fetchCategoryResults](self, "_fetchCategoryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchPinsManager"));
  objc_msgSend(v7, "setSearchPins:selectedPin:animated:", self->_searchResults, 0, 0);

  -[CarSearchResultsModeController _cardDidUpdateVisibleCells](self, "_cardDidUpdateVisibleCells");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  v9 = objc_msgSend(v5, "isAnimated");

  objc_msgSend(v8, "reloadSearchStateAnimated:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v11, "startLocationUpdateWithObserver:", self);

  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[CarSearchResultsModeController _highlightSearchResult:](self, "_highlightSearchResult:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  objc_msgSend(v6, "clearSearchPins");

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v7, "stopLocationUpdateWithObserver:", self);

}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  CarSearchResultsModeController *v10;
  __int16 v11;
  void *v12;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchSession](self, "searchSession"));
    v9 = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Close button tapped to close the top context. Top Context : %@ Search Session: %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchSession](self, "searchSession"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchSession](self, "searchSession"));
    objc_msgSend(v8, "invalidate");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v8, "popFromContext:", self);
  }

}

- (void)_fetchCategoryResults
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  SearchSession *v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchSession](self, "searchSession"));
    v5 = objc_msgSend(v4, "isLoading");

    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (SearchSession *)v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        v9 = "Search Results: Tried to fetch search results for category, but we're already fetching them.";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        v19 = 138412290;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_INFO, "Search Results: Started fetching results for category: %@. Creating new searchSesssion.", (uint8_t *)&v19, 0xCu);

      }
      v8 = -[SearchSession initWithOrigin:]([SearchSession alloc], "initWithOrigin:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chromeViewController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTraits"));

      -[SearchSession setTraits:](v8, "setTraits:", v15);
      -[SearchSession setSource:](v8, "setSource:", 6);
      -[CarSearchResultsModeController setSearchSession:](self, "setSearchSession:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "category"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v17));

      -[SearchSession startSearch:](v8, "startSearch:", v18);
    }
  }
  else
  {
    v10 = sub_10043364C();
    v8 = (SearchSession *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      v9 = "Search Results: Tried to fetch search results for category that is nil.";
      goto LABEL_7;
    }
  }

}

- (void)_highlightSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PersonalizedMapItemKey *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[8];
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  objc_initWeak(&location, v6);

  if (v4)
  {
    if (-[NSArray containsObject:](self->_searchResults, "containsObject:", v4))
    {
      v7 = [PersonalizedMapItemKey alloc];
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v9 = -[PersonalizedMapItemKey initWithMapItem:](v7, "initWithMapItem:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customPOIsController"));

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1003F2F24;
      v13[3] = &unk_1011B5128;
      objc_copyWeak(&v15, &location);
      v14 = v4;
      objc_msgSend(v11, "customFeatureForKey:completion:", v9, v13);

      objc_destroyWeak(&v15);
    }
    else
    {
      v12 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "SearchResults: Tried to highlight focused search pin, but it wasn't in _searchResults.", buf, 2u);
      }
    }
  }
  else
  {
    v9 = objc_loadWeakRetained(&location);
    -[NSObject _deselectLabelMarkerAnimated:](v9, "_deselectLabelMarkerAnimated:", 1);
  }

  objc_destroyWeak(&location);
}

- (void)_cardDidUpdateVisibleCells
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  if (!self->_updatingVisibleResults)
  {
    self->_updatingVisibleResults = 1;
    objc_initWeak(&location, self);
    v2 = dispatch_time(0, 300000000);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1003F3104;
    v3[3] = &unk_1011AD260;
    objc_copyWeak(&v4, &location);
    dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_updateVisibleSearchResults
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *visibleIndexPaths;
  id v7;
  NSObject *v8;
  NSUInteger v9;
  NSArray *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  NSUInteger v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_car_indexPathsForVisibleRows"));
  visibleIndexPaths = self->_visibleIndexPaths;
  self->_visibleIndexPaths = v5;

  if (self->_visibleIndexPaths && !-[NSArray isEqualToArray:](self->_lastFramedIndexPaths, "isEqualToArray:")
    || self->_isFocusChanged)
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = -[NSArray count](self->_visibleIndexPaths, "count");
      *(_DWORD *)buf = 134217984;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updating visibile search pins on map, new count: %ld", buf, 0xCu);
    }

    v10 = self->_visibleIndexPaths;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003F3308;
    v16[3] = &unk_1011B5150;
    v16[4] = self;
    v11 = sub_10039DCD4(v10, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapCameraController"));
    LOBYTE(v15) = 0;
    objc_msgSend(v14, "frameSearchResults:withResultToSelect:historyItem:suggestedMapRegion:minZoom:maxZoom:disableAdditionalViewportPadding:completion:", v12, 0, 0, 0, 0, 0, v15, 0);

    objc_storeStrong((id *)&self->_lastFramedIndexPaths, self->_visibleIndexPaths);
    self->_isFocusChanged = 0;

  }
}

- (void)searchResultsCardDidUpdateVisibleCells:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SearchResults: searchResultsCardDidUpdateVisibleCells", v6, 2u);
  }

  -[CarSearchResultsModeController _cardDidUpdateVisibleCells](self, "_cardDidUpdateVisibleCells");
}

- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v9 = sub_10043364C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v13 = 138412546;
    v14 = v12;
    v15 = 2048;
    v16 = objc_msgSend(v8, "row");
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SearchResults: didFocusSearchResult %@, atIndexPath: %ld", (uint8_t *)&v13, 0x16u);

  }
  -[CarSearchResultsModeController _highlightSearchResult:](self, "_highlightSearchResult:", v7);
  self->_isFocusChanged = 1;
  -[CarSearchResultsModeController _cardDidUpdateVisibleCells](self, "_cardDidUpdateVisibleCells");

}

- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isCarAppSceneHostingNavigation");

  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v16 = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SearchResults: CarDisplayController will detour to mapItem: %@", (uint8_t *)&v16, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    objc_msgSend(v12, "detourToMapItem:", v13);
  }
  else
  {
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
      v16 = 138412290;
      v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SearchResults: CarChromeModeCoordinator will start route planning to mapItem: %@", (uint8_t *)&v16, 0xCu);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
    objc_msgSend(v12, "displayRoutePlanningForDestination:", v13);
  }

}

- (void)searchSessionDidChangeSearchFieldItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerDisplayName"));
  if (v4)
  {
    -[CarSearchResultsModeController setCardTitle:](self, "setCardTitle:", v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self->_searchSession, "searchFieldItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchString"));
    -[CarSearchResultsModeController setCardTitle:](self, "setCardTitle:", v6);

  }
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard", a3));
  objc_msgSend(v3, "reloadSearchStateAnimated:", 0);

}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  void *v4;
  void *v5;
  CLLocation *v6;
  CLLocation *lastFetchedFromLocation;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v6 = (CLLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));
    lastFetchedFromLocation = self->_lastFetchedFromLocation;
    self->_lastFetchedFromLocation = v6;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentResultsSearchInfo"));
  -[CarSearchResultsModeController setSearchInfo:](self, "setSearchInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  objc_msgSend(v9, "reloadSearchStateAnimated:", 1);

}

- (void)searchSessionDidFail:(id)a3
{
  id v4;

  -[CarSearchResultsModeController setSearchInfo:](self, "setSearchInfo:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  objc_msgSend(v4, "reloadSearchStateAnimated:", 1);

}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  SearchSession *v6;
  SearchSession *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  CarSearchResultsModeController *v12;

  v6 = (SearchSession *)a3;
  v7 = v6;
  if (self->_searchSession == v6)
  {
    self->_searchSession = 0;

    if (a4 != 1)
    {
      v8 = sub_10043364C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "CarPlay Search mode will pop the top context: %@", (uint8_t *)&v11, 0xCu);
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v10, "popFromContext:", self);

    }
  }

}

- (void)didResolveCollection:(id)a3 resolverInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "collectionTitle"));
  -[CarSearchResultsModeController setCardTitle:](self, "setCardTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionItems"));
  v9 = sub_10039DCD4(v8, &stru_1011B5190);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  -[CarSearchResultsModeController setSearchResults:](self, "setSearchResults:", v10);
}

- (NSArray)preferredCarFocusEnvironments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)carFocusOrderSequences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 5));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;

  v9 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchSession](self, "searchSession"));
    v8 = objc_msgSend(v7, "isLoading");

    if ((v8 & 1) == 0)
    {
      -[CarSearchResultsModeController _fetchCategoryResults](self, "_fetchCategoryResults");
      objc_storeStrong((id *)&self->_lastFetchedFromLocation, a3);
    }
  }

}

- (BOOL)_contentNeedsRefreshingForUpdatedLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController category](self, "category"));
  if (v5)
  {
    if (self->_lastFetchedFromLocation)
    {
      objc_msgSend(v4, "distanceFromLocation:");
      v7 = v6 > 1000.0;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CarBaseSearchViewController locationManagerUpdatedLocation:](self->_searchResultsCard, "locationManagerUpdatedLocation:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));
  v5 = -[CarSearchResultsModeController _contentNeedsRefreshingForUpdatedLocation:](self, "_contentNeedsRefreshingForUpdatedLocation:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastLocation"));
    -[CarSearchResultsModeController _reloadContentIfNeededForUpdatedLocation:](self, "_reloadContentIfNeededForUpdatedLocation:", v6);

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (int)backButtonUsageActionToMode:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  return 1011;
}

- (UIScrollView)pptTestScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsModeController searchResultsCard](self, "searchResultsCard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pptTestScrollView"));

  return (UIScrollView *)v3;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (SearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)setBrowseManager:(id)a3
{
  objc_storeStrong((id *)&self->_browseManager, a3);
}

- (NSString)cardTitle
{
  return self->_cardTitle;
}

- (CarSearchResultsCardViewController)searchResultsCard
{
  return self->_searchResultsCard;
}

- (void)setSearchResultsCard:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultsCard, 0);
  objc_storeStrong((id *)&self->_cardTitle, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_curatedCollectionResolver, 0);
  objc_storeStrong((id *)&self->_lastFramedIndexPaths, 0);
  objc_storeStrong((id *)&self->_visibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);
  objc_storeStrong((id *)&self->_fullSearchResults, 0);
}

@end
