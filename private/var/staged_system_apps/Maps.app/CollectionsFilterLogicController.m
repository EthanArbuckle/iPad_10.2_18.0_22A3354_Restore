@implementation CollectionsFilterLogicController

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  CollectionsFilterLogicController *v11;
  CollectionsFilterLogicController *v12;
  uint64_t v13;
  NSArray *filters;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CollectionsFilterLogicController;
  v11 = -[CollectionsFilterLogicController init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_publisherResultFilters, a4);
    if (v10)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildPublishersFiltersWithSelectedIndexPath:](v12, "buildPublishersFiltersWithSelectedIndexPath:", v10));
      filters = v12->_filters;
      v12->_filters = (NSArray *)v13;
    }
    else
    {
      filters = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
      v15 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildPublishersFiltersWithSelectedIndexPath:](v12, "buildPublishersFiltersWithSelectedIndexPath:", filters));
      v16 = v12->_filters;
      v12->_filters = (NSArray *)v15;

    }
    v17 = objc_opt_class(CollectionsFilterCell);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCell reuseIdentifier](CollectionsFilterCell, "reuseIdentifier"));
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  }
  return v12;
}

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withAllCollectionsResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  CollectionsFilterLogicController *v11;
  CollectionsFilterLogicController *v12;
  uint64_t v13;
  NSArray *filters;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CollectionsFilterLogicController;
  v11 = -[CollectionsFilterLogicController init](&v20, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_allCollectionsResultFilters, a4);
    if (v10)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildAllCollectionsFiltersWithSelectedIndexPath:](v12, "buildAllCollectionsFiltersWithSelectedIndexPath:", v10));
      filters = v12->_filters;
      v12->_filters = (NSArray *)v13;
    }
    else
    {
      filters = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
      v15 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildAllCollectionsFiltersWithSelectedIndexPath:](v12, "buildAllCollectionsFiltersWithSelectedIndexPath:", filters));
      v16 = v12->_filters;
      v12->_filters = (NSArray *)v15;

    }
    v17 = objc_opt_class(CollectionsFilterCell);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCell reuseIdentifier](CollectionsFilterCell, "reuseIdentifier"));
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v17, v18);

  }
  return v12;
}

- (CollectionsFilterLogicController)initWithCollectionView:(id)a3 withGuidesHomeResultFilters:(id)a4 withSelectedFilterIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  CollectionsFilterLogicController *v11;
  CollectionsFilterLogicController *v12;
  uint64_t v13;
  NSArray *filters;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CollectionsFilterLogicController;
  v11 = -[CollectionsFilterLogicController init](&v18, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_collectionView, v8);
    objc_storeStrong((id *)&v12->_guidesHomeFilters, a4);
    v13 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildGuidesHomeViewFiltersWithSelectedIndexPath:](v12, "buildGuidesHomeViewFiltersWithSelectedIndexPath:", v10));
    filters = v12->_filters;
    v12->_filters = (NSArray *)v13;

    v15 = objc_opt_class(CollectionsFilterCell);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionsFilterCell reuseIdentifier](CollectionsFilterCell, "reuseIdentifier"));
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", v15, v16);

  }
  return v12;
}

- (id)initForAllCollectionsViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4
{
  id v7;
  id v8;
  CollectionsFilterLogicController *v9;
  CollectionsFilterLogicController *v10;
  uint64_t v11;
  NSArray *filters;
  uint64_t v13;
  NSArray *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CollectionsFilterLogicController;
  v9 = -[CollectionsFilterLogicController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_allCollectionsResultFilters, a3);
    if (v8)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildAllCollectionsFiltersWithSelectedIndexPath:](v10, "buildAllCollectionsFiltersWithSelectedIndexPath:", v8));
      filters = v10->_filters;
      v10->_filters = (NSArray *)v11;
    }
    else
    {
      filters = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
      v13 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildAllCollectionsFiltersWithSelectedIndexPath:](v10, "buildAllCollectionsFiltersWithSelectedIndexPath:", filters));
      v14 = v10->_filters;
      v10->_filters = (NSArray *)v13;

    }
  }

  return v10;
}

- (id)initForPublisherViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4
{
  id v7;
  id v8;
  CollectionsFilterLogicController *v9;
  CollectionsFilterLogicController *v10;
  uint64_t v11;
  NSArray *filters;
  uint64_t v13;
  NSArray *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CollectionsFilterLogicController;
  v9 = -[CollectionsFilterLogicController init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisherResultFilters, a3);
    if (v8)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildPublishersFiltersWithSelectedIndexPath:](v10, "buildPublishersFiltersWithSelectedIndexPath:", v8));
      filters = v10->_filters;
      v10->_filters = (NSArray *)v11;
    }
    else
    {
      filters = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
      v13 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildPublishersFiltersWithSelectedIndexPath:](v10, "buildPublishersFiltersWithSelectedIndexPath:", filters));
      v14 = v10->_filters;
      v10->_filters = (NSArray *)v13;

    }
  }

  return v10;
}

- (id)initForGuidesHomeViewUsingFilters:(id)a3 withSelectedFilterIndexPath:(id)a4 traitEnvironment:(id)a5
{
  id v9;
  id v10;
  id v11;
  CollectionsFilterLogicController *v12;
  CollectionsFilterLogicController *v13;
  uint64_t v14;
  NSArray *filters;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CollectionsFilterLogicController;
  v12 = -[CollectionsFilterLogicController init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_guidesHomeFilters, a3);
    objc_storeStrong((id *)&v13->_traitEnvironment, a5);
    v14 = objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildGuidesHomeViewFiltersWithSelectedIndexPath:](v13, "buildGuidesHomeViewFiltersWithSelectedIndexPath:", v10));
    filters = v13->_filters;
    v13->_filters = (NSArray *)v14;

  }
  return v13;
}

- (void)scrollToSelectedFilter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController selectedIndexPath](self, "selectedIndexPath"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAttributesForItemAtIndexPath:", v4));

  v5 = v9;
  if (v9)
  {
    objc_msgSend(v9, "frame");
    v11.origin.x = CGRectZero.origin.x;
    v11.origin.y = CGRectZero.origin.y;
    v11.size.width = CGRectZero.size.width;
    v11.size.height = CGRectZero.size.height;
    if (CGRectEqualToRect(v10, v11))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
      objc_msgSend(v6, "layoutIfNeeded");

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController selectedFilterIndexPath](self, "selectedFilterIndexPath"));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v8, 16, 0);

    v5 = v9;
  }

}

- (void)getFilters:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  id v7;
  void **v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id location;

  v4 = (void (**)(_QWORD))a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc((Class)UICollectionViewDiffableDataSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100330D84;
  v11 = &unk_1011B2078;
  objc_copyWeak(&v12, &location);
  v7 = objc_msgSend(v5, "initWithCollectionView:cellProvider:", v6, &v8);
  -[CollectionsFilterLogicController setDataSource:](self, "setDataSource:", v7, v8, v9, v10, v11);

  -[CollectionsFilterLogicController prepareSnapshot](self, "prepareSnapshot");
  if (v4)
    v4[2](v4);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)displayFilters
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController dataSource](self, "dataSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController snapshot](self, "snapshot"));
  objc_msgSend(v4, "applySnapshot:animatingDifferences:", v3, 0);

}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfFilters
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filters](self, "filters"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (id)filterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filters](self, "filters"));
  v6 = objc_msgSend(v4, "item");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6));
  return v7;
}

- (id)filterViewModels
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filters](self, "filters"));
  v3 = objc_msgSend(v2, "copy");

  return v3;
}

- (id)routeToSelectedFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildPublishersFiltersWithSelectedIndexPath:](self, "buildPublishersFiltersWithSelectedIndexPath:", v4));
  -[CollectionsFilterLogicController setFilters:](self, "setFilters:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
  if (v6)
  {
    -[CollectionsFilterLogicController prepareSnapshot](self, "prepareSnapshot");
    -[CollectionsFilterLogicController displayFilters](self, "displayFilters");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 1);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filterAtIndexPath:](self, "filterAtIndexPath:", v4));

  return v8;
}

- (id)routeToSelectedAllCollectionsFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildAllCollectionsFiltersWithSelectedIndexPath:](self, "buildAllCollectionsFiltersWithSelectedIndexPath:", v4));
  -[CollectionsFilterLogicController setFilters:](self, "setFilters:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
  if (v6)
  {
    -[CollectionsFilterLogicController prepareSnapshot](self, "prepareSnapshot");
    -[CollectionsFilterLogicController displayFilters](self, "displayFilters");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 1);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filterAtIndexPath:](self, "filterAtIndexPath:", v4));

  return v8;
}

- (id)routeToSelectedGuidesHomeFilterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController buildGuidesHomeViewFiltersWithSelectedIndexPath:](self, "buildGuidesHomeViewFiltersWithSelectedIndexPath:", v4));
  -[CollectionsFilterLogicController setFilters:](self, "setFilters:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
  if (v6)
  {
    -[CollectionsFilterLogicController prepareSnapshot](self, "prepareSnapshot");
    -[CollectionsFilterLogicController displayFilters](self, "displayFilters");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController collectionView](self, "collectionView"));
    objc_msgSend(v7, "scrollToItemAtIndexPath:atScrollPosition:animated:", v4, 16, 1);

  }
  if (v4)
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filterAtIndexPath:](self, "filterAtIndexPath:", v4));
  else
    v8 = 0;

  return v8;
}

- (void)prepareSnapshot
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  -[CollectionsFilterLogicController setSnapshot:](self, "setSnapshot:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController snapshot](self, "snapshot"));
  v8 = CFSTR("FiltersSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController snapshot](self, "snapshot"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController filters](self, "filters"));
  objc_msgSend(v6, "appendItemsWithIdentifiers:", v7);

}

- (id)buildAllCollectionsFiltersWithSelectedIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  BOOL v24;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController allCollectionsResultFilters](self, "allCollectionsResultFilters"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController allCollectionsResultFilters](self, "allCollectionsResultFilters"));
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10033142C;
  v22 = &unk_1011B20A0;
  v24 = v7 == (id)2;
  v12 = v10;
  v23 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v19);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v4, "item", v19, v20, v21, v22)));
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "modelSelected:isDarkMode:", 1, v7 == (id)2);
  -[CollectionsFilterLogicController setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  v15 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithArray:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "array"));
  v17 = objc_msgSend(v16, "copy");

  return v17;
}

- (id)buildPublishersFiltersWithSelectedIndexPath:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  BOOL v25;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController publisherResultFilters](self, "publisherResultFilters"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController publisherResultFilters](self, "publisherResultFilters"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_1003316D8;
  v23 = &unk_1011B20C8;
  v25 = v7 == (id)2;
  v12 = v10;
  v24 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v20);

  v13 = objc_msgSend(v4, "item", v20, v21, v22, v23);
  if ((uint64_t)v13 <= (uint64_t)objc_msgSend(v12, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v4, "item")));
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "modelSelected:isDarkMode:", 1, v7 == (id)2);

  }
  -[CollectionsFilterLogicController setSelectedIndexPath:](self, "setSelectedIndexPath:", v4);
  v16 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithArray:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "array"));
  v18 = objc_msgSend(v17, "copy");

  return v18;
}

- (id)buildGuidesHomeViewFiltersWithSelectedIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  BOOL v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController traitEnvironment](self, "traitEnvironment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceStyle");

  v8 = objc_alloc((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController allCollectionsResultFilters](self, "allCollectionsResultFilters"));
  v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionsFilterLogicController guidesHomeFilters](self, "guidesHomeFilters"));
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_10033198C;
  v23 = &unk_1011B20F0;
  v25 = v7 == (id)2;
  v12 = v10;
  v24 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v20);

  if (v4)
  {
    v13 = objc_msgSend(v4, "item", v20, v21, v22, v23);
    if ((uint64_t)v13 <= (uint64_t)objc_msgSend(v12, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v4, "item")));
      v15 = v14;
      if (v14)
        objc_msgSend(v14, "modelSelected:isDarkMode:", 1, v7 == (id)2);

    }
  }
  -[CollectionsFilterLogicController setSelectedIndexPath:](self, "setSelectedIndexPath:", v4, v20, v21, v22, v23);
  v16 = objc_msgSend(objc_alloc((Class)NSOrderedSet), "initWithArray:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "array"));
  v18 = objc_msgSend(v17, "copy");

  return v18;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_traitEnvironment, a3);
}

- (NSArray)publisherResultFilters
{
  return self->_publisherResultFilters;
}

- (void)setPublisherResultFilters:(id)a3
{
  objc_storeStrong((id *)&self->_publisherResultFilters, a3);
}

- (NSArray)allCollectionsResultFilters
{
  return self->_allCollectionsResultFilters;
}

- (void)setAllCollectionsResultFilters:(id)a3
{
  objc_storeStrong((id *)&self->_allCollectionsResultFilters, a3);
}

- (NSArray)guidesHomeFilters
{
  return self->_guidesHomeFilters;
}

- (void)setGuidesHomeFilters:(id)a3
{
  objc_storeStrong((id *)&self->_guidesHomeFilters, a3);
}

- (NSArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
  objc_storeStrong((id *)&self->_filters, a3);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_filters, 0);
  objc_storeStrong((id *)&self->_guidesHomeFilters, 0);
  objc_storeStrong((id *)&self->_allCollectionsResultFilters, 0);
  objc_storeStrong((id *)&self->_publisherResultFilters, 0);
  objc_storeStrong((id *)&self->_traitEnvironment, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end
