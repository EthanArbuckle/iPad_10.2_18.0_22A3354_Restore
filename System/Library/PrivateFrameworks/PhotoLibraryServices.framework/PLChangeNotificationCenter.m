@implementation PLChangeNotificationCenter

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5 object:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v12, a4, v11, v10);

}

- (NSNotificationCenter)backingCenter
{
  return (NSNotificationCenter *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (void)addInvitationRecordsObserver:(id)a3
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_invitationRecordsDidChange_, CFSTR("PLInvitationRecordsDidChangeNotification"), 0);
}

- (void)addAssetContainerListChangeObserver:(id)a3 containerList:(id)a4
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_assetContainerListDidChange_, CFSTR("PLAssetContainerListDidChangeNotification"), a4);
}

- (void)addAssetContainerChangeObserver:(id)a3 container:(id)a4
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_assetContainerDidChange_, CFSTR("PLAssetContainerDidChangeNotification"), a4);
}

+ (id)defaultCenter
{
  pl_dispatch_once();
  return (id)defaultCenter_myCenter;
}

void __43__PLChangeNotificationCenter_defaultCenter__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultCenter_myCenter;
  defaultCenter_myCenter = (uint64_t)v1;

}

- (PLChangeNotificationCenter)init
{
  PLChangeNotificationCenter *v2;
  PLChangeList *v3;
  PLChangeList *changedAlbumLists;
  PLContentChanges *v5;
  PLContentChanges *albumListsContent;
  PLChangeList *v7;
  PLChangeList *changedAlbums;
  PLContentChanges *v9;
  PLContentChanges *albumsContent;
  PLChangeList *v11;
  PLChangeList *changedAssets;
  PLContentChanges *v13;
  PLContentChanges *momentsContent;
  PLChangeList *v15;
  PLChangeList *changedMoments;
  PLChangeList *v17;
  PLChangeList *changedCloudFeedEntries;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *notificationHandlingQueue;
  OS_dispatch_queue *v23;
  id v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PLChangeNotificationCenter;
  v2 = -[PLChangeNotificationCenter init](&v26, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PLChangeList);
    changedAlbumLists = v2->_changedAlbumLists;
    v2->_changedAlbumLists = v3;

    v5 = objc_alloc_init(PLContentChanges);
    albumListsContent = v2->_albumListsContent;
    v2->_albumListsContent = v5;

    v7 = objc_alloc_init(PLChangeList);
    changedAlbums = v2->_changedAlbums;
    v2->_changedAlbums = v7;

    v9 = objc_alloc_init(PLContentChanges);
    albumsContent = v2->_albumsContent;
    v2->_albumsContent = v9;

    v11 = objc_alloc_init(PLChangeList);
    changedAssets = v2->_changedAssets;
    v2->_changedAssets = v11;

    v13 = objc_alloc_init(PLContentChanges);
    momentsContent = v2->_momentsContent;
    v2->_momentsContent = v13;

    v15 = objc_alloc_init(PLChangeList);
    changedMoments = v2->_changedMoments;
    v2->_changedMoments = v15;

    v17 = objc_alloc_init(PLChangeList);
    changedCloudFeedEntries = v2->_changedCloudFeedEntries;
    v2->_changedCloudFeedEntries = v17;

    if (PLIsAssetsd())
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_BACKGROUND, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = dispatch_queue_create("Camera preview well change handling queue", v20);
      notificationHandlingQueue = v2->_notificationHandlingQueue;
      v2->_notificationHandlingQueue = (OS_dispatch_queue *)v21;

    }
    else
    {
      v23 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v24 = MEMORY[0x1E0C80D38];
      v20 = v2->_notificationHandlingQueue;
      v2->_notificationHandlingQueue = v23;
    }

  }
  return v2;
}

- (void)dealloc
{
  NSNumber *cameraPreviewChangedToken;
  objc_super v4;

  cameraPreviewChangedToken = self->_cameraPreviewChangedToken;
  if (cameraPreviewChangedToken)
    notify_cancel(-[NSNumber intValue](cameraPreviewChangedToken, "intValue"));
  v4.receiver = self;
  v4.super_class = (Class)PLChangeNotificationCenter;
  -[PLChangeNotificationCenter dealloc](&v4, sel_dealloc);
}

- (void)enqueueNotification:(id)a3
{
  id v4;
  NSMutableArray *enqueuedNotifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    enqueuedNotifications = self->_enqueuedNotifications;
    v8 = v4;
    if (!enqueuedNotifications)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_enqueuedNotifications;
      self->_enqueuedNotifications = v6;

      enqueuedNotifications = self->_enqueuedNotifications;
    }
    -[NSMutableArray addObject:](enqueuedNotifications, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeAssetContainerChangeObserver:(id)a3 container:(id)a4
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLAssetContainerDidChangeNotification"), a4);
}

- (void)removeAssetContainerListChangeObserver:(id)a3 containerList:(id)a4
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLAssetContainerListDidChangeNotification"), a4);
}

- (void)addCloudCommentsChangeObserver:(id)a3 asset:(id)a4
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_cloudCommentsDidChange_, CFSTR("PLCloudCommentsDidChangeNotification"), a4);
}

- (void)removeCloudCommentsChangeObserver:(id)a3 asset:(id)a4
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLCloudCommentsDidChangeNotification"), a4);
}

- (void)removeInvitationRecordsObserver:(id)a3
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLInvitationRecordsDidChangeNotification"), 0);
}

- (void)addCloudFeedEntriesObserver:(id)a3
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_cloudFeedEntriesDidChange_, CFSTR("PLCloudFeedEntriesDidChangeNotification"), 0);
}

- (void)removeCloudFeedEntriesObserver:(id)a3
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLCloudFeedEntriesDidChangeNotification"), 0);
}

- (void)addAssetChangeObserver:(id)a3
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_assetsDidChange_, CFSTR("PLAssetsDidChangeNotification"), 0);
}

- (void)removeAssetChangeObserver:(id)a3
{
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", a3, CFSTR("PLAssetsDidChangeNotification"), 0);
}

- (void)addShouldReloadObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_shouldReload_, CFSTR("PLPhotoLibraryShouldReload"), 0);

}

- (void)removeShouldReloadObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", v4, CFSTR("PLPhotoLibraryShouldReload"), 0);

}

- (id)addObserverForName:(id)a3 object:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v13, v12, v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (void)removeObserver:(id)a3 name:(id)a4 object:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", v10, v9, v8);

}

- (void)processContextDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  PLManagedObjectContext *v9;
  PLManagedObjectContext *moc;
  PLManagedObjectContext *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  PLChangeHandlingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Transforming local %@ with %@", buf, 0x16u);

  }
  if (v4)
  {
    objc_msgSend(v4, "object");
    v9 = (PLManagedObjectContext *)objc_claimAutoreleasedReturnValue();
    moc = self->_moc;
    self->_moc = v9;

    v11 = self->_moc;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PLChangeNotificationCenter_processContextDidChangeNotification___block_invoke;
    v12[3] = &unk_1E3677C18;
    v12[4] = self;
    v13 = v4;
    -[NSManagedObjectContext pl_performBlockAndWait:](v11, "pl_performBlockAndWait:", v12);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &PLChangeNotificationCenterKVOContext)
  {
    if (!self->_isProcessingRemoteDidSave)
    {
      v13 = v11;
      if (!objc_msgSend(v13, "faultingState") && (objc_msgSend(v13, "isDeleted") & 1) == 0)
      {
        objc_msgSend(v13, "managedObjectContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC0]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if (v16)
            v17 = -[PLChangeNotificationCenter _takeSnapshotOfObject:](self, "_takeSnapshotOfObject:", v13);
        }
      }

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLChangeNotificationCenter;
    -[PLChangeNotificationCenter observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (id)_orderedRelationshipsOfInterestForObject:(id)a3
{
  id v3;
  int v4;
  id v5;
  void *v7;
  void *v8;

  v3 = a3;
  pl_dispatch_once();
  v4 = indexOfObjectEntity(v3);
  if (v4 >= 70)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLChangeNotificationCenter _orderedRelationshipsOfInterestForObject:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PLChangeNotificationCenter.m"), 445, CFSTR("Out of bounds."));

  }
  v5 = (id)_orderedRelationshipsOfInterestForObject__myKeys[v4];

  return v5;
}

- (id)_attributesOfInterestForObject:(id)a3
{
  id v3;
  id v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_dispatch_once();
  v4 = (id)_attributesOfInterestForObject__myKeys[(int)indexOfObjectEntity(v3)];

  return v4;
}

- (id)_toOneRelationshipsOfInterestForObject:(id)a3
{
  id v3;
  id v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_dispatch_once();
  v4 = (id)_toOneRelationshipsOfInterestForObject__myKeys[(int)indexOfObjectEntity(v3)];

  return v4;
}

- (void)enumerateIndexMappingCachesForObject:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  pl_dispatch_once();
  if (enumerateIndexMappingCachesForObject_withBlock__isIndexMappersDataOrigin[(int)indexOfObjectEntity(v7)])
    objc_msgSend(v7, "enumerateDerivedIndexMappers:", v6);

}

- (void)postShouldReloadNotificationWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  v5 = -[PLPhotoLibraryShouldReloadNotification initNotificationWithPhotoLibrary:]([PLPhotoLibraryShouldReloadNotification alloc], "initNotificationWithPhotoLibrary:", v7);
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotification:", v5);

  objc_autoreleasePoolPop(v4);
}

- (void)_sendNotificationsForSplitChanges
{
  NSObject *v3;
  void *v4;
  PLManagedObjectContext *moc;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLChangeNotificationCenter descriptionOfSplitChanges](self, "descriptionOfSplitChanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Change split into:\n%@", (uint8_t *)&v6, 0xCu);

  }
  -[PLChangeNotificationCenter _enqueuePhotoLibraryNotifications](self, "_enqueuePhotoLibraryNotifications");
  -[PLChangeNotificationCenter _enqueueAlbumNotifications](self, "_enqueueAlbumNotifications");
  -[PLChangeNotificationCenter _enqueueMomentChangeNotifications](self, "_enqueueMomentChangeNotifications");
  -[PLChangeNotificationCenter _enqueueAlbumListNotifications](self, "_enqueueAlbumListNotifications");
  -[PLChangeNotificationCenter _enqueueCloudCommentsNotifications](self, "_enqueueCloudCommentsNotifications");
  -[PLChangeNotificationCenter _enqueueCloudFeedEntriesChangeNotifications](self, "_enqueueCloudFeedEntriesChangeNotifications");
  -[PLChangeNotificationCenter _enqueueAssetChangeNotification](self, "_enqueueAssetChangeNotification");
  -[PLChangeNotificationCenter _cleanupState](self, "_cleanupState");
  moc = self->_moc;
  self->_moc = 0;

  -[PLChangeNotificationCenter _postEnqueuedNotifications](self, "_postEnqueuedNotifications");
}

- (void)_enqueuePhotoLibraryNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PLChangeList inserted](self->_changedAlbums, "inserted");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[PLManagedObjectContext photoLibrary](self->_moc, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLChangeList inserted](self->_changedAlbums, "inserted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    -[PLChangeList deleted](self->_changedAlbums, "deleted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v10;
    v12[0] = CFSTR("AddedItemsKey");
    v12[1] = CFSTR("DeletedItemsKey");
    -[PLChangeNotificationCenter _enqueueNotification:object:userInfoWithObjects:forKeys:count:](self, "_enqueueNotification:object:userInfoWithObjects:forKeys:count:", CFSTR("PLPhotoLibraryDidChangeNotification"), v6, v13, v12, 2);

    goto LABEL_5;
  }
  -[PLChangeList deleted](self->_changedAlbums, "deleted");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  if (!self->_isOverloaded)
    goto LABEL_6;
  -[PLManagedObjectContext photoLibrary](self->_moc, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLChangeNotificationCenter _enqueueNotification:object:userInfoWithObjects:forKeys:count:](self, "_enqueueNotification:object:userInfoWithObjects:forKeys:count:", CFSTR("PLPhotoLibraryDidChangeNotification"), v6, 0, 0, 0);
LABEL_5:

LABEL_6:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PLPhotoLibraryDidChangeNotification"), 0, 0, 1u);
}

- (void)_enqueueAlbumListNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedAlbumLists, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[PLChangeList updated](self->_changedAlbumLists, "updated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLContentChanges container](self->_albumListsContent, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (v6)
      {
        -[PLContentChanges container](self->_albumListsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setByAddingObjectsFromArray:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        -[PLContentChanges container](self->_albumListsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v6;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[PLContentChanges container](self->_albumListsContent, "container");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[PLContentChanges container](self->_albumListsContent, "container");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v17);

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v18 = 0;
            }
            else
            {
              -[PLContentChanges updatedContent](self->_albumListsContent, "updatedContent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectAtIndex:", v20);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          -[PLChangeNotificationCenter _snapshotForObject:](self, "_snapshotForObject:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLAssetContainerListChangeNotification notificationWithContainerList:snapshot:changedContainers:](PLAssetContainerListChangeNotification, "notificationWithContainerList:snapshot:changedContainers:", v17, v22, v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLChangeNotificationCenter _enqueueAssetContainerListChangeNotification:](self, "_enqueueAssetContainerListChangeNotification:", v23);

        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

LABEL_21:
    return;
  }
  -[PLContentChanges container](self->_albumListsContent, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  if (self->_isOverloaded)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = self->_overloadedObjects;
    v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v12);
          v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PLAssetContainerListChangeNotification notificationWithContainerList:snapshot:changedContainers:](PLAssetContainerListChangeNotification, "notificationWithContainerList:snapshot:changedContainers:", v28, 0, 0, (_QWORD)v30);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLChangeNotificationCenter _enqueueAssetContainerListChangeNotification:](self, "_enqueueAssetContainerListChangeNotification:", v29);

          }
        }
        v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }
    goto LABEL_21;
  }
}

- (void)_enqueueAlbumNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedAlbums, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[PLChangeList updated](self->_changedAlbums, "updated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLContentChanges container](self->_albumsContent, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (v6)
      {
        -[PLContentChanges container](self->_albumsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setByAddingObjectsFromArray:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        -[PLContentChanges container](self->_albumsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v12 = v6;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[PLChangeList updated](self->_changedAssets, "updated");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "allObjects");
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[PLContentChanges container](self->_albumsContent, "container");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v20)
              goto LABEL_21;
            -[PLContentChanges container](self->_albumsContent, "container");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "indexOfObjectIdenticalTo:", v17);

            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v20 = 0;
              goto LABEL_21;
            }
            -[PLContentChanges updatedContent](self->_albumsContent, "updatedContent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndex:", v22);
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v20 = (void *)v19;

LABEL_21:
          -[PLChangeNotificationCenter _snapshotForObject:](self, "_snapshotForObject:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v17, v23, v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLInvitationRecordsChangeNotification notificationWithAlbum:snapshot:](PLInvitationRecordsChangeNotification, "notificationWithAlbum:snapshot:", v17, v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLChangeNotificationCenter _enqueueAlbumChangeNotification:](self, "_enqueueAlbumChangeNotification:", v24);
          -[PLChangeNotificationCenter _enqueueInvitationRecordsChangeNotification:](self, "_enqueueInvitationRecordsChangeNotification:", v25);

        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v14);
    }

    goto LABEL_24;
  }
  -[PLContentChanges container](self->_albumsContent, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  if (self->_isOverloaded)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = self->_overloadedObjects;
    v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v34 != v28)
            objc_enumerationMutation(v12);
          v30 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v30, 0, 0, (_QWORD)v33);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLInvitationRecordsChangeNotification notificationWithAlbum:snapshot:](PLInvitationRecordsChangeNotification, "notificationWithAlbum:snapshot:", v30, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLChangeNotificationCenter _enqueueAlbumChangeNotification:](self, "_enqueueAlbumChangeNotification:", v31);
            -[PLChangeNotificationCenter _enqueueInvitationRecordsChangeNotification:](self, "_enqueueInvitationRecordsChangeNotification:", v32);

          }
        }
        v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v27);
    }
LABEL_24:

  }
}

- (void)_enqueueCloudCommentsNotifications
{
  PLChangeNotificationCenter *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  PLChangeNotificationCenter *v21;
  NSMutableSet *obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v2 = self;
  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_assetsWithCloudCommentChanges, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v2->_assetsWithCloudCommentChanges;
    v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v25;
      v7 = &off_1E3659000;
      *(_QWORD *)&v4 = 138544130;
      v20 = v4;
      v21 = v2;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v25 != v6)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[PLChangeNotificationCenter _snapshotForObject:](v2, "_snapshotForObject:", v9, v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7[194], "notificationWithAsset:snapshot:", v9, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          PLChangeHandlingGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(a2);
            v13 = v5;
            v14 = v6;
            v15 = v7;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "orderedLikeComments");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "count");
            *(_DWORD *)buf = v20;
            v29 = v16;
            v30 = 2114;
            v31 = v17;
            v32 = 2048;
            v33 = v19;
            v34 = 2112;
            v35 = v11;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: PLManagedAsset = %{public}@, like count = %tu, PLCloudCommentsChangeNotification = %@", buf, 0x2Au);

            v7 = v15;
            v6 = v14;
            v5 = v13;
            v2 = v21;
          }

          -[PLChangeNotificationCenter enqueueNotification:](v2, "enqueueNotification:", v11);
        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v5);
    }

  }
}

- (void)_enqueueCloudFeedEntriesChangeNotifications
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 isOverloaded;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  PLCloudFeedGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  PLCloudFeedGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[PLChangeList inserted](self->_changedCloudFeedEntries, "inserted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "inserted=%@", buf, 0xCu);

  }
  PLCloudFeedGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[PLChangeList updated](self->_changedCloudFeedEntries, "updated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "updated=%@", buf, 0xCu);

  }
  PLCloudFeedGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[PLChangeList deleted](self->_changedCloudFeedEntries, "deleted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "deleted=%@", buf, 0xCu);

  }
  PLCloudFeedGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    isOverloaded = self->_isOverloaded;
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = isOverloaded;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "_isOverloaded=%i", buf, 8u);
  }

  -[PLChangeList inserted](self->_changedCloudFeedEntries, "inserted");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    goto LABEL_14;
  -[PLChangeList updated](self->_changedCloudFeedEntries, "updated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {

LABEL_14:
LABEL_15:
    -[PLChangeList inserted](self->_changedCloudFeedEntries, "inserted");
    v16 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    -[PLChangeList updated](self->_changedCloudFeedEntries, "updated");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLChangeList deleted](self->_changedCloudFeedEntries, "deleted");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudFeedEntriesChangeNotification notificationWithInsertedEntries:updatedEntries:deletedEntries:](PLCloudFeedEntriesChangeNotification, "notificationWithInsertedEntries:updatedEntries:deletedEntries:", v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    if (v19)
    {
      -[PLChangeNotificationCenter enqueueNotification:](self, "enqueueNotification:", v19);
LABEL_18:

      return;
    }
    return;
  }
  -[PLChangeList deleted](self->_changedCloudFeedEntries, "deleted");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
    goto LABEL_15;
  if (self->_isOverloaded)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = self->_overloadedObjects;
    v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v27;
      while (2)
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v27 != v24)
            objc_enumerationMutation(v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PLCloudFeedEntriesChangeNotification notificationWithFullReload](PLCloudFeedEntriesChangeNotification, "notificationWithFullReload", v26);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_16;
          }
          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v23)
          continue;
        break;
      }
    }
    v19 = v16;
    goto LABEL_18;
  }
}

- (void)_enqueueMomentChangeNotifications
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedMoments, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    -[PLChangeList updated](self->_changedMoments, "updated");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLContentChanges container](self->_momentsContent, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      if (v6)
      {
        -[PLContentChanges container](self->_momentsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setByAddingObjectsFromArray:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C99E60];
        -[PLContentChanges container](self->_momentsContent, "container");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setWithArray:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v6;
    v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          -[PLContentChanges container](self->_momentsContent, "container");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[PLContentChanges container](self->_momentsContent, "container");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "indexOfObjectIdenticalTo:", v17);

            if (v20 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v18 = 0;
            }
            else
            {
              -[PLContentChanges updatedContent](self->_momentsContent, "updatedContent");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectAtIndex:", v20);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

            }
          }
          -[PLChangeNotificationCenter _snapshotForObject:](self, "_snapshotForObject:", v17);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v17, v22, v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLChangeNotificationCenter _enqueueAssetContainerChangeNotification:](self, "_enqueueAssetContainerChangeNotification:", v23);

        }
        v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

LABEL_21:
    return;
  }
  -[PLContentChanges container](self->_momentsContent, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    goto LABEL_4;
  if (self->_isOverloaded)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v12 = self->_overloadedObjects;
    v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v12);
          v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[PLAssetContainerChangeNotification notificationWithContainer:snapshot:changedAssets:](PLAssetContainerChangeNotification, "notificationWithContainer:snapshot:changedAssets:", v28, 0, 0, (_QWORD)v30);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLChangeNotificationCenter _enqueueAssetContainerChangeNotification:](self, "_enqueueAssetContainerChangeNotification:", v29);

          }
        }
        v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v25);
    }
    goto LABEL_21;
  }
}

- (void)_enqueueAssetChangeNotification
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedAssets, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PLChangeList updated](self->_changedAssets, "updated");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAssetChangeNotification notificationWithChangedAssets:](PLAssetChangeNotification, "notificationWithChangedAssets:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[PLChangeNotificationCenter enqueueNotification:](self, "enqueueNotification:", v14);
  }
  else if (self->_isOverloaded)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = self->_overloadedObjects;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (objc_msgSend(v6, "count"))
    {
      +[PLAssetChangeNotification notificationWithChangedAssets:](PLAssetChangeNotification, "notificationWithChangedAssets:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLChangeNotificationCenter enqueueNotification:](self, "enqueueNotification:", v13);

    }
  }
}

- (void)_cleanupState
{
  NSMutableSet *assetsWithCloudCommentChanges;
  NSMutableArray *snapshots;

  -[PLChangeList cleanupState](self->_changedAlbumLists, "cleanupState");
  -[PLChangeList cleanupState](self->_changedAlbums, "cleanupState");
  -[PLChangeList cleanupState](self->_changedAssets, "cleanupState");
  assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
  self->_assetsWithCloudCommentChanges = 0;

  -[PLChangeList cleanupState](self->_changedMoments, "cleanupState");
  -[PLContentChanges cleanupState](self->_albumsContent, "cleanupState");
  -[PLContentChanges cleanupState](self->_albumListsContent, "cleanupState");
  -[PLContentChanges cleanupState](self->_momentsContent, "cleanupState");
  -[PLChangeList cleanupState](self->_changedCloudFeedEntries, "cleanupState");
  snapshots = self->_snapshots;
  self->_snapshots = 0;

}

- (void)_splitContextDidChangeNotification:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  id v17;
  id v18;
  id *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  PLChangeNotificationCenter *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *context;
  id obj;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  PLChangeList **p_changedAlbums;
  PLChangeList **p_changedAssets;
  PLChangeList **p_changedCloudFeedEntries;
  PLChangeList **p_changedMoments;
  uint64_t v64;
  PLChangeNotificationCenter *v65;
  id v66;
  PLChangeList **p_changedAlbumLists;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  context = (void *)MEMORY[0x19AEC1554]();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  +[PLManagedObjectContext changeNotificationObjectKeys](PLManagedObjectContext, "changeNotificationObjectKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v65 = self;
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v78;
    v4 = (void *)*MEMORY[0x1E0C97A20];
    v54 = (void *)*MEMORY[0x1E0C979A8];
    v53 = (void *)*MEMORY[0x1E0C97890];
    p_changedCloudFeedEntries = &self->_changedCloudFeedEntries;
    p_changedMoments = &self->_changedMoments;
    p_changedAlbums = &self->_changedAlbums;
    p_changedAssets = &self->_changedAssets;
    p_changedAlbumLists = &self->_changedAlbumLists;
    v64 = *MEMORY[0x1E0C97878];
    v59 = *MEMORY[0x1E0C97840];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v78 != v55)
          objc_enumerationMutation(obj);
        v58 = v5;
        v6 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v5);
        v9 = v6 == v4 || v6 == v54 || v6 == v53;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        objc_msgSend(v56, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v66 = v11;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v74 != v14)
                objc_enumerationMutation(v66);
              v16 = *(id *)(*((_QWORD *)&v73 + 1) + 8 * i);
              if (v6 != v4
                || -[PLChangeNotificationCenter _isInterestedInUpdatesOfObject:](self, "_isInterestedInUpdatesOfObject:", v16))
              {
                if (v9 && self->_isProcessingRemoteDidSave)
                  v17 = -[PLChangeNotificationCenter _takeSnapshotFromCommittedValuesOfObject:](self, "_takeSnapshotFromCommittedValuesOfObject:", v16);
                v18 = v6;
                v20 = entityKindOfObject(v16) - 2;
                v19 = (id *)p_changedAlbumLists;
                switch(v20)
                {
                  case 0:
                    goto LABEL_30;
                  case 1:
                    v19 = (id *)p_changedAlbums;
                    goto LABEL_30;
                  case 2:
                    v19 = (id *)p_changedAssets;
                    goto LABEL_30;
                  case 3:
                  case 4:
                    v19 = (id *)p_changedMoments;
                    goto LABEL_30;
                  case 5:
                    v19 = (id *)p_changedCloudFeedEntries;
LABEL_30:
                    v21 = *v19;
                    if (!v21)
                      goto LABEL_44;
                    v22 = v21;
                    if (objc_msgSend(v18, "isEqualToString:", v64))
                    {
                      objc_msgSend(v22, "inserted");
                      v23 = (id)objc_claimAutoreleasedReturnValue();
                      if (v23)
                        goto LABEL_42;
                      v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                      objc_msgSend(v22, "setInserted:", v23);
                      if (v23)
                        goto LABEL_42;
                    }
                    else if (v9)
                    {
                      objc_msgSend(v22, "updated");
                      v23 = (id)objc_claimAutoreleasedReturnValue();
                      if (v23)
                        goto LABEL_42;
                      v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                      objc_msgSend(v22, "setUpdated:", v23);
                      if (v23)
                        goto LABEL_42;
                    }
                    else if (objc_msgSend(v18, "isEqualToString:", v59))
                    {
                      objc_msgSend(v22, "deleted");
                      v23 = (id)objc_claimAutoreleasedReturnValue();
                      if (v23
                        || (v23 = objc_alloc_init(MEMORY[0x1E0C99E20]), objc_msgSend(v22, "setDeleted:", v23), v23))
                      {
LABEL_42:
                        objc_msgSend(v23, "addObject:", v16);

                      }
                    }

                    self = v65;
LABEL_44:

                    break;
                  default:
                    goto LABEL_44;
                }
              }

            }
            v13 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
          }
          while (v13);
        }

        v5 = v58 + 1;
      }
      while (v58 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v83, 16);
    }
    while (v57);
  }

  v24 = self;
  if (!-[PLChangeNotificationCenter _shouldForceFetchingAlbumsToReload](self, "_shouldForceFetchingAlbumsToReload"))
  {
    -[PLChangeList inserted](self->_changedAssets, "inserted");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v25, "count"))
    {
      -[PLChangeList updated](self->_changedAssets, "updated");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v26, "count"))
      {
        -[PLChangeList deleted](self->_changedAssets, "deleted");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");

        if (!v50)
          goto LABEL_74;
        goto LABEL_54;
      }

    }
  }
LABEL_54:
  +[PLGenericAlbum allAlbumsRegisteredWithManagedObjectContext:](PLFetchingAlbum, "allAlbumsRegisteredWithManagedObjectContext:", v24->_moc);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v68 = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v70 != v29)
          objc_enumerationMutation(v68);
        v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
        if (objc_msgSend(v31, "hasAssetsCache"))
        {
          objc_msgSend(v31, "fetchRequest");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "predicate");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLChangeList inserted](v65->_changedAssets, "inserted");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "filteredSetUsingPredicate:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "count");

          if (v36)
            goto LABEL_64;
          -[PLChangeList deleted](v65->_changedAssets, "deleted");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v31, "mayHaveAssetsInCommon:", v37);

          if ((v38 & 1) != 0)
            goto LABEL_64;
          -[PLChangeList updated](v65->_changedAssets, "updated");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v31, "mayHaveAssetsInCommon:", v39);

          if ((v40 & 1) != 0
            || (-[PLChangeList updated](v65->_changedAssets, "updated"),
                v41 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v41, "filteredSetUsingPredicate:", v33),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                v43 = objc_msgSend(v42, "count"),
                v42,
                v41,
                v43))
          {
LABEL_64:
            -[PLChangeList updated](v65->_changedAlbums, "updated");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v44)
            {
              v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
              -[PLChangeList setUpdated:](v65->_changedAlbums, "setUpdated:", v45);

            }
            -[PLChangeList updated](v65->_changedAlbums, "updated");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v31);

            -[PLChangeNotificationCenter _takeSnapshotOfObject:](v65, "_takeSnapshotOfObject:", v31);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v47, "hasSnapshotValueForProperty:", CFSTR("assets")))
              v48 = 0;
            else
              v48 = v47;
            objc_msgSend(v31, "updateSnapshotAndClearCaches:", v48);

          }
        }
      }
      v28 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
    }
    while (v28);
  }

  v24 = v65;
LABEL_74:
  -[PLChangeNotificationCenter _evaluateContainersWithUpdatedContent](v24, "_evaluateContainersWithUpdatedContent");
  -[PLChangeNotificationCenter _evaluateUpdatedAssets](v24, "_evaluateUpdatedAssets");
  objc_autoreleasePoolPop(context);

}

- (void)_evaluateContainersWithUpdatedContent
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  id obj;
  id obja;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedAssets, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    v5 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3880];
    -[PLChangeList updated](self->_changedAssets, "updated");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("self IN %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", &unk_1E37638D8);
    v11 = -[PLManagedObjectContext executeFetchRequest:error:](self->_moc, "executeFetchRequest:error:", v7, 0);

  }
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  -[PLChangeList updated](self->_changedAssets, "updated");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
  if (v91)
  {
    v89 = *(_QWORD *)v118;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v118 != v89)
          objc_enumerationMutation(obj);
        v94 = v12;
        v13 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v12);
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        objc_msgSend(v13, "albums");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v114;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v114 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
              if (objc_msgSend(v19, "isFault"))
              {
                -[PLChangeList updated](self->_changedAlbums, "updated");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "containsObject:", v19))
                {

                }
                else
                {
                  v21 = objc_msgSend(v19, "hasDerivedIndexMappers");

                  if (!v21)
                    continue;
                }
              }
              if ((objc_msgSend(v19, "isFault") & 1) == 0)
                v22 = -[PLChangeNotificationCenter _takeSnapshotOfObject:](self, "_takeSnapshotOfObject:", v19);
              -[PLContentChanges container](self->_albumsContent, "container");
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v23)
              {
                v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                -[PLContentChanges setContainer:](self->_albumsContent, "setContainer:", v24);

                v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                -[PLContentChanges setUpdatedContent:](self->_albumsContent, "setUpdatedContent:", v25);

              }
              -[PLContentChanges container](self->_albumsContent, "container");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "indexOfObjectIdenticalTo:", v19);

              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                -[PLContentChanges container](self->_albumsContent, "container");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v28, "count");

                -[PLContentChanges container](self->_albumsContent, "container");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "addObject:", v19);

                -[PLContentChanges updatedContent](self->_albumsContent, "updatedContent");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v31);

              }
              -[PLContentChanges updatedContent](self->_albumsContent, "updatedContent");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectAtIndex:", v27);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "addObject:", v13);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
          }
          while (v16);
        }

        v12 = v94 + 1;
      }
      while (v94 + 1 != v91);
      v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    }
    while (v91);
  }

  -[PLChangeList updated](self->_changedAlbums, "updated");
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obja = (id)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
  if (v92)
  {
    v90 = *(_QWORD *)v110;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v110 != v90)
          objc_enumerationMutation(obja);
        v95 = v34;
        v35 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v34);
        v105 = 0u;
        v106 = 0u;
        v107 = 0u;
        v108 = 0u;
        objc_msgSend(v35, "albumLists");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v106;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v106 != v39)
                objc_enumerationMutation(v36);
              v41 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
              if (!objc_msgSend(v41, "isFault")
                || objc_msgSend(v41, "hasDerivedIndexMappers"))
              {
                v42 = -[PLChangeNotificationCenter _takeSnapshotOfObject:](self, "_takeSnapshotOfObject:", v41);
                -[PLContentChanges container](self->_albumListsContent, "container");
                v43 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v43)
                {
                  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  -[PLContentChanges setContainer:](self->_albumListsContent, "setContainer:", v44);

                  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  -[PLContentChanges setUpdatedContent:](self->_albumListsContent, "setUpdatedContent:", v45);

                }
                -[PLContentChanges container](self->_albumListsContent, "container");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v47 = objc_msgSend(v46, "indexOfObjectIdenticalTo:", v41);

                if (v47 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  -[PLContentChanges container](self->_albumListsContent, "container");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v48, "count");

                  -[PLContentChanges container](self->_albumListsContent, "container");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "addObject:", v41);

                  -[PLContentChanges updatedContent](self->_albumListsContent, "updatedContent");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "addObject:", v51);

                }
                -[PLContentChanges updatedContent](self->_albumListsContent, "updatedContent");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectAtIndex:", v47);
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v53, "addObject:", v35);
              }
            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v123, 16);
          }
          while (v38);
        }

        v34 = v95 + 1;
      }
      while (v95 + 1 != v92);
      v92 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
    }
    while (v92);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[PLChangeList updated](self->_changedAssets, "updated");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v56; ++k)
      {
        if (*(_QWORD *)v102 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
        objc_msgSend(v59, "moment");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (v60)
        {
          if (!objc_msgSend(v60, "isFault")
            || (-[PLChangeList updated](self->_changedMoments, "updated"),
                v62 = (void *)objc_claimAutoreleasedReturnValue(),
                v63 = objc_msgSend(v62, "containsObject:", v61),
                v62,
                v63))
          {
            if ((objc_msgSend(v61, "isFault") & 1) == 0)
              v64 = -[PLChangeNotificationCenter _takeSnapshotOfObject:](self, "_takeSnapshotOfObject:", v61);
            -[PLContentChanges container](self->_momentsContent, "container");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v65)
            {
              v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[PLContentChanges setContainer:](self->_momentsContent, "setContainer:", v66);

              v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              -[PLContentChanges setUpdatedContent:](self->_momentsContent, "setUpdatedContent:", v67);

            }
            -[PLContentChanges container](self->_momentsContent, "container");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "indexOfObjectIdenticalTo:", v61);

            if (v69 == 0x7FFFFFFFFFFFFFFFLL)
            {
              -[PLContentChanges container](self->_momentsContent, "container");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v70, "count");

              -[PLContentChanges container](self->_momentsContent, "container");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "addObject:", v61);

              -[PLContentChanges updatedContent](self->_momentsContent, "updatedContent");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObject:", v73);

            }
            -[PLContentChanges updatedContent](self->_momentsContent, "updatedContent");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectAtIndex:", v69);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v75, "addObject:", v59);
          }
        }

      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v101, v122, 16);
    }
    while (v56);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[PLContentChanges container](self->_momentsContent, "container");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
  if (v77)
  {
    v78 = v77;
    v79 = *(_QWORD *)v98;
    v93 = 0;
    v96 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v78; ++m)
      {
        if (*(_QWORD *)v98 != v79)
          objc_enumerationMutation(v76);
        v81 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[PLChangeList updated](self->_changedMoments, "updated");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v82, "containsObject:", v81))
          {

          }
          else
          {
            v83 = v76;
            -[PLChangeList updated](self->_changedAssets, "updated");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "bestAsset");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v84, "containsObject:", v85);

            if (v86)
            {
              if (v93)
              {
                objc_msgSend(v93, "addObject:", v81);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v81);
                v93 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            v76 = v83;
            v79 = v96;
          }
        }
      }
      v78 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
    }
    while (v78);
  }
  else
  {
    v93 = 0;
  }

}

- (void)_evaluateUpdatedAssets
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMutableSet *assetsWithCloudCommentChanges;
  NSMutableSet *v19;
  NSMutableSet *v20;
  id obj;
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
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PLChangeList updated](self->_changedAssets, "updated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("cloudComments"), CFSTR("likeComments"), CFSTR("cloudHasUnseenComments"), CFSTR("cloudHasCommentsByMe"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[PLChangeList updated](self->_changedAssets, "updated");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (self->_isProcessingRemoteDidSave)
          {
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "isCloudSharedAsset") & 1) != 0)
            {
LABEL_20:
              assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
              if (!assetsWithCloudCommentChanges)
              {
                v19 = (NSMutableSet *)objc_opt_new();
                v20 = self->_assetsWithCloudCommentChanges;
                self->_assetsWithCloudCommentChanges = v19;

                assetsWithCloudCommentChanges = self->_assetsWithCloudCommentChanges;
              }
              -[NSMutableSet addObject:](assetsWithCloudCommentChanges, "addObject:", v10);
            }
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "changedValuesForCurrentEvent");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "allKeys");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v23;
              while (2)
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v23 != v16)
                    objc_enumerationMutation(v13);
                  if ((objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j)) & 1) != 0)
                  {

                    goto LABEL_20;
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v15)
                  continue;
                break;
              }
            }

          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }

  }
}

- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfo:(id)a5
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLChangeNotificationCenter enqueueNotification:](self, "enqueueNotification:", v6);

}

- (void)_enqueueNotification:(id)a3 object:(id)a4 userInfoWithObjects:(const void *)a5 forKeys:(const void *)a6 count:(unint64_t)a7
{
  id v12;
  id v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (a7)
  {
    v19[0] = v19;
    v14 = 8 * a7;
    v15 = (char *)v19 - ((8 * a7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v15, 8 * a7);
    bzero(v15, 8 * a7);
    v16 = 0;
    do
    {
      if (*a5 && *a6)
      {
        objc_storeStrong((id *)&v15[8 * v16], (id)*a5);
        objc_storeStrong((id *)&v15[8 * v16++], (id)*a6);
      }
      ++a6;
      ++a5;
      --a7;
    }
    while (a7);
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v15, v16);
      a7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a7 = 0;
    }
    v17 = v14;
    do
    {

      v17 -= 8;
    }
    while (v17);
    v18 = v15 - 8;
    do
    {

      v14 -= 8;
    }
    while (v14);
  }
  -[PLChangeNotificationCenter _enqueueNotification:object:userInfo:](self, "_enqueueNotification:object:userInfo:", v12, v13, a7);

}

- (void)_postEnqueuedNotifications
{
  NSMutableArray *i;
  void *v4;
  void *v5;
  NSMutableArray *enqueuedNotifications;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  for (i = self->_enqueuedNotifications; -[NSMutableArray count](i, "count"); i = self->_enqueuedNotifications)
  {
    v4 = (void *)MEMORY[0x19AEC1554]();
    v5 = (void *)-[NSMutableArray copy](self->_enqueuedNotifications, "copy");
    enqueuedNotifications = self->_enqueuedNotifications;
    self->_enqueuedNotifications = 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x19AEC1554]();
          -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "postNotification:", v12);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_autoreleasePoolPop(v4);
  }
  -[PLChangeNotificationCenter backingCenter](self, "backingCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", CFSTR("PLChangeNotificationCenterDidFinishPostingNotifications"), self);

}

- (BOOL)_isInterestedInUpdatesOfObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  PLInterest *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v28;
  void *context;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "changedValuesForCurrentEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = indexOfObjectEntity(v5);
  v9 = (PLInterest *)_isInterestedInUpdatesOfObject__myInterests[v8];
  if (!v9)
  {
    v9 = objc_alloc_init(PLInterest);
    v10 = _isInterestedInUpdatesOfObject__myInterests[v8];
    _isInterestedInUpdatesOfObject__myInterests[v8] = v9;

  }
  -[PLInterest allKeysMappingStrategy](v9, "allKeysMappingStrategy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    context = (void *)MEMORY[0x19AEC1554]();
    -[PLChangeNotificationCenter _keysOfInterestForObject:](self, "_keysOfInterestForObject:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v13, "count") >= 0x40)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLChangeNotificationCenter.m"), 1218, CFSTR("Not enough bits in bit mask."));

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B78]), "initForKeys:", v13);
    -[PLInterest setAllKeysMappingStrategy:](v9, "setAllKeysMappingStrategy:", v14);
    -[PLInterest setIndexesOfInterest:](v9, "setIndexesOfInterest:", 0);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = objc_msgSend(v14, "indexForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            -[PLInterest setIndexesOfInterest:](v9, "setIndexesOfInterest:", -[PLInterest indexesOfInterest](v9, "indexesOfInterest") | (1 << v20));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
  }
  -[PLInterest allKeysMappingStrategy](v9, "allKeysMappingStrategy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = v7;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v31;
    while (2)
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(v22);
        v26 = objc_msgSend(v21, "indexForKey:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
        if (v26 != 0x7FFFFFFFFFFFFFFFLL && ((-[PLInterest indexesOfInterest](v9, "indexesOfInterest") >> v26) & 1) != 0)
        {
          LOBYTE(v23) = 1;
          goto LABEL_27;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v23)
        continue;
      break;
    }
  }
LABEL_27:

  return v23;
}

- (id)_keysOfInterestForObject:(id)a3
{
  int v3;

  v3 = entityKindOfObject(a3);
  return _keysOfInterestForEntityKind(v3);
}

- (id)descriptionOfSplitChanges
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke;
  v14[3] = &unk_1E3666DC8;
  v5 = v3;
  v15 = v5;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v14);
  ((void (**)(_QWORD, const __CFString *, PLChangeList *))v6)[2](v6, CFSTR("album list(s)"), self->_changedAlbumLists);
  ((void (**)(_QWORD, const __CFString *, PLChangeList *))v6)[2](v6, CFSTR("album(s)"), self->_changedAlbums);
  ((void (**)(_QWORD, const __CFString *, PLChangeList *))v6)[2](v6, CFSTR("asset(s)"), self->_changedAssets);
  -[PLContentChanges container](self->_albumsContent, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_3;
  v12[3] = &unk_1E3666DF0;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

- (id)_snapshotForObject:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_snapshots;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "managedObject", (_QWORD)v12);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_takeSnapshotsFromContext:(id)a3 forRemoteContextSaveNotification:(id)a4 usingObjectIDs:(BOOL)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v23 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  +[PLManagedObjectContext changeNotificationObjectIDKeys](PLManagedObjectContext, "changeNotificationObjectIDKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v23, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
              if (a5)
              {
                objc_msgSend(v8, "objectRegisteredForID:", v17);
                v18 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v18 = v17;
              }
              v19 = v18;
              v20 = -[PLChangeNotificationCenter _takeSnapshotOfObject:](self, "_takeSnapshotOfObject:", v18);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v14);
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v9 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v24);
  }

}

- (id)_takeSnapshotOfObject:(id)a3
{
  return -[PLChangeNotificationCenter _takeSnapshotOfObject:useCommitedValues:](self, "_takeSnapshotOfObject:useCommitedValues:", a3, 0);
}

- (id)_takeSnapshotFromCommittedValuesOfObject:(id)a3
{
  return -[PLChangeNotificationCenter _takeSnapshotOfObject:useCommitedValues:](self, "_takeSnapshotOfObject:useCommitedValues:", a3, 1);
}

- (id)_takeSnapshotOfObject:(id)a3 useCommitedValues:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *snapshots;
  NSMutableArray *v17;
  NSMutableArray *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isFault") & 1) == 0)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_snapshots;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v14, "managedObject", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v7)
          {
            v8 = v14;

            goto LABEL_17;
          }
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
    }

    +[PLObjectSnapshot snapshotForManagedObject:changeNotificationCenter:useCommitedValues:](PLObjectSnapshot, "snapshotForManagedObject:changeNotificationCenter:useCommitedValues:", v7, self, v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      snapshots = self->_snapshots;
      if (!snapshots)
      {
        v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v18 = self->_snapshots;
        self->_snapshots = v17;

        snapshots = self->_snapshots;
      }
      -[NSMutableArray addObject:](snapshots, "addObject:", v8, (_QWORD)v20);
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_17:

  return v8;
}

- (BOOL)_shouldForceFetchingAlbumsToReload
{
  uint32_t state;
  uint32_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  pl_dispatch_once();
  state = notify_get_state(forceFetchingAlbumReloadToken_token, &state64);
  if (state)
  {
    v3 = state;
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v9 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "notify_get_state() failed for fetching album reload. (%u)", buf, 8u);
    }

    LOBYTE(v5) = 0;
  }
  else
  {
    v5 = _shouldForceFetchingAlbumsToReload_oldState != state64;
    _shouldForceFetchingAlbumsToReload_oldState = state64;
  }
  return v5;
}

- (void)managedObjectContextWillBeOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5
{
  id v8;
  NSMutableSet *v9;
  NSMutableSet *overloadedObjects;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id obj;
  uint64_t v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30 = a4;
  self->_isOverloaded = 1;
  self->_isProcessingRemoteDidSave = 1;
  v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  overloadedObjects = self->_overloadedObjects;
  self->_overloadedObjects = v9;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  +[PLManagedObjectContext changeNotificationObjectKeys](PLManagedObjectContext, "changeNotificationObjectKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x19AEC1554]();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v30, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v37 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
              if (a5)
              {
                objc_msgSend(v8, "objectRegisteredForID:", v19);
                v20 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v20 = v19;
              }
              v21 = v20;
              if (v20)
                -[NSMutableSet addObject:](self->_overloadedObjects, "addObject:", v20);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v16);
        }

        objc_autoreleasePoolPop(v13);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v31);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v8, "registeredObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "refreshObject:mergeChanges:", v27, objc_msgSend(v27, "hasChanges"));
          -[NSMutableSet addObject:](self->_overloadedObjects, "addObject:", v27);
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
    }
    while (v24);
  }

}

- (void)managedObjectContextWasOverloaded:(id)a3 withNotificationData:(id)a4 usingObjectIDs:(BOOL)a5
{
  NSMutableSet *overloadedObjects;
  id v8;

  v8 = a3;
  if (!self->_moc)
    objc_storeStrong((id *)&self->_moc, a3);
  -[PLChangeNotificationCenter _sendNotificationsForSplitChanges](self, "_sendNotificationsForSplitChanges");
  overloadedObjects = self->_overloadedObjects;
  self->_overloadedObjects = 0;

  self->_isOverloaded = 0;
  self->_isProcessingRemoteDidSave = 0;

}

- (void)managedObjectContext:(id)a3 willProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5 isCoalescedEvent:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  NSDictionary *remoteNotificationData;
  id v15;

  v6 = a6;
  v7 = a5;
  self->_isProcessingRemoteDidSave = 1;
  v10 = a4;
  v15 = a3;
  v11 = (NSDictionary *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v12, CFSTR("usingObjectIDs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](v11, "setObject:forKey:", v13, CFSTR("coalescedEvent"));

  remoteNotificationData = self->_remoteNotificationData;
  self->_remoteNotificationData = v11;

  -[PLChangeNotificationCenter _takeSnapshotsFromContext:forRemoteContextSaveNotification:usingObjectIDs:](self, "_takeSnapshotsFromContext:forRemoteContextSaveNotification:usingObjectIDs:", v15, v10, v7);
}

- (void)managedObjectContext:(id)a3 didProcessRemoteContextSave:(id)a4 usingObjectIDs:(BOOL)a5
{
  NSDictionary *remoteNotificationData;

  objc_msgSend(a3, "processPendingChanges");
  -[PLChangeNotificationCenter _sendNotificationsForSplitChanges](self, "_sendNotificationsForSplitChanges");
  self->_isProcessingRemoteDidSave = 0;
  remoteNotificationData = self->_remoteNotificationData;
  self->_remoteNotificationData = 0;

}

- (void)_registerForCameraPreviewWellChanges
{
  PLChangeNotificationCenter *v2;
  int v3;
  NSObject *p_super;
  uint64_t v5;
  uint64_t v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  ++v2->_cameraPreviewChangeListenerCount;
  if (!v2->_cameraPreviewChangedToken)
  {
    v6 = MEMORY[0x1E0C809B0];
    v3 = pl_notify_register_dispatch();
    if (v3)
    {
      PLBackendGetLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v8 = v3;
        _os_log_impl(&dword_199541000, p_super, OS_LOG_TYPE_ERROR, "failed to register for camera preview image well changed notification: %u", buf, 8u);
      }
    }
    else
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0, v6, 3221225472, __66__PLChangeNotificationCenter__registerForCameraPreviewWellChanges__block_invoke, &unk_1E36683C0, v2);
      p_super = &v2->_cameraPreviewChangedToken->super.super;
      v2->_cameraPreviewChangedToken = (NSNumber *)v5;
    }

  }
  objc_sync_exit(v2);

}

- (void)_unregisterForCameraPreviewWellChanges
{
  PLChangeNotificationCenter *v2;
  NSNumber *cameraPreviewChangedToken;
  NSObject *v4;
  uint8_t v5[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_cameraPreviewChangeListenerCount == 1)
  {
    notify_cancel(-[NSNumber intValue](v2->_cameraPreviewChangedToken, "intValue"));
    cameraPreviewChangedToken = v2->_cameraPreviewChangedToken;
    v2->_cameraPreviewChangedToken = 0;

  }
  if (-[NSNumber integerValue](v2->_cameraPreviewChangedToken, "integerValue") < 1)
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "too many attempts to unregister from camera preview well changes, ignoring", v5, 2u);
    }

  }
  else
  {
    --v2->_cameraPreviewChangeListenerCount;
  }
  objc_sync_exit(v2);

}

- (void)addCameraPreviewWellImageChangeObserver:(id)a3
{
  -[PLChangeNotificationCenter addObserver:selector:name:object:](self, "addObserver:selector:name:object:", a3, sel_cameraPreviewWellImageDidChange_, CFSTR("PLCameraPreviewImageWellChanged"), 0);
  -[PLChangeNotificationCenter _registerForCameraPreviewWellChanges](self, "_registerForCameraPreviewWellChanges");
}

- (id)observeCameraPreviewWellImageChangeOnQueue:(id)a3 block:(id)a4
{
  void *v5;

  -[PLChangeNotificationCenter addObserverForName:object:queue:usingBlock:](self, "addObserverForName:object:queue:usingBlock:", CFSTR("PLCameraPreviewImageWellChanged"), 0, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLChangeNotificationCenter _registerForCameraPreviewWellChanges](self, "_registerForCameraPreviewWellChanges");
  return v5;
}

- (void)removeCameraPreviewWellImageChangeObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[PLChangeNotificationCenter _unregisterForCameraPreviewWellChanges](self, "_unregisterForCameraPreviewWellChanges");
  -[PLChangeNotificationCenter removeObserver:name:object:](self, "removeObserver:name:object:", v4, CFSTR("PLCameraPreviewImageWellChanged"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overloadedObjects, 0);
  objc_storeStrong((id *)&self->_remoteNotificationData, 0);
  objc_storeStrong((id *)&self->_enqueuedNotifications, 0);
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_changedCloudFeedEntries, 0);
  objc_storeStrong((id *)&self->_changedMoments, 0);
  objc_storeStrong((id *)&self->_momentsContent, 0);
  objc_storeStrong((id *)&self->_assetsWithCloudCommentChanges, 0);
  objc_storeStrong((id *)&self->_changedAssets, 0);
  objc_storeStrong((id *)&self->_albumsContent, 0);
  objc_storeStrong((id *)&self->_changedAlbums, 0);
  objc_storeStrong((id *)&self->_albumListsContent, 0);
  objc_storeStrong((id *)&self->_changedAlbumLists, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_notificationHandlingQueue, 0);
  objc_storeStrong((id *)&self->_cameraPreviewChangedToken, 0);
}

void __66__PLChangeNotificationCenter__registerForCameraPreviewWellChanges__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[PLCameraPreviewImageWellChangeNotification notification](PLCameraPreviewImageWellChangeNotification, "notification");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backingCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification:", v3);

}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v5 = a2;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_2;
  v15 = &unk_1E3666DA0;
  v16 = *(id *)(a1 + 32);
  v17 = v5;
  v6 = v5;
  v7 = a3;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](&v12);
  objc_msgSend(v7, "inserted", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("inserted"), v9);

  objc_msgSend(v7, "updated");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("updated"), v10);

  objc_msgSend(v7, "deleted");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, const __CFString *, void *))v8)[2](v8, CFSTR("deleted"), v11);
}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "updatedContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    v20 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "URIRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v17 = *(void **)(a1 + 40);
    v5 = v20;
    objc_msgSend(v20, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendFormat:", CFSTR("album %@ has updated assets: { %@ }\n"), v18, v19);

  }
}

void __55__PLChangeNotificationCenter_descriptionOfSplitChanges__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v19 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v12), "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "URIRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v16 = *(void **)(v19 + 32);
    v17 = *(_QWORD *)(v19 + 40);
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendFormat:", CFSTR("%@ %@: { %@ }\n"), v5, v17, v18);

  }
}

uint64_t __77__PLChangeNotificationCenter_enumerateIndexMappingCachesForObject_withBlock___block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t result;
  void *v4;
  NSString *v5;
  void *v6;

  for (i = 0; ; ++i)
  {
    result = objectEntitiesCount(*(void **)(a1 + 32));
    if (i >= (int)result)
      break;
    entityAtIndex(i, *(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "managedObjectClassName");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[objc_class instanceMethodSignatureForSelector:](NSClassFromString(v5), "instanceMethodSignatureForSelector:", sel_enumerateDerivedIndexMappers_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      enumerateIndexMappingCachesForObject_withBlock__isIndexMappersDataOrigin[i] = 1;

  }
  return result;
}

void __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  while (v2 < (int)objectEntitiesCount(*(void **)(a1 + 32)))
  {
    objc_msgSend(v12, "removeAllObjects");
    v4 = entityKindAtEntityIndex(v2, *(void **)(a1 + 32));
    _keysOfInterestForEntityKind(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    entityAtIndex(v2, *(void **)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relationshipsByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke_2;
    v13[3] = &unk_1E366AE50;
    v8 = v5;
    v14 = v8;
    v9 = v12;
    v15 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_msgSend(v9, "copy");
      v11 = (void *)_toOneRelationshipsOfInterestForObject__myKeys[v2];
      _toOneRelationshipsOfInterestForObject__myKeys[v2] = v10;

    }
    ++v2;
  }

}

void __69__PLChangeNotificationCenter__toOneRelationshipsOfInterestForObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) && objc_msgSend(v5, "maxCount") == 1)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  while (v2 < (int)objectEntitiesCount(*(void **)(a1 + 32)))
  {
    objc_msgSend(v12, "removeAllObjects");
    v4 = entityKindAtEntityIndex(v2, *(void **)(a1 + 32));
    _keysOfInterestForEntityKind(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    entityAtIndex(v2, *(void **)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributesByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke_2;
    v13[3] = &unk_1E366AE50;
    v8 = v5;
    v14 = v8;
    v9 = v12;
    v15 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_msgSend(v9, "copy");
      v11 = (void *)_attributesOfInterestForObject__myKeys[v2];
      _attributesOfInterestForObject__myKeys[v2] = v10;

    }
    ++v2;
  }

}

void __61__PLChangeNotificationCenter__attributesOfInterestForObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  while (v2 < (int)objectEntitiesCount(*(void **)(a1 + 32)))
  {
    objc_msgSend(v12, "removeAllObjects");
    v4 = entityKindAtEntityIndex(v2, *(void **)(a1 + 32));
    _keysOfInterestForEntityKind(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    entityAtIndex(v2, *(void **)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "relationshipsByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke_2;
    v13[3] = &unk_1E366AE50;
    v8 = v5;
    v14 = v8;
    v9 = v12;
    v15 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_msgSend(v9, "copy");
      v11 = (void *)_orderedRelationshipsOfInterestForObject__myKeys[v2];
      _orderedRelationshipsOfInterestForObject__myKeys[v2] = v10;

    }
    ++v2;
  }

}

void __71__PLChangeNotificationCenter__orderedRelationshipsOfInterestForObject___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7))
  {
    v6 = v5;
    if (!objc_msgSend(v6, "maxCount") || objc_msgSend(v6, "isToMany"))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

  }
}

uint64_t __66__PLChangeNotificationCenter_processContextDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_splitContextDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

+ (id)allManagedObjectKeysStrategyWithContext:(id)a3
{
  id v3;
  id v4;
  id v6;

  v6 = a3;
  v3 = v6;
  pl_dispatch_once();
  v4 = (id)allManagedObjectKeysStrategyWithContext__myStrategy;

  return v4;
}

+ (void)getInsertedAssetCount:(unint64_t *)a3 deletedAssetCount:(unint64_t *)a4 updatedAssets:(id)a5 fromContextDidChangeNotification:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v20;
  uint64_t i;
  void *v22;
  void *context;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  unint64_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _QWORD v42[4];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a5;
  v28 = a6;
  *a3 = 0;
  v32 = a4;
  *a4 = 0;
  context = (void *)MEMORY[0x19AEC1554]();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = *MEMORY[0x1E0C97878];
  v10 = *MEMORY[0x1E0C97840];
  v42[0] = *MEMORY[0x1E0C97878];
  v42[1] = v10;
  v25 = *MEMORY[0x1E0C979A8];
  v11 = *MEMORY[0x1E0C979A8];
  v26 = *MEMORY[0x1E0C97A20];
  v42[2] = *MEMORY[0x1E0C97A20];
  v42[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v29)
  {
    v27 = *(_QWORD *)v38;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(obj);
        v30 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v12);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v28, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          v20 = v13 == v26 || v13 == v25;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (entityKindOfObject(v22) == 4)
              {
                if (v13 == v9)
                {
                  ++*a3;
                }
                else if (v13 == v10)
                {
                  ++*v32;
                }
                else if (v20)
                {
                  objc_msgSend(v31, "addObject:", v22);
                }
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v17);
        }

        v12 = v30 + 1;
      }
      while (v30 + 1 != v29);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v29);
  }

  objc_autoreleasePoolPop(context);
}

+ (void)forceFetchingAlbumReload
{
  uint32_t state;
  uint32_t v3;
  NSObject *v4;
  const char *v5;
  uint32_t v6;
  uint32_t v7;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  pl_dispatch_once();
  state = notify_get_state(forceFetchingAlbumReloadToken_token, &state64);
  if (state)
  {
    v3 = state;
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v3;
      v5 = "notify_get_state() failed for fetching album reload. (%u)";
LABEL_7:
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, v5, buf, 8u);
    }
  }
  else
  {
    ++state64;
    pl_dispatch_once();
    v6 = notify_set_state(forceFetchingAlbumReloadToken_token, state64);
    if (!v6)
      return;
    v7 = v6;
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v7;
      v5 = "notify_set_state() failed for fetching album reload. (%u)";
      goto LABEL_7;
    }
  }

}

+ (void)assertIsCompatibleWithObjectModel:(id)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  objc_msgSend(a3, "entitiesByName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 >= 0x46)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLChangeNotificationCenter.m"), 1427, CFSTR("Need to increase maxEntityCount (%tu < %d)"), v7, 70);

  }
}

void __70__PLChangeNotificationCenter_allManagedObjectKeysStrategyWithContext___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLChangeNotificationCenter allManagedObjectKeysStrategyWithContext:]_block_invoke");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PLChangeNotificationCenter.m"), 544, CFSTR("NSManagedObjectModel is nil."));

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "entities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "propertiesByName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v2, "addObjectsFromArray:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v12 = objc_alloc(MEMORY[0x1E0C97B78]);
  objc_msgSend(v2, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initForKeys:", v13);
  v15 = (void *)allManagedObjectKeysStrategyWithContext__myStrategy;
  allManagedObjectKeysStrategyWithContext__myStrategy = v14;

}

@end
