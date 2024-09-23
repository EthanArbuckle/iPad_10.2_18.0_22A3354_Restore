@implementation HomeOutlineSearchResultsSectionController

- (HomeOutlineSearchResultsSectionController)initWithConfiguration:(id)a3
{
  HomeOutlineSearchResultsSectionController *v3;
  SearchResultsDataProvider *v4;
  SearchResultsDataProvider *searchResultsDataProvider;
  void *v6;
  void *v7;
  CollectionsDataProvider *v8;
  CollectionsDataProvider *collectionsDataProvider;
  CurrentLocationDataProvider *v10;
  CurrentLocationDataProvider *currentLocationDataProvider;
  DistanceUnitDataProvider *v12;
  DistanceUnitDataProvider *distanceUnitDataProvider;
  _TtC4Maps28PlaceSummaryAsyncDataManager *v14;
  _TtC4Maps28PlaceSummaryAsyncDataManager *asyncDataManager;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *v16;
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;
  _TtC4Maps35CuratedGuideViewModelDataDownloader *v18;
  _TtC4Maps35CuratedGuideViewModelDataDownloader *curatedGuideDataDownloader;
  NSCache *v20;
  NSCache *placeSummaryTemplateViewModels;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)HomeOutlineSearchResultsSectionController;
  v3 = -[HomeOutlineSectionController initWithConfiguration:](&v23, "initWithConfiguration:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(SearchResultsDataProvider);
    searchResultsDataProvider = v3->_searchResultsDataProvider;
    v3->_searchResultsDataProvider = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](v3, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionCoordinator"));
    -[SearchResultsDataProvider setActionCoordinator:](v3->_searchResultsDataProvider, "setActionCoordinator:", v7);

    v8 = -[CollectionsDataProvider initWithContext:observeInfo:observeContents:]([CollectionsDataProvider alloc], "initWithContext:observeInfo:observeContents:", 0, 0, 1);
    collectionsDataProvider = v3->_collectionsDataProvider;
    v3->_collectionsDataProvider = v8;

    v10 = objc_alloc_init(CurrentLocationDataProvider);
    currentLocationDataProvider = v3->_currentLocationDataProvider;
    v3->_currentLocationDataProvider = v10;

    v12 = objc_alloc_init(DistanceUnitDataProvider);
    distanceUnitDataProvider = v3->_distanceUnitDataProvider;
    v3->_distanceUnitDataProvider = v12;

    v14 = objc_alloc_init(_TtC4Maps28PlaceSummaryAsyncDataManager);
    asyncDataManager = v3->_asyncDataManager;
    v3->_asyncDataManager = v14;

    v16 = objc_alloc_init(_TtC4Maps31PlaceSummaryEVChargerDownloader);
    evChargerDownloader = v3->_evChargerDownloader;
    v3->_evChargerDownloader = v16;

    v18 = objc_alloc_init(_TtC4Maps35CuratedGuideViewModelDataDownloader);
    curatedGuideDataDownloader = v3->_curatedGuideDataDownloader;
    v3->_curatedGuideDataDownloader = v18;

    v3->_usePlaceSummary = sub_1008974F8();
    v20 = (NSCache *)objc_alloc_init((Class)NSCache);
    placeSummaryTemplateViewModels = v3->_placeSummaryTemplateViewModels;
    v3->_placeSummaryTemplateViewModels = v20;

  }
  return v3;
}

- (void)dealloc
{
  NSCache *placeSummaryTemplateViewModels;
  NSCache *v4;
  objc_super v5;

  placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
  if (placeSummaryTemplateViewModels)
  {
    -[NSCache removeAllObjects](placeSummaryTemplateViewModels, "removeAllObjects");
    v4 = self->_placeSummaryTemplateViewModels;
    self->_placeSummaryTemplateViewModels = 0;

  }
  -[HomeOutlineSearchResultsSectionController resetEVChargerDownloader](self, "resetEVChargerDownloader");
  v5.receiver = self;
  v5.super_class = (Class)HomeOutlineSearchResultsSectionController;
  -[HomeOutlineSearchResultsSectionController dealloc](&v5, "dealloc");
}

- (void)resetEVChargerDownloader
{
  _TtC4Maps31PlaceSummaryEVChargerDownloader *evChargerDownloader;

  evChargerDownloader = self->_evChargerDownloader;
  self->_evChargerDownloader = 0;

}

- (NSArray)dataProviders
{
  CollectionsDataProvider *collectionsDataProvider;
  DistanceUnitDataProvider *distanceUnitDataProvider;
  _QWORD v5[4];

  collectionsDataProvider = self->_collectionsDataProvider;
  v5[0] = self->_searchResultsDataProvider;
  v5[1] = collectionsDataProvider;
  distanceUnitDataProvider = self->_distanceUnitDataProvider;
  v5[2] = self->_currentLocationDataProvider;
  v5[3] = distanceUnitDataProvider;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4));
}

- (void)_refreshEVChargers:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100221060;
  v3[3] = &unk_1011ACD00;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

- (MapsUIDiffableDataSourceViewModel)sectionHeaderViewModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SectionHeaderBasicOutlineCellModel *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Sidebar] Search Results"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchResults](self->_searchResultsDataProvider, "searchResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v5, "count")));

  v7 = -[SectionHeaderBasicOutlineCellModel initWithTitle:]([SectionHeaderBasicOutlineCellModel alloc], "initWithTitle:", v6);
  return (MapsUIDiffableDataSourceViewModel *)v7;
}

- (NSArray)itemSnapshots
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  void *v24;
  HomeSearchStatusOutlineCellModel *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  NSCache *placeSummaryTemplateViewModels;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  HomeSearchResultsFilterItem *v37;
  HomeSearchResultsFilterItem *searchResultsFilterItem;
  void *v39;
  HomeSearchResultsFilterItem *v40;
  void *v41;
  id v42;
  ReportASearchAutocompleteResult *v43;
  void *v44;
  void *v45;
  int64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  id v54;
  id v55;
  int64_t v56;
  _QWORD v57[5];
  HomeSearchStatusOutlineCellModel *v58;
  HomeSearchResultsFilterItem *v59;
  HomeSearchStatusOutlineCellModel *v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  NSObject *v64;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchInfo](self->_searchResultsDataProvider, "searchInfo"));
  if (!MapsFeature_IsEnabled_MapsWally()
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "autocompletePerson")), v4, !v4))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchResults](self->_searchResultsDataProvider, "searchResults"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider suggestions](self->_searchResultsDataProvider, "suggestions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider currentSuggestion](self->_searchResultsDataProvider, "currentSuggestion"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationDataProvider currentLocation](self->_currentLocationDataProvider, "currentLocation"));
    v46 = -[DistanceUnitDataProvider distanceUnit](self->_distanceUnitDataProvider, "distanceUnit");
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider relatedSuggestion](self->_searchResultsDataProvider, "relatedSuggestion"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider errorString](self->_searchResultsDataProvider, "errorString"));
    v49 = v3;
    if (objc_msgSend(v3, "singleResultMode"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider actionCoordinator](self->_searchResultsDataProvider, "actionCoordinator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentSearchSession"));
      v12 = objc_msgSend(v11, "isSpotlightPunchInSearch");

      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider suggestions](self->_searchResultsDataProvider, "suggestions"));
        v14 = objc_msgSend(v13, "count");

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
        v17 = -[HomeOutlineSearchResultsSectionController _isItemVenue:](self, "_isItemVenue:", v16);

        if ((v17 & 1) == 0 && !v14)
        {
          v18 = sub_100432EDC();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = sub_10039E4FC(0);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v22 = sub_10039E4FC(0);
            v23 = objc_claimAutoreleasedReturnValue(v22);
            *(_DWORD *)buf = 138412546;
            v62 = v21;
            v63 = 2112;
            v64 = v23;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Returning empty items here. isVenueResult :%@ and %@", buf, 0x16u);

          }
          v7 = &__NSArray0__struct;
          v24 = v47;
LABEL_25:

          v3 = v49;
          goto LABEL_26;
        }
      }
    }
    if (-[SearchResultsDataProvider isLoading](self->_searchResultsDataProvider, "isLoading")
      || objc_msgSend(v50, "length"))
    {
      v25 = -[HomeSearchStatusOutlineCellModel initWithErrorString:enableStructuredRAPAffordance:delegate:]([HomeSearchStatusOutlineCellModel alloc], "initWithErrorString:enableStructuredRAPAffordance:delegate:", v50, objc_msgSend(v3, "enableStructuredRAPAffordance"), self);
      v60 = v25;
      v26 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v60, 1));
    }
    else if (objc_msgSend(v8, "count"))
    {
      v37 = -[HomeSearchResultsFilterItem initWithSuggestions:currentSuggestion:delegate:]([HomeSearchResultsFilterItem alloc], "initWithSuggestions:currentSuggestion:delegate:", v8, v9, self);
      searchResultsFilterItem = self->_searchResultsFilterItem;
      self->_searchResultsFilterItem = v37;

      v59 = self->_searchResultsFilterItem;
      v25 = (HomeSearchStatusOutlineCellModel *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));
      v26 = objc_claimAutoreleasedReturnValue(-[HomeSearchStatusOutlineCellModel arrayByAddingObjectsFromArray:](v25, "arrayByAddingObjectsFromArray:", v6));
    }
    else
    {
      if (objc_msgSend(v3, "hasRelatedSearchSuggestion"))
      {
        v25 = -[RelatedSearchSuggestionOutlineCellModel initWithRelatedSuggestion:delegate:]([RelatedSearchSuggestionOutlineCellModel alloc], "initWithRelatedSuggestion:delegate:", v48, self);
        v58 = v25;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "arrayByAddingObjectsFromArray:", v6));

        goto LABEL_17;
      }
      v40 = self->_searchResultsFilterItem;
      self->_searchResultsFilterItem = 0;

      if (!objc_msgSend(v3, "enableStructuredRAPAffordance")
        || (v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results")),
            v42 = objc_msgSend(v41, "count"),
            v41,
            !v42))
      {
        v19 = v6;
        goto LABEL_18;
      }
      v43 = [ReportASearchAutocompleteResult alloc];
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchFieldItem"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "title"));
      v25 = -[ReportASearchAutocompleteResult initWithTitle:](v43, "initWithTitle:", v45);

      v26 = objc_claimAutoreleasedReturnValue(-[NSObject arrayByAddingObject:](v6, "arrayByAddingObject:", v25));
    }
    v19 = v26;
LABEL_17:

LABEL_18:
    v27 = sub_100432EDC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = -[NSObject count](v19, "count");
      *(_DWORD *)buf = 134218242;
      v62 = v29;
      v63 = 2112;
      v64 = v19;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "These %lu items %@ will be will be applied to the snapshot.", buf, 0x16u);
    }

    placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
    if (placeSummaryTemplateViewModels)
      -[NSCache removeAllObjects](placeSummaryTemplateViewModels, "removeAllObjects");
    v24 = v47;
    if (v19)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "placeSummaryMetadata"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "openAt"));
      -[HomeOutlineSearchResultsSectionController cachePlacesummaryTemplates:metadata:location:openAt:](self, "cachePlacesummaryTemplates:metadata:location:openAt:", v19, v31, v47, v32);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sectionIdentifier"));
    v35 = -[HomeOutlineSectionController expanded](self, "expanded");
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1002218C0;
    v57[3] = &unk_1011ACD28;
    v57[4] = self;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1002219E4;
    v53[3] = &unk_1011ACD50;
    v53[4] = self;
    v54 = v49;
    v55 = v47;
    v56 = v46;
    v51[4] = self;
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100221E1C;
    v52[3] = &unk_1011ACD78;
    v52[4] = self;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100221E78;
    v51[3] = &unk_1011ACDA0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineSectionBuilder itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:](HomeOutlineSectionBuilder, "itemSnapshotsWithItems:sectionIdentifier:sectionExpanded:itemIdentifierBlock:viewModelBlock:childItemsBlock:expandedBlock:", v19, v34, v35, v57, v53, v52, v51));

    goto LABEL_25;
  }
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Returning empty items here : %@", buf, 0xCu);
  }
  v7 = &__NSArray0__struct;
LABEL_26:

  return (NSArray *)v7;
}

- (void)cachePlacesummaryTemplates:(id)a3 metadata:(id)a4 location:(id)a5 openAt:(id)a6
{
  id v10;
  NSCache *placeSummaryTemplateViewModels;
  NSCache *v12;
  NSCache *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  __objc2_class_ro **p_info;
  void *i;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  __objc2_class_ro **v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSDictionary *placeSummaryTemplates;
  id v36;
  NSDictionary *v37;
  HomeOutlineSearchResultsSectionController *v38;
  id v39;
  id v40;
  id v41;
  NSCache *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v10 = a3;
  v41 = a4;
  v40 = a5;
  v38 = self;
  v39 = a6;
  if (self->_usePlaceSummary)
  {
    placeSummaryTemplateViewModels = self->_placeSummaryTemplateViewModels;
    if (placeSummaryTemplateViewModels)
    {
      -[NSCache removeAllObjects](placeSummaryTemplateViewModels, "removeAllObjects");
    }
    else
    {
      v12 = (NSCache *)objc_alloc_init((Class)NSCache);
      v13 = self->_placeSummaryTemplateViewModels;
      self->_placeSummaryTemplateViewModels = v12;

    }
    v36 = v10;
    v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v44;
      p_info = MapsScrollableStackView.info;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v44 != v17)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
          v21 = objc_opt_class(p_info + 256);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          {
            v22 = v20;
            v23 = v22;
            if (v22)
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapItem"));
              v25 = p_info;
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_geoMapItem"));
              v27 = objc_msgSend(v26, "_hasEVCharger");

              p_info = v25;
              if (v27)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceSummaryViewModelTemplateFactory viewModelWithSearchResult:metadata:currentLocation:searchAlongRoute:openAt:](_TtC4Maps36PlaceSummaryViewModelTemplateFactory, "viewModelWithSearchResult:metadata:currentLocation:searchAlongRoute:openAt:", v23, v41, v40, 0, v39));
                if (v28)
                {
                  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mapItem"));
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_identifier"));
                  -[NSDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v28, v30);

                  v42 = v38->_placeSummaryTemplateViewModels;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mapItem"));
                  v32 = v17;
                  v33 = v14;
                  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_identifier"));
                  -[NSCache setObject:forKey:](v42, "setObject:forKey:", v28, v34);

                  v14 = v33;
                  v17 = v32;
                  p_info = v25;

                }
              }
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v16);
    }

    placeSummaryTemplates = v38->_placeSummaryTemplates;
    v38->_placeSummaryTemplates = v37;

    v10 = v36;
  }

}

- (id)contextMenuForSnapshot:(id)a3
{
  return 0;
}

- (id)_searchResultContainingIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __objc2_class **v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionSnapshot](self, "sectionSnapshot"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childSnapshotWithIdentifier:", v7));

    LODWORD(v8) = self->_usePlaceSummary;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "viewModel"));
    v11 = off_101197F60;
    if ((_DWORD)v8)
      v11 = off_101198748;
    v12 = objc_opt_class(*v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      v13 = v10;
    else
      v13 = 0;
    v14 = v13;

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchResult"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)addMetricsForPlaceSummaryTemplate:(id)a3
{
  _TtC4Maps19PlaceSummaryMetrics *v3;
  id v4;

  v4 = a3;
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v4))
  {
    v3 = -[PlaceSummaryMetrics initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:]([_TtC4Maps19PlaceSummaryMetrics alloc], "initWithLeadingMargin:trailingMargin:topMargin:bottomMargin:topLeadingCornerRadius:topTrailingCornerRadius:bottomLeadingCornerRadius:bottomTrailingCornerRadius:showsDivider:", 1, 8.0, 8.0, 8.0, 8.0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v4, "setMetrics:", v3);

  }
}

- (void)expandElementAtIdentifierPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SearchResultsDataProvider *searchResultsDataProvider;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSearchResultsSectionController _searchResultContainingIdentifierPath:](self, "_searchResultContainingIdentifierPath:", v4));
  v6 = v5;
  if (v5)
  {
    searchResultsDataProvider = self->_searchResultsDataProvider;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
    -[SearchResultsDataProvider downloadVenueInfoForMapItem:](searchResultsDataProvider, "downloadVenueInfoForMapItem:", v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)HomeOutlineSearchResultsSectionController;
  -[HomeOutlineSectionController expandElementAtIdentifierPath:](&v9, "expandElementAtIdentifierPath:", v4);

}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  id v4;
  SearchResult *v5;
  void *v6;
  SearchResult *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[SearchResultsDataProvider presentVenueWithVenueCardItem:](self->_searchResultsDataProvider, "presentVenueWithVenueCardItem:", v12);
  if (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___VenueCategoryCardItem))
  {
    v4 = v12;
    v5 = [SearchResult alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueMapItem"));

    v7 = -[SearchResult initWithMapItem:](v5, "initWithMapItem:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController identifierCache](self, "identifierCache"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifierForObject:", v7));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController sectionIdentifierPath](self, "sectionIdentifierPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierPathByAppendingIdentifier:", v9));

    -[HomeOutlineSearchResultsSectionController expandElementAtIdentifierPath:](self, "expandElementAtIdentifierPath:", v11);
  }

}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  SearchResultsDataProvider *searchResultsDataProvider;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  searchResultsDataProvider = self->_searchResultsDataProvider;
  v9 = a3;
  -[SearchResultsDataProvider handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:](searchResultsDataProvider, "handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:", v9, a4, a5);
  v14 = (id)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchInfo](self->_searchResultsDataProvider, "searchInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchInfo](self->_searchResultsDataProvider, "searchInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeSummaryMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CurrentLocationDataProvider currentLocation](self->_currentLocationDataProvider, "currentLocation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "openAt"));
  -[HomeOutlineSearchResultsSectionController cachePlacesummaryTemplates:metadata:location:openAt:](self, "cachePlacesummaryTemplates:metadata:location:openAt:", v9, v11, v12, v13);

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

- (id)_childItemsInVenueSearchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  VenueDropDownOutlineCellModel *v11;
  void *v12;
  void *v13;
  VenueDropDownOutlineCellModel *v14;
  void *v15;
  void *v16;
  void *v17;
  VenueDropDownOutlineCellModel *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider venueProviderForMapItem:](self->_searchResultsDataProvider, "venueProviderForMapItem:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayString"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_venueInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueIdentifier"));

    v11 = [VenueDropDownOutlineCellModel alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "browseCategories"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCategory"));
    v14 = -[VenueDropDownOutlineCellModel initWithButtonTitle:categories:selectedCategory:venueIdentifier:delegate:](v11, "initWithButtonTitle:categories:selectedCategory:venueIdentifier:delegate:", v8, v12, v13, v10, self);

    v19 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venueContents"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v16));

  }
  else
  {
    v17 = &__NSArray0__struct;
  }

  return v17;
}

- (BOOL)persistsExpansions
{
  return 0;
}

- (void)searchResultsFilterItem:(id)a3 didSelectSuggestion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  SearchFieldItem *v8;

  v5 = a4;
  v8 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSuggestion:](v8, "setSuggestion:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionCoordinator"));
  objc_msgSend(v7, "viewController:doSearchItem:withUserInfo:", 0, v8, &off_101274430);

}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeActionDelegate"));
  objc_msgSend(v6, "homeDidTapOnPlaceContextWithViewModel:", v5);

}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeActionDelegate"));
  objc_msgSend(v5, "homeDidTapOnUserGeneratedGuide:", v4);

}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeActionDelegate"));
  objc_msgSend(v5, "homeDidTapOnCuratedGuide:", v4);

}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeActionDelegate"));
  objc_msgSend(v5, "homeDidTapOnCuratedGuides:", v4);

}

- (void)didTapOnContainment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeActionDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultsDataProvider searchResults](self->_searchResultsDataProvider, "searchResults"));
  objc_msgSend(v5, "homeDidTapOnContainment:forResults:", v4, v6);

}

- (void)didTapOnUserNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeActionDelegate"));
  objc_msgSend(v5, "homeItemTapped:", v4);

}

- (void)didTapOnUserLibrary:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionCoordinator"));
  objc_msgSend(v3, "viewControllerShowLibraryPlacesView:", 0);

}

- (void)didTapOnPhotoCarousel:(id)a3 index:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeActionDelegate"));
  objc_msgSend(v6, "homeItemTapped:", v5);

}

- (void)venuesDropDownOutlineCell:(id)a3 didSelectCategory:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellModel"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venueIdentifier"));

  -[SearchResultsDataProvider selectCategory:forVenueWithVenueIdentifier:](self->_searchResultsDataProvider, "selectCategory:forVenueWithVenueIdentifier:", v6, v8);
}

- (void)relatedSearchSuggestionOutlineCellDidTapActionButtonWithSuggestion:(id)a3
{
  -[SearchResultsDataProvider performSearchForSuggestion:](self->_searchResultsDataProvider, "performSearchForSuggestion:", a3);
}

- (void)didTapOnReportAnIssue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ReportASearchAutocompleteResult *v8;

  v8 = -[ReportASearchAutocompleteResult initWithTitle:]([ReportASearchAutocompleteResult alloc], "initWithTitle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_mapsSceneDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rapPresenter"));

  objc_msgSend(v7, "presentAddToMapsFromSearchEntryPoint:result:completion:", 8, v8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeSummaryTemplates, 0);
  objc_storeStrong((id *)&self->_placeSummaryTemplateViewModels, 0);
  objc_storeStrong((id *)&self->_curatedGuideDataDownloader, 0);
  objc_storeStrong((id *)&self->_evChargerDownloader, 0);
  objc_storeStrong((id *)&self->_asyncDataManager, 0);
  objc_storeStrong((id *)&self->_searchResultsFilterItem, 0);
  objc_storeStrong((id *)&self->_distanceUnitDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_searchResultsDataProvider, 0);
}

@end
