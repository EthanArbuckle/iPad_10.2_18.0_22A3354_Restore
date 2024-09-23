@implementation GuidesHomeDataSource

- (GuidesHomeDataSource)initWithCollectionView:(id)a3 result:(id)a4 routingDelegate:(id)a5 apiController:(id)a6 analyticsManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  GuidesHomeDataSource *v17;
  GuidesHomeDataSource *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  GuidesHomeLogicController *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  GuidesHomeLogicController *v50;
  void *v51;
  objc_super v53;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v53.receiver = self;
  v53.super_class = (Class)GuidesHomeDataSource;
  v17 = -[DataSource initWithCollectionView:updateLocation:](&v53, "initWithCollectionView:updateLocation:", v12, 0);
  v18 = v17;
  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v17, "collectionView"));
    objc_msgSend(v19, "setDelegate:", v18);

    objc_storeStrong((id *)&v18->_result, a4);
    objc_storeWeak((id *)&v18->_routingDelegate, v14);
    objc_storeStrong((id *)&v18->_apiController, a6);
    objc_storeWeak((id *)&v18->_analyticsManager, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v21 = objc_opt_class(GuidesHomeHeaderCell);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesHomeHeaderCell reuseIdentifier](GuidesHomeHeaderCell, "reuseIdentifier"));
    objc_msgSend(v20, "registerClass:forCellWithReuseIdentifier:", v21, v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v24 = objc_opt_class(MKPlaceCompactCollectionCell);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCompactCollectionCell reuseIdentifier](MKPlaceCompactCollectionCell, "reuseIdentifier"));
    objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v27 = objc_opt_class(MKPlaceCollectionCell);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCollectionCell reuseIdentifier](MKPlaceCollectionCell, "reuseIdentifier"));
    objc_msgSend(v26, "registerClass:forCellWithReuseIdentifier:", v27, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v30 = objc_opt_class(PlaceCollectionListCell);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[PlaceCollectionListCell reuseIdentifier](PlaceCollectionListCell, "reuseIdentifier"));
    objc_msgSend(v29, "registerClass:forCellWithReuseIdentifier:", v30, v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v33 = objc_opt_class(CollectionsFilterCell);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCell reuseIdentifier](CollectionsFilterCell, "reuseIdentifier"));
    objc_msgSend(v32, "registerClass:forCellWithReuseIdentifier:", v33, v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v36 = objc_opt_class(MKCollectionBatchCell);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    objc_msgSend(v35, "registerClass:forCellWithReuseIdentifier:", v36, v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v39 = objc_opt_class(TwoLineCollectionViewListCell);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLineCollectionViewListCell identifier](TwoLineCollectionViewListCell, "identifier"));
    objc_msgSend(v38, "registerClass:forCellWithReuseIdentifier:", v39, v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v18, "collectionView"));
    v42 = objc_opt_class(GuidesGenericSectionHeader);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
    objc_msgSend(v41, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v42, v43, v44);

    v45 = [GuidesHomeLogicController alloc];
    objc_msgSend(v12, "frame");
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](v18, "apiController"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "guideLocation"));
    v50 = -[GuidesHomeLogicController initWithGuidesHomeResult:maxWidth:traitEnvironment:guideFetcher:guideConsumer:guideLocation:](v45, "initWithGuidesHomeResult:maxWidth:traitEnvironment:guideFetcher:guideConsumer:guideLocation:", v13, v12, v48, v18, v49, v47);
    -[GuidesHomeDataSource setLogicController:](v18, "setLogicController:", v50);

    -[GuidesHomeDataSource initializeDataSource](v18, "initializeDataSource");
    -[GuidesHomeDataSource prepareSnapshot](v18, "prepareSnapshot");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    objc_msgSend(v51, "addObserver:", v18);

  }
  return v18;
}

- (void)dealloc
{
  objc_super v3;

  -[GuidesHomeDataSource cleanupGuidesHomeData](self, "cleanupGuidesHomeData");
  v3.receiver = self;
  v3.super_class = (Class)GuidesHomeDataSource;
  -[GuidesHomeDataSource dealloc](&v3, "dealloc");
}

- (void)displayGuidesHomeByReloadingData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource snapshot](self, "snapshot"));

  if (v3)
  {
    self->_currentState = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource snapshot](self, "snapshot"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10041A008;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    objc_msgSend(v4, "applySnapshotUsingReloadData:completion:", v5, v6);

  }
}

- (void)displayGuidesHomeData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource snapshot](self, "snapshot"));

  if (v3)
  {
    self->_currentState = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource snapshot](self, "snapshot"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10041A128;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    objc_msgSend(v4, "applySnapshot:animatingDifferences:completion:", v5, 0, v6);

  }
}

- (void)didChangeContentYOffset:(double)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource headerCell](self, "headerCell"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource headerCell](self, "headerCell"));
    objc_msgSend(v6, "didChangeContentYOffset:", a3);

  }
}

- (void)initializeDataSource
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id location;

  self->_currentState = 0;
  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10041A2C4;
  v6[3] = &unk_1011B59B8;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  v5 = objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v6);
  -[GuidesHomeDataSource setDataSource:](self, "setDataSource:", v5);

  -[GuidesHomeDataSource initializeSupplementaryViewProvider](self, "initializeSupplementaryViewProvider");
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)initializeSupplementaryViewProvider
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id location;
  NSAttributedStringKey v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_mapkit_fontWithWeight:", UIFontWeightSemibold));

  v12 = NSFontAttributeName;
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
  objc_initWeak(&location, self);
  objc_copyWeak(&v10, &location);
  v6 = v5;
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource dataSource](self, "dataSource", _NSConcreteStackBlock, 3221225472, sub_10041A7CC, &unk_1011B59E0));
  objc_msgSend(v7, "setSupplementaryViewProvider:", &v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)prepareSnapshot
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  GuidesHomeDataSource *v9;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSections"));

  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041ABBC;
  v7[3] = &unk_1011B5A08;
  v8 = v3;
  v9 = self;
  v5 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  -[GuidesHomeDataSource setSnapshot:](self, "setSnapshot:", v5);

}

- (BOOL)isFetchingData
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
  v3 = objc_msgSend(v2, "currentState") == (id)1;

  return v3;
}

- (void)filterDataFetchStarted
{
  -[GuidesHomeDataSource updateContentInset](self, "updateContentInset");
  -[GuidesHomeDataSource prepareSnapshot](self, "prepareSnapshot");
  -[GuidesHomeDataSource displayGuidesHomeByReloadingData](self, "displayGuidesHomeByReloadingData");
}

- (void)filterDataFetchFinished
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedFilterIndexPath"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
    objc_msgSend(v6, "cancelFetchingGuideHome");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guideHomeFilteredCollectionResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideHomeFilteredCollectionResultsIds"));
  objc_msgSend(v7, "updateFilteredCollectionsFromResults:collectionIds:", v9, v11);

  -[GuidesHomeDataSource prepareSnapshot](self, "prepareSnapshot");
  -[GuidesHomeDataSource displayGuidesHomeByReloadingData](self, "displayGuidesHomeByReloadingData");
  -[GuidesHomeDataSource updateContentInset](self, "updateContentInset");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectedFilterIndexPath"));

  if (v13)
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "guideHomeFilteredCollectionResultsIds"));
    objc_msgSend(v16, "guidesHomeDisplayFilteredGuideList:", v15);

  }
}

- (void)updateContentInset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxY;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  if (!-[GuidesHomeDataSource isFetchingData](self, "isFetchingData"))
  {
    -[GuidesHomeDataSource actualContentInsets](self, "actualContentInsets");
    v21 = v30;
    v23 = v31;
    v29 = v32;
    v27 = v33;
    goto LABEL_6;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  objc_msgSend(v3, "contentInset");
  -[GuidesHomeDataSource setActualContentInsets:](self, "setActualContentInsets:");

  if (-[GuidesHomeDataSource filterSectionIndex](self, "filterSectionIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionViewLayout"));
    objc_msgSend(v5, "_layoutFrameForSection:", -[GuidesHomeDataSource filterSectionIndex](self, "filterSectionIndex"));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v35.origin.x = v7;
    v35.origin.y = v9;
    v35.size.width = v11;
    v35.size.height = v13;
    MaxY = CGRectGetMaxY(v35);
    +[GuidesHomeSection loadingSectionHeight](GuidesHomeSection, "loadingSectionHeight");
    v16 = MaxY + v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
    objc_msgSend(v17, "bounds");
    v18 = CGRectGetMaxY(v36);

    if (v16 < v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      objc_msgSend(v19, "contentInset");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      objc_msgSend(v28, "bounds");
      v29 = v25 + CGRectGetMaxY(v37) - v16;

LABEL_6:
      v34 = (id)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
      objc_msgSend(v34, "setContentInset:", v21, v23, v29, v27);

    }
  }
}

- (int64_t)filterSectionIndex
{
  void *v2;
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allSections"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10041B0BC;
  v6[3] = &unk_1011B5A30;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)routeToCuratedCollectionAtIndex:(id)a3 inSection:(id)a4
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemsForSectionAtIndex:", objc_msgSend(v22, "section")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v22, "item")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollection"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v12 = objc_msgSend(v11, "collectionIsSaved:", v10);

  if (objc_msgSend(v6, "contentType") == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    objc_msgSend(v13, "guidesHomeTappedEditorPickedGuide:publisherId:isCurrentlySaved:atIndex:carouselIndex:", v14, v16, v12, objc_msgSend(v22, "item"), objc_msgSend(v22, "section"));
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v6, "contentType") == (id)2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    objc_msgSend(v13, "guidesHomeTappedTemporalGuide:publisherId:isCurrentlySaved:atIndex:carouselIndex:", v14, v16, v12, objc_msgSend(v22, "item"), objc_msgSend(v22, "section"));
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "kind") == (id)4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
    objc_msgSend(v13, "guidesHomeTappedLatestGuide:publisherId:isCurrentlySaved:atIndex:carouselIndex:", v14, v16, v12, objc_msgSend(v22, "item"), objc_msgSend(v22, "section"));
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "kind") == (id)6)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectedFilterIndexPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "filterValueAtIndex:", objc_msgSend(v19, "item")));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "publisher"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    objc_msgSend(v14, "guidesHomeTappedFilteredGuide:publisherId:isCurrentlySaved:atIndex:carouselIndex:filterValue:", v15, v20, v12, objc_msgSend(v22, "item"), objc_msgSend(v22, "section"), v13);

    goto LABEL_9;
  }
LABEL_10:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource routingDelegate](self, "routingDelegate"));
  objc_msgSend(v21, "routeToCuratedCollection:", v10);

}

- (void)cleanupGuidesHomeData
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  objc_msgSend(v3, "removeObserver:", self);

  -[GuidesHomeDataSource setLogicController:](self, "setLogicController:", 0);
  -[GuidesHomeDataSource setResult:](self, "setResult:", 0);
  -[GuidesHomeDataSource setDataSource:](self, "setDataSource:", 0);
  -[GuidesHomeDataSource setSnapshot:](self, "setSnapshot:", 0);
  -[GuidesHomeDataSource setRoutingDelegate:](self, "setRoutingDelegate:", 0);
  -[GuidesHomeDataSource setApiController:](self, "setApiController:", 0);
  -[GuidesHomeDataSource setHeaderCell:](self, "setHeaderCell:", 0);
}

- (id)sectionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sectionAtIndex:", a3));

  return v5;
}

- (id)filterViewModels
{
  void *v3;
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
  v11 = sub_10041B66C;
  v12 = sub_10041B67C;
  v13 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allSections"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10041B684;
  v7[3] = &unk_1011B5A58;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)featuredGuideViewModel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "itemsForSectionAtIndex:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

- (unint64_t)guidesListCountAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemsForSectionAtIndex:", a3));
  v6 = objc_msgSend(v5, "count");

  return (unint64_t)v6;
}

- (unint64_t)publishersListCountAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemsForSectionAtIndex:", a3));
  v6 = objc_msgSend(v5, "count");

  return (unint64_t)v6;
}

- (void)didRouteToConceptFilter:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[GuidesHomeDataSource isFetchingData](self, "isFetchingData"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
    objc_msgSend(v8, "cancelFetchingGuideHome");

  }
  objc_initWeak(&location, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource apiController](self, "apiController"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10041B9D0;
  v16 = &unk_1011AD260;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v9, "fetchGuidesHomeViewFilteredBy:onCompletion:", v6, &v13);

  -[GuidesHomeDataSource filterDataFetchStarted](self, "filterDataFetchStarted", v13, v14, v15, v16);
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filterValueAtIndex:", objc_msgSend(v7, "item")));
    objc_msgSend(v10, "guideHomeTappedFilter:atIndex:carouselIndex:", v12, objc_msgSend(v7, "item"), objc_msgSend(v7, "section"));

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
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
  void *v28;
  uint64_t v29;

  v6 = a4;
  objc_msgSend(a3, "deselectItemAtIndexPath:animated:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sectionAtIndex:", objc_msgSend(v6, "section")));

  if (v8)
  {
    objc_msgSend(v8, "configuration");

    switch(v29)
    {
      case 1:
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedFilterIndexPath"));
        v11 = objc_msgSend(v10, "isEqual:", v6);

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
        v13 = v12;
        if (v11)
        {
          v14 = objc_msgSend(v12, "routeToSelectedGuidesHomeFilterAtIndexPath:", 0);

          -[GuidesHomeDataSource didRouteToConceptFilter:atIndexPath:](self, "didRouteToConceptFilter:atIndexPath:", 0, 0);
        }
        else
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeToSelectedGuidesHomeFilterAtIndexPath:", v6));

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "conceptFilter"));
          -[GuidesHomeDataSource didRouteToConceptFilter:atIndexPath:](self, "didRouteToConceptFilter:atIndexPath:", v27, v6);

        }
        break;
      case 2:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemsForSectionAtIndex:", objc_msgSend(v6, "section")));

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v6, "item")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "guideLocation"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "guideLocationIdentifier"));
        objc_msgSend(v19, "guidesHomeTappedCityGuide:atIndex:carouselIndex:", v20, objc_msgSend(v6, "item"), objc_msgSend(v6, "section"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource routingDelegate](self, "routingDelegate"));
        objc_msgSend(v21, "routeToGuideLocation:", v18);
        goto LABEL_9;
      case 3:
      case 4:
      case 6:
        -[GuidesHomeDataSource routeToCuratedCollectionAtIndex:inSection:](self, "routeToCuratedCollectionAtIndex:inSection:", v6, v8);
        break;
      case 5:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "itemsForSectionAtIndex:", objc_msgSend(v6, "section")));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v6, "item")));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "publisher"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource analyticsManager](self, "analyticsManager"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
        objc_msgSend(v24, "guidesHomeTappedPublisher:atIndex:carouselIndex:", v25, objc_msgSend(v6, "item"), objc_msgSend(v6, "section"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource routingDelegate](self, "routingDelegate"));
        objc_msgSend(v21, "routeToPublisher:", v18);
LABEL_9:

        break;
      default:
        break;
    }
  }

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  objc_msgSend(v7, "willDisplayCellAtIndexpath:", v6);

}

- (void)curatedCollectionSyncManagerDidUpdateSyncedCollections:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  GuidesHomeDataSource *v11;

  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allSections"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10041BE68;
  v9[3] = &unk_1011B5A08;
  v8 = v4;
  v10 = v8;
  v11 = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (objc_msgSend(v8, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource snapshot](self, "snapshot"));
    objc_msgSend(v7, "reconfigureItemsWithIdentifiers:", v8);
    -[GuidesHomeDataSource setSnapshot:](self, "setSnapshot:", v7);
    -[GuidesHomeDataSource displayGuidesHomeData](self, "displayGuidesHomeData");

  }
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  GuidesHomeDataSource *v15;
  id v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "snapshot"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  objc_msgSend(v8, "appendBatchOfCollections:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeDataSource logicController](self, "logicController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allSections"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10041C00C;
  v13[3] = &unk_1011B5A80;
  v14 = v7;
  v15 = self;
  v16 = v5;
  v11 = v5;
  v12 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

- (int64_t)currentState
{
  return self->_currentState;
}

- (GuidesHomeLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (GEOGuidesHomeResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
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

- (GuidesHomeRoutingDelegate)routingDelegate
{
  return (GuidesHomeRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (GuidesHomeAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (GuidesHomeAnalytics)analyticsManager
{
  return (GuidesHomeAnalytics *)objc_loadWeakRetained((id *)&self->_analyticsManager);
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeWeak((id *)&self->_analyticsManager, a3);
}

- (GuidesHomeHeaderCell)headerCell
{
  return self->_headerCell;
}

- (void)setHeaderCell:(id)a3
{
  objc_storeStrong((id *)&self->_headerCell, a3);
}

- (UIEdgeInsets)actualContentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_actualContentInsets.top;
  left = self->_actualContentInsets.left;
  bottom = self->_actualContentInsets.bottom;
  right = self->_actualContentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setActualContentInsets:(UIEdgeInsets)a3
{
  self->_actualContentInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_destroyWeak((id *)&self->_analyticsManager);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
}

@end
