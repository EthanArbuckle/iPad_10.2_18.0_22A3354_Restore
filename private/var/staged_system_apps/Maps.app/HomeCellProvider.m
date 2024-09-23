@implementation HomeCellProvider

- (double)contentHeight
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitCollection"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v5, "bounds");
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", 1, 0, 0, v4, CGRectGetWidth(v29));
  v7 = v6;

  +[TwoLinesTableViewCell estimatedCellHeight](TwoLinesTableViewCell, "estimatedCellHeight");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v10, "bounds");
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", 0, 0, 0, v4, CGRectGetWidth(v30));
  v12 = v11;

  +[ShortcutsRowTableViewCell cellHeightWithTraitCollection:](ShortcutsRowTableViewCell, "cellHeightWithTraitCollection:", v4);
  v14 = v13;
  +[UIFont _maps_bodyScaledValueForValue:compatibleWithTraitCollection:](UIFont, "_maps_bodyScaledValueForValue:compatibleWithTraitCollection:", v4, 16.0);
  v16 = v15;
  if (-[HomeCellProvider _isLoading](self, "_isLoading"))
  {
    v17 = v7 + v14 + v16;
  }
  else
  {
    v17 = v7 + v9 + v12 + v14 + v16;
    if (self->_shortcutsSection)
    {
      v18 = -[HomeCellProvider _dynamicIndexOfHomeSection:](self, "_dynamicIndexOfHomeSection:");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v19, "rectForSection:", v18);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v31.origin.x = v21;
      v31.origin.y = v23;
      v31.size.width = v25;
      v31.size.height = v27;
      if (v17 >= v16 + CGRectGetMaxY(v31))
      {
        v32.origin.x = v21;
        v32.origin.y = v23;
        v32.size.width = v25;
        v32.size.height = v27;
        v17 = v16 + CGRectGetMaxY(v32);
      }
    }
  }

  return v17;
}

- (HomeCellProvider)initWithTableView:(id)a3 viewMode:(int64_t)a4
{
  id v6;
  HomeCellProvider *v7;
  HomeCellProvider *v8;
  uint64_t v9;
  NSMutableDictionary *pendingDeletions;
  RecentsDataFilter *v11;
  RecentsDataFilter *recentsDataFilter;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *recentsDataFilterQueue;
  id v17;
  _QWORD *v18;
  void *v19;
  UITableViewDiffableDataSource *v20;
  UITableViewDiffableDataSource *diffableDataSource;
  uint64_t v22;
  NSHashTable *orthogonalSectionCells;
  RAPReportMenuProvider *v24;
  RAPReportMenuProvider *rapReportMenuProvider;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];

  v6 = a3;
  v51.receiver = self;
  v51.super_class = (Class)HomeCellProvider;
  v7 = -[DataSource initWithTableView:updateLocation:](&v51, "initWithTableView:updateLocation:", v6, 0);
  v8 = v7;
  if (v7)
  {
    v7->_viewMode = a4;
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingDeletions = v8->_pendingDeletions;
    v8->_pendingDeletions = (NSMutableDictionary *)v9;

    v11 = -[RecentsDataFilter initWithSearchMode:filterPredicate:]([RecentsDataFilter alloc], "initWithSearchMode:filterPredicate:", 1, 0);
    recentsDataFilter = v8->_recentsDataFilter;
    v8->_recentsDataFilter = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.Maps.HomeCellProvider.RecentsDataFilter", v14);
    recentsDataFilterQueue = v8->_recentsDataFilterQueue;
    v8->_recentsDataFilterQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc((Class)UITableViewDiffableDataSource);
    v18 = sub_10046D908(v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (UITableViewDiffableDataSource *)objc_msgSend(v17, "initWithTableView:cellProvider:", v6, v19);
    diffableDataSource = v8->_diffableDataSource;
    v8->_diffableDataSource = v20;

    -[UITableViewDiffableDataSource setDefaultRowAnimation:](v8->_diffableDataSource, "setDefaultRowAnimation:", 0);
    v22 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    orthogonalSectionCells = v8->_orthogonalSectionCells;
    v8->_orthogonalSectionCells = (NSHashTable *)v22;

    v24 = objc_alloc_init(RAPReportMenuProvider);
    rapReportMenuProvider = v8->_rapReportMenuProvider;
    v8->_rapReportMenuProvider = v24;

    -[HomeCellProvider _createDataProviders](v8, "_createDataProviders");
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _allDataProviders](v8, "_allDataProviders", 0));
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v48;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v48 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v30), "observers"));
          objc_msgSend(v31, "registerObserver:", v8);

          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v28);
    }

    v32 = objc_opt_class(TwoLinesTableViewCell);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v32, v33);

    v34 = objc_opt_class(CollectionTableViewCell);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionTableViewCell identifier](CollectionTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v34, v35);

    v36 = objc_opt_class(FeatureDiscoveryTableViewCell);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[FeatureDiscoveryTableViewCell reuseIdentifier](FeatureDiscoveryTableViewCell, "reuseIdentifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v36, v37);

    v38 = objc_opt_class(SectionHeaderTableViewHeaderFooterView);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderTableViewHeaderFooterView reuseIdentifier](SectionHeaderTableViewHeaderFooterView, "reuseIdentifier"));
    objc_msgSend(v6, "registerClass:forHeaderFooterViewReuseIdentifier:", v38, v39);

    v40 = objc_opt_class(HomeActionFooterView);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[HomeActionFooterView classReuseIdentifier](HomeActionFooterView, "classReuseIdentifier"));
    objc_msgSend(v6, "registerClass:forHeaderFooterViewReuseIdentifier:", v40, v41);

    v42 = objc_opt_class(HomeOrthogonalSectionTableViewCell);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowTableViewCell identifier](ShortcutsRowTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v42, v43);

    v44 = objc_opt_class(HomeOrthogonalSectionTableViewCell);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[HomeCuratedCollectionsTableViewCell identifier](HomeCuratedCollectionsTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v44, v45);

  }
  return v8;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const __CFString *v22;

  v3 = a3;
  if (-[DataSource active](self, "active") != a3)
  {
    v5 = sub_100432EDC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "HCP setActive %@", buf, 0xCu);
    }

    v19.receiver = self;
    v19.super_class = (Class)HomeCellProvider;
    -[DataSource setActive:](&v19, "setActive:", v3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _allDataProviders](self, "_allDataProviders"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "setActive:", v3);
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    if (v3)
    {
      -[HomeCellProvider _setNeedsSnapshotUpdateAnimated:](self, "_setNeedsSnapshotUpdateAnimated:", 0);
      -[HomeCellProvider _fetchMissingImages](self, "_fetchMissingImages");
      objc_initWeak((id *)buf, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100701028;
      v13[3] = &unk_1011AD260;
      objc_copyWeak(&v14, (id *)buf);
      -[HomeCellProvider _getRecentsWithCompletion:](self, "_getRecentsWithCompletion:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      self->_appliedActiveUpdate = 0;
      LOBYTE(v12) = 0;
      -[DataSource sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:](self, "sendAnalyticsForDataAtIndexPath:object:childPlaceIndexPath:childPlaceObject:action:eventValue:populateSearchTapEvent:", 0, 0, 0, 0, 0, 0, v12);
    }
  }
}

- (void)_fetchMissingImages
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (-[DataSource active](self, "active"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = sub_1007011B8(*(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
          v11 = objc_opt_class(ShortcutsRowTableViewCell);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
            objc_msgSend(v10, "fetchMissingImages");

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return -[SuggestionsDataProvider suggestionsItemSource](self->_suggestionsDataProvider, "suggestionsItemSource");
}

- (void)resetScrollOffset
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_needsResetFavoritesScrollOffset = 1;
  self->_needsResetCuratedCollectionsScrollOffset = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = sub_1007011B8(*(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = objc_opt_class(ShortcutsRowTableViewCell);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          objc_msgSend(v10, "resetScrollOffset");
          self->_needsResetFavoritesScrollOffset = 0;
        }
        v12 = objc_opt_class(HomeCuratedCollectionsTableViewCell);
        if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
        {
          objc_msgSend(v10, "resetScrollOffset");
          self->_needsResetCuratedCollectionsScrollOffset = 0;
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (void)setPoiEnrichmentActionDelegate:(id)a3
{
  -[FeatureDiscoveryDataProvider setPoiEnrichmentActionDelegate:](self->_featureDiscoveryDataProvider, "setPoiEnrichmentActionDelegate:", a3);
}

- (UGCPOIEnrichmentActionDelegate)poiEnrichmentActionDelegate
{
  return -[FeatureDiscoveryDataProvider poiEnrichmentActionDelegate](self->_featureDiscoveryDataProvider, "poiEnrichmentActionDelegate");
}

- (void)setTransitPayActionDelegate:(id)a3
{
  -[FeatureDiscoveryDataProvider setTransitPayActionDelegate:](self->_featureDiscoveryDataProvider, "setTransitPayActionDelegate:", a3);
}

- (TransitPayActionDelegate)transitPayActionDelegate
{
  return -[FeatureDiscoveryDataProvider transitPayActionDelegate](self->_featureDiscoveryDataProvider, "transitPayActionDelegate");
}

- (void)setOfflineMapsDiscoveryActionDelegate:(id)a3
{
  -[FeatureDiscoveryDataProvider setOfflineMapsDiscoveryActionDelegate:](self->_featureDiscoveryDataProvider, "setOfflineMapsDiscoveryActionDelegate:", a3);
}

- (OfflineMapsFeatureDiscoveryActionDelegate)offlineMapsDiscoveryActionDelegate
{
  return -[FeatureDiscoveryDataProvider offlineMapsDiscoveryActionDelegate](self->_featureDiscoveryDataProvider, "offlineMapsDiscoveryActionDelegate");
}

- (void)_createDataProviders
{
  FeatureDiscoveryDataProvider *v3;
  FeatureDiscoveryDataProvider *featureDiscoveryDataProvider;
  SuggestionsDataProvider *v5;
  int64_t viewMode;
  id v7;
  id v8;
  SuggestionsDataProvider *v9;
  SuggestionsDataProvider *suggestionsDataProvider;
  SharedTripsDataProvider *v11;
  SharedTripsDataProvider *sharedTripsDataProvider;
  uint64_t v13;
  uint64_t v14;
  HomePhotoLookupDataProvider *v15;
  HomePhotoLookupDataProvider *photoLookupDataProvider;
  HomeResultDataProvider *v17;
  HomeResultDataProvider *resultDataProvider;
  CollectionsDataProvider *v19;
  CollectionsDataProvider *collectionsDataProvider;
  MarkedLocationDataProvider *v21;
  MarkedLocationDataProvider *markedLocationDataProvider;
  RecentsDataProvider *v23;
  RecentsDataProvider *recentsDataProvider;
  void **v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  id location;

  v3 = objc_alloc_init(FeatureDiscoveryDataProvider);
  featureDiscoveryDataProvider = self->_featureDiscoveryDataProvider;
  self->_featureDiscoveryDataProvider = v3;

  objc_initWeak(&location, self);
  v5 = [SuggestionsDataProvider alloc];
  viewMode = self->_viewMode;
  v7 = objc_alloc((Class)MapsSuggestionsBlockFilter);
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_100701650;
  v28 = &unk_1011C11D0;
  objc_copyWeak(&v29, &location);
  v8 = objc_msgSend(v7, "initWithBlock:", &v25);
  v9 = -[SuggestionsDataProvider initWithViewMode:filter:includePlaceholderShortcuts:](v5, "initWithViewMode:filter:includePlaceholderShortcuts:", viewMode, v8, 1, v25, v26, v27, v28);
  suggestionsDataProvider = self->_suggestionsDataProvider;
  self->_suggestionsDataProvider = v9;

  v11 = -[SharedTripsDataProvider initWithCombineAllTrips:]([SharedTripsDataProvider alloc], "initWithCombineAllTrips:", 1);
  sharedTripsDataProvider = self->_sharedTripsDataProvider;
  self->_sharedTripsDataProvider = v11;

  if (MapsFeature_IsEnabled_SydneyARP(v13, v14))
  {
    v15 = -[HomePhotoLookupDataProvider initWithSuggestionsDataProvider:]([HomePhotoLookupDataProvider alloc], "initWithSuggestionsDataProvider:", self->_suggestionsDataProvider);
    photoLookupDataProvider = self->_photoLookupDataProvider;
    self->_photoLookupDataProvider = v15;

  }
  if (GEOConfigGetBOOL(MapsConfig_MapsHomeResultEnabled, off_1014B3E78))
  {
    v17 = -[HomeResultDataProvider initWithDelegate:]([HomeResultDataProvider alloc], "initWithDelegate:", self);
    resultDataProvider = self->_resultDataProvider;
    self->_resultDataProvider = v17;

  }
  v19 = -[CollectionsDataProvider initWithContext:observeInfo:observeContents:]([CollectionsDataProvider alloc], "initWithContext:observeInfo:observeContents:", 2, 0, 0);
  collectionsDataProvider = self->_collectionsDataProvider;
  self->_collectionsDataProvider = v19;

  v21 = objc_alloc_init(MarkedLocationDataProvider);
  markedLocationDataProvider = self->_markedLocationDataProvider;
  self->_markedLocationDataProvider = v21;

  v23 = objc_alloc_init(RecentsDataProvider);
  recentsDataProvider = self->_recentsDataProvider;
  self->_recentsDataProvider = v23;

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

- (id)_allDataProviders
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = v3;
  if (self->_featureDiscoveryDataProvider)
    objc_msgSend(v3, "addObject:");
  if (self->_suggestionsDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_sharedTripsDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_photoLookupDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_resultDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_collectionsDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_markedLocationDataProvider)
    objc_msgSend(v4, "addObject:");
  if (self->_recentsDataProvider)
    objc_msgSend(v4, "addObject:");
  v5 = objc_msgSend(v4, "copy");

  return v5;
}

- (BOOL)_shouldShowEntryOfTypeVehicleSetup:(id)a3
{
  id v3;
  void *v4;
  double Double;
  uint64_t Integer;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double Current;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  signed int v25;
  NSObject *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  int v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;

  v3 = a3;
  if ((GEOConfigGetBOOL(MapsConfig_VehicleSetupSuppression, off_1014B36B8) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));

    if (v4)
    {
      Double = GEOConfigGetDouble(MapsConfig_VehicleSetupSuppressionDelay, off_1014B36C8);
      Integer = GEOConfigGetInteger(MapsConfig_VehicleSetupSuppressionCount, off_1014B36D8);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dictionaryForKey:", CFSTR("VehicleSetupShownKey")));
      v9 = objc_msgSend(v8, "mutableCopy");
      v10 = v9;
      if (v9)
        v11 = v9;
      else
        v11 = objc_alloc_init((Class)NSMutableDictionary);
      v14 = v11;

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v17, "doubleForKey:", CFSTR("LastSuspendTime"));
      v19 = v18;

      Current = CFAbsoluteTimeGetCurrent();
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v21));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
      if (!v22)
      {
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &off_10126E8D8, v23);

        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double + v19));
        -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v44, CFSTR("nextUpdated"));

        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        v46 = -[NSObject copy](v14, "copy");
        objc_msgSend(v45, "setObject:forKey:", v46, CFSTR("VehicleSetupShownKey"));

        v47 = sub_100432EDC();
        v26 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));
          v51 = 138412546;
          v52 = v39;
          v53 = 2112;
          v54 = v49;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Vehicle Setup Entry from %@ has been shown 1/%@ times", (uint8_t *)&v51, 0x16u);

          goto LABEL_19;
        }
LABEL_20:

        goto LABEL_21;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKey:](v14, "valueForKey:", v23));
      v25 = objc_msgSend(v24, "intValue");

      if (Integer > v25)
      {
        v26 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("nextUpdated")));
        -[NSObject doubleValue](v26, "doubleValue");
        if (Current > v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("nextUpdated")));
          objc_msgSend(v28, "doubleValue");
          v30 = v29 - Double;

          if (v19 == v30)
          {
LABEL_21:
            v15 = 1;
            goto LABEL_22;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v31));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v32, "intValue") + 1));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
          -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v33, v34);

          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Double + v19));
          -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v35, CFSTR("nextUpdated"));

          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v37 = -[NSObject copy](v14, "copy");
          objc_msgSend(v36, "setObject:forKey:", v37, CFSTR("VehicleSetupShownKey"));

          v38 = sub_100432EDC();
          v26 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueIdentifier"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v40));
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Integer));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringValue"));
            v51 = 138412802;
            v52 = v39;
            v53 = 2112;
            v54 = v41;
            v55 = 2112;
            v56 = v43;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Vehicle Setup Entry from %@ has been shown %@/%@ times", (uint8_t *)&v51, 0x20u);

LABEL_19:
            goto LABEL_20;
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
      v16 = sub_100432EDC();
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v51) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "VehicleSetup entry must have a uniqueIdentifier to be shown", (uint8_t *)&v51, 2u);
      }
    }
    v15 = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("VehicleSetupShownKey"));

    v13 = sub_100432EDC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = 1;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v51) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "VehicleSetupSuppression is disabled, showing entry", (uint8_t *)&v51, 2u);
    }
  }
LABEL_22:

  return v15;
}

- (id)_suggestionCellModelForMapsSuggestionsEntry:(id)a3
{
  id v4;
  uint64_t v5;
  int64_t v6;
  __objc2_class **v7;
  id v8;

  v4 = a3;
  if (!MapsFeature_IsEnabled_SydneyARP(v4, v5))
    goto LABEL_5;
  v6 = -[HomePhotoLookupDataProvider resultForSuggestionsEntry:](self->_photoLookupDataProvider, "resultForSuggestionsEntry:", v4);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_7;
  }
  if (v6 == 1)
    v7 = off_101196C60;
  else
LABEL_5:
    v7 = &off_101196C68;
  v8 = objc_msgSend(objc_alloc(*v7), "initWithEntry:", v4);
LABEL_7:

  return v8;
}

- (id)newTraits
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  if (objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCellProviderDelegate))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = objc_msgSend(v4, "newTraits");
  if (v5)
    v6 = v5;
  else
    v6 = objc_alloc_init((Class)GEOMapServiceTraits);
  v7 = v6;

  return v7;
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  MarkedLocationDataProvider *v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;

  v4 = (MarkedLocationDataProvider *)a3;
  v5 = sub_100432EDC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class(v4);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "HDS homeDataProvidingObjectDidUpdate %@", buf, 0xCu);

  }
  v10 = sub_100432EDC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HomeDidUpdate", ", buf, 2u);
  }

  if (self->_markedLocationDataProvider == v4 || (MarkedLocationDataProvider *)self->_recentsDataProvider == v4)
  {
    v12 = sub_100432EDC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HomeDidUpdateRequiresRecents", ", buf, 2u);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1007020C4;
    v14[3] = &unk_1011AD260;
    objc_copyWeak(&v15, (id *)buf);
    -[HomeCellProvider _getRecentsWithCompletion:](self, "_getRecentsWithCompletion:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[HomeCellProvider _setNeedsSnapshotUpdateAnimated:](self, "_setNeedsSnapshotUpdateAnimated:", 1);
  }

}

- (void)_getRecentsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  id v13;
  RecentsDataFilter *v14;
  NSObject *recentsDataFilterQueue;
  id v16;
  RecentsDataFilter *v17;
  id v18;
  _QWORD block[4];
  RecentsDataFilter *v20;
  id v21;
  id v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
  if (-[HomeCellProvider _shouldDisplayObject:](self, "_shouldDisplayObject:", v6))
    objc_msgSend(v5, "addObject:", v6);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider recents](self->_recentsDataProvider, "recents"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (-[HomeCellProvider _shouldDisplayObject:](self, "_shouldDisplayObject:", v12))
          objc_msgSend(v5, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v13 = objc_msgSend(v5, "copy");
  v14 = self->_recentsDataFilter;
  objc_initWeak(&location, self);
  recentsDataFilterQueue = self->_recentsDataFilterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100702360;
  block[3] = &unk_1011C13A0;
  v20 = v14;
  v21 = v13;
  v16 = v13;
  v17 = v14;
  objc_copyWeak(&v23, &location);
  v22 = v4;
  v18 = v4;
  dispatch_async(recentsDataFilterQueue, block);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_buildSections
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  void *v18;
  HomeSection *v19;
  HomeSection *suggestionsSection;
  FeatureDiscoveryDataProvider *featureDiscoveryDataProvider;
  void *v22;
  HomeSection *v23;
  void *v24;
  HomeSection *v25;
  HomeSection *featureDiscoverySection;
  HomeSection *v27;
  HomeSection *shortcutsSection;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  HomeSection *v34;
  HomeSection *v35;
  void *v36;
  HomeSection *v37;
  HomeSection *curatedCollectionsSection;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  uint64_t v45;
  unint64_t UInteger;
  id v47;
  id v48;
  id v49;
  _BOOL8 v50;
  void *v51;
  id v52;
  void *v53;
  HomeSection *v54;
  HomeSection *collectionsSection;
  unint64_t v56;
  _BOOL8 v57;
  NSArray *filteredRecents;
  id v59;
  HomeSection *v60;
  HomeSection *recentsSection;
  void *v62;
  void *v63;
  NSArray *v64;
  NSArray *homeSections;
  unint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSArray *v77;
  NSArray *keyCommands;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[6];
  __int128 v92;
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
  const __CFString *v104;
  void *v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsDataProvider sharedTripSummaries](self->_sharedTripsDataProvider, "sharedTripSummaries"));
  if (MSPSharedTripReceivingAvailable(v4, v5))
  {
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v101;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v101 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);
          if (-[HomeCellProvider _shouldDisplayObject:](self, "_shouldDisplayObject:", v11))
            objc_msgSend(v3, "addObject:", v11);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v100, v108, 16);
      }
      while (v8);
    }

  }
  v83 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider suggestions](self->_suggestionsDataProvider, "suggestions"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v97;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v97 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _suggestionCellModelForMapsSuggestionsEntry:](self, "_suggestionCellModelForMapsSuggestionsEntry:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)j)));
        if (v18 && -[HomeCellProvider _shouldDisplayObject:](self, "_shouldDisplayObject:", v18))
          objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
    }
    while (v15);
  }

  v82 = v12;
  objc_msgSend(v3, "addObjectsFromArray:", v12);
  v84 = v3;
  v19 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:]([HomeSection alloc], "initWithType:contents:showsSectionButton:customLocalizedName:", 1, v3, 0, 0);
  suggestionsSection = self->_suggestionsSection;
  self->_suggestionsSection = v19;

  featureDiscoveryDataProvider = self->_featureDiscoveryDataProvider;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider suggestions](self->_suggestionsDataProvider, "suggestions"));
  -[FeatureDiscoveryDataProvider updateFeaturesWithSuggestions:](featureDiscoveryDataProvider, "updateFeaturesWithSuggestions:", v22);

  v23 = [HomeSection alloc];
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FeatureDiscoveryDataProvider features](self->_featureDiscoveryDataProvider, "features"));
  v25 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:](v23, "initWithType:contents:showsSectionButton:customLocalizedName:", 6, v24, 0, 0);
  featureDiscoverySection = self->_featureDiscoverySection;
  self->_featureDiscoverySection = v25;

  v27 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:]([HomeSection alloc], "initWithType:contents:showsSectionButton:customLocalizedName:", 2, &__NSArray0__struct, 1, 0);
  shortcutsSection = self->_shortcutsSection;
  self->_shortcutsSection = v27;

  if (GEOConfigGetBOOL(MapsConfig_MapsHomeResultEnabled, off_1014B3E78))
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider homeResult](self->_resultDataProvider, "homeResult"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "curatedCollections"));
    if (objc_msgSend(v30, "count"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider homeResult](self->_resultDataProvider, "homeResult"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "curatedCollectionSectionName"));
      v33 = objc_msgSend(v32, "length");

      if (v33)
      {
        v34 = [HomeSection alloc];
        v35 = (HomeSection *)objc_claimAutoreleasedReturnValue(-[HomeResultDataProvider homeResult](self->_resultDataProvider, "homeResult"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSection curatedCollectionSectionName](v35, "curatedCollectionSectionName"));
        v37 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:](v34, "initWithType:contents:showsSectionButton:customLocalizedName:", 4, &__NSArray0__struct, 0, v36);
        curatedCollectionsSection = self->_curatedCollectionsSection;
        self->_curatedCollectionsSection = v37;

        goto LABEL_28;
      }
    }
    else
    {

    }
  }
  v35 = self->_curatedCollectionsSection;
  self->_curatedCollectionsSection = 0;
LABEL_28:

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsDataProvider collections](self->_collectionsDataProvider, "collections"));
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v93;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(_QWORD *)v93 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)k);
        if (-[HomeCellProvider _shouldDisplayObject:](self, "_shouldDisplayObject:", v45))
          objc_msgSend(v39, "addObject:", v45);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v92, v106, 16);
    }
    while (v42);
  }

  UInteger = GEOConfigGetUInteger(MapsConfig_MapsHomeMaxGuides, off_1014B3E68);
  v47 = objc_msgSend(v39, "count");
  v48 = objc_msgSend(v39, "count");
  v49 = (id)UInteger;
  if ((unint64_t)v48 < UInteger)
    v49 = objc_msgSend(v39, "count");
  v50 = (unint64_t)v47 > UInteger;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "subarrayWithRange:", 0, v49));
  v52 = objc_msgSend(v51, "mutableCopy");

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionHandler addToCollection](CollectionHandler, "addToCollection"));
  objc_msgSend(v52, "addObject:", v53);

  v81 = v52;
  v54 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:]([HomeSection alloc], "initWithType:contents:showsSectionButton:customLocalizedName:", 3, v52, v50, 0);
  collectionsSection = self->_collectionsSection;
  self->_collectionsSection = v54;

  v56 = GEOConfigGetUInteger(MapsConfig_MapsHomeMaxRecents, off_1014B3E58);
  v57 = -[NSArray count](self->_filteredRecents, "count") > v56;
  filteredRecents = self->_filteredRecents;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_100702D4C;
  v91[3] = &unk_1011C11F8;
  v91[4] = self;
  v91[5] = v56;
  v59 = sub_10039E080(filteredRecents, v91);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v59);
  v60 = -[HomeSection initWithType:contents:showsSectionButton:customLocalizedName:]([HomeSection alloc], "initWithType:contents:showsSectionButton:customLocalizedName:", 5, v80, v57, 0);
  recentsSection = self->_recentsSection;
  self->_recentsSection = v60;

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v63 = v62;
  if (self->_featureDiscoverySection)
    objc_msgSend(v62, "addObject:");
  if (self->_suggestionsSection)
    objc_msgSend(v63, "addObject:");
  if (self->_shortcutsSection)
    objc_msgSend(v63, "addObject:");
  if (self->_recentsSection)
    objc_msgSend(v63, "addObject:");
  if (self->_collectionsSection)
    objc_msgSend(v63, "addObject:");
  if (self->_curatedCollectionsSection)
    objc_msgSend(v63, "addObject:");
  v64 = (NSArray *)objc_msgSend(v63, "copy", v63);
  homeSections = self->_homeSections;
  self->_homeSections = v64;

  -[HomeCellProvider _addAnalyticsInfo](self, "_addAnalyticsInfo");
  -[HomeCellProvider _updateRestaurantReservationAnalytics](self, "_updateRestaurantReservationAnalytics");
  v85 = objc_alloc_init((Class)NSMutableArray);
  if (-[NSArray count](self->_homeSections, "count"))
  {
    v66 = 0;
    v67 = 1;
    do
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_homeSections, "objectAtIndexedSubscript:", v66));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "keyCommand"));
      if (v69)
      {
        v70 = v69;
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "title"));
        v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "image"));
        v87 = objc_msgSend(v70, "action");
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v67));
        v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "stringValue"));
        v72 = objc_msgSend(v70, "modifierFlags");
        v104 = CFSTR("type");
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v68, "type")));
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "stringValue"));
        v105 = v73;
        v74 = v68;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v89, v88, v87, v71, v72, v75));

        v68 = v74;
        objc_msgSend(v85, "addObject:", v76);

        ++v67;
      }

      ++v66;
    }
    while (v66 < -[NSArray count](self->_homeSections, "count"));
  }
  v77 = (NSArray *)objc_msgSend(v85, "copy");
  keyCommands = self->_keyCommands;
  self->_keyCommands = v77;

}

- (BOOL)_shouldDisplayObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;

  v4 = a3;
  v5 = sub_10046DCCC(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDeletions, "objectForKeyedSubscript:", v6));
    if ((objc_msgSend(v7, "tentativelyDeleted") & 1) != 0
      || (objc_msgSend(v7, "completed") & 1) != 0)
    {
      v8 = 0;
    }
    else if (objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "entry"));
      if (objc_msgSend(v10, "type") == (id)21)
        v8 = +[RatingRequestHomeAvailability shouldShowRatingRequestSuggestionsOnProactiveTray](RatingRequestHomeAvailability, "shouldShowRatingRequestSuggestionsOnProactiveTray");
      else
        v8 = 1;

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_homeSectionAtStaticIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSArray count](self->_homeSections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_homeSections, "objectAtIndexedSubscript:", a3));
  }
  return v5;
}

- (id)_homeSectionAtDynamicIndex:(int64_t)a3
{
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_homeSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v11, (_QWORD)v14))
        {
          if (v8 == a3)
          {
            v12 = v11;
            goto LABEL_13;
          }
          ++v8;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (int64_t)_dynamicIndexOfHomeSection:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_homeSections;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v11, (_QWORD)v14))
        {
          v12 = objc_msgSend(v11, "type");
          if (v12 == objc_msgSend(v4, "type"))
            goto LABEL_12;
          ++v8;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:

  return v8;
}

- (id)_homeSectionWithType:(int64_t)a3
{
  NSArray *homeSections;
  id v4;
  _QWORD v6[5];

  homeSections = self->_homeSections;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100703198;
  v6[3] = &unk_1011C1218;
  v6[4] = a3;
  v4 = sub_10039E1FC(homeSections, v6);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (id)_homeSectionAtIndexPath:(id)a3
{
  return -[HomeCellProvider _homeSectionAtDynamicIndex:](self, "_homeSectionAtDynamicIndex:", objc_msgSend(a3, "section"));
}

- (id)_objectsInSectionAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", a3));
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "hasOrthogonalLayout"))
    {
      v8 = v4;
      v5 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    }
    else
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contents"));
    }
    v6 = (void *)v5;
  }
  else
  {
    v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _objectsInSectionAtIndexPath:](self, "_objectsInSectionAtIndexPath:", v4));
  if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
    || (v6 = objc_msgSend(v4, "row"), v6 >= objc_msgSend(v5, "count")))
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));
  }

  return v7;
}

- (id)_allObjects
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[NSArray count](self->_homeSections, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_homeSections, "objectAtIndexedSubscript:", v4));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contents"));
      objc_msgSend(v3, "addObjectsFromArray:", v6);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_homeSections, "count"));
  }
  v7 = objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)_isEmptySection:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasOrthogonalLayout") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contents"));
    v4 = objc_msgSend(v5, "count") == 0;

  }
  return v4;
}

- (BOOL)_shouldShowHeaderForSection:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "localizedName"));
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)_loadingDataProviders
{
  SuggestionsDataProvider *suggestionsDataProvider;

  if (-[SuggestionsDataProvider hasInitialData](self->_suggestionsDataProvider, "hasInitialData"))
    return &__NSArray0__struct;
  suggestionsDataProvider = self->_suggestionsDataProvider;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &suggestionsDataProvider, 1));
}

- (BOOL)_isLoading
{
  void *v3;
  id v4;
  BOOL result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _loadingDataProviders](self, "_loadingDataProviders"));
  v4 = objc_msgSend(v3, "count");

  result = -[NSTimer isValid](self->_initialSuggestionsTimer, "isValid");
  if (!v4)
    return 0;
  return result;
}

- (void)_updateInitialSuggestionsTimer
{
  unsigned __int8 v3;
  NSTimer *initialSuggestionsTimer;
  NSTimer *v5;
  NSTimer *v6;
  NSTimer *v7;

  v3 = -[SuggestionsDataProvider hasInitialData](self->_suggestionsDataProvider, "hasInitialData");
  initialSuggestionsTimer = self->_initialSuggestionsTimer;
  if ((v3 & 1) != 0)
  {
    -[NSTimer invalidate](initialSuggestionsTimer, "invalidate");
    v5 = 0;
  }
  else
  {
    if (initialSuggestionsTimer)
      return;
    v6 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_initialSuggestionsTimerDidFire", 0, 0, GEOConfigGetDouble(MapsConfig_ProactiveTrayInitialSuggestionsTimeout, off_1014B33E8));
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(v6);
  }
  v7 = self->_initialSuggestionsTimer;
  self->_initialSuggestionsTimer = v5;

}

- (void)_initialSuggestionsTimerDidFire
{
  -[NSTimer invalidate](self->_initialSuggestionsTimer, "invalidate");
  if (-[DataSource active](self, "active"))
    -[HomeCellProvider _setNeedsSnapshotUpdateAnimated:](self, "_setNeedsSnapshotUpdateAnimated:", 1);
}

- (void)_resetSnapshotUpdateState
{
  self->_animateNextUpdate = 0;
  self->_needsUpdate = 0;
}

- (void)_setNeedsSnapshotUpdateAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = a3;
  if (-[DataSource active](self, "active"))
  {
    v5 = sub_100432EDC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_signpost_enabled(v6))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetNeedsApplySnapshot", ", (uint8_t *)&v21, 2u);
    }

    -[HomeCellProvider _updateInitialSuggestionsTimer](self, "_updateInitialSuggestionsTimer");
    if (-[HomeCellProvider _isLoading](self, "_isLoading"))
    {
      v7 = sub_100432EDC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

      if (!v9)
        return;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _loadingDataProviders](self, "_loadingDataProviders"));
      v11 = sub_10039DCD4(v10, &stru_1011C1238);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));

      v14 = sub_100432EDC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class(self);
        v17 = NSStringFromClass(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", ")));
        v21 = 138412546;
        v22 = v18;
        v23 = 2112;
        v24 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data has not loaded in data providers [%@]", (uint8_t *)&v21, 0x16u);

      }
    }
    else
    {
      if (-[HomeCellProvider _needsSnapshotUpdate](self, "_needsSnapshotUpdate")
        && self->_animateNextUpdate != v3
        && self->_appliedInitialUpdate
        && self->_appliedActiveUpdate)
      {
        -[HomeCellProvider updateIfNeeded](self, "updateIfNeeded");
      }
      self->_animateNextUpdate = v3;
      self->_needsUpdate = 1;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeUpdateDelegate](self, "homeUpdateDelegate"));
      objc_msgSend(v13, "homeSetNeedsUpdate");
    }

  }
}

- (BOOL)_needsSnapshotUpdate
{
  _BOOL4 v3;

  v3 = -[DataSource active](self, "active");
  if (v3)
  {
    if (-[HomeCellProvider _isLoading](self, "_isLoading"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = self->_needsUpdate || !self->_appliedInitialUpdate;
  }
  return v3;
}

- (void)updateIfNeeded
{
  _BOOL8 v3;
  _BOOL8 animateNextUpdate;

  if (-[HomeCellProvider _needsSnapshotUpdate](self, "_needsSnapshotUpdate"))
  {
    if (self->_appliedInitialUpdate)
    {
      if (self->_appliedActiveUpdate)
      {
        v3 = 0;
        animateNextUpdate = self->_animateNextUpdate;
      }
      else
      {
        animateNextUpdate = 0;
        v3 = 0;
      }
    }
    else
    {
      animateNextUpdate = 0;
      v3 = self->_animateNextUpdate;
    }
    self->_appliedInitialUpdate = 1;
    self->_appliedActiveUpdate = 1;
    -[HomeCellProvider _resetSnapshotUpdateState](self, "_resetSnapshotUpdateState");
    -[HomeCellProvider _applySnapshotUpdateAndAnimateCells:animateTableView:](self, "_applySnapshotUpdateAndAnimateCells:animateTableView:", animateNextUpdate, v3);
  }
  -[HomeCellProvider _updateOrthogonalSectionCells](self, "_updateOrthogonalSectionCells");
}

- (void)_applySnapshotUpdateAndAnimateCells:(BOOL)a3 animateTableView:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSArray *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  __CFString *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  os_signpost_id_t v51;
  void *v52;
  unint64_t v53;
  id v54;
  _QWORD v55[6];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;

  v4 = a4;
  v5 = a3;
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_make_with_pointer(v8, self);

  v10 = sub_100432EDC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  v13 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14 = sub_10039E4FC(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = sub_10039E4FC(v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138412546;
    v57 = v15;
    v58 = 2112;
    v59 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ApplySnapshot", "animateCells = %@, animateTableView = %@", buf, 0x16u);

  }
  if (v4)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v18, "alpha");
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v21, "setAlpha:", 0.0);

    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_100703E54;
    v55[3] = &unk_1011AD518;
    v55[4] = self;
    v55[5] = v20;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v55, 0.25);
  }
  -[HomeCellProvider _processPendingDeletions](self, "_processPendingDeletions");
  v22 = self->_homeSections;
  -[HomeCellProvider _buildSections](self, "_buildSections");
  v54 = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _snapshotWithOldHomeSections:outDifference:](self, "_snapshotWithOldHomeSections:outDifference:", v22, &v54));
  v24 = v54;
  if (objc_msgSend(v24, "hasChanges"))
  {
    -[UITableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v23, v5);
    -[HomeCellProvider _configureVisibleHeaders](self, "_configureVisibleHeaders");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeActionDelegate](self, "homeActionDelegate"));
    objc_msgSend(v25, "homeContentDidUpdate");

  }
  v26 = sub_100432EDC();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);

  if (v28)
  {
    v53 = v9 - 1;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "reloadedItems"));
    v30 = sub_10039DCD4(v29, &stru_1011C1278);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "insertedItems"));
    v33 = sub_10039DCD4(v32, &stru_1011C1298);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "deletedItems"));
    v36 = sub_10039DCD4(v35, &stru_1011C12B8);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

    v38 = sub_100432EDC();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = sub_10039E4FC(v5);
      v52 = v34;
      v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
      v42 = sub_10039E4FC(v4);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v51 = v9;
      v50 = v31;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "componentsJoinedByString:", CFSTR(", ")));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", ")));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138413314;
      v57 = v41;
      v58 = 2112;
      v59 = v43;
      v60 = 2112;
      v61 = v44;
      v62 = 2112;
      v63 = v45;
      v64 = 2112;
      v65 = v46;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "HCP applySnapshot {\n\tanimateCells: %@\n\tanimateTableView: %@\n\treloads: [%@]\n\tinsertions: [%@]\n\tdeletions: [%@]\n}", buf, 0x34u);

      v9 = v51;
      v31 = v50;

      v34 = v52;
    }

    v13 = v53;
  }
  v47 = sub_100432EDC();
  v48 = objc_claimAutoreleasedReturnValue(v47);
  v49 = v48;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, v9, "ApplySnapshot", ", buf, 2u);
  }

}

- (id)analyticsContext
{
  return self->_analyticsContext;
}

- (void)_addAnalyticsInfo
{
  void *v3;
  void *v4;
  void *v5;
  AutocompleteContext *v6;
  AutocompleteContext *analyticsContext;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSection contents](self->_suggestionsSection, "contents"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeSection contents](self->_recentsSection, "contents"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = -[AutocompleteContext initWithQueryString:]([AutocompleteContext alloc], "initWithQueryString:", &stru_1011EB268);
  analyticsContext = self->_analyticsContext;
  self->_analyticsContext = v6;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0, (_QWORD)v16));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider analyticsContext](self, "analyticsContext"));
        objc_msgSend(v15, "setMatchInfo:forObject:", v14, v13);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_updateRestaurantReservationAnalytics
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _allObjects](self, "_allObjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel, (_QWORD)v17))v10 = v9;
        else
          v10 = 0;
        v11 = v10;

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
        v13 = objc_msgSend(v12, "type");

        if (v13 == (id)8)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "MKMapItem"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v15, "_muid")));
          objc_msgSend(v3, "addObject:", v16);

        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  +[RestaurantReservationAnalyticsBookedSession removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:](RestaurantReservationAnalyticsBookedSession, "removeAnalyticsBookedSessionsFromProactiveTrayIfNotInListOfMuids:", v3);
}

- (id)objectsForAnalytics
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _allObjects](self, "_allObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider analyticsContext](self, "analyticsContext", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matchInfoForObject:", v10));

        if (v12)
          objc_msgSend(v4, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = objc_msgSend(v4, "copy");
  return v13;
}

- (void)sendNoTypingACAnalyticsForSelectedAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectsForAnalytics](self, "objectsForAnalytics"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider analyticsContext](self, "analyticsContext"));
    v6 = -[HomeCellProvider newTraits](self, "newTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:](MapsAnalyticsHelper, "acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:", v4, v5, 0, 1, v6));

  }
  else
  {
    v7 = 0;
  }
  if (v9)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v9, "row")));
    +[GEOAPPortal captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:](GEOAPPortal, "captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:", &stru_1011EB268, 0, v7, v8, 0, 0, 0, 0, 0);

  }
  else
  {
    +[GEOAPPortal captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:](GEOAPPortal, "captureClientACSuggestionWithQuery:queryTokens:entries:selectedIndex:selectedSectionIndex:withinSectionSelectedIndex:isRetainedQuery:isRerankerTriggered:shouldDifferentiateClientAndServerResults:", &stru_1011EB268, 0, v7, 0, 0, 0, 0, 0, 0);
  }

}

- (int)targetForDragAnalytics
{
  return 8;
}

- (void)_captureTapActionWithObject:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __objc2_prot *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __objc2_prot *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  unsigned int v29;
  id v30;
  id v31;
  __objc2_prot *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char isKindOfClass;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  id v54;

  v54 = a3;
  v6 = a4;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2007, 8, 0);
  if (objc_msgSend(v54, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "entry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "analyticsGrouping"));
    v9 = 2039;
LABEL_15:
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v9, 8, v8);

    goto LABEL_16;
  }
  v10 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v54, v10) & 1) != 0)
  {
    v11 = v54;
    v12 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
    v13 = objc_opt_class(HistoryEntryRecentsItem);
    v14 = v11;
    if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v16
      && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "historyEntry")),
          v18 = objc_msgSend(v17, "conformsToProtocol:", v12),
          v17,
          v18))
    {
      v19 = v14;
    }
    else
    {
      v19 = 0;
    }

    if (v19)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v9 = 175;
      goto LABEL_15;
    }
    v22 = v14;
    v23 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
    v24 = objc_opt_class(HistoryEntryRecentsItem);
    v25 = v22;
    if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    if (v27
      && (v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "historyEntry")),
          v29 = objc_msgSend(v28, "conformsToProtocol:", v23),
          v28,
          v29))
    {
      v30 = v25;
    }
    else
    {
      v30 = 0;
    }

    if (!v30)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
      v9 = 2064;
      goto LABEL_15;
    }
    v31 = v25;
    v32 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
    v33 = objc_opt_class(HistoryEntryRecentsItem);
    v34 = v31;
    if ((objc_opt_isKindOfClass(v34, v33) & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    if (v36
      && (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "historyEntry")),
          v38 = objc_msgSend(v37, "conformsToProtocol:", v32),
          v37,
          v38))
    {
      v7 = v34;
    }
    else
    {
      v7 = 0;
    }

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyEntry"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "endWaypoint"));
    v41 = objc_opt_class(GEOComposedWaypointToRoute);
    isKindOfClass = objc_opt_isKindOfClass(v40, v41);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyEntry"));
    v44 = v43;
    if ((isKindOfClass & 1) != 0)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "endWaypoint"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "route"));
      v47 = objc_msgSend(v46, "source");

      if (v47 == (id)3)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));
        v50 = 468;
      }
      else
      {
        if (v47 != (id)2)
        {
LABEL_48:

          goto LABEL_16;
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringValue"));
        v50 = 462;
      }
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v50, 8, v49);

    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "waypoints"));
      v52 = objc_msgSend(v51, "count");

      if ((unint64_t)v52 > 2)
        v53 = 302;
      else
        v53 = 303;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "row")));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringValue"));
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v53, 8, v48);
    }

    goto LABEL_48;
  }
  v20 = objc_opt_class(SharedTripSummary);
  if ((objc_opt_isKindOfClass(v54, v20) & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "_transportTypeStringForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 737, v7);
  }
  else
  {
    v21 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v54, v21) & 1) == 0)
      goto LABEL_17;
    v7 = v54;
    if (objc_msgSend(v7, "handlerType") == (id)4)
      -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2099, v7, objc_msgSend(v6, "row"));
  }
LABEL_16:

LABEL_17:
}

- (void)_captureShareActionWithObject:(id)a3 indexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2037, 8, 0);
  if (objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2040, 8, 0);
  v7 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2008, 8, 0);
    v8 = v10;
    v9 = objc_msgSend(v8, "handlerType");
    if (v9 == (id)4)
    {
      -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2096, v8, objc_msgSend(v6, "row"));
    }
    else if (!v9)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2082, 8, 0);
    }

  }
}

- (void)_captureDeleteActionWithObject:(id)a3 indexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel) & 1) == 0)
  {
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2038, 8, 0);
    v7 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
    {
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2009, 8, 0);
      v8 = v10;
      v9 = objc_msgSend(v8, "handlerType");
      if (v9 == (id)4)
      {
        -[HomeCellProvider _captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](self, "_captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", 2088, v8, objc_msgSend(v6, "row"));
      }
      else if (!v9)
      {
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2081, 8, 0);
      }

    }
  }

}

- (void)_captureSuggestionDeleteActionWithEntry:(id)a3 behaviour:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = objc_msgSend(a3, "proactiveItemType");
  if (v5 >= 0x17)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v5));
  else
    v6 = *(&off_1011C14A8 + (int)v5);
  if ((unint64_t)a4 <= 8 && ((0x117u >> a4) & 1) != 0)
  {
    v7 = dword_100E3A1C0[a4];
    v8 = dword_100E3A1E4[a4];
    v9 = v6;
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v7, 8, 0);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v8, 8, v9);
    v6 = v9;
  }

}

- (void)_captureHeaderActionWithHomeSection:(id)a3
{
  if (objc_msgSend(a3, "type") == (id)2)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2045, 8, 0);
}

- (void)_captureCuratedCollectionAction:(int)a3 withCollectionHandler:(id)a4 verticalIndex:(unint64_t)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint8_t v9[16];

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = objc_opt_class(CuratedCollectionHandler);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    +[HomeAnalyticsManager captureCuratedCollectionAction:withCollectionHandler:verticalIndex:](HomeAnalyticsManager, "captureCuratedCollectionAction:withCollectionHandler:verticalIndex:", v6, v7, a5);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [collectionHandler isKindOfClass:CuratedCollectionHandler.class]", v9, 2u);
  }

}

- (id)_snapshotWithOldHomeSections:(id)a3 outDifference:(id *)a4
{
  id v6;
  id v7;
  NSArray *homeSections;
  id v9;
  id v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  MapsUIDiffableDataSourceSnapshotDifference *v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100704F9C;
  v22 = sub_100704FAC;
  v23 = -[MapsUIDiffableDataSourceSnapshotDifference initWithReloadedItems:insertedItems:deletedItems:]([MapsUIDiffableDataSourceSnapshotDifference alloc], "initWithReloadedItems:insertedItems:deletedItems:", &__NSArray0__struct, &__NSArray0__struct, &__NSArray0__struct);
  v7 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  homeSections = self->_homeSections;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100704FB4;
  v14[3] = &unk_1011C1308;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v16 = v10;
  v17 = &v18;
  -[NSArray enumerateObjectsUsingBlock:](homeSections, "enumerateObjectsUsingBlock:", v14);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100705194;
  v13[3] = &unk_1011C1330;
  v13[4] = self;
  v13[5] = &v18;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  UGCProactiveCallToActionButtonView *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  HomeCellProvider *v56;
  _BYTE *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  HomeCellProvider *v62;
  _BYTE *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  _BYTE buf[24];
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;

  v51 = a3;
  v8 = a4;
  v9 = a5;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_100704F9C;
  v72 = sub_100704FAC;
  v73 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _objectsInSectionAtIndexPath:](self, "_objectsInSectionAtIndexPath:", v8));
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_100705C60;
  v64[3] = &unk_1011B8440;
  v11 = v9;
  v65 = v11;
  v67 = &v68;
  v12 = v8;
  v66 = v12;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v64);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v69[5]));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v69[5]));
  v14 = sub_100432EDC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HDS cellForRowAtIndexPath %@ %@", buf, 0x16u);
  }

  v16 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v13, v16) & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v17, v12));

    v19 = (id)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:](TwoLinesContentViewModelComposer, "cellModelForHistoryEntryRecentsItem:showAutocompleteClientSource:showPlaceContext:", v13, 0, 0));
    objc_msgSend(v18, "setViewModel:", v19);
  }
  else
  {
    v20 = objc_opt_class(CRRecentContact);
    if ((objc_opt_isKindOfClass(v13, v20) & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v21, v12));

      v19 = (id)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForRecentContact:](TwoLinesContentViewModelComposer, "cellModelForRecentContact:", v13));
      objc_msgSend(v18, "setViewModel:", v19);
    }
    else if (objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
    {
      v19 = v13;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v22, v12));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entry"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subtitle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForMapsSuggestionEntry:title:subtitle:](TwoLinesContentViewModelComposer, "cellModelForMapsSuggestionEntry:title:subtitle:", v23, v24, v25));

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entry"));
      if (MapsFeature_IsEnabled_LagunaBeach(v27)
        && (objc_msgSend(v27, "type") == (id)21
         || GEOConfigGetBOOL(MapsConfig_ARPForceAllMapsHomeSuggestionsAsRatingSuggestions, off_1014B3A78)))
      {
        v28 = objc_opt_class(HomeListPhotoSuggestionCellModel);
        if ((objc_opt_isKindOfClass(v19, v28) & 1) == 0)
        {
          v29 = -[UGCProactiveCallToActionButtonView initWithFrame:]([UGCProactiveCallToActionButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
          -[UGCProactiveCallToActionButtonView systemLayoutSizeFittingSize:](v29, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
          -[UGCProactiveCallToActionButtonView setFrame:](v29, "setFrame:", 0.0, 0.0, v30, v31);
          -[UGCProactiveCallToActionButtonView setDelegate:](v29, "setDelegate:", self);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "uniqueIdentifier"));
          -[UGCProactiveCallToActionButtonView setLookupIdentifier:](v29, "setLookupIdentifier:", v32);

          objc_msgSend(v26, "setCustomAccessoryView:", v29);
        }
      }
      objc_msgSend(v18, "setViewModel:", v26);

    }
    else
    {
      v33 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v13, v33) & 1) != 0)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
        v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v34, v12));

        v19 = (id)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSearchResult:](TwoLinesContentViewModelComposer, "cellModelForSearchResult:", v13));
        objc_msgSend(v18, "setViewModel:", v19);
      }
      else
      {
        v35 = objc_opt_class(SharedTripSummary);
        if ((objc_opt_isKindOfClass(v13, v35) & 1) != 0)
        {
          v19 = v13;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesTableViewCell identifier](TwoLinesTableViewCell, "identifier"));
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v36, v12));

          v37 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForSharedTripSummary:](TwoLinesContentViewModelComposer, "cellModelForSharedTripSummary:", v19));
          objc_msgSend(v18, "setViewModel:", v37);

        }
        else
        {
          v38 = objc_opt_class(CollectionHandler);
          if ((objc_opt_isKindOfClass(v13, v38) & 1) != 0)
          {
            v19 = v13;
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionTableViewCell identifier](CollectionTableViewCell, "identifier"));
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v39, v12));
            objc_msgSend(v18, "setCollectionInfo:", v19);

          }
          else if (objc_msgSend(v50, "type") == (id)2)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[ShortcutsRowTableViewCell identifier](ShortcutsRowTableViewCell, "identifier"));
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v75 = sub_100704F9C;
            v76 = sub_100704FAC;
            v77 = 0;
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_100705CF8;
            v58[3] = &unk_1011C1358;
            v63 = buf;
            v59 = v51;
            v19 = v40;
            v60 = v19;
            v61 = v12;
            v62 = self;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v58);
            v41 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            v42 = objc_opt_class(HomeOrthogonalSectionTableViewCell);
            if ((objc_opt_isKindOfClass(v41, v42) & 1) != 0)
              -[NSHashTable addObject:](self->_orthogonalSectionCells, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAccessibilityIdentifier:", CFSTR("ShortcutsSectionCell"));
            v18 = *(id *)(*(_QWORD *)&buf[8] + 40);

            _Block_object_dispose(buf, 8);
          }
          else if (objc_msgSend(v50, "type") == (id)4)
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(+[HomeCuratedCollectionsTableViewCell identifier](HomeCuratedCollectionsTableViewCell, "identifier"));
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v75 = sub_100704F9C;
            v76 = sub_100704FAC;
            v77 = 0;
            v52[0] = _NSConcreteStackBlock;
            v52[1] = 3221225472;
            v52[2] = sub_100705F04;
            v52[3] = &unk_1011C1358;
            v57 = buf;
            v53 = v51;
            v19 = v43;
            v54 = v19;
            v55 = v12;
            v56 = self;
            +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
            v44 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            v45 = objc_opt_class(HomeOrthogonalSectionTableViewCell);
            if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
              -[NSHashTable addObject:](self->_orthogonalSectionCells, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setAccessibilityIdentifier:", CFSTR("CuratedCollectionsSectionCell"));
            v18 = *(id *)(*(_QWORD *)&buf[8] + 40);

            _Block_object_dispose(buf, 8);
          }
          else
          {
            v46 = objc_opt_class(FeatureDiscoveryModel);
            if ((objc_opt_isKindOfClass(v13, v46) & 1) == 0)
            {
              v18 = 0;
              goto LABEL_31;
            }
            v19 = v13;
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[FeatureDiscoveryTableViewCell reuseIdentifier](FeatureDiscoveryTableViewCell, "reuseIdentifier"));
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "dequeueReusableCellWithIdentifier:forIndexPath:", v47, v12));

            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "featureDiscoveryView"));
            objc_msgSend(v48, "setModel:", v19);

            objc_msgSend(v18, "setContext:", 0);
          }
        }
      }
    }
  }

LABEL_31:
  _Block_object_dispose(&v68, 8);

  return v18;
}

- (void)_updateOrthogonalSectionCells
{
  NSHashTable *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_orthogonalSectionCells;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "updateHidden", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  double Width;
  void *v17;
  void *v18;
  double v19;
  CGRect v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v7));

  v9 = 0.0;
  if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v8)
    && -[HomeCellProvider _shouldShowHeaderForSection:](self, "_shouldShowHeaderForSection:", v8))
  {
    v10 = objc_msgSend(v6, "_maps_indexOfFirstNonEmptySection");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
    v12 = objc_msgSend(v8, "showsSectionButton");
    if (v12)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedButtonName"));
    else
      v13 = 0;
    v14 = v10 == (id)a4;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v15, "bounds");
    Width = CGRectGetWidth(v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "traitCollection"));
    +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v14, v11, v13, v18, Width);
    v9 = v19;

    if (v12)
  }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v7));

  v9 = 0;
  if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v8))
  {
    if (-[HomeCellProvider _shouldShowHeaderForSection:](self, "_shouldShowHeaderForSection:", v8))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderTableViewHeaderFooterView reuseIdentifier](SectionHeaderTableViewHeaderFooterView, "reuseIdentifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v10));

      -[HomeCellProvider _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v9, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_diffableDataSourceIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Home"), "stringByAppendingString:", v11));
      objc_msgSend(v9, "setAccessibilityIdentifiersWithBaseString:", v12);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)_configureVisibleHeaders
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  CGRect v26;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v4 = (uint64_t)objc_msgSend(v3, "numberOfSections");

  if (v4 >= 1)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v6, "rectForHeaderInSection:", v5);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      objc_msgSend(v15, "bounds");
      v27.origin.x = v16;
      v27.origin.y = v17;
      v27.size.width = v18;
      v27.size.height = v19;
      v26.origin.x = v8;
      v26.origin.y = v10;
      v26.size.width = v12;
      v26.size.height = v14;
      v20 = CGRectIntersectsRect(v26, v27);

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "headerViewForSection:", v5));

        v23 = objc_opt_class(SectionHeaderTableViewHeaderFooterView);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          -[HomeCellProvider _configureHeaderView:inSection:](self, "_configureHeaderView:inSection:", v22, v5);

      }
      ++v5;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v25 = objc_msgSend(v24, "numberOfSections");

    }
    while (v5 < (uint64_t)v25);
  }
}

- (void)_configureHeaderView:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v7));

  if (!-[HomeCellProvider _isEmptySection:](self, "_isEmptySection:", v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedName"));
    objc_msgSend(v6, "setTitle:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    objc_msgSend(v6, "setFirstNonEmptySection:", objc_msgSend(v10, "_maps_indexOfFirstNonEmptySection") == (id)a4);

    if ((objc_msgSend(v8, "showsSectionButton") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedButtonName"));
      objc_msgSend(v6, "setActionTitle:", v11);

    }
    else
    {
      objc_msgSend(v6, "setActionTitle:", 0);
    }
    objc_msgSend(v6, "setShowsBottomHairline:", 0);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1007067A8;
    v15[3] = &unk_1011AD1E8;
    objc_copyWeak(&v17, &location);
    v16 = v8;
    objc_msgSend(v6, "setActionHandler:", v15);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007067E4;
    v12[3] = &unk_1011B15B0;
    v12[4] = self;
    v14 = a4;
    v13 = v6;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)_sectionHeaderButtonTappedWithHomeSection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "dataSource:sectionHeaderTapped:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v6, "dataSource:sectionHeaderTapped:", self, v7);

    -[HomeCellProvider _captureHeaderActionWithHomeSection:](self, "_captureHeaderActionWithHomeSection:", v7);
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v5));

  v7 = objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_homeSections, "lastObject"));
  if (v6 == (void *)v7)
  {

  }
  else
  {
    v8 = (void *)v7;
    v9 = objc_msgSend(v6, "isEqual:", v7);

    v10 = 0.0;
    if (!v9)
      goto LABEL_6;
  }
  v10 = UITableViewAutomaticDimension;
LABEL_6:

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  HomeSection *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  HomeActionFooterViewModel *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  HomeCellProvider *v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a4));
  v8 = (HomeSection *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v7));

  v9 = objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_homeSections, "lastObject"));
  if (v8 == (HomeSection *)v9)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = -[HomeSection isEqual:](v8, "isEqual:", v9);

    if (!v11)
    {
      v12 = 0;
      goto LABEL_8;
    }
  }
  v13 = objc_alloc_init(HomeActionFooterViewModel);
  -[HomeActionFooterViewModel setDelegate:](v13, "setDelegate:", self);
  v14 = 20.0;
  if (v8 == self->_curatedCollectionsSection)
    v14 = 11.0;
  -[HomeActionFooterViewModel setTopMargin:](v13, "setTopMargin:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[HomeActionFooterView classReuseIdentifier](HomeActionFooterView, "classReuseIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", v15));

  objc_msgSend(v16, "setViewModel:", v13);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100706B50;
  v19[3] = &unk_1011AC8B0;
  v17 = v16;
  v20 = v17;
  v21 = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v19);
  v12 = v17;

LABEL_8:
  return v12;
}

- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeActionDelegate](self, "homeActionDelegate", a3));
  objc_msgSend(v3, "homeDidTapShareMyLocation");

  +[HomeAnalyticsManager captureShareMyLocationAction](HomeAnalyticsManager, "captureShareMyLocationAction");
}

- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeActionDelegate](self, "homeActionDelegate", a3));
  objc_msgSend(v3, "homeDidTapMarkMyLocation");

  +[HomeAnalyticsManager captureMarkMyLocationAction](HomeAnalyticsManager, "captureMarkMyLocationAction");
}

- (void)homeActionFooterViewDidTapReportAProblem:(id)a3
{
  void *v4;

  if ((MapsFeature_IsEnabled_RAPCommunityID(self, a2) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeActionDelegate](self, "homeActionDelegate"));
    objc_msgSend(v4, "homeDidTapReportAProblem");

  }
  +[HomeAnalyticsManager captureRAPAction](HomeAnalyticsManager, "captureRAPAction");
}

- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[HomeCellProvider homeActionDelegate](self, "homeActionDelegate", a3));
  objc_msgSend(v3, "homeDidTapTermsAndConditions");

}

- (id)homeActionFooterViewUIMenuForRAP:(id)a3
{
  RAPReportMenuProvider *rapReportMenuProvider;
  void *v5;
  void *v6;
  void *v7;

  if (MapsFeature_IsEnabled_RAPCommunityID(self, a2))
  {
    rapReportMenuProvider = self->_rapReportMenuProvider;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_mapsSceneDelegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReportMenuProvider getReportMenuFromEntryPoint:sceneDelegate:](rapReportMenuProvider, "getReportMenuFromEntryPoint:sceneDelegate:", 8, v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)deleteContextualActionAtIndexPath:(id)a3
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
  v9[2] = sub_100706E18;
  v9[3] = &unk_1011B9930;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = sub_100A3CEB8(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
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
  v9[2] = sub_100706F48;
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

- (id)editLocationContextualActionAtIndexPath:(id)a3
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
  v9[2] = sub_100707078;
  v9[3] = &unk_1011B9930;
  objc_copyWeak(&v11, &location);
  v5 = v4;
  v10 = v5;
  v6 = sub_100A3CFA8(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (void)_deleteCollection:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id location;
  id v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100707384;
  v32[3] = &unk_1011C13A0;
  v11 = v8;
  v33 = v11;
  v12 = v9;
  v34 = v12;
  v13 = v10;
  v35 = v13;
  objc_copyWeak(&v36, &location);
  v14 = objc_retainBlock(v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v12));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteDelegate](self, "deleteDelegate"));
  v38 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
  objc_msgSend(v16, "bounds");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100707418;
  v29[3] = &unk_1011AF960;
  v27 = v14;
  v30 = v27;
  v28 = v13;
  v31 = v28;
  objc_msgSend(v17, "confirmDeleteCollections:sourceView:sourceRect:completion:", v18, v16, v29, v20, v22, v24, v26);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

}

- (void)_deleteSharedTripWithSummary:(id)a3 atIndexPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10070763C;
  v31[3] = &unk_1011C13A0;
  v11 = v8;
  v32 = v11;
  v12 = v9;
  v33 = v12;
  v13 = v10;
  v34 = v13;
  objc_copyWeak(&v35, &location);
  v14 = objc_retainBlock(v31);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cellForRowAtIndexPath:", v12));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteDelegate](self, "deleteDelegate"));
  objc_msgSend(v16, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1007076D0;
  v28[3] = &unk_1011AF960;
  v26 = v14;
  v29 = v26;
  v27 = v13;
  v30 = v27;
  objc_msgSend(v17, "confirmDeleteSharedTripWithSummary:sourceView:sourceRect:completion:", v11, v16, v28, v19, v21, v23, v25);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

- (void)deleteRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  HomeDeletion *v13;
  IdentifierPath *v14;
  HomeDeletion *v15;
  int v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "HCP deleteRowAtIndexPath object %@", (uint8_t *)&v16, 0xCu);
  }

  if (v8)
  {
    v11 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
    {
      -[HomeCellProvider _deleteCollection:atIndexPath:completion:](self, "_deleteCollection:atIndexPath:completion:", v8, v6, v7);
    }
    else
    {
      v12 = objc_opt_class(SharedTripSummary);
      if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
      {
        -[HomeCellProvider _deleteSharedTripWithSummary:atIndexPath:completion:](self, "_deleteSharedTripWithSummary:atIndexPath:completion:", v8, v6, v7);
      }
      else
      {
        v13 = [HomeDeletion alloc];
        v14 = objc_alloc_init(IdentifierPath);
        v15 = -[HomeDeletion initWithObject:indexPath:identifierPath:contextualActionCompletionHandler:](v13, "initWithObject:indexPath:identifierPath:contextualActionCompletionHandler:", v8, v6, v14, v7);

        -[HomeCellProvider _beginDeletion:](self, "_beginDeletion:", v15);
      }
    }
  }

}

- (void)shareRowAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  v9 = objc_opt_class(CuratedCollectionHandler);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) == 0)
  {
    v12 = objc_opt_class(CollectionHandler);
    if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HomeCellProvider shareDelegate](self, "shareDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cellForRowAtIndexPath:", v6));
      objc_msgSend(v11, "shareCollection:sourceView:completion:", v8, v14, v7);
    }
    else
    {
      if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
      {
        v15 = v8;
        v11 = (id)objc_claimAutoreleasedReturnValue(-[HomeCellProvider shareDelegate](self, "shareDelegate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entry"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cellForRowAtIndexPath:", v6));
        objc_msgSend(v11, "shareItem:sourceView:completion:", v17, v19, v7);

        goto LABEL_9;
      }
      v11 = (id)objc_claimAutoreleasedReturnValue(-[HomeCellProvider shareDelegate](self, "shareDelegate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v8));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForRowAtIndexPath:", v6));
      objc_msgSend(v11, "shareItem:sourceView:completion:", v13, v20, v7);

    }
    goto LABEL_9;
  }
  v10 = v8;
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100707B68;
  v21[3] = &unk_1011C13C8;
  v11 = v10;
  v22 = v11;
  v24 = v7;
  objc_copyWeak(&v25, &location);
  v23 = v6;
  objc_msgSend(v11, "retrieveGeoCollectionWithRefinedItems:", v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
LABEL_9:

  -[HomeCellProvider _captureShareActionWithObject:indexPath:](self, "_captureShareActionWithObject:indexPath:", v8, v6);
}

- (void)editLocationAtIndexPath:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v6));
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entry"));
  if (objc_msgSend(v11, "type") == (id)7)
  {
    -[DataSource sendAnalyticsForDataAtIndexPath:object:action:](self, "sendAnalyticsForDataAtIndexPath:object:action:", v6, v8, 2010);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ParkedCarManager sharedManager](ParkedCarManager, "sharedManager"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100707E64;
    v13[3] = &unk_1011C13F0;
    v13[4] = self;
    v14 = v7;
    objc_msgSend(v12, "fetchParkedCar:", v13);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_beginDeletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id WeakRetained;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  RecentsDataProvider *recentsDataProvider;
  void *v37;
  uint64_t v38;
  RecentsDataProvider *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id *v45;
  id *v46;
  id *location;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD v50[4];
  _QWORD *v51;
  _QWORD v52[4];
  _QWORD *v53;
  _QWORD v54[4];
  id v55;
  _QWORD *v56;
  id v57;
  _QWORD v58[4];
  _QWORD *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint8_t buf[4];
  void *v71;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = sub_10046DCCC(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDeletions, "objectForKeyedSubscript:", v7));

  if (!v8)
  {
    v9 = sub_100432EDC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v71 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "HCP _beginDeletion: %@", buf, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingDeletions, "setObject:forKeyedSubscript:", v4, v7);
    objc_initWeak((id *)buf, self);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100708570;
    v64[3] = &unk_1011C1418;
    v11 = v7;
    v65 = v11;
    v12 = v4;
    v66 = v12;
    v45 = &v67;
    objc_copyWeak(&v67, (id *)buf);
    v48 = objc_retainBlock(v64);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100708654;
    v60[3] = &unk_1011C1440;
    v61 = v11;
    v13 = v12;
    v62 = v13;
    location = &v63;
    objc_copyWeak(&v63, (id *)buf);
    v49 = objc_retainBlock(v60);
    if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
    {
      v14 = v5;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entry", &v67, &v63));
      v16 = sub_100B3A5D4();
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v17, "feedbackForEntry:action:", v15, 5);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath"));
      objc_msgSend(v18, "rectForRowAtIndexPath:", v19);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDelegate);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_100708774;
      v58[3] = &unk_1011ADA00;
      v59 = v48;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100708780;
      v54[3] = &unk_1011C1468;
      v30 = v15;
      v55 = v30;
      objc_copyWeak(&v57, (id *)buf);
      v56 = v49;
      objc_msgSend(WeakRetained, "viewController:removeMapsSuggestionsEntry:sourceView:sourceRect:startBlock:completionBlock:", 0, v30, v29, v58, v54, v21, v23, v25, v27);

      objc_destroyWeak(&v57);
    }
    else
    {
      v31 = objc_opt_class(CollectionHandler);
      if ((objc_opt_isKindOfClass(v5, v31) & 1) != 0)
      {
        v14 = v5;
        ((void (*)(_QWORD *, uint64_t))v48[2])(v48, v32);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_100708930;
        v52[3] = &unk_1011AE218;
        v53 = v49;
        objc_msgSend(v14, "deleteCollection:", v52, &v67, &v63);

      }
      else
      {
        v33 = objc_opt_class(SearchResult);
        if ((objc_opt_isKindOfClass(v5, v33) & 1) != 0)
        {
          objc_msgSend(v13, "markAsCompletedWithSuccess:error:", 1, 0, &v67, &v63);
          v14 = objc_loadWeakRetained((id *)&self->_deleteDelegate);
          objc_msgSend(v14, "deleteMarkedLocation:", v5);
        }
        else
        {
          v34 = objc_opt_class(HistoryEntryRecentsItem);
          if ((objc_opt_isKindOfClass(v5, v34) & 1) != 0)
          {
            ((void (*)(_QWORD *, uint64_t))v48[2])(v48, v35);
            recentsDataProvider = self->_recentsDataProvider;
            v69 = v5;
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1, &v67, &v63));
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_100708948;
            v50[3] = &unk_1011AE218;
            v51 = v49;
            -[RecentsDataProvider deleteRecents:completion:](recentsDataProvider, "deleteRecents:completion:", v37, v50);

            v14 = v51;
          }
          else
          {
            v38 = objc_opt_class(CRRecentContact);
            if ((objc_opt_isKindOfClass(v5, v38) & 1) != 0)
            {
              objc_msgSend(v13, "markAsCompletedWithSuccess:error:", 1, 0, &v67, &v63);
              v39 = self->_recentsDataProvider;
              v68 = v5;
              v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v68, 1));
              -[RecentsDataProvider deleteRecents:completion:](v39, "deleteRecents:completion:", v14, &stru_1011C1488);
            }
            else
            {
              v41 = objc_opt_class(SharedTripSummary);
              if ((objc_opt_isKindOfClass(v5, v41) & 1) == 0)
                goto LABEL_15;
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sharedTrips", &v67, &v63));
              v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "firstObject"));

              if (objc_msgSend(v14, "hasGroupIdentifier"))
              {
                objc_msgSend(v13, "markAsCompletedWithSuccess:error:", 1, 0);
                v43 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "groupIdentifier"));
                objc_msgSend(v43, "blockSharedTripWithIdentifier:", v44);

              }
              else
              {
                objc_msgSend(v13, "markAsCompletedWithSuccess:error:", 0, 0);
              }
            }
          }
        }
      }
    }

LABEL_15:
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPath", v45));
    -[HomeCellProvider _captureDeleteActionWithObject:indexPath:](self, "_captureDeleteActionWithObject:indexPath:", v5, v40);

    objc_destroyWeak(location);
    objc_destroyWeak(v46);

    objc_destroyWeak((id *)buf);
  }

}

- (void)_endDeletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD);
  int v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "completed"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v6 = sub_10046DCCC(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100432EDC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HCP _endDeletion: %@", (uint8_t *)&v11, 0xCu);
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingDeletions, "setObject:forKeyedSubscript:", 0, v7);
    if ((objc_msgSend(v4, "tentativelyDeleted") & 1) == 0)
    {
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextualActionCompletionHandler"));
      ((void (**)(_QWORD, id))v10)[2](v10, objc_msgSend(v4, "success"));

    }
  }

}

- (void)_processPendingDeletions
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *k;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SuggestionsDataProvider suggestions](self->_suggestionsDataProvider, "suggestions"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _suggestionCellModelForMapsSuggestionsEntry:](self, "_suggestionCellModelForMapsSuggestionsEntry:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i)));
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsDataProvider collections](self->_collectionsDataProvider, "collections"));
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
    objc_msgSend(v3, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider recents](self->_recentsDataProvider, "recents"));
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v3;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = sub_10046DCCC(*(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)j));
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (v21)
          objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v17);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = -[NSMutableDictionary copy](self->_pendingDeletions, "copy", 0);
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; k = (char *)k + 1)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)k);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_pendingDeletions, "objectForKeyedSubscript:", v27));
        if ((objc_msgSend(v14, "containsObject:", v27) & 1) == 0
          && (objc_msgSend(v28, "completed") & 1) == 0)
        {
          objc_msgSend(v28, "markAsCompletedWithSuccess:error:", 1, 0);
        }
        if (objc_msgSend(v28, "completed"))
          -[HomeCellProvider _endDeletion:](self, "_endDeletion:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
  }

}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HomeCellProvider;
  -[DataSource scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[HomeCellProvider _updateOrthogonalSectionCells](self, "_updateOrthogonalSectionCells");
}

- (BOOL)_isTableViewHidden:(id)a3
{
  id v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
    if ((objc_msgSend(v5, "isHidden") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
        v4 = v7 == 0;

      }
      else
      {
        v4 = 1;
      }

    }
  }

  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HomeCellProvider;
  -[DataSource tableView:willDisplayCell:forRowAtIndexPath:](&v30, "tableView:willDisplayCell:forRowAtIndexPath:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v10));
  if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entry"));
    -[DataSource addEKAnalyticsForEntry:tapped:](self, "addEKAnalyticsForEntry:tapped:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "analyticsGrouping"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 359, 8, v13);

    if (objc_msgSend(v12, "type") == (id)9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsOriginBundleIDKey")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", CFSTR("MapsSuggestionsRideBookingRideIDKey")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v14, v15));
      objc_msgSend(v16, "setViewedInProactiveTray:", 1);
    }
    else
    {
      if (objc_msgSend(v12, "type") != (id)8)
      {
        if (objc_msgSend(v12, "type") == (id)20)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
          objc_msgSend(v14, "captureUserAction:onTarget:eventValue:", 2108, 8, 0);
        }
        else
        {
          if (objc_msgSend(v12, "type") == (id)21)
          {
            +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 2138, 8, 0);
            +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 339, 8, 0);
            goto LABEL_6;
          }
          if (objc_msgSend(v12, "type") != (id)11)
            goto LABEL_6;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteInSuggestionsEntry:](SearchFieldItem, "searchFieldItemsForRouteInSuggestionsEntry:", v12));
          if ((unint64_t)objc_msgSend(v14, "count") <= 1)
            v29 = 70;
          else
            v29 = 71;
          +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, v29, 0);
        }
LABEL_5:

LABEL_6:
        goto LABEL_15;
      }
      if (-[HomeCellProvider _isTableViewHidden:](self, "_isTableViewHidden:", v8))
        goto LABEL_6;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForVisibleRows"));
      v19 = objc_msgSend(v18, "containsObject:", v10);

      if (!v19)
        goto LABEL_6;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MKMapItem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[RestaurantReservationAnalyticsBookedSession currentAnalyticsBookedSessionForMuid:createIfNotPresent:](RestaurantReservationAnalyticsBookedSession, "currentAnalyticsBookedSessionForMuid:createIfNotPresent:", objc_msgSend(v20, "_muid"), 1));

      objc_msgSend(v14, "setViewedInProactiveTray:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MKMapItem"));
      objc_msgSend(v14, "setMuid:", objc_msgSend(v21, "_muid"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "MKMapItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_restaurantLink_firstProviderIdentifier"));
      objc_msgSend(v14, "setAppID:", v16);
    }

    goto LABEL_5;
  }
  v17 = objc_opt_class(FeatureDiscoveryModel);
  if ((objc_opt_isKindOfClass(v11, v17) & 1) != 0)
  {
    objc_msgSend(v11, "markAsDisplayed");
  }
  else
  {
    v22 = objc_opt_class(SharedTripSummary);
    if ((objc_opt_isKindOfClass(v11, v22) & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_transportTypeStringForAnalytics"));
      +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 737, v23);

    }
  }
LABEL_15:
  v24 = sub_1007011B8(v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  if (self->_needsResetFavoritesScrollOffset)
  {
    v26 = objc_opt_class(ShortcutsRowTableViewCell);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
    {
      objc_msgSend(v25, "resetScrollOffset");
      self->_needsResetFavoritesScrollOffset = 0;
    }
  }
  if (self->_needsResetCuratedCollectionsScrollOffset)
  {
    v27 = objc_opt_class(HomeCuratedCollectionsTableViewCell);
    if ((objc_opt_isKindOfClass(v25, v27) & 1) != 0)
    {
      objc_msgSend(v25, "resetScrollOffset");
      self->_needsResetCuratedCollectionsScrollOffset = 0;
    }
  }
  v28 = objc_opt_class(ShortcutsRowTableViewCell);
  if ((objc_opt_isKindOfClass(v25, v28) & 1) != 0)
    objc_msgSend(v25, "fetchMissingImages");
  -[HomeCellProvider _updateOrthogonalSectionCells](self, "_updateOrthogonalSectionCells");

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", a4));
  v5 = objc_msgSend(v4, "hasOrthogonalLayout") ^ 1;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v11));
  -[HomeCellProvider sendNoTypingACAnalyticsForSelectedAtIndexPath:](self, "sendNoTypingACAnalyticsForSelectedAtIndexPath:", v11);
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v11, 1);

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___HomeCellModel))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeActionObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v9, "dataSource:itemTapped:", self, v8);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
    objc_msgSend(v8, "dataSource:itemTapped:", self, v7);
  }

  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entry"));
    -[DataSource addEKAnalyticsForEntry:tapped:](self, "addEKAnalyticsForEntry:tapped:", v10, 1);

  }
  -[HomeCellProvider _captureTapActionWithObject:indexPath:](self, "_captureTapActionWithObject:indexPath:", v7, v11);

}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v4;
  __objc2_class *v5;
  double v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", a4));
  switch((unint64_t)objc_msgSend(v4, "type"))
  {
    case 1uLL:
    case 5uLL:
      v5 = TwoLinesTableViewCell;
      goto LABEL_8;
    case 2uLL:
      v5 = ShortcutsRowTableViewCell;
      goto LABEL_8;
    case 3uLL:
      v5 = CollectionTableViewCell;
      goto LABEL_8;
    case 4uLL:
      v5 = HomeCuratedCollectionsTableViewCell;
LABEL_8:
      -[__objc2_class estimatedCellHeight](v5, "estimatedCellHeight");
      goto LABEL_9;
    case 6uLL:
      +[FeatureDiscoveryTableViewCell estimatedHeightForContext:](FeatureDiscoveryTableViewCell, "estimatedHeightForContext:", 0);
LABEL_9:
      v6 = v7;
      break;
    default:
      v6 = 0.0;
      break;
  }

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v5));
  if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entry"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v7));
    v9 = v8 != 0;

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v5));
    v9 = objc_msgSend(v7, "hasOrthogonalLayout") ^ 1;
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider objectAtIndexPath:](self, "objectAtIndexPath:", v5));
  v8 = objc_opt_class(HistoryEntryRecentsItem);
  v9 = v7;
  if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {

  }
  else
  {
    v12 = objc_opt_class(CRRecentContact);
    if ((objc_opt_isKindOfClass(v9, v12) & 1) == 0)
    {
      if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
      {
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entry"));
        if (objc_msgSend(v15, "availableRemovalBehaviors"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
          objc_msgSend(v6, "addObject:", v18);

        }
        if (objc_msgSend(v15, "type") == (id)7)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider editLocationContextualActionAtIndexPath:](self, "editLocationContextualActionAtIndexPath:", v5));
          objc_msgSend(v6, "addObject:", v19);

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v15));

        if (!v20)
          goto LABEL_9;
      }
      else
      {
        v22 = objc_opt_class(SearchResult);
        if ((objc_opt_isKindOfClass(v9, v22) & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
          objc_msgSend(v6, "addObject:", v23);

          goto LABEL_8;
        }
        v24 = objc_opt_class(CollectionHandler);
        if ((objc_opt_isKindOfClass(v9, v24) & 1) == 0)
        {
          v26 = objc_opt_class(SharedTripSummary);
          if ((objc_opt_isKindOfClass(v9, v26) & 1) == 0)
            goto LABEL_10;
          v15 = v9;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedTrips"));
          if (objc_msgSend(v27, "count") == (id)1)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sharedTrips"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "firstObject"));
            v30 = objc_msgSend(v29, "hasGroupIdentifier");

            if (!v30)
              goto LABEL_9;
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
            objc_msgSend(v6, "addObject:", v27);
          }

          goto LABEL_9;
        }
        v15 = v9;
        if (objc_msgSend(v15, "canDelete"))
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
          objc_msgSend(v6, "addObject:", v25);

        }
        if (!objc_msgSend(v15, "canShare"))
          goto LABEL_9;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
      objc_msgSend(v6, "addObject:", v21);

      goto LABEL_9;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider deleteContextualActionAtIndexPath:](self, "deleteContextualActionAtIndexPath:", v5));
  objc_msgSend(v6, "addObject:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemForObject:](ShareItem, "shareItemForObject:", v9));
  if (v14)
  {
LABEL_8:
    v15 = (id)objc_claimAutoreleasedReturnValue(-[HomeCellProvider shareContextualActionAtIndexPath:](self, "shareContextualActionAtIndexPath:", v5));
    objc_msgSend(v6, "addObject:", v15);
LABEL_9:

  }
LABEL_10:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v6));

  return v16;
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionAtIndexPath:](self, "_homeSectionAtIndexPath:", v10));
  if ((objc_msgSend(v11, "hasOrthogonalLayout") & 1) != 0)
  {
    v12 = &__NSArray0__struct;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HomeCellProvider;
    v13 = -[DataSource tableView:itemsForBeginningDragSession:atIndexPath:](&v15, "tableView:itemsForBeginningDragSession:atIndexPath:", v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (void)shortcutsRowTableViewCellAddNewShortcut:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate", a3));
  objc_msgSend(v4, "dataSource:itemTapped:", self, CFSTR("newShortcutEntry"));

}

- (void)shortcutsRowTableViewCell:(id)a3 openShortcut:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v6, "dataSource:itemTapped:", self, v5);

}

- (void)shortcutsRowTableViewCell:(id)a3 openFavorite:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v6, "dataSource:itemTapped:", self, v5);

}

- (void)proactiveCallToActionButtonViewTapped:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lookupIdentifier"));
  v4 = sub_100432EDC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "UGC - Call to action view tapped with identifier %@", buf, 0xCu);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _allObjects](self, "_allObjects"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___HomeListSuggestionCellModel))
          v12 = v11;
        else
          v12 = 0;
        v13 = v12;

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueIdentifier"));
          v16 = objc_msgSend(v15, "isEqualToString:", v3);

          if (v16)
          {
            v17 = sub_100432EDC();
            v18 = objc_claimAutoreleasedReturnValue(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v3;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "UGC -  Found a matching suggestion for identifier %@", buf, 0xCu);
            }

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider poiEnrichmentActionDelegate](self, "poiEnrichmentActionDelegate"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entry"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geoMapItem"));
            objc_msgSend(v19, "addRatingsForMapItem:", v21);

          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v5, "dataSource:itemTapped:", self, v4);

}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideLocation"));

  objc_msgSend(v6, "dataSource:itemTapped:", self, v5);
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  +[HomeAnalyticsManager captureCuratedCollectionCarouselTapCollectionWithIdentifier:atIndex:isSaved:](HomeAnalyticsManager, "captureCuratedCollectionCarouselTapCollectionWithIdentifier:atIndex:isSaved:", a3, a4, a5);
}

- (void)collectionsCarouselDidScrollForward
{
  +[HomeAnalyticsManager captureCuratedCollectionCarouselScrollForward](HomeAnalyticsManager, "captureCuratedCollectionCarouselScrollForward");
}

- (void)collectionsCarouselDidScrollBackward
{
  +[HomeAnalyticsManager captureCuratedCollectionCarouselScrollBackward](HomeAnalyticsManager, "captureCuratedCollectionCarouselScrollBackward");
}

- (void)exploreGuidesButtonTapped
{
  +[HomeAnalyticsManager captureExploreGuidesTapAction](HomeAnalyticsManager, "captureExploreGuidesTapAction");
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v5 = a4;
  if (-[NSArray containsObject:](self->_keyCommands, "containsObject:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "propertyList"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type")));
    v8 = objc_msgSend(v7, "integerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionWithType:](self, "_homeSectionWithType:", v8));
    v10 = objc_msgSend(v9, "showsSectionButton");

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)handleHomeSectionKeyCommand:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "propertyList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type")));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeCellProvider _homeSectionWithType:](self, "_homeSectionWithType:", v6));
  if (v7)
  {
    v8 = v7;
    -[HomeCellProvider _sectionHeaderButtonTappedWithHomeSection:](self, "_sectionHeaderButtonTappedWithHomeSection:", v7);
    v7 = v8;
  }

}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (int64_t)viewMode
{
  return self->_viewMode;
}

- (HomeActionDelegate)homeActionDelegate
{
  return (HomeActionDelegate *)objc_loadWeakRetained((id *)&self->_homeActionDelegate);
}

- (void)setHomeActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_homeActionDelegate, a3);
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  return (HomeUpdateDelegate *)objc_loadWeakRetained((id *)&self->_homeUpdateDelegate);
}

- (void)setHomeUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_homeUpdateDelegate, a3);
}

- (ShareDelegate)shareDelegate
{
  return (ShareDelegate *)objc_loadWeakRetained((id *)&self->_shareDelegate);
}

- (void)setShareDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shareDelegate, a3);
}

- (DeleteDelegate)deleteDelegate
{
  return (DeleteDelegate *)objc_loadWeakRetained((id *)&self->_deleteDelegate);
}

- (void)setDeleteDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deleteDelegate, a3);
}

- (PlaceCardActionDelegate)placeCardActionDelegate
{
  return (PlaceCardActionDelegate *)objc_loadWeakRetained((id *)&self->_placeCardActionDelegate);
}

- (void)setPlaceCardActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeCardActionDelegate, a3);
}

- (ParkedCarActionDelegate)parkedCarActionDelegate
{
  return (ParkedCarActionDelegate *)objc_loadWeakRetained((id *)&self->_parkedCarActionDelegate);
}

- (void)setParkedCarActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parkedCarActionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parkedCarActionDelegate);
  objc_destroyWeak((id *)&self->_placeCardActionDelegate);
  objc_destroyWeak((id *)&self->_deleteDelegate);
  objc_destroyWeak((id *)&self->_shareDelegate);
  objc_destroyWeak((id *)&self->_homeUpdateDelegate);
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_orthogonalSectionCells, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_initialSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_pendingDeletions, 0);
  objc_storeStrong((id *)&self->_analyticsContext, 0);
  objc_storeStrong((id *)&self->_filteredRecents, 0);
  objc_storeStrong((id *)&self->_featureDiscoverySection, 0);
  objc_storeStrong((id *)&self->_recentsSection, 0);
  objc_storeStrong((id *)&self->_collectionsSection, 0);
  objc_storeStrong((id *)&self->_curatedCollectionsSection, 0);
  objc_storeStrong((id *)&self->_shortcutsSection, 0);
  objc_storeStrong((id *)&self->_suggestionsSection, 0);
  objc_storeStrong((id *)&self->_homeSections, 0);
  objc_storeStrong((id *)&self->_recentsDataFilterQueue, 0);
  objc_storeStrong((id *)&self->_rapReportMenuProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_collectionsDataProvider, 0);
  objc_storeStrong((id *)&self->_resultDataProvider, 0);
  objc_storeStrong((id *)&self->_photoLookupDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_featureDiscoveryDataProvider, 0);
}

@end
