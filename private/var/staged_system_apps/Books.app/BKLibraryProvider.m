@implementation BKLibraryProvider

+ (id)recentlyEngagedAssetsProvider:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForRecentlyEngaged](BKLibraryManager, "fetchRequestForRecentlyEngaged"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  if (a3 <= 1)
    v6 = 1;
  else
    v6 = a3;
  objc_msgSend(v5, "setFetchLimit:", v6);
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v5, CFSTR("recents"));

  return v7;
}

+ (id)storeAssetProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  objc_msgSend(v9, "setSortDescriptors:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForPurchasedLibraryAssets](BKLibraryManager, "predicateForPurchasedLibraryAssets"));
  objc_msgSend(v9, "setPredicate:", v12);

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("store-assets"));

  return v13;
}

+ (id)wantToReadLibraryProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKCollectionMember);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 0);
  v20[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 0));
  v20[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v9, "setSortDescriptors:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:", kBKCollectionDefaultIDWantToRead, 0));
  v19[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets](BKLibraryManager, "predicateForExcludingCollectionMembersWithContainerLibraryAssets"));
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));
  objc_msgSend(v9, "setPredicate:", v16);

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("want-to-read"));

  return v17;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (id)assetsFromFetchRequestResults:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(BKLibraryAsset);
        v11 = objc_opt_class(BKCollectionMember);
        if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asset"));
          v13 = BUDynamicCast(v10, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        }
        else
        {
          v15 = BUDynamicCast(v10, v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
        }
        v16 = objc_msgSend(objc_alloc((Class)BSUIAsset), "initWithLibraryAsset:", v14);
        objc_msgSend(v4, "addObject:", v16);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)mySamplesLibraryProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  _QWORD v20[2];

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKCollectionMember);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 0);
  v20[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("assetID"), 0));
  v20[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
  objc_msgSend(v9, "setSortDescriptors:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForCollectionMembersInCollectionID:hideUnownedItems:](BKLibraryManager, "predicateForCollectionMembersInCollectionID:hideUnownedItems:", kBKCollectionDefaultIDSamples, 0));
  v19[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForExcludingCollectionMembersWithContainerLibraryAssets](BKLibraryManager, "predicateForExcludingCollectionMembersWithContainerLibraryAssets"));
  v19[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));
  objc_msgSend(v9, "setPredicate:", v16);

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("my-samples"));

  return v17;
}

- (BSUIDynamicArray)dynamicArray
{
  BSUIDynamicArray *v2;
  void *v3;
  unsigned int v4;
  id v5;
  void *v6;
  BSUIDynamicArray *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v2 = self->_dynamicArray;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("BCRecentBooksForceEmpty"));

  if (v4)
  {
    v5 = objc_alloc((Class)BSUIDynamicArray);
    v9[0] = CFSTR("uniqueId");
    v9[1] = CFSTR("updateType");
    v10[0] = BSUIAssetKeyAssetID;
    v10[1] = CFSTR("move");
    v9[2] = CFSTR("debugName");
    v10[2] = CFSTR("BKLibraryProvider.recentBooks.fake");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
    v7 = (BSUIDynamicArray *)objc_msgSend(v5, "initWithArray:options:", &__NSArray0__struct, v6);

    v2 = v7;
  }
  return v2;
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (BKLibraryProviderDelegate)delegate
{
  return (BKLibraryProviderDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (id)_assetDictionariesForDynamicArrayWithFetchRequest:(id)a3 isInitialFetch:(BOOL)a4 matchedAssets:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider dictionariesFromAssets:limit:](self, "dictionariesFromAssets:limit:", v7, objc_msgSend(a3, "fetchLimit")));

  return v8;
}

- (id)dictionariesFromAssets:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  BKLibraryProvider *v15;
  unint64_t v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003CA5C;
  v12[3] = &unk_1008EB038;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", objc_msgSend(v6, "count")));
  v8 = v7;
  v14 = v8;
  v15 = self;
  v16 = a4;
  v9 = v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

  v10 = v8;
  return v10;
}

- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  BKLibraryProvider *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryProvider;
  v8 = -[BKLibraryProvider init](&v12, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[_BKLibraryProviderContext sharedInstance](_BKLibraryProviderContext, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "moc"));
    -[BKLibraryProvider _commonInitWithFetchRequest:name:moc:](v8, "_commonInitWithFetchRequest:name:moc:", v6, v7, v10);

  }
  return v8;
}

- (void)_commonInitWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5
{
  id v8;
  NSString *v9;
  NSString *name;
  NSMutableSet *v11;
  NSMutableSet *objectsToRefresh;
  id v13;

  v8 = a5;
  v13 = a3;
  v9 = (NSString *)objc_msgSend(a4, "copy");
  name = self->_name;
  self->_name = v9;

  v11 = objc_opt_new(NSMutableSet);
  objectsToRefresh = self->_objectsToRefresh;
  self->_objectsToRefresh = v11;

  -[BKLibraryProvider configureMOC:](self, "configureMOC:", v8);
  -[BKLibraryProvider configureDynamicArray](self, "configureDynamicArray");
  -[BKLibraryProvider configureFetchedResultsControllerWithFetchRequest:](self, "configureFetchedResultsControllerWithFetchRequest:", v13);

}

- (void)configureMOC:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_moc, a3);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_mocDidSaveNotification:", NSManagedObjectContextDidSaveNotification, self->_moc);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_mocDidChangeNotification:", NSManagedObjectContextObjectsDidChangeNotification, self->_moc);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "addObserver:selector:name:object:", self, "_mocDidMergeNotification:", NSManagedObjectContextDidMergeChangesObjectIDsNotification, self->_moc);

}

- (void)configureFetchedResultsControllerWithFetchRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSManagedObjectContext *moc;
  NSManagedObjectContext *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100053348();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1006A0AF4((uint64_t)self, v6, v7, v8, v9, v10, v11, v12);

    moc = self->_moc;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100053014;
    v16[3] = &unk_1008E7338;
    v16[4] = self;
    v17 = v4;
    -[NSManagedObjectContext performBlock:](moc, "performBlock:", v16);

  }
  else
  {
    v14 = self->_moc;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10010BA84;
    v15[3] = &unk_1008E72C0;
    v15[4] = self;
    -[NSManagedObjectContext performBlock:](v14, "performBlock:", v15);
  }

}

- (void)configureDynamicArray
{
  id v3;
  const __CFString *name;
  void *v5;
  void *v6;
  BSUIDynamicArray *v7;
  BSUIDynamicArray *dynamicArray;
  _QWORD v9[3];
  _QWORD v10[3];

  v3 = objc_alloc((Class)BSUIDynamicArray);
  v9[0] = CFSTR("uniqueId");
  v9[1] = CFSTR("updateType");
  v10[0] = BSUIAssetKeyAssetID;
  v10[1] = CFSTR("move");
  v9[2] = CFSTR("debugName");
  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("unknown");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("BKLibraryProvider."), "stringByAppendingString:", name));
  v10[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  v7 = (BSUIDynamicArray *)objc_msgSend(v3, "initWithArray:options:", &__NSArray0__struct, v6);
  dynamicArray = self->_dynamicArray;
  self->_dynamicArray = v7;

}

+ (id)localStoreAssetsLibraryProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v15;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("storeID"), 0);
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  objc_msgSend(v9, "setSortDescriptors:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLocalOrDownloadingStoreAssets](BKLibraryManager, "predicateForLocalOrDownloadingStoreAssets"));
  objc_msgSend(v9, "setPredicate:", v12);

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("local-store-assets"));

  return v13;
}

+ (id)searchLibraryProvider:(id)a3 :(unint64_t)a4
{
  id v5;
  BKLibrarySearchProvider *v6;

  v5 = a3;
  v6 = -[BKLibrarySearchProvider initWithFetchRequest:name:searchTerm:limit:]([BKLibrarySearchProvider alloc], "initWithFetchRequest:name:searchTerm:limit:", 0, CFSTR("search"), v5, a4);

  return v6;
}

+ (id)recentLibraryAssetsProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v16;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v16 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v9, "setSortDescriptors:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllOwnedBooks](BKLibraryManager, "predicateForAllOwnedBooks"));
  objc_msgSend(v9, "setPredicate:", v12);

  if (a3 <= 1)
    v13 = 1;
  else
    v13 = a3;
  objc_msgSend(v9, "setFetchLimit:", v13);
  v14 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("recents"));

  return v14;
}

+ (id)recentAudiobookAssetProvider:(unint64_t)a3
{
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;

  v5 = objc_alloc((Class)NSFetchRequest);
  v6 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v5, "initWithEntityName:", v8);

  objc_msgSend(v9, "setReturnsObjectsAsFaults:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v15 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  objc_msgSend(v9, "setSortDescriptors:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllOwnedAudiobooks](BKLibraryManager, "predicateForAllOwnedAudiobooks"));
  objc_msgSend(v9, "setPredicate:", v12);

  if (a3)
    objc_msgSend(v9, "setFetchLimit:", a3);
  v13 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v9, CFSTR("recent-audiobooks"));

  return v13;
}

+ (id)recentAudiobookAssetProviderForCarplay
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v3 = objc_alloc((Class)NSFetchRequest);
  v4 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithEntityName:", v6);

  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("lastOpenDate"), 0));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  objc_msgSend(v7, "setSortDescriptors:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllOwnedAudiobooks](BKLibraryManager, "predicateForAllOwnedAudiobooks"));
  objc_msgSend(v7, "setPredicate:", v10);

  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v7, CFSTR("recent-audiobooks-carplay"));
  return v11;
}

+ (id)continueReadingAssetsProvider:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForContinueReading](BKLibraryManager, "fetchRequestForContinueReading"));
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  if (a3)
    objc_msgSend(v5, "setFetchLimit:", a3);
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v5, CFSTR("continueReading"));
  objc_msgSend(v6, "setDynamicArray:", 0);

  return v6;
}

+ (id)previouslyReadAssetsProvider
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager fetchRequestForPreviouslyRead](BKLibraryManager, "fetchRequestForPreviouslyRead"));
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  v4 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v3, CFSTR("previouslyRead"));

  return v4;
}

+ (id)endOfBookTopPicksProvider:(id)a3 :(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  id v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v38[2];
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  double v45;

  v6 = a3;
  v7 = objc_opt_class(NSDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BCRCDataContainer defaultContainer](BCRCDataContainer, "defaultContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readingNow")));
  v11 = BUDynamicCast(v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v13 = objc_opt_class(NSNumber);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("endOfBookFinishedPercentage")));
    v15 = BUDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (uint64_t)objc_msgSend(v16, "integerValue");
    if (v17 >= 100)
      v18 = 100;
    else
      v18 = v17;
    v19 = 0.6;
    if (v16)
      v20 = v17 < 1;
    else
      v20 = 1;
    if (!v20)
    {
      if (v18 < 0)
      {
        v21 = sub_100053348();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v41 = v16;
          v42 = 2048;
          v43 = v18;
          v44 = 2048;
          v45 = (double)v18;
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Remote value for finished percentage was invalid when converted to float: num:%@ / int:%ld / float:%f", buf, 0x20u);
        }

      }
      else if ((unint64_t)v18 < 2)
      {
        v19 = (double)v18;
      }
      else
      {
        v19 = (double)v18;
        do
          v19 = v19 / 10.0;
        while (v19 > 1.0);
      }
    }

  }
  else
  {
    v19 = 0.6;
  }

  v23 = objc_alloc((Class)NSFetchRequest);
  v24 = (objc_class *)objc_opt_class(BKLibraryAsset);
  v25 = NSStringFromClass(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = objc_msgSend(v23, "initWithEntityName:", v26);

  objc_msgSend(v27, "setReturnsObjectsAsFaults:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("bookHighWaterMarkProgress"), 0));
  v39 = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
  objc_msgSend(v27, "setSortDescriptors:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForPurchasedLibraryAssets](BKLibraryManager, "predicateForPurchasedLibraryAssets"));
  v38[0] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForContentWithHighWaterMarkOrReadingProgressValue:](BKLibraryManager, "predicateForContentWithHighWaterMarkOrReadingProgressValue:", v19));
  v38[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v33 = objc_msgSend(v32, "mutableCopy");

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLastOpenedDateAfter:](BKLibraryManager, "predicateForLastOpenedDateAfter:", v6));
  if (v34)
    objc_msgSend(v33, "addObject:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v33));
  objc_msgSend(v27, "setPredicate:", v35);

  if (a4)
    objc_msgSend(v27, "setFetchLimit:", a4);
  v36 = objc_msgSend(objc_alloc((Class)a1), "initWithFetchRequest:name:", v27, CFSTR("eob-top-picks"));

  return v36;
}

- (BKLibraryProvider)initWithFetchRequest:(id)a3 name:(id)a4 moc:(id)a5
{
  id v8;
  id v9;
  id v10;
  BKLibraryProvider *v11;
  BKLibraryProvider *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryProvider;
  v11 = -[BKLibraryProvider init](&v14, "init");
  v12 = v11;
  if (v11)
    -[BKLibraryProvider _commonInitWithFetchRequest:name:moc:](v11, "_commonInitWithFetchRequest:name:moc:", v8, v9, v10);

  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextObjectsDidChangeNotification, self->_moc);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, NSManagedObjectContextDidMergeChangesObjectIDsNotification, self->_moc);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryProvider;
  -[BKLibraryProvider dealloc](&v6, "dealloc");
}

- (BOOL)isContentLoaded
{
  BKLibraryProvider *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider moc](self, "moc"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010BBD0;
  v5[3] = &unk_1008E75B8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)fetchedContent
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10004E3B0;
  v11 = sub_10004E258;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider moc](self, "moc"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10010BD08;
  v6[3] = &unk_1008E76D0;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider fetchedResultsController](self, "fetchedResultsController"));

  if (v5 == v4)
  {
    v6 = objc_alloc((Class)TUIIndexMapper);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchedObjects"));
    v8 = objc_msgSend(v6, "initWithCount:", objc_msgSend(v7, "count"));
    -[BKLibraryProvider setPendingUpdates:](self, "setPendingUpdates:", v8);

    v9 = sub_100053348();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      sub_1006A0D2C(self, v4);

  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;

  v11 = a5;
  v12 = a7;
  v13 = a3;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider fetchedResultsController](self, "fetchedResultsController"));

  if (v14 == v13)
  {
    switch(a6)
    {
      case 1uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider pendingUpdates](self, "pendingUpdates"));
        objc_msgSend(v15, "insertAtIndex:", objc_msgSend(v12, "row"));
        goto LABEL_10;
      case 2uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider pendingUpdates](self, "pendingUpdates"));
        objc_msgSend(v15, "deleteAtIndex:", objc_msgSend(v11, "row"));
        goto LABEL_10;
      case 3uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider pendingUpdates](self, "pendingUpdates"));
        objc_msgSend(v15, "moveFromIndex:toIndex:", objc_msgSend(v11, "row"), objc_msgSend(v12, "row"));
        goto LABEL_10;
      case 4uLL:
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider pendingUpdates](self, "pendingUpdates"));
        objc_msgSend(v15, "updateAtIndex:", objc_msgSend(v11, "row"));
LABEL_10:

        break;
      default:
        v16 = sub_100053348();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          sub_1006A0DF8(self);

        break;
    }
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v8 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider fetchedResultsController](self, "fetchedResultsController"));

  if (v4 == v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider pendingUpdates](self, "pendingUpdates"));
    -[BKLibraryProvider setPendingUpdates:](self, "setPendingUpdates:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider moc](self, "moc"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10010C0A8;
    v9[3] = &unk_1008E7928;
    v9[4] = self;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v9);

  }
}

- (void)_mocDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  BKLibraryProvider *v20;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider fetchedResultsController](self, "fetchedResultsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchRequest"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entity"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (objc_class *)objc_opt_class(BKCollectionMember);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v7, "isEqualToString:", v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider moc](self, "moc"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKLibraryAsset"), v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", NSRefreshedObjectsKey));

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10010C898;
    v18[3] = &unk_1008EB0D8;
    v19 = v13;
    v20 = self;
    v16 = v13;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v18);

  }
}

- (void)_refreshObjectsIfNeeded
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (-[NSMutableSet count](self->_objectsToRefresh, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryProvider fetchedResultsController](self, "fetchedResultsController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fetchedObjects"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10010C9B8;
    v5[3] = &unk_1008EB100;
    v5[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

    -[NSMutableSet removeAllObjects](self->_objectsToRefresh, "removeAllObjects");
  }
}

- (void)_mocDidMergeNotification:(id)a3
{
  -[BKLibraryProvider _refreshObjectsIfNeeded](self, "_refreshObjectsIfNeeded", a3);
}

- (void)_mocDidSaveNotification:(id)a3
{
  -[BKLibraryProvider _refreshObjectsIfNeeded](self, "_refreshObjectsIfNeeded", a3);
}

- (NSString)name
{
  return self->_name;
}

- (TUIIndexMapper)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingUpdates, a3);
}

- (void)setDynamicArray:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicArray, a3);
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (NSMutableSet)objectsToRefresh
{
  return self->_objectsToRefresh;
}

- (void)setObjectsToRefresh:(id)a3
{
  objc_storeStrong((id *)&self->_objectsToRefresh, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsToRefresh, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_dynamicArray, 0);
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
