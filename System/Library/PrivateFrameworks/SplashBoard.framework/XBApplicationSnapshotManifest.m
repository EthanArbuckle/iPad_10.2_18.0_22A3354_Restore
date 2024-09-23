@implementation XBApplicationSnapshotManifest

- (id)snapshotsForGroupIDs:(id)a3 fetchRequest:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupIDs:fetchRequest:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)snapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupID:matchingPredicate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)defaultGroupIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "defaultGroupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (void)initialize
{
  dispatch_workloop_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  __CFNotificationCenter *DarwinNotifyCenter;

  if ((id)objc_opt_class() == a1)
  {
    v3 = dispatch_workloop_create("XBApplicationManifestWorkloop");
    v4 = (void *)__ManifestWorkloop;
    __ManifestWorkloop = (uint64_t)v3;

    v5 = dispatch_queue_create_with_target_V2("XBApplicationManifestSerialWorkQueue", 0, (dispatch_queue_t)__ManifestWorkloop);
    v6 = (void *)__ManifestSerialWorkQueue;
    __ManifestSerialWorkQueue = (uint64_t)v5;

    v7 = BSDispatchQueueCreateWithQualityOfService();
    v8 = (void *)__ManifestImageAccessQueue;
    __ManifestImageAccessQueue = v7;

    v9 = BSDispatchQueueCreateWithQualityOfService();
    v10 = (void *)__ManifestArchiveSchedulingQueue;
    __ManifestArchiveSchedulingQueue = v9;

    v11 = BSDispatchQueueCreateWithQualityOfService();
    v12 = (void *)__ManifestCallOutQueue;
    __ManifestCallOutQueue = v11;

    v13 = BSDispatchQueueCreateWithQualityOfService();
    v14 = (void *)__ManifestFSEventsQueue;
    __ManifestFSEventsQueue = v13;

    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = (void *)__ManifestsByIdentity;
    __ManifestsByIdentity = (uint64_t)v15;

    v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = (void *)__trackersByIdentity;
    __trackersByIdentity = (uint64_t)v17;

    v19 = (void *)MEMORY[0x24BDD1620];
    v20 = objc_opt_class();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setClass:forClassName:", v20, v22);

    +[XBApplicationSnapshotManifest handleTrackingStateChange](XBApplicationSnapshotManifest, "handleTrackingStateChange");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_XBTrackDeletionPreferencesChangedHandler, CFSTR("com.apple.springboard.trackSplashBoardDeletionsPrefsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

+ (void)handleTrackingStateChange
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __isTrackingDeletions = objc_msgSend(v2, "BOOLForKey:", CFSTR("SBTrackSplashBoardDeletions"));

  dispatch_async((dispatch_queue_t)__ManifestSerialWorkQueue, &__block_literal_global_6);
}

void __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  XBDefaultApplicationProvider *v3;

  if (__isTrackingDeletions)
  {
    v3 = objc_alloc_init(XBDefaultApplicationProvider);
    -[XBDefaultApplicationProvider splashBoardSystemApplications](v3, "splashBoardSystemApplications");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bs_compactMap:", &__block_literal_global_21);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__trackDenyList;
    __trackDenyList = v1;

    objc_msgSend((id)__ManifestsByIdentity, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_23);
  }
  else
  {
    v3 = (XBDefaultApplicationProvider *)objc_msgSend((id)__trackersByIdentity, "copy");
    -[XBDefaultApplicationProvider enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_25);
  }

}

uint64_t __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

uint64_t __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "beginTrackingImageDeletions");
}

void __58__XBApplicationSnapshotManifest_handleTrackingStateChange__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend((id)__ManifestsByIdentity, "objectForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endTrackingImageDeletions");

}

+ (id)debugDescription
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v8;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUseDebugDescription:", 1);
  v3 = __ManifestSerialWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__XBApplicationSnapshotManifest_debugDescription__block_invoke;
  block[3] = &unk_24D7F4328;
  v8 = v2;
  v4 = v2;
  dispatch_sync(v3, block);
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __49__XBApplicationSnapshotManifest_debugDescription__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDictionarySection:withName:skipIfEmpty:", __ManifestsByIdentity, 0, 1);
}

+ (void)deleteAllSystemSnapshots
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_217702000, v0, (uint64_t)v0, "Error deleting all system snapshots at path %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_5();
}

- (XBApplicationSnapshotManifest)initWithContainerIdentity:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  XBApplicationSnapshotManifest *v10;
  void *v11;
  id WeakRetained;
  id v13;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 182, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identity"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)XBApplicationSnapshotManifest;
  v10 = -[XBApplicationSnapshotManifest init](&v17, sel_init);
  if (v10)
  {
    +[XBApplicationSnapshotManifestImpl acquireManifestForContainerIdentity:store:creatingIfNecessary:](XBApplicationSnapshotManifestImpl, "acquireManifestForContainerIdentity:store:creatingIfNecessary:", v7, v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_manifestImpl, v11);

    WeakRetained = objc_loadWeakRetained((id *)&v10->_manifestImpl);
    objc_msgSend(WeakRetained, "setDelegate:", v10);

    if (__isTrackingDeletions)
    {
      v13 = objc_loadWeakRetained((id *)&v10->_manifestImpl);
      objc_msgSend(v13, "beginTrackingImageDeletions");

    }
  }

  return v10;
}

- (XBApplicationSnapshotManifest)initWithApplicationInfo:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  XBApplicationSnapshotManifest *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationSnapshotManifest.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("info"));

  }
  +[XBSnapshotContainerIdentity identityForApplicationInfo:](XBSnapshotContainerIdentity, "identityForApplicationInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[XBApplicationSnapshotManifest initWithContainerIdentity:store:](self, "initWithContainerIdentity:store:", v6, v7);

  return v8;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  +[XBApplicationSnapshotManifestImpl relinquishManifest:](XBApplicationSnapshotManifestImpl, "relinquishManifest:", WeakRetained);

  v4.receiver = self;
  v4.super_class = (Class)XBApplicationSnapshotManifest;
  -[XBApplicationSnapshotManifest dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[XBApplicationSnapshotManifest descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)bundleIdentifier
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)containerPath
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)snapshotsForGroupID:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;
  void *v6;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)snapshotsForGroupID:(id)a3 fetchRequest:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupID:fetchRequest:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)snapshotsForGroupIDs:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;
  void *v6;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupIDs:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)snapshotsForGroupIDs:(id)a3 matchingPredicate:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "snapshotsForGroupIDs:matchingPredicate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)beginTrackingImageDeletions
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "beginTrackingImageDeletions");

}

- (void)endTrackingImageDeletions
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "endTrackingImageDeletions");

}

- (id)createSnapshotWithGroupID:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;
  void *v6;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "createSnapshotWithGroupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createVariantForSnapshot:(id)a3 withIdentifier:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "createVariantForSnapshot:withIdentifier:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 completion:(id)a6
{
  -[XBApplicationSnapshotManifest generateImageForSnapshot:dataProvider:writeToFile:didGenerateImage:didSaveImage:](self, "generateImageForSnapshot:dataProvider:writeToFile:didGenerateImage:didSaveImage:", a3, a4, a5, 0, a6);
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 didGenerateImage:(id)a6 didSaveImage:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v17 = MEMORY[0x24BDAC760];
  if (!v14)
  {
    v18 = 0;
    if (v15)
      goto LABEL_3;
LABEL_5:
    v19 = 0;
    goto LABEL_6;
  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke;
  v25[3] = &unk_24D7F49C8;
  v26 = v14;
  v18 = (void *)MEMORY[0x219A10DF4](v25);

  if (!v16)
    goto LABEL_5;
LABEL_3:
  v20 = v17;
  v21 = 3221225472;
  v22 = __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke_2;
  v23 = &unk_24D7F49C8;
  v24 = v16;
  v19 = (void *)MEMORY[0x219A10DF4](&v20);

LABEL_6:
  -[XBApplicationSnapshotManifest generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:](self, "generateImageForSnapshot:dataProvider:writeToFile:imageGeneratedHandler:imageDataSavedHandler:", v12, v13, v9, v18, v19, v20, v21, v22, v23);

}

uint64_t __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __113__XBApplicationSnapshotManifest_generateImageForSnapshot_dataProvider_writeToFile_didGenerateImage_didSaveImage___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 writeToFile:(BOOL)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
  -[XBApplicationSnapshotManifest generateImageForSnapshot:dataProvider:options:imageGeneratedHandler:imageDataSavedHandler:](self, "generateImageForSnapshot:dataProvider:options:imageGeneratedHandler:imageDataSavedHandler:", a3, a4, a5, a6, a7);
}

- (void)generateImageForSnapshot:(id)a3 dataProvider:(id)a4 options:(unint64_t)a5 imageGeneratedHandler:(id)a6 imageDataSavedHandler:(id)a7
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "generateImageForSnapshot:dataProvider:options:imageGeneratedHandler:imageDataSavedHandler:", v15, v14, a5, v13, v12);

}

- (void)saveSnapshot:(id)a3 atPath:(id)a4 withContext:(id)a5
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "saveSnapshot:atPath:withContext:", v10, v9, v8);

}

- (id)_allSnapshotGroups
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "_allSnapshotGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)deleteAllSnapshots
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "deleteAllSnapshots");

}

- (void)deleteSnapshot:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshot:", v4);

}

- (void)deleteSnapshots:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshots:", v4);

}

- (void)deleteSnapshotsMatchingPredicate:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshotsMatchingPredicate:", v4);

}

- (void)deleteSnapshotsUsingPredicateBuilder:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshotsUsingPredicateBuilder:", v4);

}

- (void)deleteSnapshotsForGroupID:(id)a3
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v4;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshotsForGroupID:", v4);

}

- (void)deleteSnapshotsForGroupID:(id)a3 matchingPredicate:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshotsForGroupID:matchingPredicate:", v7, v6);

}

- (void)deleteSnapshotsForGroupID:(id)a3 predicateBuilder:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "deleteSnapshotsForGroupID:predicateBuilder:", v7, v6);

}

- (void)purgeSnapshotsWithProtectedContent
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "purgeSnapshotsWithProtectedContent");

}

- (void)updateSnapshotsAPFSPurgability:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "updateSnapshotsAPFSPurgability:", v3);

}

- (BOOL)snapshotsConsideredUnpurgableByAPFS
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  v3 = objc_msgSend(WeakRetained, "snapshotsConsideredUnpurgableByAPFS");

  return v3;
}

- (void)beginSnapshotAccessTransaction:(id)a3 completion:(id)a4
{
  XBApplicationSnapshotManifestImpl **p_manifestImpl;
  id v6;
  id v7;
  id WeakRetained;

  p_manifestImpl = &self->_manifestImpl;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_manifestImpl);
  objc_msgSend(WeakRetained, "beginSnapshotAccessTransaction:completion:", v7, v6);

}

- (void)archive
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "archive");

}

+ (id)_manifestsByIdentity
{
  return (id)__ManifestsByIdentity;
}

- (BOOL)_invalidate
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  v3 = objc_msgSend(WeakRetained, "_invalidate");

  return v3;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[XBApplicationSnapshotManifest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  objc_msgSend(WeakRetained, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("bundleID"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[XBApplicationSnapshotManifest descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[XBApplicationSnapshotManifest succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_manifestImpl);
  v9[0] = WeakRetained;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v7, 0, v4, 1);

  return v5;
}

- (void)manifest:(id)a3 didPurgeProtectedContentSnapshotsWithGroupIdentifiers:(id)a4
{
  XBApplicationSnapshotManifestDelegate **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "manifest:didPurgeProtectedContentSnapshotsWithGroupIdentifiers:", v7, v6);

}

- (XBApplicationSnapshotManifestDelegate)delegate
{
  return (XBApplicationSnapshotManifestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (XBApplicationSnapshotManifestImpl)manifestImpl
{
  return (XBApplicationSnapshotManifestImpl *)objc_loadWeakRetained((id *)&self->_manifestImpl);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_manifestImpl);
}

@end
