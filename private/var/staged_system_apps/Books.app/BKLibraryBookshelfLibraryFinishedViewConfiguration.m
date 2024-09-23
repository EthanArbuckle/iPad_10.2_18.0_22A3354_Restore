@implementation BKLibraryBookshelfLibraryFinishedViewConfiguration

- (BKLibraryBookshelfLibraryFinishedViewConfiguration)init
{
  BKLibraryBookshelfLibraryFinishedViewConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfLibraryFinishedViewConfiguration;
  v2 = -[BKLibraryBookshelfLibraryFinishedViewConfiguration init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionController"));
    v5 = kBKCollectionDefaultIDFinished;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiChildContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v5, v7, 0));
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollection:](v2, "setCollection:", v8);

    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollectionID:](v2, "setCollectionID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collection](v2, "collection"));
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setInitialViewMode:](v2, "setInitialViewMode:", objc_msgSend(v9, "resolvedViewMode"));

  }
  return v2;
}

- (unint64_t)collectionType
{
  return 2;
}

- (BOOL)providesReviewData
{
  return 1;
}

- (BOOL)canChangeViewMode
{
  return 0;
}

- (BOOL)stackedSortControl
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 0;
}

- (id)viewTitle
{
  return +[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", kBKCollectionDefaultIDFinished);
}

- (id)viewDescription
{
  return 0;
}

- (id)sortControlConfig
{
  BKLibrarySortByMode *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  BKLibrarySortByMode *v9;
  void *v10;
  BKLibrarySortByMode *v12;
  _QWORD v13[2];

  v2 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v2, "setSortMode:", 8);
  -[BKLibrarySortByMode setTitle:](v2, "setTitle:", &stru_10091C438);
  -[BKLibrarySortByMode setLabel:](v2, "setLabel:", &stru_10091C438);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateFor_All_Finished_LibraryAssetsAllowsExplicit:](BKLibraryManager, "predicateFor_All_Finished_LibraryAssetsAllowsExplicit:", 1));
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v2, "setAllowExplicitPredicate:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateFor_All_Finished_LibraryAssetsAllowsExplicit:](BKLibraryManager, "predicateFor_All_Finished_LibraryAssetsAllowsExplicit:", 0));
  -[BKLibrarySortByMode setHideExplicitPredicate:](v2, "setHideExplicitPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("dateFinished"), 0));
  v13[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("sortTitle"), 1));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  -[BKLibrarySortByMode setSortDescriptors:](v2, "setSortDescriptors:", v7);

  if (_os_feature_enabled_impl("Books", "iveReadThisFullFlow"))
  {
    -[BKLibrarySortByMode setSectionKeyPath:](v2, "setSectionKeyPath:", CFSTR("finishedCollectionSectionID"));
    v8 = CFSTR("finishedCollectionSectionName");
    v9 = v2;
  }
  else
  {
    -[BKLibrarySortByMode setSectionKeyPath:](v2, "setSectionKeyPath:", 0);
    v9 = v2;
    v8 = 0;
  }
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v9, "setSectionKeyPathForDisplay:", v8);
  -[BKLibrarySortByMode setEntityName:](v2, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v2, "setAllowsReordering:", 0);
  v12 = v2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return v10;
}

@end
