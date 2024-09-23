@implementation BKLibraryAssetPostProcessor

- (BKLibraryAssetPostProcessor)initWithLibraryManager:(id)a3
{
  id v5;
  BKLibraryAssetPostProcessor *v6;
  BKLibraryAssetPostProcessor *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *iVarQueue;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *coverImageQueue;
  NSObject *v16;
  BKLibraryAssetPostProcessor *v17;
  void *v18;
  _QWORD block[4];
  BKLibraryAssetPostProcessor *v21;

  v5 = a3;
  v6 = -[BKLibraryAssetPostProcessor init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryManager, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("com.apple.BKLibraryAssetCoverLoader", v9);
    iVarQueue = v7->_iVarQueue;
    v7->_iVarQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create("com.apple.BKLibraryAssetCoverLoader", v13);
    coverImageQueue = v7->_coverImageQueue;
    v7->_coverImageQueue = (OS_dispatch_queue *)v14;

    v16 = v7->_iVarQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4A328;
    block[3] = &unk_C1400;
    v17 = v7;
    v21 = v17;
    dispatch_sync(v16, block);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v17, "ownershipDidChange:", CFSTR("BKLibraryOwnershipDidChangeNotification"), v7->_libraryManager);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("BKLibraryOwnershipDidChangeNotification"), self->_libraryManager);

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAssetPostProcessor;
  -[BKLibraryAssetPostProcessor dealloc](&v4, "dealloc");
}

- (void)ownershipDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipAssetsKey")));

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "objectForKeyedSubscript:", CFSTR("BKLibraryOwnershipOldDatasource"), (_QWORD)v12));

        if (!v11)
        {

          -[BKLibraryAssetPostProcessor _postProcess](self, "_postProcess");
          goto LABEL_11;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }

LABEL_11:
}

- (void)_postProcessExplicitFlagForProductProfiles:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKLibraryAssetPostProcessor *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetPostProcessor libraryManager](self, "libraryManager"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4A5BC;
  v7[3] = &unk_C17B8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlockOnWorkerQueue:", v7);

}

- (void)_postProcess
{
  void *v3;
  _QWORD v4[5];

  kdebug_trace(725352884, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryAssetPostProcessor libraryManager](self, "libraryManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4A914;
  v4[3] = &unk_C1590;
  v4[4] = self;
  objc_msgSend(v3, "performNamed:workerQueueBlock:", CFSTR("post-processing"), v4);

}

- (id)_libraryAssetsForPostProcessingInManagedObjectContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("BKLibraryAsset")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForLibraryAssetsMissingExplicitContentFlag](BKLibraryManager, "predicateForLibraryAssetsMissingExplicitContentFlag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForDownloadableStoreLibraryAssets](BKLibraryManager, "predicateForDownloadableStoreLibraryAssets"));
  v12[0] = v5;
  v12[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v7));
  objc_msgSend(v4, "setPredicate:", v8);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(v4, "setPropertiesToFetch:", &off_CA078);
  v11 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v4, &v11));

  return v9;
}

- (BKLibraryManager)libraryManager
{
  return self->_libraryManager;
}

- (void)setLibraryManager:(id)a3
{
  objc_storeStrong((id *)&self->_libraryManager, a3);
}

- (OS_dispatch_queue)iVarQueue
{
  return self->_iVarQueue;
}

- (void)setIVarQueue:(id)a3
{
  objc_storeStrong((id *)&self->_iVarQueue, a3);
}

- (OS_dispatch_queue)coverImageQueue
{
  return self->_coverImageQueue;
}

- (void)setCoverImageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_coverImageQueue, a3);
}

- (NSMutableSet)qDownloadingStoreIDs
{
  return self->_qDownloadingStoreIDs;
}

- (void)setQDownloadingStoreIDs:(id)a3
{
  objc_storeStrong((id *)&self->_qDownloadingStoreIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qDownloadingStoreIDs, 0);
  objc_storeStrong((id *)&self->_coverImageQueue, 0);
  objc_storeStrong((id *)&self->_iVarQueue, 0);
  objc_storeStrong((id *)&self->_libraryManager, 0);
}

@end
