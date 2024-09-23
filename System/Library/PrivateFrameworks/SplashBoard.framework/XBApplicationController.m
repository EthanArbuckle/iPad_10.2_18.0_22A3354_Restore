@implementation XBApplicationController

- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5
{
  return -[XBApplicationController initWithMainDisplayConfiguration:applicationProvider:launchRequestProvider:configureVolumeMaintenance:](self, "initWithMainDisplayConfiguration:applicationProvider:launchRequestProvider:configureVolumeMaintenance:", a3, a4, a5, 1);
}

- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5 configureVolumeMaintenance:(BOOL)a6
{
  _BOOL4 v6;
  id v12;
  id v13;
  id v14;
  XBApplicationController *v15;
  XBApplicationController *v16;
  void *v17;
  void *v19;
  objc_super v20;

  v6 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)XBApplicationController;
  v15 = -[XBApplicationController init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mainDisplayConfiguration, a3);
    if (!-[FBSDisplayConfiguration isMainDisplay](v16->_mainDisplayConfiguration, "isMainDisplay")
      || -[FBSDisplayConfiguration isExternal](v16->_mainDisplayConfiguration, "isExternal"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("XBApplicationController.m"), 120, CFSTR("provided an invalid mainDisplay configuration"));

    }
    objc_storeStrong((id *)&v16->_applicationProvider, a4);
    objc_storeStrong((id *)&v16->_launchRequestProvider, a5);
    v16->_statusBarOrientation = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v16, sel__updateStatusBarOrientation, *MEMORY[0x24BDF7520], 0);

    -[XBApplicationController _updateStatusBarOrientation](v16, "_updateStatusBarOrientation");
    -[XBApplicationController _deleteLegacyCachesSnapshotPathsIfNeeded](v16, "_deleteLegacyCachesSnapshotPathsIfNeeded");
    if (v6)
      +[XBVolumeMaintainer configure:](XBVolumeMaintainer, "configure:", v13);
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)XBApplicationController;
  -[XBApplicationController dealloc](&v4, sel_dealloc);
}

- (void)deleteAllSnapshotsIfScreenSizeChanged
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;
  CGSize v14;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("XBRecentScreenSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayConfiguration bounds](self->_mainDisplayConfiguration, "bounds");
  v14.width = v5;
  v14.height = v6;
  NSStringFromCGSize(v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v7) & 1) == 0)
  {
    if (v4)
    {
      XBLogFileManifest();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = v4;
        v11 = 2114;
        v12 = v7;
        _os_log_impl(&dword_217702000, v8, OS_LOG_TYPE_DEFAULT, "Screen size changed from %{public}@ to %{public}@, purging all generated launch image and snapshots.", (uint8_t *)&v9, 0x16u);
      }

      -[XBApplicationController _removeAllGeneratedLaunchImagesAndSnapshots](self, "_removeAllGeneratedLaunchImagesAndSnapshots");
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("XBRecentScreenSize"));
    objc_msgSend(v3, "synchronize");
  }

}

- (void)performPostMigrationLaunchImageGeneration
{
  void *v3;
  NSObject *v4;
  void *SerialWithQoS;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  XBApplicationController *v12;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("XBCaptureLaunchImagesPostMigration")))
  {
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("XBCaptureLaunchImagesPostMigration"));
    XBLogFileManifest();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "performPostMigrationLaunchImageGeneration", buf, 2u);
    }

    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    -[XBApplicationProviding splashBoardSystemApplications](self->_applicationProvider, "splashBoardSystemApplications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke;
    block[3] = &unk_24D7F4050;
    v10 = v6;
    v11 = SerialWithQoS;
    v12 = self;
    v7 = SerialWithQoS;
    v8 = v6;
    dispatch_async(v7, block);

  }
}

void __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  XBApplicationSnapshotManifest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD block[6];
  XBApplicationSnapshotManifest *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentTypeMask:", 6);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "tags", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", CFSTR("hidden"));

        if ((v10 & 1) == 0)
        {
          v11 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]([XBApplicationSnapshotManifest alloc], "initWithApplicationInfo:", v8);
          -[XBApplicationSnapshotManifest defaultGroupIdentifier](v11, "defaultGroupIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[XBApplicationSnapshotManifest snapshotsForGroupID:matchingPredicate:](v11, "snapshotsForGroupID:matchingPredicate:", v12, v2);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v13, "count"))
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_2;
            block[3] = &unk_24D7F4050;
            v15 = *(NSObject **)(v16 + 40);
            v14 = *(_QWORD *)(v16 + 48);
            block[4] = v8;
            block[5] = v14;
            v18 = v11;
            dispatch_async(v15, block);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

void __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  XBLogFileManifest();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v3;
    _os_log_impl(&dword_217702000, v2, OS_LOG_TYPE_DEFAULT, "Post-migration launch image capture for %{public}@", buf, 0xCu);

  }
  v4 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_76;
  v6[3] = &unk_24D7F4328;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "captureOrUpdateLaunchImagesForApplications:firstImageIsReady:completion:", v5, 0, v6);

}

uint64_t __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSnapshotsAPFSPurgability:", 0);
}

- (void)_deleteLegacyCachesSnapshotPathsIfNeeded
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  XBApplicationSnapshotManifest *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = XBLegacyCachesSnapshotPathForNonSandboxedSystemApplicationsExists();
  XBLogFileManifest();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "Start purging legacy snapshots caches...", buf, 2u);
    }

    -[XBApplicationProviding allInstalledApplications](self->_applicationProvider, "allInstalledApplications");
    v4 = objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v21;
      *(_QWORD *)&v7 = 138543362;
      v19 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "dataContainerURL", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            if (!XBDeleteLegacyCachesSnapshotPathForSandboxedApplicationIfNeeded(v11))
              goto LABEL_18;
            XBLogFileManifest();
            v13 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              goto LABEL_17;
            objc_msgSend(v11, "bundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v14;
            v15 = v13;
            v16 = "Purging legacy caches of sandboxed app snapshots for: %{public}@";
            goto LABEL_16;
          }
          if (!XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationIfNeeded(v11))
            goto LABEL_18;
          XBLogFileManifest();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "bundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v14;
            v15 = v13;
            v16 = "Purging legacy caches of snapshots for non-sandboxed system app: %{public}@";
LABEL_16:
            _os_log_impl(&dword_217702000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

          }
LABEL_17:

          v17 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]([XBApplicationSnapshotManifest alloc], "initWithApplicationInfo:", v11);
          -[XBApplicationSnapshotManifest deleteAllSnapshots](v17, "deleteAllSnapshots");

LABEL_18:
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v8);
    }
    XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded();
    XBLogFileManifest();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217702000, v18, OS_LOG_TYPE_DEFAULT, "Finished purging", buf, 2u);
    }

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217702000, v4, OS_LOG_TYPE_DEFAULT, "No legacy snapshots caches to purge", buf, 2u);
  }

}

- (id)findRecentlyUsedOfApplications:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __58__XBApplicationController_findRecentlyUsedOfApplications___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  uint64_t v5;
  XBApplicationSnapshotManifest *v6;

  v2 = a2;
  objc_msgSend(v2, "tags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("hidden"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]([XBApplicationSnapshotManifest alloc], "initWithApplicationInfo:", v2);
    v5 = -[XBApplicationSnapshotManifest snapshotsConsideredUnpurgableByAPFS](v6, "snapshotsConsideredUnpurgableByAPFS");

  }
  return v5;
}

- (void)removeCachedLaunchImagesForApplications:(id)a3 forgettingApps:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD activity_block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __82__XBApplicationController_removeCachedLaunchImagesForApplications_forgettingApps___block_invoke;
  activity_block[3] = &unk_24D7F4390;
  activity_block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  _os_activity_initiate(&dword_217702000, "XBInvalidate", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);

}

void __82__XBApplicationController_removeCachedLaunchImagesForApplications_forgettingApps___block_invoke(uint64_t a1)
{
  id v2;

  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentTypeMask:", 2);
  objc_msgSend(*(id *)(a1 + 32), "_removeLaunchImagesMatchingPredicate:forApplications:forgettingApps:", v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __99__XBApplicationController_captureOrUpdateLaunchImagesForApplications_firstImageIsReady_completion___block_invoke;
  v10[3] = &unk_24D7F43B8;
  v11 = v8;
  v9 = v8;
  -[XBApplicationController _captureOrUpdateLaunchImagesForApplications:firstImageIsReady:createCaptureInfo:completionWithCaptureInfo:](self, "_captureOrUpdateLaunchImagesForApplications:firstImageIsReady:createCaptureInfo:completionWithCaptureInfo:", a3, a4, 0, v10);

}

uint64_t __99__XBApplicationController_captureOrUpdateLaunchImagesForApplications_firstImageIsReady_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completionWithCaptureInfo:(id)a5
{
  -[XBApplicationController _captureOrUpdateLaunchImagesForApplications:firstImageIsReady:createCaptureInfo:completionWithCaptureInfo:](self, "_captureOrUpdateLaunchImagesForApplications:firstImageIsReady:createCaptureInfo:completionWithCaptureInfo:", a3, a4, 1, a5);
}

- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 createCaptureInfo:(BOOL)a5 completionWithCaptureInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD activity_block[4];
  id v17;
  XBApplicationController *v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke;
  activity_block[3] = &unk_24D7F4430;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v17 = v10;
  v18 = self;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  _os_activity_initiate(&dword_217702000, "XBCapture", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);

}

void __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  XBApplicationSnapshotManifest *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  XBApplicationSnapshotManifest *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  __int128 v31;
  id v32;
  unsigned int v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  XBApplicationSnapshotManifest *v39;
  id v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  char v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  v58 = 0;
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)v54[5];
    v54[5] = v2;

  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x24BE38368], "sentinelWithQueue:signalCount:completion:", 0, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x24BE38368];
  v6 = objc_msgSend(*(id *)(a1 + 32), "count") + 1;
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_82;
  v49[3] = &unk_24D7F43E0;
  v32 = v4;
  v50 = v32;
  v51 = *(id *)(a1 + 56);
  v52 = &v53;
  objc_msgSend(v5, "sentinelWithQueue:signalCount:completion:", 0, v6, v49);
  v7 = objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v34 = a1;
  obj = *(id *)(a1 + 32);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
  v37 = (void *)v7;
  if (v8)
  {
    v36 = *(_QWORD *)v46;
    *(_QWORD *)&v9 = 138543362;
    v31 = v9;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v10);
        objc_msgSend(v11, "bundleIdentifier", v31);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v44 = 0;
        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v14, &v44) & 1) != 0)
          {
            v16 = v44 == 0;

            if (!v16)
            {
              +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "beginAccessBlockForBundleIdentifier:", v12);
              objc_msgSend(v17, "_clearCompatibilityInfoForBundleIdentifier:", v12);
              +[XBApplicationLaunchCompatibilityInfo compatibilityInfoForAppInfo:](XBApplicationLaunchCompatibilityInfo, "compatibilityInfoForAppInfo:", v11);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v18, "allowsSavingLaunchImages"))
              {
                v19 = -[XBApplicationSnapshotManifest initWithApplicationInfo:]([XBApplicationSnapshotManifest alloc], "initWithApplicationInfo:", v11);
                -[XBApplicationSnapshotManifest defaultGroupIdentifier](v19, "defaultGroupIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setDefaultGroupIdentifier:", v20);

                v21 = *(_QWORD **)(v34 + 40);
                v22 = (void *)v21[3];
                objc_msgSend(v21, "_launchRequestsForApplication:withCompatibilityInfo:", v11, v18);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "launchRequestsForApplication:withCompatibilityInfo:defaultLaunchRequests:", v11, v18, v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19 && objc_msgSend(v24, "count"))
                {
                  +[XBLaunchImageProvider sharedInstance](XBLaunchImageProvider, "sharedInstance");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = *(unsigned __int8 *)(v34 + 64);
                  v42[0] = MEMORY[0x24BDAC760];
                  v42[1] = 3221225472;
                  v42[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_2;
                  v42[3] = &unk_24D7F4328;
                  v43 = v32;
                  v38[0] = MEMORY[0x24BDAC760];
                  v38[1] = 3221225472;
                  v38[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_3;
                  v38[3] = &unk_24D7F4408;
                  v41 = &v53;
                  v38[4] = v11;
                  v26 = v19;
                  v39 = v26;
                  v40 = v37;
                  objc_msgSend(v25, "captureLaunchImageForManifest:withCompatibilityInfo:launchRequests:createCaptureInfo:firstImageIsReady:withCompletionHandler:", v26, v18, v24, v33, v42, v38);

                }
                else
                {
                  XBLogCapture();
                  v29 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v31;
                    v60 = v12;
                    _os_log_error_impl(&dword_217702000, v29, OS_LOG_TYPE_ERROR, "Failed to capture launch image snapshot due to missing manifest or launchRequests for %{public}@", buf, 0xCu);
                  }

                  objc_msgSend(v37, "signal");
                }

              }
              else
              {
                XBLogCapture();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v31;
                  v60 = v12;
                  _os_log_error_impl(&dword_217702000, v28, OS_LOG_TYPE_ERROR, "Unable to generate launch image for %{public}@ because the app has no valid launch interfaces.", buf, 0xCu);
                }

                objc_msgSend(v37, "signal");
              }
              objc_msgSend(v17, "endAccessBlockForBundleIdentifier:", v12);

              goto LABEL_22;
            }
          }
          else
          {

          }
        }
        XBLogCapture();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v60 = v12;
          v61 = 2114;
          v62 = v14;
          _os_log_error_impl(&dword_217702000, v27, OS_LOG_TYPE_ERROR, "Unable to generate launch image for %{public}@ because the provided bundle path does not exist: %{public}@", buf, 0x16u);
        }

        objc_msgSend(v37, "signal");
LABEL_22:

        ++v10;
      }
      while (v8 != v10);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v63, 16);
      v8 = v30;
    }
    while (v30);
  }

  objc_msgSend(v37, "signal");
  _Block_object_dispose(&v53, 8);

}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "signal");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

void __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  objc_msgSend(*(id *)(a1 + 40), "manifestImpl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_4;
  v8[3] = &unk_24D7F4328;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "_synchronizeDataStoreWithCompletion:", v8);

}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signal");
}

- (id)_launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  FBSDisplayConfiguration *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  FBSDisplayConfiguration *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  XBLaunchStateRequest *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t statusBarOrientation;
  void *v39;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDF6F80], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentStyle");

  v37 = objc_msgSend(v7, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", v10);
  statusBarOrientation = self->_statusBarOrientation;
  objc_msgSend(v7, "bundleIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_mainDisplayConfiguration;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationController.m"), 377, CFSTR("no displayConfiguration found"));

  }
  -[FBSDisplayConfiguration bounds](v13, "bounds");
  v15 = v14;
  v17 = v16;
  v34 = (void *)v11;
  v35 = v8;
  if (-[FBSDisplayConfiguration isMainDisplay](v13, "isMainDisplay"))
  {
    objc_msgSend(v8, "defaultGroupIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  v18 = 0;
  v19 = 0;
  do
  {
    v20 = _launchRequestsForApplication_withCompatibilityInfo__orientations[v18];
    v21 = XBInterfaceOrientationMaskForInterfaceOrientationPair(v20);
    if (objc_msgSend(v7, "supportsInterfaceOrientation:", v20))
      v22 = (v21 & v19) == 0;
    else
      v22 = 0;
    if (v22)
    {
      v36 = v19;
      v23 = v13;
      v24 = objc_msgSend(v7, "statusBarHiddenForInterfaceOrientation:onDisplay:", v20, v13);
      v25 = 0;
      v26 = v24 ^ 1u;
      v27 = 1;
      do
      {
        v28 = v27;
        v29 = _launchRequestsForApplication_withCompatibilityInfo__allUserInterfaceStyles[v25];
        if (objc_msgSend(v7, "xb_supportsUserInterfaceStyle:", v29, v34, v35))
        {
          v30 = objc_alloc_init(XBLaunchStateRequest);
          -[XBLaunchStateRequest setDisplayConfiguration:](v30, "setDisplayConfiguration:", v23);
          -[XBLaunchStateRequest setGroupID:](v30, "setGroupID:", v39);
          -[XBLaunchStateRequest setReferenceSize:](v30, "setReferenceSize:", v15, v17);
          -[XBLaunchStateRequest setStatusBarState:](v30, "setStatusBarState:", v26);
          -[XBLaunchStateRequest setInterfaceOrientation:](v30, "setInterfaceOrientation:", v20);
          -[XBLaunchStateRequest setUserInterfaceStyle:](v30, "setUserInterfaceStyle:", v29);
          if (v20 == statusBarOrientation && v29 == v37)
            objc_msgSend(v12, "insertObject:atIndex:", v30, 0);
          else
            objc_msgSend(v12, "addObject:", v30);

        }
        v27 = 0;
        v25 = 1;
      }
      while ((v28 & 1) != 0);
      v19 = XBInterfaceOrientationMaskForInterfaceOrientation(v20) | v36;
      v13 = v23;
    }
    ++v18;
  }
  while (v18 != 4);
  if (!objc_msgSend(v12, "count"))
  {
    XBLogCapture();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[XBApplicationController _launchRequestsForApplication:withCompatibilityInfo:].cold.1((uint64_t)v34, v31);

  }
  return v12;
}

- (void)_removeAllGeneratedLaunchImagesAndSnapshots
{
  void *v3;
  id v4;

  +[XBApplicationSnapshotPredicate predicate](XBApplicationSnapshotPredicate, "predicate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentTypeMask:", 3);
  -[XBApplicationProviding allInstalledApplications](self->_applicationProvider, "allInstalledApplications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBApplicationController _removeLaunchImagesMatchingPredicate:forApplications:forgettingApps:](self, "_removeLaunchImagesMatchingPredicate:forApplications:forgettingApps:", v4, v3, 0);

}

- (void)_removeLaunchImagesMatchingPredicate:(id)a3 forApplications:(id)a4 forgettingApps:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  XBLogFileManifest();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "descriptionWithMultilinePrefix:", CFSTR("\t"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_217702000, v9, OS_LOG_TYPE_DEFAULT, "_removeLaunchImagesMatchingPredicate:forApplications:forgettingApps: called\nforgettingApps: %d\npredicate:\n%{public}@", buf, 0x12u);

  }
  v13 = v7;
  v11 = v7;
  v12 = v8;
  BSDispatchMain();

}

void __95__XBApplicationController__removeLaunchImagesMatchingPredicate_forApplications_forgettingApps___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  XBApplicationSnapshotManifest *v9;
  XBApplicationSnapshotManifest *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[XBApplicationDataStore sharedInstance](XBApplicationDataStore, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = [XBApplicationSnapshotManifest alloc];
        v10 = -[XBApplicationSnapshotManifest initWithApplicationInfo:](v9, "initWithApplicationInfo:", v8, (_QWORD)v12);
        -[XBApplicationSnapshotManifest endTrackingImageDeletions](v10, "endTrackingImageDeletions");
        -[XBApplicationSnapshotManifest deleteSnapshotsMatchingPredicate:](v10, "deleteSnapshotsMatchingPredicate:", *(_QWORD *)(a1 + 40));
        objc_msgSend(v8, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 48))
          objc_msgSend(v2, "_clearCompatibilityInfoForBundleIdentifier:", v11);
        else
          objc_msgSend(v2, "_removeBundleIdentifierFromLaunchInterfaceDenyList:", v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (void)_updateStatusBarOrientation
{
  BSDispatchMain();
}

void __54__XBApplicationController__updateStatusBarOrientation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "statusBarOrientation");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = v3;
}

- (XBApplicationProviding)applicationProvider
{
  return self->_applicationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_launchRequestProvider, 0);
  objc_storeStrong((id *)&self->_mainDisplayConfiguration, 0);
}

- (void)_launchRequestsForApplication:(uint64_t)a1 withCompatibilityInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_217702000, a2, OS_LOG_TYPE_ERROR, "We can't generate launch image requests for: %{public}@ since it doesn't support any valid orientations.", (uint8_t *)&v2, 0xCu);
}

@end
