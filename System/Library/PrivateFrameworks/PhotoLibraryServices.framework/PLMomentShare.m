@implementation PLMomentShare

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6
{
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLMomentShare;
  objc_msgSendSuper2(&v8, sel_createOwnedShareWithUUID_creationDate_title_inPhotoLibrary_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScopeType:", 2);
  return v6;
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "validateCPLScopeChange:", v6))
  {
    objc_msgSend(v7, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v8, 1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      PLBackendSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v8;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Creating moment share with scope identifier %@", (uint8_t *)&v24, 0xCu);
      }

      objc_msgSend(a1, "insertInPhotoLibrary:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStatus:", 2);
      objc_msgSend(v10, "setScopeIdentifier:", v8);
    }
    PLBackendSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "compactDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v13;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Updating moment share %@ with CPLMomentShareScopeChange %@", (uint8_t *)&v24, 0x16u);

    }
    objc_msgSend(v6, "creationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCreationDate:", v14);

    objc_msgSend(v6, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v15);

    objc_msgSend(v6, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStartDate:", v16);

    objc_msgSend(v6, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEndDate:", v17);

    objc_msgSend(v6, "expiryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExpiryDate:", v18);

    objc_msgSend(v10, "setAssetCount:", objc_msgSend(v6, "promisedAssetCount"));
    objc_msgSend(v10, "setPhotosCount:", objc_msgSend(v6, "promisedPhotosCount"));
    objc_msgSend(v10, "setVideosCount:", objc_msgSend(v6, "promisedVideosCount"));
    objc_msgSend(v6, "originatingScopeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOriginatingScopeIdentifier:", v19);

    objc_msgSend(v6, "thumbnailImageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setThumbnailImageData:", v20);

    objc_msgSend(v6, "previewImageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPreviewData:", v21);

    objc_msgSend(v10, "setScopeType:", objc_msgSend(v6, "scopeType"));
    objc_msgSend(v6, "share");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateShareWithCPLShare:inPhotoLibrary:", v22, v7);
    objc_msgSend(v10, "_updateWithScopeChange:", v6);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)scopeIdentifierPrefix
{
  return (id)*MEMORY[0x1E0D11320];
}

+ (id)entityName
{
  return CFSTR("MomentShare");
}

+ (PLMomentShare)momentShareWithOriginatingScopeIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("originatingScopeIdentifier"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v8, 1, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLMomentShare *)v10;
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  return (id)listOfSyncedProperties_result_73989;
}

+ (void)forceSyncMomentShares:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__73871;
  v20 = __Block_byref_object_dispose__73872;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __52__PLMomentShare_forceSyncMomentShares_photoLibrary___block_invoke;
  v13 = &unk_1E3677C68;
  v7 = v5;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v6, "performTransactionAndWait:", &v10);
  if (objc_msgSend((id)v17[5], "count", v10, v11, v12, v13))
  {
    objc_msgSend(v6, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudPhotoLibraryManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "forceSyncMomentSharesWithScopeIdentifiers:", v17[5]);
  }

  _Block_object_dispose(&v16, 8);
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)momentSharesReferencedInUploadBatchContainer:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v5, "batch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "records");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "scopedIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "scopeIdentifierPrefix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "hasPrefix:", v14);

          if (v15)
          {
            objc_msgSend(v12, "scopeIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v16);

          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__73871;
  v33 = __Block_byref_object_dispose__73872;
  v34 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__PLMomentShare_momentSharesReferencedInUploadBatchContainer_inPhotoLibrary___block_invoke;
  v24[3] = &unk_1E3676EC8;
  v17 = v23;
  v25 = v17;
  v28 = &v29;
  v18 = v5;
  v26 = v18;
  v19 = v22;
  v27 = v19;
  objc_msgSend(v19, "performBlockAndWait:", v24);
  v20 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __77__PLMomentShare_momentSharesReferencedInUploadBatchContainer_inPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("scopeIdentifier IN %@"), *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "batch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare sharesWithPredicate:fetchLimit:inManagedObjectContext:](PLMomentShare, "sharesWithPredicate:fetchLimit:inManagedObjectContext:", v8, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)_updateWithScopeChange:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  __int128 buf;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "scopeType");
  if (v5 > 6)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_8;
  }
  if (((1 << v5) & 0x73) != 0)
  {
    PLBackendSharingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unexpected scopeType for moment share from scopeChange %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_6;
  }
  v7 = 2;
LABEL_8:
  -[PLMomentShare setLocalPublishState:](self, "setLocalPublishState:", v7);
  if (-[PLMomentShare status](self, "status") != 1)
  {
    objc_msgSend(v4, "assetCountPerType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v16 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__PLMomentShare__updateWithScopeChange___block_invoke;
    v9[3] = &unk_1E3670C18;
    v9[4] = &buf;
    v9[5] = &v10;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);
    -[PLMomentShare setUploadedPhotosCount:](self, "setUploadedPhotosCount:", *(unsigned int *)(*((_QWORD *)&buf + 1) + 24));
    -[PLMomentShare setUploadedVideosCount:](self, "setUploadedVideosCount:", *((unsigned int *)v11 + 6));
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&buf, 8);

  }
}

- (void)computeUploadedAssetCountsUsingAssetRelationship
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PLMomentShare momentShareAssets](self, "momentShareAssets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D73310], "maskForMomentSharedAsset");
        objc_msgSend(v10, "savedAssetType");
        if (PLValidatedSavedAssetTypeApplies())
        {
          objc_msgSend(v10, "master");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            if (objc_msgSend(v10, "isPhoto"))
              v7 = (v7 + 1);
            else
              v6 = v6 + objc_msgSend(v10, "isVideo");
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  if ((int)v7 <= (int)-[PLMomentShare uploadedPhotosCount](self, "uploadedPhotosCount"))
  {
    PLBackendSharingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = -[PLMomentShare uploadedPhotosCount](self, "uploadedPhotosCount");
      *(_DWORD *)buf = 67109376;
      v21 = v13;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Dropping uploadedPhotosCount in computeUploadedAssetCountsUsingAssetRelationship. Persisted count: %d, pending count: %d", buf, 0xEu);
    }

  }
  else
  {
    -[PLMomentShare setUploadedPhotosCount:](self, "setUploadedPhotosCount:", v7);
  }
  if ((int)v6 <= (int)-[PLMomentShare uploadedVideosCount](self, "uploadedVideosCount"))
  {
    PLBackendSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = -[PLMomentShare uploadedVideosCount](self, "uploadedVideosCount");
      *(_DWORD *)buf = 67109376;
      v21 = v15;
      v22 = 1024;
      v23 = v6;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Dropping uploadedVideosCount in computeUploadedAssetCountsUsingAssetRelationship. Persisted count: %d, pending count: %d", buf, 0xEu);
    }

  }
  else
  {
    -[PLMomentShare setUploadedVideosCount:](self, "setUploadedVideosCount:", v6);
  }
}

- (void)prepareForDeletion
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PLMomentShare;
  -[PLShare prepareForDeletion](&v16, sel_prepareForDeletion);
  -[PLMomentShare managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "mergingChanges") & 1) == 0)
  {
    -[PLManagedObject pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDCIM");

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "privateDirectoryWithSubType:", 7);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLMomentShare uuid](self, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLBackendSharingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Deleting CMMAsset subdirectory: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v12 = objc_msgSend(v11, "removeItemAtPath:error:", v9, &v15);
      v13 = v15;

      if ((v12 & 1) == 0)
      {
        PLBackendSharingGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v18 = v9;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to delete CMMAsset subdirectory: %@, %@", buf, 0x16u);
        }

      }
    }
  }

}

- (void)willSave
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PLMomentShare;
  -[PLManagedObject willSave](&v11, sel_willSave);
  -[PLMomentShare changedValues](self, "changedValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLMomentShare isUpdated](self, "isUpdated"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("shouldIgnoreBudgets"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      -[PLMomentShare scopeIdentifier](self, "scopeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendSharingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Should ignore budgets flag is updated for moment share %@, boosting its priority", buf, 0xCu);
      }

      -[PLManagedObject photoLibrary](self, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "libraryServicesManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cloudPhotoLibraryManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "boostPriorityForMomentShareWithScopeIdentifier:completionHandler:", v6, 0);
    }
  }

}

- (void)calculatePropertyValues
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PLMomentShare momentShareAssets](self, "momentShareAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    LODWORD(v4) = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      v16 = v4;
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "dateCreated");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8 || objc_msgSend(v8, "compare:", v12) == 1)
        {
          v13 = v12;

          v8 = v13;
        }
        if (!v7 || objc_msgSend(v7, "compare:", v12) == -1)
        {
          v14 = v12;

          v7 = v14;
        }
        if (objc_msgSend(v11, "isPhoto"))
          v5 = (v5 + 1);
        else
          v6 = v6 + objc_msgSend(v11, "isVideo");

      }
      v4 = (v16 + v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }

  -[PLMomentShare setStartDate:](self, "setStartDate:", v8);
  -[PLMomentShare setEndDate:](self, "setEndDate:", v7);
  -[PLMomentShare setAssetCount:](self, "setAssetCount:", v4);
  -[PLMomentShare setPhotosCount:](self, "setPhotosCount:", v5);
  -[PLMomentShare setVideosCount:](self, "setVideosCount:", v6);

}

- (BOOL)supportsCloudUpload
{
  return 1;
}

- (BOOL)isSyncableChange
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLMomentShare changedValues](self, "changedValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)cplScopeChange
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[PLMomentShare scopeIdentifier](self, "scopeIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLMomentShare.m"), 305, CFSTR("Missing scope identifier for moment share"));

  }
  v39 = (void *)v4;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D113E8], "newScopeChangeWithScopeIdentifier:type:", v4, -[PLShare scopeType](self, "scopeType"));
  -[PLMomentShare title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[PLMomentShare creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCreationDate:", v7);

  -[PLMomentShare startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStartDate:", v8);

  -[PLMomentShare endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndDate:", v9);

  objc_msgSend(v5, "setPromisedAssetCount:", (int)-[PLMomentShare assetCount](self, "assetCount"));
  objc_msgSend(v5, "setPromisedPhotosCount:", (int)-[PLMomentShare photosCount](self, "photosCount"));
  objc_msgSend(v5, "setPromisedVideosCount:", (int)-[PLMomentShare videosCount](self, "videosCount"));
  -[PLMomentShare originatingScopeIdentifier](self, "originatingScopeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOriginatingScopeIdentifier:", v10);

  -[PLMomentShare thumbnailImageData](self, "thumbnailImageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v37 = v11;
  if (v12 <= objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize"))
  {
    objc_msgSend(v5, "setThumbnailImageData:", v11);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize");
    -[PLMomentShare scopeIdentifier](self, "scopeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Setting thumbnail image data that is more than %ld bytes to moment share %@, it will not be synced"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PLSimulateCrash();
  }
  -[PLMomentShare previewData](self, "previewData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v5;
  objc_msgSend(v5, "setPreviewImageData:", v17);

  v18 = objc_alloc_init(MEMORY[0x1E0D11470]);
  -[PLMomentShare shareURL](self, "shareURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setURL:", v19);

  v36 = v18;
  objc_msgSend(v18, "setPublicPermission:", -[PLShare publicPermission](self, "publicPermission"));
  v20 = (void *)MEMORY[0x1E0C99DE8];
  -[PLMomentShare participants](self, "participants");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[PLMomentShare participants](self, "participants");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v29 = objc_alloc(MEMORY[0x1E0D11478]);
        objc_msgSend(v28, "emailAddress");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithEmail:", v30);

        objc_msgSend(v28, "phoneNumber");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPhoneNumber:", v32);

        objc_msgSend(v31, "setPermission:", objc_msgSend(v28, "permission"));
        objc_msgSend(v22, "addObject:", v31);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v25);
  }

  objc_msgSend(v36, "setParticipants:", v22);
  -[PLMomentShare expiryDate](self, "expiryDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setExpiryDate:", v33);

  objc_msgSend(v38, "setShare:", v36);
  return v38;
}

- (void)publishWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  PLMomentShare *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLManagedObject photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudPhotoLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PLMomentShare setLocalPublishState:](self, "setLocalPublishState:", 1);
    -[PLMomentShare cplScopeChange](self, "cplScopeChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E3670C68;
    v13 = v5;
    v14 = self;
    v15 = v4;
    objc_msgSend(v7, "publishCPLScopeChange:completionHandler:", v8, v12);

    v9 = v13;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("PLCloudPhotoLibraryManager is not available");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 41004, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v9);
  }

}

- (void)autoAcceptShareIfNecessary
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[PLMomentShare _shouldAutoAccept](self, "_shouldAutoAccept"))
  {
    PLBackendSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[PLShare compactDescription](self, "compactDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Auto-accept moment share %@", buf, 0xCu);

    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__PLMomentShare_autoAcceptShareIfNecessary__block_invoke;
    v5[3] = &unk_1E3674D50;
    v5[4] = self;
    -[PLShare acceptWithCompletionHandler:](self, "acceptWithCompletionHandler:", v5);
  }
}

- (BOOL)_shouldAutoAccept
{
  int v3;

  v3 = -[PLMomentShare status](self, "status");
  if (v3 != 1)
    LOBYTE(v3) = -[PLMomentShare assetCount](self, "assetCount") <= 0x1F3
              && -[PLMomentShare _isOwnerInContacts](self, "_isOwnerInContacts");
  return v3;
}

- (void)trash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PLMomentShare;
  -[PLShare trash](&v15, sel_trash);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PLMomentShare momentShareAssets](self, "momentShareAssets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D73310], "maskForAutoDeleteAssetsUponMomentShareTrash");
        objc_msgSend(v9, "savedAssetType");
        if (PLValidatedSavedAssetTypeApplies())
        {
          +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("Deleting asset as moment share was trashed"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deleteWithReason:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v6);
  }

}

- (id)_contactStore
{
  if (_contactStore_onceToken != -1)
    dispatch_once(&_contactStore_onceToken, &__block_literal_global_73940);
  return (id)_contactStore_contactStore;
}

- (BOOL)_isOwnerInContacts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PLShare owner](self, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMomentShare _contactStore](self, "_contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0x1E0C97000uLL;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, MEMORY[0x1E0C9AA60], &v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v31;
    v11 = v10;
    if (v9)
      v12 = 1;
    else
      v12 = v10 == 0;
    if (v12)
    {
      v29 = v6;
      v13 = objc_msgSend(v9, "count");
      PLBackendSharingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (!v14)
        {
          v16 = 1;
LABEL_30:
          v6 = v29;

          goto LABEL_31;
        }
        -[PLShare compactDescription](self, "compactDescription");
        v15 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v15;
        v34 = 2112;
        v35 = v8;
        v16 = 1;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Found local contact matching predicate [email=%@]", buf, 0x16u);
        goto LABEL_29;
      }
      if (v14)
      {
        -[PLShare compactDescription](self, "compactDescription");
        v21 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v21;
        v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Did not find local contact matching predicate [email=%@", buf, 0x16u);

      }
      v6 = v29;
    }
    else
    {
      PLBackendSharingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        -[PLShare compactDescription](self, "compactDescription");
        v19 = v6;
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = v20;
        v34 = 2112;
        v35 = v4;
        v36 = 2112;
        v37 = v11;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Auto Accept CMM: %@, Error attempting to fetch all unified contacts matching predicate [email=%@] : %@", buf, 0x20u);

        v6 = v19;
        v7 = 0x1E0C97000;
      }
    }

  }
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v7 + 512), "predicateForContactsMatchingPhoneNumber:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v29 = v6;
    objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, MEMORY[0x1E0C9AA60], &v30);
    v17 = objc_claimAutoreleasedReturnValue();
    v22 = v30;
    v9 = v22;
    if (v17 || !v22)
    {
      v24 = -[NSObject count](v17, "count");
      PLBackendSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v24)
      {
        if (v25)
        {
          -[PLShare compactDescription](self, "compactDescription");
          v26 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          v34 = 2112;
          v35 = v11;
          v16 = 1;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Found local contact matching predicate [phone=%@]", buf, 0x16u);

        }
        else
        {
          v16 = 1;
        }
        goto LABEL_29;
      }
      if (v25)
      {
        -[PLShare compactDescription](self, "compactDescription");
        v27 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v27;
        v34 = 2112;
        v35 = v11;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Did not find local contact matching predicate [phone=%@", buf, 0x16u);

      }
    }
    else
    {
      PLBackendSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[PLShare compactDescription](self, "compactDescription");
        v23 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v33 = v23;
        v34 = 2112;
        v35 = v5;
        v36 = 2112;
        v37 = v9;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Auto Accept CMM: %@, Error attempting to fetch all unified contacts matching predicate [phone=%@] : %@", buf, 0x20u);

      }
    }
    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v16 = 0;
LABEL_31:

  return v16;
}

- (unint64_t)estimateUploadSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[PLMomentShare momentShareAssets](self, "momentShareAssets", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "fetchSourceAssetForDuplicationIfExists");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "master");
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = (void *)v11;
            objc_msgSend(v10, "master");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "cloudLocalState");

            if (v14 != 3)
              v6 += objc_msgSend(v10, "originalFilesize");
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  PLBackendSharingGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[PLShare compactDescription](self, "compactDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2048;
    v25 = v6;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Estimate upload size for moment share %@: %lld", buf, 0x16u);

  }
  return v6;
}

void __30__PLMomentShare__contactStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)_contactStore_contactStore;
  _contactStore_contactStore = (uint64_t)v0;

}

void __43__PLMomentShare_autoAcceptShareIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLBackendSharingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "compactDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to auto accept moment share %@: %@", (uint8_t *)&v6, 0x16u);

    }
  }

}

void __46__PLMomentShare_publishWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "share");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke_2;
  v22[3] = &unk_1E3670C40;
  v11 = v6;
  v12 = *(_QWORD *)(a1 + 40);
  v23 = v11;
  v24 = v12;
  v25 = v8;
  v26 = v5;
  v27 = *(id *)(a1 + 32);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke_61;
  v17[3] = &unk_1E3671878;
  v13 = *(id *)(a1 + 48);
  v18 = v25;
  v19 = v26;
  v20 = v11;
  v21 = v13;
  v14 = v11;
  v15 = v26;
  v16 = v25;
  objc_msgSend(v9, "performTransaction:completionHandler:withPriority:", v22, v17, 1);

}

void __46__PLMomentShare_publishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "setShareURL:");
    }
    else
    {
      PLBackendSharingGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "compactDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Missing moment shareURL after publishing share %@", (uint8_t *)&v16, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setLocalPublishState:", 2);
    PLBackendSharingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "compactDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Published moment share %@", (uint8_t *)&v16, 0xCu);

    }
    v2 = *(id *)(a1 + 56);
    -[NSObject expiryDate](v2, "expiryDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "setExpiryDate:", v3);
    }
    else
    {
      PLBackendSharingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "compactDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Missing expiryDate after publishing moment share %@", (uint8_t *)&v16, 0xCu);

      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreBudgets"))
    {
      objc_msgSend(*(id *)(a1 + 40), "scopeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLBackendSharingGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "compactDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Boosting priority for moment share %@ after publish", (uint8_t *)&v16, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 64), "libraryServicesManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cloudPhotoLibraryManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boostPriorityForMomentShareWithScopeIdentifier:completionHandler:", v11, 0);

    }
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 40), "setLocalPublishState:", 3);
  PLBackendSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 40), "compactDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v16 = 138412546;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Failed to publish moment share %@: %@", (uint8_t *)&v16, 0x16u);
LABEL_20:

  }
}

uint64_t __46__PLMomentShare_publishWithCompletionHandler___block_invoke_61(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __40__PLMomentShare__updateWithScopeChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v6 = objc_msgSend(v8, "integerValue");
    v7 = a1 + 32;
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) += v6;
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC568]))
  {
    v6 = objc_msgSend(v8, "integerValue");
    v7 = a1 + 40;
    goto LABEL_5;
  }
LABEL_6:

}

void __52__PLMomentShare_forceSyncMomentShares_photoLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "scopeIdentifier", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v7, "scopeIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

void __39__PLMomentShare_listOfSyncedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("shareURL"), CFSTR("trashedState"), CFSTR("localPublishState"), 0);
  v1 = (void *)listOfSyncedProperties_result_73989;
  listOfSyncedProperties_result_73989 = v0;

}

@end
