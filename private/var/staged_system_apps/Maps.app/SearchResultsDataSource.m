@implementation SearchResultsDataSource

- (SearchResultsDataSource)initWithTableView:(id)a3
{
  id v4;
  SearchResultsDataSource *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  SearchResultsCuratedCollectionsAnalyticsManager *v32;
  SearchResultsCuratedCollectionsAnalyticsManager *curatedCollectionsAnalyticsManager;
  NSCache *v34;
  NSCache *placeSummaryTemplateViewModels;
  NSCache *v36;
  NSCache *curatedGuideViewModels;
  NSMutableDictionary *v38;
  NSMutableDictionary *impressionElements;
  uint64_t v40;
  NSMutableDictionary *mapitemTemplates;
  void *v42;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)SearchResultsDataSource;
  v5 = -[DataSource initWithTableView:updateLocation:](&v44, "initWithTableView:updateLocation:", v4, 1);
  if (v5)
  {
    v6 = objc_opt_class(SearchResultTableViewCell);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SearchResultTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v6, v7);

    v8 = objc_opt_class(SearchResultTableViewCell);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SearchResultTableViewCell, "accessibilityIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v8, v9);

    v10 = objc_opt_class(SARSearchResultTableViewCell);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SARSearchResultTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v10, v11);

    v12 = objc_opt_class(SARSearchResultTableViewCell);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SARSearchResultTableViewCell, "accessibilityIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v12, v13);

    v14 = objc_opt_class(TwoLinesTableViewCell);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v14, v15);

    v16 = objc_opt_class(RelatedSectionTableViewCell);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell identifier](RelatedSectionTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v16, v17);

    v18 = objc_opt_class(RelatedSectionTableViewCell);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell accessibilityIdentifier](RelatedSectionTableViewCell, "accessibilityIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v18, v19);

    v20 = objc_opt_class(RelatedCollectionsSectionTableViewCell);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell identifier](RelatedCollectionsSectionTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v20, v21);

    v22 = objc_opt_class(RelatedCollectionsSectionTableViewCell);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell accessibilityIdentifier](RelatedCollectionsSectionTableViewCell, "accessibilityIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v22, v23);

    v24 = objc_opt_class(SimpleSearchResultTableViewCell);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SimpleSearchResultTableViewCell, "identifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v24, v25);

    v26 = objc_opt_class(SimpleSearchResultTableViewCell);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SimpleSearchResultTableViewCell, "accessibilityIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v26, v27);

    v28 = objc_opt_class(_TtC4Maps25PlaceSummaryTableViewCell);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v28, v29);

    v30 = objc_opt_class(_TtC4Maps25CuratedGuideTableViewCell);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedGuideTableViewCell reuseIdentifier](_TtC4Maps25CuratedGuideTableViewCell, "reuseIdentifier"));
    objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", v30, v31);

    v5->_displayDistance = 1;
    v32 = objc_alloc_init(SearchResultsCuratedCollectionsAnalyticsManager);
    curatedCollectionsAnalyticsManager = v5->_curatedCollectionsAnalyticsManager;
    v5->_curatedCollectionsAnalyticsManager = v32;

    v34 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v5->_placeSummaryTemplateViewModels;
    v5->_placeSummaryTemplateViewModels = v34;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v5->_placeSummaryTemplateViewModels, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v5->_placeSummaryTemplateViewModels, "setEvictsObjectsWithDiscardedContent:", 0);
    v36 = (NSCache *)objc_alloc_init((Class)NSCache);
    curatedGuideViewModels = v5->_curatedGuideViewModels;
    v5->_curatedGuideViewModels = v36;

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v5->_curatedGuideViewModels, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v5->_curatedGuideViewModels, "setEvictsObjectsWithDiscardedContent:", 0);
    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    impressionElements = v5->_impressionElements;
    v5->_impressionElements = v38;

    v40 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    mapitemTemplates = v5->_mapitemTemplates;
    v5->_mapitemTemplates = (NSMutableDictionary *)v40;

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v42, "addObserver:selector:name:object:", v5, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    objc_msgSend(v4, "setPrefetchDataSource:", v5);
  }

  return v5;
}

- (void)dealloc
{
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;
  objc_super v4;

  evChargerDownloader = self->_evChargerDownloader;
  self->_evChargerDownloader = 0;

  v4.receiver = self;
  v4.super_class = (Class)SearchResultsDataSource;
  -[SearchResultsDataSource dealloc](&v4, "dealloc");
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  if (-[SearchResultsDataSource enableStructuredRAPAffordance](self, "enableStructuredRAPAffordance", a3))
    -[SearchResultsDataSource adjustRAPAffordanceFrameWithTopPadding:](self, "adjustRAPAffordanceFrameWithTopPadding:", 26.0);
}

- (void)setPlaceSummaryMetadata:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  int v12;
  const __CFString *v13;

  v5 = a3;
  objc_storeStrong((id *)&self->_placeSummaryMetadata, a3);
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v6))
  {
    -[SearchResultsDataSource setPlaceSummaryUsesRichLayout:](self, "setPlaceSummaryUsesRichLayout:", -[PlaceSummaryMetadata containsPhotoCarouselLine](self->_placeSummaryMetadata, "containsPhotoCarouselLine"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v7, "setSeparatorStyle:", 0);

    v8 = sub_10043222C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[SearchResultsDataSource placeSummaryUsesRichLayout](self, "placeSummaryUsesRichLayout");
      v11 = CFSTR("NO");
      if (v10)
        v11 = CFSTR("YES");
      v12 = 138412290;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Place Summary] PlaceSummaryUsesRichLayout: %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)setGuideSummaryLayoutMetadata:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  unsigned int v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;

  v5 = a3;
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, a3);
  -[SearchResultsDataSource setGuideSummaryUsesRichLayout:](self, "setGuideSummaryUsesRichLayout:", objc_msgSend(v5, "guideSummaryUsesRichLayout"));
  v6 = sub_10043222C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[SearchResultsDataSource guideSummaryUsesRichLayout](self, "guideSummaryUsesRichLayout");
    v9 = CFSTR("NO");
    if (v8)
      v9 = CFSTR("YES");
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Place Summary] GuideSummaryUsesRichLayout: %@", (uint8_t *)&v10, 0xCu);
  }

}

- (id)shareContextualActionAtIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005BD34C;
  v9[3] = &unk_1011B9930;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = sub_100A3D0BC(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)objectsForAnalytics
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent objects](self->_content, "objects"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (int)targetForDragAnalytics
{
  return 101;
}

- (id)impressionElementForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SearchResultsImpressionMetadata *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  SearchResultsImpressionMetadata *v28;

  v6 = a3;
  v7 = a4;
  if (MapsFeature_IsEnabled_SearchResultsImpressions())
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionElements](self, "impressionElements"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v7));

    if (v9)
    {
      v10 = (SearchResultsImpressionMetadata *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionElements](self, "impressionElements"));
      v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsImpressionMetadata objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v7));
    }
    else
    {
      v28 = [SearchResultsImpressionMetadata alloc];
      v12 = objc_msgSend(v6, "resultIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
      v14 = objc_msgSend(v13, "_muid");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "place"));
      v17 = objc_msgSend(v16, "localSearchProviderID");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource searchQuery](self, "searchQuery"));
      v10 = -[SearchResultsImpressionMetadata initWithResultIndex:businessId:localSearchProviderId:query:](v28, "initWithResultIndex:businessId:localSearchProviderId:query:", v12, v14, v17, v18);

      v19 = objc_alloc((Class)MUImpressionElement);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "impressionElementIdentifier"));
      v11 = objc_msgSend(v19, "initWithElementIdentifier:visibilityThreshold:", v20, GEOConfigGetDouble(MapsConfig_DefaultVisibilityThresholdForSearchResultImpressions, off_1014B48D8));

      objc_msgSend(v11, "setCustomData:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionsSessionIdentifier](self, "impressionsSessionIdentifier"));
      objc_msgSend(v11, "setSessionIdentifier:", v21);

      v22 = objc_msgSend(v7, "section");
      v23 = objc_msgSend(v7, "row");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SearchResult at section %ld, index %ld, muid %llu"), v22, v23, objc_msgSend(v24, "_muid")));
      objc_msgSend(v11, "setDebugString:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionElements](self, "impressionElements"));
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v11, v7);

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (double)currentContentHeight
{
  double v2;

  +[_SearchResultTableViewCell cellHeight](SearchResultTableViewCell, "cellHeight");
  return v2 * 3.0;
}

- (void)setContent:(id)a3
{
  SearchResultsDataSourceContent *v5;
  _TtC4Maps28PlaceSummaryAsyncDataManager *v6;
  _TtC4Maps28PlaceSummaryAsyncDataManager *placeSummaryAsyncDataManager;
  _TtC4Maps35CuratedGuideViewModelDataDownloader *v8;
  _TtC4Maps35CuratedGuideViewModelDataDownloader *curatedGuideDataDownloader;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SearchResultsDataSourceContent *v14;

  v5 = (SearchResultsDataSourceContent *)a3;
  if (self->_content != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_content, a3);
    -[SearchResultsDataSource setIndexPathForRelatedCollectionSection:](self, "setIndexPathForRelatedCollectionSection:", 0);
    v6 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    placeSummaryAsyncDataManager = self->_placeSummaryAsyncDataManager;
    self->_placeSummaryAsyncDataManager = v6;

    v8 = objc_alloc_init(_TtC4Maps35CuratedGuideViewModelDataDownloader);
    curatedGuideDataDownloader = self->_curatedGuideDataDownloader;
    self->_curatedGuideDataDownloader = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionElements](self, "impressionElements"));
    objc_msgSend(v10, "removeAllObjects");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
    objc_msgSend(v11, "removeAllObjects");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedGuideViewModels](self, "curatedGuideViewModels"));
    objc_msgSend(v12, "removeAllObjects");

    -[SearchResultsDataSource cachePlaceSummaryTemplates](self, "cachePlaceSummaryTemplates");
    -[SearchResultsDataSource buildAndCacheCuratedGuideViewModels](self, "buildAndCacheCuratedGuideViewModels");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v13, "dataSourceUpdated:", self);

    -[SearchResultsDataSource createEVChargersRefreshDownloader](self, "createEVChargersRefreshDownloader");
    v5 = v14;
  }

}

- (void)setContent:(id)a3 openAt:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_openAt, a4);
  v6 = a3;
  -[SearchResultsDataSource setContent:](self, "setContent:", v6);

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

- (void)createEVChargersRefreshDownloader
{
  void *v3;
  id v4;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *v5;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent objects](self->_content, "objects"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (!self->_evChargerDownloader)
    {
      v5 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
      evChargerDownloader = self->_evChargerDownloader;
      self->_evChargerDownloader = v5;

    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1005BDA14;
    v7[3] = &unk_1011BCA10;
    v7[4] = self;
    -[SearchResultsDataSource iterateThroughIndexPathsAndExecuteBlock:](self, "iterateThroughIndexPathsAndExecuteBlock:", v7);
  }
}

- (void)setIsPresentingSearchAlongTheRouteResults:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isPresentingSearchAlongTheRouteResults != a3)
  {
    self->_isPresentingSearchAlongTheRouteResults = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));

    if (v4)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v5, "dataSourceUpdated:", self);

    }
  }
}

- (void)setSearchAlongTheRouteCellDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_searchAlongTheRouteCellDelegate, obj);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));

    v5 = obj;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v7, "dataSourceUpdated:", self);

      v5 = obj;
    }
  }

}

- (id)objectAtIndexPath:(id)a3
{
  return -[SearchResultsDataSourceContent objectAtIndexPath:](self->_content, "objectAtIndexPath:", a3);
}

- (void)setIsPresentingVenueClusterResults:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isPresentingVenueClusterResults != a3)
  {
    self->_isPresentingVenueClusterResults = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));

    if (v4)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v5, "dataSourceUpdated:", self);

    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content", a3));
  v4 = objc_msgSend(v3, "numberOfSections");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content", a3));
  v6 = objc_msgSend(v5, "numberOfRowsInSection:", a4);

  return (int64_t)v6;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  _BOOL8 v6;
  void *v7;
  void *v8;

  v6 = objc_msgSend(a3, "_maps_indexOfFirstNonEmptySection") == (id)a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewForHeaderInSection:isFirstNonEmptySection:", a4, v6));

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  double v11;
  double v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleForHeaderInSection:", a4));

  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection") == (id)a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    +[ResultsSectionHeaderView heightWhenFirstNonEmptySection:title:traitCollection:](ResultsSectionHeaderView, "heightWhenFirstNonEmptySection:title:traitCollection:", v9, v8, v10);
    v12 = v11;

  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  id v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  __objc2_class_ro **p_info;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  _TtC4Maps28PlaceSummaryAsyncDataManager *placeSummaryAsyncDataManager;
  double v23;
  double v24;
  void *v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];

  v5 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    p_info = MapsScrollableStackView.info;
    *(_QWORD *)&v7 = 138412290;
    v27 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v12, v27));
        v14 = objc_opt_class(p_info + 256);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          v15 = v13;
        else
          v15 = 0;
        v16 = v15;
        if (-[SearchResultsDataSource usePlaceSummaryForSearchResult:](self, "usePlaceSummaryForSearchResult:", v16)
          && -[SearchResultsDataSource placeSummaryUsesRichLayout](self, "placeSummaryUsesRichLayout"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateForSearchResult:indexPath:](self, "placeSummaryTemplateForSearchResult:indexPath:", v16, v12));
          if (v17)
          {
            v18 = v5;
            v19 = sub_10043222C();
            v20 = objc_claimAutoreleasedReturnValue(v19);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "debugDescription"));
              *(_DWORD *)buf = v27;
              v33 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[PlaceSummary] Prefetching artwork for %@", buf, 0xCu);

            }
            placeSummaryAsyncDataManager = self->_placeSummaryAsyncDataManager;
            objc_msgSend(v17, "containerWidth");
            v24 = v23;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
            objc_msgSend(v25, "screenScale");
            -[PlaceSummaryAsyncDataManager loadWith:containerWidth:desiredScale:](placeSummaryAsyncDataManager, "loadWith:containerWidth:desiredScale:", v17, v24, v26);

            v5 = v18;
            p_info = (__objc2_class_ro **)(MapsScrollableStackView + 32);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  UITableViewCell *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __objc2_class *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled");
  v10 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;
  v13 = objc_msgSend(v12, "type");
  if ((_DWORD)v13 == 11 && (MapsFeature_IsEnabled_SearchAndDiscovery(v13) & 1) == 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relatedSection"));

    if (v24)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relatedSection"));
      v25 = objc_msgSend(v23, "sectionType");
      if (v25 == (id)2)
      {
        v14 = 0;
        v19 = 0;
        goto LABEL_51;
      }
      if (v25 == (id)1)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relatedSection"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "relatedPlaceCollections"));
        v28 = objc_msgSend(v27, "count");

        if (v28)
        {
          if ((v9 & 1) != 0)
            v29 = objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell accessibilityIdentifier](RelatedCollectionsSectionTableViewCell, "accessibilityIdentifier"));
          else
            v29 = objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell identifier](RelatedCollectionsSectionTableViewCell, "identifier"));
          v14 = (void *)v29;
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v29, v7));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "relatedSection"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "relatedPlaceCollections"));
          objc_msgSend(v46, "setPlaceCollections:delegate:", v48, self);

          v19 = v46;
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
          -[UITableViewCell setSectionName:](v19, "setSectionName:", v49);

          v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
          -[UITableViewCell setBackgroundColor:](v19, "setBackgroundColor:", v50);

          goto LABEL_51;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchSection"));

      if (!v32)
        goto LABEL_6;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchSection"));
      v25 = objc_msgSend(v23, "sectionType");
      if (v25 == (id)2)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sectionGuide"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "placeCollections"));
        v44 = objc_msgSend(v43, "count");

        if (v44)
        {
          if ((v9 & 1) != 0)
            v45 = objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell accessibilityIdentifier](RelatedCollectionsSectionTableViewCell, "accessibilityIdentifier"));
          else
            v45 = objc_claimAutoreleasedReturnValue(+[RelatedSectionTableViewCell identifier](RelatedCollectionsSectionTableViewCell, "identifier"));
          v14 = (void *)v45;
          v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v45, v7));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "placeCollections"));
          -[UITableViewCell setPlaceCollections:delegate:](v19, "setPlaceCollections:delegate:", v51, self);

          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
          -[UITableViewCell setSectionName:](v19, "setSectionName:", v52);

          v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
          -[UITableViewCell setBackgroundColor:](v19, "setBackgroundColor:", v53);

        }
        else
        {
          v19 = objc_opt_new(UITableViewCell);
          v14 = 0;
        }

        goto LABEL_51;
      }
      if (v25 == (id)1)
        goto LABEL_26;
    }
    if (v25)
    {

      goto LABEL_6;
    }
LABEL_26:
    v19 = objc_opt_new(UITableViewCell);
    v14 = 0;
    goto LABEL_51;
  }
LABEL_6:
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personalizedCompoundItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "address"));

  if (!v15)
  {
    if (MapsFeature_IsEnabled_SearchAndDiscovery(v16))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeCollection"));

      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedGuideTableViewCell reuseIdentifier](_TtC4Maps25CuratedGuideTableViewCell, "reuseIdentifier"));
        v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v22, v7));

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedGuideCellViewModelForSearchResult:indexPath:](self, "curatedGuideCellViewModelForSearchResult:indexPath:", v12, v7));
        -[UITableViewCell configureWith:delegate:imageLoader:](v19, "configureWith:delegate:imageLoader:", v23, self, self->_curatedGuideDataDownloader);
LABEL_51:

        goto LABEL_52;
      }
    }
    if (!v12)
    {
      v19 = objc_opt_new(UITableViewCell);
      goto LABEL_52;
    }
    if (-[SearchResultsDataSource usePlaceSummaryForSearchResult:](self, "usePlaceSummaryForSearchResult:", v12))
    {
      v30 = objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateForSearchResult:indexPath:](self, "placeSummaryTemplateForSearchResult:indexPath:", v12, v7));
      if (v30)
      {
        v23 = (void *)v30;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryTableViewCell reuseIdentifier](_TtC4Maps25PlaceSummaryTableViewCell, "reuseIdentifier"));
        v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v31));

        -[UITableViewCell setViewModel:delegate:asyncDataManager:](v19, "setViewModel:delegate:asyncDataManager:", v23, self, self->_placeSummaryAsyncDataManager);
        goto LABEL_51;
      }
    }
    if (-[SearchResultsDataSource isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"))
    {
      if ((v9 & 1) != 0)
        v33 = objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SARSearchResultTableViewCell, "accessibilityIdentifier"));
      else
        v33 = objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell identifier](SARSearchResultTableViewCell, "identifier"));
      v35 = (void *)v33;
      v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v33, v7));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource searchAlongTheRouteCellDelegate](self, "searchAlongTheRouteCellDelegate"));
      -[UITableViewCell setDelegate:](v19, "setDelegate:", v36);

      goto LABEL_41;
    }
    if (-[SearchResultsDataSource isSimpleSearchResults](self, "isSimpleSearchResults"))
    {
      v34 = SimpleSearchResultTableViewCell;
    }
    else
    {
      v34 = SearchResultTableViewCell;
      if ((v9 & 1) != 0)
      {
        v37 = objc_claimAutoreleasedReturnValue(+[_SearchResultTableViewCell accessibilityIdentifier](SearchResultTableViewCell, "accessibilityIdentifier"));
LABEL_40:
        v35 = (void *)v37;
        v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v37, v7));
LABEL_41:

        -[UITableViewCell setPlaceContextViewModelDelegate:](v19, "setPlaceContextViewModelDelegate:", self);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeContextViewModelWithMapItem:](self, "placeContextViewModelWithMapItem:", v38));
        -[UITableViewCell setPlaceContextViewModel:](v19, "setPlaceContextViewModel:", v39);

        -[UITableViewCell setDisplayDistanceIfValidCurrentLocation:](v19, "setDisplayDistanceIfValidCurrentLocation:", -[SearchResultsDataSource displayDistance](self, "displayDistance"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
        -[UITableViewCell setCurrentLocation:](v19, "setCurrentLocation:", v40);

        -[UITableViewCell setDisplaysAsChainResult:](v19, "setDisplaysAsChainResult:", -[SearchResultsDataSource displaysAsChainResult](self, "displaysAsChainResult"));
        -[UITableViewCell setPrefersAddressOverCategory:](v19, "setPrefersAddressOverCategory:", -[SearchResultsDataSource prefersAddressOverCategory](self, "prefersAddressOverCategory"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource searchCategory](self, "searchCategory"));
        -[UITableViewCell setSearchCategory:](v19, "setSearchCategory:", v41);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mapItem"));
        -[UITableViewCell setMapItem:](v19, "setMapItem:", v17);
        goto LABEL_8;
      }
    }
    v37 = objc_claimAutoreleasedReturnValue(-[__objc2_class identifier](v34, "identifier"));
    goto LABEL_40;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "address"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
  v19 = (UITableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v18, v7));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForAddressBookAddress:](TwoLinesContentViewModelComposer, "cellModelForAddressBookAddress:", v17));
  -[UITableViewCell setViewModel:](v19, "setViewModel:", v20);

LABEL_8:
LABEL_52:

  return v19;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return !-[SearchResultsDataSource isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults", a3, a4);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(SearchResult);
  v6 = objc_opt_isKindOfClass(v4, v5) & 1;

  return v6;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5));
  v8 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
LABEL_9:
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v6));
    goto LABEL_10;
  }
  v9 = v7;
  if (!MapsFeature_IsEnabled_SearchAndDiscovery(v9)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollection")), v10, !v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
    v12 = objc_msgSend(v11, "_hasHikeInfo");

    if ((v12 & 1) == 0)
    {
      if (objc_msgSend(v9, "type") != 11)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
        v17 = v14;
        v15 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

        v6 = (void *)v15;
      }

      goto LABEL_9;
    }
  }

  v13 = 0;
LABEL_10:

  return v13;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", a4));
  v5 = objc_opt_class(SearchResult);
  v6 = (objc_opt_isKindOfClass(v4, v5) & 1) == 0 || objc_msgSend(v4, "type") != 11;

  return v6;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedItem"));
  v8 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0
    && (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForCell:", v7))) != 0)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v10));
    objc_msgSend(v11, "dataSource:itemFocused:", self, v12);

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
  uint64_t v9;
  id v10;
  SearchSessionAnalytics *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  -[SearchResultsDataSource resetMapServiceTicket](self, "resetMapServiceTicket");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = v8;
    if (objc_msgSend(v10, "type") != 11)
    {
      v11 = objc_alloc_init(SearchSessionAnalytics);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeCollection"));
      if (v12)
      {
        -[SearchSessionAnalytics setAction:](v11, "setAction:", 2099);
        -[SearchSessionAnalytics setTarget:](v11, "setTarget:", 101);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionIdentifier"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "muid")));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publisher"));
        v26 = v6;
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "publisher"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v16, "muid")));
          v28 = v17;
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));

        }
        else
        {
          v25 = 0;
        }

        v24 = -[SearchSessionAnalytics action](v11, "action");
        v23 = -[SearchSessionAnalytics target](v11, "target");
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "row")));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v19, "resultProviderID")));
        +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", v24, v23, 0, v25, 0, v27, 0, 0, v18, 0, 0, 0, 0, v20, 0,
          0);

        v6 = v26;
      }
      else
      {
        -[SearchSessionAnalytics setAction:](v11, "setAction:", 2007);
        -[SearchSessionAnalytics setTarget:](v11, "setTarget:", 101);
        -[DataSource sendAnalyticsForDataAtIndexPath:object:action:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:action:populateSearchTapEvent:", v7, v10, -[SearchSessionAnalytics action](v11, "action"), 1);
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
      objc_msgSend(v21, "collectSearchSessionAnalytics:", v11);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v22, "dataSource:itemTapped:", self, v10);

      objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
    }

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  unsigned __int8 v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;

  v6 = a3;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v7));
  v9 = objc_msgSend(v8, "type");
  if ((_DWORD)v9 == 11 && (MapsFeature_IsEnabled_SearchAndDiscovery(v9) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedSection"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedSection"));
      v16 = objc_msgSend(v15, "sectionType");

      if (v16 == (id)1)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relatedSection"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "relatedPlaceCollections"));
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          v13 = RelatedCollectionsSectionTableViewCell;
          goto LABEL_35;
        }
        v24 = 0.0;
        goto LABEL_36;
      }
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchSection"));

      if (v28)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchSection"));
        v29 = objc_msgSend(v22, "sectionType");
        if (v29 == (id)2)
        {
          if (!MapsFeature_IsEnabled_SearchAndDiscovery(2))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sectionGuide"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "placeCollections"));
            v38 = objc_msgSend(v37, "count");

            if (v38)
            {
              v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "sectionGuide"));
              v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "placeCollections"));
              +[RelatedCollectionsSectionTableViewCell cellHeightWithCollectionsCount:](RelatedCollectionsSectionTableViewCell, "cellHeightWithCollectionsCount:", objc_msgSend(v40, "count"));
              v24 = v41;

            }
            else
            {
              v24 = 0.0;
            }
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        if (!v29)
        {
          +[RelatedSectionTableViewCell cellHeight](RelatedSectionTableViewCell, "cellHeight");
          v24 = v30;
          goto LABEL_16;
        }

      }
    }
    v13 = RelatedSectionTableViewCell;
    goto LABEL_35;
  }
  v10 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personalizedCompoundItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "address"));
    if (v12)
    {

LABEL_7:
      v13 = TwoLinesTableViewCell;
LABEL_35:
      -[__objc2_class cellHeight](v13, "cellHeight");
      v24 = v42;
      goto LABEL_36;
    }
    v20 = -[SearchResultsDataSource displaysAsChainResult](self, "displaysAsChainResult");

    if (v20)
      goto LABEL_7;
  }
  else if (-[SearchResultsDataSource displaysAsChainResult](self, "displaysAsChainResult"))
  {
    goto LABEL_7;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeCollection"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedGuideCellViewModelForSearchResult:indexPath:](self, "curatedGuideCellViewModelForSearchResult:indexPath:", v8, v7));
    objc_msgSend(v6, "bounds");
    objc_msgSend(v22, "setWidth:", v23);
LABEL_15:
    v24 = UITableViewAutomaticDimension;
LABEL_16:

    goto LABEL_36;
  }
  if (-[SearchResultsDataSource usePlaceSummary](self, "usePlaceSummary"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateForSearchResult:indexPath:](self, "placeSummaryTemplateForSearchResult:indexPath:", v8, v7));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v26, "bounds");
    objc_msgSend(v25, "setContainerWidth:", v27);

    v24 = UITableViewAutomaticDimension;
  }
  else
  {
    if (-[SearchResultsDataSource isSimpleSearchResults](self, "isSimpleSearchResults"))
    {
      v24 = UITableViewAutomaticDimension;
      goto LABEL_36;
    }
    +[_SearchResultTableViewCell cellHeight](SearchResultTableViewCell, "cellHeight");
    v24 = v31;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
    v32 = objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeContextViewModelWithMapItem:](self, "placeContextViewModelWithMapItem:", v25));
    if (v32)
    {
      v33 = (void *)v32;
      v34 = +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled");

      if ((v34 & 1) != 0)
        goto LABEL_36;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
      objc_msgSend(v25, "displayScale");
      +[_SearchResultTableViewCell placeContextHeightWithDisplayScale:](SearchResultTableViewCell, "placeContextHeightWithDisplayScale:");
      v24 = v24 + v35;
    }
  }

LABEL_36:
  return v24;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  __objc2_class *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  double v30;

  v5 = a4;
  if (!-[SearchResultsDataSource isSimpleSearchResults](self, "isSimpleSearchResults"))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v5));
    if (objc_msgSend(v7, "type") == 11)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relatedSection"));

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relatedSection"));
        v10 = objc_msgSend(v9, "sectionType");

        if (v10 == (id)1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "relatedSection"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relatedPlaceCollections"));
          v13 = objc_msgSend(v12, "count");

          if (!v13)
          {
            v6 = 0.0;
LABEL_27:

            goto LABEL_28;
          }
          v14 = RelatedCollectionsSectionTableViewCell;
          goto LABEL_25;
        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchSection"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchSection"));
          v22 = objc_msgSend(v21, "sectionType");
          if (v22 == (id)2)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sectionGuide"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "placeCollections"));
            v27 = objc_msgSend(v26, "count");

            if (v27)
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sectionGuide"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "placeCollections"));
              +[RelatedCollectionsSectionTableViewCell cellHeightWithCollectionsCount:](RelatedCollectionsSectionTableViewCell, "cellHeightWithCollectionsCount:", objc_msgSend(v29, "count"));
              v6 = v30;

            }
            else
            {
              v6 = 0.0;
            }
          }
          else
          {
            if (v22)
            {

              goto LABEL_24;
            }
            +[RelatedSectionTableViewCell cellHeight](RelatedSectionTableViewCell, "cellHeight");
            v6 = v23;
          }

          goto LABEL_27;
        }
      }
LABEL_24:
      v14 = RelatedSectionTableViewCell;
LABEL_25:
      -[__objc2_class cellHeight](v14, "cellHeight");
      goto LABEL_26;
    }
    v15 = objc_opt_class(SearchResult);
    if ((objc_opt_isKindOfClass(v7, v15) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "personalizedCompoundItem"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "address"));

      if (v17)
      {
        v18 = TwoLinesTableViewCell;
LABEL_19:
        -[__objc2_class estimatedCellHeight](v18, "estimatedCellHeight");
        goto LABEL_26;
      }
    }
    if (-[SearchResultsDataSource usePlaceSummary](self, "usePlaceSummary"))
    {
      +[PlaceSummaryTableViewCell searchResultEstimatedHeight](_TtC4Maps25PlaceSummaryTableViewCell, "searchResultEstimatedHeight");
    }
    else
    {
      v24 = -[SearchResultsDataSource displaysAsChainResult](self, "displaysAsChainResult");
      v18 = SearchResultTableViewCell;
      if (!v24)
        goto LABEL_19;
      +[_SearchResultTableViewCell estimatedTwoLinesCellHeight](SearchResultTableViewCell, "estimatedTwoLinesCellHeight");
    }
LABEL_26:
    v6 = v19;
    goto LABEL_27;
  }
  v6 = UITableViewAutomaticDimension;
LABEL_28:

  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  void *v6;
  char *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content", a3));
  v7 = (char *)objc_msgSend(v6, "numberOfSections") - 1;

  return v7 != (char *)a4 || self->_enableStructuredRAPAffordance;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  void *v6;
  void *v7;
  BOOL v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource indexPathForRelatedCollectionSection](self, "indexPathForRelatedCollectionSection", a3));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource indexPathForRelatedCollectionSection](self, "indexPathForRelatedCollectionSection"));
    v8 = objc_msgSend(v7, "section") == (id)a4;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)visibleImpressionElements
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (!MapsFeature_IsEnabled_SearchResultsImpressions(self, a2))
    return &__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView", (_QWORD)v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForCell:", v11));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource impressionElementForSearchResult:indexPath:](self, "impressionElementForSearchResult:indexPath:", v14, v13));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
          objc_msgSend(v16, "rectForRowAtIndexPath:", v13);
          objc_msgSend(v15, "setFrame:");

          objc_msgSend(v5, "addObject:", v15);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = objc_msgSend(v5, "copy");
  return v17;
}

- (NSDictionary)itemCountInVenue
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  __objc2_class_ro **p_info;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSourceContent objects](self->_content, "objects"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    p_info = MapsScrollableStackView.info;
    v24 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      v25 = v5;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(p_info + 256);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v27 = v11;
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueAreaIdentifiers"));
          v13 = (void *)v12;
          v14 = &__NSArray0__struct;
          if (v12)
            v14 = (void *)v12;
          v15 = v14;

          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(_QWORD *)v29 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
                v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v20, v24));
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v21, "unsignedIntegerValue") + 1));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v22, v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v17);
          }

          v6 = v24;
          v5 = v25;
          p_info = (__objc2_class_ro **)(MapsScrollableStackView + 32);
        }
        v8 = (char *)v8 + 1;
      }
      while (v8 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  return (NSDictionary *)v3;
}

- (void)buildAndCacheCuratedGuideViewModels
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCacheGuideSummary", ", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005BFA20;
  v7[3] = &unk_1011BCA10;
  v7[4] = self;
  -[SearchResultsDataSource iterateThroughIndexPathsAndExecuteBlock:](self, "iterateThroughIndexPathsAndExecuteBlock:", v7);
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCacheGuideSummary", ", buf, 2u);
  }

}

- (id)curatedGuideCellViewModelForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps21CuratedGuideViewModel *v8;
  void *v9;
  _TtC4Maps21CuratedGuideViewModel *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (_TtC4Maps21CuratedGuideViewModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollection"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedGuideViewModels](self, "curatedGuideViewModels"));
    v8 = (_TtC4Maps21CuratedGuideViewModel *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    if (!v8)
    {
      v10 = [_TtC4Maps21CuratedGuideViewModel alloc];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollection"));
      v12 = -[SearchResultsDataSource guideSummaryUsesRichLayout](self, "guideSummaryUsesRichLayout")
         || -[SearchResultsDataSource placeSummaryUsesRichLayout](self, "placeSummaryUsesRichLayout");
      v8 = -[CuratedGuideViewModel initWithPlaceCollection:useRichLayout:](v10, "initWithPlaceCollection:useRichLayout:", v11, v12);

      -[SearchResultsDataSource addMetricsForGuideSummaryViewModel:atIndexPath:](self, "addMetricsForGuideSummaryViewModel:atIndexPath:", v8, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedGuideViewModels](self, "curatedGuideViewModels"));
      objc_msgSend(v13, "setObject:forKey:", v8, v7);

    }
  }

  return v8;
}

- (void)addMetricsForGuideSummaryViewModel:(id)a3 atIndexPath:(id)a4
{
  id v6;
  _TtC4Maps19GuideSummaryMetrics *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  _TtC4Maps19GuideSummaryMetrics *v17;
  void *v18;
  id v19;
  unsigned int v20;
  unsigned int v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v6))
  {
    if (-[SearchResultsDataSource guideSummaryUsesRichLayout](self, "guideSummaryUsesRichLayout")
      || -[SearchResultsDataSource placeSummaryUsesRichLayout](self, "placeSummaryUsesRichLayout"))
    {
      v7 = [_TtC4Maps19GuideSummaryMetrics alloc];
      v8 = 19.0;
      v9 = 19.0;
      v10 = 8.0;
      v11 = 8.0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
      v19 = objc_msgSend(v18, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

      v20 = -[SearchResultsDataSource _showTopRoundedCorners:rows:](self, "_showTopRoundedCorners:rows:", v6, v19);
      v21 = -[SearchResultsDataSource _showBottomRoundedCorners:rows:](self, "_showBottomRoundedCorners:rows:", v6, v19);
      v7 = [_TtC4Maps19GuideSummaryMetrics alloc];
      if (!v20 || !v21)
      {
        if (v20)
        {
          v16 = v21 ^ 1;
          v8 = 16.0;
          v9 = 16.0;
          v10 = 16.0;
          v11 = 0.0;
          v12 = 10.0;
          v13 = 10.0;
          v14 = 0.0;
          v15 = 0.0;
          goto LABEL_7;
        }
        v8 = 16.0;
        v9 = 16.0;
        v10 = 0.0;
        if (!v21)
        {
          v11 = 0.0;
          v12 = 0.0;
          v13 = 0.0;
          v14 = 0.0;
          v15 = 0.0;
          v16 = 1;
          goto LABEL_7;
        }
        v11 = 16.0;
        v12 = 0.0;
        v13 = 0.0;
        v14 = 10.0;
        v15 = 16.0;
LABEL_6:
        v16 = 0;
LABEL_7:
        v17 = -[GuideSummaryMetrics initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:](v7, "initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:", v16, v8, v9, v10, v11, v12, v13, v14, v15);
        objc_msgSend(v22, "setMetrics:", v17);

        goto LABEL_8;
      }
      v8 = 16.0;
      v9 = 16.0;
      v10 = 16.0;
      v11 = 0.0;
    }
    v12 = 10.0;
    v13 = 10.0;
    v14 = 10.0;
    v15 = 10.0;
    goto LABEL_6;
  }
LABEL_8:

}

- (BOOL)usePlaceSummaryForSearchResult:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[SearchResultsDataSource usePlaceSummary](self, "usePlaceSummary"))
    v5 = objc_msgSend(v4, "usePlaceSummaryInSearch");
  else
    v5 = 0;

  return v5;
}

- (id)placeSummaryTemplateForSearchResult:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (-[SearchResultsDataSource usePlaceSummaryForSearchResult:](self, "usePlaceSummaryForSearchResult:", v6))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v7));

    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(v6, "setRepresentsIntermediateStop:", -[SearchResultsDataSource isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryMetadata](self, "placeSummaryMetadata"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));
      v10 = (id)objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:metadata:currentLocation:searchAlongRoute:openAt:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithSearchResult:metadata:currentLocation:searchAlongRoute:openAt:", v6, v11, v12, -[SearchResultsDataSource isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"), self->_openAt));

      -[SearchResultsDataSource addMetricsForPlaceSummaryTemplate:indexPath:](self, "addMetricsForPlaceSummaryTemplate:indexPath:", v10, v7);
      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
        objc_msgSend(v13, "setObject:forKey:", v10, v7);

        v14 = v10;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addMetricsForPlaceSummaryTemplate:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  _TtC4Maps19PlaceSummaryMetrics *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  double v24;
  _TtC4Maps19PlaceSummaryMetrics *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v8 = sub_1002A8AA0(v7);

    if (v8 == 5)
    {
      if (self->_isShowingClusterResults)
        v9 = 0.0;
      else
        v9 = 16.0;
      v10 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      v11 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      v16 = 0.0;
      v17 = v9;
      v18 = v9;
      goto LABEL_7;
    }
    if (-[SearchResultsDataSource placeSummaryUsesRichLayout](self, "placeSummaryUsesRichLayout"))
    {
      if (!objc_msgSend(v6, "item"))
      {
        if (objc_msgSend(v6, "section"))
          v24 = 8.0;
        else
          v24 = 0.0;
        v10 = [_TtC4Maps19PlaceSummaryMetrics alloc];
        v11 = 16.0;
        v12 = 16.0;
        v18 = 8.0;
        v13 = 10.0;
        v14 = 10.0;
        v15 = 10.0;
        v16 = 10.0;
        v17 = v24;
        goto LABEL_22;
      }
      v10 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      v11 = 16.0;
      v12 = 16.0;
      v17 = 8.0;
      v18 = 8.0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
      v21 = objc_msgSend(v20, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

      v22 = -[SearchResultsDataSource _showTopRoundedCorners:rows:](self, "_showTopRoundedCorners:rows:", v6, v21);
      v23 = -[SearchResultsDataSource _showBottomRoundedCorners:rows:](self, "_showBottomRoundedCorners:rows:", v6, v21);
      v10 = [_TtC4Maps19PlaceSummaryMetrics alloc];
      if (!v22 || !v23)
      {
        if (v22)
        {
          v19 = v23 ^ 1;
          v11 = 16.0;
          v12 = 16.0;
          v17 = 0.0;
          v18 = 0.0;
          v13 = 10.0;
          v14 = 10.0;
          v15 = 0.0;
          v16 = 0.0;
          goto LABEL_23;
        }
        v11 = 16.0;
        v12 = 16.0;
        v17 = 0.0;
        if (!v23)
        {
          v18 = 0.0;
          v13 = 0.0;
          v14 = 0.0;
          v15 = 0.0;
          v16 = 0.0;
LABEL_7:
          v19 = 1;
LABEL_23:
          v25 = -[PlaceSummaryMetrics initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:](v10, "initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:", v19, v11, v12, v17, v18, v13, v14, v15, v16);
          objc_msgSend(v26, "setMetrics:", v25);

          goto LABEL_24;
        }
        v18 = 16.0;
        v13 = 0.0;
        v14 = 0.0;
        goto LABEL_15;
      }
      v11 = 16.0;
      v12 = 16.0;
      v17 = 0.0;
      v18 = 0.0;
    }
    v13 = 10.0;
    v14 = 10.0;
LABEL_15:
    v15 = 10.0;
    v16 = 10.0;
LABEL_22:
    v19 = 0;
    goto LABEL_23;
  }
LABEL_24:

}

- (BOOL)_showTopRoundedCorners:(id)a3 rows:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleForHeaderInSection:", objc_msgSend(v5, "section")));

  if (v7)
    v8 = objc_msgSend(v7, "length") != 0;
  else
    v8 = 0;
  if (objc_msgSend(v5, "item"))
  {
    v8 = 0;
  }
  else if (!objc_msgSend(v5, "section"))
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_showBottomRoundedCorners:(id)a3 rows:(int64_t)a4
{
  id v6;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  BOOL v12;
  char *v13;
  void *v14;
  char *v15;
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = (char *)objc_msgSend(v6, "section") + 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v9 = (char *)objc_msgSend(v8, "numberOfSections");

  if ((uint64_t)v7 >= (uint64_t)v9)
  {
    v12 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleForHeaderInSection:", v7));

    if (v11)
      v12 = objc_msgSend(v11, "length") != 0;
    else
      v12 = 0;

  }
  v13 = (char *)objc_msgSend(v6, "section");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v15 = (char *)objc_msgSend(v14, "numberOfSections");

  v16 = objc_msgSend(v6, "item");
  v17 = v13 == v15 - 1 || v12;
  return v16 == (id)(a4 - 1) && v17;
}

- (void)cachePlaceSummaryTemplates
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCachePlaceSummary", ", buf, 2u);
  }

  if (-[SearchResultsDataSource usePlaceSummary](self, "usePlaceSummary"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1005C04AC;
    v7[3] = &unk_1011BCA10;
    v7[4] = self;
    -[SearchResultsDataSource iterateThroughIndexPathsAndExecuteBlock:](self, "iterateThroughIndexPathsAndExecuteBlock:", v7);
    -[SearchResultsDataSource notifyDelegateDidCachePlaceSummaryTemplates](self, "notifyDelegateDidCachePlaceSummaryTemplates");
    v5 = sub_10043222C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SearchResultsCachePlaceSummary", ", buf, 2u);
    }

  }
  else
  {
    -[SearchResultsDataSource notifyDelegateDidCachePlaceSummaryTemplates](self, "notifyDelegateDidCachePlaceSummaryTemplates");
  }
}

- (void)notifyDelegateDidCachePlaceSummaryTemplates
{
  void *v3;
  char v4;
  id v5;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "didCachePlaceSummaryTemplates");

  if ((v4 & 1) != 0)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v5, "didCachePlaceSummaryTemplates");

    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1005C06FC;
      block[3] = &unk_1011AC860;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (id)placeSummaryTemplateAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource placeSummaryTemplateViewModels](self, "placeSummaryTemplateViewModels"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
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

- (void)locationDidUpdate
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource currentLocation](self, "currentLocation"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1005C08DC;
    v4[3] = &unk_1011BCA10;
    v4[4] = self;
    -[SearchResultsDataSource iterateThroughIndexPathsAndExecuteBlock:](self, "iterateThroughIndexPathsAndExecuteBlock:", v4);
  }
}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SearchSessionAnalytics *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v17));
  v8 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource shareDelegate](self, "shareDelegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unknownContact"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v9, v11, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v17));
    objc_msgSend(v10, "shareItem:sourceView:completion:", v12, v14, v6);

    -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v17, v9, 2008);
    v15 = objc_alloc_init(SearchSessionAnalytics);
    -[SearchSessionAnalytics setAction:](v15, "setAction:", 2008);
    -[SearchSessionAnalytics setTarget:](v15, "setTarget:", 101);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
    objc_msgSend(v16, "collectSearchSessionAnalytics:", v15);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (ErrorModeView)structuredRAPAffordance
{
  ErrorModeView *structuredRAPAffordance;
  ErrorModeView *v5;
  ErrorModeView *v6;
  ErrorModeView *v7;
  void *v8;
  void *v9;
  ErrorModeView *v10;
  void *v11;
  void *v12;
  ErrorModeView *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  structuredRAPAffordance = self->_structuredRAPAffordance;
  if (structuredRAPAffordance)
    return structuredRAPAffordance;
  v5 = objc_alloc_init(ErrorModeView);
  v6 = self->_structuredRAPAffordance;
  self->_structuredRAPAffordance = v5;

  -[ErrorModeView setSpacing:](self->_structuredRAPAffordance, "setSpacing:", 0.0);
  v7 = self->_structuredRAPAffordance;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Something Missing?"), CFSTR("localized string not found"), 0));
  -[ErrorModeView setTitle:andMessage:](v7, "setTitle:andMessage:", v9, 0);

  objc_initWeak(&location, self);
  v10 = self->_structuredRAPAffordance;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Add a Missing Place"), CFSTR("localized string not found"), 0));
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_1005C0D8C;
  v17 = &unk_1011B4EB8;
  objc_copyWeak(&v18, &location);
  -[ErrorModeView setButtonTitle:handler:](v10, "setButtonTitle:handler:", v12, &v14);

  -[ErrorModeView setTopPadding:](self->_structuredRAPAffordance, "setTopPadding:", 26.0, v14, v15, v16, v17);
  -[SearchResultsDataSource adjustRAPAffordanceFrameWithTopPadding:](self, "adjustRAPAffordanceFrameWithTopPadding:", 26.0);
  v13 = self->_structuredRAPAffordance;
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v13;
}

- (void)adjustRAPAffordanceFrameWithTopPadding:(double)a3
{
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v8, "frame");
  v6 = v5;
  -[ErrorModeView fittingHeight](self->_structuredRAPAffordance, "fittingHeight");
  -[ErrorModeView setFrame:](self->_structuredRAPAffordance, "setFrame:", 0.0, 0.0, v6, v7 + a3);

}

- (void)setEnableStructuredRAPAffordance:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_enableStructuredRAPAffordance = a3;
  if (a3)
    v6 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource structuredRAPAffordance](self, "structuredRAPAffordance"));
  else
    v6 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v5, "setTableFooterView:", v6);

  if (v3)
}

- (id)placeContextViewModelWithMapItem:(id)a3
{
  id v4;
  PlaceContextViewModel *v5;
  uint64_t v6;

  v4 = a3;
  if (-[SearchResultsDataSource displaysAsChainResult](self, "displaysAsChainResult")
    || -[SearchResultsDataSource isPresentingVenueClusterResults](self, "isPresentingVenueClusterResults"))
  {
    v5 = 0;
  }
  else
  {
    if (-[SearchResultsDataSource isPresentingSearchAlongTheRouteResults](self, "isPresentingSearchAlongTheRouteResults"))
    {
      v6 = 2;
    }
    else
    {
      v6 = 0;
    }
    v5 = -[PlaceContextViewModel initWithMapItem:context:]([PlaceContextViewModel alloc], "initWithMapItem:context:", v4, v6);
  }

  return v5;
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "searchDataSource:didTapOnPlaceContextWithViewModel:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "searchDataSource:didTapOnPlaceContextWithViewModel:", self, v6);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForCell:", v7));

  if (objc_msgSend(v6, "type") == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionIdentifier"));
    v16 = objc_msgSend(v15, "muid");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v18 = objc_msgSend(v17, "collectionIsSaved:", v14);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
    objc_msgSend(v19, "placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:", v16, v18, objc_msgSend(v12, "row"));

  }
  else if (objc_msgSend(v6, "type") == (id)2)
  {
    v32 = v12;
    v20 = objc_alloc((Class)NSMutableArray);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v22 = objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCollections"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "collectionIdentifier", v32));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v28, "muid")));
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v25);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
    v31 = objc_msgSend(v22, "copy");
    v12 = v32;
    objc_msgSend(v30, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v31, objc_msgSend(v32, "row"));

  }
}

- (void)didTapOnUserGeneratedGuide:(id)a3 cell:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "didTapOnUserGeneratedGuide:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v7, "didTapOnUserGeneratedGuide:", v8);

  }
}

- (void)didTapOnCuratedGuide:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "didTapOnCuratedGuide:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v9, "didTapOnCuratedGuide:", v17);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForCell:", v6));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionIdentifier"));
  v13 = objc_msgSend(v12, "muid");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v15 = objc_msgSend(v14, "collectionIsSaved:", v17);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
  objc_msgSend(v16, "placeContextSingleCollectionTappedWithMuid:isCurrentlySaved:verticalIndex:", v13, v15, objc_msgSend(v11, "row"));

}

- (void)didTapOnCuratedGuides:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "didTapOnCuratedGuides:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v10, "didTapOnCuratedGuides:", v6);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v23 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexPathForCell:", v7));

  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v18), "collectionIdentifier"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v19, "muid")));
        objc_msgSend(v13, "addObject:", v20);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
  v22 = objc_msgSend(v13, "copy");
  objc_msgSend(v21, "placeContextMultipleCollectionsTappedWithMuids:verticalIndex:", v22, objc_msgSend(v12, "row"));

}

- (void)didTapOnAccessoryEntityDirectionsWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnDirectionsWithSearchResult:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v10, "didTapOnDirectionsWithSearchResult:", v6);

    }
  }

}

- (void)didTapOnAccessoryEntityLookAroundWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnLookAroundWithSearchResult:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v10, "didTapOnLookAroundWithSearchResult:", v6);

    }
  }

}

- (void)didTapOnAccessoryEntityCallWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnCallWithSearchResult:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v10, "didTapOnCallWithSearchResult:", v6);

    }
  }

}

- (void)didTapOnAccessoryEntityWebsiteWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnWebsiteWithSearchResult:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v10, "didTapOnWebsiteWithSearchResult:", v6);

    }
  }

}

- (void)didTapOnAccessoryEntityFlyoverWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnFlyoverWithSearchResult:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v10, "didTapOnFlyoverWithSearchResult:", v6);

    }
  }

}

- (void)didTapOnContainmentParentMapItem:(id)a3 cell:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "didTapOnContainmentParentMapItem:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v7, "didTapOnContainmentParentMapItem:", v8);

  }
}

- (void)didTapOnTappableEntryWithMapItemIdentifier:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id location;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SearchResultsDataSource resetMapServiceTicket](self, "resetMapServiceTicket");
  v8 = objc_msgSend(objc_alloc((Class)MKMapItemIdentifier), "initWithGEOMapItemIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v16 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForIdentifiers:traits:", v10, 0));
  -[SearchResultsDataSource setMapServiceTicket:](self, "setMapServiceTicket:", v11);

  objc_initWeak(&location, self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource mapServiceTicket](self, "mapServiceTicket"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005C1C94;
  v13[3] = &unk_1011AD9D0;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v12, "submitWithHandler:networkActivity:", v13, 0);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (id)personalizedItemForQuickActionMenuWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SearchResultMapItem *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v8 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = -[SearchResultMapItemBase initWithSearchResult:]([SearchResultMapItem alloc], "initWithSearchResult:", v7);
  else
    v9 = 0;

  return v9;
}

- (void)didTapOnAddStop:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v14));
  v7 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "didTapOnAddStopWithSearchResult:atIndexPath:");

    if ((v9 & 1) != 0)
    {
      v10 = v6;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v11, "didTapOnAddStopWithSearchResult:atIndexPath:", v10, v14);

LABEL_6:
      goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    v13 = objc_opt_respondsToSelector(v12, "didTapOnAddStopAtIndex:");

    if ((v13 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v11, "didTapOnAddStopAtIndex:", objc_msgSend(v14, "row"));
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)didTapOnUserLibrary:(id)a3 mapItem:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "didTapOnUserLibraryMapItem:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v7, "didTapOnUserLibraryMapItem:", v8);

  }
}

- (void)didTapOnPhotoCarousel:(id)a3 photoIndex:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  SearchSessionAnalytics *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13));
  v8 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = objc_alloc_init(SearchSessionAnalytics);
    -[SearchSessionAnalytics setAction:](v10, "setAction:", 2007);
    -[SearchSessionAnalytics setTarget:](v10, "setTarget:", 101);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
    objc_msgSend(v11, "collectSearchSessionAnalytics:", v10);

    -[DataSource sendAnalyticsForDataAtIndexPath:object:action:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:action:populateSearchTapEvent:", v13, v9, -[SearchSessionAnalytics action](v10, "action"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v12, "dataSource:itemTapped:", self, v9);

  }
}

- (void)resetMapServiceTicket
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource mapServiceTicket](self, "mapServiceTicket"));
  objc_msgSend(v3, "cancel");

  -[SearchResultsDataSource setMapServiceTicket:](self, "setMapServiceTicket:", 0);
}

- (void)relatedSectionTableViewCellDidScrollForward
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource indexPathForRelatedCollectionSection](self, "indexPathForRelatedCollectionSection"));
  objc_msgSend(v4, "carouselScrolledForwardAtVerticalIndex:", objc_msgSend(v3, "row"));

}

- (void)relatedSectionTableViewCellDidScrollBackward
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource indexPathForRelatedCollectionSection](self, "indexPathForRelatedCollectionSection"));
  objc_msgSend(v4, "carouselScrolledBackwardAtVerticalIndex:", objc_msgSend(v3, "row"));

}

- (void)relatedSectionTappedOnCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource curatedCollectionsAnalyticsManager](self, "curatedCollectionsAnalyticsManager"));
  v9 = objc_msgSend(v8, "muid");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource indexPathForRelatedCollectionSection](self, "indexPathForRelatedCollectionSection"));
  objc_msgSend(v11, "carouselCollectionTappedWithMuid:verticalIndex:horizontalIndex:isCurrentlySaved:", v9, objc_msgSend(v10, "row"), a4, v5);

}

- (void)relatedSectionRouteToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource collectionCarouselRoutingDelegate](self, "collectionCarouselRoutingDelegate"));
  objc_msgSend(v5, "routeToCuratedCollection:", v4);

}

- (NSIndexPath)indexPathForRelatedCollectionSection
{
  NSIndexPath *indexPathForRelatedCollectionSection;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSIndexPath *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSIndexPath *v16;
  void *v17;
  id v18;

  indexPathForRelatedCollectionSection = self->_indexPathForRelatedCollectionSection;
  if (!indexPathForRelatedCollectionSection)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
    v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

    if (v5 < 1)
      goto LABEL_13;
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
      v8 = (uint64_t)objc_msgSend(v7, "numberOfRowsInSection:", v6);

      if (v8 < 1)
        goto LABEL_12;
      v9 = 0;
      while (1)
      {
        v10 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, v6));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexPath:", v10));

        if (objc_msgSend(v12, "type") == 11)
          break;
LABEL_9:

        ++v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
        v15 = objc_msgSend(v14, "numberOfRowsInSection:", v6);

        if (v9 >= (uint64_t)v15)
          goto LABEL_12;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchSection"));
      if (objc_msgSend(v13, "sectionType") != (id)2)
        break;
      v16 = self->_indexPathForRelatedCollectionSection;
      self->_indexPathForRelatedCollectionSection = v10;

LABEL_12:
      ++v6;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataSource content](self, "content"));
      v18 = objc_msgSend(v17, "numberOfSections");

      if (v6 >= (uint64_t)v18)
      {
LABEL_13:
        indexPathForRelatedCollectionSection = self->_indexPathForRelatedCollectionSection;
        return indexPathForRelatedCollectionSection;
      }
    }

    goto LABEL_9;
  }
  return indexPathForRelatedCollectionSection;
}

- (BOOL)displaysAsChainResult
{
  return self->_displaysAsChainResult;
}

- (void)setDisplaysAsChainResult:(BOOL)a3
{
  self->_displaysAsChainResult = a3;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (void)setPrefersAddressOverCategory:(BOOL)a3
{
  self->_prefersAddressOverCategory = a3;
}

- (BOOL)usePlaceSummary
{
  return self->_usePlaceSummary;
}

- (void)setUsePlaceSummary:(BOOL)a3
{
  self->_usePlaceSummary = a3;
}

- (SearchResultsDataSourceContent)content
{
  return self->_content;
}

- (ShareDelegate)shareDelegate
{
  return (ShareDelegate *)objc_loadWeakRetained((id *)&self->_shareDelegate);
}

- (void)setShareDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shareDelegate, a3);
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (void)setSearchCategory:(id)a3
{
  objc_storeStrong((id *)&self->_searchCategory, a3);
}

- (BOOL)isPresentingSearchAlongTheRouteResults
{
  return self->_isPresentingSearchAlongTheRouteResults;
}

- (BOOL)isPresentingAddStopResultsFromWaypointEditor
{
  return self->_isPresentingAddStopResultsFromWaypointEditor;
}

- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3
{
  self->_isPresentingAddStopResultsFromWaypointEditor = a3;
}

- (SARSearchResultTableViewCellDelegate)searchAlongTheRouteCellDelegate
{
  return (SARSearchResultTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_searchAlongTheRouteCellDelegate);
}

- (MKCollectionCarouselRoutingDelegate)collectionCarouselRoutingDelegate
{
  return (MKCollectionCarouselRoutingDelegate *)objc_loadWeakRetained((id *)&self->_collectionCarouselRoutingDelegate);
}

- (void)setCollectionCarouselRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_collectionCarouselRoutingDelegate, a3);
}

- (BOOL)displayDistance
{
  return self->_displayDistance;
}

- (void)setDisplayDistance:(BOOL)a3
{
  self->_displayDistance = a3;
}

- (BOOL)isPresentingVenueClusterResults
{
  return self->_isPresentingVenueClusterResults;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIndexTitles, a3);
}

- (GEOLocation)approxLocation
{
  return self->_approxLocation;
}

- (void)setApproxLocation:(id)a3
{
  objc_storeStrong((id *)&self->_approxLocation, a3);
}

- (BOOL)isShowingClusterResults
{
  return self->_isShowingClusterResults;
}

- (void)setIsShowingClusterResults:(BOOL)a3
{
  self->_isShowingClusterResults = a3;
}

- (BOOL)isSimpleSearchResults
{
  return self->_isSimpleSearchResults;
}

- (void)setIsSimpleSearchResults:(BOOL)a3
{
  self->_isSimpleSearchResults = a3;
}

- (_TtC4Maps20PlaceSummaryMetadata)placeSummaryMetadata
{
  return self->_placeSummaryMetadata;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (NSString)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSUUID)impressionsSessionIdentifier
{
  return self->_impressionsSessionIdentifier;
}

- (void)setImpressionsSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_impressionsSessionIdentifier, a3);
}

- (SearchResultsCuratedCollectionsAnalyticsManager)curatedCollectionsAnalyticsManager
{
  return self->_curatedCollectionsAnalyticsManager;
}

- (void)setCuratedCollectionsAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_curatedCollectionsAnalyticsManager, a3);
}

- (void)setIndexPathForRelatedCollectionSection:(id)a3
{
  objc_storeStrong((id *)&self->_indexPathForRelatedCollectionSection, a3);
}

- (NSCache)placeSummaryTemplateViewModels
{
  return self->_placeSummaryTemplateViewModels;
}

- (void)setPlaceSummaryTemplateViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, a3);
}

- (NSCache)curatedGuideViewModels
{
  return self->_curatedGuideViewModels;
}

- (void)setCuratedGuideViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_curatedGuideViewModels, a3);
}

- (NSMutableDictionary)mapitemTemplates
{
  return self->_mapitemTemplates;
}

- (void)setMapitemTemplates:(id)a3
{
  objc_storeStrong((id *)&self->_mapitemTemplates, a3);
}

- (MKMapServiceTicket)mapServiceTicket
{
  return self->_mapServiceTicket;
}

- (void)setMapServiceTicket:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceTicket, a3);
}

- (void)setStructuredRAPAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_structuredRAPAffordance, a3);
}

- (NSMutableDictionary)impressionElements
{
  return self->_impressionElements;
}

- (void)setImpressionElements:(id)a3
{
  objc_storeStrong((id *)&self->_impressionElements, a3);
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

- (_TtC4Maps35CuratedGuideViewModelDataDownloader)curatedGuideDataDownloader
{
  return self->_curatedGuideDataDownloader;
}

- (void)setCuratedGuideDataDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_curatedGuideDataDownloader, a3);
}

- (BOOL)placeSummaryUsesRichLayout
{
  return self->_placeSummaryUsesRichLayout;
}

- (void)setPlaceSummaryUsesRichLayout:(BOOL)a3
{
  self->_placeSummaryUsesRichLayout = a3;
}

- (BOOL)guideSummaryUsesRichLayout
{
  return self->_guideSummaryUsesRichLayout;
}

- (void)setGuideSummaryUsesRichLayout:(BOOL)a3
{
  self->_guideSummaryUsesRichLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedGuideDataDownloader, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_placeSummaryAsyncDataManager, 0);
  objc_storeStrong((id *)&self->_impressionElements, 0);
  objc_storeStrong((id *)&self->_structuredRAPAffordance, 0);
  objc_storeStrong((id *)&self->_mapServiceTicket, 0);
  objc_storeStrong((id *)&self->_mapitemTemplates, 0);
  objc_storeStrong((id *)&self->_curatedGuideViewModels, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_indexPathForRelatedCollectionSection, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_impressionsSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_placeSummaryMetadata, 0);
  objc_storeStrong((id *)&self->_approxLocation, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_destroyWeak((id *)&self->_collectionCarouselRoutingDelegate);
  objc_destroyWeak((id *)&self->_searchAlongTheRouteCellDelegate);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_openAt, 0);
}

@end
