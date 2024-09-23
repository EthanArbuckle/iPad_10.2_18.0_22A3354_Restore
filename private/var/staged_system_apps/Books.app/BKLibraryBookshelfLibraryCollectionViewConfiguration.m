@implementation BKLibraryBookshelfLibraryCollectionViewConfiguration

- (BKLibraryBookshelfLibraryCollectionViewConfiguration)initWithCollection:(id)a3
{
  id v4;
  BKLibraryBookshelfLibraryCollectionViewConfiguration *v5;
  BKLibraryBookshelfLibraryCollectionViewConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryBookshelfLibraryCollectionViewConfiguration;
  v5 = -[BKLibraryBookshelfLibraryCollectionViewConfiguration init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollection:](v5, "setCollection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
    -[BKLibraryBookshelfLibraryBaseViewConfiguration setCollectionID:](v6, "setCollectionID:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionController"));
    v10 = kBKCollectionDefaultAll;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uiChildContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mutableCollectionWithCollectionID:inManagedObjectContext:error:", v10, v12, 0));

    -[BKLibraryBookshelfLibraryBaseViewConfiguration setInitialViewMode:](v6, "setInitialViewMode:", objc_msgSend(v13, "resolvedViewMode"));
  }

  return v6;
}

- (id)productInfoFilter
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(state = %@ || state = %@) && contentType != %@"), &off_10092F120, &off_10092F138, &off_10092F138);
}

- (BOOL)supportsReadingListsButton
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionID"));
  v4 = objc_msgSend(v3, "isEqualToString:", kBKCollectionDefaultAll);

  return v4;
}

- (id)viewTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collection](self, "collection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return v3;
}

- (id)viewDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collection](self, "collection"));
  if ((objc_msgSend(v3, "isDefaultCollection") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collection](self, "collection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "details"));

  }
  return v4;
}

- (id)sortControlConfig
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BKLibrarySortByMode *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BKLibrarySortByMode *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BKLibrarySortByMode *v23;
  void *v24;
  void *v25;
  void *v26;
  BKLibrarySortByMode *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  void *v41;
  _QWORD v42[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:", v3, 0, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:", v4, 0, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  v6 = objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetsInCollectionID:allowExplicit:](BKLibraryManager, "predicateForAssetsInCollectionID:allowExplicit:", v5, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfLibraryBaseViewConfiguration collectionID](self, "collectionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAssetsInCollectionID:allowExplicit:](BKLibraryManager, "predicateForAssetsInCollectionID:allowExplicit:", v7, 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("sortTitle"), 1, "localizedStandardCompare:"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", CFSTR("sortAuthor"), 1, "localizedStandardCompare:"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Sort by…"), &stru_10091C438, 0));

  v13 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v13, "setSortMode:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Recent"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v13, "setTitle:", v15);

  v37 = (void *)v12;
  -[BKLibrarySortByMode setLabel:](v13, "setLabel:", v12);
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v13, "setAllowExplicitPredicate:", v6);
  -[BKLibrarySortByMode setHideExplicitPredicate:](v13, "setHideExplicitPredicate:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v42[0] = v16;
  v42[1] = v9;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  -[BKLibrarySortByMode setSortDescriptors:](v13, "setSortDescriptors:", v17);

  -[BKLibrarySortByMode setSectionKeyPath:](v13, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v13, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v13, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v13, "setAllowsReordering:", 0);
  objc_msgSend(v10, "addObject:", v13);
  v18 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v18, "setSortMode:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Title"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v18, "setTitle:", v20);

  -[BKLibrarySortByMode setLabel:](v18, "setLabel:", v12);
  v21 = v6;
  v34 = (void *)v6;
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v18, "setAllowExplicitPredicate:", v6);
  -[BKLibrarySortByMode setHideExplicitPredicate:](v18, "setHideExplicitPredicate:", v8);
  v41 = v9;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v41, 1));
  -[BKLibrarySortByMode setSortDescriptors:](v18, "setSortDescriptors:", v22);

  -[BKLibrarySortByMode setSectionKeyPath:](v18, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v18, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v18, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v18, "setAllowsReordering:", 0);
  objc_msgSend(v10, "addObject:", v18);
  v23 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v23, "setSortMode:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Author"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v23, "setTitle:", v25);

  -[BKLibrarySortByMode setLabel:](v23, "setLabel:", v37);
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v23, "setAllowExplicitPredicate:", v21);
  -[BKLibrarySortByMode setHideExplicitPredicate:](v23, "setHideExplicitPredicate:", v8);
  v40[0] = v38;
  v40[1] = v9;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
  -[BKLibrarySortByMode setSortDescriptors:](v23, "setSortDescriptors:", v26);

  -[BKLibrarySortByMode setSectionKeyPath:](v23, "setSectionKeyPath:", CFSTR("sortAuthor"));
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v23, "setSectionKeyPathForDisplay:", CFSTR("author"));
  -[BKLibrarySortByMode setEntityName:](v23, "setEntityName:", CFSTR("BKLibraryAsset"));
  -[BKLibrarySortByMode setAllowsReordering:](v23, "setAllowsReordering:", 0);
  objc_msgSend(v10, "addObject:", v23);
  v27 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v27, "setSortMode:", 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Manual"), &stru_10091C438, 0));
  -[BKLibrarySortByMode setTitle:](v27, "setTitle:", v29);

  -[BKLibrarySortByMode setLabel:](v27, "setLabel:", v37);
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v27, "setAllowExplicitPredicate:", v36);
  -[BKLibrarySortByMode setHideExplicitPredicate:](v27, "setHideExplicitPredicate:", v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("sortKey"), 0));
  v39[0] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 0));
  v39[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  -[BKLibrarySortByMode setSortDescriptors:](v27, "setSortDescriptors:", v32);

  -[BKLibrarySortByMode setSectionKeyPath:](v27, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v27, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v27, "setEntityName:", CFSTR("BKCollectionMember"));
  -[BKLibrarySortByMode setAllowsReordering:](v27, "setAllowsReordering:", 1);
  objc_msgSend(v10, "addObject:", v27);

  return v10;
}

@end
