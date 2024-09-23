@implementation BKLibraryBookshelfLibrarySeriesViewConfiguration

- (BKLibraryBookshelfLibrarySeriesViewConfiguration)initWithSeriesContainer:(id)a3 initialViewMode:(unint64_t)a4
{
  id v6;
  BKLibraryBookshelfLibrarySeriesViewConfiguration *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfLibrarySeriesViewConfiguration;
  v7 = -[BKLibraryBookshelfLibrarySeriesViewConfiguration init](&v15, "init");
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    -[BKLibraryBookshelfLibrarySeriesViewConfiguration setSeriesContainer:](v7, "setSeriesContainer:", v6);
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setInitialViewMode:](v7, "setInitialViewMode:", a4);
    -[BKLibraryBookshelfLibrarySeriesViewConfiguration setInitialSortMode:](v7, "setInitialSortMode:", +[BKCollection sortModeForSeriesCollections](BKCollection, "sortModeForSeriesCollections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedObjectContext"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001B07F8;
    v12[3] = &unk_1008E7338;
    v13 = v6;
    v14 = v8;
    v10 = v8;
    objc_msgSend(v9, "performBlock:", v12);

  }
  return v7;
}

- (id)seriesID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesContainer](self, "seriesContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "assetID"));

  return v3;
}

- (BOOL)stackedSortControl
{
  return 1;
}

- (id)viewTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesContainer](self, "seriesContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)viewDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesContainer](self, "seriesContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayAuthor"));

  return v3;
}

- (id)noBooksDescriptionHeader
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("No Purchased Books"), &stru_10091C438, 0));

  return v3;
}

- (id)noBooksDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("You haven’t purchased any books in this series."), &stru_10091C438, 0));

  return v3;
}

- (id)sortControlConfig
{
  void *v3;
  void *v4;
  void *v5;
  BKLibrarySortByMode *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BKLibrarySortByMode *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  void *v27;
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Filter by…"), &stru_10091C438, 0));

  v6 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v6, "setSortMode:", 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Purchased"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v6, "setTitle:", v8);

  -[BKLibrarySortByMode setLabel:](v6, "setLabel:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesID](self, "seriesID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:", v9, 1, 1, 1));
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v6, "setAllowExplicitPredicate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesID](self, "seriesID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:", v11, 1, 1, 0));
  -[BKLibrarySortByMode setHideExplicitPredicate:](v6, "setHideExplicitPredicate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 1));
  v28 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
  -[BKLibrarySortByMode setSortDescriptors:](v6, "setSortDescriptors:", v14);

  -[BKLibrarySortByMode setSectionKeyPath:](v6, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v6, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v6, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v6, "setAllowsReordering:", 0);
  v15 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v15, "setSortMode:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("All In Series"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v15, "setTitle:", v17);

  -[BKLibrarySortByMode setLabel:](v15, "setLabel:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesID](self, "seriesID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:", v18, 0, 1, 1));
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v15, "setAllowExplicitPredicate:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibrarySeriesViewConfiguration seriesID](self, "seriesID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentPredicateForSeriesID:onlyPurchased:forceCloud:allowsExplicit:", v20, 0, 1, 0));
  -[BKLibrarySortByMode setHideExplicitPredicate:](v15, "setHideExplicitPredicate:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("seriesSortKey"), 1));
  v27 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
  -[BKLibrarySortByMode setSortDescriptors:](v15, "setSortDescriptors:", v23);

  -[BKLibrarySortByMode setSectionKeyPath:](v15, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v15, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v15, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v15, "setAllowsReordering:", 0);
  v26[0] = v15;
  v26[1] = v6;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));

  return v24;
}

- (unint64_t)initialSortMode
{
  return self->_initialSortMode;
}

- (void)setInitialSortMode:(unint64_t)a3
{
  self->_initialSortMode = a3;
}

- (BKLibraryAsset)seriesContainer
{
  return self->_seriesContainer;
}

- (void)setSeriesContainer:(id)a3
{
  objc_storeStrong((id *)&self->_seriesContainer, a3);
}

- (NSString)seriesPurchased
{
  return self->_seriesPurchased;
}

- (void)setSeriesPurchased:(id)a3
{
  objc_storeStrong((id *)&self->_seriesPurchased, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesPurchased, 0);
  objc_storeStrong((id *)&self->_seriesContainer, 0);
}

@end
