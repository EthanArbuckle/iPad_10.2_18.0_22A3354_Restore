@implementation CitySelectorDataSource

- (CitySelectorDataSource)initWithCollectionView:(id)a3 result:(id)a4 sections:(id)a5 routingDelegate:(id)a6 usingCollectionFetcher:(id)a7 usingBatchSize:(unint64_t)a8 selectedGuideLocation:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CitySelectorDataSource *v20;
  CitySelectorDataSource *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v34;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v36.receiver = self;
  v36.super_class = (Class)CitySelectorDataSource;
  v20 = -[DataSource initWithCollectionView:updateLocation:](&v36, "initWithCollectionView:updateLocation:", v14, 0);
  v21 = v20;
  if (v20)
  {
    v34 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v20, "collectionView"));
    objc_msgSend(v22, "setDelegate:", v21);

    objc_storeStrong((id *)&v21->_result, a4);
    objc_storeStrong((id *)&v21->_sections, a5);
    objc_storeWeak((id *)&v21->_routingDelegate, v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    v24 = objc_opt_class(MKPlaceCompactCollectionCell);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MKPlaceCompactCollectionCell reuseIdentifier](MKPlaceCompactCollectionCell, "reuseIdentifier"));
    objc_msgSend(v23, "registerClass:forCellWithReuseIdentifier:", v24, v25);

    v26 = objc_opt_class(MKCollectionBatchCell);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKCollectionBatchCell reuseIdentifier](MKCollectionBatchCell, "reuseIdentifier"));
    objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", v26, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](v21, "collectionView"));
    v29 = objc_opt_class(GuidesGenericSectionHeader);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[GuidesGenericSectionHeader reuseIdentifier](GuidesGenericSectionHeader, "reuseIdentifier"));
    objc_msgSend(v28, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:", v29, v30, v31);

    v16 = v34;
    v32 = objc_msgSend(objc_alloc((Class)MKPlaceCompactCollectionsLogicController), "initWithGuideLocationsResult:context:usingCollectionFetcher:usingGuideConsumer:usingBatchSize:selectedGuideLocation:", v15, 0, v18, v21, a8, v19);
    -[CitySelectorDataSource setLogicController:](v21, "setLogicController:", v32);

    -[CitySelectorDataSource initializeDataSource](v21, "initializeDataSource");
    -[CitySelectorDataSource prepareSnapshot](v21, "prepareSnapshot");
  }

  return v21;
}

- (void)displayCitySelectorData
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource snapshot](self, "snapshot"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource dataSource](self, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource snapshot](self, "snapshot"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100741E84;
    v6[3] = &unk_1011AC860;
    v6[4] = self;
    objc_msgSend(v4, "applySnapshot:animatingDifferences:completion:", v5, 0, v6);

  }
}

- (void)initializeDataSource
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource collectionView](self, "collectionView"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10074203C;
  v9[3] = &unk_1011B59B8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  v5 = objc_msgSend(v3, "initWithCollectionView:cellProvider:", v4, v9);
  -[CitySelectorDataSource setDataSource:](self, "setDataSource:", v5);

  objc_copyWeak(&v8, &location);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource dataSource](self, "dataSource", _NSConcreteStackBlock, 3221225472, sub_1007421D4, &unk_1011B78E8));
  objc_msgSend(v6, "setSupplementaryViewProvider:", &v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)prepareSnapshot
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource sections](self, "sections"));
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource sections](self, "sections"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100742474;
  v7[3] = &unk_1011C5290;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  -[CitySelectorDataSource setSnapshot:](self, "setSnapshot:", v6);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource logicController](self, "logicController"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compactCollectionsInSection:", objc_msgSend(v5, "section")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v5, "item")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guideLocation"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource routingDelegate](self, "routingDelegate"));
  objc_msgSend(v9, "routeToGuideLocation:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guideLocationIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v10, "muid")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 14));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "guideLocationIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "resultProviderID")));
  v15 = objc_msgSend(v5, "section");

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15));
  +[GEOAPPortal captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:](GEOAPPortal, "captureCuratedCollectionUserAction:target:value:publisherId:following:collectionId:collectionCategory:collectionCurrentlySaved:verticalIndex:horizontalIndex:placeCardType:possibleActions:impossibleActions:providerId:repeatableSectionIndex:modules:", 177, 27, v11, 0, 0, 0, 0, 0, 0, 0, v12, 0, 0, v14, v16, 0);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  id v11;

  v11 = a5;
  v7 = a4;
  v8 = objc_opt_class(MKCollectionBatchCell);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource logicController](self, "logicController"));
    objc_msgSend(v10, "willDisplayCellAtIndexpath:", v11);

  }
}

- (void)dismissedCitySelector
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CitySelectorDataSource logicController](self, "logicController"));
  objc_msgSend(v2, "dismissedCompactCollections");

}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  _QWORD v5[4];
  id v6;
  id location;

  -[CitySelectorDataSource prepareSnapshot](self, "prepareSnapshot", a3, a4);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100742898;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (MKPlaceCompactCollectionsLogicController)logicController
{
  return self->_logicController;
}

- (void)setLogicController:(id)a3
{
  objc_storeStrong((id *)&self->_logicController, a3);
}

- (GEOAllGuidesLocationsViewResult)result
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

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (GuidesLocationRoutingDelegate)routingDelegate
{
  return (GuidesLocationRoutingDelegate *)objc_loadWeakRetained((id *)&self->_routingDelegate);
}

- (void)setRoutingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_routingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_routingDelegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_logicController, 0);
}

@end
