@implementation BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration

- (BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration)initWithCollection:(id)a3 storePlaylistID:(id)a4 fromActionMenu:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration *v10;
  BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration *v11;
  void *v12;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration;
  v10 = -[BKLibraryBookshelfSupplementalPDFPickerCollectionViewConfiguration init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollection:](v10, "setCollection:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionID"));
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollectionID:](v11, "setCollectionID:", v12);

    -[BKLibraryBookshelfLibraryBaseViewConfiguration setSupplementalContentStorePlaylistID:](v11, "setSupplementalContentStorePlaylistID:", v9);
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setInitialViewMode:](v11, "setInitialViewMode:", 2);
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setFromActionMenu:](v11, "setFromActionMenu:", v5);
  }

  return v11;
}

- (id)sortControlConfig
{
  void *v3;
  BKLibrarySortByMode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v4, "setSortMode:", 2);
  -[BKLibrarySortByMode setTitle:](v4, "setTitle:", &stru_10091C438);
  -[BKLibrarySortByMode setLabel:](v4, "setLabel:", &stru_10091C438);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration supplementalContentStorePlaylistID](self, "supplementalContentStorePlaylistID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:](BKLibraryManager, "predicateForSupplementalContentLibraryAssetsWithStorePlaylistID:", v5));
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v4, "setAllowExplicitPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibrarySortByMode allowExplicitPredicate](v4, "allowExplicitPredicate"));
  v15[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateToExcludeLibraryAssetsWithExplicitContent](BKLibraryManager, "predicateToExcludeLibraryAssetsWithExplicitContent"));
  v15[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
  -[BKLibrarySortByMode setHideExplicitPredicate:](v4, "setHideExplicitPredicate:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:"));
  v14 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
  -[BKLibrarySortByMode setSortDescriptors:](v4, "setSortDescriptors:", v12);

  -[BKLibrarySortByMode setSectionKeyPath:](v4, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v4, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v4, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v4, "setAllowsReordering:", 0);
  objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (BOOL)hideTopSeparatorLine
{
  return 1;
}

- (id)supplementalContentPDFTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Choose a PDF"), &stru_10091C438, 0));

  return v3;
}

- (BOOL)supplementalContentPDFPicker
{
  return 1;
}

- (BOOL)showCancelNavigationBarItem
{
  return 1;
}

- (BOOL)includeCollectionInfo
{
  return 0;
}

- (BOOL)showsSortControl
{
  return 0;
}

- (BOOL)canChangeViewMode
{
  return 1;
}

@end
