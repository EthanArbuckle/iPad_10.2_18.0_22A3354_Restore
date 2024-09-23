@implementation BCAnnotationSyncManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12740C;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_311338 != -1)
    dispatch_once(&qword_311338, block);
  return (id)qword_311340;
}

- (BCAnnotationSyncManager)initWithAnnotationProvider:(id)a3
{
  id v4;
  BCAnnotationSyncManager *v5;
  BCAnnotationSyncManager *v6;
  NSMutableSet *v7;
  NSMutableSet *assetIDsOfAssetsToSync;
  dispatch_queue_attr_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *assetIDsOfAssetsToSyncQueue;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BCAnnotationSyncManager;
  v5 = -[BCAnnotationSyncManager init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_annotationProvider, v4);
    v7 = objc_opt_new(NSMutableSet);
    assetIDsOfAssetsToSync = v6->_assetIDsOfAssetsToSync;
    v6->_assetIDsOfAssetsToSync = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = dispatch_queue_create("com.apple.iBooks.BCAnnotationSyncManager", v10);
    assetIDsOfAssetsToSyncQueue = v6->_assetIDsOfAssetsToSyncQueue;
    v6->_assetIDsOfAssetsToSyncQueue = (OS_dispatch_queue *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, "_mocDidSave:", NSManagedObjectContextDidSaveNotification, 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v14, "addObserver:selector:name:object:", v6, "_BCCloudAssetAnnotationManagerChanged:", BCCloudAssetAnnotationManagerChanged, 0);

    v15 = +[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, BCCloudAssetAnnotationManagerChanged, 0);

  v5.receiver = self;
  v5.super_class = (Class)BCAnnotationSyncManager;
  -[BCAnnotationSyncManager dealloc](&v5, "dealloc");
}

- (void)_acknowledgeMergingCloudAnnotations:(id)a3 forAssetID:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableSet);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13), "assetVersion"));
        if (v14)
          -[NSMutableSet addObject:](v8, "addObject:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = v8;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager annotationProvider](self, "annotationProvider", (_QWORD)v22));
        objc_msgSend(v21, "acknowledgeMergingAnnotationsWithAssetVersionMismatch:assetID:", v20, v7);

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

}

- (void)assetAnnotationsUpdatedWithCurrentCloudSyncVersions:(id)a3 updated:(id)a4 removed:(id)a5 fetchAgain:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  BCAnnotationSyncManager *v19;
  BOOL v20;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = BCCloudKitLog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "assetAnnotationsUpdated", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager annotationProvider](self, "annotationProvider"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_127948;
  v16[3] = &unk_291B28;
  v17 = v10;
  v18 = v9;
  v19 = self;
  v20 = a6;
  v14 = v9;
  v15 = v10;
  objc_msgSend(v13, "cloudSyncVersionsForDataType:performBlock:", CFSTR("BCAssetAnnotations"), v16);

}

+ (BOOL)managedBooksAllowedToSync
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = objc_msgSend(v2, "isEnterpriseBookMetadataSyncAllowed");

  return v3;
}

- (void)_mocDidSave:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableSet *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  NSMutableSet *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  id v22;
  NSPredicate *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  _QWORD *v29;
  _QWORD v30[4];
  NSMutableSet *v31;
  BCAnnotationSyncManager *v32;
  uint64_t v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = objc_opt_class(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persistentStoreCoordinator"));
  v8 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager annotationProvider](self, "annotationProvider"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet persistentStoreCoordinator](v8, "persistentStoreCoordinator"));
  if (v7 != v9)
  {

LABEL_19:
    goto LABEL_20;
  }
  v10 = objc_opt_class(AEAnnotationManagedObjectContext);
  v11 = BUDynamicCast(v10, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "sessionContextType");

  if (v13 != 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v14 = objc_opt_new(NSMutableSet);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSInsertedObjectsKey));
    if (v15)
    {
      -[NSMutableSet unionSet:](v14, "unionSet:", v15);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[NSMutableSet unionSet:](v14, "unionSet:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSUpdatedObjectsKey));
    if (v17)
    {
      -[NSMutableSet unionSet:](v14, "unionSet:", v17);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[NSMutableSet unionSet:](v14, "unionSet:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSDeletedObjectsKey));
    if (v19)
    {
      -[NSMutableSet unionSet:](v14, "unionSet:", v19);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[NSMutableSet unionSet:](v14, "unionSet:", v20);

    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_128594;
    v30[3] = &unk_291B78;
    v8 = v14;
    v31 = v8;
    v32 = self;
    v33 = v6;
    v21 = objc_retainBlock(v30);
    if (objc_msgSend((id)objc_opt_class(self), "managedBooksAllowedToSync"))
    {
      ((void (*)(_QWORD *, _QWORD))v21[2])(v21, 0);
    }
    else
    {
      v22 = -[NSMutableSet mutableCopy](v8, "mutableCopy");
      v23 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass: %@ AND annotationDeleted == 0"), objc_opt_class(AEAnnotation));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      objc_msgSend(v22, "filterUsingPredicate:", v24);

      if (objc_msgSend(v22, "count"))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "valueForKey:", CFSTR("annotationAssetID")));
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager delegate](self, "delegate"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "allObjects"));
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_128CB4;
        v28[3] = &unk_291BA0;
        v29 = v21;
        objc_msgSend(v26, "managedBooksMapWithAssetIDs:completion:", v27, v28);

      }
    }

    goto LABEL_19;
  }
LABEL_20:

}

- (void)_BCCloudAssetAnnotationManagerChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager annotationProvider](self, "annotationProvider"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_128E88;
  v6[3] = &unk_291BF0;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "performBlockOnUserSideQueue:", v6);

}

+ (id)_cloudSyncVersionsForDataType:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSFetchRequest), "initWithEntityName:", CFSTR("BCCloudSyncVersions"));
  objc_msgSend(v7, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v7, "setFetchLimit:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dataType == %@"), v5));
  objc_msgSend(v7, "setPredicate:", v8);

  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "executeFetchRequest:error:", v7, &v15));
  v10 = v15;
  if (v10)
  {
    v11 = BCCloudKitLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1B8060((uint64_t)v10, v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  if (!v13)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("BCCloudSyncVersions"), v6));
    objc_msgSend(v13, "setDataType:", v5);
  }

  return v13;
}

- (void)_syncAssetsWithCompletionSyncVersion:(int64_t)a3
{
  NSObject *v3;
  void *v4;
  id v5;
  void *i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v14;
  void *v15;
  _QWORD v18[5];
  id v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id location;
  _QWORD v25[2];
  _BYTE v26[128];

  v3 = objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager assetIDsOfAssetsToSyncQueue](self, "assetIDsOfAssetsToSyncQueue"));
  dispatch_assert_queue_V2(v3);

  v15 = (void *)objc_opt_class(self);
  objc_initWeak(&location, self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager assetIDsOfAssetsToSync](self, "assetIDsOfAssetsToSync"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v14 = *(_QWORD *)v21;
    obj = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForAnnotationsWithAssetID:includingDeleted:](AEAnnotation, "predicateForAnnotationsWithAssetID:includingDeleted:", v7, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForNonGlobalAnnotationsIncludingDeleted](AEAnnotation, "predicateForNonGlobalAnnotationsIncludingDeleted"));
        v25[0] = v8;
        v25[1] = v9;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v10));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCAnnotationSyncManager annotationProvider](self, "annotationProvider"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_129338;
        v18[3] = &unk_291C88;
        objc_copyWeak(v19, &location);
        v18[4] = v7;
        v19[1] = v15;
        v19[2] = (id)a3;
        objc_msgSend(v12, "onAnnotationsMatchingPredicate:performBlock:", v11, v18);

        objc_destroyWeak(v19);
      }
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

- (BCAnnotationSyncManagerDelegate)delegate
{
  return (BCAnnotationSyncManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AEAnnotationProvider)annotationProvider
{
  return (AEAnnotationProvider *)objc_loadWeakRetained((id *)&self->_annotationProvider);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_annotationProvider, a3);
}

- (NSMutableSet)assetIDsOfAssetsToSync
{
  return self->_assetIDsOfAssetsToSync;
}

- (void)setAssetIDsOfAssetsToSync:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSync, a3);
}

- (OS_dispatch_queue)assetIDsOfAssetsToSyncQueue
{
  return self->_assetIDsOfAssetsToSyncQueue;
}

- (void)setAssetIDsOfAssetsToSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSyncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSyncQueue, 0);
  objc_storeStrong((id *)&self->_assetIDsOfAssetsToSync, 0);
  objc_destroyWeak((id *)&self->_annotationProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
