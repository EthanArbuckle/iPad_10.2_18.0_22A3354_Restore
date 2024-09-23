@implementation BKLibraryBookshelfLibrarySamplesViewConfiguration

- (BKLibraryBookshelfLibrarySamplesViewConfiguration)init
{
  BKLibraryBookshelfLibrarySamplesViewConfiguration *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKLibraryBookshelfLibrarySamplesViewConfiguration;
  v2 = -[BKLibraryBookshelfLibraryWantToReadViewConfiguration init](&v11, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionController"));
    v5 = kBKCollectionDefaultIDSamples;
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
  return 3;
}

- (id)viewTitle
{
  return +[BCCollection titleForDefaultCollectionID:](BCCollection, "titleForDefaultCollectionID:", kBKCollectionDefaultIDSamples);
}

- (id)sortControlConfig
{
  BKLibrarySortByMode *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BKLibrarySortByMode *v11;
  _QWORD v12[2];

  v2 = objc_alloc_init(BKLibrarySortByMode);
  -[BKLibrarySortByMode setSortMode:](v2, "setSortMode:", 6);
  -[BKLibrarySortByMode setTitle:](v2, "setTitle:", &stru_10091C438);
  -[BKLibrarySortByMode setLabel:](v2, "setLabel:", &stru_10091C438);
  v3 = kBKCollectionDefaultIDSamples;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:", kBKCollectionDefaultIDSamples, 0, 1));
  -[BKLibrarySortByMode setAllowExplicitPredicate:](v2, "setAllowExplicitPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:allowExplicit:", v3, 0, 0));
  -[BKLibrarySortByMode setHideExplicitPredicate:](v2, "setHideExplicitPredicate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("sortKey"), 0));
  v12[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 1));
  v12[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  -[BKLibrarySortByMode setSortDescriptors:](v2, "setSortDescriptors:", v8);

  -[BKLibrarySortByMode setSectionKeyPath:](v2, "setSectionKeyPath:", 0);
  -[BKLibrarySortByMode setSectionKeyPathForDisplay:](v2, "setSectionKeyPathForDisplay:", 0);
  -[BKLibrarySortByMode setEntityName:](v2, "setEntityName:", CFSTR("BKCollectionMember"));
  -[BKLibrarySortByMode setAllowsReordering:](v2, "setAllowsReordering:", 0);
  v11 = v2;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

@end
