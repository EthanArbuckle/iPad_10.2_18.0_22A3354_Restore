@implementation PLCloudPhotoLibraryUploadTracker

- (PLCloudPhotoLibraryUploadTracker)init
{
  PLCloudPhotoLibraryUploadTracker *v3;
  PLCloudPhotoLibraryUploadProgress *v4;
  uint64_t v5;
  PLAtomicObject *atomicProgress;
  uint64_t v7;
  NSMutableSet *mastersToUpload;
  uint64_t v9;
  NSMutableSet *deferredAssetsToUpload;
  uint64_t v11;
  NSMutableDictionary *trackedResourceProgressSize;
  uint64_t v13;
  NSMutableDictionary *trackedResourceMasterUploaded;
  uint64_t v15;
  NSMutableDictionary *masterRecordUploadState;
  uint64_t v17;
  NSMutableSet *mastersToUploadTrackingSize;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PLCloudPhotoLibraryUploadTracker;
  v3 = -[PLCloudPhotoLibraryUploadTracker init](&v21, sel_init);
  if (v3)
  {
    if ((PLIsAssetsd() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PLCloudPhotoLibraryUploadTracker.m"), 40, CFSTR("only assetsd"));

    }
    v4 = objc_alloc_init(PLCloudPhotoLibraryUploadProgress);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D73180]), "initWithObject:", v4);
    atomicProgress = v3->_atomicProgress;
    v3->_atomicProgress = (PLAtomicObject *)v5;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    mastersToUpload = v3->_mastersToUpload;
    v3->_mastersToUpload = (NSMutableSet *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    deferredAssetsToUpload = v3->_deferredAssetsToUpload;
    v3->_deferredAssetsToUpload = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    trackedResourceProgressSize = v3->_trackedResourceProgressSize;
    v3->_trackedResourceProgressSize = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    trackedResourceMasterUploaded = v3->_trackedResourceMasterUploaded;
    v3->_trackedResourceMasterUploaded = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    masterRecordUploadState = v3->_masterRecordUploadState;
    v3->_masterRecordUploadState = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    mastersToUploadTrackingSize = v3->_mastersToUploadTrackingSize;
    v3->_mastersToUploadTrackingSize = (NSMutableSet *)v17;

  }
  return v3;
}

- (unint64_t)totalNumberOfUnpushedMasters
{
  PLAtomicObject *atomicProgress;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUnpushedMasters__block_invoke;
  v5[3] = &unk_1E366EBB8;
  v5[4] = &v6;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)totalNumberOfUploadedMasters
{
  PLAtomicObject *atomicProgress;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUploadedMasters__block_invoke;
  v5[3] = &unk_1E366EBB8;
  v5[4] = &v6;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)totalNumberOfDeferredAssets
{
  PLAtomicObject *atomicProgress;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__PLCloudPhotoLibraryUploadTracker_totalNumberOfDeferredAssets__block_invoke;
  v5[3] = &unk_1E366EBB8;
  v5[4] = &v6;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)totalSizeOfUnpushedOriginals
{
  PLAtomicObject *atomicProgress;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__PLCloudPhotoLibraryUploadTracker_totalSizeOfUnpushedOriginals__block_invoke;
  v5[3] = &unk_1E366EBB8;
  v5[4] = &v6;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)totalUploadedOriginalSize
{
  PLAtomicObject *atomicProgress;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  atomicProgress = self->_atomicProgress;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PLCloudPhotoLibraryUploadTracker_totalUploadedOriginalSize__block_invoke;
  v5[3] = &unk_1E366EBB8;
  v5[4] = &v6;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress
{
  PLAtomicObject *atomicProgress;
  __int128 v5;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x4010000000;
  v11 = &unk_199CADF31;
  v12 = 0u;
  v13 = 0u;
  atomicProgress = self->_atomicProgress;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PLCloudPhotoLibraryUploadTracker_currentTransferProgress__block_invoke;
  v7[3] = &unk_1E366EBB8;
  v7[4] = &v8;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v7);
  v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->var2 = v5;
  _Block_object_dispose(&v8, 8);
  return result;
}

- (id)_constructKeyForScopedIdentifier:(id)a3 type:(int)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@#%@-%d"), v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_trackingMasterForScopedIdentifier:(id)a3
{
  return -[NSMutableSet containsObject:](self->_mastersToUpload, "containsObject:", a3);
}

- (BOOL)_isMasterRecordUploaded:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKey:](self->_masterRecordUploadState, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", MEMORY[0x1E0C9AAB0]);

  return v4;
}

- (void)_setBatchUploadStateForTrackedMasters:(id)a3 withState:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__PLCloudPhotoLibraryUploadTracker__setBatchUploadStateForTrackedMasters_withState___block_invoke;
  v4[3] = &unk_1E366EBE0;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

- (void)stopTrackingMaster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_mastersToUploadTrackingSize, "containsObject:", v5))
  {
    v13 = v5;
    objc_msgSend(v4, "allMasterResources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(MEMORY[0x1E0D11440], "resourceTypeTrackedForUpload:", objc_msgSend(v11, "cplType")))
          {
            objc_msgSend(v4, "scopedIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryUploadTracker _stopTrackingResourceWithScopedIdentifier:fileSize:type:](self, "_stopTrackingResourceWithScopedIdentifier:fileSize:type:", v12, objc_msgSend(v11, "dataLength"), objc_msgSend(v11, "cplType"));

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
    v5 = v13;
    -[NSMutableSet removeObject:](self->_mastersToUploadTrackingSize, "removeObject:", v13);

  }
  if (-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:", v5))
  {
    -[NSMutableSet removeObject:](self->_mastersToUpload, "removeObject:", v5);
    -[PLAtomicObject atomicallyPerformBlockAndWait:](self->_atomicProgress, "atomicallyPerformBlockAndWait:", &__block_literal_global_62552);
  }

}

- (void)_stopTrackingResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5
{
  uint64_t v5;
  PLAtomicObject *atomicProgress;
  id v9;
  _QWORD v10[5];

  v5 = *(_QWORD *)&a5;
  v9 = a3;
  if (-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:"))
  {
    -[PLCloudPhotoLibraryUploadTracker uploadFinishedForMasterResourceWithScopedIdentifier:fileSize:type:withError:](self, "uploadFinishedForMasterResourceWithScopedIdentifier:fileSize:type:withError:", v9, a4, v5, 1);
    atomicProgress = self->_atomicProgress;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __92__PLCloudPhotoLibraryUploadTracker__stopTrackingResourceWithScopedIdentifier_fileSize_type___block_invoke;
    v10[3] = &__block_descriptor_40_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
    v10[4] = a4;
    -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v10);
  }

}

- (void)uploadFinishedForMasterRecordWithScopedIdentifier:(id)a3 didUpdateStatus:(BOOL *)a4
{
  id v6;

  v6 = a3;
  if (-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:"))
  {
    if (!-[PLCloudPhotoLibraryUploadTracker _isMasterRecordUploaded:](self, "_isMasterRecordUploaded:", v6))
    {
      -[PLAtomicObject atomicallyPerformBlockAndWait:](self->_atomicProgress, "atomicallyPerformBlockAndWait:", &__block_literal_global_33_62549);
      -[NSMutableDictionary setObject:forKey:](self->_masterRecordUploadState, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v6);
      if (a4)
        *a4 = 1;
    }
  }

}

- (void)uploadFinishedForMasterResourceWithScopedIdentifier:(id)a3 fileSize:(unint64_t)a4 type:(int)a5 withError:(BOOL)a6
{
  PLAtomicObject *atomicProgress;
  id v10;
  _QWORD v11[5];
  BOOL v12;

  -[PLCloudPhotoLibraryUploadTracker _constructKeyForScopedIdentifier:type:](self, "_constructKeyForScopedIdentifier:type:", a3, *(_QWORD *)&a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  atomicProgress = self->_atomicProgress;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __112__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterResourceWithScopedIdentifier_fileSize_type_withError___block_invoke;
  v11[3] = &__block_descriptor_41_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  v12 = a6;
  v11[4] = a4;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v11);
  -[NSMutableDictionary removeObjectForKey:](self->_trackedResourceProgressSize, "removeObjectForKey:", v10);
  -[NSMutableDictionary removeObjectForKey:](self->_trackedResourceMasterUploaded, "removeObjectForKey:", v10);

}

- (void)updateForMasterResourceUploadWithScopedIdentifier:(id)a3 progress:(float)a4 fileSize:(unint64_t)a5 type:(int)a6
{
  unint64_t v9;
  NSMutableDictionary *trackedResourceProgressSize;
  void *v11;
  double v12;
  void *v13;
  char v14;
  void *v15;
  PLAtomicObject *atomicProgress;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  -[PLCloudPhotoLibraryUploadTracker _constructKeyForScopedIdentifier:type:](self, "_constructKeyForScopedIdentifier:type:", a3, *(_QWORD *)&a6);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (unint64_t)(float)((float)a5 * a4);
  trackedResourceProgressSize = self->_trackedResourceProgressSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](trackedResourceProgressSize, "setObject:forKey:", v11, v18);

  v12 = a4;
  if (a4 > 0.99)
  {
    -[NSMutableDictionary objectForKey:](self->_trackedResourceMasterUploaded, "objectForKey:", v18, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if ((v14 & 1) == 0)
      -[NSMutableDictionary setObject:forKey:](self->_trackedResourceMasterUploaded, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v18);
  }
  v15 = (void *)-[NSMutableDictionary copy](self->_trackedResourceProgressSize, "copy", v12);
  atomicProgress = self->_atomicProgress;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109__PLCloudPhotoLibraryUploadTracker_updateForMasterResourceUploadWithScopedIdentifier_progress_fileSize_type___block_invoke;
  v19[3] = &unk_1E366ECA8;
  v20 = v15;
  v17 = v15;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v19);

}

- (void)addSizeForUnpushedOriginals:(unint64_t)a3 forMasterScopedIdentifier:(id)a4 forAssetScopedIdentifier:(id)a5
{
  id v8;
  int v9;
  char v10;
  PLAtomicObject *atomicProgress;
  id v12;
  _QWORD v13[5];
  char v14;

  v12 = a4;
  v8 = a5;
  if (!-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:", v12))
  {
    -[NSMutableSet addObject:](self->_mastersToUpload, "addObject:", v12);
    -[NSMutableDictionary setObject:forKey:](self->_masterRecordUploadState, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v12);
    -[NSMutableSet addObject:](self->_mastersToUploadTrackingSize, "addObject:", v12);
    v9 = -[NSMutableSet containsObject:](self->_deferredAssetsToUpload, "containsObject:", v8);
    v10 = v9;
    if (v9)
      -[NSMutableSet removeObject:](self->_deferredAssetsToUpload, "removeObject:", v8);
    atomicProgress = self->_atomicProgress;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __115__PLCloudPhotoLibraryUploadTracker_addSizeForUnpushedOriginals_forMasterScopedIdentifier_forAssetScopedIdentifier___block_invoke;
    v13[3] = &__block_descriptor_41_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
    v13[4] = a3;
    v14 = v10;
    -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v13);
  }

}

- (void)trackDeferredAssetForScopedIdentifier:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_deferredAssetsToUpload)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryUploadTracker.m"), 230, CFSTR("_deferredAssetsToUpload must not be nil"));

  }
  if (-[PLCloudPhotoLibraryUploadTracker _trackingMasterForScopedIdentifier:](self, "_trackingMasterForScopedIdentifier:", v5))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = 138412290;
        v12 = v5;
        v7 = "Deferred processing asset (%@) already tracked with a master change, ignoring in tracker";
        v8 = v6;
        v9 = OS_LOG_TYPE_ERROR;
LABEL_11:
        _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v11, 0xCu);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    if (!-[NSMutableSet containsObject:](self->_deferredAssetsToUpload, "containsObject:", v5))
    {
      -[NSMutableSet addObject:](self->_deferredAssetsToUpload, "addObject:", v5);
      -[PLAtomicObject atomicallyPerformBlockAndWait:](self->_atomicProgress, "atomicallyPerformBlockAndWait:", &__block_literal_global_37_62546);
      goto LABEL_14;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v11 = 138412290;
        v12 = v5;
        v7 = "Deferred processing asset (%@) already tracked as pending, ignoring in tracker";
        v8 = v6;
        v9 = OS_LOG_TYPE_DEBUG;
        goto LABEL_11;
      }
LABEL_12:

    }
  }
LABEL_14:

}

- (void)setupFromLibrary:(id)a3 isInitialUpload:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  PLAtomicObject *atomicProgress;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[7];

  v4 = a4;
  v7 = a3;
  v14 = v7;
  if (!self->_mastersToUpload)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryUploadTracker.m"), 244, CFSTR("_mastersToUpload must not be nil"));

    v7 = v14;
  }
  if (!self->_deferredAssetsToUpload)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryUploadTracker.m"), 245, CFSTR("_deferredAssetsToUpload must not be nil"));

    v7 = v14;
  }
  if (v4)
  {
    v8 = +[PLManagedAsset totalSizeOfUnpushedOriginalsInPhotoLibrary:outMasterList:isInitialUpload:](PLManagedAsset, "totalSizeOfUnpushedOriginalsInPhotoLibrary:outMasterList:isInitialUpload:", v14, self->_mastersToUpload, 1);
    v9 = -[NSMutableSet count](self->_mastersToUpload, "count");
    -[PLCloudPhotoLibraryUploadTracker _setBatchUploadStateForTrackedMasters:withState:](self, "_setBatchUploadStateForTrackedMasters:withState:", self->_mastersToUpload, 0);
    v7 = v14;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  v10 = +[PLManagedAsset countOfDeferredAssetsToSyncInPhotoLibrary:outAssetList:](PLManagedAsset, "countOfDeferredAssetsToSyncInPhotoLibrary:outAssetList:", v7, self->_deferredAssetsToUpload, v14);
  atomicProgress = self->_atomicProgress;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__PLCloudPhotoLibraryUploadTracker_setupFromLibrary_isInitialUpload___block_invoke;
  v16[3] = &__block_descriptor_56_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  v16[4] = v8;
  v16[5] = v9;
  v16[6] = v10;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v16);

}

- (void)setupFromCPLManager:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PLAtomicObject *atomicProgress;
  _QWORD v10[6];

  v4 = a3;
  v5 = objc_msgSend(v4, "sizeOfOriginalResourcesToUpload");
  v6 = objc_msgSend(v4, "numberOfImagesToUpload");
  v7 = objc_msgSend(v4, "numberOfVideosToUpload") + v6;
  v8 = objc_msgSend(v4, "numberOfOtherItemsToUpload");

  atomicProgress = self->_atomicProgress;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PLCloudPhotoLibraryUploadTracker_setupFromCPLManager___block_invoke;
  v10[3] = &__block_descriptor_48_e43_v16__0__PLCloudPhotoLibraryUploadProgress_8l;
  v10[4] = v5;
  v10[5] = v7 + v8;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v10);
}

- (void)resetIfNeededWithLibrary:(id)a3 isInitialUpload:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PLAtomicObject *atomicProgress;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a4;
  v6 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  atomicProgress = self->_atomicProgress;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__PLCloudPhotoLibraryUploadTracker_resetIfNeededWithLibrary_isInitialUpload___block_invoke;
  v8[3] = &unk_1E366EBB8;
  v8[4] = &v9;
  -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicProgress, "atomicallyPerformBlockAndWait:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    -[PLCloudPhotoLibraryUploadTracker reset](self, "reset");
    -[PLCloudPhotoLibraryUploadTracker setupFromLibrary:isInitialUpload:](self, "setupFromLibrary:isInitialUpload:", v6, v4);
  }
  _Block_object_dispose(&v9, 8);

}

- (id)currentStateForDebug
{
  void *v3;
  void *v4;

  -[NSMutableDictionary keysOfEntriesPassingTest:](self->_masterRecordUploadState, "keysOfEntriesPassingTest:", &__block_literal_global_44_62529);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nTracked Deferred assets count: %llu\nTracked masters still need to upload count: %lu"), -[PLCloudPhotoLibraryUploadTracker totalNumberOfDeferredAssets](self, "totalNumberOfDeferredAssets"), objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reset
{
  -[PLAtomicObject atomicallyPerformBlockAndWait:](self->_atomicProgress, "atomicallyPerformBlockAndWait:", &__block_literal_global_47);
  -[NSMutableSet removeAllObjects](self->_mastersToUpload, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_deferredAssetsToUpload, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_trackedResourceProgressSize, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_trackedResourceMasterUploaded, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_mastersToUploadTrackingSize, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_masterRecordUploadState, "removeAllObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mastersToUploadTrackingSize, 0);
  objc_storeStrong((id *)&self->_masterRecordUploadState, 0);
  objc_storeStrong((id *)&self->_trackedResourceMasterUploaded, 0);
  objc_storeStrong((id *)&self->_trackedResourceProgressSize, 0);
  objc_storeStrong((id *)&self->_deferredAssetsToUpload, 0);
  objc_storeStrong((id *)&self->_mastersToUpload, 0);
  objc_storeStrong((id *)&self->_atomicProgress, 0);
}

double __41__PLCloudPhotoLibraryUploadTracker_reset__block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  if (a2)
  {
    *(_QWORD *)(a2 + 56) = 0;
    result = 0.0;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
  }
  return result;
}

uint64_t __56__PLCloudPhotoLibraryUploadTracker_currentStateForDebug__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "BOOLValue") ^ 1;
}

void __77__PLCloudPhotoLibraryUploadTracker_resetIfNeededWithLibrary_isInitialUpload___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  BOOL v4;

  v3 = a2;
  if (v3)
    v4 = (unint64_t)(v3[5] - 1) < v3[6];
  else
    v4 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

}

void __56__PLCloudPhotoLibraryUploadTracker_setupFromCPLManager___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;

  v3 = a2;
  if (v3)
  {
    v3[5] += *(_QWORD *)(a1 + 32);
    v3[1] += *(_QWORD *)(a1 + 40);
  }

}

void __69__PLCloudPhotoLibraryUploadTracker_setupFromLibrary_isInitialUpload___block_invoke(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    v4 = v3[4];
    v3[5] += a1[4];
    v3[1] += a1[5];
    v3[4] = a1[6] + v4;
  }

}

void __74__PLCloudPhotoLibraryUploadTracker_trackDeferredAssetForScopedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  if (v2)
    ++v2[4];

}

void __115__PLCloudPhotoLibraryUploadTracker_addSizeForUnpushedOriginals_forMasterScopedIdentifier_forAssetScopedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;

  v3 = a2;
  if (v3)
  {
    v3[5] += *(_QWORD *)(a1 + 32);
    ++v3[1];
    if (*(_BYTE *)(a1 + 40))
      --v3[4];
  }

}

void __109__PLCloudPhotoLibraryUploadTracker_updateForMasterResourceUploadWithScopedIdentifier_progress_fileSize_type___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
    v3[7] = v3[6];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");
        if (v4)
          v4[7] += v11;

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

void __112__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterResourceWithScopedIdentifier_fileSize_type_withError___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  _QWORD *v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  if (v3)
  {
    if (v4)
    {
      v4[7] = v4[6];
      v4[3] = v4[2];
    }
  }
  else if (v4)
  {
    v4[6] += *(_QWORD *)(a1 + 32);
    ++v4[2];
  }

}

void __102__PLCloudPhotoLibraryUploadTracker_uploadFinishedForMasterRecordWithScopedIdentifier_didUpdateStatus___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  if (v2)
    ++v2[3];

}

void __92__PLCloudPhotoLibraryUploadTracker__stopTrackingResourceWithScopedIdentifier_fileSize_type___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v3[5];
    v6 = v5 >= v4;
    v7 = v5 - v4;
    if (!v6)
      v7 = 0;
    v3[5] = v7;
  }

}

void __55__PLCloudPhotoLibraryUploadTracker_stopTrackingMaster___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;

  v2 = a2;
  if (v2)
    --v2[1];

}

void __84__PLCloudPhotoLibraryUploadTracker__setBatchUploadStateForTrackedMasters_withState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithBool:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, v5);

}

uint64_t __59__PLCloudPhotoLibraryUploadTracker_currentTransferProgress__block_invoke(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (a2)
  {
    v2 = a2[7];
    v3 = a2[5];
    v4 = a2[3];
    v5 = a2[4] + a2[1];
  }
  else
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
  }
  v6 = *(_QWORD **)(*(_QWORD *)(result + 32) + 8);
  v6[4] = v2;
  v6[5] = v3;
  v6[6] = v4;
  v6[7] = v5;
  return result;
}

uint64_t __61__PLCloudPhotoLibraryUploadTracker_totalUploadedOriginalSize__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 56);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalSizeOfUnpushedOriginals__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 40);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

uint64_t __63__PLCloudPhotoLibraryUploadTracker_totalNumberOfDeferredAssets__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 32);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUploadedMasters__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 24);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

uint64_t __64__PLCloudPhotoLibraryUploadTracker_totalNumberOfUnpushedMasters__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 8);
  else
    v2 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = v2;
  return result;
}

@end
