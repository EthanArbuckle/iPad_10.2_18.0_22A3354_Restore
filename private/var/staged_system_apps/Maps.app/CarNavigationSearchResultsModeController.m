@implementation CarNavigationSearchResultsModeController

- (CarNavigationSearchResultsModeController)initWithSearchSession:(id)a3
{
  id v4;
  CarNavigationSearchResultsModeController *v5;
  CarNavigationSearchResultsModeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarNavigationSearchResultsModeController;
  v5 = -[CarNavigationSearchResultsModeController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CarNavigationSearchResultsModeController commonInit](v5, "commonInit");
    -[CarNavigationSearchResultsModeController setSearchSession:](v6, "setSearchSession:", v4);
  }

  return v6;
}

- (CarNavigationSearchResultsModeController)initWithDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4
{
  id v6;
  CarNavigationSearchResultsModeController *v7;
  CarNavigationSearchResultsModeController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = -[CarNavigationSearchResultsModeController init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[CarNavigationSearchResultsModeController commonInit](v7, "commonInit");
    -[CarNavigationSearchResultsModeController setDestinations:selectedDestinationIndex:](v8, "setDestinations:selectedDestinationIndex:", v6, a4);
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4
{
  id v6;
  CarNavigationSearchResultsModeController *v7;
  CarNavigationSearchResultsModeController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = -[CarNavigationSearchResultsModeController init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[CarNavigationSearchResultsModeController commonInit](v7, "commonInit");
    -[CarNavigationSearchResultsModeController setSearchResults:selectedResultIndex:](v8, "setSearchResults:selectedResultIndex:", v6, a4);
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6;
  CarNavigationSearchResultsModeController *v7;
  CarNavigationSearchResultsModeController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarNavigationSearchResultsModeController;
  v7 = -[CarNavigationSearchResultsModeController init](&v10, "init");
  v8 = v7;
  if (v7)
  {
    -[CarNavigationSearchResultsModeController commonInit](v7, "commonInit");
    -[CarNavigationSearchResultsModeController setMapItems:selectedItemIndex:](v8, "setMapItems:selectedItemIndex:", v6, a4);
  }

  return v8;
}

- (CarNavigationSearchResultsModeController)initWithCategory:(id)a3
{
  id v4;
  CarNavigationSearchResultsModeController *v5;
  CarNavigationSearchResultsModeController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CarNavigationSearchResultsModeController;
  v5 = -[CarNavigationSearchResultsModeController init](&v8, "init");
  v6 = v5;
  if (v5)
  {
    -[CarNavigationSearchResultsModeController commonInit](v5, "commonInit");
    -[CarNavigationSearchResultsModeController setCategory:](v6, "setCategory:", v4);
  }

  return v6;
}

- (void)commonInit
{
  CarSearchResultsCardViewController *v3;
  CarSearchResultsCardViewController *sarCard;

  self->_state = 0;
  v3 = -[CarSearchResultsCardViewController initWithSearchResults:cellStyle:delegate:]([CarSearchResultsCardViewController alloc], "initWithSearchResults:cellStyle:delegate:", self->_searchResults, 2, self);
  sarCard = self->_sarCard;
  self->_sarCard = v3;

}

- (BrowseManager)browseManager
{
  BrowseManager *browseManager;
  BrowseManager *v4;
  BrowseManager *v5;

  browseManager = self->_browseManager;
  if (!browseManager)
  {
    v4 = -[BrowseManager initWithCacheKey:]([BrowseManager alloc], "initWithCacheKey:", CFSTR("Stark-SAR"));
    v5 = self->_browseManager;
    self->_browseManager = v4;

    -[BrowseManager readCategoriesFromDiskIfNeeded](self->_browseManager, "readCategoriesFromDiskIfNeeded");
    browseManager = self->_browseManager;
  }
  return browseManager;
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
    -[CarNavigationSearchResultsModeController setSearchResults:selectedResultIndex:](self, "setSearchResults:selectedResultIndex:", v6, -[SearchInfo selectedIndex](self->_searchInfo, "selectedIndex"));

    v5 = v7;
  }

}

- (void)setSearchSession:(id)a3
{
  SearchSession *v5;
  SearchSession *searchSession;
  void *v7;
  SearchSession *v8;

  v5 = (SearchSession *)a3;
  searchSession = self->_searchSession;
  if (searchSession != v5)
  {
    v8 = v5;
    -[SearchSession removeObserver:](searchSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_searchSession, a3);
    -[SearchSession addObserver:](self->_searchSession, "addObserver:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession currentResults](self->_searchSession, "currentResults"));
    -[CarNavigationSearchResultsModeController setSearchResults:selectedResultIndex:](self, "setSearchResults:selectedResultIndex:", v7, -[SearchSession selectedResultIndex](self->_searchSession, "selectedResultIndex"));

    v5 = v8;
  }

}

- (void)setDestinations:(id)a3 selectedDestinationIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapItem carMapItemFromDestination:](MKMapItem, "carMapItemFromDestination:", v14, (_QWORD)v18));
        v16 = v15;
        if (v15)
        {
          if (v7 == v14)
          {
            v17 = v15;

            v7 = v17;
          }
          objc_msgSend(v8, "addObject:", v16);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  -[CarNavigationSearchResultsModeController setMapItems:selectedItemIndex:](self, "setMapItems:selectedItemIndex:", v8, objc_msgSend(v8, "indexOfObject:", v7));
}

- (void)setSearchResults:(id)a3 selectedResultIndex:(unint64_t)a4
{
  NSArray *v6;
  NSArray *searchResults;
  NSArray *v8;
  NSArray *mapItems;

  v6 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "carShortenedArray"));
  searchResults = self->_searchResults;
  self->_searchResults = v6;

  self->_selectedIndex = -[CarNavigationSearchResultsModeController _validateSelectedIndex:forCount:](self, "_validateSelectedIndex:forCount:", a4, -[NSArray count](self->_searchResults, "count"));
  if (-[NSArray count](self->_searchResults, "count"))
  {
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray valueForKey:](self->_searchResults, "valueForKey:", CFSTR("mapItem")));
    mapItems = self->_mapItems;
    self->_mapItems = v8;
  }
  else
  {
    mapItems = self->_mapItems;
    self->_mapItems = 0;
  }

  -[CarNavigationSearchResultsModeController _updateContextAndDisplay](self, "_updateContextAndDisplay");
}

- (void)setMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  NSArray *mapItems;
  void *v9;
  NSArray *v10;
  NSArray *searchResults;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  SearchResult *v18;
  SearchResult *v19;
  NSArray *v20;
  NSArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a3;
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "carShortenedArray"));
  mapItems = self->_mapItems;
  self->_mapItems = v7;

  self->_selectedIndex = -[CarNavigationSearchResultsModeController _validateSelectedIndex:forCount:](self, "_validateSelectedIndex:forCount:", a4, -[NSArray count](self->_mapItems, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v10 = (NSArray *)objc_claimAutoreleasedReturnValue(+[MKMapItem searchResultsForMapItems:](MKMapItem, "searchResultsForMapItems:", self->_mapItems));
  searchResults = self->_searchResults;
  self->_searchResults = v10;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v16);
        v18 = [SearchResult alloc];
        v19 = -[SearchResult initWithMapItem:](v18, "initWithMapItem:", v17, (_QWORD)v22);
        objc_msgSend(v9, "addObject:", v19);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v14);
  }

  v20 = (NSArray *)objc_msgSend(v9, "copy");
  v21 = self->_searchResults;
  self->_searchResults = v20;

  -[CarNavigationSearchResultsModeController _updateContextAndDisplay](self, "_updateContextAndDisplay");
}

- (void)setCategory:(id)a3
{
  BrowseCategory *v5;
  BrowseCategory *v6;

  v5 = (BrowseCategory *)a3;
  if (self->_category != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_category, a3);
    -[CarNavigationSearchResultsModeController _fetchCategoryResults](self, "_fetchCategoryResults");
    -[CarNavigationSearchResultsModeController _updateContextAndDisplay](self, "_updateContextAndDisplay");
    v5 = v6;
  }

}

- (void)setState:(int64_t)a3
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("CarNavigationSearchResultsModeStateResults");
      if (a3 == 1)
        v7 = CFSTR("CarNavigationSearchResultsModeStatePlaceCard");
      if (a3 == 2)
        v7 = CFSTR("CarNavigationSearchResultsModeStateEVAvailability");
      v9 = 138412290;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "SAR: setState: %@, -> updating cardsOverlay.", (uint8_t *)&v9, 0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v8, "updateCardsForContext:animated:", self, 1);

  }
}

- (id)_cardTitle
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t selectedIndex;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  SearchSession *searchSession;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  SearchSession *v20;
  int v21;
  SearchSession *v22;

  v3 = -[CarNavigationSearchResultsModeController state](self, "state");
  if (v3 == 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Available Now [Carplay EV Charging Availability header]"), CFSTR("localized string not found"), 0));
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    selectedIndex = self->_selectedIndex;
    if (selectedIndex < -[NSArray count](self->_mapItems, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_mapItems, "objectAtIndexedSubscript:", self->_selectedIndex));
      goto LABEL_9;
    }
LABEL_11:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CarPlay_Search_Title"), CFSTR("localized string not found"), 0));

    return v10;
  }
  if (v3)
    goto LABEL_11;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
LABEL_9:
    v7 = v6;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](self->_searchSession, "searchInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "headerDisplayName"));

  searchSession = self->_searchSession;
  if (v14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchInfo](searchSession, "searchInfo"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerDisplayName"));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](searchSession, "searchFieldItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "searchString"));

    if (!v17)
    {
      v18 = sub_10043364C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = self->_searchSession;
        v21 = 138412290;
        v22 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "SAR: failed to find an appropriate title for current search session: %@", (uint8_t *)&v21, 0xCu);
      }

      goto LABEL_11;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchSession searchFieldItem](self->_searchSession, "searchFieldItem"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchString"));
  }
LABEL_10:
  v10 = (void *)v8;

  if (!v10)
    goto LABEL_11;
  return v10;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)accessoriesHidingBehavior
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  objc_msgSend(a3, "setCameraStyle:", 1);
}

- (id)personalizedItemSources
{
  void *v2;
  NavigationCustomFeaturesSource *customFeaturesSource;

  if (self->_customFeaturesSource)
  {
    customFeaturesSource = self->_customFeaturesSource;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &customFeaturesSource, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return v2;
}

- (id)desiredCards
{
  void *v2;
  const __CFString *v4;

  v2 = -[CarNavigationSearchResultsModeController state](self, "state");
  if ((unint64_t)v2 <= 2)
  {
    v4 = CFSTR("primary");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1));
  }
  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v5;
  void *v6;
  int64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController _cardTitle](self, "_cardTitle"));
  objc_msgSend(v5, "setTitle:", v6);

  HIDWORD(v25) = 0;
  *(_DWORD *)((char *)&v25 + 1) = 0;
  v15 = xmmword_100E34B90;
  v16 = xmmword_100E2D550;
  v17 = 3;
  v18 = 1148846080;
  v19 = 2;
  LODWORD(v20) = 1148846080;
  v21 = 0;
  v22 = 0;
  __asm { FMOV            V0.2D, #8.0 }
  v23 = _Q0;
  v24 = _Q0;
  LOBYTE(v25) = 1;
  v26 = 8;
  LOBYTE(v27) = 0;
  if (v5)
    objc_msgSend(v5, "setLayout:", &v15);
  objc_msgSend(v5, "setAccessory:", 1, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  v12 = -[CarNavigationSearchResultsModeController state](self, "state");
  switch(v12)
  {
    case 2:
      objc_msgSend(v5, "setContent:", self->_evChargingAvailabilityVC);
      break;
    case 1:
      v13 = objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
      goto LABEL_9;
    case 0:
      v13 = objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
LABEL_9:
      v14 = (void *)v13;
      objc_msgSend(v5, "setContent:", v13);

      break;
  }

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;

  -[CarNavigationSearchResultsModeController _highlightMapItem:](self, "_highlightMapItem:", 0, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v5, "stopLocationUpdateWithObserver:", self);

}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10092228C;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1009223BC;
  v7[3] = &unk_1011AC860;
  v7[4] = self;
  v5 = a4;
  objc_msgSend(v5, "addPreparation:", v7);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009224E8;
  v6[3] = &unk_1011AE8F8;
  v6[4] = self;
  objc_msgSend(v5, "addCompletion:", v6);

}

- (void)chromeDidStartConfiguringCards:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController desiredCards](self, "desiredCards"));
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
    objc_msgSend(v7, "setHasCardFinishedTransitioning:", 0);

  }
}

- (void)chromeDidEndConfiguringCards:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController desiredCards](self, "desiredCards"));
  v6 = objc_msgSend(v4, "isEqualToArray:", v5);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
    objc_msgSend(v7, "setHasCardFinishedTransitioning:", 1);

  }
}

- (void)_configureCard:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v13;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[7];
  uint64_t v39;
  char v40;

  v4 = a3;
  v5 = -[CarNavigationSearchResultsModeController state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController _cardTitle](self, "_cardTitle"));
  objc_msgSend(v4, "setTitle:", v6);

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
    objc_msgSend(v4, "setContent:", v7);

    HIDWORD(v25) = 0;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    v15 = xmmword_100E34B90;
    v16 = xmmword_100E2D550;
    v17 = 3;
    v18 = 1148846080;
    v19 = 2;
    LODWORD(v20) = 1148846080;
    v21 = 0;
    v22 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v23 = _Q0;
    v24 = _Q0;
    LOBYTE(v25) = 1;
    v26 = 8;
    LOBYTE(v27) = 0;
    if (v4)
      objc_msgSend(v4, "setLayout:", &v15);
    objc_msgSend(v4, "setAccessory:", 1, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    objc_msgSend(v4, "setSelectionHandler:", 0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
    objc_msgSend(v4, "setContent:", v13);

    memset(v38, 0, sizeof(v38));
    v28[0] = xmmword_100E34B90;
    v28[1] = xmmword_100E2D550;
    v29 = 3;
    v30 = 1148846080;
    v31 = 2;
    v32 = 1148846080;
    v33 = 0;
    v34 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    v35 = _Q0;
    v36 = _Q0;
    v37 = 1;
    v39 = 8;
    v40 = 0;
    if (v4)
      objc_msgSend(v4, "setLayout:", v28);
    objc_msgSend(v4, "setAccessory:", 1);
  }

}

- (void)_displayPlaceCardForSearchResult:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CarPlaceCardCardViewController *v7;
  uint8_t v8[16];

  v4 = a3;
  if (-[CarNavigationSearchResultsModeController state](self, "state"))
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "SAR: tried to get to .PlaceCard state but not in .Results state, ignoring.", v8, 2u);
    }

  }
  else
  {
    v7 = -[CarPlaceCardCardViewController initWithSearchResult:style:dataSource:delegate:]([CarPlaceCardCardViewController alloc], "initWithSearchResult:style:dataSource:delegate:", v4, 1, self, self);
    -[CarNavigationSearchResultsModeController setPlaceCard:](self, "setPlaceCard:", v7);

    -[CarNavigationSearchResultsModeController setState:](self, "setState:", 1);
  }

}

- (void)_highlightMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PersonalizedMapItemKey *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  objc_initWeak(&location, v6);

  if (v4)
  {
    v7 = -[PersonalizedMapItemKey initWithMapItem:]([PersonalizedMapItemKey alloc], "initWithMapItem:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "customPOIsController"));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100922A54;
    v10[3] = &unk_1011DC1F0;
    v11 = v4;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "customFeatureForKey:completion:", v7, v10);
    objc_destroyWeak(&v12);

  }
  else
  {
    v7 = (PersonalizedMapItemKey *)objc_loadWeakRetained(&location);
    -[PersonalizedMapItemKey _deselectLabelMarkerAnimated:](v7, "_deselectLabelMarkerAnimated:", 1);
  }

  objc_destroyWeak(&location);
}

- (void)_displayMapItems
{
  unint64_t selectedIndex;
  NSUInteger v4;
  NavigationCustomFeaturesSource *customFeaturesSource;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  selectedIndex = self->_selectedIndex;
  v4 = -[NSArray count](self->_mapItems, "count");
  customFeaturesSource = self->_customFeaturesSource;
  if (selectedIndex >= v4)
  {
    -[NavigationCustomFeaturesSource removeMapItems](customFeaturesSource, "removeMapItems");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource pointsFramer](customFeaturesSource, "pointsFramer"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController carChromeViewController](self, "carChromeViewController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationDisplay"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cameraController"));
      -[NavigationCustomFeaturesSource setPointsFramer:](self->_customFeaturesSource, "setPointsFramer:", v9);

    }
    -[NavigationCustomFeaturesSource displayMapItems:](self->_customFeaturesSource, "displayMapItems:", self->_mapItems);
  }
}

- (void)_updateDisplay
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
  objc_msgSend(v3, "setSearchResults:", self->_searchResults);

  -[CarNavigationSearchResultsModeController _displayMapItems](self, "_displayMapItems");
}

- (void)_updateContext
{
  -[SearchSession setSelectedResultIndex:](self->_searchSession, "setSelectedResultIndex:", self->_selectedIndex);
}

- (void)_updateContextAndDisplay
{
  SearchSession *searchSession;

  searchSession = self->_searchSession;
  if (searchSession
    && -[SearchSession selectedResultIndex](searchSession, "selectedResultIndex") != self->_selectedIndex)
  {
    -[CarNavigationSearchResultsModeController _updateContext](self, "_updateContext");
  }
  else
  {
    -[CarNavigationSearchResultsModeController _updateDisplay](self, "_updateDisplay");
  }
}

- (unint64_t)_validateSelectedIndex:(unint64_t)a3 forCount:(unint64_t)a4
{
  unint64_t v5;

  if (a3 >= a4 || a3 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 0;
  else
    v5 = a3;
  if (a4)
    return v5;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
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
  NSObject *p_super;
  os_log_type_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController searchSession](self, "searchSession"));
    v5 = objc_msgSend(v4, "isLoading");

    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (SearchSession *)v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        v9 = "SAR: Tried to fetch search results for category, but we're already fetching them.";
        p_super = &v8->super;
        v11 = OS_LOG_TYPE_ERROR;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, p_super, v11, v9, (uint8_t *)&v22, 2u);
      }
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v22 = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_INFO, "SAR: Started fetching results for category: %@. Creating new searchSesssion.", (uint8_t *)&v22, 0xCu);

      }
      v8 = -[SearchSession initWithOrigin:]([SearchSession alloc], "initWithOrigin:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "chromeViewController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "navigationAwareTraits"));

      if (objc_msgSend(v17, "navigating"))
        v18 = 2;
      else
        v18 = 0;
      objc_msgSend(v17, "setSearchOriginationType:", v18);
      objc_msgSend(v17, "useOnlineToOfflineFailoverRequestModeIfAllowed");
      -[SearchSession setTraits:](v8, "setTraits:", v17);
      -[SearchSession setSource:](v8, "setSource:", 6);
      -[CarNavigationSearchResultsModeController setSearchSession:](self, "setSearchSession:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "category"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v20));

      -[SearchSession startSearch:](v8, "startSearch:", v21);
    }
  }
  else
  {
    v12 = sub_10043364C();
    v8 = (SearchSession *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      v9 = "SAR: Tried to fetch search results for category that is nil.";
      p_super = &v8->super;
      v11 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
  }

}

- (double)_detourDistanceToMapItem:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  double v16;
  CLLocationCoordinate2D v18;
  _QWORD v19[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_detourInfo"));
  objc_msgSend(v5, "distanceToPlace");
  if (v6 <= 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLocation"));
    objc_msgSend(v10, "coordinate");
    v19[0] = v11;
    v19[1] = v12;

    objc_msgSend(v4, "_coordinate");
    v14 = v13;
    objc_msgSend(v4, "_coordinate");
    v18 = CLLocationCoordinate2DMake(v14, v15);
    v7 = CLLocationCoordinate2DGetDistanceFrom(v19, &v18);
  }
  else
  {
    objc_msgSend(v5, "distanceToPlace");
  }
  v16 = v7;

  return v16;
}

- (id)etaForCurrentRoute
{
  unint64_t selectedIndex;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  GuidanceETA *v11;
  void *v12;
  GuidanceETA *v13;
  id v14;
  NSObject *v15;
  uint8_t v17[16];

  selectedIndex = self->_selectedIndex;
  if (selectedIndex >= -[NSArray count](self->_mapItems, "count"))
  {
    v14 = sub_10043364C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "SAR: failed to find ETA for the mapItem that is currently displayed in the placeCard.", v17, 2u);
    }

    v13 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_mapItems, "objectAtIndexedSubscript:", self->_selectedIndex));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_detourInfo"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_detourInfo"));
      objc_msgSend(v6, "timeToPlace");
      v8 = v7;

      -[CarNavigationSearchResultsModeController _detourDistanceToMapItem:](self, "_detourDistanceToMapItem:", v4);
      v10 = v9;
      v11 = [GuidanceETA alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));
      v13 = -[GuidanceETA initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:](v11, "initWithRemainingTime:remainingDistance:arrivalBatteryCharge:destinationTimeZone:transportType:", 0, v12, 0, v8, v10);

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (id)automaticSharingContacts
{
  return 0;
}

- (void)placeCardDidSelectGo:(id)a3
{
  unint64_t selectedIndex;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps420;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  selectedIndex = self->_selectedIndex;
  if (selectedIndex < -[NSArray count](self->_searchResults, "count", a3))
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR: placeCard didSelectGo.", v16, 2u);
    }

    IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v7, v8);
    if ((IsEnabled_DrivingMultiWaypointRoutes & 1) != 0
      || (IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes),
          (IsEnabled_Maps420 & 1) != 0)
      || MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController carChromeViewController](self, "carChromeViewController"));
      objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 6097, -[CarNavigationSearchResultsModeController currentUsageTarget](self, "currentUsageTarget"), 0);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController carChromeViewController](self, "carChromeViewController"));
      objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 3001, -[CarNavigationSearchResultsModeController currentUsageTarget](self, "currentUsageTarget"), 0);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", self->_selectedIndex));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapItem"));
    objc_msgSend(v13, "detourToMapItem:", v15);

  }
}

- (void)placeCardDidSelectHandoff:(id)a3
{
  id v4;
  unint64_t selectedIndex;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;

  v4 = a3;
  selectedIndex = self->_selectedIndex;
  if (selectedIndex < -[NSArray count](self->_searchResults, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", self->_selectedIndex))) != 0)
  {
    objc_initWeak(&location, self);
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
      *(_DWORD *)buf = 138477827;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SAR: handing off to destination: %{private}@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100923500;
    v13[3] = &unk_1011B6E58;
    objc_copyWeak(&v15, &location);
    v11 = v6;
    v14 = v11;
    objc_msgSend(v10, "handoffDestination:completion:", v11, v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = sub_10043364C();
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SAR: couldn't find destination for placeCard handOff.", buf, 2u);
    }
  }

}

- (void)placeCard:(id)a3 didPresentAlert:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a4;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR didPresentAlert with title: %@", (uint8_t *)&v10, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v9, "setHardwareBackButtonBehavior:forContext:", 1, self);

}

- (void)placeCardDidDismissAlert:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR didDismissAlert", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "setHardwareBackButtonBehavior:forContext:", 0, self);

}

- (void)placeCard:(id)a3 wantsToPresentEVAvailability:(id)a4
{
  -[CarNavigationSearchResultsModeController setEvChargingAvailabilityVC:](self, "setEvChargingAvailabilityVC:", a4);
  -[CarNavigationSearchResultsModeController setState:](self, "setState:", 2);
}

- (unint64_t)_rowForSearchItem:(id)a3
{
  id v4;
  NSArray *searchResults;
  id v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  uint8_t v11[16];
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  searchResults = self->_searchResults;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1009239EC;
  v12[3] = &unk_1011BE900;
  v6 = v4;
  v13 = v6;
  v14 = &v15;
  -[NSArray enumerateObjectsUsingBlock:](searchResults, "enumerateObjectsUsingBlock:", v12);
  v7 = v16[3];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SAR: couldn't find selected/highlighted search result in our _searchResults array.", v11, 2u);
    }

    v7 = v16[3];
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (void)searchResultsCard:(id)a3 didFocusSearchResult:(id)a4 atIndexPath:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a4;
  if (v6)
  {
    v7 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
      v12 = 138477827;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SAR: searchResultsCard:didFocusSearchResult, -> highlighting mapItem %{private}@", (uint8_t *)&v12, 0xCu);

    }
    self->_selectedIndex = -[CarNavigationSearchResultsModeController _rowForSearchItem:](self, "_rowForSearchItem:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    -[CarNavigationSearchResultsModeController _highlightMapItem:](self, "_highlightMapItem:", v11);

  }
}

- (void)searchResultsCard:(id)a3 didSelectSearchResult:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a4;
  v6 = sub_10043364C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SAR: searchResultsCard:didSelectSearchItem, presenting PlaceCard for item %@", (uint8_t *)&v11, 0xCu);

  }
  self->_selectedIndex = -[CarNavigationSearchResultsModeController _rowForSearchItem:](self, "_rowForSearchItem:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  -[CarNavigationSearchResultsModeController _highlightMapItem:](self, "_highlightMapItem:", v10);

  -[CarNavigationSearchResultsModeController _displayPlaceCardForSearchResult:](self, "_displayPlaceCardForSearchResult:", v5);
}

- (void)handleHardwareBackButtonPressed
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id buf[2];

  v3 = sub_10043364C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SAR handleHardwareBackButtonPressed, dismissing current modal VC.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100923D50;
  v6[3] = &unk_1011AD260;
  objc_copyWeak(&v7, buf);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  const __CFString *v7;
  int64_t v8;
  void *v9;
  _TtC4Maps39CarEVChargingAvailabilityViewController *evChargingAvailabilityVC;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  const __CFString *v17;

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[CarNavigationSearchResultsModeController state](self, "state");
    v7 = CFSTR("CarNavigationSearchResultsModeStateResults");
    if (v6 == 1)
      v7 = CFSTR("CarNavigationSearchResultsModeStatePlaceCard");
    if (v6 == 2)
      v7 = CFSTR("CarNavigationSearchResultsModeStateEVAvailability");
    v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR: closeButtonTapped, currentState: %@", (uint8_t *)&v16, 0xCu);
  }

  v8 = -[CarNavigationSearchResultsModeController state](self, "state");
  if (v8 == 2)
  {
    -[CarNavigationSearchResultsModeController setState:](self, "setState:", 1);
    evChargingAvailabilityVC = self->_evChargingAvailabilityVC;
    self->_evChargingAvailabilityVC = 0;
  }
  else if (v8 == 1)
  {
    -[CarNavigationSearchResultsModeController _highlightMapItem:](self, "_highlightMapItem:", 0);
    -[CarNavigationSearchResultsModeController setState:](self, "setState:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController searchSession](self, "searchSession"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentResults"));
    v13 = objc_msgSend(v12, "count");

    if (v13 != (id)1)
      return;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
    objc_msgSend(v14, "popFromContext:", self);

    v15 = sub_10043364C();
    evChargingAvailabilityVC = (_TtC4Maps39CarEVChargingAvailabilityViewController *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(&evChargingAvailabilityVC->super.super.super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, &evChargingAvailabilityVC->super.super.super, OS_LOG_TYPE_INFO, "SAR: will remove search results as it had only one search result", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v8)
      return;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController searchSession](self, "searchSession"));

    if (v9)
    {
      evChargingAvailabilityVC = (_TtC4Maps39CarEVChargingAvailabilityViewController *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController searchSession](self, "searchSession"));
      -[CarEVChargingAvailabilityViewController invalidate](evChargingAvailabilityVC, "invalidate");
    }
    else
    {
      evChargingAvailabilityVC = (_TtC4Maps39CarEVChargingAvailabilityViewController *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      -[CarEVChargingAvailabilityViewController popFromContext:](evChargingAvailabilityVC, "popFromContext:", self);
    }
  }

}

- (NSArray)preferredCarFocusEnvironments
{
  void *v2;
  int64_t state;
  void *v4;
  void *v5;
  void **v6;
  void *v8;
  void *v9;
  void *v10;

  state = self->_state;
  switch(state)
  {
    case 2:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController evChargingAvailabilityVC](self, "evChargingAvailabilityVC"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v8 = v5;
      v6 = &v8;
      goto LABEL_7;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController placeCard](self, "placeCard"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderEnvironment environmentWithFocusEnvironment:](CarFocusOrderEnvironment, "environmentWithFocusEnvironment:", v4));
      v9 = v5;
      v6 = &v9;
      goto LABEL_7;
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentRepresentingOverlays"));
      v10 = v5;
      v6 = &v10;
LABEL_7:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 1, v8, v9, v10));

      break;
  }
  return (NSArray *)v2;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "itemRepresentingStatusBanner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController chromeViewController](self, "chromeViewController", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "itemRepresentingOverlays"));
  v11[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarFocusOrderSequence sequenceWithItems:options:](CarFocusOrderSequence, "sequenceWithItems:options:", v7, 3));
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return (NSArray *)v9;
}

- (void)searchSessionWillPerformSearch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_10043364C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "SAR searchSessionWillPerformSearch", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
  objc_msgSend(v6, "reloadSearchStateAnimated:", 0);

}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CLLocation *v10;
  CLLocation *lastFetchedFromLocation;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
    v13 = 134217984;
    v14 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR searchSessionDidChangeSearchResults, count: %ld", (uint8_t *)&v13, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v10 = (CLLocation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastLocation"));
    lastFetchedFromLocation = self->_lastFetchedFromLocation;
    self->_lastFetchedFromLocation = v10;

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResultsSearchInfo"));
  -[CarNavigationSearchResultsModeController setSearchInfo:](self, "setSearchInfo:", v12);

  -[CarNavigationSearchResultsModeController _updateDisplay](self, "_updateDisplay");
}

- (void)searchSessionDidFail:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));
    v9 = 138412290;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR searchSessionDidFail with error: %@", (uint8_t *)&v9, 0xCu);

  }
  -[CarNavigationSearchResultsModeController setSearchInfo:](self, "setSearchInfo:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
  objc_msgSend(v8, "reloadSearchStateAnimated:", 1);

}

- (void)searchSessionDidInvalidate:(id)a3 reason:(unint64_t)a4
{
  SearchSession *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = (SearchSession *)a3;
  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SAR searchSessionDidInvalidate", v10, 2u);
  }

  if (self->_searchSession == v6)
  {
    self->_searchSession = 0;

    if (a4 != 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarChromeModeCoordinator sharedInstance](CarChromeModeCoordinator, "sharedInstance"));
      objc_msgSend(v9, "popFromContext:", self);

    }
  }

}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  double v5;
  CLLocationDegrees v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  id v9;

  v9 = a4;
  if ((objc_msgSend(v9, "isRouteEta") & 1) == 0)
  {
    objc_msgSend(v9, "coordinate");
    v6 = v5;
    objc_msgSend(v9, "coordinate");
    v8 = CLLocationCoordinate2DMake(v6, v7);
    -[NavigationCustomFeaturesSource setOverriddenPointToFrame:](self->_customFeaturesSource, "setOverriddenPointToFrame:", v8.latitude, v8.longitude);
  }

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  if ((objc_msgSend(a4, "isRouteEta", a3) & 1) == 0)
    -[NavigationCustomFeaturesSource setOverriddenPointToFrame:](self->_customFeaturesSource, "setOverriddenPointToFrame:", kCLLocationCoordinate2DInvalid.latitude, kCLLocationCoordinate2DInvalid.longitude);
}

- (void)_reloadContentIfNeededForUpdatedLocation:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController searchSession](self, "searchSession"));
    v9 = objc_msgSend(v8, "isLoading");

    if ((v9 & 1) == 0)
    {
      v10 = sub_10043364C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SAR: _reloadContentIfNeededForUpdatedLocation", v12, 2u);
      }

      -[CarNavigationSearchResultsModeController _fetchCategoryResults](self, "_fetchCategoryResults");
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController category](self, "category"));
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
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarNavigationSearchResultsModeController sarCard](self, "sarCard"));
  objc_msgSend(v4, "locationManagerUpdatedLocation:", v8);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
  v6 = -[CarNavigationSearchResultsModeController _contentNeedsRefreshingForUpdatedLocation:](self, "_contentNeedsRefreshingForUpdatedLocation:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
    -[CarNavigationSearchResultsModeController _reloadContentIfNeededForUpdatedLocation:](self, "_reloadContentIfNeededForUpdatedLocation:", v7);

  }
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (int)currentUsageTarget
{
  return 1009;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (SearchSession)searchSession
{
  return self->_searchSession;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (CarSearchResultsCardViewController)sarCard
{
  return self->_sarCard;
}

- (void)setSarCard:(id)a3
{
  objc_storeStrong((id *)&self->_sarCard, a3);
}

- (CarPlaceCardCardViewController)placeCard
{
  return self->_placeCard;
}

- (void)setPlaceCard:(id)a3
{
  objc_storeStrong((id *)&self->_placeCard, a3);
}

- (void)setBrowseManager:(id)a3
{
  objc_storeStrong((id *)&self->_browseManager, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (_TtC4Maps39CarEVChargingAvailabilityViewController)evChargingAvailabilityVC
{
  return self->_evChargingAvailabilityVC;
}

- (void)setEvChargingAvailabilityVC:(id)a3
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evChargingAvailabilityVC, 0);
  objc_storeStrong((id *)&self->_browseManager, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_storeStrong((id *)&self->_sarCard, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_lastFetchedFromLocation, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_mapItems, 0);
  objc_storeStrong((id *)&self->_customFeaturesSource, 0);
}

@end
