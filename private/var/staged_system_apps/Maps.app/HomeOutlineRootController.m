@implementation HomeOutlineRootController

- (HomeOutlineRootController)initWithConfiguration:(id)a3
{
  id v6;
  HomeOutlineRootController *v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  SuggestionsDataProvider *v17;
  id v18;
  SuggestionsDataProvider *v19;
  SuggestionsDataProvider *suggestionsDataProvider;
  uint64_t v21;
  _TtC4Maps20MapsFavoritesManager *favoritesDataProvider;
  _TtC4Maps33HomeListLibraryCountsDataProvider *v23;
  void *v24;
  _TtC4Maps33HomeListLibraryCountsDataProvider *v25;
  _TtC4Maps33HomeListLibraryCountsDataProvider *libraryCountsDataProvider;
  UIHoverGestureRecognizer *v27;
  UIHoverGestureRecognizer *hoverGestureRecognizer;
  void *v29;
  void *v30;
  GEOObserverHashTable *v31;
  GEOObserverHashTable *hoverChangeObservers;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HomeOutlineRootController;
  v7 = -[HomeOutlineRootController init](&v34, "init");
  if (v7)
  {
    v8 = sub_100432EDC();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class(v7);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412546;
      v36 = v12;
      v37 = 2112;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

    }
    v15 = sub_100432EDC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v7->_signpostID = os_signpost_id_make_with_pointer(v16, v7);

    objc_storeStrong((id *)&v7->_configuration, a3);
    v17 = [SuggestionsDataProvider alloc];
    v18 = objc_msgSend(objc_alloc((Class)MapsSuggestionsBlockFilter), "initWithBlock:", &stru_1011BE9A0);
    v19 = -[SuggestionsDataProvider initWithViewMode:filter:includePlaceholderShortcuts:](v17, "initWithViewMode:filter:includePlaceholderShortcuts:", 0, v18, 1);
    suggestionsDataProvider = v7->_suggestionsDataProvider;
    v7->_suggestionsDataProvider = v19;

    v21 = objc_claimAutoreleasedReturnValue(+[MapsFavoritesManager sharedManager](_TtC4Maps20MapsFavoritesManager, "sharedManager"));
    favoritesDataProvider = v7->_favoritesDataProvider;
    v7->_favoritesDataProvider = (_TtC4Maps20MapsFavoritesManager *)v21;

    v23 = [_TtC4Maps33HomeListLibraryCountsDataProvider alloc];
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[LibraryItemsCountManager sharedManager](_TtC4Maps24LibraryItemsCountManager, "sharedManager"));
    v25 = -[HomeListLibraryCountsDataProvider initWithCountsManager:](v23, "initWithCountsManager:", v24);
    libraryCountsDataProvider = v7->_libraryCountsDataProvider;
    v7->_libraryCountsDataProvider = v25;

    -[HomeOutlineRootController _setupSectionControllers](v7, "_setupSectionControllers");
    v27 = (UIHoverGestureRecognizer *)objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v7, "_hoverGestureRecognizerDidChange:");
    hoverGestureRecognizer = v7->_hoverGestureRecognizer;
    v7->_hoverGestureRecognizer = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](v7, "configuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "collectionView"));
    objc_msgSend(v30, "addGestureRecognizer:", v7->_hoverGestureRecognizer);

    v31 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___SidebarOutlineCellHoverObserver, 0);
    hoverChangeObservers = v7->_hoverChangeObservers;
    v7->_hoverChangeObservers = v31;

    v7->_loadingState = 0;
  }

  return v7;
}

- (void)_setupSectionControllers
{
  _QWORD *v3;
  HomeOutlineSearchResultsSectionController *v4;
  uint64_t v5;
  void *v6;
  HomeOutlineSearchResultsSectionController *v7;
  HomeOutlineSearchResultsSectionController *searchResultsSectionController;
  HomeOutlineFeatureDiscoverySectionController *v9;
  uint64_t v10;
  void *v11;
  HomeOutlineFeatureDiscoverySectionController *v12;
  HomeOutlineFeatureDiscoverySectionController *featureDiscoverySectionController;
  HomeOutlineSuggestionsSectionController *v14;
  uint64_t v15;
  void *v16;
  HomeOutlineSuggestionsSectionController *v17;
  HomeOutlineSuggestionsSectionController *suggestionsSectionController;
  unsigned int v19;
  HomeOutlineFavoritesSectionController *v20;
  uint64_t v21;
  void *v22;
  HomeOutlineFavoritesSectionController *v23;
  void *favoritesSectionController;
  HomeOutlineFavoritesSectionController *v25;
  HomeOutlineFavoritesSectionController *v26;
  HomeOutlineCollectionsSectionController *v27;
  uint64_t v28;
  HomeOutlineCollectionsSectionController *v29;
  HomeOutlineRecentsSectionController *v30;
  uint64_t v31;
  void *v32;
  HomeOutlineRecentsSectionController *v33;
  HomeOutlineRecentsSectionController *recentsSectionController;
  HomeOutlineCollectionsSectionController *collectionsSectionController;
  HomeOutlineFeatureDiscoverySectionController *v36;
  HomeOutlineFavoritesSectionController *v37;
  HomeOutlineRecentsSectionController *v38;
  _QWORD *v39;
  uint64_t v40;
  HomeOutlineFeatureDiscoverySectionController *v41;
  NSArray *v42;
  NSArray *sectionControllers;
  void *v44;
  NSArray *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  void *v52;
  NSDictionary *v53;
  NSDictionary *sectionControllersByIdentifier;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  _BYTE v60[128];
  _QWORD v61[2];
  __int128 v62;
  HomeOutlineRecentsSectionController *v63;
  _QWORD v64[6];

  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_100633E34;
  v59[3] = &unk_1011BE9C8;
  v59[4] = self;
  v3 = objc_retainBlock(v59);
  v4 = [HomeOutlineSearchResultsSectionController alloc];
  v5 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Search Results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[HomeOutlineSearchResultsSectionController initWithConfiguration:](v4, "initWithConfiguration:", v6);
  searchResultsSectionController = self->_searchResultsSectionController;
  self->_searchResultsSectionController = v7;

  v9 = [HomeOutlineFeatureDiscoverySectionController alloc];
  v10 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Feature Discovery"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = -[HomeOutlineFeatureDiscoverySectionController initWithConfiguration:suggestionsDataProvider:](v9, "initWithConfiguration:suggestionsDataProvider:", v11, self->_suggestionsDataProvider);
  featureDiscoverySectionController = self->_featureDiscoverySectionController;
  self->_featureDiscoverySectionController = v12;

  v14 = [HomeOutlineSuggestionsSectionController alloc];
  v15 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Suggestions"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = -[HomeOutlineSuggestionsSectionController initWithConfiguration:suggestionsDataProvider:](v14, "initWithConfiguration:suggestionsDataProvider:", v16, self->_suggestionsDataProvider);
  suggestionsSectionController = self->_suggestionsSectionController;
  self->_suggestionsSectionController = v17;

  v19 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
  v20 = [HomeOutlineFavoritesSectionController alloc];
  v21 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Favorites"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  if (v19)
  {
    v23 = -[HomeOutlineFavoritesSectionController initWithConfiguration:favoritesDataProvider:libraryCountsDataProvider:](v20, "initWithConfiguration:favoritesDataProvider:libraryCountsDataProvider:", v22, self->_favoritesDataProvider, self->_libraryCountsDataProvider);
    favoritesSectionController = self->_favoritesSectionController;
    self->_favoritesSectionController = v23;
  }
  else
  {
    v25 = -[HomeOutlineFavoritesSectionController initWithConfiguration:suggestionsDataProvider:](v20, "initWithConfiguration:suggestionsDataProvider:", v22, self->_suggestionsDataProvider);
    v26 = self->_favoritesSectionController;
    self->_favoritesSectionController = v25;

    v27 = [HomeOutlineCollectionsSectionController alloc];
    v28 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Collections"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v29 = -[HomeOutlineCollectionsSectionController initWithConfiguration:](v27, "initWithConfiguration:", v22);
    favoritesSectionController = self->_collectionsSectionController;
    self->_collectionsSectionController = v29;
  }

  v30 = [HomeOutlineRecentsSectionController alloc];
  v31 = ((uint64_t (*)(_QWORD *, const __CFString *))v3[2])(v3, CFSTR("Recents"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v33 = -[HomeOutlineRecentsSectionController initWithConfiguration:](v30, "initWithConfiguration:", v32);
  recentsSectionController = self->_recentsSectionController;
  self->_recentsSectionController = v33;

  collectionsSectionController = self->_collectionsSectionController;
  if (collectionsSectionController)
  {
    v36 = self->_featureDiscoverySectionController;
    v64[0] = self->_searchResultsSectionController;
    v64[1] = v36;
    v37 = self->_favoritesSectionController;
    v64[2] = self->_suggestionsSectionController;
    v64[3] = v37;
    v38 = self->_recentsSectionController;
    v64[4] = collectionsSectionController;
    v64[5] = v38;
    v39 = v64;
    v40 = 6;
  }
  else
  {
    v41 = self->_featureDiscoverySectionController;
    v61[0] = self->_searchResultsSectionController;
    v61[1] = v41;
    v62 = *(_OWORD *)&self->_suggestionsSectionController;
    v63 = self->_recentsSectionController;
    v39 = v61;
    v40 = 5;
  }
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, v40));
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v42;

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v45 = self->_sectionControllers;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "configuration", (_QWORD)v55));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sectionIdentifier"));
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v50, v52);

      }
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v47);
  }

  v53 = (NSDictionary *)objc_msgSend(v44, "copy");
  sectionControllersByIdentifier = self->_sectionControllersByIdentifier;
  self->_sectionControllersByIdentifier = v53;

}

- (UICollectionViewLayout)collectionViewLayout
{
  UICollectionViewLayout *collectionViewLayout;
  id v4;
  UICollectionViewLayout *v5;
  UICollectionViewLayout *v6;

  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    v4 = objc_msgSend(objc_alloc((Class)UICollectionLayoutListConfiguration), "initWithAppearance:", 3);
    v5 = (UICollectionViewLayout *)objc_claimAutoreleasedReturnValue(+[UICollectionViewCompositionalLayout layoutWithListConfiguration:](UICollectionViewCompositionalLayout, "layoutWithListConfiguration:", v4));
    v6 = self->_collectionViewLayout;
    self->_collectionViewLayout = v5;

    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (UICollectionViewDataSource)dataSource
{
  UICollectionViewDiffableDataSource *diffableDataSource;
  id v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  UICollectionViewDiffableDataSource *v9;
  UICollectionViewDiffableDataSource *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  diffableDataSource = self->_diffableDataSource;
  if (!diffableDataSource)
  {
    v4 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionView"));
    v7 = sub_10046DA38(self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (UICollectionViewDiffableDataSource *)objc_msgSend(v4, "initWithCollectionView:cellProvider:", v6, v8);
    v10 = self->_diffableDataSource;
    self->_diffableDataSource = v9;

    objc_initWeak(&location, self);
    v11 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100634148;
    v15[3] = &unk_1011BE9F0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v11, "setShouldExpandItemHandler:", v15);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10063418C;
    v13[3] = &unk_1011BE9F0;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "setShouldCollapseItemHandler:", v13);
    -[UICollectionViewDiffableDataSource setSectionSnapshotHandlers:](self->_diffableDataSource, "setSectionSnapshotHandlers:", v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
    diffableDataSource = self->_diffableDataSource;
  }
  return (UICollectionViewDataSource *)diffableDataSource;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpostID;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  NSArray *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;

  v3 = a3;
  if (!self->_loadingState)
  {
    self->_loadingState = 1;
    v6 = sub_100432EDC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "HomeListSectionLoading", ", buf, 2u);
    }

  }
  if (self->_active != v3)
  {
    self->_active = v3;
    v10 = sub_100432EDC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = sub_10039E4FC(v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412802;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ %@%@", buf, 0x20u);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = self->_sectionControllers;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v23), "setActive:", self->_active, (_QWORD)v24);
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v21);
    }

    if (v3)
    {
      -[HomeOutlineRootController _resetSnapshotUpdateState](self, "_resetSnapshotUpdateState");
      -[HomeOutlineRootController _setNeedsSnapshotUpdatesForSectionControllers:animated:](self, "_setNeedsSnapshotUpdatesForSectionControllers:animated:", self->_sectionControllers, 0);
    }
    -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", 0, (_QWORD)v24);
  }
}

- (SuggestionsItemSource)suggestionsItemSource
{
  return -[SuggestionsDataProvider suggestionsItemSource](self->_suggestionsDataProvider, "suggestionsItemSource");
}

- (void)_expandItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v4));
  objc_msgSend(v5, "expandElementAtIdentifierPath:", v4);

}

- (void)_collapseItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v4));
  objc_msgSend(v5, "collapseElementAtIdentifierPath:", v4);

}

- (id)_sectionControllerForIdentifierPath:(id)a3
{
  NSDictionary *sectionControllersByIdentifier;
  void *v4;
  void *v5;

  if (a3)
  {
    sectionControllersByIdentifier = self->_sectionControllersByIdentifier;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](sectionControllersByIdentifier, "objectForKeyedSubscript:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_sectionControllerForIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v4));

  return v5;
}

- (id)_identifierPathForIndexPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:"));
  else
    return 0;
}

- (id)_indexPathForIdentifierPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource indexPathForItemIdentifier:](self->_diffableDataSource, "indexPathForItemIdentifier:"));
  else
    return 0;
}

- (id)_nodeSnapshotAtIndexPath:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _nodeSnapshotAtIdentifierPath:](self, "_nodeSnapshotAtIdentifierPath:", v4));

  return v5;
}

- (id)_nodeSnapshotAtIdentifierPath:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceOutlineNodeSnapshot nodeSnapshotAtIdentifierPath:](self->_rootSnapshot, "nodeSnapshotAtIdentifierPath:"));
  else
    return 0;
}

- (void)setKeyboardProxy:(id)a3
{
  KeyboardProxyingView **p_keyboardProxy;
  id v5;
  id WeakRetained;

  p_keyboardProxy = &self->_keyboardProxy;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_keyboardProxy);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  objc_msgSend(v5, "setDelegate:", self);
  objc_storeWeak((id *)p_keyboardProxy, v5);

  -[HomeOutlineRootController _setNeedsSnapshotUpdatesForSectionControllers:animated:](self, "_setNeedsSnapshotUpdatesForSectionControllers:animated:", self->_sectionControllers, 1);
}

- (id)_loadingDataProviders
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_sectionControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataProviders", 0));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
              if ((objc_msgSend(v15, "hasInitialData") & 1) == 0)
                objc_msgSend(v3, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  v16 = objc_msgSend(v3, "copy");
  return v16;
}

- (BOOL)_isLoading
{
  void *v3;
  id v4;
  BOOL result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _loadingDataProviders](self, "_loadingDataProviders"));
  v4 = objc_msgSend(v3, "count");

  result = -[NSTimer isValid](self->_loadingTimer, "isValid");
  if (!v4)
    return 0;
  return result;
}

- (void)_updateLoadingTimer
{
  void *v3;
  id v4;
  NSTimer *loadingTimer;
  NSTimer *v6;
  NSTimer *v7;
  NSTimer *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _loadingDataProviders](self, "_loadingDataProviders"));
  v4 = objc_msgSend(v3, "count");

  loadingTimer = self->_loadingTimer;
  if (!v4)
  {
    -[NSTimer invalidate](loadingTimer, "invalidate");
    v6 = 0;
LABEL_6:
    v8 = self->_loadingTimer;
    self->_loadingTimer = v6;

    return;
  }
  if (!loadingTimer)
  {
    v7 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_loadingTimerDidFire", 0, 0, GEOConfigGetDouble(MapsConfig_ProactiveTrayInitialSuggestionsTimeout, off_1014B33E8));
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(v7);
    goto LABEL_6;
  }
}

- (void)_loadingTimerDidFire
{
  -[NSTimer invalidate](self->_loadingTimer, "invalidate");
  if (self->_active)
    -[HomeOutlineRootController _setNeedsSnapshotUpdatesForSectionControllers:animated:](self, "_setNeedsSnapshotUpdatesForSectionControllers:animated:", self->_sectionControllers, 1);
}

- (void)_resetSnapshotUpdateState
{
  NSMutableSet *v3;
  NSMutableSet *sectionControllersToUpdate;

  self->_animateNextUpdate = 0;
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  sectionControllersToUpdate = self->_sectionControllersToUpdate;
  self->_sectionControllersToUpdate = v3;

}

- (void)_setNeedsSnapshotUpdatesForSectionControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t signpostID;
  id v11;
  NSObject *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;

  v4 = a4;
  v6 = a3;
  if (self->_active)
  {
    v7 = sub_100432EDC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v30) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, signpostID, "SetNeedsApplySnapshot", ", (uint8_t *)&v30, 2u);
    }

    -[HomeOutlineRootController _updateLoadingTimer](self, "_updateLoadingTimer");
    if (!-[HomeOutlineRootController _isLoading](self, "_isLoading"))
    {
      if (-[HomeOutlineRootController _needsSnapshotUpdate](self, "_needsSnapshotUpdate")
        && self->_animateNextUpdate != v4
        && self->_appliedInitialUpdate)
      {
        -[HomeOutlineRootController updateIfNeeded](self, "updateIfNeeded");
      }
      self->_animateNextUpdate = v4;
      -[NSMutableSet addObjectsFromArray:](self->_sectionControllersToUpdate, "addObjectsFromArray:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "homeUpdateDelegate"));
      -[NSObject homeSetNeedsUpdate](v24, "homeSetNeedsUpdate");
      goto LABEL_16;
    }
    v11 = sub_100432EDC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class(self);
      v14 = NSStringFromClass(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v30 = 138412290;
      v31 = v15;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data is still loading", (uint8_t *)&v30, 0xCu);

    }
    v16 = sub_100432EDC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _loadingDataProviders](self, "_loadingDataProviders"));
      v20 = sub_10039DCD4(v19, &stru_1011BEA30);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v21));

      v23 = sub_100432EDC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (objc_class *)objc_opt_class(self);
        v26 = NSStringFromClass(v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", ")));
        v30 = 138412546;
        v31 = v27;
        v32 = 2112;
        v33 = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%@ skipping applySnapshot because initial data has not loaded in data providers [%@]", (uint8_t *)&v30, 0x16u);

      }
LABEL_16:

    }
  }

}

- (BOOL)_needsSnapshotUpdate
{
  if (!self->_active || -[HomeOutlineRootController _isLoading](self, "_isLoading"))
    return 0;
  if (-[NSMutableSet count](self->_sectionControllersToUpdate, "count"))
    return 1;
  return !self->_appliedInitialUpdate;
}

- (void)updateIfNeeded
{
  BOOL appliedInitialUpdate;
  NSObject *v4;
  _BOOL8 v5;
  _BOOL8 animateNextUpdate;
  id v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;

  if (-[HomeOutlineRootController _needsSnapshotUpdate](self, "_needsSnapshotUpdate"))
  {
    appliedInitialUpdate = self->_appliedInitialUpdate;
    if (appliedInitialUpdate)
    {
      v4 = objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", self->_sectionControllersToUpdate));
      v5 = 0;
      animateNextUpdate = self->_animateNextUpdate;
    }
    else
    {
      self->_appliedInitialUpdate = 1;
      v4 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", self->_sectionControllers));
      animateNextUpdate = 0;
      v5 = self->_animateNextUpdate;
    }
    objc_initWeak((id *)buf, self);
    -[HomeOutlineRootController _resetSnapshotUpdateState](self, "_resetSnapshotUpdateState");
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100634F54;
    v20 = &unk_1011AD388;
    v22 = !appliedInitialUpdate;
    objc_copyWeak(&v21, (id *)buf);
    -[HomeOutlineRootController _applySnapshotUpdatesInSectionControllers:animateCells:animateCollectionView:completion:](self, "_applySnapshotUpdatesInSectionControllers:animateCells:animateCollectionView:completion:", v4, animateNextUpdate, v5, &v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration", v17, v18, v19, v20));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "homeUpdateDelegate"));
    objc_msgSend(v16, "homeDidUpdateAnimated:", v5 | animateNextUpdate);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v7 = sub_100432EDC();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = sub_10039E4FC(self->_active);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = sub_10039E4FC(-[HomeOutlineRootController _isLoading](self, "_isLoading"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = -[NSMutableSet count](self->_sectionControllersToUpdate, "count");
      v13 = sub_10039E4FC(self->_appliedInitialUpdate);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138413058;
      v24 = v9;
      v25 = 2112;
      v26 = v11;
      v27 = 2048;
      v28 = v12;
      v29 = 2112;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Snapshot update is not needed because _action: %@, _loading: %@, _sectionControllersToUpdate count: %ld, _appliedInitialUpdate: %@", buf, 0x2Au);

    }
  }

}

- (void)_applySnapshotUpdatesInSectionControllers:(id)a3 animateCells:(BOOL)a4 animateCollectionView:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpostID;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSArray *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v39;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v40;
  void *v41;
  void *v42;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v43;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *rootSnapshot;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  os_signpost_id_t v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  HomeOutlineRootController *v66;
  os_signpost_id_t v67;
  void *v68;
  id v69;
  id v70;
  uint64_t v71;
  void *k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  void (**v84)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v85;
  NSObject *v86;
  NSObject *v87;
  os_signpost_id_t v88;
  void *v89;
  id v90;
  NSObject *v91;
  NSObject *v92;
  os_signpost_id_t v93;
  void *v94;
  UICollectionViewDiffableDataSource *diffableDataSource;
  UICollectionViewDiffableDataSource *v96;
  id v97;
  NSObject *v98;
  NSObject *v99;
  os_signpost_id_t v100;
  id v101;
  NSObject *v102;
  _BOOL4 v103;
  id v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;
  NSObject *v122;
  objc_class *v123;
  NSString *v124;
  __CFString *v125;
  __CFString *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  NSObject *v137;
  NSObject *v138;
  os_signpost_id_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  void *v148;
  MapsUIDiffableDataSourceOutlineNodeSnapshot *v149;
  _BOOL4 v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void (**v155)(void);
  void *v156;
  void *v157;
  HomeOutlineRootController *v158;
  _QWORD v159[4];
  void (**v160)(void);
  char v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[4];
  id v175;
  _QWORD v176[6];
  uint8_t buf[4];
  void *v178;
  __int16 v179;
  void *v180;
  __int16 v181;
  void *v182;
  __int16 v183;
  uint64_t v184;
  __int16 v185;
  void *v186;
  __int16 v187;
  void *v188;
  __int16 v189;
  void *v190;
  __int16 v191;
  void *v192;
  __int16 v193;
  void *v194;
  __int16 v195;
  void *v196;
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];

  v7 = a5;
  v150 = a4;
  v9 = a3;
  v10 = a6;
  v11 = sub_100432EDC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = sub_10039E4FC(v150);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = sub_10039E4FC(v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    *(_DWORD *)buf = 138412546;
    v178 = v16;
    v179 = 2112;
    v180 = v18;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "ApplySnapshot", "animateCells = %@, animateCollectionView = %@", buf, 0x16u);

  }
  v147 = v7;
  if (v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "collectionView"));
    objc_msgSend(v20, "alpha");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "collectionView"));
    objc_msgSend(v24, "setAlpha:", 0.0);

    v176[0] = _NSConcreteStackBlock;
    v176[1] = 3221225472;
    v176[2] = sub_100635CA8;
    v176[3] = &unk_1011AD518;
    v176[4] = self;
    v176[5] = v22;
    v174[0] = _NSConcreteStackBlock;
    v174[1] = 3221225472;
    v174[2] = sub_100635D00;
    v174[3] = &unk_1011B1B90;
    v175 = v10;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v176, v174, 0.25, 0.0);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionViewDiffableDataSource snapshotForSection:](self->_diffableDataSource, "snapshotForSection:", CFSTR("root")));
  v26 = sub_100432EDC();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  v28 = v27;
  v29 = self->_signpostID;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, v29, "BuildSectionSnapshot", ", buf, 2u);
  }

  v156 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v158 = self;
  v30 = self->_sectionControllers;
  v31 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v170, v199, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v171;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v171 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsObject:", v35))
          objc_msgSend(v35, "invalidateSectionSnapshot");
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sectionSnapshot"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "childSnapshots"));
        v38 = objc_msgSend(v37, "count");

        if (v38)
          objc_msgSend(v156, "addObject:", v36);

      }
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v170, v199, 16);
    }
    while (v32);
  }

  v39 = v158->_rootSnapshot;
  v40 = [MapsUIDiffableDataSourceOutlineNodeSnapshot alloc];
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPath](IdentifierPath, "identifierPath"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[HomeOutlineHiddenViewModel sharedViewModel](HomeOutlineHiddenViewModel, "sharedViewModel"));
  v43 = -[MapsUIDiffableDataSourceOutlineNodeSnapshot initWithIdentifierPath:viewModel:childSnapshots:expanded:](v40, "initWithIdentifierPath:viewModel:childSnapshots:expanded:", v41, v42, v156, 1);
  rootSnapshot = v158->_rootSnapshot;
  v158->_rootSnapshot = v43;

  v153 = v25;
  v149 = v39;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_maps_applyChangesWithNewRootSnapshot:oldRootSnapshot:", v158->_rootSnapshot, v39));
  v46 = sub_100432EDC();
  v47 = objc_claimAutoreleasedReturnValue(v46);
  v48 = v47;
  v49 = v158->_signpostID;
  if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, v49, "BuildSectionSnapshot", ", buf, 2u);
  }

  v157 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _focusedIdentifierPath](v158, "_focusedIdentifierPath"));
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  v169 = 0u;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "deletedItems"));
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v166, v198, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v167;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(_QWORD *)v167 != v53)
          objc_enumerationMutation(v50);
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * (_QWORD)j), "identifierPath"));
        if (v55 == v157)
        {

        }
        else
        {
          v56 = v55;
          v57 = objc_msgSend(v55, "isEqual:");

          if (!v57)
            continue;
        }
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](v158, "configuration"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "actionCoordinator"));

        v60 = objc_opt_class(MacBaseActionCoordinator);
        if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
          v61 = v59;
        else
          v61 = 0;
        v62 = v61;

        objc_msgSend(v62, "makeMapViewFirstResponder");
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v166, v198, 16);
    }
    while (v52);
  }
  v154 = v9;
  v155 = (void (**)(void))v10;

  v63 = sub_100432EDC();
  v64 = objc_claimAutoreleasedReturnValue(v63);
  v65 = v64;
  v66 = v158;
  v67 = v158->_signpostID;
  if (v67 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_BEGIN, v67, "ReloadCells", ", buf, 2u);
  }

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v152 = v45;
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "reloadedItems"));
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
  if (v69)
  {
    v70 = v69;
    v71 = *(_QWORD *)v163;
    do
    {
      for (k = 0; k != v70; k = (char *)k + 1)
      {
        if (*(_QWORD *)v163 != v71)
          objc_enumerationMutation(v68);
        v73 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * (_QWORD)k);
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "identifierPath"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _indexPathForIdentifierPath:](v66, "_indexPathForIdentifierPath:", v74));

        if (v75)
        {
          v76 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](v66, "configuration"));
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "collectionView"));
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "cellForItemAtIndexPath:", v75));

          if (v78)
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "viewModel"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "cellRegistration"));

            v81 = objc_opt_class(SidebarOutlineCellRegistration);
            if ((objc_opt_isKindOfClass(v80, v81) & 1) != 0)
              v82 = v80;
            else
              v82 = 0;
            v83 = v82;

            if (v83 && (objc_opt_isKindOfClass(v78, objc_msgSend(v83, "cellClass")) & 1) != 0)
            {
              v84 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "viewModelConfigurationHandler"));
              ((void (**)(_QWORD, void *, void *, void *))v84)[2](v84, v78, v75, v73);

            }
            v66 = v158;
          }

        }
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v162, v197, 16);
    }
    while (v70);
  }

  v85 = sub_100432EDC();
  v86 = objc_claimAutoreleasedReturnValue(v85);
  v87 = v86;
  v88 = v66->_signpostID;
  v89 = v153;
  if (v88 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v86))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v87, OS_SIGNPOST_INTERVAL_END, v88, "ReloadCells", ", buf, 2u);
  }

  v90 = sub_100432EDC();
  v91 = objc_claimAutoreleasedReturnValue(v90);
  v92 = v91;
  v93 = v66->_signpostID;
  v94 = v152;
  if (v93 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v92, OS_SIGNPOST_INTERVAL_BEGIN, v93, "ApplySectionSnapshot", ", buf, 2u);
  }

  if (objc_msgSend(v152, "hasChanges"))
  {
    diffableDataSource = v158->_diffableDataSource;
    v159[0] = _NSConcreteStackBlock;
    v159[1] = 3221225472;
    v159[2] = sub_100635D14;
    v159[3] = &unk_1011B06A0;
    v161 = v147;
    v160 = v155;
    v96 = diffableDataSource;
    v66 = v158;
    -[UICollectionViewDiffableDataSource applySnapshot:toSection:animatingDifferences:completion:](v96, "applySnapshot:toSection:animatingDifferences:completion:", v153, CFSTR("root"), v150, v159);

  }
  else if (v155)
  {
    v155[2]();
  }
  v97 = sub_100432EDC();
  v98 = objc_claimAutoreleasedReturnValue(v97);
  v99 = v98;
  v100 = v66->_signpostID;
  if (v100 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v99, OS_SIGNPOST_INTERVAL_END, v100, "ApplySectionSnapshot", ", buf, 2u);
  }

  v101 = sub_100432EDC();
  v102 = objc_claimAutoreleasedReturnValue(v101);
  v103 = os_log_type_enabled(v102, OS_LOG_TYPE_INFO);

  if (v103)
  {
    v104 = sub_10039DCD4(v154, &stru_1011BEA70);
    v105 = (void *)objc_claimAutoreleasedReturnValue(v104);
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "reloadedItems"));
    v107 = sub_10039DCD4(v106, &stru_1011BEAB0);
    v108 = (void *)objc_claimAutoreleasedReturnValue(v107);

    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "insertedItems"));
    v110 = sub_10039DCD4(v109, &stru_1011BEAD0);
    v111 = (void *)objc_claimAutoreleasedReturnValue(v110);

    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "deletedItems"));
    v113 = sub_10039DCD4(v112, &stru_1011BEAF0);
    v146 = (void *)objc_claimAutoreleasedReturnValue(v113);

    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "movedItems"));
    v115 = sub_10039DCD4(v114, &stru_1011BEB10);
    v145 = (void *)objc_claimAutoreleasedReturnValue(v115);

    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "expandedItems"));
    v117 = sub_10039DCD4(v116, &stru_1011BEB30);
    v144 = (void *)objc_claimAutoreleasedReturnValue(v117);

    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "collapsedItems"));
    v119 = sub_10039DCD4(v118, &stru_1011BEB50);
    v120 = (void *)objc_claimAutoreleasedReturnValue(v119);

    v121 = sub_100432EDC();
    v122 = objc_claimAutoreleasedReturnValue(v121);
    if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
    {
      v123 = (objc_class *)objc_opt_class(v158);
      v124 = NSStringFromClass(v123);
      v142 = (void *)objc_claimAutoreleasedReturnValue(v124);
      v125 = sub_10039E4FC(v150);
      v140 = (void *)objc_claimAutoreleasedReturnValue(v125);
      v126 = sub_10039E4FC(v147);
      v141 = (void *)objc_claimAutoreleasedReturnValue(v126);
      v127 = v105;
      v128 = objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "componentsJoinedByString:", CFSTR(", ")));
      v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "componentsJoinedByString:", CFSTR(", ")));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "componentsJoinedByString:", CFSTR(", ")));
      v151 = v111;
      v148 = v127;
      v143 = v108;
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "componentsJoinedByString:", CFSTR(", ")));
      v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "componentsJoinedByString:", CFSTR(", ")));
      v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "componentsJoinedByString:", CFSTR(", ")));
      v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "componentsJoinedByString:", CFSTR(", ")));
      *(_DWORD *)buf = 138414594;
      v178 = v142;
      v179 = 2112;
      v180 = v140;
      v181 = 2112;
      v182 = v141;
      v183 = 2112;
      v184 = v128;
      v135 = (void *)v128;
      v185 = 2112;
      v186 = v129;
      v187 = 2112;
      v188 = v130;
      v189 = 2112;
      v190 = v131;
      v191 = 2112;
      v192 = v132;
      v193 = 2112;
      v194 = v133;
      v195 = 2112;
      v196 = v134;
      _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_INFO, "%@ applySnapshot {\n\tanimateCells: %@\n\tanimateCollectionView: %@\n\tupdatedSections: [%@]\n\treloads: [%@]\n\tinsertions: [%@]\n\tdeletions: [%@]\n\tmoves: [%@]\n\texpansions: [%@]\n\tcollapses: [%@]\n}", buf, 0x66u);

      v94 = v152;
      v108 = v143;
      v105 = v148;
      v111 = v151;

      v89 = v153;
    }

  }
  v136 = sub_100432EDC();
  v137 = objc_claimAutoreleasedReturnValue(v136);
  v138 = v137;
  v139 = v158->_signpostID;
  if (v139 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v138, OS_SIGNPOST_INTERVAL_END, v139, "ApplySnapshot", ", buf, 2u);
  }

}

- (void)_didCompleteInitialUpdate
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostID;
  NSArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];

  if (self->_loadingState == 1)
  {
    self->_loadingState = 2;
    v3 = sub_100432EDC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = v4;
    signpostID = self->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, signpostID, "HomeListSectionLoading", ", buf, 2u);
    }

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_sectionControllers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "didApplyInitialSectionSnapshot", (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (void)_updateContentInjectionWithSelectedIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _nodeSnapshotAtIndexPath:](self, "_nodeSnapshotAtIndexPath:"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifierPath"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v6));

      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentInjectorForSnapshot:", v5));
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionCoordinator"));

  v10 = objc_opt_class(MacBaseActionCoordinator);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v12, "setSidebarContentInjector:", v13);
}

- (id)sectionController:(id)a3 nodeSnapshotAtIndexPath:(id)a4
{
  return -[HomeOutlineRootController _nodeSnapshotAtIndexPath:](self, "_nodeSnapshotAtIndexPath:", a4);
}

- (id)sectionController:(id)a3 indexPathForIdentifierPath:(id)a4
{
  return -[HomeOutlineRootController _indexPathForIdentifierPath:](self, "_indexPathForIdentifierPath:", a4);
}

- (void)sectionController:(id)a3 setNeedsApplySnapshotAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a4;
  v6 = a3;
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Apply Snapshot for section controller: %@", buf, 0xCu);
  }

  v10 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  -[HomeOutlineRootController _setNeedsSnapshotUpdatesForSectionControllers:animated:](self, "_setNeedsSnapshotUpdatesForSectionControllers:animated:", v9, v4);

}

- (BOOL)applySnapshotIfNeededWithSectionController:(id)a3
{
  -[HomeOutlineRootController updateIfNeeded](self, "updateIfNeeded", a3);
  return self->_appliedInitialUpdate;
}

- (BOOL)isCollectionViewProxyFocusedWithSectionController:(id)a3
{
  id WeakRetained;
  unsigned __int8 v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_keyboardProxy);
  v4 = objc_msgSend(WeakRetained, "shouldAppearFocused");

  return v4;
}

- (BOOL)isCollectionViewFocusedWithSectionController:(id)a3
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sectionControllers;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "focusedIdentifierPath", (_QWORD)v9));

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)hasCollectionViewDropSessionWithSectionController:(id)a3
{
  return self->_hasDropSession;
}

- (void)sectionController:(id)a3 selectItemAtIdentifierPath:(id)a4 completion:(id)a5
{
  -[HomeOutlineRootController _selectItemAtIdentifierPath:notifyDelegate:completion:](self, "_selectItemAtIdentifierPath:notifyDelegate:completion:", a4, 0, a5);
}

- (void)sectionController:(id)a3 deselectItemAtIdentifierPath:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _indexPathForIdentifierPath:](self, "_indexPathForIdentifierPath:", a4));
  if (v5)
  {
    v6 = v5;
    -[HomeOutlineRootController _deselectItemAtIndexPath:](self, "_deselectItemAtIndexPath:", v5);
    v5 = v6;
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD, _QWORD);
  char *v29;
  int v31;
  id v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100432EDC();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v31 = 138412546;
    v32 = v9;
    v33 = 2112;
    v34 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dequeuing cell at index path: %@, identifier path: %@", (uint8_t *)&v31, 0x16u);
  }

  v13 = v10;
  v14 = objc_opt_class(IdentifierPath);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _nodeSnapshotAtIdentifierPath:](self, "_nodeSnapshotAtIdentifierPath:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "viewModel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cellRegistration"));

  v20 = objc_opt_class(SidebarOutlineCellRegistration);
  if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
    v21 = v19;
  else
    v21 = 0;
  v22 = v21;

  v23 = sub_100432EDC();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v31 = 138412290;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Dequeuing cell with cell registration :%@", (uint8_t *)&v31, 0xCu);
  }

  if (v22)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v22, v9, v13));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1011EB268));
    objc_msgSend(v25, "setAxSectionIdentifier:", v27);

    v28 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "viewModelConfigurationHandler"));
    ((void (**)(_QWORD, void *, id, void *))v28)[2](v28, v25, v9, v17);

    objc_msgSend(v25, "setHoverSource:", self);
    if ((uint64_t)objc_msgSend(v16, "length") >= 2)
      v29 = (char *)objc_msgSend(v16, "length") - 2;
    else
      v29 = 0;
    objc_msgSend(v25, "setIndentationLevel:", v29);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v8));
  if ((objc_opt_respondsToSelector(v9, a2) & 1) != 0)
    v10 = objc_msgSend(v9, "collectionView:shouldHighlightItemAtIndexPath:", v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v17 = 138412802;
    v18 = v13;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v17, 0x20u);

  }
  -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v8));
  if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
    objc_msgSend(v16, "collectionView:didSelectItemAtIndexPath:", v7, v8);

}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v17 = 138412802;
    v18 = v13;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v17, 0x20u);

  }
  -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v8));
  if ((objc_opt_respondsToSelector(v16, a2) & 1) != 0)
    objc_msgSend(v16, "collectionView:didDeselectItemAtIndexPath:", v7, v8);

}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  unsigned __int8 v10;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v8));
  if ((objc_opt_respondsToSelector(v9, a2) & 1) != 0)
    v10 = objc_msgSend(v9, "collectionView:shouldHighlightItemAtIndexPath:", v7, v8);
  else
    v10 = 1;

  return v10;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_sectionControllers;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v17, a2) & 1) != 0)
          objc_msgSend(v17, "collectionView:didUpdateFocusInContext:withAnimationCoordinator:", v9, v10, v11, (_QWORD)v18);
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  y = a5.y;
  x = a5.x;
  v10 = a3;
  v11 = a4;
  if (objc_msgSend(v11, "count") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v12));

    if ((objc_opt_respondsToSelector(v13, a2) & 1) != 0)
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView:contextMenuConfigurationForItemsAtIndexPaths:point:", v10, v11, x, y));
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "identifier", a3));
  v7 = objc_opt_class(IdentifierPath);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  v19 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _nodeSnapshotAtIdentifierPath:](self, "_nodeSnapshotAtIdentifierPath:", v9));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "shareItemSourceForSnapshot:", v10));
    if (v11)
    {
      v12 = objc_alloc((Class)UIActivityItemsConfiguration);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activityProviders"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationActivities"));
      v15 = objc_msgSend(v12, "_initWithActivityItems:applicationActivities:", v13, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "excludedActivityTypes"));
      objc_msgSend(v15, "_setExcludedActivityTypes:", v16);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionView"));
  objc_msgSend(v18, "setActivityItemsConfiguration:", v15);

}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration", a3, a4, a5));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionView"));
  objc_msgSend(v5, "setActivityItemsConfiguration:", 0);

}

- (id)collectionView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  v12 = objc_msgSend(v11, "canStartNewDrag");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v10));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView:itemsForBeginningDragSession:atIndexPath:", v8, v9, v10));
    if (objc_msgSend(v14, "count"))
      objc_storeStrong((id *)&self->_draggingSectionController, v13);

  }
  else
  {
    v14 = &__NSArray0__struct;
  }

  return v14;
}

- (void)collectionView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v7;
  void *v8;
  MapsDragLocalContext *v9;
  void *v10;
  void *v11;
  MapsDragLocalContext *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v8, "setDragSession:", v7);

  v9 = [MapsDragLocalContext alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "windowScene"));
  v12 = -[MapsDragLocalContext initWithWindowScene:](v9, "initWithWindowScene:", v11);
  objc_msgSend(v7, "setLocalContext:", v12);

  if ((objc_opt_respondsToSelector(self->_draggingSectionController, a2) & 1) != 0)
    -[HomeOutlineSectionControllerSubclassing collectionView:dragSessionWillBegin:](self->_draggingSectionController, "collectionView:dragSessionWillBegin:", v13, v7);

}

- (void)collectionView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v7;
  HomeOutlineSectionControllerSubclassing *draggingSectionController;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector(self->_draggingSectionController, a2) & 1) != 0)
    -[HomeOutlineSectionControllerSubclassing collectionView:dragSessionDidEnd:](self->_draggingSectionController, "collectionView:dragSessionDidEnd:", v10, v7);
  draggingSectionController = self->_draggingSectionController;
  self->_draggingSectionController = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
  objc_msgSend(v9, "setDragSession:", 0);

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "localDragSession", a3));
  v5 = v4 != 0;

  return v5;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v7;
  id v8;
  NSArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v7 = a3;
  v8 = a4;
  self->_hasDropSession = 1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_sectionControllers;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v14, a2) & 1) != 0)
          objc_msgSend(v14, "collectionView:dropSessionDidEnter:", v7, v8, (_QWORD)v15);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSString *v20;
  void *v21;
  HomeOutlineSectionControllerSubclassing *v22;
  HomeOutlineSectionControllerSubclassing *v23;
  HomeOutlineSectionControllerSubclassing **p_dropTargetSectionController;
  HomeOutlineSectionControllerSubclassing *dropTargetSectionController;
  id v26;
  id v27;
  void *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = sub_100432EDC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v11));
    v16 = sub_100432EDC();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v18 = (void *)objc_opt_class(self);
      v19 = v18;
      v20 = NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v30 = 138413058;
      v31 = v18;
      v32 = 2112;
      v33 = v21;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%@ %@, indexPath = %@, identifierPath = %@", (uint8_t *)&v30, 0x2Au);

    }
  }
  v22 = (HomeOutlineSectionControllerSubclassing *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v11));
  dropTargetSectionController = self->_dropTargetSectionController;
  p_dropTargetSectionController = &self->_dropTargetSectionController;
  v23 = dropTargetSectionController;
  if (v22 != dropTargetSectionController)
  {
    if ((objc_opt_respondsToSelector(v23, a2) & 1) != 0)
      v26 = -[HomeOutlineSectionControllerSubclassing collectionView:dropSessionDidUpdate:withDestinationIndexPath:](*p_dropTargetSectionController, "collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v9, v10, 0);
    objc_storeStrong((id *)p_dropTargetSectionController, v22);
  }
  if ((objc_opt_respondsToSelector(v22, a2) & 1) != 0)
    v27 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineSectionControllerSubclassing collectionView:dropSessionDidUpdate:withDestinationIndexPath:](v22, "collectionView:dropSessionDidUpdate:withDestinationIndexPath:", v9, v10, v11));
  else
    v27 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:", 0);
  v28 = v27;

  return v28;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v7 = a3;
  v8 = a4;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationIndexPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v12));
    v14 = sub_100432EDC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_opt_class(self);
      v17 = v16;
      v18 = NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v22 = 138413058;
      v23 = v16;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@ %@, indexPath = %@, identifierPath = %@", (uint8_t *)&v22, 0x2Au);

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationIndexPath"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIndexPath:](self, "_sectionControllerForIndexPath:", v20));

  if ((objc_opt_respondsToSelector(v21, a2) & 1) != 0)
    objc_msgSend(v21, "collectionView:performDropWithCoordinator:", v7, v8);

}

- (void)collectionView:(id)a3 dropSessionDidExit:(id)a4
{
  id v7;
  id v8;
  HomeOutlineSectionControllerSubclassing *dropTargetSectionController;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a3;
  v8 = a4;
  self->_hasDropSession = 0;
  dropTargetSectionController = self->_dropTargetSectionController;
  self->_dropTargetSectionController = 0;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_sectionControllers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v15, a2) & 1) != 0)
          objc_msgSend(v15, "collectionView:dropSessionDidExit:", v7, v8, (_QWORD)v16);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v7;
  id v8;
  HomeOutlineSectionControllerSubclassing *dropTargetSectionController;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a3;
  v8 = a4;
  self->_hasDropSession = 0;
  dropTargetSectionController = self->_dropTargetSectionController;
  self->_dropTargetSectionController = 0;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_sectionControllers;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v15, a2) & 1) != 0)
          objc_msgSend(v15, "collectionView:dropSessionDidEnd:", v7, v8, (_QWORD)v16);
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  IdentifierPath *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  IdentifierPath *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v11));
  v13 = sub_100432EDC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 138412546;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Will display cell at index path: %@, identifier path: %@", (uint8_t *)&v16, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v12));
  if ((objc_opt_respondsToSelector(v15, a2) & 1) != 0)
    objc_msgSend(v15, "collectionView:willDisplayCell:forItemAtIndexPath:", v9, v10, v11);
  if (v12 == self->_focusAfterScrollingIndentifierPath || -[IdentifierPath isEqual:](v12, "isEqual:"))
    -[HomeOutlineRootController _focusAfterScrollingCellWillDisplay](self, "_focusAfterScrollingCellWillDisplay");

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeUpdateDelegate"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v6, a2);

  if ((a2 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeUpdateDelegate"));
    objc_msgSend(v8, "scrollViewDidScroll:", v9);

  }
  -[HomeOutlineRootController _notifyCellHoverObservers](self, "_notifyCellHoverObservers");

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[HomeOutlineRootController _focusAfterScrollingAnimationDidEnd](self, "_focusAfterScrollingAnimationDidEnd", a3);
}

- (void)presentVenueWithVenueCardItem:(id)a3
{
  -[HomeOutlineSearchResultsSectionController presentVenueWithVenueCardItem:](self->_searchResultsSectionController, "presentVenueWithVenueCardItem:", a3);
}

- (void)handleVenueSearchResultsWithSelectedSearchResult:(id)a3 searchFieldItem:(id)a4 browseCategories:(id)a5
{
  -[HomeOutlineSearchResultsSectionController handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:](self->_searchResultsSectionController, "handleVenueSearchResultsWithSelectedSearchResult:searchFieldItem:browseCategories:", a3, a4, a5);
}

- (void)venueDidReceiveEVChargersUpdate:(id)a3
{
  -[HomeOutlineSearchResultsSectionController venueDidReceiveEVChargersUpdate:](self->_searchResultsSectionController, "venueDidReceiveEVChargersUpdate:", a3);
}

- (void)showCollection:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "handlerType") == (id)3)
    -[HomeOutlineSuggestionsSectionController showSharedCollection:](self->_suggestionsSectionController, "showSharedCollection:", v4);
  else
    -[HomeOutlineCollectionsSectionController showCollection:](self->_collectionsSectionController, "showCollection:", v4);

}

- (void)editCollection:(id)a3
{
  -[HomeOutlineCollectionsSectionController editCollection:](self->_collectionsSectionController, "editCollection:", a3);
}

- (id)viewForProfileToolTipPopoverWithType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3 == 1)
  {
    v5 = 112;
  }
  else
  {
    if (a3 != 2)
      return 0;
    v5 = 120;
  }
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + v5), "sourceViewForProfileTipPopover", v3, v4));
}

- (id)_selectedIdentifierPaths
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathsForSelectedItems"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100637BE4;
  v10[3] = &unk_1011B2860;
  v10[4] = self;
  v6 = sub_10039DCD4(v5, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  return v8;
}

- (void)_selectItemAtIdentifierPath:(id)a3 notifyDelegate:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  NSTimer *v23;
  NSTimer *keyboardSelectionTimer;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a4;
  v9 = a3;
  v10 = (void (**)(id, _QWORD))a5;
  -[HomeOutlineRootController updateIfNeeded](self, "updateIfNeeded");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _indexPathForIdentifierPath:](self, "_indexPathForIdentifierPath:", v9));
  v12 = sub_100432EDC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_opt_class(self);
    v15 = v14;
    v16 = NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    *(_DWORD *)buf = 138413058;
    v29 = v14;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@ %@ index path = %@, identifier path = %@", buf, 0x2Au);

  }
  if (v9 && v11)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collectionView"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "indexPathsForVisibleItems"));
    v21 = objc_msgSend(v20, "containsObject:", v11);
    if (v21)
      v22 = 0;
    else
      v22 = 2;

    objc_msgSend(v19, "selectItemAtIndexPath:animated:scrollPosition:", v11, 1, v22);
    if (v6)
    {
      -[NSTimer invalidate](self->_keyboardSelectionTimer, "invalidate");
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100637E80;
      v25[3] = &unk_1011BEB78;
      v26 = v19;
      v27 = v11;
      v23 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v25, 0.2));
      keyboardSelectionTimer = self->_keyboardSelectionTimer;
      self->_keyboardSelectionTimer = v23;

    }
    else
    {
      -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", v11);
      -[HomeOutlineRootController _setFocusAfterScrollingIdentifierPath:completion:](self, "_setFocusAfterScrollingIdentifierPath:completion:", v9, v10);
      if (v21)
        -[HomeOutlineRootController _updateFocusAfterScrolling](self, "_updateFocusAfterScrolling");
      else
        *(_WORD *)&self->_needsFocusAfterScrollingAnimationDidEnd = 257;
    }

  }
  else if (v10)
  {
    v10[2](v10, 0);
  }

}

- (void)_deselectItemAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v5));
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_opt_class(self);
    v10 = v9;
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v19 = 138413058;
    v20 = v9;
    v21 = 2112;
    v22 = v12;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@ index path = %@, identifier path = %@", (uint8_t *)&v19, 0x2Au);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathsForSelectedItems"));
  v16 = objc_msgSend(v15, "containsObject:", v5);

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionView"));
    objc_msgSend(v18, "deselectItemAtIndexPath:animated:", v5, 1);

    -[HomeOutlineRootController _updateContentInjectionWithSelectedIndexPath:](self, "_updateContentInjectionWithSelectedIndexPath:", 0);
  }

}

- (void)clearSelectionWithReason:(id)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _selectedIdentifierPaths](self, "_selectedIdentifierPaths"));
  v7 = sub_100432EDC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v21 = v5;
    v9 = (void *)objc_opt_class(self);
    v20 = v9;
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathsForSelectedItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", ")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138413314;
    v23 = v9;
    v5 = v21;
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v21;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@ selected index paths = [%@], selected identifier paths = [%@], deselection reason = %@", buf, 0x34u);

  }
  if (objc_msgSend(v6, "count") && (unint64_t)objc_msgSend(v6, "count") <= 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _sectionControllerForIdentifierPath:](self, "_sectionControllerForIdentifierPath:", v17));
    objc_msgSend(v18, "clearSelectionWithReason:", v5);

  }
}

- (id)_focusedIdentifierPath
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_sectionControllers;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedIdentifierPath", (_QWORD)v9));

        if (v7)
        {
          v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "focusedIdentifierPath"));
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_focusCellAtVisibleSelectedIdentifierPath:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;

  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = sub_100432EDC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(self);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v25 = 138412802;
    v26 = v13;
    v27 = 2112;
    v28 = v15;
    v29 = 2112;
    v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, identifier path = %@", (uint8_t *)&v25, 0x20u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _indexPathForIdentifierPath:](self, "_indexPathForIdentifierPath:", v7));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _selectedIdentifierPaths](self, "_selectedIdentifierPaths"));
    if ((objc_msgSend(v17, "containsObject:", v7) & 1) == 0)
    {
      if (v8)
        v8[2](v8, 0);
      goto LABEL_21;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "collectionView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellForItemAtIndexPath:", v16));

    if (!v20)
    {
      if (v8)
        v8[2](v8, 0);
      goto LABEL_20;
    }
    v21 = (id)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _focusedIdentifierPath](self, "_focusedIdentifierPath"));
    v22 = v21;
    if (v21 == v7 || objc_msgSend(v21, "isEqual:", v7))
    {
      if (v8)
      {
        v23 = 1;
LABEL_18:
        v8[2](v8, v23);
      }
    }
    else
    {
      v24 = objc_msgSend(v20, "becomeFirstResponder");
      if (v8)
      {
        v23 = (uint64_t)v24;
        goto LABEL_18;
      }
    }

LABEL_20:
LABEL_21:

    goto LABEL_22;
  }
  if (v8)
    v8[2](v8, 0);
LABEL_22:

}

- (void)_setFocusAfterScrollingIdentifierPath:(id)a3 completion:(id)a4
{
  IdentifierPath *v6;
  IdentifierPath *focusAfterScrollingIndentifierPath;
  IdentifierPath *v8;
  id v9;
  id focusAfterScrollingCompletion;
  id v11;

  v6 = (IdentifierPath *)a3;
  v11 = a4;
  if (self->_focusAfterScrollingIndentifierPath)
  {
    -[HomeOutlineRootController _completeFocusAfterScrollingWithSuccess:](self, "_completeFocusAfterScrollingWithSuccess:", 0);
    focusAfterScrollingIndentifierPath = self->_focusAfterScrollingIndentifierPath;
  }
  else
  {
    focusAfterScrollingIndentifierPath = 0;
  }
  self->_focusAfterScrollingIndentifierPath = v6;
  v8 = v6;

  v9 = objc_retainBlock(v11);
  focusAfterScrollingCompletion = self->_focusAfterScrollingCompletion;
  self->_focusAfterScrollingCompletion = v9;

}

- (void)_updateFocusAfterScrolling
{
  if (self->_focusAfterScrollingIndentifierPath
    && !self->_needsFocusAfterScrollingAnimationDidEnd
    && !self->_needsFocusAfterScrollingCellWillDisplay)
  {
    -[HomeOutlineRootController _focusCellAtVisibleSelectedIdentifierPath:completion:](self, "_focusCellAtVisibleSelectedIdentifierPath:completion:");
  }
}

- (void)_focusAfterScrollingAnimationDidEnd
{
  if (self->_focusAfterScrollingIndentifierPath)
  {
    self->_needsFocusAfterScrollingAnimationDidEnd = 0;
    -[HomeOutlineRootController _updateFocusAfterScrolling](self, "_updateFocusAfterScrolling");
  }
}

- (void)_focusAfterScrollingCellWillDisplay
{
  _QWORD v2[4];
  id v3;
  id location;

  if (self->_focusAfterScrollingIndentifierPath)
  {
    self->_needsFocusAfterScrollingCellWillDisplay = 0;
    objc_initWeak(&location, self);
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100638768;
    v2[3] = &unk_1011AD260;
    objc_copyWeak(&v3, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
    objc_destroyWeak(&v3);
    objc_destroyWeak(&location);
  }
}

- (void)_completeFocusAfterScrollingWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  IdentifierPath *focusAfterScrollingIndentifierPath;
  id focusAfterScrollingCompletion;
  void *v7;
  id v8;

  if (self->_focusAfterScrollingIndentifierPath)
  {
    v3 = a3;
    v8 = objc_retainBlock(self->_focusAfterScrollingCompletion);
    focusAfterScrollingIndentifierPath = self->_focusAfterScrollingIndentifierPath;
    self->_focusAfterScrollingIndentifierPath = 0;

    focusAfterScrollingCompletion = self->_focusAfterScrollingCompletion;
    self->_focusAfterScrollingCompletion = 0;

    v7 = v8;
    *(_WORD *)&self->_needsFocusAfterScrollingAnimationDidEnd = 0;
    if (v8)
    {
      (*((void (**)(id, _BOOL8))v8 + 2))(v8, v3);
      v7 = v8;
    }

  }
}

- (void)_notifyCellHoverObservers
{
  -[GEOObserverHashTable hoverSourceStateDidChange:](self->_hoverChangeObservers, "hoverSourceStateDidChange:", self);
}

- (UIScrollView)hoverScrollView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));

  return (UIScrollView *)v3;
}

- (void)keyboardProxyingView:(id)a3 didUpdateFocusState:(BOOL)a4
{
  -[HomeOutlineRootController _setNeedsSnapshotUpdatesForSectionControllers:animated:](self, "_setNeedsSnapshotUpdatesForSectionControllers:animated:", self->_sectionControllers, 1);
}

- (void)keyboardProxyingView:(id)a3 pressesBegan:(id)a4 withEvent:(id)a5
{
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a4;
  v6 = objc_msgSend(v13, "count") == (id)1;
  v7 = v13;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "key"));
    v10 = objc_msgSend(v9, "keyCode");

    if (v10 == (id)82)
    {
      -[HomeOutlineRootController upArrowPressed:](self, "upArrowPressed:", v8);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "key"));
      v12 = objc_msgSend(v11, "keyCode");

      if (v12 == (id)81)
        -[HomeOutlineRootController downArrowPressed:](self, "downArrowPressed:", v8);
    }

    v7 = v13;
  }

}

- (void)upArrowPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  id v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration", a3));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "indexPathsForSelectedItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (objc_msgSend(v14, "numberOfItemsInSection:", objc_msgSend(v6, "section")))
  {
    v7 = objc_msgSend(v6, "copy");
    if (v7)
    {
      while (1)
      {
        v8 = v7;
        v9 = (uint64_t)objc_msgSend(v7, "row");
        if (v9 < 2)
          break;
        v7 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9 - 1, objc_msgSend(v7, "section")));

        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
        v11 = objc_msgSend(v10, "collectionView:shouldHighlightItemAtIndexPath:", v14, v7);

        if (v11)
        {
          v12 = v7;
          if (v12)
            goto LABEL_9;
        }
      }
      v12 = 0;
    }
    else
    {
      v12 = 0;
LABEL_9:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v12));
      if (v13)
        -[HomeOutlineRootController _selectItemAtIdentifierPath:notifyDelegate:completion:](self, "_selectItemAtIdentifierPath:notifyDelegate:completion:", v13, 1, 0);

    }
  }

}

- (void)downArrowPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  id v9;
  void *v10;
  char *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  id v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController configuration](self, "configuration", a3));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathsForSelectedItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (char *)objc_msgSend(v16, "numberOfItemsInSection:", objc_msgSend(v6, "section"));
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v6, "copy");
    if (v9)
    {
      while (1)
      {
        v10 = v9;
        v11 = (char *)objc_msgSend(v9, "row");
        if ((uint64_t)v11 >= (uint64_t)v8)
          break;
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11 + 1, objc_msgSend(v9, "section")));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
        v13 = objc_msgSend(v12, "collectionView:shouldHighlightItemAtIndexPath:", v16, v9);

        if (v13)
        {
          v14 = v9;
          if (v14)
            goto LABEL_9;
        }
      }
      v14 = 0;
    }
    else
    {
      v14 = 0;
LABEL_9:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[HomeOutlineRootController _identifierPathForIndexPath:](self, "_identifierPathForIndexPath:", v14));
      if (v15)
        -[HomeOutlineRootController _selectItemAtIdentifierPath:notifyDelegate:completion:](self, "_selectItemAtIdentifierPath:notifyDelegate:completion:", v15, 1, 0);

    }
  }

}

- (id)_storage
{
  HomeStorage *storage;
  HomeStorage *v4;
  HomeStorage *v5;

  storage = self->_storage;
  if (!storage)
  {
    v4 = objc_alloc_init(HomeStorage);
    v5 = self->_storage;
    self->_storage = v4;

    storage = self->_storage;
  }
  return storage;
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (GEOObserverHashTable)hoverChangeObservers
{
  return self->_hoverChangeObservers;
}

- (HomeOutlineRootControllerConfiguration)configuration
{
  return self->_configuration;
}

- (KeyboardProxyingView)keyboardProxy
{
  return (KeyboardProxyingView *)objc_loadWeakRetained((id *)&self->_keyboardProxy);
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyboardProxy);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_focusAfterScrollingCompletion, 0);
  objc_storeStrong((id *)&self->_focusAfterScrollingIndentifierPath, 0);
  objc_storeStrong((id *)&self->_keyboardSelectionTimer, 0);
  objc_storeStrong((id *)&self->_hoverChangeObservers, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dropTargetSectionController, 0);
  objc_storeStrong((id *)&self->_draggingSectionController, 0);
  objc_storeStrong((id *)&self->_sectionControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_featureDiscoverySectionController, 0);
  objc_storeStrong((id *)&self->_searchResultsSectionController, 0);
  objc_storeStrong((id *)&self->_recentsSectionController, 0);
  objc_storeStrong((id *)&self->_collectionsSectionController, 0);
  objc_storeStrong((id *)&self->_favoritesSectionController, 0);
  objc_storeStrong((id *)&self->_suggestionsSectionController, 0);
  objc_storeStrong((id *)&self->_sectionControllersToUpdate, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_rootSnapshot, 0);
  objc_storeStrong((id *)&self->_loadingTimer, 0);
  objc_storeStrong((id *)&self->_libraryCountsDataProvider, 0);
  objc_storeStrong((id *)&self->_favoritesDataProvider, 0);
  objc_storeStrong((id *)&self->_suggestionsDataProvider, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
}

@end
