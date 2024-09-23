@implementation PLCloudSharedAssetSaveJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCloudSharedAssetSaveJob;
  -[PLDaemonJob encodeToXPCObject:](&v16, sel_encodeToXPCObject_, v4);
  -[PLCloudSharedAssetSaveJob currentFilePath](self, "currentFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedAssetSaveJob cloudPersonID](self, "cloudPersonID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCloudAssetMediaAssetType, -[PLCloudSharedAssetSaveJob currentCloudAssetMediaAssetType](self, "currentCloudAssetMediaAssetType"));
  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyCloudAssetIsVideo, -[PLCloudSharedAssetSaveJob isVideo](self, "isVideo"));
  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyCloudAssetIsPhotoIris, -[PLCloudSharedAssetSaveJob isPhotoIris](self, "isPhotoIris"));
  -[PLCloudSharedAssetSaveJob cloudAssetGUIDsToDelete](self, "cloudAssetGUIDsToDelete");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  -[PLCloudSharedAssetSaveJob assetCollectionInfos](self, "assetCollectionInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;
    if (!v11)
    {
      PLPhotoSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v12;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Failed to archive assetCollectionInfosData, error: %@", buf, 0xCu);
      }

    }
    PLXPCDictionarySetData();

  }
  -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCloudAssetSaveJobType, -[PLCloudSharedAssetSaveJob jobType](self, "jobType"));
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLCloudSharedAssetSaveJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v21, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
  {
    PLStringFromXPCDictionary();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentFilePath:", v8);

    objc_msgSend(v7, "setCurrentCloudAssetMediaAssetType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCloudAssetMediaAssetType));
    objc_msgSend(v7, "setIsVideo:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyCloudAssetIsVideo));
    objc_msgSend(v7, "setIsPhotoIris:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyCloudAssetIsPhotoIris));
    PLStringFromXPCDictionary();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCurrentCloudAssetGUID:", v9);

    PLStringFromXPCDictionary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCloudAlbumGUID:", v10);

    PLStringFromXPCDictionary();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCloudPersonID:", v11);

    PLArrayFromXPCDictionary();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCloudAssetGUIDsToDelete:", v12);

    PLDataFromXPCDictionary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3710];
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pl_safeUnarchiveObjectFromData:classes:", v13, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        objc_msgSend(v7, "setAssetCollectionInfos:", v18);

    }
    PLDictionaryFromXPCDictionary();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMstreamdInfoDictionary:", v19);

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCloudAssetSaveJobType));
  }

  return v7;
}

- (PLCloudSharedAssetSaveJob)initWithAssetsdClient:(id)a3
{
  PLCloudSharedAssetSaveJob *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAssetSaveJob;
  result = -[PLCloudSharingJob initWithAssetsdClient:](&v4, sel_initWithAssetsdClient_, a3);
  if (result)
    result->_isVideo = 0;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;

  switch(-[PLCloudSharedAssetSaveJob jobType](self, "jobType"))
  {
    case 0:
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_opt_class();
      -[PLCloudSharedAssetSaveJob assetCollectionInfos](self, "assetCollectionInfos");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "valueForKey:", CFSTR("GUID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (PLSaveAssetMetadataForCollectionsJobType cloudAssetCollection GUIDS=%@ cloudAlbumGUID=%@ info=%@) "), v4, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    case 1:
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_opt_class();
      -[PLCloudSharedAssetSaveJob currentFilePath](self, "currentFilePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PLCloudSharedAssetSaveJob currentCloudAssetMediaAssetType](self, "currentCloudAssetMediaAssetType");
      -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob cloudPersonID](self, "cloudPersonID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (PLSaveAssetJobType filePath=%@ cloudAssetGUID=%@ cloudAssetMediaAssetType=%lu loudAlbumGUID=%@ cloudAlbumGUID=%@ info=%@ prioritize=%d) "), v11, v12, v13, v14, v15, v16, v17, -[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    case 2:
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_opt_class();
      -[PLCloudSharedAssetSaveJob cloudAssetGUIDsToDelete](self, "cloudAssetGUIDsToDelete");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ (PLDeleteAssetJobType cloudAssetGUIDsToDelete=%@ info=%@) "), v19, v5, v6);
      goto LABEL_7;
    case 3:
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_opt_class();
      -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ (PLReplaceRecentlyUploadedOriginalWithDerivative cloudAssetCollection=%@ cloudAlbumGUID=%@) "), v21, v5, v6);
LABEL_7:
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      return v9;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (PLDownloadPendingAssets "), objc_opt_class(), v23);
      goto LABEL_10;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unknown job type %ld "), objc_opt_class(), -[PLCloudSharedAssetSaveJob jobType](self, "jobType"));
LABEL_10:
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      return v9;
  }
}

- (void)dealloc
{
  NSMutableArray *pendingDownloadNotifications;
  objc_super v4;

  pendingDownloadNotifications = self->_pendingDownloadNotifications;
  self->_pendingDownloadNotifications = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLCloudSharedAssetSaveJob;
  -[PLCloudSharedAssetSaveJob dealloc](&v4, sel_dealloc);
}

- (int64_t)daemonOperation
{
  return 5;
}

- (void)setupSaveAssetMetadataForCollectionsJobForAssetCollections:(id)a3 album:(id)a4 personID:(id)a5 info:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  AssetCollectionInfo *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PLCloudSharedAssetSaveJob setJobType:](self, "setJobType:", 0);
  v22 = v11;
  objc_msgSend(v11, "GUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAssetSaveJob setCloudAlbumGUID:](self, "setCloudAlbumGUID:", v14);

  -[PLCloudSharedAssetSaveJob setCloudPersonID:](self, "setCloudPersonID:", v12);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = -[AssetCollectionInfo initWithAssetCollection:]([AssetCollectionInfo alloc], "initWithAssetCollection:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v20));
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
    -[PLCloudSharedAssetSaveJob setAssetCollectionInfos:](self, "setAssetCollectionInfos:", v15);
  -[PLCloudSharedAssetSaveJob setMstreamdInfoDictionary:](self, "setMstreamdInfoDictionary:", v13);

}

- (void)runDaemonSide
{
  NSObject *v3;
  void *v4;
  id v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  PLCloudSharedAssetSaveJob *v11;
  uint64_t v12;
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
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id obj;
  uint64_t v39;
  PLCloudSharedAssetSaveJob *v40;
  _QWORD v41[5];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  PLCloudSharedAssetSaveJob *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v49 = v4;
    v50 = 2112;
    v51 = self;
    v5 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);

  }
  v6 = -[PLCloudSharedAssetSaveJob jobType](self, "jobType");
  if (v6 == 1)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    -[PLCloudSharedAssetSaveJob currentFilePath](self, "currentFilePath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("path %@ asset GUID %@ album GUID %@ prioritize %d"), v23, v24, v25, -[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize"));
    obj = (id)objc_claimAutoreleasedReturnValue();

    PLPhotoSharingGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize");
      *(_DWORD *)buf = 138412546;
      v49 = v27;
      v50 = 1024;
      LODWORD(v51) = v28;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Saving asset %@ prioritize %d", buf, 0x12u);

    }
    -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLCloudSharedAssetSaveJob isProcessingThumbnail](self, "isProcessingThumbnail"))
      v29 = 230;
    else
      v29 = 231;
    -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:](PLPhotoSharingHelper, "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:", v10, v9, obj, v29, 0);
    goto LABEL_19;
  }
  if (v6)
    goto LABEL_21;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[PLCloudSharedAssetSaveJob assetCollectionInfos](self, "assetCollectionInfos");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v39 = *(_QWORD *)v44;
    v40 = self;
    v11 = self;
    do
    {
      v12 = 0;
      v13 = v9;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
        v16 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v15, "GUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0CB3940];
        -[PLCloudSharedAssetSaveJob cloudPersonID](v11, "cloudPersonID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudSharedAssetSaveJob cloudAlbumGUID](v11, "cloudAlbumGUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("personID %@ album GUID %@ collection %@"), v19, v20, v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v17;
        -[PLCloudSharedAssetSaveJob cloudAlbumGUID](v11, "cloudAlbumGUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:](PLPhotoSharingHelper, "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:", v9, v21, v10, 205, 0);

        objc_autoreleasePoolPop(v16);
        ++v12;
        v13 = v9;
        v14 = v10;
      }
      while (v8 != v12);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v8);
    self = v40;
LABEL_19:

  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharedAssetSaveJob runDaemonSide]");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0CB34C8];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __42__PLCloudSharedAssetSaveJob_runDaemonSide__block_invoke;
  v41[3] = &unk_1E3677C18;
  v41[4] = self;
  v42 = v30;
  v32 = v30;
  objc_msgSend(v31, "blockOperationWithBlock:", v41);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLCloudSharingJob shouldPrioritize](self, "shouldPrioritize"))
  {
    PLPhotoSharingGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v35;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Setting prioritize for %@", buf, 0xCu);

    }
    objc_msgSend(v33, "setQueuePriority:", 4);
    objc_msgSend((id)objc_opt_class(), "highPriorityOperationQueue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "lowPriorityOperationQueue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = v36;
  objc_msgSend(v36, "addOperation:", v33);

}

- (BOOL)isProcessingThumbnail
{
  return -[PLCloudSharedAssetSaveJob placeHolderKindFromAssetMetadataType:](self, "placeHolderKindFromAssetMetadataType:", -[PLCloudSharedAssetSaveJob currentCloudAssetMediaAssetType](self, "currentCloudAssetMediaAssetType")) == 3;
}

- (signed)placeHolderKindFromAssetMetadataType:(unint64_t)a3
{
  signed __int16 v5;
  NSObject *v6;
  void *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = 3;
  switch(a3)
  {
    case 1uLL:
      v5 = 5;
      break;
    case 2uLL:
      return v5;
    case 3uLL:
      v5 = 4;
      break;
    case 5uLL:
      v5 = 7;
      break;
    case 7uLL:
      if (-[PLCloudSharedAssetSaveJob isVideo](self, "isVideo"))
        v5 = 9;
      else
        v5 = 8;
      break;
    default:
      PLPhotoSharingGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 134218242;
        v10 = a3;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "unrecognized asset type %lu for asset %@", (uint8_t *)&v9, 0x16u);

      }
      v5 = 1;
      break;
  }
  return v5;
}

- (void)executeDaemonOperationSaveAssetJobType
{
  unint64_t v3;
  AssetCollectionInfo *v4;
  AssetCollectionInfo *currentAssetCollectionInfo;
  void *v6;
  void *v7;
  NSObject *v8;
  NSArray *assetCollectionInfos;
  AssetCollectionInfo *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  NSArray *v15;
  __int16 v16;
  AssetCollectionInfo *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[PLCloudSharedAssetSaveJob currentCloudAssetMediaAssetType](self, "currentCloudAssetMediaAssetType");
  -[NSArray lastObject](self->_assetCollectionInfos, "lastObject");
  v4 = (AssetCollectionInfo *)objc_claimAutoreleasedReturnValue();
  currentAssetCollectionInfo = self->_currentAssetCollectionInfo;
  self->_currentAssetCollectionInfo = v4;

  -[AssetCollectionInfo GUID](self->_currentAssetCollectionInfo, "GUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PLCloudSharedAssetSaveJob setCurrentCloudAssetGUID:](self, "setCurrentCloudAssetGUID:", v6);
    -[PLCloudSharedAssetSaveJob setIsVideo:](self, "setIsVideo:", -[AssetCollectionInfo isVideo](self->_currentAssetCollectionInfo, "isVideo"));
    -[PLCloudSharedAssetSaveJob setIsPhotoIris:](self, "setIsPhotoIris:", -[AssetCollectionInfo isPhotoIris](self->_currentAssetCollectionInfo, "isPhotoIris"));
    -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke;
    v11[3] = &unk_1E3677C40;
    v12 = v7;
    v13 = v3;
    v11[4] = self;
    v8 = v7;
    -[PLCloudSharedAssetSaveJob _performSaveTransactionAndWaitOnLibrary:transaction:completion:](self, "_performSaveTransactionAndWaitOnLibrary:transaction:completion:", v8, v11, &__block_literal_global_64042);

  }
  else
  {
    if (MEMORY[0x19AEC04BC]())
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("executeDaemonOperationSaveAssetJobType missing current asset collection information: %@/%@"), self->_assetCollectionInfos, self->_currentAssetCollectionInfo);
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      assetCollectionInfos = self->_assetCollectionInfos;
      v10 = self->_currentAssetCollectionInfo;
      *(_DWORD *)buf = 138412546;
      v15 = assetCollectionInfos;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "executeDaemonOperationSaveAssetJobType missing current asset collection information: %@/%@", buf, 0x16u);
    }
  }

}

- (id)_createPlaceHolderInSharedAlbum:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  CLLocationCoordinate2D v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  unsigned __int16 v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  NSObject *v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  CLLocationDegrees v77;
  _BYTE buf[12];
  __int16 v79;
  id v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  unint64_t v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v75 = a3;
  objc_msgSend(v75, "photoLibrary");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v67) = 257;
  +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:mainFileMetadata:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:isPlaceholder:deleteFileOnFailure:", v76, 0, 0, objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset"), 2, 0, 0, 0, 0, v67);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setVisibilityState:", 2);
    -[AssetCollectionInfo width](self->_currentAssetCollectionInfo, "width");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    -[AssetCollectionInfo height](self->_currentAssetCollectionInfo, "height");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");

    objc_msgSend(v5, "setWidth:", v7);
    objc_msgSend(v5, "setOriginalWidth:", v7);
    objc_msgSend(v5, "setHeight:", v9);
    objc_msgSend(v5, "setOriginalHeight:", v9);
    -[AssetCollectionInfo originalFilesize](self->_currentAssetCollectionInfo, "originalFilesize");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOriginalFilesize:", objc_msgSend(v10, "longLongValue"));

    -[AssetCollectionInfo originalFilename](self->_currentAssetCollectionInfo, "originalFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOriginalFilename:", v11);

    -[AssetCollectionInfo metaData](self->_currentAssetCollectionInfo, "metaData");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKey:", *MEMORY[0x1E0D16CF0]);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_9;
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find a creation date, setting to modification date", buf, 2u);
    }

    objc_msgSend(v5, "modificationDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_9;
    PLPhotoSharingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't find a creation date, setting to now", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
LABEL_9:
      objc_msgSend(v5, "setDateCreated:", v12);
    v69 = (void *)v12;
    objc_msgSend(v74, "objectForKey:", *MEMORY[0x1E0D16D10]);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    if (v72)
    {
      if (objc_msgSend(v72, "length"))
      {
        v77 = 0.0;
        *(_QWORD *)buf = 0;
        if (objc_msgSend(MEMORY[0x1E0D75140], "parseISO6709String:outLatitude:outLongitude:", v72, buf, &v77))
        {
          v15 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)buf, v77);
          if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
          {
            v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v15.latitude, v15.longitude, 0.0, 0.0, 0.0);
            if (v16)
              objc_msgSend(v5, "setLocation:", v16);
          }
          else
          {
            v16 = 0;
          }

        }
      }
    }
    if (-[AssetCollectionInfo isVideo](self->_currentAssetCollectionInfo, "isVideo"))
    {
      objc_msgSend(v5, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", 1);
      objc_msgSend(v5, "setKindSubtype:", 100);
      objc_msgSend(v74, "objectForKey:", *MEMORY[0x1E0D16D20]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "doubleValue");
        objc_msgSend(v5, "setDuration:");
        if (PLPlatformExtendedAttributesSupported())
        {
          objc_msgSend(v5, "extendedAttributesCreateIfNeeded:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setDuration:", v26);

        }
        PLPhotoSharingGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v29;
          v79 = 2112;
          v80 = v26;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "setting video duration from metadata for cloudGUID %@ to %@", buf, 0x16u);

        }
      }

    }
    else
    {
      objc_msgSend(v5, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", 0);
    }
    objc_msgSend(v74, "objectForKey:", *MEMORY[0x1E0D16D18]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntValue");

    objc_msgSend(v5, "setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:", v31);
    -[AssetCollectionInfo derivativeUTI](self->_currentAssetCollectionInfo, "derivativeUTI");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(v5, "setUniformTypeIdentifier:", v73);
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v73);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqual:", *MEMORY[0x1E0CEC4F8]);

      if (v33)
        objc_msgSend(v5, "setPlaybackStyle:", 2);
    }
    objc_msgSend(v69, "timeIntervalSinceReferenceDate");
    objc_msgSend(v5, "setSortToken:");
    objc_msgSend(v5, "setSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCloudSharedAsset"));
    objc_msgSend(v5, "setBundleScope:", 2);
    -[AssetCollectionInfo personID](self->_currentAssetCollectionInfo, "personID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCloudOwnerHashedPersonID:", v34);

    objc_msgSend(v5, "setCloudIsDeletable:", -[AssetCollectionInfo isDeletable](self->_currentAssetCollectionInfo, "isDeletable"));
    objc_msgSend(v5, "setCloudIsMyAsset:", -[AssetCollectionInfo isMine](self->_currentAssetCollectionInfo, "isMine"));
    objc_msgSend(v5, "setCloudPlaceholderKind:", 2);
    -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCloudAssetGUID:", v35);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCloudDownloadRequests:", v36);

    -[AssetCollectionInfo timestamp](self->_currentAssetCollectionInfo, "timestamp");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
      objc_msgSend(v5, "setCloudServerPublishDate:", v37);
    v68 = (void *)v37;
    objc_msgSend(v5, "uniformTypeIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v38);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLCloudSharedAssetSaveJob cloudPersonID](self, "cloudPersonID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "pathManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:](PLCloudSharedAssetSaveJob, "nextDCIMSaveFileURLForCloudPersonID:cloudAlbumGUID:pathManager:fileExtension:assetUUID:", v39, v40, v41, v70, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByDeletingLastPathComponent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v43, "lastPathComponent");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45 && v71)
    {
      objc_msgSend(v76, "pathManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isUBF");

      objc_msgSend(v76, "pathManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v47)
        v50 = 22;
      else
        v50 = 31;
      objc_msgSend(v48, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v45, v50, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      PLPhotoSharingGetLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v51;
        v79 = 2112;
        v80 = v71;
        v81 = 2112;
        v82 = v53;
        _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "setting directory/filename to %@/%@ for cloudSharedAsset %@", buf, 0x20u);

      }
      objc_msgSend(v5, "setDirectory:", v51);
      objc_msgSend(v5, "setFilename:", v71);
    }
    else
    {
      PLPhotoSharingGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
        v55 = (id)objc_claimAutoreleasedReturnValue();
        -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v43;
        v79 = 2112;
        v80 = v55;
        v81 = 2112;
        v82 = v70;
        v83 = 2112;
        v84 = v56;
        _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, "unable to get directory/filename from %@ for cloudSharedAsset %@ with extension %@ in album %@", buf, 0x2Au);

      }
      v51 = v45;
    }
    objc_msgSend(v76, "managedObjectContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob _updatePhotoIrisPropertiesIfNecessaryForAsset:inManagedObjectContext:](self, "_updatePhotoIrisPropertiesIfNecessaryForAsset:inManagedObjectContext:", v5, v57);

    objc_msgSend(v74, "valueForKey:", *MEMORY[0x1E0D16CE8]);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
      objc_msgSend(v5, "setCloudBatchID:", v58);
    objc_msgSend(v74, "valueForKey:", *MEMORY[0x1E0D16CE0]);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
      objc_msgSend(v5, "setCloudBatchPublishDate:", v59);
    if (-[AssetCollectionInfo isMine](self->_currentAssetCollectionInfo, "isMine"))
      objc_msgSend(v75, "updateCloudLastContributionDateWithDate:", v59);
    v60 = -[PLCloudSharedAssetSaveJob _insertionIndexForAsset:inAlbum:](self, "_insertionIndexForAsset:inAlbum:", v5, v75);
    objc_msgSend(v75, "mutableAssets");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "insertObject:atIndex:", v5, v60);

    PLPhotoSharingGetLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
      v63 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateCreated");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v63;
      v79 = 2112;
      v80 = v58;
      v81 = 2112;
      v82 = v59;
      v83 = 2112;
      v84 = v64;
      v85 = 2048;
      v86 = v60;
      _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_DEFAULT, "Inserted new asset (GUID:%@ cloudAssetBatchID:%@ cloudAssetBatchDate:%@ dateCreated:%@) at index %lu", buf, 0x34u);

    }
    objc_msgSend(v75, "updateCloudLastInterestingChangeDateWithDate:", v59);
    -[PLCloudSharedAssetSaveJob _processInFlightCommentsForAsset:inAlbum:inPhotoLibrary:](self, "_processInFlightCommentsForAsset:inAlbum:inPhotoLibrary:", v5, v75, v76);
    +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v5, 1, 0, 0);

    v65 = v5;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = objc_opt_class();
    -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ ERROR: in insertAssetIntoPhotoLibrary:asset GUID:%@"), v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v20, *MEMORY[0x1E0CB2D50]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PLCloudSharedAssetSaveJob"), 197703, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = objc_opt_class();
        v79 = 2112;
        v80 = v22;
        v24 = *(id *)&buf[4];
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "%@: Error creating placeholder: %@", buf, 0x16u);

      }
    }

  }
  return v5;
}

- (void)_processInFlightCommentsForAsset:(id)a3 inAlbum:(id)a4 inPhotoLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37 = a4;
  v9 = a5;
  objc_msgSend(v9, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "directoryPathForInFlightComments:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v8;
  objc_msgSend(v8, "cloudAssetGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      +[PLCloudSharedComment cloudSharedCommentsWithGUIDs:inLibrary:](PLCloudSharedComment, "cloudSharedCommentsWithGUIDs:inLibrary:", v14, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "count");
      if (v17 != objc_msgSend(v16, "count"))
      {
        PLPhotoSharingGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(v15, "count");
          objc_msgSend(v38, "cloudAssetGUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v45 = v19;
          v46 = 2112;
          v47 = v20;
          v48 = 2048;
          v49 = objc_msgSend(v16, "count");
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "WARNING: Expected %lu inflight comments for asset %@ but only found %lu", buf, 0x20u);

        }
      }
      v35 = v15;
      v36 = v13;
      if (objc_msgSend(v16, "count"))
      {
        PLPhotoSharingGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v16, "count");
          objc_msgSend(v38, "cloudAssetGUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v45 = v22;
          v46 = 2112;
          v47 = v23;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Will attach %lu inflight comments to asset %@", buf, 0x16u);

        }
      }
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v24 = v16;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v40 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v38, "addComment:", v29);
            v30 = objc_msgSend(v29, "isLikeBoolValue");
            +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
              objc_msgSend(v31, "noteDidReceiveLike:mstreamdInfo:", v29, v32);
            else
              objc_msgSend(v31, "noteDidReceiveComment:mstreamdInfo:", v29, v32);

            if (objc_msgSend(v29, "isInterestingForAlbumsSorting"))
            {
              objc_msgSend(v29, "commentDate");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "updateCloudLastInterestingChangeDateWithDate:", v33);

            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v26);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v36;
      objc_msgSend(v34, "removeItemAtPath:error:", v36, 0);

    }
  }

}

- (BOOL)_processSaveAssetWithPlaceholderKind:(signed __int16)a3 inLibrary:(id)a4 withAssetDataFilePath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  id v29;
  __CFString *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  __CFString *v39;
  __CFString *v40;
  __CFString *v41;
  NSObject *v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  __CFString *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  __CFString *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  int v65;
  id v66;
  NSObject *v67;
  __CFString *v68;
  NSObject *v69;
  int v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  __CFString *v87;
  char v88;
  id v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  unsigned int v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t i;
  __CFString *v105;
  NSObject *v106;
  void *v107;
  char v108;
  id v109;
  NSObject *v110;
  __CFString *v111;
  id v113;
  id v114;
  void *v115;
  BOOL v116;
  void *v117;
  id v118;
  __CFString *v119;
  void *v120;
  int v121;
  void *v122;
  id v123;
  __CFString *v124;
  __CFString *v125;
  void *v126;
  unsigned int v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  uint8_t v140[128];
  uint8_t buf[4];
  const __CFString *v142;
  __int16 v143;
  uint64_t v144;
  __int16 v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[4];

  v127 = a3;
  v149[1] = *MEMORY[0x1E0C80C00];
  v123 = a4;
  v7 = a5;
  v117 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
    v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v125 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v125)
    objc_msgSend(v8, "addObject:");
  -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
  v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v10, v123);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v149[0] = v124;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v149, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v12, v123);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      PLPhotoSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v142 = v124;
        v143 = 2112;
        v144 = (uint64_t)v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", buf, 0x16u);
      }

    }
    objc_msgSend(v13, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      PLPhotoSharingGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v142 = v124;
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Couldn't find asset with cloudAssetGUID %{public}@ ", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ERROR: couldn't find asset with cloudAssetGUID %@ "), objc_opt_class(), v124);
      v46 = objc_claimAutoreleasedReturnValue();
      v122 = 0;
      v116 = 0;
      v47 = 197704;
      goto LABEL_99;
    }
    v121 = objc_msgSend(v15, "cloudPlaceholderKind");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString path](v125, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v126, "fileExistsAtPath:", v17);

    if ((v18 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        -[__CFString path](v125, "path");
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v142 = v50;
        _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "InProcess file \"%@\" not found.", buf, 0xCu);

      }
      v51 = (void *)MEMORY[0x1E0CB3940];
      v52 = objc_opt_class();
      -[__CFString path](v125, "path");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", CFSTR("%@ ERROR: InProcess file \"%@\" not found."), v52, v53);
      v46 = objc_claimAutoreleasedReturnValue();
      v122 = 0;
      v116 = 0;
      v47 = 197704;
      goto LABEL_98;
    }
    v147 = *MEMORY[0x1E0CB2AD8];
    v148 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString path](v125, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = 0;
    v21 = objc_msgSend(v126, "setAttributes:ofItemAtPath:error:", v19, v20, &v139);
    v118 = v139;

    if ((v21 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[__CFString path](v125, "path");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v142 = v23;
        v143 = 2112;
        v144 = (uint64_t)v118;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);

      }
    }
    v24 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v16, "cloudSharedAssetPathForPlaceholderKind:", v127);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileURLWithPath:", v25);
    v119 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v119)
    {
      PLPhotoSharingGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        -[__CFString path](v125, "path");
        v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v142 = v55;
        _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, "No destination URL to move %@ to", buf, 0xCu);

      }
      v56 = (void *)MEMORY[0x1E0CB3940];
      v57 = objc_opt_class();
      -[__CFString path](v125, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "stringWithFormat:", CFSTR("%@ ERROR: No destination URL to move %@ to"), v57, v33);
      v46 = objc_claimAutoreleasedReturnValue();
      v122 = 0;
      v116 = 0;
      v47 = 197702;
      goto LABEL_97;
    }
    -[__CFString path](v119, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v126, "fileExistsAtPath:", v26);

    if (v27)
    {
      v138 = 0;
      v28 = objc_msgSend(v126, "removeItemAtURL:error:", v119, &v138);
      v29 = v138;
      if (!v28)
      {
        v33 = v29;
        PLPhotoSharingGetLog();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          -[__CFString path](v119, "path");
          v59 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          -[__CFString path](v125, "path");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v142 = v59;
          v143 = 2112;
          v144 = (uint64_t)v60;
          v145 = 2112;
          v146 = v33;
          _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_ERROR, "Unable to remove \"%@\" before replacing it with \"%@\": %@", buf, 0x20u);

        }
        v61 = (void *)MEMORY[0x1E0CB3940];
        v62 = objc_opt_class();
        -[__CFString path](v119, "path");
        v114 = (id)objc_claimAutoreleasedReturnValue();
        -[__CFString path](v125, "path");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringWithFormat:", CFSTR("%@ ERROR: Unable to remove \"%@\" before replacing it with \"%@\": %@"), v62, v114, v63, v33);
        v64 = objc_claimAutoreleasedReturnValue();
        goto LABEL_69;
      }

    }
    -[__CFString URLByDeletingLastPathComponent](v119, "URLByDeletingLastPathComponent");
    v137 = 0;
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = -[__CFString getResourceValue:forKey:error:](v30, "getResourceValue:forKey:error:", &v137, *MEMORY[0x1E0C99968], 0);
    v114 = v137;
    if ((v31 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v30;
      v136 = 0;
      v34 = objc_msgSend(v32, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v30, 1, 0, &v136);
      v113 = v136;

      if ((v34 & 1) == 0)
      {
        PLPhotoSharingGetLog();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v142 = v30;
          v143 = 2114;
          v144 = (uint64_t)v124;
          v145 = 2112;
          v146 = v113;
          _os_log_impl(&dword_199541000, v85, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\" for asset %{public}@: %@", buf, 0x20u);
        }
        v122 = 0;
        v116 = 0;
        goto LABEL_95;
      }

    }
    if (self->_replacingOriginalWithDerivative)
    {
      objc_msgSend(v16, "pathForOriginalFile");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v30;
      if (objc_msgSend(v126, "fileExistsAtPath:", v35))
      {
        v135 = 0;
        v36 = objc_msgSend(v126, "removeItemAtPath:error:", v35, &v135);
        v37 = v135;
        if ((v36 & 1) == 0)
        {
          PLPhotoSharingGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = (__CFString *)objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v142 = v39;
            v143 = 2112;
            v144 = (uint64_t)v35;
            v145 = 2112;
            v146 = v37;
            v40 = v39;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "%@ ERROR: (streamed-video-replacement) Unable to remove original video file \"%@\" error:%@", buf, 0x20u);

            v33 = v30;
          }

        }
      }
      if (objc_msgSend(v16, "isVideo") && (objc_msgSend(v16, "isStreamedVideo") & 1) == 0)
        objc_msgSend(v16, "setKindSubtype:", 100);

      v121 = 2;
      v41 = v119;
    }
    else
    {
      v41 = v119;
      v33 = v30;
    }
    v134 = 0;
    v65 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v125, v41, &v134);
    v66 = v134;
    v113 = v66;
    if (v65)
    {
      PLPhotoSharingGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v142 = v125;
        v143 = 2112;
        v144 = (uint64_t)v41;
        _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEBUG, "Successfully copied %@ to %@", buf, 0x16u);
      }

      v68 = v119;
      if ((objc_msgSend(v16, "hasMasterThumb") & 1) != 0 || v127 > 7 || ((1 << v127) & 0x98) == 0)
      {
        if (self->_replacingOriginalWithDerivative)
        {
          PLPhotoSharingGetLog();
          v69 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            v70 = objc_msgSend(v16, "kind");
            -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = (void *)v71;
            v73 = CFSTR("size");
            if (!v70)
              v73 = CFSTR("image width, height and size");
            *(_DWORD *)buf = 138412546;
            v142 = v73;
            v143 = 2112;
            v144 = v71;
            _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_DEFAULT, "Setting %@ for asset with cloudGUID %@", buf, 0x16u);

          }
          -[PLCloudSharedAssetSaveJob assetCollectionInfos](self, "assetCollectionInfos");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "firstObject");
          v75 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v75, "width");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWidth:", objc_msgSend(v76, "longLongValue"));

          objc_msgSend(v75, "height");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setHeight:", objc_msgSend(v77, "longLongValue"));

          objc_msgSend(v75, "originalFilesize");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setOriginalFilesize:", objc_msgSend(v78, "longLongValue"));

          objc_msgSend(v16, "setSpatialType:", 0);
          if (PLPlatformExtendedAttributesSupported())
          {
            if (objc_msgSend(v16, "kind"))
            {
              if (objc_msgSend(v16, "kind") == 1)
              {
                objc_msgSend(v75, "metaData");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v79, "objectForKey:", *MEMORY[0x1E0D16D20]);
                v80 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v16, "extendedAttributesCreateIfNeeded:", v80 != 0);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = v81;
                if (v80)
                  objc_msgSend(v81, "setDuration:", v80);

              }
            }
            else
            {
              -[PLCloudSharedAssetSaveJob _updateAsset:withImageFileURL:](self, "_updateAsset:withImageFileURL:", v16, v119);
            }
          }

          v68 = v119;
        }
      }
      else
      {
        PLPhotoSharingGetLog();
        v86 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
          v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v142 = v87;
          _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with cloudGUID %@", buf, 0xCu);

        }
        v68 = v119;
        -[PLCloudSharedAssetSaveJob _updateAsset:withImageFileURL:](self, "_updateAsset:withImageFileURL:", v16, v119);
      }
      if (v127 == 3 && objc_msgSend(v16, "hasMasterThumb"))
      {
        v133 = 0;
        v88 = objc_msgSend(v126, "removeItemAtURL:error:", v68, &v133);
        v89 = v133;
        if ((v88 & 1) == 0)
        {
          PLPhotoSharingGetLog();
          v90 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v142 = v119;
            v143 = 2112;
            v144 = (uint64_t)v89;
            _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_ERROR, "Unable to remove thumbnail resource from %@ after generating local thumb: %@", buf, 0x16u);
          }

        }
      }
      if (v121 < (int)v127)
        objc_msgSend(v16, "setCloudPlaceholderKind:", v127);
      objc_msgSend(v16, "uuid");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:cloudPlaceholderKind:](PLPhotoSharingHelper, "downloadNotificationForAssetwithUUID:cloudPlaceholderKind:", v91, v127);
      v85 = objc_claimAutoreleasedReturnValue();

      -[PLCloudSharedAssetSaveJob _addDownloadNotification:](self, "_addDownloadNotification:", v85);
      if (v121 != v127)
      {
        +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudSharedAssetSaveJob mstreamdInfoDictionary](self, "mstreamdInfoDictionary");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "noteDidChangePlaceholderKindForAsset:fromOldKind:forSharedAlbum:mstreamdInfo:", v16, v121, v11, v93);

      }
      -[PLCloudSharedAssetSaveJob _processInFlightCommentsForAsset:inAlbum:inPhotoLibrary:](self, "_processInFlightCommentsForAsset:inAlbum:inPhotoLibrary:", v16, v11, v123);
      v94 = (void *)MEMORY[0x1E0CB3940];
      if (self->_replacingOriginalWithDerivative)
      {
        -[__CFString path](v125, "path");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "stringWithFormat:", CFSTR("found recently uploaded derivative at %@ and replaced original for asset %@ \n "), v95, v16);
        v122 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("finished processing downloaded asset %@ \n"), v16);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v116 = 1;
LABEL_95:

      v47 = 0;
      v46 = 0;
      v63 = v113;
      goto LABEL_96;
    }
    v83 = v66;
    PLPhotoSharingGetLog();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v142 = v125;
      v143 = 2112;
      v144 = (uint64_t)v41;
      v145 = 2112;
      v146 = v83;
      _os_log_impl(&dword_199541000, v84, OS_LOG_TYPE_ERROR, "Unable to copy \"%@\" to \"%@\": %@", buf, 0x20u);
    }

    v63 = v113;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ERROR: Unable to copy \"%@\" to \"%@\": %@"), objc_opt_class(), v125, v119, v113);
    v64 = objc_claimAutoreleasedReturnValue();
LABEL_69:
    v46 = v64;
    v122 = 0;
    v116 = 0;
    v47 = 197702;
LABEL_96:

LABEL_97:
    v53 = v118;
LABEL_98:

LABEL_99:
    goto LABEL_100;
  }
  PLPhotoSharingGetLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v142 = v43;
    v143 = 2114;
    v144 = (uint64_t)v124;
    _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Couldn't find album with GUID %{public}@ to insert asset %{public}@", buf, 0x16u);

  }
  v44 = (void *)MEMORY[0x1E0CB3940];
  v45 = objc_opt_class();
  -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("%@ ERROR: couldn't find album with GUID %@ to insert asset %@"), v45, v13, v124);
  v46 = objc_claimAutoreleasedReturnValue();
  v122 = 0;
  v116 = 0;
  v47 = 197701;
LABEL_100:

  if (v46)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v46, *MEMORY[0x1E0CB2938]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PLCloudSharedAssetSaveJob"), v47, v96);
    v120 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v120 = 0;
  }
  if (-[PLCloudSharedAssetSaveJob isProcessingThumbnail](self, "isProcessingThumbnail"))
    v97 = 290;
  else
    v97 = 291;
  if (self->_replacingOriginalWithDerivative)
    v98 = 292;
  else
    v98 = v97;
  if (v127 != 2)
  {
    -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:](PLPhotoSharingHelper, "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:", v99, v100, v122, v98, v120);

  }
  v115 = (void *)v46;
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v101 = v9;
  v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
  if (v102)
  {
    v103 = *(_QWORD *)v130;
    do
    {
      for (i = 0; i != v102; ++i)
      {
        if (*(_QWORD *)v130 != v103)
          objc_enumerationMutation(v101);
        v105 = *(__CFString **)(*((_QWORD *)&v129 + 1) + 8 * i);
        PLPhotoSharingGetLog();
        v106 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v142 = v105;
          _os_log_impl(&dword_199541000, v106, OS_LOG_TYPE_DEFAULT, "Will remove INFLIGHT item at %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = 0;
        v108 = objc_msgSend(v107, "removeItemAtURL:error:", v105, &v128);
        v109 = v128;

        if ((v108 & 1) == 0)
        {
          PLPhotoSharingGetLog();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
          {
            -[__CFString path](v105, "path");
            v111 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v142 = v111;
            v143 = 2112;
            v144 = (uint64_t)v109;
            _os_log_impl(&dword_199541000, v110, OS_LOG_TYPE_ERROR, "Unable to delete in flight asset \"%@\": %@", buf, 0x16u);

          }
        }

      }
      v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v129, v140, 16);
    }
    while (v102);
  }

  return v116;
}

- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0D75140]);
  -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeZoneLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v7, 0, 13, v11, 1, 1);

  if (PLPlatformExtendedAttributesSupported())
  {
    objc_msgSend(v6, "setImageInfoFromOriginalImageMetadata:", v12);
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v24 = 138412546;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Setting the image info for asset %@ with %@", (uint8_t *)&v24, 0x16u);
    }

  }
  v14 = objc_msgSend(v12, "imageSource");
  objc_msgSend(v12, "imageData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, v14, v15, 0);

  PLPhotoSharingGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v17;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Generated new thumbnail for asset %@ with %@", (uint8_t *)&v24, 0x16u);

  }
  objc_msgSend(v6, "location");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(v12, "gpsLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocation:", v19);

  }
  objc_msgSend(v6, "longDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(v12, "captionAbstract");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLongDescription:", v21);

  }
  objc_msgSend(v6, "accessibilityDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(v12, "artworkContentDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityDescription:", v23);

  }
}

- (void)_updatePhotoIrisPropertiesIfNecessaryForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  Float64 v8;
  void *v9;
  void *v10;
  Float64 v11;
  void *v12;
  void *v13;
  CMTime v14;
  CMTime v15;

  v5 = a3;
  if (-[AssetCollectionInfo isPhotoIris](self->_currentAssetCollectionInfo, "isPhotoIris"))
  {
    if ((objc_msgSend(v5, "isPhotoIris") & 1) == 0)
      objc_msgSend(v5, "setKindSubtype:", 2);
    if (objc_msgSend(v5, "playbackStyle") != 3)
      objc_msgSend(v5, "setPlaybackStyle:", 3);
    if (!objc_msgSend(v5, "videoCpDurationValue"))
    {
      -[AssetCollectionInfo metaData](self->_currentAssetCollectionInfo, "metaData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D16D08]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        memset(&v15, 0, sizeof(v15));
        objc_msgSend(v7, "doubleValue");
        CMTimeMakeWithSeconds(&v15, v8, 600);
        v14 = v15;
        objc_msgSend(v5, "setPhotoIrisVideoDuration:", &v14);
      }
      -[AssetCollectionInfo metaData](self->_currentAssetCollectionInfo, "metaData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D16D00]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        memset(&v15, 0, sizeof(v15));
        objc_msgSend(v10, "doubleValue");
        CMTimeMakeWithSeconds(&v15, v11, 600);
        v14 = v15;
        objc_msgSend(v5, "setPhotoIrisStillDisplayTime:", &v14);
      }
      -[AssetCollectionInfo metaData](self->_currentAssetCollectionInfo, "metaData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D16CF8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v5, "setMediaGroupUUID:", v13);

    }
  }

}

- (signed)attemptLightweightReimportAssetDataInLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  unsigned __int16 v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  BOOL v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  _BYTE v43[24];
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudSharedAssetSaveJob cloudAlbumGUID](self, "cloudAlbumGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAssetSaveJob cloudPersonID](self, "cloudPersonID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudSharedAssetSaveJob currentCloudAssetGUID](self, "currentCloudAssetGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID:cloudPersonID:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v40 = v4;
    objc_msgSend(v9, "objectForKey:", CFSTR("cloudPlaceholderKind"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v39 = v8;
    if (v11)
    {
      v13 = -[NSObject intValue](v11, "intValue");
    }
    else
    {
      PLPhotoSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v43 = v7;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Missing placeholder kind value for asset with cloudAssetGUID %@, skipping lightweight reimport of unknown cache data", buf, 0xCu);
      }

      v13 = 0;
    }
    v36 = v5;
    v38 = v6;
    +[PLCloudSharedAlbum lightweightReimportDirectoryNameWithGUID:cloudPersonID:](PLCloudSharedAlbum, "lightweightReimportDirectoryNameWithGUID:cloudPersonID:", v5, v6);
    v15 = objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset lightweightReimportFileNameWithGUID:type:](PLManagedAsset, "lightweightReimportFileNameWithGUID:type:", v7, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "privateCacheDirectoryWithSubType:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)v15;
    objc_msgSend(v19, "stringByAppendingPathComponent:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)v16;
    objc_msgSend(v20, "stringByAppendingPathComponent:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v22)
    {
      v35 = v23;
      if (objc_msgSend(v23, "fileExistsAtPath:isDirectory:", v22, 0))
      {
        if (v12 && v13 <= 7u && ((1 << v13) & 0x98) != 0)
        {
          v25 = v20;
          PLPhotoSharingGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v27 = -[PLCloudSharedAssetSaveJob currentCloudAssetMediaAssetType](self, "currentCloudAssetMediaAssetType");
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v43 = v13;
            v21 = (void *)v16;
            *(_WORD *)&v43[4] = 2048;
            *(_QWORD *)&v43[6] = v27;
            *(_WORD *)&v43[14] = 2112;
            *(_QWORD *)&v43[16] = v7;
            v44 = 2112;
            v45 = v22;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "attemptLightweightReimportAssetWithPlaceholderKind:%i mediaAssetType: %lu GUID: %@ cachePath: %@", buf, 0x26u);
          }

          v28 = -[PLCloudSharedAssetSaveJob _processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:](self, "_processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:", (__int16)v13, v40, v22);
          v5 = v36;
          v29 = v37;
          v24 = v35;
          if (v28)
            goto LABEL_31;
          PLPhotoSharingGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v43 = v7;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "lightweight reimport failed for asset %@", buf, 0xCu);
          }
        }
        else
        {
          PLPhotoSharingGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v43 = v7;
            *(_WORD *)&v43[8] = 2112;
            *(_QWORD *)&v43[10] = v22;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Cannot reimport chached data for asset %@: removing cached image file at path: %@", buf, 0x16u);
          }

          v41 = 0;
          v32 = objc_msgSend(v35, "removeItemAtPath:error:", v22, &v41);
          v30 = v41;
          v25 = v20;
          if ((v32 & 1) == 0)
          {
            PLPhotoSharingGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v43 = v7;
              *(_WORD *)&v43[8] = 2112;
              *(_QWORD *)&v43[10] = v22;
              _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Failed to remove cached asset data for %@ from path: %@", buf, 0x16u);
            }

          }
          v21 = (void *)v16;
          v5 = v36;
          v29 = v37;
        }

        v13 = 0;
      }
      else
      {
        v25 = v20;
        v13 = 0;
        v5 = v36;
        v29 = v37;
      }
      v24 = v35;
    }
    else
    {
      v25 = v20;
      v13 = 0;
      v5 = v36;
      v29 = v37;
    }
LABEL_31:

    v8 = v39;
    v4 = v40;
    v6 = v38;
    goto LABEL_32;
  }
  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v43 = v7;
    *(_WORD *)&v43[8] = 2112;
    *(_QWORD *)&v43[10] = v5;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Cloud shared asset %@ not registered with album %@", buf, 0x16u);
  }
  v13 = 0;
LABEL_32:

  return v13;
}

- (void)_addDownloadNotification:(id)a3
{
  id v4;
  NSMutableArray *pendingDownloadNotifications;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pendingDownloadNotifications = self->_pendingDownloadNotifications;
  v8 = v4;
  if (!pendingDownloadNotifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_pendingDownloadNotifications;
    self->_pendingDownloadNotifications = v6;

    v4 = v8;
    pendingDownloadNotifications = self->_pendingDownloadNotifications;
  }
  -[NSMutableArray addObject:](pendingDownloadNotifications, "addObject:", v4);

}

- (void)_performSaveTransactionAndWaitOnLibrary:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PLCloudSharedAssetSaveJob__performSaveTransactionAndWaitOnLibrary_transaction_completion___block_invoke;
  v10[3] = &unk_1E3675C58;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a3, "performTransactionAndWait:completionHandler:", a4, v10);

}

- (void)executeDaemonOperationSaveAssetMetadataForCollectionsJobType
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCloudSharedAssetSaveJob *v10;
  _QWORD *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__63960;
  v16[4] = __Block_byref_object_dispose__63961;
  v5 = MEMORY[0x1E0C809B0];
  v17 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke;
  v12[3] = &unk_1E3676EC8;
  v12[4] = self;
  v6 = v3;
  v13 = v6;
  v15 = v16;
  v14 = v4;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke_279;
  v8[3] = &unk_1E3676EA0;
  v7 = v14;
  v10 = self;
  v11 = v16;
  v9 = v7;
  -[PLCloudSharedAssetSaveJob _performSaveTransactionAndWaitOnLibrary:transaction:completion:](self, "_performSaveTransactionAndWaitOnLibrary:transaction:completion:", v6, v12, v8);

  _Block_object_dispose(v16, 8);
}

- (void)executeDaemonOperationDownloadPendingAssetsJobType
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLCloudSharedAssetSaveJob *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[16];
  __int128 v14;

  v14 = 0uLL;
  -[PLCloudSharedAssetSaveJob _prefetchLimitForDerivatives:thumbnails:](self, "_prefetchLimitForDerivatives:thumbnails:", (char *)&v14 + 8, &v14);
  if (v14 == 0)
  {
    PLPhotoSharingGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Skipping prefetching cloud shared assets since there is no more budget for today", buf, 2u);
    }
  }
  else
  {
    -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudSharedAssetSaveJob cloudPersonID](self, "cloudPersonID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__PLCloudSharedAssetSaveJob_executeDaemonOperationDownloadPendingAssetsJobType__block_invoke;
    v7[3] = &unk_1E36753F8;
    v8 = v4;
    v9 = self;
    v11 = *((_QWORD *)&v14 + 1);
    v12 = v14;
    v10 = v5;
    v6 = v5;
    v3 = v4;
    -[NSObject performTransaction:](v3, "performTransaction:", v7);

  }
}

- (BOOL)_processInflightAsset:(id)a3 mediaAssetType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "cloudAssetGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAssetSaveJob pathForInFlightAssetCollectionWithGUID:mediaAssetType:](PLCloudSharedAssetSaveJob, "pathForInFlightAssetCollectionWithGUID:mediaAssetType:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "fileExistsAtPath:", v8),
        v9,
        v10))
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v6;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Inflight file for asset %@ already exists at %@. Attempting to import directly", (uint8_t *)&v21, 0x16u);
    }

    objc_msgSend(v6, "cloudShareAlbum");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[PLCloudSharedAssetSaveJob setCurrentCloudAssetGUID:](self, "setCurrentCloudAssetGUID:", v7);
      -[PLCloudSharedAssetSaveJob setCloudAlbumGUID:](self, "setCloudAlbumGUID:", v13);
      -[PLCloudSharedAssetSaveJob setIsVideo:](self, "setIsVideo:", objc_msgSend(v6, "isVideo"));
      v14 = -[PLCloudSharedAssetSaveJob placeHolderKindFromAssetMetadataType:](self, "placeHolderKindFromAssetMetadataType:", a4);
      objc_msgSend(v6, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[PLCloudSharedAssetSaveJob _processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:](self, "_processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:", v14, v15, v8);

      if (v16)
      {
        PLPhotoSharingGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v8;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Successfully imported inflight file %@", (uint8_t *)&v21, 0xCu);
        }

        -[PLCloudSharedAssetSaveJob setCloudAlbumGUID:](self, "setCloudAlbumGUID:", 0);
        -[PLCloudSharedAssetSaveJob setCurrentCloudAssetGUID:](self, "setCurrentCloudAssetGUID:", 0);
      }
      -[PLCloudSharedAssetSaveJob setCurrentCloudAssetGUID:](self, "setCurrentCloudAssetGUID:", 0);
      -[PLCloudSharedAssetSaveJob setCloudAlbumGUID:](self, "setCloudAlbumGUID:", 0);
    }
    else
    {
      LOBYTE(v16) = 0;
    }
    PLPhotoSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Failed to import inflight file %@. Removing", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeItemAtPath:error:", v8, 0);

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (void)_prefetchLimitForDerivatives:(int64_t *)a3 thumbnails:(int64_t *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  char v20;
  void *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  NSObject *v37;
  NSObject *v38;
  int64_t v39;
  NSObject *v40;
  int64_t v41;
  int64_t v42;
  NSObject *v43;
  int64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    *a3 = 0;
    *a4 = 0;
    -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoDirectoryWithType:createIfNeeded:error:", 24, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("sharedAssetsPrefetchCount.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("thumbnailsCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(v10, "objectForKey:", CFSTR("derivativesCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    if (v11
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "timeIntervalSinceDate:", v11),
          v18 = v17,
          v16,
          v18 < 86400.0))
    {
      v45 = v13;
    }
    else
    {
      v15 = 0;
      v45 = 0;
    }
    v19 = MGGetSInt64Answer();
    v20 = MGGetBoolAnswer();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isLowPowerModeEnabled");

    if (+[PLPhotoSharingHelper debugDownloadMetadataOnly](PLPhotoSharingHelper, "debugDownloadMetadataOnly"))
    {
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "skip downloading shared assets since download metadata only is requested.";
LABEL_13:
        v25 = v23;
        v26 = 2;
LABEL_14:
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    if (v22)
    {
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v24 = "skip downloading shared assets in battery saver mode";
        goto LABEL_13;
      }
LABEL_15:

      return;
    }
    if (v19 > 19)
      v27 = 1;
    else
      v27 = v20;
    if ((v27 & 1) == 0)
    {
      PLPhotoSharingGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 134218240;
      v47 = v19;
      v48 = 1024;
      v49 = 20;
      v24 = "skip downloading shared assets as battery capacity %lld is less than %d";
      v25 = v23;
      v26 = 18;
      goto LABEL_14;
    }
    +[PLPhotoLibrary cloudSharingPhotoLibrary](PLPhotoLibrary, "cloudSharingPhotoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "pathManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "libraryURL");
    v23 = objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0D731D8];
    -[NSObject path](v23, "path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "diskSpaceAvailableForPath:", v31);

    if (+[PLPhotoSharingHelper debugDownloadThumbnailsOnly](PLPhotoSharingHelper, "debugDownloadThumbnailsOnly"))
    {
      PLPhotoSharingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v34 = "skip downloading derivatives since download thumbnail only is requested.";
        v35 = v33;
        v36 = 2;
LABEL_24:
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
      }
    }
    else
    {
      if (+[PLPhotoSharingHelper debugDownloadAllDerivatives](PLPhotoSharingHelper, "debugDownloadAllDerivatives"))
      {
        PLPhotoSharingGetLog();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "downloading all derivatives is requested.", buf, 2u);
        }

        *a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
        if (v32 <= 0x1FFFFFFF)
        {
          PLPhotoSharingGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v47 = 0x20000000;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "skip downloading shared asset thumbnails since available storage is less than %lld", buf, 0xCu);
          }

          goto LABEL_15;
        }
LABEL_44:
        if (+[PLPhotoSharingHelper isCellularConnection](PLPhotoSharingHelper, "isCellularConnection"))
        {
          v42 = +[PLPhotoSharingHelper maxNumThumbnailsToPrefetchPerDay](PLPhotoSharingHelper, "maxNumThumbnailsToPrefetchPerDay");
          *a4 = (v42 - v45) & ~((v42 - v45) >> 63);
          PLPhotoSharingGetLog();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            v44 = *a4;
            *(_DWORD *)buf = 134217984;
            v47 = v44;
            _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEFAULT, "On cellular connection, allows %ld thumbnails to be prefetched", buf, 0xCu);
          }

        }
        else
        {
          *a4 = 0x7FFFFFFFFFFFFFFFLL;
        }
        goto LABEL_15;
      }
      if (v32 > 0x3FFFFFFF)
      {
        if (+[PLPhotoSharingHelper isCellularConnection](PLPhotoSharingHelper, "isCellularConnection"))
        {
          v39 = +[PLPhotoSharingHelper maxNumDerivativesToPrefetchPerDay](PLPhotoSharingHelper, "maxNumDerivativesToPrefetchPerDay");
          *a3 = (v39 - v15) & ~((v39 - v15) >> 63);
          PLPhotoSharingGetLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = *a4;
            *(_DWORD *)buf = 134217984;
            v47 = v41;
            _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "On cellular connection, allows %ld derivatives to be prefetched", buf, 0xCu);
          }

        }
        else
        {
          *a3 = +[PLPhotoSharingHelper maxNumDerivativesToDownloadPerPush](PLPhotoSharingHelper, "maxNumDerivativesToDownloadPerPush");
        }
        goto LABEL_44;
      }
      PLPhotoSharingGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v47 = 0x40000000;
        v34 = "skip downloading shared asset derivatives since available storage is less than %lld";
        v35 = v33;
        v36 = 12;
        goto LABEL_24;
      }
    }

    goto LABEL_32;
  }
}

- (void)_incrementDerivativesCount:(int64_t)a3 thumbnailsCount:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  -[PLDaemonJob libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:createIfNeeded:error:", 24, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("sharedAssetsPrefetchCount.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("thumbnailsCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v8, "objectForKey:", CFSTR("derivativesCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (!v9
    || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "timeIntervalSinceDate:", v9),
        v16 = v15,
        v14,
        v16 >= 86400.0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v9 = (void *)v17;
  }
  v27[0] = v9;
  v26[0] = CFSTR("date");
  v26[1] = CFSTR("thumbnailsCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11 + a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  v26[2] = CFSTR("derivativesCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 + a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v20, "writeToFile:atomically:", v7, 1) & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "failed to update prefetch count file %@", buf, 0xCu);
    }

  }
}

- (void)executeDaemonOperationDeleteAssetJobType
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PLCloudSharedAssetSaveJob_executeDaemonOperationDeleteAssetJobType__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performTransactionAndWait:completionHandler:", v5, &__block_literal_global_310);

}

- (void)executeDaemonOperationReplaceRecentlyUploadedOriginalJobType
{
  void *v3;
  BOOL v4;
  BOOL v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;
  BOOL v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  -[PLCloudSharingJob transientPhotoLibrary](self, "transientPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLCloudSharedAssetSaveJob isVideo](self, "isVideo");
  v5 = -[PLCloudSharedAssetSaveJob isPhotoIris](self, "isPhotoIris");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke;
  v10[3] = &unk_1E3675C80;
  v12 = v4;
  v10[4] = self;
  v11 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke_315;
  v7[3] = &unk_1E366EF90;
  v7[4] = self;
  v8 = v4;
  v9 = v5;
  v6 = v3;
  -[PLCloudSharedAssetSaveJob _performSaveTransactionAndWaitOnLibrary:transaction:completion:](self, "_performSaveTransactionAndWaitOnLibrary:transaction:completion:", v6, v10, v7);

}

- (unint64_t)_insertionIndexForAsset:(id)a3 inAlbum:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  objc_msgSend(v6, "sortingComparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v11, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v8, 1024, v9);

  }
  return v8;
}

- (NSString)currentFilePath
{
  return self->_currentFilePath;
}

- (void)setCurrentFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_currentFilePath, a3);
}

- (NSString)currentCloudAssetGUID
{
  return self->_currentCloudAssetGUID;
}

- (void)setCurrentCloudAssetGUID:(id)a3
{
  objc_storeStrong((id *)&self->_currentCloudAssetGUID, a3);
}

- (unint64_t)currentCloudAssetMediaAssetType
{
  return self->_currentCloudAssetMediaAssetType;
}

- (void)setCurrentCloudAssetMediaAssetType:(unint64_t)a3
{
  self->_currentCloudAssetMediaAssetType = a3;
}

- (NSString)cloudAlbumGUID
{
  return self->_cloudAlbumGUID;
}

- (void)setCloudAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAlbumGUID, a3);
}

- (NSString)cloudPersonID
{
  return self->_cloudPersonID;
}

- (void)setCloudPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudPersonID, a3);
}

- (MSASAssetCollection)currentCloudAssetCollection
{
  return self->_currentCloudAssetCollection;
}

- (void)setCurrentCloudAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_currentCloudAssetCollection, a3);
}

- (NSArray)assetCollectionInfos
{
  return self->_assetCollectionInfos;
}

- (void)setAssetCollectionInfos:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionInfos, a3);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isPhotoIris
{
  return self->_isPhotoIris;
}

- (void)setIsPhotoIris:(BOOL)a3
{
  self->_isPhotoIris = a3;
}

- (NSArray)cloudAssetGUIDsToDelete
{
  return self->_cloudAssetGUIDsToDelete;
}

- (void)setCloudAssetGUIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_cloudAssetGUIDsToDelete, a3);
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setMstreamdInfoDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_cloudAssetGUIDsToDelete, 0);
  objc_storeStrong((id *)&self->_assetCollectionInfos, 0);
  objc_storeStrong((id *)&self->_currentCloudAssetCollection, 0);
  objc_storeStrong((id *)&self->_cloudPersonID, 0);
  objc_storeStrong((id *)&self->_cloudAlbumGUID, 0);
  objc_storeStrong((id *)&self->_currentCloudAssetGUID, 0);
  objc_storeStrong((id *)&self->_currentFilePath, 0);
  objc_storeStrong((id *)&self->_pendingDownloadNotifications, 0);
  objc_storeStrong((id *)&self->_currentAssetCollectionInfo, 0);
}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    v5 = CFSTR("YES (streamed-video-replacement)");
    if (!*(_BYTE *)(a1 + 48))
      v5 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType %@ isVideo %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v7, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "uniformTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 48))
    +[PLPhotoSharingHelper temporaryVideoPosterFramePathForCollectionGUID:](PLPhotoSharingHelper, "temporaryVideoPosterFramePathForCollectionGUID:", v6);
  else
    +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:uti:](PLPhotoSharingHelper, "temporaryDerivativePathForCollectionGUID:uti:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  PLPhotoSharingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudAlbumGUID");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = (uint64_t)v11;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Found temporary derivative at path %@, will use it to replace original asset in shared album %@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
    if (*(_BYTE *)(a1 + 48))
      v17 = 7;
    else
      v17 = 4;
    PLPhotoSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v17;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType will call _processSaveAssetWithPlaceholderKind %i", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:", v17, *(_QWORD *)(a1 + 40), v11);
  }
  else
  {
    if (v15)
    {
      *(_DWORD *)buf = 138412290;
      v24 = (uint64_t)v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "did not find recently uploaded derivative at path %@ to replace original", buf, 0xCu);
    }

    if (*(_BYTE *)(a1 + 48)
      && objc_msgSend(v9, "isVideo")
      && objc_msgSend(v9, "isCloudSharedAsset")
      && objc_msgSend(v9, "cloudPlaceholderKind") != 7)
    {
      objc_msgSend(v9, "setCloudPlaceholderKind:", 2);
      PLPhotoSharingGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = (uint64_t)v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "(streamed-video-replacement) re-requesting download of video asset %@", buf, 0xCu);

      }
      +[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:](PLPhotoSharingHelper, "downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:", v9, 3, 0, 0);
    }
    else
    {
      PLPhotoSharingGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = (uint64_t)v9;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "(streamed-video-replacement) expected to find an original video asset but instead found %@", buf, 0xCu);
      }

    }
  }

}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationReplaceRecentlyUploadedOriginalJobType__block_invoke_315(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType did call _processSaveAssetWithPlaceholderKind", v19, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper temporaryThumbnailPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryThumbnailPathForCollectionGUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
      v6 = CFSTR("MOV");
    else
      v6 = CFSTR("MP4");
  }
  else
  {
    if (!*(_BYTE *)(a1 + 41))
      goto LABEL_18;
    v6 = CFSTR("MOV");
  }
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper temporarySmallVideoDerivativePathForCollectionGUID:](PLPhotoSharingHelper, "temporarySmallVideoDerivativePathForCollectionGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtPath:error:", v10, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper temporaryLargeVideoDerivativePathForCollectionGUID:](PLPhotoSharingHelper, "temporaryLargeVideoDerivativePathForCollectionGUID:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathExtension:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v14, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoSharingHelper temporaryVideoPathForCollectionGUID:](PLPhotoSharingHelper, "temporaryVideoPathForCollectionGUID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeItemAtPath:error:", v17, 0);

  }
LABEL_18:

}

void __69__PLCloudSharedAssetSaveJob_executeDaemonOperationDeleteAssetJobType__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cloudAssetGUIDsToDelete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[Shared Streams]Asset was deleted remotely."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v19;
    *(_QWORD *)&v8 = 138412290;
    v17 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "uuid", v17, (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");

        if (v14)
        {
          objc_msgSend(v2, "addObject:", v14);
        }
        else
        {
          PLPhotoSharingGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error : AssetUUID for asset %@ which was deleted remotely was nil", buf, 0xCu);
          }

        }
        objc_msgSend(v12, "deleteWithReason:", v5);

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "noteDidDeleteSharedAssetsWithUUIDs:", v2);

}

void __79__PLCloudSharedAssetSaveJob_executeDaemonOperationDownloadPendingAssetsJobType__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t v62[128];
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v2 = +[PLPhotoSharingHelper maxNumDerivativesToDownloadPerPush](PLPhotoSharingHelper, "maxNumDerivativesToDownloadPerPush");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4D150], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K < 1"), CFSTR("cloudDownloadRequests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:](PLManagedAsset, "fetchRequestForSortedCloudSharedAssetsWithPlaceholderKinds:additionalPredicate:ascending:", &unk_1E3763DD0, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v61);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v61;
  v49 = v7;
  if (!v7)
  {
    PLPhotoSharingGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v48;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v64 = (uint64_t)v6;
      v65 = 2112;
      v66 = v48;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to fetch pending assets with request:%@ %@", buf, 0x16u);
    }

    v36 = 0;
    v37 = 0;
    v10 = v53;
    goto LABEL_59;
  }
  v45 = v6;
  v46 = v5;
  v47 = v4;
  v52 = v3;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (!v8)
  {
    v51 = 0;
    v54 = 0;
    v10 = v53;
    goto LABEL_50;
  }
  v9 = v8;
  v51 = 0;
  v54 = 0;
  v55 = *(_QWORD *)v58;
  v10 = v53;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v58 != v55)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
      objc_msgSend(v12, "setCloudDownloadRequests:", &unk_1E375FAE0);
      objc_msgSend(v12, "cloudAssetGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "length"))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Found cloud shared asset with nil cloudAssetGUID %@ (isDeleted=%d) %@.\n\nSee rdar://problem/33335181"), v17, objc_msgSend(v12, "isDeleted"), v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v64 = (uint64_t)v18;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

        }
        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Shared Album state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: cloud shared asset with nil cloudAssetGUID"), v18);

        goto LABEL_26;
      }
      if (v54 < *(_QWORD *)(a1 + 56))
      {
        if (objc_msgSend(v12, "isVideo"))
          v14 = 5;
        else
          v14 = 3;
        if ((objc_msgSend(*(id *)(a1 + 40), "_processInflightAsset:mediaAssetType:", v12, v14) & 1) != 0)
          goto LABEL_40;
        ++v54;
        v15 = v56;
LABEL_25:
        objc_msgSend(v15, "addObject:", v13);
LABEL_26:
        if (objc_msgSend(v56, "count") >= v2)
        {
          if (objc_msgSend(v12, "isVideo"))
            v21 = 212;
          else
            v21 = 211;
          objc_msgSend(v12, "cloudShareAlbum");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "cloudGUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:](PLPhotoSharingHelper, "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:", v13, v23, v13, v21, 0);

          PLPhotoSharingGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = objc_msgSend(v56, "count");
            v26 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            v64 = v25;
            v65 = 2112;
            v66 = v26;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu derivatives personID:%@", buf, 0x16u);
          }

          objc_msgSend(v52, "retrieveAssetsFromAssetCollectionsWithGUIDs:assetTypeFlags:personID:", v56, 2, *(_QWORD *)(a1 + 48));
          objc_msgSend(v56, "removeAllObjects");
          v10 = v53;
        }
        if (objc_msgSend(v10, "count") >= v2)
        {
          if (objc_msgSend(v12, "isVideo"))
            v27 = 212;
          else
            v27 = 210;
          objc_msgSend(v12, "cloudShareAlbum");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cloudGUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v27;
          v10 = v53;
          +[PLPhotoSharingHelper writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:](PLPhotoSharingHelper, "writeDownloadDebugBreadcrumbForAsset:albumGUID:content:state:error:", v13, v29, v13, v30, 0);

          PLPhotoSharingGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_msgSend(v53, "count");
            v33 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218242;
            v64 = v32;
            v65 = 2112;
            v66 = v33;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu thumbnails personID:%@", buf, 0x16u);
          }

          objc_msgSend(v52, "retrieveAssetsFromAssetCollectionsWithGUIDs:assetTypeFlags:personID:", v53, 1, *(_QWORD *)(a1 + 48));
          objc_msgSend(v53, "removeAllObjects");
        }
        goto LABEL_40;
      }
      if (v51 >= *(_QWORD *)(a1 + 64))
      {
        PLPhotoSharingGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "No more budget for shared assets prefetching", buf, 2u);
        }

        goto LABEL_50;
      }
      if (objc_msgSend(v12, "isVideo"))
        v20 = 5;
      else
        v20 = 2;
      if ((objc_msgSend(*(id *)(a1 + 40), "_processInflightAsset:mediaAssetType:", v12, v20) & 1) == 0)
      {
        ++v51;
        v15 = v10;
        goto LABEL_25;
      }
LABEL_40:

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    if (v9)
      continue;
    break;
  }
LABEL_50:

  v3 = v52;
  v5 = v46;
  v4 = v47;
  v6 = v45;
  v35 = v48;
  if (objc_msgSend(v56, "count"))
  {
    PLPhotoSharingGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(v56, "count");
      v41 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v64 = v40;
      v65 = 2112;
      v66 = v41;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu derivatives personID:%@", buf, 0x16u);
    }

    objc_msgSend(v52, "retrieveAssetsFromAssetCollectionsWithGUIDs:assetTypeFlags:personID:", v56, 2, *(_QWORD *)(a1 + 48));
  }
  if (objc_msgSend(v10, "count"))
  {
    PLPhotoSharingGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_msgSend(v10, "count");
      v44 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      v64 = v43;
      v65 = 2112;
      v66 = v44;
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "calling MSASConnection to retrieveAssets: with a batch of %lu thumbnails personID:%@", buf, 0x16u);
    }

    objc_msgSend(v52, "retrieveAssetsFromAssetCollectionsWithGUIDs:assetTypeFlags:personID:", v10, 1, *(_QWORD *)(a1 + 48));
  }
  v36 = v51;
  v37 = v54;
LABEL_59:
  objc_msgSend(*(id *)(a1 + 40), "_incrementDerivativesCount:thumbnailsCount:", v37, v36);

}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  NSObject *v42;
  int v43;
  int v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetCollectionInfos");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("GUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset cloudSharedAssetsWithGUIDs:inLibrary:](PLManagedAsset, "cloudSharedAssetsWithGUIDs:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v68 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(v11, "cloudAssetGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "cloudAssetGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v11, v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    }
    while (v8);
  }

  v59 = objc_msgSend((id)objc_opt_class(), "_lightweightReimportCacheDirectoryExists");
  objc_msgSend(*(id *)(a1 + 32), "cloudAlbumGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:inLibrary:](PLCloudSharedAlbum, "cloudSharedAlbumWithGUID:inLibrary:", v14, *(_QWORD *)(a1 + 40));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "assetCollectionInfos");
    v18 = objc_claimAutoreleasedReturnValue();
    v60 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
    if (v60)
    {
      v52 = v6;
      v53 = v3;
      v58 = *(_QWORD *)v64;
      v57 = *MEMORY[0x1E0C99968];
      v54 = v5;
      v55 = v18;
      do
      {
        for (j = 0; j != v60; ++j)
        {
          if (*(_QWORD *)v64 != v58)
            objc_enumerationMutation(v18);
          v20 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          v21 = (void *)MEMORY[0x19AEC1554]();
          objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), v20);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "GUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setCurrentCloudAssetGUID:", v22);
          objc_msgSend(*(id *)(a1 + 32), "setIsVideo:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isVideo"));
          objc_msgSend(*(id *)(a1 + 32), "setIsPhotoIris:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "isPhotoIris"));
          objc_msgSend(v5, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
          {
            if (objc_msgSend(v23, "cloudPlaceholderKind") == 5)
            {
              v25 = v18;
              v26 = v21;
              objc_msgSend(v24, "uniformTypeIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPhotoSharingHelper temporaryDerivativePathForCollectionGUID:uti:](PLPhotoSharingHelper, "temporaryDerivativePathForCollectionGUID:uti:", v28, v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "fileExistsAtPath:", v29);

              if (v31)
              {
                PLPhotoSharingGetLog();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(*(id *)(a1 + 32), "cloudAlbumGUID");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v72 = v29;
                  v73 = 2112;
                  v74 = v33;
                  _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Found temporary derivative at path %@, will use it to replace original asset in shared album %@", buf, 0x16u);

                }
                *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 1;
                objc_msgSend(*(id *)(a1 + 32), "_processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:", 4, *(_QWORD *)(a1 + 40), v29);
              }

              v21 = v26;
              v18 = v25;
              v5 = v54;
            }
            v34 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(v24, "directory", v52, v53);
            v35 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "fileURLWithPath:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v62 = 0;
            LOBYTE(v35) = objc_msgSend(v36, "getResourceValue:forKey:error:", &v62, v57, 0);
            v37 = v62;
            if ((v35 & 1) == 0)
            {
              v56 = v21;
              v38 = v5;
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = 0;
              v40 = objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v36, 1, 0, &v61);
              v41 = v61;

              if ((v40 & 1) == 0)
              {
                PLPhotoSharingGetLog();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412802;
                  v72 = v36;
                  v73 = 2114;
                  v74 = v22;
                  v75 = 2112;
                  v76 = v41;
                  _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\" for asset %{public}@: %@", buf, 0x20u);
                }

              }
              v5 = v38;
              v18 = v55;
              v21 = v56;
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 32), "_createPlaceHolderInSharedAlbum:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              objc_msgSend(*(id *)(a1 + 48), "addObject:", v36);
          }

          if (v59)
          {
            v43 = objc_msgSend(*(id *)(a1 + 32), "attemptLightweightReimportAssetDataInLibrary:", *(_QWORD *)(a1 + 40));
            if (v43)
            {
              v44 = v43;
              PLPhotoSharingGetLog();
              v45 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(a1 + 32), "currentCloudAssetGUID");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v72 = v46;
                v73 = 1024;
                LODWORD(v74) = v44;
                _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "lightweight reimport of %@ asset data (kind = %i) successful, excluding from MSAS server request queue", buf, 0x12u);

              }
            }
          }

          objc_autoreleasePoolPop(v21);
        }
        v60 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v63, v77, 16);
      }
      while (v60);
      v6 = v52;
      v3 = v53;
    }
  }
  else
  {
    PLPhotoSharingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v47 = v18;
      v48 = (void *)objc_opt_class();
      v49 = *(void **)(a1 + 32);
      v50 = v48;
      objc_msgSend(v49, "cloudAlbumGUID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v72 = v48;
      v18 = v47;
      v73 = 2112;
      v74 = v51;
      _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_ERROR, "%@ ERROR: couldn't find album with GUID %@ to insert assets", buf, 0x16u);

    }
  }

}

void __89__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetMetadataForCollectionsJobType__block_invoke_279(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "mstreamdInfoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "noteDidReceiveAssets:forSharedAlbum:mstreamdInfo:", v4, v3, v5);

  }
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "assetCollectionInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 134217984;
    v9 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetMetadataForCollectionsJobType did process metadata for %lu collections", (uint8_t *)&v8, 0xCu);

  }
}

uint64_t __92__PLCloudSharedAssetSaveJob__performSaveTransactionAndWaitOnLibrary_transaction_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  NSObject *v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i));
        notify_post((const char *)objc_msgSend(v7, "UTF8String"));
        PLPhotoSharingGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v7;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Broadcasting '%@'", buf, 0xCu);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetJobType will call _processSaveAssetWithPlaceholderKind", v7, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "placeHolderKindFromAssetMetadataType:", *(_QWORD *)(a1 + 48));
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_processSaveAssetWithPlaceholderKind:inLibrary:withAssetDataFilePath:", v4, v5, v6);

}

void __67__PLCloudSharedAssetSaveJob_executeDaemonOperationSaveAssetJobType__block_invoke_229()
{
  NSObject *v0;
  uint8_t v1[16];

  PLPhotoSharingGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_199541000, v0, OS_LOG_TYPE_DEFAULT, "executeDaemonOperationSaveAssetJobType did call saveJobAssetWithDispatchGroup", v1, 2u);
  }

}

void __42__PLCloudSharedAssetSaveJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  objc_super v3;

  v2 = (void *)MEMORY[0x19AEC1554]();
  switch(objc_msgSend(*(id *)(a1 + 32), "jobType"))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperationSaveAssetMetadataForCollectionsJobType");
      break;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperationSaveAssetJobType");
      break;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperationDeleteAssetJobType");
      break;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperationReplaceRecentlyUploadedOriginalJobType");
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "executeDaemonOperationDownloadPendingAssetsJobType");
      break;
    default:
      break;
  }
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PLCloudSharedAssetSaveJob;
  objc_msgSendSuper2(&v3, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (id)newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd
{
  PLCloudSharedAssetSaveJob *v4;
  void *v5;
  void *v6;
  PLCloudSharedAssetSaveJob *v7;
  void *v9;

  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedAssetSaveJob.m"), 390, CFSTR("This cannot be called from assetsd"));

  }
  v4 = [PLCloudSharedAssetSaveJob alloc];
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLCloudSharedAssetSaveJob initWithAssetsdClient:](v4, "initWithAssetsdClient:", v6);

  return v7;
}

+ (void)processMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedAssetSaveJob.m"), 418, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PLIsAssetsd()"));

  }
  v15 = objc_msgSend(v11, "count");
  if (v13 && v12 && v15)
  {
    v16 = (void *)objc_msgSend(a1, "newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd");
    objc_msgSend(v16, "setupSaveAssetMetadataForCollectionsJobForAssetCollections:album:personID:info:", v11, v12, v13, v14);
    objc_msgSend(v16, "runAndWaitForMessageToBeSent");

  }
  else
  {
    PLPhotoSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v21 = (id)objc_opt_class();
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      v18 = v21;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "%@:processMetadataFromClientProcessForAssetCollections:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);

    }
  }

}

+ (void)assetsdProcessMetadataForAssetCollections:(id)a3 inAlbum:(id)a4 personID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  PLCloudSharedAssetSaveJob *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if ((PLIsReallyAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedAssetSaveJob.m"), 434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd()"));

    if (v17)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharedAssetSaveJob.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    goto LABEL_3;
  }
  if (!v17)
    goto LABEL_12;
LABEL_3:
  v18 = objc_msgSend(v13, "count");
  if (v15 && v14 && v18)
  {
    v19 = -[PLCloudSharedAssetSaveJob initWithAssetsdClient:]([PLCloudSharedAssetSaveJob alloc], "initWithAssetsdClient:", 0);
    -[PLCloudSharedAssetSaveJob setupSaveAssetMetadataForCollectionsJobForAssetCollections:album:personID:info:](v19, "setupSaveAssetMetadataForCollectionsJobForAssetCollections:album:personID:info:", v13, v14, v15, v16);
    -[PLDaemonJob setLibraryServicesManager:](v19, "setLibraryServicesManager:", v17);
    -[PLCloudSharedAssetSaveJob runDaemonSide](v19, "runDaemonSide");

  }
  else
  {
    PLPhotoSharingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v25 = (id)objc_opt_class();
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v15;
      v21 = v25;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "%@:assetsdProcessMetadataForAssetCollections:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);

    }
  }

}

+ (void)downloadPendingAssetsForPersonID:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(a1, "newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd");
    -[NSObject setJobType:](v8, "setJobType:", 4);
    -[NSObject setCloudPersonID:](v8, "setCloudPersonID:", v6);
    -[NSObject setMstreamdInfoDictionary:](v8, "setMstreamdInfoDictionary:", v7);
    -[NSObject runAndWaitForMessageToBeSent](v8, "runAndWaitForMessageToBeSent");
  }
  else
  {
    PLPhotoSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%@:downloadPendingAssets personID: can't have nil arguments", (uint8_t *)&v10, 0xCu);

    }
  }

}

+ (void)saveCloudSharedAssetAtPath:(id)a3 forAssetCollection:(id)a4 mediaAssetType:(unint64_t)a5 albumGUID:(id)a6 personID:(id)a7 info:(id)a8 shouldPrioritize:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  AssetCollectionInfo *v23;
  void *v24;
  AssetCollectionInfo *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_msgSend(v16, "GUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "fileExistsAtPath:", v15) && objc_msgSend(v20, "length"))
  {

    if (v18)
    {
      v22 = objc_msgSend(a1, "newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd");
      -[NSObject setJobType:](v22, "setJobType:", 1);
      -[NSObject setCurrentFilePath:](v22, "setCurrentFilePath:", v15);
      -[NSObject setCloudAlbumGUID:](v22, "setCloudAlbumGUID:", v17);
      -[NSObject setCurrentCloudAssetMediaAssetType:](v22, "setCurrentCloudAssetMediaAssetType:", a5);
      -[NSObject setIsVideo:](v22, "setIsVideo:", a5 == 5);
      -[NSObject setCurrentCloudAssetGUID:](v22, "setCurrentCloudAssetGUID:", v20);
      -[NSObject setCloudPersonID:](v22, "setCloudPersonID:", v18);
      -[NSObject setMstreamdInfoDictionary:](v22, "setMstreamdInfoDictionary:", v19);
      -[NSObject setShouldPrioritize:](v22, "setShouldPrioritize:", a9);
      v23 = -[AssetCollectionInfo initWithAssetCollection:]([AssetCollectionInfo alloc], "initWithAssetCollection:", v16);
      v25 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setAssetCollectionInfos:](v22, "setAssetCollectionInfos:", v24);

      -[NSObject runAndWaitForMessageToBeSent](v22, "runAndWaitForMessageToBeSent");
LABEL_8:

      goto LABEL_9;
    }
  }
  else
  {

  }
  PLPhotoSharingGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v27 = (id)objc_opt_class();
    v23 = (AssetCollectionInfo *)v27;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%@:saveCloudSharedAssetAtPath: missing required parameters", buf, 0xCu);
    goto LABEL_8;
  }
LABEL_9:

}

+ (void)deleteCloudSharedAssetsWithCloudGUIDs:(id)a3 info:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v7 = (void *)objc_msgSend(a1, "newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd");
    objc_msgSend(v7, "setJobType:", 2);
    objc_msgSend(v7, "setCloudAssetGUIDsToDelete:", v8);
    objc_msgSend(v7, "setMstreamdInfoDictionary:", v6);
    objc_msgSend(v7, "runAndWaitForMessageToBeSent");

  }
}

+ (void)replaceRecentlyUploadedOriginalWithDerivativeForCollection:(id)a3 inAlbum:(id)a4 personID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  AssetCollectionInfo *v15;
  void *v16;
  AssetCollectionInfo *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && v10)
  {
    v12 = objc_msgSend(a1, "newCloudSharedAssetSaveJobFromAProcessThatIsNotAssetsd");
    -[NSObject setJobType:](v12, "setJobType:", 3);
    objc_msgSend(v9, "GUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setCloudAlbumGUID:](v12, "setCloudAlbumGUID:", v13);

    -[NSObject setCloudPersonID:](v12, "setCloudPersonID:", v11);
    -[NSObject setIsVideo:](v12, "setIsVideo:", objc_msgSend(v8, "isVideo"));
    -[NSObject setIsPhotoIris:](v12, "setIsPhotoIris:", objc_msgSend(v8, "isPhotoIris"));
    objc_msgSend(v8, "GUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setCurrentCloudAssetGUID:](v12, "setCurrentCloudAssetGUID:", v14);

    v15 = -[AssetCollectionInfo initWithAssetCollection:]([AssetCollectionInfo alloc], "initWithAssetCollection:", v8);
    v17 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAssetCollectionInfos:](v12, "setAssetCollectionInfos:", v16);

    -[NSObject runAndWaitForMessageToBeSent](v12, "runAndWaitForMessageToBeSent");
LABEL_7:

    goto LABEL_8;
  }
  PLPhotoSharingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413058;
    v19 = (id)objc_opt_class();
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    v15 = (AssetCollectionInfo *)v19;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "%@:replaceRecentlyUploadedOriginalWithDerivativeForCollection:%@ inAlbum:%@ personID:%@ can't have nil arguments", buf, 0x2Au);
    goto LABEL_7;
  }
LABEL_8:

}

+ (BOOL)_lightweightReimportCacheDirectoryExists
{
  BOOL v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v8;

  if ((_lightweightReimportCacheDirectoryExists__skipCacheDirCheck & 1) != 0)
    return 0;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateCacheDirectoryWithSubType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v8);
  if (v8)
    v2 = v6;
  else
    v2 = 0;

  if (!v2)
    _lightweightReimportCacheDirectoryExists__skipCacheDirCheck = 1;

  return v2;
}

+ (id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID:(id)a3 cloudPersonID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  pl_dispatch_once();
  objc_msgSend(v5, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "privateCacheDirectoryWithSubType:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLCloudSharedAlbum lightweightReimportDirectoryNameWithGUID:cloudPersonID:](PLCloudSharedAlbum, "lightweightReimportDirectoryNameWithGUID:cloudPersonID:", v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", *MEMORY[0x1E0D74310]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      PLPhotoSharingGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Missing reimport cache album info for album: %@ (path %@)", (uint8_t *)&v16, 0x16u);
      }

      v8 = &unk_1E3764648;
    }
    objc_msgSend((id)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo, "setObject:forKey:cost:", v8, v7, objc_msgSend(v8, "count"));

  }
  return v8;
}

+ (id)pathForInFlightAssetCollectionWithGUID:(id)a3 mediaAssetType:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  pl_dispatch_once();
  if (pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject fileExistsAtPath:](v6, "fileExistsAtPath:", pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory, 1, 0, &v17);
      v9 = v17;

      if ((v8 & 1) == 0)
      {
        PLPhotoSharingGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v19 = pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory;
          v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory for shared album \"%@\": %@", buf, 0x16u);
        }
        v12 = 0;
        goto LABEL_20;
      }

    }
    v10 = v5;
    v9 = v10;
    if (a4 == 7)
    {
      v14 = CFSTR("MOV");
    }
    else
    {
      if (a4 == 5)
      {
        v11 = CFSTR("poster");
      }
      else
      {
        if (a4 != 2)
        {
          v14 = CFSTR("JPG");
          goto LABEL_19;
        }
        v11 = CFSTR("thumb");
      }
      objc_msgSend(v10, "stringByAppendingPathExtension:", v11);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = CFSTR("JPG");
      v9 = (id)v15;
    }
LABEL_19:
    objc_msgSend((id)pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory, "stringByAppendingPathComponent:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathExtension:](v13, "stringByAppendingPathExtension:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

    goto LABEL_21;
  }
  PLPhotoSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "ERROR: INFLIGHT directory does not exist for shared album", buf, 2u);
  }
  v12 = 0;
LABEL_21:

  return v12;
}

+ (id)_dcimDirectoryForFileURL:(id)a3
{
  id v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  pl_dispatch_once();
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__63960;
  v11 = __Block_byref_object_dispose__63961;
  v12 = 0;
  v6 = v3;
  pl_dispatch_sync();
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

+ (id)nextDCIMSaveFileURLForCloudPersonID:(id)a3 cloudAlbumGUID:(id)a4 pathManager:(id)a5 fileExtension:(id)a6 assetUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  const char *v25;
  void *v26;
  void *v27;
  char v28;
  id v29;
  char v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v12)
  {
    PLPhotoSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v25 = "Error: missing cloudPersonID, cannot compute nextDCIMSaveFileURLForCloudPersonID";
LABEL_12:
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_13;
  }
  if (!v13)
  {
    PLPhotoSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)buf = 0;
    v25 = "Error: missing cloudAlbumGUID, cannot compute nextDCIMSaveFileURLForCloudPersonID";
    goto LABEL_12;
  }
  if (v15)
  {
    v40 = a1;
    objc_msgSend(v14, "photoDirectoryWithType:", 22);
    v17 = objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathComponent:](v17, "stringByAppendingPathComponent:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v18, "stringByAppendingPathComponent:", v13);
    v19 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v19;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v21 = *MEMORY[0x1E0C99968];
    LOBYTE(v18) = objc_msgSend(v20, "getResourceValue:forKey:error:", &v46, *MEMORY[0x1E0C99968], 0);
    v22 = v46;
    v23 = v22;
    if ((v18 & 1) != 0)
    {
      v24 = v22;
    }
    else
    {
      v39 = v16;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v38 = v20;
      v28 = objc_msgSend(v27, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v45);
      v29 = v45;

      if ((v28 & 1) != 0)
      {
        v24 = v23;
        v20 = v38;
      }
      else
      {
        v44 = 0;
        v20 = v38;
        v30 = objc_msgSend(v38, "getResourceValue:forKey:error:", &v44, v21, 0);
        v24 = v44;

        if ((v30 & 1) == 0)
        {
          v42 = v24;
          PLPhotoSharingGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v38, "path");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v48 = v36;
            v49 = 2112;
            v50 = v29;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);

          }
          v34 = v38;
          v26 = 0;
          v16 = v39;
          v24 = v42;
          goto LABEL_24;
        }
      }

      v16 = v39;
    }
    if (objc_msgSend(v14, "isUBF"))
    {
      objc_msgSend(v16, "uppercaseString");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLByAppendingPathComponent:", v29);
      v41 = v14;
      v31 = v24;
      v32 = v16;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "URLByAppendingPathExtension:", v15);
      v34 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v32;
      v24 = v31;
      v14 = v41;
    }
    else
    {
      objc_msgSend(v40, "_dcimDirectoryForFileURL:", v20);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "nextAvailableFileURLWithExtension:", v15);
      v34 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:

    goto LABEL_25;
  }
  PLPhotoSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v25 = "Error: missing fileExtension, cannot compute nextDCIMSaveFileURLForCloudPersonID";
    goto LABEL_12;
  }
LABEL_13:
  v26 = 0;
LABEL_25:

  return v26;
}

void __54__PLCloudSharedAssetSaveJob__dcimDirectoryForFileURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend((id)_dcimDirectoryForFileURL__dcimDictionary, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D732E0], "cloudPlistName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D732E0]), "initWithDirectoryURL:subDirectorySuffix:perDirectoryLimit:userInfoPath:", *(_QWORD *)(a1 + 32), CFSTR("CLOUD"), 2000, v10);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend((id)_dcimDirectoryForFileURL__dcimDictionary, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));
  }
}

void __54__PLCloudSharedAssetSaveJob__dcimDirectoryForFileURL___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.PLCloudSharedAssetSaveJob.DCIM", 0);
  v1 = (void *)_dcimDirectoryForFileURL__isolationQueue;
  _dcimDirectoryForFileURL__isolationQueue = (uint64_t)v0;

  v2 = objc_opt_new();
  v3 = (void *)_dcimDirectoryForFileURL__dcimDictionary;
  _dcimDirectoryForFileURL__dcimDictionary = v2;

}

void __83__PLCloudSharedAssetSaveJob_pathForInFlightAssetCollectionWithGUID_mediaAssetType___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("INFLIGHT"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory;
  pathForInFlightAssetCollectionWithGUID_mediaAssetType__inflightDirectory = v1;

}

void __111__PLCloudSharedAssetSaveJob__lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo;
  _lightweightReimportPhotoCloudSharingAlbumInfoForAlbumWithCloudGUID_cloudPersonID__cacheAlbumInfo = (uint64_t)v0;

}

@end
