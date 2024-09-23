@implementation PublisherViewDataSource

- (PublisherViewDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 withAPIController:(id)a7 withCollectionRoutingDelegate:(id)a8 usingAnalyticsManager:(id)a9 usingPublisherActionsManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  PublisherViewDataSource *v21;
  PublisherViewDataSource *v22;
  uint64_t v23;
  NSIndexPath *selectedFilterIndexPath;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSString *v36;
  __objc2_class *v37;
  void *v38;
  id v39;
  _QWORD *v40;
  void *v41;
  UICollectionViewDiffableDataSource *v42;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id obj;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v18 = a5;
  v56 = a6;
  v19 = a7;
  v20 = a8;
  v55 = a9;
  v54 = a10;
  v57.receiver = self;
  v57.super_class = (Class)PublisherViewDataSource;
  v21 = -[DataSource initWithCollectionView:updateLocation:](&v57, "initWithCollectionView:updateLocation:", v16, 0);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_placeCollections, obj);
    objc_storeStrong((id *)&v22->_resultFilters, a6);
    objc_storeStrong((id *)&v22->_apiController, a7);
    objc_storeWeak((id *)&v22->_routingDelegate, v20);
    objc_storeStrong((id *)&v22->_analyticsManager, a9);
    objc_storeStrong((id *)&v22->_actionsManager, a10);
    v23 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    selectedFilterIndexPath = v22->_selectedFilterIndexPath;
    v22->_selectedFilterIndexPath = (NSIndexPath *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v25, "addObserver:", v22);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v22, "collectionView"));
    objc_msgSend(v26, "setDelegate:", v22);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v22, "collectionView"));
    v28 = objc_opt_class(MKPlaceCollectionCell);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
    objc_msgSend(v27, "registerClass:forCellWithReuseIdentifier:", v28, v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v22, "collectionView"));
    v31 = objc_opt_class(MKCollectionBatchCell);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    objc_msgSend(v30, "registerClass:forCellWithReuseIdentifier:", v31, v32);

    v33 = sub_1002A8AA0(v16);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v22, "collectionView"));
    if (v33 == 5)
    {
      v35 = objc_opt_class(CollectionsFilterMenu);
      v36 = UICollectionElementKindSectionHeader;
      v37 = CollectionsFilterMenu;
    }
    else
    {
      v35 = objc_opt_class(PublisherActionView);
      v36 = UICollectionElementKindSectionHeader;
      v37 = PublisherActionView;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class reuseIdentifier](v37, "reuseIdentifier"));
    objc_msgSend(v34, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v35, v36, v38);

    v39 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v40 = sub_10046DA38(v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = (UICollectionViewDiffableDataSource *)objc_msgSend(v39, "initWithCollectionView:cellProvider:", v16, v41);
    dataSource = v22->_dataSource;
    v22->_dataSource = v42;

    v44 = v22->_dataSource;
    v45 = sub_10046DBB0(v22);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v44, "setSupplementaryViewProvider:", v46);

    v47 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v22, "collectionView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v50 = objc_msgSend(v47, "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", v48, v17, v18, v19, 0, v49, 2, objc_msgSend(v19, "batchSize"));
    -[PublisherViewDataSource setLogicController:](v22, "setLogicController:", v50);

    v51 = objc_msgSend(objc_alloc((Class)MKPlaceCollectionsSizeController), "initWithCollectionsConfiguration:isSingleCollection:usingTraitCollections:inContext:", 2, 2, objc_msgSend(v17, "count") == (id)1, v16, 2);
    -[PublisherViewDataSource setSizeController:](v22, "setSizeController:", v51);

  }
  return v22;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PublisherViewDataSource;
  -[PublisherViewDataSource dealloc](&v4, "dealloc");
}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)displayCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource dataSource](self, "dataSource"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100C3D518;
  v8[3] = &unk_1011B0520;
  objc_copyWeak(&v10, &location);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "getCollectionsUsingDataSource:onCompletion:", v6, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)clearPublisherData
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  objc_msgSend(v2, "clearSnapshotData");

}

- (void)didTapTryAgainOnErrorView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource resultFilters](self, "resultFilters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "item")));

  v5 = objc_msgSend(v8, "filterType");
  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keywordFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    -[PublisherViewDataSource didRouteToKeywordFilter:atIndexPath:](self, "didRouteToKeywordFilter:atIndexPath:", v6, v7);
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addressFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    -[PublisherViewDataSource didRouteToAddressFilter:atIndexPath:](self, "didRouteToAddressFilter:atIndexPath:", v6, v7);
LABEL_5:

  }
}

- (void)filterDataFetchStarted
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C3D73C;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v10 = objc_msgSend(v9, "sectionKindAtIndex:", objc_msgSend(v7, "section"));

  if (v10 == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v7));

    objc_msgSend(v12, "startedLoadingBatch");
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v7));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionAtIndex:", objc_msgSend(v7, "item")));
    objc_msgSend(v12, "configureWithModel:", v15);

  }
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  NSString *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  FilterAnalyticsProvider *v24;
  FilterAnalyticsProvider *filterAnalyticsProvider;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v8 = a3;
  v9 = (NSString *)a4;
  v10 = a5;
  if (UICollectionElementKindSectionHeader == v9
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController")),
        v12 = objc_msgSend(v11, "sectionKindAtIndex:", objc_msgSend(v10, "section")),
        v11,
        !v12))
  {
    v15 = sub_1002A8AA0(v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    if (v15 == 5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterMenu reuseIdentifier](CollectionsFilterMenu, "reuseIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v17, v10));
      -[PublisherViewDataSource setFilterMenu:](self, "setFilterMenu:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource filterMenu](self, "filterMenu"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource resultFilters](self, "resultFilters"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "publisherViewIdentifiers"));
      objc_msgSend(v19, "configureForPublisherWithRoutingDelegate:withPublishersResultFilters:withSelectedFilterIndex:selectedFilterResultsCount:", self, v20, v21, objc_msgSend(v23, "count"));

      v24 = (FilterAnalyticsProvider *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource filterMenu](self, "filterMenu"));
      filterAnalyticsProvider = self->_filterAnalyticsProvider;
      self->_filterAnalyticsProvider = v24;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource filterMenu](self, "filterMenu"));
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[PublisherActionView reuseIdentifier](PublisherActionView, "reuseIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v9, v26, v10));

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource actionsManager](self, "actionsManager"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "publisherViewResultFilters"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
      objc_msgSend(v13, "configureWithActionManager:publishersResultFilters:routingDelegate:selectedFilterIndex:", v27, v29, self, v30);

      objc_storeStrong((id *)&self->_filterAnalyticsProvider, v13);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  objc_msgSend(v8, "cancelFetchingPublisher");

  -[PublisherViewDataSource setSelectedFilterIndexPath:](self, "setSelectedFilterIndexPath:", v7);
  -[PublisherViewDataSource filterDataFetchStarted](self, "filterDataFetchStarted");
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100C3DCD4;
  v15 = &unk_1011AD260;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "fetchPublisherViewForKeywordFilter:addressFilter:onCompletion:", v6, 0, &v12);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource analyticsManager](self, "analyticsManager", v12, v13, v14, v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FilterAnalyticsProvider titleForFilterAtIndexPath:](self->_filterAnalyticsProvider, "titleForFilterAtIndexPath:", v7));
  objc_msgSend(v10, "publisherFilterTappedWithValue:atIndex:", v11, objc_msgSend(v7, "item"));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  objc_msgSend(v8, "cancelFetchingPublisher");

  -[PublisherViewDataSource setSelectedFilterIndexPath:](self, "setSelectedFilterIndexPath:", v7);
  -[PublisherViewDataSource filterDataFetchStarted](self, "filterDataFetchStarted");
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  v12 = _NSConcreteStackBlock;
  v13 = 3221225472;
  v14 = sub_100C3DF88;
  v15 = &unk_1011AD260;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v9, "fetchPublisherViewForKeywordFilter:addressFilter:onCompletion:", 0, v6, &v12);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource analyticsManager](self, "analyticsManager", v12, v13, v14, v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FilterAnalyticsProvider titleForFilterAtIndexPath:](self->_filterAnalyticsProvider, "titleForFilterAtIndexPath:", v7));
  objc_msgSend(v10, "publisherFilterTappedWithValue:atIndex:", v11, objc_msgSend(v7, "item"));

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForHeaderInSection:(int64_t)a5
{
  id v7;
  void *v8;
  id v9;
  CGFloat width;
  CGFloat height;
  void *v12;
  id v13;
  double v14;
  double v15;
  PublisherActionView *v16;
  PublisherActionView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v9 = objc_msgSend(v8, "sectionKindAtIndex:", a5);

  if (v9 == (id)1)
    goto LABEL_2;
  if (sub_1002A8AA0(v7) != 5)
  {
    v16 = [PublisherActionView alloc];
    objc_msgSend(v7, "frame");
    v17 = -[PublisherActionView initWithFrame:](v16, "initWithFrame:", 0.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource actionsManager](self, "actionsManager"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "publisherViewResultFilters"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    -[PublisherActionView configureWithActionManager:publishersResultFilters:routingDelegate:selectedFilterIndex:](v17, "configureWithActionManager:publishersResultFilters:routingDelegate:selectedFilterIndex:", v18, v20, self, v21);

    -[PublisherActionView frame](v17, "frame");
    v23 = v22;
    v25 = v24;
    LODWORD(v22) = 1144750080;
    LODWORD(v24) = 1132068864;
    -[PublisherActionView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](v17, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v23, v25, v22, v24);
    width = v26;
    height = v27;

    goto LABEL_7;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource resultFilters](self, "resultFilters"));
  v13 = objc_msgSend(v12, "count");

  if (v13 == (id)1)
  {
LABEL_2:
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    objc_msgSend(v7, "frame");
    width = v14;
    +[CollectionsFilterMenu defaultHeightForDisplayStyle:inContext:](CollectionsFilterMenu, "defaultHeightForDisplayStyle:inContext:", 1, 0);
    height = v15;
  }
LABEL_7:

  v28 = width;
  v29 = height;
  result.height = v29;
  result.width = v28;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v10 = objc_msgSend(v8, "section");

  v11 = objc_msgSend(v9, "sectionKindAtIndex:", v10);
  if (v11 == (id)1)
  {
    objc_msgSend(v7, "frame");
    v13 = v12;
    v14 = 100.0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource sizeController](self, "sizeController"));
    objc_msgSend(v7, "frame");
    objc_msgSend(v15, "sizeForCollectionWithMaxCollectionsWidth:", v16);
    v13 = v17;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource sizeController](self, "sizeController"));
    objc_msgSend(v20, "sectionInsets");
    v14 = v19 - v21;

  }
  v22 = v13;
  v23 = v14;
  result.height = v23;
  result.width = v22;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v7;
  id v8;
  CGFloat top;
  CGFloat left;
  CGFloat bottom;
  CGFloat right;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController", a3, a4));
  v8 = objc_msgSend(v7, "sectionKindAtIndex:", a5);

  if (v8 == (id)1)
  {
    top = UIEdgeInsetsZero.top;
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource sizeController](self, "sizeController"));
    objc_msgSend(v13, "sectionInsets");
    top = v14;
    left = v15;
    bottom = v16;
    right = v17;

  }
  v18 = top;
  v19 = left;
  v20 = bottom;
  v21 = right;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  void *v7;
  id v8;
  void *v10;
  double v11;
  double v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController", a3, a4));
  v8 = objc_msgSend(v7, "sectionKindAtIndex:", a5);

  if (v8 == (id)1)
    return 0.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource sizeController](self, "sizeController"));
  objc_msgSend(v10, "minimumInterItemSpacing");
  v12 = v11;

  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  void *v7;
  id v8;
  void *v10;
  double v11;
  double v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController", a3, a4));
  v8 = objc_msgSend(v7, "sectionKindAtIndex:", a5);

  if (v8 == (id)1)
    return 0.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource sizeController](self, "sizeController"));
  objc_msgSend(v10, "minimumInterItemSpacing");
  v12 = v11;

  return v12;
}

- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource apiController](self, "apiController"));
  objc_msgSend(v10, "updateCollections:usingBatchedIdentifiers:usingCollectionFetcher:usingBatchSize:", v7, v6, v8, objc_msgSend(v9, "batchSize"));

}

- (void)dismissedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  objc_msgSend(v2, "dismissedCollections");

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v6 = objc_msgSend(v5, "sectionKindAtIndex:", objc_msgSend(v15, "section"));

  if (v6 != (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource routingDelegate](self, "routingDelegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geoCollectionAtIndex:", objc_msgSend(v15, "item")));
    objc_msgSend(v7, "routeToCuratedCollection:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource analyticsManager](self, "analyticsManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierForCollectionAtIndex:", objc_msgSend(v15, "item")));
    v13 = objc_msgSend(v15, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
    objc_msgSend(v10, "publisherCollectionTapped:atIndex:isCurrentlySaved:", v12, v13, objc_msgSend(v14, "isCollectionSavedAtIndex:", objc_msgSend(v15, "item")));

  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
  v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v9, "section"));

  if (v7 != (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController"));
    objc_msgSend(v8, "willDisplayCellAtIndexpath:", v9);

  }
}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PublisherViewDataSource logicController](self, "logicController", a3));
  objc_msgSend(v3, "refreshCollections");

}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (NSArray)placeCollectionViewModels
{
  return self->_placeCollectionViewModels;
}

- (void)setPlaceCollectionViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollectionViewModels, a3);
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
{
  objc_storeStrong((id *)&self->_resultFilters, a3);
}

- (NSIndexPath)selectedFilterIndexPath
{
  return self->_selectedFilterIndexPath;
}

- (void)setSelectedFilterIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedFilterIndexPath, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (CollectionsFilterMenu)filterMenu
{
  return self->_filterMenu;
}

- (void)setFilterMenu:(id)a3
{
  objc_storeStrong((id *)&self->_filterMenu, a3);
}

- (PublisherAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (MKPlaceCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (MKPlaceCollectionsSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
  objc_storeStrong((id *)&self->_sizeController, a3);
}

- (MKCollectionCarouselRoutingDelegate)routingDelegate
{
  return (MKCollectionCarouselRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (PublisherAnalytics)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (PublisherHeaderViewActionManager)actionsManager
{
  return self->_actionsManager;
}

- (void)setActionsManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionsManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sizeController, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_filterMenu, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedFilterIndexPath, 0);
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_placeCollectionViewModels, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_filterAnalyticsProvider, 0);
}

@end
