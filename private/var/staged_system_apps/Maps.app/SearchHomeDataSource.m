@implementation SearchHomeDataSource

- (SearchHomeDataSource)initWithTableView:(id)a3 updateLocation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SearchHomeDataSource *v7;
  SearchHomeDataSource *v8;
  void *v9;
  SearchHomeDataDownloader *v10;
  id v11;
  void *v12;
  SearchHomeBrowseCategoriesLayoutProvider *v13;
  NSArray *v14;
  NSArray *layoutProviders;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  UITableViewDiffableDataSource *v24;
  UITableViewDiffableDataSource *tableViewDiffableDataSource;
  _QWORD v27[4];
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v4 = a4;
  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SearchHomeDataSource;
  v7 = -[DataSource initWithTableView:updateLocation:](&v34, "initWithTableView:updateLocation:", v6, v4);
  v8 = v7;
  if (v7)
  {
    v7->_routePlanning = 1;
    v7->_supportsFullTextSearch = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v10 = -[SearchHomeDataDownloader initWithDelegate:isSearchAlongRoute:]([SearchHomeDataDownloader alloc], "initWithDelegate:isSearchAlongRoute:", v8, -[SearchHomeDataSource searchAlongRoute](v8, "searchAlongRoute"));
    objc_msgSend(v9, "addObject:", v10);
    v11 = objc_msgSend(v9, "copy");
    -[SearchHomeDataSource setDataFetchers:](v8, "setDataFetchers:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v13 = -[SearchHomeBrowseCategoriesLayoutProvider initWithSearchAlongRoute:supportsFullTextSearch:]([SearchHomeBrowseCategoriesLayoutProvider alloc], "initWithSearchAlongRoute:supportsFullTextSearch:", -[SearchHomeDataSource searchAlongRoute](v8, "searchAlongRoute"), v8->_supportsFullTextSearch);
    objc_msgSend(v12, "addObject:", v13);

    v14 = (NSArray *)objc_msgSend(v12, "copy");
    layoutProviders = v8->_layoutProviders;
    v8->_layoutProviders = v14;

    objc_msgSend(v6, "setDelegate:", v8);
    -[SearchHomeDataSource setupTableHeaderView](v8, "setupTableHeaderView");
    v16 = objc_opt_self(_TtC4Maps27BrowseCategoryTableViewCell);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[BrowseCategoryTableViewCell identifier](_TtC4Maps27BrowseCategoryTableViewCell, "identifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v17, v18);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](v8, "dataFetchers"));
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v22), "fetchContent");
          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v20);
    }

    objc_initWeak(&location, v8);
    v23 = objc_alloc((Class)UITableViewDiffableDataSource);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1003E5F10;
    v27[3] = &unk_1011B4A08;
    objc_copyWeak(&v28, &location);
    v24 = (UITableViewDiffableDataSource *)objc_msgSend(v23, "initWithTableView:cellProvider:", v6, v27);
    tableViewDiffableDataSource = v8->_tableViewDiffableDataSource;
    v8->_tableViewDiffableDataSource = v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v8;
}

- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4
{
  return -[SearchHomeDataSource initWithCollectionView:updateLocation:isSearchAlongRoute:supportsFullTextSearch:](self, "initWithCollectionView:updateLocation:isSearchAlongRoute:supportsFullTextSearch:", a3, a4, 0, 0);
}

- (SearchHomeDataSource)initWithCollectionView:(id)a3 updateLocation:(BOOL)a4 isSearchAlongRoute:(BOOL)a5 supportsFullTextSearch:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  SearchHomeDataSource *v11;
  SearchHomeDataSource *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  SearchHomeTipDataFetcher *v17;
  SearchHomeRecentSearchesDataFetcher *v18;
  _TtC4Maps31SearchHomeUserGuidesDataFetcher *v19;
  SearchHomeDataDownloader *v20;
  SearchHomeNoDataDataFetcher *v21;
  NSArray *v22;
  NSArray *dataFetchers;
  void *v24;
  SearchHomeNoDataLayoutProvider *v25;
  SearchHomeTipLayoutProvider *v26;
  void *v27;
  id v28;
  __objc2_class **v29;
  id v30;
  SearchHomeBrowseCategoriesLayoutProvider *v31;
  _TtC4Maps34SearchHomeUserGuidesLayoutProvider *v32;
  SearchHomeCuratedCollectionsLayoutProvider *v33;
  SearchHomePublishersLayoutProvider *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  SearchHomeCitiesLayoutProvider *v38;
  NSArray *v39;
  NSArray *layoutProviders;
  id v41;
  id v42;
  void *i;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *j;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  _QWORD *v65;
  void *v66;
  UICollectionViewDiffableDataSource *v67;
  UICollectionViewDiffableDataSource *collectionViewDiffableDataSource;
  _QWORD *v69;
  void *v70;
  id v71;
  SearchHomeAnalyticsManager *v72;
  SearchHomeAnalyticsManager *analyticsManager;
  void *v74;
  void *v76;
  SearchHomeDataDownloader *v77;
  void *v78;
  SearchHomeDataSource *v79;
  NSArray *obj;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[16];
  objc_super v91;
  _BYTE v92[128];
  _BYTE v93[128];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = a3;
  v91.receiver = self;
  v91.super_class = (Class)SearchHomeDataSource;
  v11 = -[DataSource initWithCollectionView:updateLocation:](&v91, "initWithCollectionView:updateLocation:", v10, v8);
  v12 = v11;
  if (v11)
  {
    -[SearchHomeDataSource setSearchAlongRoute:](v11, "setSearchAlongRoute:", v7);
    -[SearchHomeDataSource setSupportsFullTextSearch:](v12, "setSupportsFullTextSearch:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v12->_isUsingOfflineMaps = objc_msgSend(v14, "isUsingOfflineMaps");

    if (!-[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"))
    {
      if (MapsFeature_IsEnabled_MapsWally()
        && (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) == 0
        && !v12->_isUsingOfflineMaps)
      {
        v15 = sub_10043230C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SearchHome will show tip.", buf, 2u);
        }

        v17 = -[SearchHomeTipDataFetcher initWithDelegate:isSearchAlongRoute:]([SearchHomeTipDataFetcher alloc], "initWithDelegate:isSearchAlongRoute:", v12, -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"));
        objc_msgSend(v13, "addObject:", v17);

      }
      v18 = -[SearchHomeRecentSearchesDataFetcher initWithDelegate:isSearchAlongRoute:]([SearchHomeRecentSearchesDataFetcher alloc], "initWithDelegate:isSearchAlongRoute:", v12, -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"));
      objc_msgSend(v13, "addObject:", v18);

    }
    if (v12->_isUsingOfflineMaps
      && !-[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute")
      && !-[SearchHomeDataSource supportsFullTextSearch](v12, "supportsFullTextSearch"))
    {
      v19 = -[SearchHomeUserGuidesDataFetcher initWithDelegate:isSearchAlongRoute:]([_TtC4Maps31SearchHomeUserGuidesDataFetcher alloc], "initWithDelegate:isSearchAlongRoute:", v12, -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"));
      objc_msgSend(v13, "addObject:", v19);

    }
    v20 = -[SearchHomeDataDownloader initWithDelegate:isSearchAlongRoute:]([SearchHomeDataDownloader alloc], "initWithDelegate:isSearchAlongRoute:", v12, -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"));
    -[SearchHomeDataDownloader setSupportsFullTextSearch:](v20, "setSupportsFullTextSearch:", -[SearchHomeDataSource supportsFullTextSearch](v12, "supportsFullTextSearch"));
    v77 = v20;
    objc_msgSend(v13, "addObject:", v20);
    v21 = -[SearchHomeNoDataDataFetcher initWithDelegate:isSearchAlongRoute:]([SearchHomeNoDataDataFetcher alloc], "initWithDelegate:isSearchAlongRoute:", v12, -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"));
    objc_msgSend(v13, "addObject:", v21);

    v22 = (NSArray *)objc_msgSend(v13, "copy");
    dataFetchers = v12->_dataFetchers;
    v12->_dataFetchers = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v25 = objc_alloc_init(SearchHomeNoDataLayoutProvider);
    objc_msgSend(v24, "addObject:", v25);

    if (!-[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"))
    {
      if (MapsFeature_IsEnabled_MapsWally()
        && (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) == 0
        && !v12->_isUsingOfflineMaps)
      {
        v26 = objc_alloc_init(SearchHomeTipLayoutProvider);
        objc_msgSend(v24, "addObject:", v26);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
      v28 = objc_msgSend(v27, "userInterfaceIdiom");

      v29 = off_101197668;
      if (v28 != (id)5)
        v29 = off_101197F48;
      v30 = objc_alloc_init(*v29);
      objc_msgSend(v24, "addObject:", v30);

    }
    v31 = -[SearchHomeBrowseCategoriesLayoutProvider initWithSearchAlongRoute:supportsFullTextSearch:]([SearchHomeBrowseCategoriesLayoutProvider alloc], "initWithSearchAlongRoute:supportsFullTextSearch:", -[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"), v12->_supportsFullTextSearch);
    objc_msgSend(v24, "addObject:", v31);

    if (v12->_isUsingOfflineMaps
      && !-[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute")
      && !-[SearchHomeDataSource supportsFullTextSearch](v12, "supportsFullTextSearch"))
    {
      v32 = objc_alloc_init(_TtC4Maps34SearchHomeUserGuidesLayoutProvider);
      objc_msgSend(v24, "addObject:", v32);

    }
    v78 = v13;
    if (!-[SearchHomeDataSource searchAlongRoute](v12, "searchAlongRoute"))
    {
      v33 = -[SearchHomeCuratedCollectionsLayoutProvider initWithTraitEnvironment:]([SearchHomeCuratedCollectionsLayoutProvider alloc], "initWithTraitEnvironment:", v10);
      objc_msgSend(v24, "addObject:", v33);

      v34 = objc_alloc_init(SearchHomePublishersLayoutProvider);
      objc_msgSend(v24, "addObject:", v34);

      if (MapsFeature_IsEnabled_Maps269(v35, v36, v37))
      {
        if (sub_1002A8AA0(v10) != 5)
        {
          v38 = -[SearchHomeCitiesLayoutProvider initWithTraitEnvironment:]([SearchHomeCitiesLayoutProvider alloc], "initWithTraitEnvironment:", v10);
          objc_msgSend(v24, "addObject:", v38);

        }
      }
    }
    v39 = (NSArray *)objc_msgSend(v24, "copy", v24);
    layoutProviders = v12->_layoutProviders;
    v12->_layoutProviders = v39;

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v79 = v12;
    obj = v12->_layoutProviders;
    v41 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
    if (v41)
    {
      v42 = v41;
      v81 = *(_QWORD *)v87;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(_QWORD *)v87 != v81)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "cellClasses"));
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v83;
            do
            {
              for (j = 0; j != v47; j = (char *)j + 1)
              {
                if (*(_QWORD *)v83 != v48)
                  objc_enumerationMutation(v45);
                v50 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)j);
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "cellReuseIdentifier"));
                objc_msgSend(v10, "registerClass:forCellWithReuseIdentifier:", v50, v51);

              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v82, v92, 16);
            }
            while (v47);
          }

        }
        v42 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      }
      while (v42);
    }

    v52 = objc_opt_class(SectionHeaderCollectionReusableView);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
    objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v52, UICollectionElementKindSectionHeader, v53);

    v54 = objc_opt_class(SectionFooterCollectionReusableView);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[SectionFooterCollectionReusableView reuseIdentifier](SectionFooterCollectionReusableView, "reuseIdentifier"));
    objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v54, UICollectionElementKindSectionFooter, v55);

    v12 = v79;
    if (MapsFeature_IsEnabled_Maps269(v56, v57, v58)
      && sub_1002A8AA0(v10) != 5
      && !-[SearchHomeDataSource searchAlongRoute](v79, "searchAlongRoute"))
    {
      v59 = objc_opt_class(MKExploreGuidesReusableView);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[MKExploreGuidesReusableView reuseIdentifier](MKExploreGuidesReusableView, "reuseIdentifier"));
      objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v59, UICollectionElementKindSectionFooter, v60);

    }
    v61 = objc_opt_class(ActionButtonCollectionReusableView);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[ActionButtonCollectionReusableView reuseIdentifier](ActionButtonCollectionReusableView, "reuseIdentifier"));
    objc_msgSend(v10, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v61, UICollectionElementKindSectionFooter, v62);

    v63 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v79, "collectionView"));
    v65 = sub_10046DA38(v79);
    v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v67 = (UICollectionViewDiffableDataSource *)objc_msgSend(v63, "initWithCollectionView:cellProvider:", v64, v66);
    collectionViewDiffableDataSource = v79->_collectionViewDiffableDataSource;
    v79->_collectionViewDiffableDataSource = v67;

    v69 = sub_10046DBB0(v79);
    v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v79->_collectionViewDiffableDataSource, "setSupplementaryViewProvider:", v70);

    if (sub_1002A8AA0(v10) == 5)
    {
      v71 = objc_msgSend(objc_alloc((Class)UIHoverGestureRecognizer), "initWithTarget:action:", v79, "_hoverGestureRecognizerStateDidChange:");
      objc_msgSend(v10, "addGestureRecognizer:", v71);
    }
    else
    {
      v71 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v71, "addObserver:selector:name:object:", v79, "contentSizeDidChange:", UIContentSizeCategoryDidChangeNotification, 0);
    }

    v72 = -[SearchHomeAnalyticsManager initWithSearchAlongRoute:]([SearchHomeAnalyticsManager alloc], "initWithSearchAlongRoute:", -[SearchHomeDataSource searchAlongRoute](v79, "searchAlongRoute"));
    analyticsManager = v79->_analyticsManager;
    v79->_analyticsManager = v72;

    if (!-[SearchHomeDataSource searchAlongRoute](v79, "searchAlongRoute"))
    {
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
      objc_msgSend(v74, "addObserver:", v79);

    }
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchHomeDataSource;
  -[SearchHomeDataSource dealloc](&v4, "dealloc");
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSIndexPath *v11;
  NSIndexPath *lastSelectedIndexPath;
  id v13;

  v13 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v7 = sub_1002A8AA0(v6);

  if (v7 == 5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    objc_msgSend(v8, "deselectItemAtIndexPath:animated:", self->_lastSelectedIndexPath, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextFocusedIndexPath"));
    objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);

    v11 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nextFocusedIndexPath"));
    lastSelectedIndexPath = self->_lastSelectedIndexPath;
    self->_lastSelectedIndexPath = v11;

  }
}

- (void)_hoverGestureRecognizerStateDidChange:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSIndexPath *v13;
  NSIndexPath *v14;
  NSIndexPath *v15;
  char v16;
  NSIndexPath *lastSelectedIndexPath;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  CGPoint v23;
  CGRect v24;

  v22 = a3;
  if (objc_msgSend(v22, "_maps_isHovering"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    objc_msgSend(v22, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForItemAtPoint:", v6, v8));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cellForItemAtIndexPath:", v10));

    if (v12 && (objc_msgSend(v12, "frame"), v23.x = v6, v23.y = v8, CGRectContainsPoint(v24, v23)))
    {
      if (v10)
      {
        if ((objc_msgSend(v10, "isEqual:", self->_lastSelectedIndexPath) & 1) != 0)
        {
          v13 = 0;
LABEL_13:
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
          objc_msgSend(v18, "selectItemAtIndexPath:animated:scrollPosition:", v10, 0, 0);

          objc_storeStrong((id *)&self->_lastSelectedIndexPath, v10);
          if (v12)
            objc_msgSend(v12, "canBecomeFirstResponder");
          objc_msgSend(v12, "becomeFirstResponder");
LABEL_16:

          if (v13)
            goto LABEL_17;
          goto LABEL_18;
        }
        v16 = 0;
LABEL_12:
        v13 = self->_lastSelectedIndexPath;
        lastSelectedIndexPath = self->_lastSelectedIndexPath;
        self->_lastSelectedIndexPath = 0;

        if ((v16 & 1) != 0)
          goto LABEL_16;
        goto LABEL_13;
      }
    }
    else
    {

      v10 = 0;
    }
    v16 = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v22, "state") == (id)3)
  {
    v14 = self->_lastSelectedIndexPath;
    if (v14)
    {
      v13 = v14;
      v15 = self->_lastSelectedIndexPath;
      self->_lastSelectedIndexPath = 0;

LABEL_17:
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "cellForItemAtIndexPath:", v13));

      objc_msgSend(v20, "resignFirstResponder");
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      objc_msgSend(v21, "deselectItemAtIndexPath:animated:", v13, 0);

    }
  }
LABEL_18:

}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v3 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SearchHomeDataSource;
  v5 = -[DataSource setActive:](&v19, "setActive:");
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("PPTTest_SearchHome_DidSetActive"), self);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11), "fetchContent");
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    -[SearchHomeDataSource setNeedsUpdate](self, "setNeedsUpdate");
  }
  else if (MapsFeature_IsEnabled_MapsWally(v5)
         && (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) == 0)
  {
    v12 = sub_10043222C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Data source marked inactive. Will not show SearchHome tip again.", v14, 2u);
    }

    -[SearchHomeDataSource setShouldRemoveSearchHomeTip:](self, "setShouldRemoveSearchHomeTip:", 1);
  }
}

- (void)setShouldRemoveSearchHomeTip:(BOOL)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  self->_shouldRemoveSearchHomeTip = a3;
  if (a3)
  {
    v3 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting SearchTip value to YES", v5, 2u);
    }

    GEOConfigSetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68, 1);
  }
}

- (BOOL)shouldShowNoRecentSearchesCell
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(v3);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "isFetchingDataComplete"))
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders", 0));
    v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (!v8)
    {
      v15 = 1;
      goto LABEL_20;
    }
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_11:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v3);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if (objc_msgSend(v12, "type"))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objects"));
        v14 = objc_msgSend(v13, "count");

        if (v14)
          break;
      }
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        v15 = 1;
        if (v9)
          goto LABEL_11;
        goto LABEL_20;
      }
    }
  }
  v15 = 0;
LABEL_20:

  return v15;
}

- (void)setNeedsUpdate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003E7040;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_applyTableViewSnapshot
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned int v23;
  _BOOL4 supportsFullTextSearch;
  void *v25;
  void *v26;
  uint64_t v27;
  SearchHomeDataSource *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  _BYTE v34[10];
  _BYTE v35[10];
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _BYTE v40[128];

  if (self->_tableViewDiffableDataSource)
  {
    v27 = 160;
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v28 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier", v27));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objects"));
          v13 = objc_msgSend(v12, "copy");

          if (objc_msgSend(v13, "count"))
            v14 = v11 == 0;
          else
            v14 = 1;
          if (v14)
          {
            v15 = sub_10043230C();
            v17 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v34 = v11;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "The section identifier - %@ and there are no objects to reload.", buf, 0xCu);
            }
          }
          else
          {
            v39 = v11;
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
            objc_msgSend(v4, "appendSectionsWithIdentifiers:", v16);

            objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v13, v11);
            v37 = v11;
            v38 = v13;
            v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
            -[NSObject addObject:](v3, "addObject:", v17);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      }
      while (v7);
    }

    v18 = sub_10043230C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](v28, "dataProviders"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource layoutProviders](v28, "layoutProviders"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v34 = v4;
      *(_WORD *)&v34[8] = 2112;
      *(_QWORD *)v35 = v20;
      *(_WORD *)&v35[8] = 2112;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "The table view snapshot - (%@) will be applied, Data Providers : %@, Layout providers : %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)((char *)&v28->super.super.isa + v27), "applySnapshotUsingReloadData:", v4);
    goto LABEL_21;
  }
  v22 = sub_10043230C();
  v3 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v23 = objc_msgSend(v4, "isUsingOfflineMaps");
    supportsFullTextSearch = self->_supportsFullTextSearch;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dataSource"));
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v34 = v23;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = supportsFullTextSearch;
    *(_WORD *)v35 = 2112;
    *(_QWORD *)&v35[2] = v26;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "The _tableViewDiffableDataSource is nil but the user is trying to add a stop in Route planning, The Maps Offline status: %d, Full text support: %d, Table view datasource: %@", buf, 0x18u);

LABEL_21:
  }

}

- (void)applySnapshotWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unsigned __int8 v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t spid;
  unint64_t v38;
  void (**v39)(_QWORD);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _BYTE v57[128];

  v39 = (void (**)(_QWORD))a3;
  v4 = sub_1003E7B84();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = sub_1003E7B84();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  v38 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SearchHomeApplyingSnapshot", ", buf, 2u);
  }
  spid = v6;

  v40 = objc_alloc_init((Class)NSMutableArray);
  v10 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objects"));
          v19 = objc_msgSend(v18, "copy");

          if (!objc_msgSend(v16, "type"))
          {
            if (!-[SearchHomeDataSource shouldShowNoRecentSearchesCell](self, "shouldShowNoRecentSearchesCell"))
              goto LABEL_20;
            v56 = v17;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
            objc_msgSend(v10, "appendSectionsWithIdentifiers:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objects"));
            objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, v17);

            v54 = v17;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objects"));
            v55 = v21;
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
            objc_msgSend(v40, "addObject:", v25);

            goto LABEL_19;
          }
          if ((objc_msgSend(v16, "type") != (id)6
             || !-[SearchHomeDataSource shouldRemoveSearchHomeTip](self, "shouldRemoveSearchHomeTip"))
            && -[NSObject count](v19, "count"))
          {
            v53 = v17;
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
            objc_msgSend(v10, "appendSectionsWithIdentifiers:", v20);

            objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v19, v17);
            v51 = v17;
            v52 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
            objc_msgSend(v40, "addObject:", v21);
LABEL_19:

          }
        }
        else
        {
          v22 = sub_10043230C();
          v19 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v46 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "The section identifier - %@ is nil while applying the snapshot.", buf, 0xCu);
          }
        }
LABEL_20:

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v13);
  }

  v26 = objc_msgSend(v40, "copy");
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource cachedSnapshotObjects](self, "cachedSnapshotObjects"));
  v28 = objc_msgSend(v26, "isEqualToArray:", v27);

  if ((v28 & 1) == 0)
  {
    -[SearchHomeDataSource setCachedSnapshotObjects:](self, "setCachedSnapshotObjects:", v26);
    v29 = sub_10043230C();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource layoutProviders](self, "layoutProviders"));
      *(_DWORD *)buf = 138412802;
      v46 = v10;
      v47 = 2112;
      v48 = v31;
      v49 = 2112;
      v50 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "The snapshot - (%@) will be applied, Data Providers : %@, Layout providers : %@", buf, 0x20u);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
    objc_msgSend(v33, "applySnapshotUsingReloadData:", v10);

  }
  v39[2](v39);
  v34 = sub_1003E7B84();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  v36 = v35;
  if (v38 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v36, OS_SIGNPOST_INTERVAL_END, spid, "SearchHomeApplyingSnapshot", ", buf, 2u);
  }

}

- (void)contentSizeDidChange:(id)a3
{
  -[SearchHomeDataSource reloadSectionOfType:](self, "reloadSectionOfType:", 2);
}

- (void)didUpdateDataFetcher:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  void *v31;
  NSArray *v32;
  NSArray *objectsForAnalytics;
  AutocompleteContext *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *k;
  uint64_t v40;
  void *v41;
  AutocompleteContext *autocompleteContext;
  AutocompleteContext *v43;
  void *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  os_signpost_id_t spid;
  unint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  uint8_t buf[16];
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];

  v4 = a3;
  v5 = sub_1003E7B84();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_signpost_id_generate(v6);

  v8 = sub_1003E7B84();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  v49 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v7, "UpdateDataFetcher", ", buf, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v50 = v4;
  spid = v7;
  if (!self->_isUsingOfflineMaps
    || -[SearchHomeDataSource searchAlongRoute](self, "searchAlongRoute")
    || -[SearchHomeDataSource supportsFullTextSearch](self, "supportsFullTextSearch"))
  {
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataProviders"));

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataProviders"));
            objc_msgSend(v11, "addObjectsFromArray:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v14);
    }
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1003E8110;
    v65[3] = &unk_1011B4858;
    v21 = v11;
    v66 = v21;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v65);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1003E8198;
    v63[3] = &unk_1011B4858;
    v64 = v21;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v63);

    v12 = v66;
  }

  v23 = objc_msgSend(v11, "copy");
  -[SearchHomeDataSource setDataProviders:](self, "setDataProviders:", v23);

  -[SearchHomeDataSource setNeedsUpdate](self, "setNeedsUpdate");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j);
        if ((objc_opt_respondsToSelector(v30, "objectsForAnalytics") & 1) != 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectsForAnalytics"));
          if (objc_msgSend(v31, "count"))
            objc_msgSend(v24, "addObjectsFromArray:", v31);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v27);
  }

  v32 = (NSArray *)objc_msgSend(v24, "copy");
  objectsForAnalytics = self->_objectsForAnalytics;
  self->_objectsForAnalytics = v32;

  v34 = -[AutocompleteContext initWithQueryString:]([AutocompleteContext alloc], "initWithQueryString:", &stru_1011EB268);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v35 = v24;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v52 != v38)
          objc_enumerationMutation(v35);
        v40 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)k);
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[AutocompleteMatchInfo matchInfoWithType:](AutocompleteMatchInfo, "matchInfoWithType:", 0));
        -[AutocompleteContext setMatchInfo:forObject:](v34, "setMatchInfo:forObject:", v41, v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v68, 16);
    }
    while (v37);
  }

  autocompleteContext = self->_autocompleteContext;
  self->_autocompleteContext = v34;
  v43 = v34;

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v44, "postNotificationName:object:", CFSTR("PPTTest_SearchHome_DidUpdateDataFetcher"), v50);

  v45 = sub_1003E7B84();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  v47 = v46;
  if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_END, spid, "UpdateDataFetcher", ", buf, 2u);
  }

}

- (id)newTraits
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource searchHomeDataSourceDelegate](self, "searchHomeDataSourceDelegate"));
  v3 = objc_msgSend(v2, "newTraits");

  return v3;
}

- (double)isTouristHereValue
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource searchHomeDataSourceDelegate](self, "searchHomeDataSourceDelegate"));
  objc_msgSend(v2, "isTouristHereValue");
  v4 = v3;

  return v4;
}

- (void)reloadSectionOfType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderOfType:](self, "dataProviderOfType:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

  if (objc_msgSend(v5, "length"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers"));
    v9 = objc_msgSend(v8, "containsObject:", v5);

    v10 = sub_10043230C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v5;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Reloading section: %@", buf, 0xCu);
      }

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders", 0));
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v20 = objc_msgSend(v19, "isEqualToString:", v5);

            if (v20)
            {
              v27 = v5;
              v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
              objc_msgSend(v7, "deleteItemsWithIdentifiers:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objects"));
              objc_msgSend(v7, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v22, v5);

              goto LABEL_17;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_17:

      v12 = objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
      -[NSObject applySnapshot:animatingDifferences:](v12, "applySnapshot:animatingDifferences:", v7, 0);
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to reload snapshot section named: %@ as it is not in the snapshot.", buf, 0xCu);
    }

  }
}

- (id)layoutProviderForDataProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource layoutProviders](self, "layoutProviders", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "type");
        if (v10 == objc_msgSend(v4, "type"))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dataProviderWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)dataProviderOfType:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1003E8890;
  v12 = sub_1003E88A0;
  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003E88A8;
  v7[3] = &unk_1011B4880;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_emptySection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v2, v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutItem itemWithLayoutSize:](NSCollectionLayoutItem, "itemWithLayoutSize:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", 1.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:", 1.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSize sizeWithWidthDimension:heightDimension:](NSCollectionLayoutSize, "sizeWithWidthDimension:heightDimension:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:repeatingSubitem:count:](NSCollectionLayoutGroup, "horizontalGroupWithLayoutSize:repeatingSubitem:count:", v8, v5, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCollectionLayoutSection sectionWithGroup:](NSCollectionLayoutSection, "sectionWithGroup:", v9));

  return v10;
}

- (UICollectionViewLayout)collectionViewLayout
{
  UICollectionViewLayout *collectionViewLayout;
  id v4;
  UICollectionViewLayout *v5;
  UICollectionViewLayout *v6;
  _QWORD v8[5];
  id v9;
  id location;

  collectionViewLayout = self->_collectionViewLayout;
  if (!collectionViewLayout)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003E8B2C;
    v8[3] = &unk_1011B2AB0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    v5 = (UICollectionViewLayout *)objc_msgSend(v4, "initWithSectionProvider:", v8);
    v6 = self->_collectionViewLayout;
    self->_collectionViewLayout = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    collectionViewLayout = self->_collectionViewLayout;
  }
  return collectionViewLayout;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint8_t buf[4];
  NSObject *v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  NSObject *v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
  if (objc_msgSend(v13, "count"))
  {
    v14 = -[NSObject section](v9, "section");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
    v16 = objc_msgSend(v15, "count");

    if (v14 < v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", -[NSObject section](v9, "section")));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderWithIdentifier:](self, "dataProviderWithIdentifier:", v18));
      v20 = v10;
      if ((objc_opt_respondsToSelector(v19, "viewModels") & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
          v24 = -[NSObject row](v9, "row");
          if (v24 >= objc_msgSend(v23, "count"))
          {
            v30 = sub_10043222C();
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v34 = v18;
              v35 = 2112;
              v36 = v9;
              v37 = 2112;
              v38 = v12;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error fetching SearchHome cell for section: %@, indexpath:%@, snapshot: %@", buf, 0x20u);
            }

            v27 = 0;
            goto LABEL_8;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", -[NSObject row](v9, "row")));

          v20 = (id)v32;
        }
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource layoutProviderForDataProvider:](self, "layoutProviderForDataProvider:", v19));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellForRowAtIndexPath:collectionView:item:", v9, v8, v20));

LABEL_8:
      goto LABEL_13;
    }
  }
  else
  {

  }
  v28 = sub_10043222C();
  v18 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v9;
    v35 = 2112;
    v36 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error fetching SearchHome section at indexpath: %@, snapshot: %@", buf, 0x16u);
  }
  v27 = 0;
LABEL_13:

  return v27;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  SearchHomeDataSource *v56;
  uint64_t *v57;
  id v58;
  _QWORD v59[5];
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE location[12];
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  uint64_t v77;

  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v10, "section")));

  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1003E8890;
  v69 = sub_1003E88A0;
  v70 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderWithIdentifier:](self, "dataProviderWithIdentifier:", v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  if (sub_1002A8AA0(v15) == 5
    && objc_msgSend((id)v66[5], "conformsToProtocol:", &OBJC_PROTOCOL___SearchHomeDataProviderDeletable))
  {
    v16 = UICollectionElementKindSectionFooter;

    if (UICollectionElementKindSectionFooter == v9)
    {
      v17 = (id)v66[5];
      if (objc_msgSend(v17, "entriesState") == (id)1)
      {
        v18 = 0;
      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[SectionFooterCollectionReusableView reuseIdentifier](SectionFooterCollectionReusableView, "reuseIdentifier"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v43, v10));

        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_1003EA284;
        v62[3] = &unk_1011AD318;
        v18 = v44;
        v63 = v18;
        v64 = &v65;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v62);
        objc_msgSend(v18, "setNeedsLayout");
        objc_msgSend(v18, "layoutIfNeeded");

      }
      goto LABEL_29;
    }
  }
  else
  {

    v16 = UICollectionElementKindSectionFooter;
  }
  if (-[NSString isEqualToString:](v9, "isEqualToString:", v16) && objc_msgSend((id)v66[5], "type") == (id)3)
  {
    v51 = (id)v66[5];
    if (MapsFeature_IsEnabled_Maps269(v51, v19, v20)
      && (v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "exploreGuides"))) != 0
      && (v22 = sub_1002A8AA0(v8) == 5, v21, !v22))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[MKExploreGuidesReusableView reuseIdentifier](MKExploreGuidesReusableView, "reuseIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v16, v46, v10));

      v47 = (void *)objc_claimAutoreleasedReturnValue(+[MKExploreGuidesReusableView reuseIdentifier](MKExploreGuidesReusableView, "reuseIdentifier"));
      objc_msgSend(v18, "setAccessibilityLabel:", v47);

      objc_initWeak((id *)location, self);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "exploreGuides"));
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_1003EA3A0;
      v60[3] = &unk_1011B4970;
      objc_copyWeak(&v61, (id *)location);
      objc_msgSend(v18, "configureWithExploreGuides:tapHandler:", v48, v60);

      objc_destroyWeak(&v61);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("[Search Home] See All Guides"), CFSTR("localized string not found"), 0));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[ActionButtonCollectionReusableView reuseIdentifier](ActionButtonCollectionReusableView, "reuseIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v16, v24, v10));

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[ActionButtonCollectionReusableView reuseIdentifier](ActionButtonCollectionReusableView, "reuseIdentifier"));
      objc_msgSend(v18, "setAccessibilityIdentifier:", v25);

      v26 = objc_msgSend(objc_alloc((Class)MKPlaceCollectionsSizeController), "initWithDefaultCollectionsConfigurationUsingTraitCollections:inContext:", v8, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      v28 = objc_msgSend(v27, "effectiveUserInterfaceLayoutDirection") == (id)1;

      objc_msgSend(v26, "sectionInsets");
      if (v28)
      {
        objc_msgSend(v18, "setLeadingPadding:", v30);
        objc_msgSend(v26, "sectionInsets");
        v32 = v31;
      }
      else
      {
        objc_msgSend(v18, "setLeadingPadding:", v29);
        objc_msgSend(v26, "sectionInsets");
        v32 = v42;
      }
      objc_msgSend(v18, "setTrailingPadding:", v32, v49);
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1003EA424;
      v59[3] = &unk_1011AC860;
      v59[4] = self;
      objc_msgSend(v18, "setTitle:completion:", v50, v59);

    }
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v66[5], "objects"));
    if (objc_msgSend(v33, "count"))
    {
      v34 = objc_msgSend((id)v66[5], "type") == 0;

      if (!v34)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v35, v10));

        objc_initWeak((id *)location, self);
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1003EA478;
        v52[3] = &unk_1011B4998;
        v37 = v36;
        v53 = v37;
        v57 = &v65;
        v54 = v8;
        v55 = v10;
        objc_copyWeak(&v58, (id *)location);
        v56 = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v52);
        v18 = v37;
        objc_destroyWeak(&v58);

        objc_destroyWeak((id *)location);
        goto LABEL_29;
      }
    }
    else
    {

    }
    v38 = sub_10043222C();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = v66[5];
      *(_DWORD *)location = 138413058;
      *(_QWORD *)&location[4] = v9;
      v72 = 2112;
      v73 = v14;
      v74 = 2112;
      v75 = v12;
      v76 = 2112;
      v77 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unable to create a Supplementary View of kind : %@. Section Identifier: %@. Snapshot: %@. Data provider: %@", location, 0x2Au);
    }

    if (-[NSString isEqualToString:](v9, "isEqualToString:", v16))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SectionFooterCollectionReusableView reuseIdentifier](SectionFooterCollectionReusableView, "reuseIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v16, v41, v10));
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SectionHeaderCollectionReusableView reuseIdentifier](SectionHeaderCollectionReusableView, "reuseIdentifier"));
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v41, v10));
    }

    objc_msgSend(v18, "setAlpha:", 0.0);
  }
LABEL_29:
  _Block_object_dispose(&v65, 8);

  return v18;
}

- (double)heightForHeaderInSection:(int64_t)a3 dataProvider:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  double Width;
  void *v16;
  void *v17;
  double v18;
  CGRect v20;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objects"));
  if (!objc_msgSend(v7, "count"))
  {
    v10 = 0.0;
LABEL_9:

    goto LABEL_10;
  }
  v8 = objc_msgSend(v6, "type");

  if (v8)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___SearchHomeDataProviderDeletable))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Clear [No Query State]"), CFSTR("localized string not found"), 0));

    }
    else
    {
      v7 = 0;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v12 = objc_msgSend(v11, "_maps_indexOfFirstNonEmptySection") == (id)a3;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    objc_msgSend(v14, "bounds");
    Width = CGRectGetWidth(v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "traitCollection"));
    +[SectionHeaderCollectionReusableView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderCollectionReusableView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", v12, v13, v7, v17, Width);
    v10 = v18;

    goto LABEL_9;
  }
  v10 = 0.0;
LABEL_10:

  return v10;
}

- (double)heightForFooterInSection:(int64_t)a3 dataProvider:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  if (sub_1002A8AA0(v6) == 5)
  {
    v7 = objc_msgSend(v5, "type");

    if (v7 == (id)1 && !objc_msgSend(v5, "entriesState"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollection"));
      +[SectionFooterCollectionReusableView heightForFooterViewWithTraitCollection:](SectionFooterCollectionReusableView, "heightForFooterViewWithTraitCollection:", v9);
      v11 = v10;

      goto LABEL_11;
    }
  }
  else
  {

  }
  v12 = objc_msgSend(v5, "type");
  if (v12 == (id)3
    || (v11 = 0.0, MapsFeature_IsEnabled_Maps269(v12, v13, v14))
    && objc_msgSend(v5, "type") == (id)5
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView")),
        v17 = sub_1002A8AA0(v16),
        v16,
        v17 != 5))
  {
    +[ActionButtonCollectionReusableView estimatedHeight](ActionButtonCollectionReusableView, "estimatedHeight");
    v11 = v15;
  }
LABEL_11:

  return v11;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v42;
  uint8_t v43[16];

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sectionIdentifiers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "section")));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderWithIdentifier:](self, "dataProviderWithIdentifier:", v10));
  v12 = objc_msgSend(v11, "type");
  switch((unint64_t)v12)
  {
    case 1uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v6, "row")));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v15, "dataSource:itemTapped:", self, v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
      v17 = objc_msgSend(v6, "row");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsSuggestions](self, "analyticsSuggestions"));
      objc_msgSend(v16, "recentTappedAtIndex:visibleSuggestions:", v17, v18);

      break;
    case 2uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v6, "row")));

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "category"));
      objc_msgSend(v21, "dataSource:itemTapped:", self, v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
      objc_msgSend(v23, "browseCategoryTapped:", v24);
      goto LABEL_7;
    case 3uLL:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", objc_msgSend(v6, "row")));

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v26, "dataSource:itemTapped:", self, v20);

      v27 = objc_msgSend(v11, "itemIsSaved:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "collectionIdentifier"));
      objc_msgSend(v23, "curatedCollectionsTappedWithMuid:horizontalIndex:isCurrentlySaved:", objc_msgSend(v28, "muid"), objc_msgSend(v6, "row"), v27);

      goto LABEL_8;
    case 4uLL:
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectAtIndex:", objc_msgSend(v6, "row")));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v30, "dataSource:itemTapped:", self, v20);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
      objc_msgSend(v23, "publisherTappedWithMuid:verticalIndex:", objc_msgSend(v24, "muid"), objc_msgSend(v6, "row"));
      goto LABEL_7;
    case 5uLL:
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v6, "row")));

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
      objc_msgSend(v32, "dataSource:itemTapped:", self, v20);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "guideLocationIdentifier"));
      objc_msgSend(v23, "guideLocationTappedWithMuid:horizontalIndex:", objc_msgSend(v24, "muid"), objc_msgSend(v6, "row"));
LABEL_7:

LABEL_8:
      goto LABEL_9;
    case 6uLL:
      if (MapsFeature_IsEnabled_MapsWally(v12)
        && (GEOConfigGetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68) & 1) == 0)
      {
        v33 = sub_10043230C();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removing SearchHome Tip.", v43, 2u);
        }

        GEOConfigSetBOOL(MapsConfig_SearchHomeShowsSearchTip, off_1014B4D68, 1);
        -[SearchHomeDataSource setShouldRemoveSearchHomeTip:](self, "setShouldRemoveSearchHomeTip:", 1);
        -[SearchHomeDataSource setNeedsUpdate](self, "setNeedsUpdate");
      }
      break;
    case 7uLL:
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objects"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", objc_msgSend(v6, "row")));

      v36 = objc_opt_class(_TtC4Maps33SearchHomeUserGuidesCellViewModel);
      if ((objc_opt_isKindOfClass(v20, v36) & 1) != 0)
      {
        v37 = v20;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "collections"));
        objc_msgSend(v38, "dataSource:itemTapped:", self, v39);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "collections"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifier"));
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("__internal_CollectionPlaceholderIdentifier"));

        if (v42)
          -[SearchHomeDataSource addToCollectionObserver](self, "addToCollectionObserver");

      }
LABEL_9:

      break;
    default:
      break;
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource tableViewDiffableDataSource](self, "tableViewDiffableDataSource"));
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "snapshot"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sectionIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderWithIdentifier:](self, "dataProviderWithIdentifier:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objects"));
  v12 = objc_msgSend(v6, "row");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
  objc_msgSend(v14, "dataSource:itemTapped:", self, v13);

}

- (void)performDeleteAnimationOnSectionWithIdentifier:(id)a3 itemAtIndex:(unint64_t)a4 dataProvider:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));

  if (objc_msgSend(v11, "numberOfItemsInSection:", v9) == (id)1)
  {
    v17 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    objc_msgSend(v11, "deleteSectionsWithIdentifiers:", v12);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "itemIdentifiersInSectionWithIdentifier:", v9));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", a4));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v11, "deleteItemsWithIdentifiers:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
  objc_msgSend(v15, "applySnapshot:animatingDifferences:", v11, v6);

}

- (void)addKeyCommand:(id)a3
{
  NSArray *keyCommands;
  NSArray *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  NSArray *v10;
  NSArray *v11;
  id v12;

  v12 = a3;
  if (-[SearchHomeDataSource needsToResetKeyCommands](self, "needsToResetKeyCommands"))
  {
    keyCommands = self->_keyCommands;
    self->_keyCommands = (NSArray *)&__NSArray0__struct;

    -[SearchHomeDataSource setNeedsToResetKeyCommands:](self, "setNeedsToResetKeyCommands:", 0);
  }
  v5 = self->_keyCommands;
  if (-[NSArray count](v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", v6));
      v8 = objc_msgSend(v7, "action");
      v9 = objc_msgSend(v12, "action");

      if (v8 == v9)
        break;
      if (++v6 >= -[NSArray count](v5, "count"))
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](v5, "arrayByAddingObject:", v12));
    v11 = self->_keyCommands;
    self->_keyCommands = v10;

  }
}

- (void)reorderKeyCommands
{
  id v3;
  NSUInteger v4;
  void *v5;
  SearchHomeDataSource *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *keyCommands;
  id obj;
  uint64_t v30;
  id v31;
  SearchHomeDataSource *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v3 = objc_alloc((Class)NSMutableArray);
  v4 = -[NSArray count](self->_keyCommands, "count");
  v5 = v3;
  v6 = self;
  v31 = objc_msgSend(v5, "initWithCapacity:", v4);
  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_keyCommands, "count"));
  if (-[NSArray count](v6->_keyCommands, "count"))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v6->_keyCommands, "objectAtIndexedSubscript:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "propertyList"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("section")));
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu:%lu"), v12, v8));
      objc_msgSend(v7, "addObject:", v13);

      ++v8;
    }
    while (v8 < -[NSArray count](v6->_keyCommands, "count"));
  }
  v32 = v6;
  objc_msgSend(v7, "sortUsingSelector:", "localizedCaseInsensitiveCompare:");
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v7;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v30 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v30)
          objc_enumerationMutation(obj);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "componentsSeparatedByString:", CFSTR(":")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastObject"));
        v17 = objc_msgSend(v16, "integerValue");

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v32->_keyCommands, "objectAtIndexedSubscript:", v17));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "image"));
        v21 = objc_msgSend(v18, "action");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v31, "count") + 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringValue"));
        v24 = objc_msgSend(v18, "modifierFlags");
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "propertyList"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand commandWithTitle:image:action:input:modifierFlags:propertyList:](UIKeyCommand, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v19, v20, v21, v23, v24, v25));
        objc_msgSend(v31, "addObject:", v26);

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
  }

  v27 = (NSArray *)objc_msgSend(v31, "copy");
  keyCommands = v32->_keyCommands;
  v32->_keyCommands = v27;

}

- (void)sendNoTypingACAnalytics
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsManager](self, "analyticsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource analyticsSuggestions](self, "analyticsSuggestions"));
  objc_msgSend(v4, "autocompleteSessionsStartedWithVisibleSuggestions:", v3);

}

- (id)analyticsSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource autocompleteContext](self, "autocompleteContext"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource objectsForAnalytics](self, "objectsForAnalytics"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource autocompleteContext](self, "autocompleteContext"));
    v6 = -[SearchHomeDataSource newTraits](self, "newTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsAnalyticsHelper acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:](MapsAnalyticsHelper, "acSuggestionEntriesFromAutoCompleteObjects:context:mapsSuggestionsInsights:skipReportASearchItems:traits:", v4, v5, 0, 1, v6));

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  -[SearchHomeDataSource reloadSectionOfType:](self, "reloadSectionOfType:", 3);
}

- (id)tableView:(id)a3 indexPath:(id)a4 identifier:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  NSObject *v32;
  uint64_t v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  __int16 v38;
  NSObject *v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource tableViewDiffableDataSource](self, "tableViewDiffableDataSource"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapshot"));

  v13 = -[NSObject section](v9, "section");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
    v16 = objc_msgSend(v15, "count");

    if (v13 < v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sectionIdentifiers](v12, "sectionIdentifiers"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", v13));

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderWithIdentifier:](self, "dataProviderWithIdentifier:", v18));
      v20 = v10;
      if ((objc_opt_respondsToSelector(v19, "viewModels") & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
          v24 = -[NSObject row](v9, "row");
          if (v24 >= objc_msgSend(v23, "count"))
          {
            v31 = sub_10043222C();
            v32 = objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v35 = v18;
              v36 = 2112;
              v37 = v9;
              v38 = 2112;
              v39 = v12;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Error fetching SearchHome cell for section: %@, indexpath:%@, snapshot: %@", buf, 0x20u);
            }

            v29 = 0;
            goto LABEL_15;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "viewModels"));
          v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndex:", -[NSObject row](v9, "row")));

          v20 = (id)v33;
        }
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource layoutProviderForDataProvider:](self, "layoutProviderForDataProvider:", v19));
      if ((objc_opt_respondsToSelector(v26, "cellForRowAtIndexPath:tableview:item:") & 1) != 0)
        v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "cellForRowAtIndexPath:tableview:item:", v9, v8, v20));
      else
        v27 = objc_alloc_init((Class)UITableViewCell);
      v29 = v27;

LABEL_15:
      goto LABEL_16;
    }
  }
  else
  {

  }
  v28 = sub_10043222C();
  v18 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v9;
    v36 = 2112;
    v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error fetching SearchHome section at indexpath: %@, snapshot: %@", buf, 0x16u);
  }
  v29 = 0;
LABEL_16:

  return v29;
}

- (void)setupTableHeaderView
{
  void *v3;
  SectionHeaderTableViewHeaderFooterView *v4;
  void *v5;
  double Width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[Offline Route Planning] Find Nearby"), CFSTR("localized string not found"), 0));

  v4 = -[SectionHeaderTableViewHeaderFooterView initWithTitle:isFirstNonEmptySection:]([SectionHeaderTableViewHeaderFooterView alloc], "initWithTitle:isFirstNonEmptySection:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v5, "frame");
  Width = CGRectGetWidth(v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitCollection"));
  +[SectionHeaderTableViewHeaderFooterView heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:](SectionHeaderTableViewHeaderFooterView, "heightWhenFirstNonEmptySection:title:actionTitle:availableWidth:traitCollection:", 1, v13, 0, v8, Width);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v11, "frame");
  -[SectionHeaderTableViewHeaderFooterView setBounds:](v4, "setBounds:", 0.0, 0.0, CGRectGetWidth(v15), v10);

  -[SectionHeaderTableViewHeaderFooterView layoutIfNeeded](v4, "layoutIfNeeded");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource tableView](self, "tableView"));
  objc_msgSend(v12, "setTableHeaderView:", v4);

}

- (void)_ppt_selectCategoryAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1003E8890;
  v18 = sub_1003E88A0;
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003EC310;
  v13[3] = &unk_1011B49C0;
  v13[4] = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  if (v15[5])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource collectionViewDiffableDataSource](self, "collectionViewDiffableDataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v15[5], "identifier"));
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      -[SearchHomeDataSource collectionView:didSelectItemAtIndexPath:](self, "collectionView:didSelectItemAtIndexPath:", v12, v11);

    }
  }
  _Block_object_dispose(&v14, 8);

}

- (unint64_t)_ppt_numberOfDataFetchers
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)_ppt_selectSeeAllCuratedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource searchHomeDataSourceDelegate](self, "searchHomeDataSourceDelegate"));
  objc_msgSend(v2, "seeAllTappedForCollections");

}

- (void)_ppt_selectFirstGuidePublisher
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == (id)4)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
          v10 = objc_msgSend(v9, "count");

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

            v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
            objc_msgSend(v13, "dataSource:itemTapped:", self, v12);

            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)_ppt_selectExploreGuides
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviderOfType:](self, "dataProviderOfType:", 3));
  if (v3)
  {
    v6 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "exploreGuides"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource searchHomeDataSourceDelegate](self, "searchHomeDataSourceDelegate"));
      objc_msgSend(v5, "showGuidesHomeFromExploreGuides:", v4);

    }
    v3 = v6;
  }

}

- (void)_ppt_selectBrowseCities
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource searchHomeDataSourceDelegate](self, "searchHomeDataSourceDelegate"));
  objc_msgSend(v2, "showCitySelector");

}

- (void)_ppt_selectFirstCuratedGuide
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataProviders](self, "dataProviders", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == (id)3)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
          v10 = objc_msgSend(v9, "count");

          if (v10)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objects"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

            v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource delegate](self, "delegate"));
            objc_msgSend(v13, "dataSource:itemTapped:", self, v12);

            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

}

- (void)collectionManager:(id)a3 contentDidChange:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchHomeDataSource dataFetchers](self, "dataFetchers", a3, a4));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = objc_opt_class(_TtC4Maps31SearchHomeUserGuidesDataFetcher);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          objc_msgSend(v10, "fetchContent");
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003EC8C8;
  v13[3] = &unk_1011AC860;
  v13[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  objc_msgSend(v12, "removeObserver:", self);

}

- (void)addToCollectionObserver
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
  objc_msgSend(v4, "addObserver:", self);

}

- (id)objectsForAnalytics
{
  return self->_objectsForAnalytics;
}

- (id)keyCommands
{
  return self->_keyCommands;
}

- (void)setShouldHideHairLine:(BOOL)a3
{
  self->_shouldHideHairLine = a3;
}

- (BOOL)shouldRemoveSearchHomeTip
{
  return self->_shouldRemoveSearchHomeTip;
}

- (SearchHomeDataSourceDelegate)searchHomeDataSourceDelegate
{
  return (SearchHomeDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_searchHomeDataSourceDelegate);
}

- (void)setSearchHomeDataSourceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchHomeDataSourceDelegate, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDiffableDataSource
{
  return self->_collectionViewDiffableDataSource;
}

- (void)setCollectionViewDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, a3);
}

- (UITableViewDiffableDataSource)tableViewDiffableDataSource
{
  return self->_tableViewDiffableDataSource;
}

- (void)setTableViewDiffableDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, a3);
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (NSArray)dataProviders
{
  return self->_dataProviders;
}

- (void)setDataProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSArray)dataFetchers
{
  return self->_dataFetchers;
}

- (void)setDataFetchers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)layoutProviders
{
  return self->_layoutProviders;
}

- (void)setLayoutProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (AutocompleteContext)autocompleteContext
{
  return self->_autocompleteContext;
}

- (void)setAutocompleteContext:(id)a3
{
  objc_storeStrong((id *)&self->_autocompleteContext, a3);
}

- (SearchHomeAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (BOOL)needsToApplySnapshot
{
  return self->_needsToApplySnapshot;
}

- (void)setNeedsToApplySnapshot:(BOOL)a3
{
  self->_needsToApplySnapshot = a3;
}

- (BOOL)needsToResetKeyCommands
{
  return self->_needsToResetKeyCommands;
}

- (void)setNeedsToResetKeyCommands:(BOOL)a3
{
  self->_needsToResetKeyCommands = a3;
}

- (NSArray)cachedSnapshotObjects
{
  return self->_cachedSnapshotObjects;
}

- (void)setCachedSnapshotObjects:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSnapshotObjects, a3);
}

- (NSIndexPath)lastSelectedIndexPath
{
  return self->_lastSelectedIndexPath;
}

- (void)setLastSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, a3);
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_supportsFullTextSearch = a3;
}

- (BOOL)routePlanning
{
  return self->_routePlanning;
}

- (void)setRoutePlanning:(BOOL)a3
{
  self->_routePlanning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_cachedSnapshotObjects, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_autocompleteContext, 0);
  objc_storeStrong((id *)&self->_layoutProviders, 0);
  objc_storeStrong((id *)&self->_dataFetchers, 0);
  objc_storeStrong((id *)&self->_dataProviders, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_tableViewDiffableDataSource, 0);
  objc_storeStrong((id *)&self->_collectionViewDiffableDataSource, 0);
  objc_destroyWeak((id *)&self->_searchHomeDataSourceDelegate);
  objc_storeStrong((id *)&self->_keyCommands, 0);
  objc_storeStrong((id *)&self->_objectsForAnalytics, 0);
}

@end
