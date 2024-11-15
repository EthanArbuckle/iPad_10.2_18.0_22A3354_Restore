@implementation VenueCategoryDataSource

- (VenueCategoryDataSource)initWithTableView:(id)a3 searchCategory:(id)a4
{
  id v7;
  VenueCategoryDataSource *v8;
  VenueCategoryDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t UInteger;
  void *v16;
  _TtC4Maps28PlaceSummaryAsyncDataManager *v17;
  _TtC4Maps28PlaceSummaryAsyncDataManager *placeSummaryAsyncDataManager;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *v19;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;
  NSCache *v21;
  NSCache *placeSummaryTemplateViewModels;
  uint64_t v23;
  NSMutableDictionary *mapitemTemplates;
  objc_super v26;

  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)VenueCategoryDataSource;
  v8 = -[DataSource initWithTableView:updateLocation:](&v26, "initWithTableView:updateLocation:", a3, 0);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v8, "tableView"));
    objc_msgSend(v10, "setDelegate:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v9, "tableView"));
    objc_msgSend(v11, "setDataSource:", v9);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v9, "tableView"));
    v13 = objc_opt_class(_TtC4Maps25PlaceSummaryTableViewCell);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
    objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

    UInteger = GEOConfigGetUInteger(GeoServicesConfig_VenuesMinimumResultsNumberForIndexList[0], GeoServicesConfig_VenuesMinimumResultsNumberForIndexList[1]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](v9, "tableView"));
    objc_msgSend(v16, "setSectionIndexMinimumDisplayRowCount:", UInteger);

    objc_storeStrong((id *)&v9->_searchCategory, a4);
    v9->_searchResultLabelContext = 1;
    v17 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = v9->_placeSummaryAsyncDataManager;
    v9->_placeSummaryAsyncDataManager = v17;

    v19 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
    evChargerDownloader = v9->_evChargerDownloader;
    v9->_evChargerDownloader = v19;

    v21 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v9->_placeSummaryTemplateViewModels;
    v9->_placeSummaryTemplateViewModels = v21;

    v23 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mapitemTemplates = v9->_mapitemTemplates;
    v9->_mapitemTemplates = (NSMutableDictionary *)v23;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[VenueCategoryDataSource resetCache](self, "resetCache");
  v3.receiver = self;
  v3.super_class = (Class)VenueCategoryDataSource;
  -[VenueCategoryDataSource dealloc](&v3, "dealloc");
}

- (void)resetCache
{
  void *v3;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;

  if (self->_placeSummaryTemplateViewModels)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
    objc_msgSend(v3, "removeAllObjects");

    -[VenueCategoryDataSource setPlaceSummaryTemplateViewModels:](self, "setPlaceSummaryTemplateViewModels:", 0);
  }
  evChargerDownloader = self->_evChargerDownloader;
  if (evChargerDownloader)
  {
    self->_evChargerDownloader = 0;

  }
}

- (void)setMapItem:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_mapItem, a3);
  -[VenueCategoryDataSource setBuildingsWithMapItem:](self, "setBuildingsWithMapItem:", self->_mapItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

  }
}

- (void)_cacheEVChargersTemplates
{
  void *v3;
  id v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent objects](self->_content, "objects"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100BCB5FC;
    v5[3] = &unk_1011BCA10;
    v5[4] = self;
    -[VenueCategoryDataSource iterateThroughIndexPathsAndExecuteBlock:](self, "iterateThroughIndexPathsAndExecuteBlock:", v5);
  }
}

- (void)iterateThroughIndexPathsAndExecuteBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));
      v8 = (uint64_t)objc_msgSend(v7, "numberOfRowsInSection:", i);

      if (v8 >= 1)
      {
        for (j = 0; j != v8; ++j)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", j, i));
          v11[2](v11, v10);

        }
      }
    }
  }

}

- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory venueViewModelWithSearchResult:metadata:labelContext:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "venueViewModelWithSearchResult:metadata:labelContext:", v6, 0, self->_searchResultLabelContext));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
    objc_msgSend(v10, "setObject:forKey:", v9, v7);

  }
  v11 = v9;

  return v11;
}

- (id)venueIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource mapItem](self, "mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_venueInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueIdentifier"));

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateForSearchResult:indexPath:](self, "placeSummaryTemplateForSearchResult:indexPath:", v9, v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v11));

  objc_msgSend(v12, "setViewModel:delegate:asyncDataManager:", v10, self, self->_placeSummaryAsyncDataManager);
  return v12;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content", a3));
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", a4);

  return (int64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content", a3));
  v4 = objc_msgSend(v3, "numberOfSections");

  return (int64_t)v4;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  return self->_sectionIndexTitles;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[_SearchResultTableViewCell cellHeight](AcSearchResultTableViewCell, "cellHeight", a3, a4);
  return result;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedItem"));
  v8 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathForCell:", v7))) != 0)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v13);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "dataSource:itemFocused:", self, 0);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource content](self, "content"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexPath:", v6));

  -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v6, v10, 2007);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v9, "dataSource:itemTapped:", self, v10);

  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  y = a4.y;
  x = a4.x;
  v14 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v14, a5, x, y);

  }
  if (y <= 0.0)
    v12 = 7;
  else
    v12 = 8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v13, "captureUserAction:onTarget:eventValue:", v12, 106, 0);

}

- (void)setBuildingsWithMapItem:(id)a3
{
  void *v4;
  id v5;
  VenueAllBuildings *v6;
  void *v7;
  void *v8;
  void *v9;
  VenueAllBuildings *v10;
  AlphabeticallyOrderedDataSource *v11;
  void *v12;
  NSArray *v13;
  NSArray *buildings;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_venueInfo"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filters"));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", (char *)objc_msgSend(v15, "count") + 1);
  v6 = [VenueAllBuildings alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource mapItem](self, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_venueInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venueIdentifier"));
  v10 = -[VenueAllBuildings initWithVenueIdentifier:](v6, "initWithVenueIdentifier:", v9);
  objc_msgSend(v5, "addObject:", v10);

  v11 = -[AlphabeticallyOrderedDataSource initWithObjects:]([AlphabeticallyOrderedDataSource alloc], "initWithObjects:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource orderedObjects](v11, "orderedObjects"));
  objc_msgSend(v5, "addObjectsFromArray:", v12);

  v13 = (NSArray *)objc_msgSend(v5, "copy");
  buildings = self->_buildings;
  self->_buildings = v13;

}

- (void)refreshEVChargers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_identifier"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mapitemTemplates, "objectForKeyedSubscript:", v11));
        if (v12)
        {
          evChargerDownloader = self->_evChargerDownloader;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mapitemTemplates, "objectForKeyedSubscript:", v11));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
          -[PlaceSummaryEVChargerDownloader refreshResultForForTemplate:mapItem:](evChargerDownloader, "refreshResultForForTemplate:mapItem:", v14, v15);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)setSearchResults:(id)a3 labelContext:(unint64_t)a4
{
  id v6;
  NSArray *v7;
  NSArray *sectionIndexTitles;
  SearchResultsDataSourceContent *v9;
  SearchResultsDataSourceContent *content;
  void *v11;
  void *v12;
  AlphabeticallyOrderedDataSource *v13;

  v6 = a3;
  v13 = -[AlphabeticallyOrderedDataSource initWithAlphabeticallySortableObject:]([AlphabeticallyOrderedDataSource alloc], "initWithAlphabeticallySortableObject:", v6);

  self->_numberOfSectionsNotEmpty = -[AlphabeticallyOrderedDataSource numberOfSectionsNotEmpty](v13, "numberOfSectionsNotEmpty");
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource sectionIndexTitles](v13, "sectionIndexTitles"));
  sectionIndexTitles = self->_sectionIndexTitles;
  self->_sectionIndexTitles = v7;

  self->_searchResultLabelContext = a4;
  v9 = -[SearchResultsDataSourceContent initWithOrderedDataSource:]([SearchResultsDataSourceContent alloc], "initWithOrderedDataSource:", v13);
  content = self->_content;
  self->_content = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
    objc_msgSend(v12, "removeAllObjects");

  }
  -[VenueCategoryDataSource _cacheEVChargersTemplates](self, "_cacheEVChargersTemplates");

}

- (NSArray)filterBarTitles
{
  uint64_t v3;

  v3 = -[VenueCategoryDataSource subcategoriesType](self, "subcategoriesType");
  if (v3 >= 2)
  {
    if ((_DWORD)v3 == 2)
      v3 = objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource filterBarTitlesWithBuildings](self, "filterBarTitlesWithBuildings"));
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource filterBarTitlesWithSubcategories](self, "filterBarTitlesWithSubcategories"));
  }
  return (NSArray *)(id)v3;
}

- (id)filterBarTitlesWithSubcategories
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource subcategories](self, "subcategories"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = objc_alloc((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource subcategories](self, "subcategories"));
  v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource subcategories](self, "subcategories", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "displayString"));
        objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = objc_msgSend(v7, "copy");
  return v14;
}

- (id)filterBarTitlesWithBuildings
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource buildings](self, "buildings"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = objc_alloc((Class)NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource buildings](self, "buildings"));
  v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryDataSource buildings](self, "buildings", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "label"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        objc_msgSend(v7, "addObject:", v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = objc_msgSend(v7, "copy");
  return v15;
}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSArray)subcategories
{
  return self->_subcategories;
}

- (void)setSubcategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int)subcategoriesType
{
  return self->_subcategoriesType;
}

- (void)setSubcategoriesType:(int)a3
{
  self->_subcategoriesType = a3;
}

- (SearchResultsDataSourceContent)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_storeStrong((id *)&self->_content, a3);
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategory, a3);
}

- (NSArray)buildings
{
  return self->_buildings;
}

- (unint64_t)numberOfSectionsNotEmpty
{
  return self->_numberOfSectionsNotEmpty;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIndexTitles, a3);
}

- (unint64_t)searchResultLabelContext
{
  return self->_searchResultLabelContext;
}

- (void)setSearchResultLabelContext:(unint64_t)a3
{
  self->_searchResultLabelContext = a3;
}

- (_TtC4Maps28PlaceSummaryAsyncDataManager)placeSummaryAsyncDataManager
{
  return self->_placeSummaryAsyncDataManager;
}

- (void)setPlaceSummaryAsyncDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, a3);
}

- (_TtC4Maps31PlaceSummaryEVChargerDownloader)evChargerDownloader
{
  return self->_evChargerDownloader;
}

- (void)setEvChargerDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_evChargerDownloader, a3);
}

- (NSCache)placeSummaryTemplateViewModels
{
  return self->_placeSummaryTemplateViewModels;
}

- (void)setPlaceSummaryTemplateViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, a3);
}

- (NSMutableDictionary)mapitemTemplates
{
  return self->_mapitemTemplates;
}

- (void)setMapitemTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_mapitemTemplates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapitemTemplates, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_buildings, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_subcategories, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
