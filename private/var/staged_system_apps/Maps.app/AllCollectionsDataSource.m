@implementation AllCollectionsDataSource

- (AllCollectionsDataSource)initWithCollectionView:(id)a3 usingCuratedCollections:(id)a4 usingPlaceCollectionIds:(id)a5 withResultFilters:(id)a6 sections:(id)a7 usingAPIController:(id)a8 withRoutingDelegate:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  AllCollectionsDataSource *v20;
  AllCollectionsDataSource *v21;
  uint64_t v22;
  NSIndexPath *selectedFilterIndexPath;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  _QWORD *v39;
  void *v40;
  UICollectionViewDiffableDataSource *v41;
  UICollectionViewDiffableDataSource *dataSource;
  UICollectionViewDiffableDataSource *v43;
  _QWORD *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  MKPlaceCollectionsLogicController *v49;
  MKPlaceCollectionsLogicController *collectionsLogicController;
  id v52;
  id v53;
  objc_super v54;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v53 = a6;
  v52 = a7;
  v18 = a8;
  v19 = a9;
  v54.receiver = self;
  v54.super_class = (Class)AllCollectionsDataSource;
  v20 = -[DataSource initWithCollectionView:updateLocation:](&v54, "initWithCollectionView:updateLocation:", v15, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_placeCollections, a4);
    objc_storeStrong((id *)&v21->_resultFilters, a6);
    objc_storeStrong((id *)&v21->_sections, a7);
    objc_storeStrong((id *)&v21->_apiController, a8);
    objc_storeWeak((id *)&v21->_routingDelegate, v19);
    v22 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    selectedFilterIndexPath = v21->_selectedFilterIndexPath;
    v21->_selectedFilterIndexPath = (NSIndexPath *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v24, "addObserver:", v21);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    objc_msgSend(v25, "setDelegate:", v21);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    v27 = objc_opt_class(MKPlaceCollectionCell);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
    objc_msgSend(v26, "registerClass:forCellWithReuseIdentifier:", v27, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    v30 = objc_opt_class(MKCollectionBatchCell);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    objc_msgSend(v29, "registerClass:forCellWithReuseIdentifier:", v30, v31);

    v32 = sub_1002A8AA0(v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    if (v32 == 5)
    {
      v34 = objc_opt_class(CollectionsFilterMenu);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterMenu reuseIdentifier](CollectionsFilterMenu, "reuseIdentifier"));
      objc_msgSend(v33, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v34, UICollectionElementKindSectionHeader, v35);
    }
    else
    {
      v36 = objc_opt_class(CollectionsFilterCarouselView);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCarouselView reuseIdentifier](CollectionsFilterCarouselView, "reuseIdentifier"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCarouselView reuseIdentifier](CollectionsFilterCarouselView, "reuseIdentifier"));
      objc_msgSend(v33, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v36, v35, v37);

    }
    v38 = objc_alloc((Class)UICollectionViewDiffableDataSource);
    v39 = sub_10046DA38(v21);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    v41 = (UICollectionViewDiffableDataSource *)objc_msgSend(v38, "initWithCollectionView:cellProvider:", v15, v40);
    dataSource = v21->_dataSource;
    v21->_dataSource = v41;

    v43 = v21->_dataSource;
    v44 = sub_10046DBB0(v21);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](v43, "setSupplementaryViewProvider:", v45);

    v46 = objc_alloc((Class)MKPlaceCollectionsLogicController);
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v49 = (MKPlaceCollectionsLogicController *)objc_msgSend(v46, "initWithCollectionView:withPlaceCollections:usingCollectionIds:usingCollectionFetcher:usingGuideConsumer:usingSyncCoordinator:inContext:usingBatchSize:", v47, v16, v17, v18, v21, v48, 5, objc_msgSend(v18, "batchSize"));
    collectionsLogicController = v21->_collectionsLogicController;
    v21->_collectionsLogicController = v49;

    -[AllCollectionsDataSource prepareSnapshotUsingCollections:](v21, "prepareSnapshotUsingCollections:", v21->_placeCollections);
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AllCollectionsDataSource;
  -[AllCollectionsDataSource dealloc](&v4, "dealloc");
}

- (void)prepareSnapshotUsingCollections:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  -[AllCollectionsDataSource setSnapshot:](self, "setSnapshot:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
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
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (v13)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "configuration");

          if (v16)
            continue;
        }
        else
        {
          v15 = 0u;
          v16 = 0;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot", (_QWORD)v15));
        objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v4, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (void)updateSnapshotUsingCollections:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  -[AllCollectionsDataSource setSnapshot:](self, "setSnapshot:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  objc_msgSend(v6, "appendSectionsWithIdentifiers:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (!v13)
        {
          v15 = 0u;
          v16 = 0u;
LABEL_12:
          -[AllCollectionsDataSource setPlaceCollections:](self, "setPlaceCollections:", v4, v15, v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
          objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v4, v13);

          goto LABEL_13;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "configuration");

        if (!(_QWORD)v16)
          goto LABEL_12;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

}

- (void)applySnapshot
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
  objc_msgSend(v4, "applySnapshot:animatingDifferences:", v3, 0);

}

- (void)_dispatchOnManThread:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  if (v3)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v3[2](v3);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A1F244;
      block[3] = &unk_1011ADA00;
      v5 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: block", buf, 2u);
  }

}

- (int64_t)presentationStyle
{
  return 1;
}

- (void)displayAllCollectionsData
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  v3 = sub_1004316CC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[<-->]Displaying All Collection data.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A1F344;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, buf);
  -[AllCollectionsDataSource _dispatchOnManThread:](self, "_dispatchOnManThread:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)didTapTryAgainOnErrorView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource resultFilters](self, "resultFilters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "item")));

  v5 = objc_msgSend(v8, "filterType");
  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keywordFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    -[AllCollectionsDataSource didRouteToKeywordFilter:atIndexPath:](self, "didRouteToKeywordFilter:atIndexPath:", v6, v7);
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addressFilter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    -[AllCollectionsDataSource didRouteToAddressFilter:atIndexPath:](self, "didRouteToAddressFilter:atIndexPath:", v6, v7);
LABEL_5:

  }
}

- (id)allCollectionsSectionOfType:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "configuration");
          v10 = v14;

        }
        else
        {
          v10 = 0;
          v13 = 0u;
          v14 = 0;
        }
        if (v10 == a3)
        {
          v11 = v9;
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
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
  v3[2] = sub_100A1F640;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)clearGuidesFromSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource dataSource](self, "dataSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "snapshot"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource allCollectionsSectionOfType:](self, "allCollectionsSectionOfType:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource allCollectionsSectionOfType:](self, "allCollectionsSectionOfType:", 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemIdentifiersInSectionWithIdentifier:", v6));

  if (objc_msgSend(v5, "count") || objc_msgSend(v7, "count"))
  {
    objc_msgSend(v9, "deleteItemsWithIdentifiers:", v5);
    objc_msgSend(v9, "deleteItemsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource dataSource](self, "dataSource"));
    objc_msgSend(v8, "applySnapshot:animatingDifferences:", v9, 0);

  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4 itemIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "section")));

  if (v10 && (objc_msgSend(v10, "configuration"), v19, v20))
  {
    objc_msgSend(v10, "configuration");

    if (v18 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v11, v8));

      objc_msgSend(v12, "startedLoadingBatch");
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v13, v8));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionAtIndex:", objc_msgSend(v8, "item")));
    objc_msgSend(v12, "configureWithModel:", v15);

  }
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v8, "section")));

  if (v10)
  {
    objc_msgSend(v10, "configuration");
    v11 = *((_QWORD *)&v30 + 1);

    if (v11 == 1)
    {
      v12 = sub_1002A8AA0(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      if (v12 == 5)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterMenu reuseIdentifier](CollectionsFilterMenu, "reuseIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", UICollectionElementKindSectionHeader, v14, v8));
        -[AllCollectionsDataSource setFilterMenu:](self, "setFilterMenu:", v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allCollectionViewFilters"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource filterMenu](self, "filterMenu"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allCollectionViewIdentifiers"));
        objc_msgSend(v18, "configureForAllCollectionsWithRoutingDelegate:withAllCollectionsResultFilters:withSelectedFilterIndex:selectedFilterResultsCount:", self, v17, v19, objc_msgSend(v21, "count"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource filterMenu](self, "filterMenu"));
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCarouselView reuseIdentifier](CollectionsFilterCarouselView, "reuseIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCarouselView reuseIdentifier](CollectionsFilterCarouselView, "reuseIdentifier"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:", v23, v24, v8));

        v25 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allCollectionViewFilters"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource selectedFilterIndexPath](self, "selectedFilterIndexPath"));
        objc_msgSend(v22, "configureWithContext:withRoutingDelegate:withAllCollectionsResultFilters:withSelectedFilterIndex:", 1, self, v26, v27);

        objc_msgSend(v22, "displayFilters");
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
    v29 = 0u;
    v30 = 0u;
  }

  return v22;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v13, "section")));

  if (!v15)
  {
    v17 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v15, "configuration");
  if (v19 != 1)
  {
    v17 = v18;
    goto LABEL_8;
  }
  v16 = sub_1002A8AA0(v10);

  if (v11 && v16 != 5)
    objc_msgSend(v11, "scrollToSelectedFilter");
LABEL_9:

}

- (void)updateCollections:(id)a3 usingBatchIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  objc_msgSend(v7, "updateCollectionsWithoutPreparingSnapshot:usingBatchedIdentifiers:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:", v10, v6, v8, self, objc_msgSend(v9, "batchSize"));

  -[AllCollectionsDataSource updateSnapshotUsingCollections:](self, "updateSnapshotUsingCollections:", v10);
}

- (void)dismissedCollections
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
  objc_msgSend(v2, "dismissedCollections");

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource routingDelegate](self, "routingDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
  v7 = objc_msgSend(v5, "item");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoCollectionAtIndex:", v7));
  objc_msgSend(v9, "routeToCuratedCollection:", v8);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
  v7 = objc_msgSend(v6, "sectionKindAtIndex:", objc_msgSend(v9, "section"));

  if (v7 != (id)1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
    objc_msgSend(v8, "willDisplayCellAtIndexpath:", v9);

  }
}

- (void)didRouteToKeywordFilter:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  objc_msgSend(v8, "cancelFetchingAllCollections");

  -[AllCollectionsDataSource setSelectedFilterIndexPath:](self, "setSelectedFilterIndexPath:", v7);
  -[AllCollectionsDataSource filterDataFetchStarted](self, "filterDataFetchStarted");
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A1FFD8;
  v10[3] = &unk_1011AD260;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "fetchAllCollectionsViewForKeywordFilter:addressFilter:onCompletion:", v6, 0, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)didRouteToAddressFilter:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  objc_msgSend(v8, "cancelFetchingAllCollections");

  -[AllCollectionsDataSource setSelectedFilterIndexPath:](self, "setSelectedFilterIndexPath:", v7);
  -[AllCollectionsDataSource filterDataFetchStarted](self, "filterDataFetchStarted");
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A20244;
  v10[3] = &unk_1011AD260;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "fetchAllCollectionsViewForKeywordFilter:addressFilter:onCompletion:", 0, v6, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  _BOOL4 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  _BYTE v45[128];

  v34 = a3;
  v5 = a4;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (!v7)
  {
    v9 = 0;
    v10 = 0;
    goto LABEL_17;
  }
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      if (!v13)
      {
        v37 = 0u;
        v38 = 0;
        v35 = 0u;
        v36 = 0;
LABEL_11:
        v16 = v13;
        v15 = v9;
        v9 = v16;
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i), "configuration");

      if (v38 != 1)
      {
        objc_msgSend(v13, "configuration");

        if (v36)
          continue;
        goto LABEL_11;
      }
      v14 = v13;
      v15 = v10;
      v10 = v14;
LABEL_12:

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  }
  while (v8);
LABEL_17:

  v17 = sub_1004316CC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource informed about batch load complete. Removing loading cell.", buf, 2u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "itemIdentifiersInSectionWithIdentifier:", v10));
  objc_msgSend(v19, "deleteItemsWithIdentifiers:", v21);

  v22 = v5;
  if (v34 && objc_msgSend(v5, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource apiController](self, "apiController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeCollectionsFromLastBatch"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
    objc_msgSend(v25, "appendBatchOfCollections:", v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
    objc_msgSend(v26, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, v9);

    v27 = sub_1004316CC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 134217984;
      v44 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource displaying %ld more collections.", buf, 0xCu);
    }

    -[AllCollectionsDataSource displayAllCollectionsData](self, "displayAllCollectionsData");
  }
  else
  {
    if (!objc_msgSend(v5, "count"))
    {
      v30 = sub_1004316CC();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "[<-->] AllCollectionDateSource received empty placeCollections when we were sure to load a batch.", buf, 2u);
      }

    }
    v32 = sub_1004316CC();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource is removing loading indicator only as batch load failed.", buf, 2u);
    }

    -[AllCollectionsDataSource displayAllCollectionsData](self, "displayAllCollectionsData");
  }

}

- (void)didStartFetchingBatch
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  void *v31;
  _BYTE v32[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (!v4)
  {

    v7 = 0;
    v6 = 0;
    goto LABEL_22;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      if (!v10)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
LABEL_11:
        v13 = v10;
        v12 = v6;
        v6 = v13;
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i), "configuration");

      if ((_QWORD)v26 != 1)
      {
        objc_msgSend(v10, "configuration");

        if ((_QWORD)v24)
          continue;
        goto LABEL_11;
      }
      v11 = v10;
      v12 = v7;
      v7 = v11;
LABEL_12:

    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  }
  while (v5);

  if (v7)
  {
    if (v6)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "itemIdentifiersInSectionWithIdentifier:", v7));
      v16 = objc_msgSend(v15, "count");

      if (!v16)
      {
        v17 = sub_1004316CC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[<-->] AllCollectionDateSource informed about batch load starting. Adding loading cell.", v22, 2u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource snapshot](self, "snapshot"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
        v31 = v20;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
        objc_msgSend(v19, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v21, v7);

        -[AllCollectionsDataSource displayAllCollectionsData](self, "displayAllCollectionsData");
      }
    }
  }
LABEL_22:

}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _BYTE v21[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource sections](self, "sections", a3));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "configuration");

          if (v15)
            continue;
        }
        else
        {
          v14 = 0u;
          v15 = 0;
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource dataSource](self, "dataSource", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshot"));

        v20 = v9;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
        objc_msgSend(v11, "reloadSectionsWithIdentifiers:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource dataSource](self, "dataSource"));
        objc_msgSend(v13, "applySnapshot:animatingDifferences:", v11, 0);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v6);
  }

}

- (void)presentFirstCollection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource placeCollections](self, "placeCollections"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource routingDelegate](self, "routingDelegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsDataSource collectionsLogicController](self, "collectionsLogicController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoCollectionAtIndex:", 0));
    objc_msgSend(v7, "routeToCuratedCollection:", v6);

  }
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
  objc_storeStrong((id *)&self->_placeCollections, a3);
}

- (NSArray)resultFilters
{
  return self->_resultFilters;
}

- (void)setResultFilters:(id)a3
{
  objc_storeStrong((id *)&self->_resultFilters, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (MKCollectionCarouselRoutingDelegate)routingDelegate
{
  return (MKCollectionCarouselRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (AllCollectionsAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
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

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
}

- (CollectionsFilterMenu)filterMenu
{
  return self->_filterMenu;
}

- (void)setFilterMenu:(id)a3
{
  objc_storeStrong((id *)&self->_filterMenu, a3);
}

- (MKPlaceCollectionsLogicController)collectionsLogicController
{
  return self->_collectionsLogicController;
}

- (void)setCollectionsLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_collectionsLogicController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionsLogicController, 0);
  objc_storeStrong((id *)&self->_filterMenu, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedFilterIndexPath, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_resultFilters, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
}

@end
