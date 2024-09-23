@implementation PLCloudBatchUploader

- (PLCloudBatchUploader)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLCloudBatchUploader *v6;
  PLCloudBatchUploader *v7;
  uint64_t v8;
  NSMutableArray *uploadBatchArray;
  uint64_t v10;
  NSMutableSet *downloadedDeleteRecords;
  uint64_t v12;
  NSMutableSet *cameraAsset;
  uint64_t v14;
  NSMutableSet *momentSharesNeedingForceSync;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLCloudBatchUploader;
  v6 = -[PLCloudBatchUploader init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    uploadBatchArray = v7->_uploadBatchArray;
    v7->_uploadBatchArray = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    downloadedDeleteRecords = v7->_downloadedDeleteRecords;
    v7->_downloadedDeleteRecords = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    cameraAsset = v7->_cameraAsset;
    v7->_cameraAsset = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    momentSharesNeedingForceSync = v7->_momentSharesNeedingForceSync;
    v7->_momentSharesNeedingForceSync = (NSMutableSet *)v14;

    *(_WORD *)&v7->_initialUpload = 256;
  }

  return v7;
}

- (void)clearUploadArray
{
  -[NSMutableArray removeAllObjects](self->_uploadBatchArray, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_momentSharesNeedingForceSync, "removeAllObjects");
}

- (void)addBatches:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_uploadBatchArray, "addObjectsFromArray:", a3);
}

- (BOOL)hasBatchesToUpload
{
  return -[NSMutableArray count](self->_uploadBatchArray, "count") != 0;
}

- (unint64_t)numberOfBatchesToUpload
{
  return -[NSMutableArray count](self->_uploadBatchArray, "count");
}

- (id)pop
{
  void *v3;

  -[NSMutableArray firstObject](self->_uploadBatchArray, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_uploadBatchArray, "removeObjectAtIndex:", 0);
  return v3;
}

- (void)_push:(id)a3
{
  -[NSMutableArray insertObject:atIndex:](self->_uploadBatchArray, "insertObject:atIndex:", a3, 0);
}

- (void)_pushBatches:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB36B8];
  v5 = a3;
  objc_msgSend(v4, "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObjects:atIndexes:](self->_uploadBatchArray, "insertObjects:atIndexes:", v5, v6);

}

- (void)recordDeletions:(id)a3
{
  NSMutableSet *downloadedDeleteRecords;
  id v5;

  downloadedDeleteRecords = self->_downloadedDeleteRecords;
  v5 = a3;
  -[NSMutableSet removeAllObjects](downloadedDeleteRecords, "removeAllObjects");
  -[NSMutableSet addObjectsFromArray:](self->_downloadedDeleteRecords, "addObjectsFromArray:", v5);

}

- (void)_sortRelationshipData:(id)a3 forUploadChanges:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a4;
  v8 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "existingObjectWithID:error:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "supportsCloudUpload"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v14;
            if (objc_msgSend(v15, "isDeleted"))
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v27 = v13;
                  v17 = v16;
                  v18 = "Skipping deleted asset %@";
                  goto LABEL_17;
                }
                goto LABEL_25;
              }
              goto LABEL_26;
            }
            if (!v15)
              goto LABEL_26;
            objc_msgSend(v15, "filename");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              goto LABEL_26;
            objc_msgSend(v21, "updatedRelationship");
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_27;
            v15 = v14;
            if (objc_msgSend(v15, "isDeleted"))
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v27 = v13;
                  v17 = v16;
                  v18 = "Skipping deleted album %@";
LABEL_17:
                  _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
                }
LABEL_25:

              }
LABEL_26:

              goto LABEL_27;
            }
            if (objc_msgSend(v15, "kindValue") == 3999
              || objc_msgSend(v15, "kindValue") == 3998)
            {
              goto LABEL_26;
            }
            objc_msgSend(v21, "albumChanges");
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v16 = v20;
          -[NSObject addObject:](v20, "addObject:", v15);
          goto LABEL_25;
        }
LABEL_27:

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v10);
  }

}

- (void)_sortData:(id)a3 isInsert:(BOOL)a4 forUploadChanges:(id)a5 shouldTriggerPrefetch:(BOOL *)a6 inManagedObjectContext:(id)a7
{
  _BOOL4 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  uint32_t v27;
  BOOL v28;
  int v29;
  char isKindOfClass;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  __int128 v78;
  NSObject *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  id v88;
  void *v89;
  _BOOL4 v90;
  id v91;
  void *v92;
  BOOL *v94;
  id obj;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  NSObject *v106;
  __int16 v107;
  id v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v10 = a4;
  v111 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v11, "count"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedAssets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v10;
  v81 = v14;
  if (v10)
  {
    objc_msgSend(v12, "insertedAssets");
    v91 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "albumInserts");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertedResources");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0;
  }
  else
  {
    v91 = v14;
    objc_msgSend(v12, "albumChanges");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatedMasters");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatedResources");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v11;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v102;
    *(_QWORD *)&v16 = 138543362;
    v78 = v16;
    v88 = v12;
    v94 = a6;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v102 != v18)
          objc_enumerationMutation(obj);
        v20 = *(NSObject **)(*((_QWORD *)&v101 + 1) + 8 * v19);
        v100 = 0;
        objc_msgSend(v13, "existingObjectWithID:error:", v20, &v100, v78);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v100;
        if (!v21)
        {
          if (*MEMORY[0x1E0D115D0])
            goto LABEL_36;
          __CPLAssetsdOSLogDomain();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          *(_DWORD *)buf = 138412546;
          v106 = v20;
          v107 = 2112;
          v108 = v22;
          v24 = v23;
          v25 = OS_LOG_TYPE_DEFAULT;
          v26 = "Failed to fault object for ID %@, skipping %@";
          v27 = 22;
          goto LABEL_18;
        }
        if (-[NSObject isDeleted](v21, "isDeleted"))
        {
          if (*MEMORY[0x1E0D115D0])
            goto LABEL_36;
          __CPLAssetsdOSLogDomain();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          *(_DWORD *)buf = 138412290;
          v106 = v20;
          v24 = v23;
          v25 = OS_LOG_TYPE_DEFAULT;
          v26 = "Skipping deleted object %@";
          goto LABEL_14;
        }
        if (a6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_26;
            v28 = -[NSObject featuredState](v21, "featuredState") == 1;
          }
          *a6 = v28;
        }
LABEL_26:
        v29 = -[NSObject supportsCloudUpload](v21, "supportsCloudUpload");
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (v29)
        {
          if ((isKindOfClass & 1) != 0)
          {
            v31 = v21;
            -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", v31, v91, v90, v92);
            objc_msgSend(v12, "propertyChangedAssetUuids");
            v32 = objc_claimAutoreleasedReturnValue();
            -[NSObject uuid](v31, "uuid");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject addObject:](v32, "addObject:", v33);
            goto LABEL_29;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = v89;
LABEL_40:
            objc_msgSend(v38, "addObject:", v21);
            goto LABEL_36;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v21;
            -[NSObject asset](v32, "asset");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:", v33, v32))
            {
              -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", v33, v91, v90, v92);
              objc_msgSend(v12, "propertyChangedAssetUuids");
              v41 = objc_claimAutoreleasedReturnValue();
              goto LABEL_49;
            }
            goto LABEL_29;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = v21;
            -[NSObject assetAttributes](v44, "assetAttributes");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PLCloudBatchUploader _validateAdditionalAssetAttributes:onRelatedObject:](self, "_validateAdditionalAssetAttributes:onRelatedObject:", v45, v44))
            {
              objc_msgSend(v45, "asset");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:", v46, v45))
              {
                -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", v46, v91, v90, v92);
                objc_msgSend(v12, "propertyChangedAssetUuids");
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "uuid");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v84, "addObject:", v47);

                v12 = v88;
              }

            }
            goto LABEL_59;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v38 = v87;
            goto LABEL_40;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = v21;
            -[NSObject assetAttributes](v23, "assetAttributes");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            v85 = v48;
            if (v48)
            {
              objc_msgSend(v48, "asset");
              v82 = objc_claimAutoreleasedReturnValue();
              if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:"))
              {
                v79 = v23;
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                  {
                    -[NSObject uuid](v82, "uuid");
                    v51 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v78;
                    v106 = v51;
                    _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ adjusted", buf, 0xCu);

                  }
                }
                objc_msgSend(v12, "adjustedAssetUuids");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = v82;
                -[NSObject uuid](v82, "uuid");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "addObject:", v54);

                a6 = v94;
                v23 = v79;
              }
              else
              {
                v53 = v82;
              }
              goto LABEL_78;
            }
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v106 = v23;
                _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "Missing attributes for %@", buf, 0xCu);
              }
LABEL_78:

              v49 = v85;
            }

LABEL_19:
            goto LABEL_36;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "memoryChanges");
            v55 = objc_claimAutoreleasedReturnValue();
            goto LABEL_86;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "suggestionChanges");
            v55 = objc_claimAutoreleasedReturnValue();
            goto LABEL_86;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "userFeedbackChanges");
            v55 = objc_claimAutoreleasedReturnValue();
            goto LABEL_86;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "personChanges");
            v55 = objc_claimAutoreleasedReturnValue();
            goto LABEL_86;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "faceCropChanges");
            v55 = objc_claimAutoreleasedReturnValue();
            goto LABEL_86;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v21;
            -[NSObject associatedAssetForFaceOrTorso:orTemporal:](v32, "associatedAssetForFaceOrTorso:orTemporal:", 1, 0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:", v33, v32))
            {
              -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", v33, v81, 0, v92);
              objc_msgSend(v12, "faceChangedAssetUuids");
              v41 = objc_claimAutoreleasedReturnValue();
LABEL_49:
              v42 = (void *)v41;
              objc_msgSend(v33, "uuid");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "addObject:", v43);

              v12 = v88;
            }
LABEL_29:

LABEL_30:
LABEL_35:
            a6 = v94;
            goto LABEL_36;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v44 = v21;
            -[NSObject shareURL](v44, "shareURL");
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            if (v56)
            {
              v86 = v44;
              -[NSObject momentShareAssets](v44, "momentShareAssets");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v96 = 0u;
              v97 = 0u;
              v98 = 0u;
              v99 = 0u;
              v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
              if (v58)
              {
                v59 = v58;
                v60 = *(_QWORD *)v97;
                do
                {
                  for (i = 0; i != v59; ++i)
                  {
                    if (*(_QWORD *)v97 != v60)
                      objc_enumerationMutation(v57);
                    -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i), v91, 1, v92);
                  }
                  v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
                }
                while (v59);
              }

              v12 = v88;
              v44 = v86;
            }
            if (-[NSObject trashedState](v44, "trashedState") == 1)
            {
              v62 = -[NSObject cloudDeletionType](v44, "cloudDeletionType");
              if (v62 == 7)
              {
                v74 = (void *)MEMORY[0x1E0D113E8];
                -[NSObject scopeIdentifier](v44, "scopeIdentifier");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v74;
                v66 = v64;
                v67 = 3;
              }
              else
              {
                if (v62 != 6)
                  goto LABEL_59;
                v63 = (void *)MEMORY[0x1E0D113E8];
                -[NSObject scopeIdentifier](v44, "scopeIdentifier");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v63;
                v66 = v64;
                v67 = 2;
              }
              v75 = (void *)objc_msgSend(v65, "newDeleteScopeChangeWithScopeIdentifier:type:", v66, v67);

              if (v75)
              {
                objc_msgSend(v12, "deletedRecords");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "addObject:", v75);

              }
            }
LABEL_59:

            goto LABEL_35;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v39 = v21;
            objc_msgSend(v12, "libraryScopeChanges");
            v55 = objc_claimAutoreleasedReturnValue();
LABEL_86:
            v32 = v55;
            -[NSObject addObject:](v55, "addObject:", v39);
LABEL_45:

            goto LABEL_30;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = v21;
            if (!-[NSObject version](v23, "version"))
              objc_msgSend(v80, "addObject:", v23);
            goto LABEL_19;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v68 = v21;
            -[NSObject asset](v68, "asset");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "computeSyncChangedAssets");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "scopedIdentifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "addObject:", v70);

            v71 = v83;
            if (-[PLCloudBatchUploader _validateAsset:onRelatedObject:](self, "_validateAsset:onRelatedObject:", v83, v68))
            {
              -[PLCloudBatchUploader _addAsset:toAssetChanges:isInsert:seenAssetUuid:](self, "_addAsset:toAssetChanges:isInsert:seenAssetUuid:", v83, v91, v90, v92);
              objc_msgSend(v12, "propertyChangedAssetUuids");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "uuid");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "addObject:", v73);

              v71 = v83;
            }

            goto LABEL_35;
          }
        }
        else
        {
          if ((isKindOfClass & 1) != 0)
          {
            v34 = v21;
            objc_msgSend((id)objc_opt_class(), "predicateForUnpushedDeferredAssets");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "evaluateWithObject:", v34);

            if (v36)
            {
              objc_msgSend(v12, "deferredAssets");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "addObject:", v34);

            }
            goto LABEL_35;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = v21;
            if (-[NSObject primaryLabelCode](v32, "primaryLabelCode") != 1000)
              goto LABEL_30;
            v39 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v32);
            if (-[NSObject supportsCloudUpload](v39, "supportsCloudUpload"))
            {
              objc_msgSend(v12, "socialGroupChanges");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v39);

            }
            goto LABEL_45;
          }
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              goto LABEL_19;
            *(_DWORD *)buf = 138412290;
            v106 = v21;
            v24 = v23;
            v25 = OS_LOG_TYPE_DEBUG;
            v26 = "Object is not supported for CPL, skipping %@";
LABEL_14:
            v27 = 12;
LABEL_18:
            _os_log_impl(&dword_199541000, v24, v25, v26, buf, v27);
            goto LABEL_19;
          }
        }
LABEL_36:

        ++v19;
      }
      while (v19 != v17);
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
      v17 = v77;
    }
    while (v77);
  }

}

- (void)_handleSharingChanges:(id)a3 forUploadEvent:(id)a4 inManagedObjectContext:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v32 = a4;
  objc_msgSend(v32, "updatedAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLUpdatedAttributesByObjectIDKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "unsignedLongValue");

          +[PLManagedAsset listOfSharingAttributesRelevantForUpload](PLManagedAsset, "listOfSharingAttributesRelevantForUpload");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[PLPropertyIndexMapping indexValueForAttributeNames:entity:](PLPropertyIndexMapping, "indexValueForAttributeNames:entity:", v17, v18);

          if ((v19 & v16) != 0)
          {
            objc_msgSend(v32, "sharingPropertyChangedAssetUuids");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uuid");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v21);

          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLUpdatedRelationshipsByObjectIDKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "unsignedLongValue");

          +[PLManagedAsset listOfSharingRelationshipsRelevantForUpload](PLManagedAsset, "listOfSharingRelationshipsRelevantForUpload");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLManagedAsset entityName](PLManagedAsset, "entityName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = +[PLPropertyIndexMapping indexValueForRelationshipNames:entity:](PLPropertyIndexMapping, "indexValueForRelationshipNames:entity:", v26, v27);

          if ((v28 & v25) != 0)
          {
            objc_msgSend(v32, "sharingPropertyChangedAssetUuids");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "addObject:", v30);

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

}

- (BOOL)_validateAdditionalAssetAttributes:(id)a3 onRelatedObject:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (!objc_msgSend(v6, "isDeleted"))
    {
      v14 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v6, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isDeleted");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = v10;
    -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _promptToFileRadarWithTitle:description:](self, "_promptToFileRadarWithTitle:description:", CFSTR("TTR: Found deleted asset attributes on related object"), CFSTR("Found deleted asset attributes %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234"), v8, v11, v12);

    goto LABEL_9;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Found related object without an asset attributes: %@", buf, 0xCu);

    }
LABEL_9:

  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_validateAsset:(id)a3 onRelatedObject:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  int v16;
  __CFString *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        goto LABEL_21;
      }
      -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v13;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Found related object without an asset: %@", buf, 0xCu);
LABEL_19:

      goto LABEL_20;
    }
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isDeleted"))
  {
    objc_msgSend(v6, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isDeleted");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = v10;
    -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _promptToFileRadarWithTitle:description:](self, "_promptToFileRadarWithTitle:description:", CFSTR("TTR: Found deleted asset on related object"), CFSTR("Found deleted asset %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234"), v8, v11, v12);
LABEL_15:

    goto LABEL_20;
  }
  objc_msgSend(v6, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(v6, "objectID");
    v8 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "isDeleted");
    v17 = CFSTR("NO");
    if (v16)
      v17 = CFSTR("YES");
    v11 = v17;
    -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _promptToFileRadarWithTitle:description:](self, "_promptToFileRadarWithTitle:description:", CFSTR("TTR: Found asset with no UUID on related object"), CFSTR("Found asset with no UUID %@ (isDeleted=%@) on related object %@.\n\nSee rdar://problem/41032234"), v8, v11, v12);
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "supportsCloudUpload") & 1) == 0)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      -[PLCloudBatchUploader _syncDescriptionForObject:](self, "_syncDescriptionForObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v13;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Related Object %@ attempted to push unsyncable asset: %@", buf, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v15 = 1;
LABEL_22:

  return v15;
}

- (void)_promptToFileRadarWithTitle:(id)a3 description:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (objc_class *)MEMORY[0x1E0CB3940];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFormat:arguments:", v7, &v13);

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_FAULT, "%{public}@", buf, 0xCu);
    }

  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Cloud Photo Library sync state"), CFSTR("Please file a Radar against Photos"), v5, v8);

}

- (id)_syncDescriptionForObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "syncDescription");
  else
    objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_addAsset:(id)a3 toAssetChanges:(id)a4 isInsert:(BOOL)a5 seenAssetUuid:(id)a6
{
  _BOOL4 v7;
  id v10;
  NSMutableSet *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSMutableSet *cameraAsset;
  id v16;

  v7 = a5;
  v16 = a3;
  v10 = a4;
  v11 = (NSMutableSet *)a6;
  objc_msgSend(v16, "uuid");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v16 && v12)
  {
    if ((-[NSMutableSet containsObject:](v11, "containsObject:", v12) & 1) == 0)
    {
      objc_msgSend(v16, "filename");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v10, "addObject:", v16);
        cameraAsset = v11;
LABEL_9:
        -[NSMutableSet addObject:](cameraAsset, "addObject:", v13);
        goto LABEL_10;
      }
      if (v7)
      {
        cameraAsset = self->_cameraAsset;
        goto LABEL_9;
      }
    }
  }
  else
  {
    -[PLCloudBatchUploader _handleInvalidAsset:](self, "_handleInvalidAsset:", v16);
  }
LABEL_10:

}

- (void)_handleInvalidAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ignoring nil asset, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32604898"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ignoring asset with nil uuid: %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32604898"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    PLSimulateCrash();

    v5 = v7;
  }

}

- (void)_promptForNilAssetUUID:(id)a3 isInsert:(BOOL)a4
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a4)
    v5 = CFSTR("inserting");
  else
    v5 = CFSTR("updating");
  v6 = a3;
  objc_msgSend(v6, "objectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isDeleted");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Found %@ asset with nil uuid %@ (isDeleted=%@) %@.\n\nSee rdar://problem/52539172"), v5, v7, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

  }
  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: asset with nil uuid"), v10);

}

- (id)_fetchChangesFromLocalEvent:(id)a3 shouldTriggerPrefetch:(BOOL *)a4 inLibrary:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PLCloudUploadChanges *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  NSMutableSet *cameraAsset;
  void *v56;
  int v57;
  void *v58;
  char v59;
  void *v60;
  NSMutableSet *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id obj;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  id v104;
  PLCloudUploadChanges *v105;
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
  __int128 v121;
  const __CFString *v122;
  const __CFString *v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint8_t v127[128];
  uint8_t buf[4];
  id v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v104 = a3;
  v87 = a5;
  objc_msgSend(v87, "managedObjectContext");
  v8 = objc_claimAutoreleasedReturnValue();
  v105 = objc_alloc_init(PLCloudUploadChanges);
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v129 = v104;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "localEvent = %@", buf, 0xCu);
    }

  }
  objc_msgSend(v104, "objectForKey:", *MEMORY[0x1E0C97870]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudBatchUploader _sortData:isInsert:forUploadChanges:shouldTriggerPrefetch:inManagedObjectContext:](self, "_sortData:isInsert:forUploadChanges:shouldTriggerPrefetch:inManagedObjectContext:", v10, 1, v105, a4, v8);

  objc_msgSend(v104, "objectForKey:", *MEMORY[0x1E0C97A18]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudBatchUploader _sortData:isInsert:forUploadChanges:shouldTriggerPrefetch:inManagedObjectContext:](self, "_sortData:isInsert:forUploadChanges:shouldTriggerPrefetch:inManagedObjectContext:", v11, 0, v105, a4, v8);

  objc_msgSend(v104, "objectForKey:", CFSTR("PLUpdatedRelationshipsByObjectIDKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudBatchUploader _sortRelationshipData:forUploadChanges:inManagedObjectContext:](self, "_sortRelationshipData:forUploadChanges:inManagedObjectContext:", v12, v105, v8);

  v13 = v105;
  v85 = (void *)v8;
  -[PLCloudBatchUploader _handleSharingChanges:forUploadEvent:inManagedObjectContext:](self, "_handleSharingChanges:forUploadEvent:inManagedObjectContext:", v104, v105, v8);
  v86 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v87, "mainScopeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  PLAllCloudDeletionKeys();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
  if (v100)
  {
    v98 = *(id *)v119;
    do
    {
      v15 = 0;
      do
      {
        if (*(id *)v119 != v98)
          objc_enumerationMutation(obj);
        v102 = v15;
        v16 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v15);
        objc_msgSend(v104, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = 0u;
        v115 = 0u;
        v116 = 0u;
        v117 = 0u;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v115;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v115 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v21);
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v14, v22);
              if ((-[NSMutableSet containsObject:](self->_downloadedDeleteRecords, "containsObject:", v23) & 1) == 0)
              {
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudAssetDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D11348];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudAlbumDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D11340];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudMemoryDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D113D0];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudPersonDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D113F0];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudFaceCropDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D11388];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudOwnedCMMDeleteGUIDs")))
                {
                  v28 = (void *)MEMORY[0x1E0D113E8];
                  v29 = v22;
                  v30 = 2;
                  goto LABEL_40;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudSubscribedCMMDeleteGUIDs")))
                {
                  v28 = (void *)MEMORY[0x1E0D113E8];
                  v29 = v22;
                  v30 = 3;
                  goto LABEL_40;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudOwnedLibraryScopeDeleteGUIDs")))
                {
                  v28 = (void *)MEMORY[0x1E0D11460];
                  v29 = v22;
                  v30 = 4;
                  goto LABEL_40;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudSubscribedLibraryScopeDeleteGUIDs")))
                {
                  v28 = (void *)MEMORY[0x1E0D11460];
                  v29 = v22;
                  v30 = 5;
LABEL_40:
                  v25 = objc_msgSend(v28, "newDeleteScopeChangeWithScopeIdentifier:type:", v29, v30);
LABEL_27:
                  v26 = v25;
                  if (!v25)
                    goto LABEL_30;
LABEL_28:
                  -[PLCloudUploadChanges deletedRecords](v13, "deletedRecords");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "addObject:", v26);

                  v13 = v105;
LABEL_29:

                  goto LABEL_30;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudSuggestionDeleteGUIDs"))
                  || objc_msgSend(v16, "isEqualToString:", CFSTR("cloudUserFeedbackDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D114B0];
LABEL_26:
                  v25 = objc_msgSend(v24, "newDeleteChangeWithScopedIdentifier:", v23);
                  goto LABEL_27;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudSocialGroupDeleteGUIDs")))
                {
                  v24 = (void *)MEMORY[0x1E0D11480];
                  goto LABEL_26;
                }
                if (objc_msgSend(v16, "isEqualToString:", CFSTR("cloudInternalResourceUUIDToResourceTypeMappings")))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-@-");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "componentsSeparatedByString:", v94);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  v96 = v31;
                  if (objc_msgSend(v31, "count") == 2)
                  {
                    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
                    v32 = objc_claimAutoreleasedReturnValue();
                    +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v95, v87);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v92, "master");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v93 = (void *)v32;
                    if (v33)
                    {
                      v90 = v33;
                      v34 = objc_alloc_init(MEMORY[0x1E0D11378]);
                      v35 = (void *)v32;
                      v36 = v34;
                      objc_msgSend(v34, "setResourceType:", objc_msgSend(v35, "integerValue"));
                      objc_msgSend(v36, "setExpungedState:", 2);
                      objc_msgSend(MEMORY[0x1E0C99D68], "date");
                      v37 = objc_claimAutoreleasedReturnValue();
                      v91 = v36;
                      v38 = v36;
                      v39 = (void *)v37;
                      objc_msgSend(v38, "setExpungedDate:");

                      objc_msgSend(v86, "objectForKeyedSubscript:", v95);
                      v26 = objc_claimAutoreleasedReturnValue();
                      if (!v26)
                      {
                        objc_msgSend(v90, "cplPropertyRecord");
                        v26 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v86, "setObject:forKeyedSubscript:", v26, v95);
                      }
                      -[NSObject expungeableResourceStates](v26, "expungeableResourceStates");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v40)
                        v40 = (void *)MEMORY[0x1E0C9AA60];
                      v89 = v40;
                      objc_msgSend(v40, "arrayByAddingObject:", v91);
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      -[NSObject setExpungeableResourceStates:](v26, "setExpungeableResourceStates:", v88);

                      v33 = v90;
                    }
                    else
                    {
                      v26 = 0;
                    }

                  }
                  else
                  {
                    v26 = 0;
                  }

                  if (v26)
                    goto LABEL_28;
                }
                else if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v129 = v16;
                    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Unsupported cloudDeleteKey %@", buf, 0xCu);
                  }
                  goto LABEL_29;
                }
              }
LABEL_30:

              ++v21;
            }
            while (v19 != v21);
            v41 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
            v19 = v41;
          }
          while (v41);
        }

        v15 = v102 + 1;
      }
      while (v102 + 1 != v100);
      v100 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, v127, 16);
    }
    while (v100);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  -[PLCloudUploadChanges insertedAssets](v13, "insertedAssets");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v111;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v111 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
        objc_msgSend(v47, "uuid");
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48)
        {
          objc_msgSend(v47, "uuid");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "addObject:", v49);

        }
        else
        {
          -[PLCloudBatchUploader _promptForNilAssetUUID:isInsert:](self, "_promptForNilAssetUUID:isInsert:", v47, 1);
        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v110, v125, 16);
    }
    while (v44);
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  -[PLCloudUploadChanges updatedAssets](v105, "updatedAssets");
  v99 = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
  if (v50)
  {
    v51 = v50;
    v101 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v107 != v101)
          objc_enumerationMutation(v99);
        v53 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
        objc_msgSend(v53, "uuid");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v54)
        {
          -[PLCloudBatchUploader _promptForNilAssetUUID:isInsert:](self, "_promptForNilAssetUUID:isInsert:", v53, 0);
          continue;
        }
        cameraAsset = self->_cameraAsset;
        objc_msgSend(v53, "uuid");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableSet containsObject:](cameraAsset, "containsObject:", v56) & 1) != 0)
        {

LABEL_85:
          objc_msgSend(v53, "uuid");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v103, "containsObject:", v58);

          if ((v59 & 1) == 0)
          {
            -[PLCloudUploadChanges insertedAssets](v105, "insertedAssets");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "addObject:", v53);

          }
          v61 = self->_cameraAsset;
          objc_msgSend(v53, "uuid");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableSet removeObject:](v61, "removeObject:", v62);

          goto LABEL_88;
        }
        v57 = objc_msgSend(v53, "cloudLocalState");

        if (!v57)
          goto LABEL_85;
LABEL_88:
        objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("PLUpdatedAttributesByObjectIDKey"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "objectID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectForKeyedSubscript:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "unsignedLongValue");

        v123 = CFSTR("deferredProcessingNeeded");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset entityName](PLManagedAsset, "entityName");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = +[PLPropertyIndexMapping indexValueForAttributeNames:entity:](PLPropertyIndexMapping, "indexValueForAttributeNames:entity:", v67, v68);

        if ((v69 & v66) != 0)
        {
          -[PLCloudUploadChanges adjustedAssetUuids](v105, "adjustedAssetUuids");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "uuid");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "addObject:", v71);

        }
        objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("PLUpdatedAttributesByObjectIDKey"));
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "additionalAttributes");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectID");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "unsignedLongValue");

        v122 = CFSTR("originalResourceChoice");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAdditionalAssetAttributes entityName](PLAdditionalAssetAttributes, "entityName");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = +[PLPropertyIndexMapping indexValueForAttributeNames:entity:](PLPropertyIndexMapping, "indexValueForAttributeNames:entity:", v77, v78);

        if ((v79 & v76) != 0)
        {
          -[PLCloudUploadChanges adjustedAssetUuids](v105, "adjustedAssetUuids");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "uuid");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "addObject:", v81);

        }
      }
      v51 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v106, v124, 16);
    }
    while (v51);
  }

  -[PLCloudUploadChanges updatedAssets](v105, "updatedAssets");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudUploadChanges insertedAssets](v105, "insertedAssets");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "removeObjectsInArray:", v83);

  return v105;
}

- (void)handleUploadBatchesFromLocalEvent:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 shouldTriggerPrefetch:(BOOL *)a6 withUploadTracker:(id)a7 inLibrary:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  BOOL *v24;
  unint64_t *v25;
  unint64_t *v26;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __152__PLCloudBatchUploader_handleUploadBatchesFromLocalEvent_outInsertedPhotoCount_outInsertedVideoCount_shouldTriggerPrefetch_withUploadTracker_inLibrary___block_invoke;
  v20[3] = &unk_1E365FB88;
  v20[4] = self;
  v21 = v14;
  v24 = a6;
  v25 = a4;
  v26 = a5;
  v22 = v16;
  v23 = v15;
  v17 = v15;
  v18 = v16;
  v19 = v14;
  objc_msgSend(v18, "performTransactionAndWait:", v20);

}

- (void)_processAlbumInserts:(id)a3 albumChanges:(id)a4 withBatchManager:(id)a5 inLibrary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a3, "arrayByAddingObjectsFromArray:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum includeUnpushedParentsForAlbums:limit:](PLGenericAlbum, "includeUnpushedParentsForAlbums:limit:", v14, 0x7FFFFFFFFFFFFFFFLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "cplAlbumChangeInPhotoLibrary:", v10, (_QWORD)v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addRecord:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

}

- (id)_validateAssets:(id)a3 fromCloudUuidDeleteList:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v10 = v8;
    v11 = (_BYTE *)MEMORY[0x1E0D115D0];
    v12 = *(_QWORD *)v27;
    *(_QWORD *)&v9 = 138543362;
    v23 = v9;
    v24 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v14, "scopedIdentifier", v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 && objc_msgSend(v25, "containsObject:", v15))
        {
          if (!*v11)
          {
            __CPLAssetsdOSLogDomain();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v31 = v15;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Skipping insert/update for asset %{public}@ since we see it in a delete", buf, 0xCu);
            }

          }
        }
        else
        {
          v17 = objc_msgSend(v14, "cloudLocalState");
          v18 = v17 == 4 || (unsigned __int16)v17 == 2;
          if (v18 && !*v11)
          {
            v19 = v17;
            __CPLAssetsdOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v14, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v31 = v21;
              v32 = 1024;
              v33 = v19;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Going to retry asset %{public}@ with localState %d", buf, 0x12u);

              v11 = (_BYTE *)MEMORY[0x1E0D115D0];
              v12 = v24;
            }

          }
          objc_msgSend(v6, "addObject:", v14);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)createBatchesForChanges:(id)a3 outInsertedPhotoCount:(unint64_t *)a4 outInsertedVideoCount:(unint64_t *)a5 withUploadTracker:(id)a6 inLibrary:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  NSObject *v78;
  NSObject *v79;
  unint64_t *v80;
  int v81;
  NSObject *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  uint64_t v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t m;
  void *v96;
  void *v97;
  int v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  void *v110;
  PLCloudBatchUploader *v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  NSObject *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  NSObject *v122;
  uint64_t v123;
  NSObject *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  unint64_t *v129;
  int v130;
  NSObject *v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  int v139;
  void *v140;
  int v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  void *v147;
  void *v148;
  int v149;
  NSObject *v150;
  uint64_t v151;
  id v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t n;
  void *v157;
  void *v158;
  uint64_t v159;
  NSObject *v160;
  void *v161;
  NSObject *v162;
  id v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t ii;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t jj;
  NSObject *v176;
  NSObject *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t kk;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t mm;
  void *v191;
  void *v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t nn;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t i1;
  void *v207;
  void *v208;
  void *v209;
  id v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t i2;
  void *v215;
  void *v216;
  void *v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  char isKindOfClass;
  uint64_t v222;
  uint64_t i3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v225;
  void *v226;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v254;
  id obj;
  void *v256;
  void *v257;
  uint64_t v258;
  void *v259;
  id v260;
  NSObject *v261;
  void *v262;
  void *v263;
  uint64_t v264;
  PLCloudBatchUploader *v265;
  PLCloudPhotoLibraryBatchManager *v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  _QWORD v307[4];
  id v308;
  id v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  char v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  _QWORD v331[4];
  id v332;
  PLCloudPhotoLibraryBatchManager *v333;
  _BYTE v334[128];
  _BYTE v335[128];
  _BYTE v336[128];
  _BYTE v337[128];
  _BYTE v338[128];
  _BYTE v339[128];
  _BYTE v340[128];
  _BYTE v341[128];
  _BYTE v342[128];
  _BYTE v343[128];
  uint8_t v344[128];
  uint8_t buf[4];
  NSObject *v346;
  __int16 v347;
  NSObject *v348;
  _BYTE v349[128];
  _BYTE v350[128];
  _BYTE v351[128];
  _BYTE v352[128];
  uint64_t v353;

  v353 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v10, "insertedAssets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedAssets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deferredAssets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedMasters");
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyChangedAssetUuids");
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sharingPropertyChangedAssetUuids");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "adjustedAssetUuids");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceChangedAssetUuids");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "computeSyncChangedAssets");
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertedResources");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updatedResources");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albumInserts");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "albumChanges");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "memoryChanges");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personChanges");
  v237 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "faceCropChanges");
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestionChanges");
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userFeedbackChanges");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryScopeChanges");
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "socialGroupChanges");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deletedRecords");
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = v10;
  objc_msgSend(v10, "updatedRelationship");
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  v265 = self;
  v233 = (void *)v18;
  v234 = (void *)v17;
  v266 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  -[PLCloudBatchUploader _processAlbumInserts:albumChanges:withBatchManager:inLibrary:](self, "_processAlbumInserts:albumChanges:withBatchManager:inLibrary:", v17, v18);
  if (objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    v19 = (void *)MEMORY[0x19AEC1554]();
    -[PLCloudBatchUploader _personsToUploadIncludingReverseOrderedMergeTargetsForPersons:](self, "_personsToUploadIncludingReverseOrderedMergeTargetsForPersons:", v237);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v20, "count"));
    v331[0] = MEMORY[0x1E0C809B0];
    v331[1] = 3221225472;
    v331[2] = __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke;
    v331[3] = &unk_1E366ACD8;
    v22 = v21;
    v332 = v22;
    v333 = v266;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v331);

    objc_autoreleasePoolPop(v19);
  }
  v257 = v12;
  if (objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    v262 = v13;
    v23 = v14;
    v24 = v16;
    v25 = v15;
    v26 = v11;
    v330 = 0u;
    v329 = 0u;
    v328 = 0u;
    v327 = 0u;
    v27 = v236;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v327, v352, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v328;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v328 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v327 + 1) + 8 * i);
          v33 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v32, "cplFaceCropChange");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v34);

          objc_autoreleasePoolPop(v33);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v327, v352, 16);
      }
      while (v29);
    }

    v11 = v26;
    v12 = v257;
    v15 = v25;
    v16 = v24;
    v14 = v23;
    v13 = v262;
  }
  v35 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v238, "valueForKey:", CFSTR("scopedIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = objc_claimAutoreleasedReturnValue();

  -[PLCloudBatchUploader _validateAssets:fromCloudUuidDeleteList:](v265, "_validateAssets:fromCloudUuidDeleteList:", v13, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v231 = (void *)v37;
  -[PLCloudBatchUploader _validateAssets:fromCloudUuidDeleteList:](v265, "_validateAssets:fromCloudUuidDeleteList:", v14, v37);
  v244 = (void *)objc_claimAutoreleasedReturnValue();

  v326 = 0u;
  v325 = 0u;
  v324 = 0u;
  v323 = 0u;
  v39 = v16;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v323, v351, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v324;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v324 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v323 + 1) + 8 * j);
        if (objc_msgSend(v44, "cplType") == 23 || objc_msgSend(v44, "cplType") == 24)
        {
          objc_msgSend(v44, "asset");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "master");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            objc_msgSend(v46, "cplFullRecord");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v47);

          }
        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v323, v351, 16);
    }
    while (v41);
  }
  v232 = v39;

  v322 = 0u;
  v321 = 0u;
  v320 = 0u;
  v319 = 0u;
  v48 = v15;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v319, v350, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v320;
    do
    {
      for (k = 0; k != v50; ++k)
      {
        if (*(_QWORD *)v320 != v51)
          objc_enumerationMutation(v48);
        objc_msgSend(*(id *)(*((_QWORD *)&v319 + 1) + 8 * k), "scopedIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "trackDeferredAssetForScopedIdentifier:", v53);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v319, v350, 16);
    }
    while (v50);
  }
  v254 = v11;
  v230 = v48;

  v318 = 0u;
  v317 = 0u;
  v316 = 0u;
  v315 = 0u;
  obj = v38;
  v260 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v349, 16);
  if (v260)
  {
    v258 = *(_QWORD *)v316;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v316 != v258)
          objc_enumerationMutation(obj);
        v55 = *(NSObject **)(*((_QWORD *)&v315 + 1) + 8 * (_QWORD)v54);
        v56 = (void *)MEMORY[0x19AEC1554]();
        -[NSObject momentShare](v55, "momentShare");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        if (!v57
          || (objc_msgSend(v57, "shareURL"), v59 = (void *)objc_claimAutoreleasedReturnValue(), v59, v59))
        {
          -[NSObject cloudAssetGUID](v55, "cloudAssetGUID");
          v60 = objc_claimAutoreleasedReturnValue();
          if (v60 && -[NSObject cloudLocalState](v55, "cloudLocalState"))
            v61 = 2;
          else
            v61 = 0;
          v314 = 0;
          -[NSObject existingCloudMasterNeedsRepush:](v55, "existingCloudMasterNeedsRepush:", &v314);
          v62 = objc_claimAutoreleasedReturnValue();
          v63 = v62;
          if (v314)
          {
            -[NSObject cplPropertyRecord](v62, "cplPropertyRecord");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v64);

          }
          if (!v63
            || !-[NSObject cloudLocalState](v63, "cloudLocalState")
            || -[NSObject cloudLocalState](v63, "cloudLocalState") == 4)
          {
            -[NSObject cplMasterChangeInLibrary:shouldGenerateDerivatives:](v55, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v12, v265->_shouldGenerateDerivatives);
            v65 = objc_claimAutoreleasedReturnValue();
            if (v65)
            {
              v66 = (void *)v65;
              v263 = v56;
              -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v65);
              -[NSObject master](v55, "master");
              v67 = objc_claimAutoreleasedReturnValue();

              if (-[NSObject placeholderState](v67, "placeholderState") != 1)
              {
                v68 = -[NSObject sizeOfOriginal](v67, "sizeOfOriginal");
                -[NSObject scopedIdentifier](v67, "scopedIdentifier");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject scopedIdentifier](v55, "scopedIdentifier");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v254, "addSizeForUnpushedOriginals:forMasterScopedIdentifier:forAssetScopedIdentifier:", v68, v69, v70);

                v12 = v257;
              }
              if (v67)
              {
                v63 = v67;
                goto LABEL_76;
              }
              v63 = 0;
LABEL_103:
              v56 = v263;
LABEL_104:

              goto LABEL_105;
            }
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v72 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              {
                -[NSObject uuid](v55, "uuid");
                v73 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v346 = v73;
                _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_ERROR, "Failed to create master for %{public}@. Skipping upload", buf, 0xCu);

              }
            }
            v66 = 0;
            v74 = v63;
            v63 = 0;
LABEL_102:

            goto LABEL_104;
          }
          v263 = v56;
          if (-[NSObject cloudLocalState](v63, "cloudLocalState") != 3)
            goto LABEL_75;
          if (-[PLCloudBatchUploader _hasUnuploadedResourceForAsset:resourceType:cloudMaster:](v265, "_hasUnuploadedResourceForAsset:resourceType:cloudMaster:", v55, 17, v63))
          {
            -[NSObject cplMasterChangeInLibrary:shouldGenerateDerivatives:](v55, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v12, v265->_shouldGenerateDerivatives);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v75 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v346 = v63;
                  v347 = 2112;
                  v348 = v55;
                  v76 = v75;
                  v77 = "Pushing uploaded CloudMaster %@ again since new asset %@ has an original alternate resource this"
                        " master does not have";
                  goto LABEL_72;
                }
                goto LABEL_73;
              }
              goto LABEL_74;
            }
            goto LABEL_76;
          }
          if (!-[PLCloudBatchUploader _hasUnuploadedResourceForAsset:resourceType:cloudMaster:](v265, "_hasUnuploadedResourceForAsset:resourceType:cloudMaster:", v55, 18, v63))
          {
LABEL_75:
            v66 = 0;
            goto LABEL_76;
          }
          -[NSObject cplMasterChangeInLibrary:shouldGenerateDerivatives:](v55, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v12, v265->_shouldGenerateDerivatives);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (v66)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v75 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v346 = v63;
                v347 = 2112;
                v348 = v55;
                v76 = v75;
                v77 = "Pushing uploaded CloudMaster %@ again since new asset %@ has an original video complement resource"
                      " this master does not have";
LABEL_72:
                _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_DEFAULT, v77, buf, 0x16u);
              }
LABEL_73:

            }
LABEL_74:
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v66);
          }
LABEL_76:
          if (-[NSObject cloudLocalState](v63, "cloudLocalState") == 2)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v78 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v346 = v63;
                v347 = 2112;
                v348 = v55;
                _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
              }
LABEL_96:

            }
            -[NSObject originalFilename](v63, "originalFilename");
            v83 = objc_claimAutoreleasedReturnValue();
            if (v83)
            {
              v84 = (void *)v83;
              -[NSObject originalFilename](v55, "originalFilename");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject originalFilename](v63, "originalFilename");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v85, "isEqualToString:", v86);

              v12 = v257;
              if ((v87 & 1) == 0)
              {
                -[NSObject originalFilename](v63, "originalFilename");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setOriginalFilename:](v55, "setOriginalFilename:", v88);

              }
            }
            -[NSObject computeSyncAttributes](v55, "computeSyncAttributes");
            v89 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v89)
              goto LABEL_103;
            -[NSObject scopedIdentifier](v55, "scopedIdentifier");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryBatchManager addComputeSyncRelevantAsset:](v266, "addComputeSyncRelevantAsset:", v74);
            v56 = v263;
            goto LABEL_102;
          }
          -[NSObject scopedIdentifier](v63, "scopedIdentifier");
          v78 = objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            -[NSObject cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:](v55, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v78, v61, v265->_shouldGenerateDerivatives, v12);
            v79 = objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v79);
            if (-[NSObject shouldIncludeInCPLCounts](v55, "shouldIncludeInCPLCounts"))
            {
              if (-[NSObject isPhoto](v55, "isPhoto"))
              {
                v80 = a4;
                if (!a4)
                  goto LABEL_91;
              }
              else
              {
                v81 = -[NSObject isVideo](v55, "isVideo");
                if (!a5)
                  goto LABEL_91;
                v80 = a5;
                if (!v81)
                  goto LABEL_91;
              }
              ++*v80;
            }
LABEL_91:
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v346 = v79;
                _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEBUG, "Adding asset %@ to initial batch", buf, 0xCu);
              }

            }
          }
          else
          {
            if (*MEMORY[0x1E0D115D0])
            {
              v78 = 0;
              goto LABEL_96;
            }
            __CPLAssetsdOSLogDomain();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v346 = v55;
              _os_log_impl(&dword_199541000, v79, OS_LOG_TYPE_ERROR, "No valid masterGUID for asset %@. Skipping upload", buf, 0xCu);
            }
          }

          goto LABEL_96;
        }
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_106;
        __CPLAssetsdOSLogDomain();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject _compactDebugDescription](v55, "_compactDebugDescription");
          v71 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v346 = v71;
          _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_DEFAULT, "Skipping asset %{public}@ on an unpublished moment share", buf, 0xCu);

        }
LABEL_105:

LABEL_106:
        objc_autoreleasePoolPop(v56);
        v54 = (char *)v54 + 1;
      }
      while (v260 != v54);
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v315, v349, 16);
      v260 = (id)v90;
    }
    while (v90);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v310 = 0u;
  v311 = 0u;
  v312 = 0u;
  v313 = 0u;
  v91 = v244;
  v92 = -[NSObject countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v310, v344, 16);
  if (v92)
  {
    v93 = v92;
    v94 = *(_QWORD *)v311;
    do
    {
      for (m = 0; m != v93; ++m)
      {
        if (*(_QWORD *)v311 != v94)
          objc_enumerationMutation(v91);
        v96 = *(void **)(*((_QWORD *)&v310 + 1) + 8 * m);
        if (objc_msgSend(v96, "isPartOfBurst"))
        {
          objc_msgSend(v96, "uuid");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = objc_msgSend(v256, "containsObject:", v97);

          if (v98)
          {
            objc_msgSend(v96, "avalancheUUID");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v259, "containsObject:", v99);

            if ((v100 & 1) == 0)
            {
              objc_msgSend(v96, "avalancheUUID");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v259, "addObject:", v101);

              objc_msgSend(v96, "avalancheUUID");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v257, "managedObjectContext");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();

              v307[0] = MEMORY[0x1E0C809B0];
              v307[1] = 3221225472;
              v307[2] = __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_103;
              v307[3] = &unk_1E3677A78;
              v308 = v251;
              v309 = v256;
              objc_msgSend(v104, "enumerateObjectsUsingBlock:", v307);

            }
          }
        }
      }
      v93 = -[NSObject countByEnumeratingWithState:objects:count:](v91, "countByEnumeratingWithState:objects:count:", &v310, v344, 16);
    }
    while (v93);
  }

  if (objc_msgSend(v251, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v91);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v251, "allObjects");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "addObjectsFromArray:", v106);

    v107 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(v105, "allObjects");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "arrayWithArray:", v108);
    v109 = objc_claimAutoreleasedReturnValue();

    v110 = v257;
    v111 = v265;
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v346 = v109;
        _os_log_impl(&dword_199541000, v112, OS_LOG_TYPE_DEBUG, "new update list: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v109 = v91;
    v110 = v257;
    v111 = v265;
  }
  v305 = 0u;
  v306 = 0u;
  v303 = 0u;
  v304 = 0u;
  v261 = v109;
  v113 = -[NSObject countByEnumeratingWithState:objects:count:](v261, "countByEnumeratingWithState:objects:count:", &v303, v343, 16);
  if (v113)
  {
    v114 = v113;
    v264 = *(_QWORD *)v304;
    do
    {
      v115 = 0;
      do
      {
        if (*(_QWORD *)v304 != v264)
          objc_enumerationMutation(v261);
        v116 = *(NSObject **)(*((_QWORD *)&v303 + 1) + 8 * v115);
        v117 = (void *)MEMORY[0x19AEC1554]();
        -[NSObject existingCloudMasterNeedsRepush:](v116, "existingCloudMasterNeedsRepush:", 0);
        v118 = objc_claimAutoreleasedReturnValue();
        v119 = v118;
        if (!v118
          || !-[NSObject cloudLocalState](v118, "cloudLocalState")
          || -[NSObject cloudLocalState](v119, "cloudLocalState") == 4
          || -[NSObject cloudLocalState](v116, "cloudLocalState") == 4)
        {
          -[NSObject cplMasterChangeInLibrary:shouldGenerateDerivatives:](v116, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v110, v111->_shouldGenerateDerivatives);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "scopedIdentifier");
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          if (v121)
          {
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v120);
            -[NSObject master](v116, "master");
            v122 = objc_claimAutoreleasedReturnValue();

            if (-[NSObject placeholderState](v122, "placeholderState") != 1)
            {
              v123 = -[NSObject sizeOfOriginal](v122, "sizeOfOriginal");
              -[NSObject scopedIdentifier](v122, "scopedIdentifier");
              v124 = objc_claimAutoreleasedReturnValue();
              -[NSObject scopedIdentifier](v116, "scopedIdentifier");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v254, "addSizeForUnpushedOriginals:forMasterScopedIdentifier:forAssetScopedIdentifier:", v123, v124, v125);

              v111 = v265;
              v110 = v257;
              goto LABEL_144;
            }
            goto LABEL_145;
          }
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v124 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v346 = v116;
              _os_log_impl(&dword_199541000, v124, OS_LOG_TYPE_ERROR, "Skip attemping to add master change with nil scopedIdentifier, asset %@", buf, 0xCu);
            }
            v122 = v119;
LABEL_144:

LABEL_145:
            v119 = v122;
          }
          -[NSObject scopedIdentifier](v119, "scopedIdentifier");
          v126 = (void *)objc_claimAutoreleasedReturnValue();

          if (v126)
          {
            -[NSObject scopedIdentifier](v119, "scopedIdentifier");
            v127 = objc_claimAutoreleasedReturnValue();
            -[NSObject cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:](v116, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v127, 0, v111->_shouldGenerateDerivatives, v110);
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v128);
            if (!-[NSObject shouldIncludeInCPLCounts](v116, "shouldIncludeInCPLCounts"))
              goto LABEL_157;
            if (-[NSObject isPhoto](v116, "isPhoto"))
            {
              v129 = a4;
              if (!a4)
                goto LABEL_157;
LABEL_156:
              ++*v129;
              goto LABEL_157;
            }
            v130 = -[NSObject isVideo](v116, "isVideo");
            if (a5)
            {
              v129 = a5;
              if (v130)
                goto LABEL_156;
            }
LABEL_157:

LABEL_158:
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v346 = v116;
              _os_log_impl(&dword_199541000, v127, OS_LOG_TYPE_ERROR, "No valid masterGUID for asset %@. Will retry in the next round", buf, 0xCu);
            }
            goto LABEL_158;
          }

          goto LABEL_160;
        }
        if (-[NSObject cloudLocalState](v119, "cloudLocalState") == 2)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v131 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v346 = v119;
              v347 = 2112;
              v348 = v116;
              _os_log_impl(&dword_199541000, v131, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
            }

          }
          objc_msgSend(v250, "addObject:", v116);
          goto LABEL_160;
        }
        -[NSObject uuid](v116, "uuid");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v247, "containsObject:", v132))
          v133 = 32;
        else
          v133 = 0;
        if (objc_msgSend(v256, "containsObject:", v132))
          v133 |= 2uLL;
        if (objc_msgSend(v249, "containsObject:", v132))
          v133 |= 0x40uLL;
        if (objc_msgSend(v245, "containsObject:", v116))
          v134 = v133 | 0x10;
        else
          v134 = v133;
        if (objc_msgSend(v248, "containsObject:", v132))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSObject hasAdjustments](v116, "hasAdjustments"))
          {
            -[NSObject pathForOriginalFile](v116, "pathForOriginalFile");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v141 = objc_msgSend(v135, "fileExistsAtPath:", v140);

            if (v141)
              v134 |= 8uLL;
            goto LABEL_187;
          }
          if (-[NSObject isPhoto](v116, "isPhoto"))
          {
            -[NSObject pathForFullsizeRenderImageFile](v116, "pathForFullsizeRenderImageFile");
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_msgSend(v135, "fileExistsAtPath:", v136);

            if (v137)
              goto LABEL_184;
          }
          if (-[NSObject isVideo](v116, "isVideo"))
          {
            -[NSObject pathForFullsizeRenderVideoFile](v116, "pathForFullsizeRenderVideoFile");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            v139 = objc_msgSend(v135, "fileExistsAtPath:", v138);

            if (!v139)
            {
              if (!-[NSObject isDefaultAdjustedSlomo](v116, "isDefaultAdjustedSlomo")
                || (-[NSObject pathForOriginalFile](v116, "pathForOriginalFile"),
                    v148 = (void *)objc_claimAutoreleasedReturnValue(),
                    v149 = objc_msgSend(v135, "fileExistsAtPath:", v148),
                    v148,
                    !v149))
              {
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v346 = v116;
                    _os_log_impl(&dword_199541000, v150, OS_LOG_TYPE_ERROR, "Video %@ has resource change without full size resource", buf, 0xCu);
                  }

                }
                goto LABEL_187;
              }
            }
LABEL_184:
            v134 |= 8uLL;
          }
LABEL_187:

        }
        if (-[NSObject cloudLocalState](v116, "cloudLocalState"))
          v142 = v134;
        else
          v142 = 0;
        -[NSObject scopedIdentifier](v119, "scopedIdentifier");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:](v116, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v143, v142, v265->_shouldGenerateDerivatives, v257);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v144);
        -[NSObject scopedIdentifier](v116, "scopedIdentifier");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = objc_msgSend(v246, "containsObject:", v145);

        if (v146)
        {
          -[NSObject scopedIdentifier](v116, "scopedIdentifier");
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudPhotoLibraryBatchManager addComputeSyncRelevantAsset:](v266, "addComputeSyncRelevantAsset:", v147);

        }
        v110 = v257;
        v111 = v265;
LABEL_160:

        objc_autoreleasePoolPop(v117);
        ++v115;
      }
      while (v114 != v115);
      v151 = -[NSObject countByEnumeratingWithState:objects:count:](v261, "countByEnumeratingWithState:objects:count:", &v303, v343, 16);
      v114 = v151;
    }
    while (v151);
  }

  v301 = 0u;
  v302 = 0u;
  v299 = 0u;
  v300 = 0u;
  v152 = v228;
  v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v299, v342, 16);
  if (!v153)
    goto LABEL_214;
  v154 = v153;
  v155 = *(_QWORD *)v300;
  do
  {
    for (n = 0; n != v154; ++n)
    {
      if (*(_QWORD *)v300 != v155)
        objc_enumerationMutation(v152);
      v157 = *(void **)(*((_QWORD *)&v299 + 1) + 8 * n);
      objc_msgSend(v157, "assets");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = objc_msgSend(v158, "count");

      if (v159)
      {
        objc_msgSend(v157, "cplPropertyRecord");
        v160 = objc_claimAutoreleasedReturnValue();
        -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v160);
      }
      else
      {
        if (*MEMORY[0x1E0D115D0])
          continue;
        __CPLAssetsdOSLogDomain();
        v160 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v157, "scopedIdentifier");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "identifier");
          v162 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v346 = v162;
          _os_log_impl(&dword_199541000, v160, OS_LOG_TYPE_ERROR, "Could not find any asset for master %{public}@. Ignoring update", buf, 0xCu);

        }
      }

    }
    v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v299, v342, 16);
  }
  while (v154);
LABEL_214:

  v297 = 0u;
  v298 = 0u;
  v295 = 0u;
  v296 = 0u;
  v163 = v229;
  v164 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v295, v341, 16);
  if (v164)
  {
    v165 = v164;
    v166 = *(_QWORD *)v296;
    do
    {
      for (ii = 0; ii != v165; ++ii)
      {
        if (*(_QWORD *)v296 != v166)
          objc_enumerationMutation(v163);
        objc_msgSend(*(id *)(*((_QWORD *)&v295 + 1) + 8 * ii), "asset");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "master");
        v169 = (void *)objc_claimAutoreleasedReturnValue();

        if (v169)
        {
          objc_msgSend(v169, "cplPropertyRecord");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v170);

        }
      }
      v165 = objc_msgSend(v163, "countByEnumeratingWithState:objects:count:", &v295, v341, 16);
    }
    while (v165);
  }

  v293 = 0u;
  v294 = 0u;
  v291 = 0u;
  v292 = 0u;
  v171 = v250;
  v172 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v291, v340, 16);
  if (v172)
  {
    v173 = v172;
    v174 = *(_QWORD *)v292;
    do
    {
      for (jj = 0; jj != v173; ++jj)
      {
        if (*(_QWORD *)v292 != v174)
          objc_enumerationMutation(v171);
        v176 = *(NSObject **)(*((_QWORD *)&v291 + 1) + 8 * jj);
        if (-[NSObject cloudLocalState](v176, "cloudLocalState") != 2)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v177 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v346 = v176;
              _os_log_impl(&dword_199541000, v177, OS_LOG_TYPE_ERROR, "Unable to upload asset %@", buf, 0xCu);
            }

          }
          -[NSObject setCloudLocalState:](v176, "setCloudLocalState:", 2);
        }
      }
      v173 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v291, v340, 16);
    }
    while (v173);
  }

  if (objc_msgSend(v243, "count"))
  {
    v289 = 0u;
    v290 = 0u;
    v287 = 0u;
    v288 = 0u;
    v178 = v243;
    v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v287, v339, 16);
    if (v179)
    {
      v180 = v179;
      v181 = *(_QWORD *)v288;
      do
      {
        for (kk = 0; kk != v180; ++kk)
        {
          if (*(_QWORD *)v288 != v181)
            objc_enumerationMutation(v178);
          v183 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * kk);
          v184 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v183, "cplMemoryChange");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          if (v185)
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v185);

          objc_autoreleasePoolPop(v184);
        }
        v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v287, v339, 16);
      }
      while (v180);
    }

  }
  if (objc_msgSend(v242, "count"))
  {
    v285 = 0u;
    v286 = 0u;
    v283 = 0u;
    v284 = 0u;
    v186 = v242;
    v187 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v283, v338, 16);
    if (v187)
    {
      v188 = v187;
      v189 = *(_QWORD *)v284;
      do
      {
        for (mm = 0; mm != v188; ++mm)
        {
          if (*(_QWORD *)v284 != v189)
            objc_enumerationMutation(v186);
          v191 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * mm);
          v192 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v191, "cplSuggestionChange");
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          if (v193)
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v193);

          objc_autoreleasePoolPop(v192);
        }
        v188 = objc_msgSend(v186, "countByEnumeratingWithState:objects:count:", &v283, v338, 16);
      }
      while (v188);
    }

  }
  if (objc_msgSend(v241, "count"))
  {
    v281 = 0u;
    v282 = 0u;
    v279 = 0u;
    v280 = 0u;
    v194 = v241;
    v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v279, v337, 16);
    if (v195)
    {
      v196 = v195;
      v197 = *(_QWORD *)v280;
      do
      {
        for (nn = 0; nn != v196; ++nn)
        {
          if (*(_QWORD *)v280 != v197)
            objc_enumerationMutation(v194);
          v199 = *(void **)(*((_QWORD *)&v279 + 1) + 8 * nn);
          v200 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v199, "cplSuggestionChange");
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          if (v201)
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v201);

          objc_autoreleasePoolPop(v200);
        }
        v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v279, v337, 16);
      }
      while (v196);
    }

  }
  if (objc_msgSend(v240, "count"))
  {
    v277 = 0u;
    v278 = 0u;
    v275 = 0u;
    v276 = 0u;
    v202 = v240;
    v203 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v275, v336, 16);
    if (v203)
    {
      v204 = v203;
      v205 = *(_QWORD *)v276;
      do
      {
        for (i1 = 0; i1 != v204; ++i1)
        {
          if (*(_QWORD *)v276 != v205)
            objc_enumerationMutation(v202);
          v207 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * i1);
          v208 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v207, "cplScopeChange");
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          if (v209)
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v209);

          objc_autoreleasePoolPop(v208);
        }
        v204 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v275, v336, 16);
      }
      while (v204);
    }

  }
  if (objc_msgSend(v239, "count"))
  {
    v273 = 0u;
    v274 = 0u;
    v271 = 0u;
    v272 = 0u;
    v210 = v239;
    v211 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v271, v335, 16);
    if (v211)
    {
      v212 = v211;
      v213 = *(_QWORD *)v272;
      do
      {
        for (i2 = 0; i2 != v212; ++i2)
        {
          if (*(_QWORD *)v272 != v213)
            objc_enumerationMutation(v210);
          v215 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * i2);
          v216 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v215, "cplSocialGroupChange");
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          if (v217)
            -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", v217);

          objc_autoreleasePoolPop(v216);
        }
        v212 = objc_msgSend(v210, "countByEnumeratingWithState:objects:count:", &v271, v335, 16);
      }
      while (v212);
    }

  }
  v269 = 0u;
  v270 = 0u;
  v267 = 0u;
  v268 = 0u;
  v218 = v238;
  v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v267, v334, 16);
  if (v219)
  {
    v220 = v219;
    isKindOfClass = 0;
    v222 = *(_QWORD *)v268;
    do
    {
      for (i3 = 0; i3 != v220; ++i3)
      {
        if (*(_QWORD *)v268 != v222)
          objc_enumerationMutation(v218);
        -[PLCloudPhotoLibraryBatchManager addRecord:](v266, "addRecord:", *(_QWORD *)(*((_QWORD *)&v267 + 1) + 8 * i3));
        if ((isKindOfClass & 1) != 0)
        {
          isKindOfClass = 1;
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }
      }
      v220 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v267, v334, 16);
    }
    while (v220);
  }
  else
  {
    isKindOfClass = 0;
  }

  if (objc_msgSend(obj, "count") || (isKindOfClass & 1) != 0 || objc_msgSend(v230, "count"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
  }
  if (objc_msgSend(v171, "count"))
  {
    v225 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v225, CFSTR("com.apple.mobileslideshow.cpl.failedtopush"), 0, 0, 0);
  }
  -[PLCloudPhotoLibraryBatchManager drainBatches](v266, "drainBatches");
  v226 = (void *)objc_claimAutoreleasedReturnValue();

  return v226;
}

- (BOOL)_hasUnuploadedResourceForAsset:(id)a3 resourceType:(unint64_t)a4 cloudMaster:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "masterResourceForCPLType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && !objc_msgSend(v8, "cloudLocalState"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "assets", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "masterResourceForCPLType:", a4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16 && objc_msgSend(v16, "cloudLocalState") == 3)
          {

            v10 = 0;
            goto LABEL_15;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_15:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_incrementUploadAttemptsAndPushStateForAssets:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PLCloudBatchUploader__incrementUploadAttemptsAndPushStateForAssets___block_invoke;
  v7[3] = &unk_1E3677AA0;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v6, "performTransactionAndWait:", v7);

}

- (void)_sendOneBatch:(id)a3 toBatchManager:(id)a4 inLibrary:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v15 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke;
  v16[3] = &unk_1E365FBB0;
  v13 = v12;
  v17 = v13;
  v14 = v11;
  v18 = v14;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);

  if (objc_msgSend(v14, "count"))
    -[PLCloudBatchUploader _sendAlbums:toBatchManager:inLibrary:](self, "_sendAlbums:toBatchManager:inLibrary:", v14, v15, v8);
  if (objc_msgSend(v13, "count"))
    -[PLCloudBatchUploader _sendAssets:toBatchManager:inLibrary:](self, "_sendAssets:toBatchManager:inLibrary:", v13, v15, v8);

}

- (void)_sendAlbums:(id)a3 toBatchManager:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  id v9;
  _BYTE *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "album to upload = %@", buf, 0xCu);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v22;
    *(_QWORD *)&v14 = 138412290;
    v20 = v14;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "cplAlbumChangeInPhotoLibrary:", v9, v20, (_QWORD)v21);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRecord:", v18);
        if (!*v10)
        {
          __CPLAssetsdOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v27 = v18;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Adding album %@ to initial batch", buf, 0xCu);
          }

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

}

- (void)_sendAssets:(id)a3 toBatchManager:(id)a4 inLibrary:(id)a5
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  const __CFString *v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  int v36;
  const __CFString *v37;
  __CFString *v38;
  const __CFString *v39;
  void (**v40)(_QWORD, _QWORD);
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  __CFString *v52;
  NSObject *v53;
  NSObject *v54;
  __CFString *v55;
  uint64_t v56;
  BOOL v57;
  __CFString *v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  __int128 v75;
  void *v76;
  void *v77;
  NSObject *v78;
  NSObject *v79;
  id v80;
  id v81;
  NSObject *obj;
  uint64_t v83;
  uint64_t v84;
  id v85;
  id v86;
  void *context;
  void *contexta;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  uint64_t v94;
  NSObject *v95;
  PLCloudBatchUploader *v96;
  id v97;
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
  _QWORD v110[4];
  NSObject *v111;
  PLCloudBatchUploader *v112;
  id v113;
  __CFString *v114;
  char v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  NSObject *v124;
  __int16 v125;
  const __CFString *v126;
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v96 = self;
  v97 = a5;
  -[PLCloudBatchUploader _incrementUploadAttemptsAndPushStateForAssets:](self, "_incrementUploadAttemptsAndPushStateForAssets:", v8);
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v8;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "sending assets %@ to batch manager", buf, 0xCu);
    }

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v86 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSObject count](v8, "count"));
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  obj = v8;
  v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
  if (!v12)
  {
    v15 = 0;
    goto LABEL_92;
  }
  v14 = (id)v12;
  v15 = 0;
  v16 = CFSTR("incomplete");
  v17 = *(_QWORD *)v117;
  *(_QWORD *)&v13 = 138543362;
  v75 = v13;
  v76 = v11;
  v83 = *(_QWORD *)v117;
  while (2)
  {
    v18 = 0;
    v80 = v14;
    do
    {
      if (*(_QWORD *)v117 != v17)
        objc_enumerationMutation(obj);
      v90 = v18;
      v19 = *(__CFString **)(*((_QWORD *)&v116 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x19AEC1554]();
      v95 = v19;
      if ((-[__CFString isDeleted](v19, "isDeleted") & 1) == 0 && (-[__CFString complete](v19, "complete") & 1) != 0)
      {
        context = v20;
        v115 = 0;
        -[__CFString existingCloudMasterNeedsRepush:](v19, "existingCloudMasterNeedsRepush:", &v115);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v115)
        {
          -[NSObject cplPropertyRecord](v21, "cplPropertyRecord");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addRecord:", v23);

        }
        -[NSObject scopedIdentifier](v22, "scopedIdentifier", v75);
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[NSObject scopedIdentifier](v15, "scopedIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v25, "isEqual:", v24)
            && !-[NSObject cloudLocalState](v22, "cloudLocalState"))
          {
            v55 = v24;
            v56 = objc_msgSend(v9, "currentBatchCount");

            v57 = v56 < 200;
            v24 = v55;
            v19 = (__CFString *)v95;
            if (v57)
              goto LABEL_20;
          }
          else
          {

            v19 = (__CFString *)v95;
          }
        }
        if ((objc_msgSend(v9, "isAboveMaximumResourceBudget") & 1) != 0 || objc_msgSend(v9, "currentBatchCount") > 49)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_DEBUG, "Hit current upload batch limit, retry in the next loop.", buf, 2u);
            }

          }
          objc_autoreleasePoolPop(context);
          goto LABEL_92;
        }
LABEL_20:
        if (!v22
          || !-[NSObject cloudLocalState](v22, "cloudLocalState")
          && (objc_msgSend(v11, "containsObject:", v24) & 1) == 0)
        {
          -[__CFString cplMasterChangeInLibrary:shouldGenerateDerivatives:](v19, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", v97, v96->_shouldGenerateDerivatives);
          v26 = objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                -[NSObject uuid](v95, "uuid");
                v52 = v24;
                v53 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v75;
                v124 = v53;
                _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_ERROR, "Failed to create master for asset %{public}@. Skipping upload.", buf, 0xCu);

                v24 = v52;
              }

            }
            v34 = 0;
LABEL_67:

            v93 = v24;
LABEL_68:
            v17 = v83;
            v20 = context;
            if (*MEMORY[0x1E0D115D0])
            {
LABEL_78:
              v58 = (__CFString *)v93;
LABEL_79:

              goto LABEL_80;
            }
            __CPLAssetsdOSLogDomain();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v124 = v95;
              _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, "Failed to add asset %@ to batch, will retry in the next round", buf, 0xCu);
            }
LABEL_77:

            goto LABEL_78;
          }
          v27 = v19;
          v28 = (void *)v26;
          v29 = v16;
          v30 = v11;
          v31 = v15;
          -[__CFString master](v27, "master");
          v32 = objc_claimAutoreleasedReturnValue();

          -[NSObject scopedIdentifier](v32, "scopedIdentifier");
          v33 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v86, "setObject:forKey:", v28, v33);
          if (!v32)
          {
            v93 = (const __CFString *)v33;
            v34 = 0;
            v15 = v31;
            v11 = v30;
            v16 = v29;
            v14 = v80;
            goto LABEL_68;
          }
          v22 = v32;
          v24 = (__CFString *)v33;
          v15 = v31;
          v19 = (__CFString *)v95;
          v11 = v30;
          v16 = v29;
          v14 = v80;
        }
        v34 = v22;

        if (-[NSObject cloudLocalState](v34, "cloudLocalState") == 2)
        {
          if (*MEMORY[0x1E0D115D0])
          {
            v15 = v34;
            v58 = v24;
            v17 = v83;
            v20 = context;
            goto LABEL_79;
          }
          __CPLAssetsdOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v124 = v34;
            v125 = 2112;
            v126 = v19;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "CloudMaster %@ failed to be uploaded, skip uploading asset %@.", buf, 0x16u);
          }
        }
        else
        {
          v38 = v24;
          v17 = v83;
          v20 = context;
          if (v38)
          {
            v78 = v34;
            v110[0] = MEMORY[0x1E0C809B0];
            v110[1] = 3221225472;
            v110[2] = __61__PLCloudBatchUploader__sendAssets_toBatchManager_inLibrary___block_invoke;
            v110[3] = &unk_1E365FBD8;
            v111 = v97;
            v112 = v96;
            v113 = v86;
            v39 = v38;
            v114 = (__CFString *)v39;
            v40 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v110);
            objc_msgSend(v85, "objectForKey:", v39);
            v41 = (id)objc_claimAutoreleasedReturnValue();
            if (!v41)
            {
              v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v85, "setObject:forKey:", v41, v39);
            }
            objc_msgSend(v41, "addObject:", v95);
            -[NSObject cloudAssetGUID](v95, "cloudAssetGUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "length"))
              objc_msgSend(v89, "addObject:", v42);
            v77 = v42;
            v34 = v78;
            v93 = v39;
            if (objc_msgSend(v11, "indexOfObject:", v39) == 0x7FFFFFFFFFFFFFFFLL)
            {
              v108 = 0u;
              v109 = 0u;
              v106 = 0u;
              v107 = 0u;
              -[NSObject assets](v78, "assets");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v107;
                do
                {
                  for (i = 0; i != v45; ++i)
                  {
                    if (*(_QWORD *)v107 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
                    objc_msgSend(v48, "cloudAssetGUID");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v89, "containsObject:", v49) & 1) == 0
                      && -[NSObject indexOfObject:](obj, "indexOfObject:", v48) == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if (!*MEMORY[0x1E0D115D0])
                      {
                        __CPLAssetsdOSLogDomain();
                        v50 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v124 = v95;
                          v125 = 2112;
                          v126 = v93;
                          _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_DEFAULT, "Found duplicate asset %@ for masterScopedIdentifier %@, adding to unsortedAsset", buf, 0x16u);
                        }

                      }
                      objc_msgSend(v41, "addObject:", v48);
                      ((void (**)(_QWORD, void *))v40)[2](v40, v48);
                    }

                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v106, v122, 16);
                }
                while (v45);
              }

              v11 = v76;
              objc_msgSend(v76, "addObject:", v93);
              v16 = CFSTR("incomplete");
              v17 = v83;
              v20 = context;
              v34 = v78;
            }
            else
            {
              ((void (**)(_QWORD, NSObject *))v40)[2](v40, v95);
            }

            v54 = v111;
            v15 = v34;
            v14 = v80;
            goto LABEL_77;
          }
          if (*MEMORY[0x1E0D115D0])
          {
            v58 = 0;
            v15 = v34;
            goto LABEL_79;
          }
          __CPLAssetsdOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v124 = v19;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "No valid masterScopedIdentifier for asset %@. Skipping upload", buf, 0xCu);
          }
          v24 = 0;
        }
        v15 = v34;
        goto LABEL_67;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = -[NSObject isDeleted](v95, "isDeleted");
          *(_DWORD *)buf = 138412546;
          v37 = CFSTR("deleted");
          if (!v36)
            v37 = v16;
          v124 = v95;
          v125 = 2112;
          v126 = v37;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Ignoring asset %@, since it's %@", buf, 0x16u);
        }

      }
LABEL_80:
      objc_autoreleasePoolPop(v20);
      v18 = v90 + 1;
    }
    while ((id)(v90 + 1) != v14);
    v59 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v116, v127, 16);
    v14 = (id)v59;
    if (v59)
      continue;
    break;
  }
LABEL_92:
  v79 = v15;

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v81 = v11;
  contexta = (void *)objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
  if (contexta)
  {
    v84 = *(_QWORD *)v103;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v103 != v84)
          objc_enumerationMutation(v81);
        v62 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * v61);
        objc_msgSend(v86, "objectForKey:", v62, v75);
        v63 = objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          objc_msgSend(v9, "addRecord:", v63);
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v64 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v124 = v63;
              _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_DEBUG, "Adding master %@ to initial batch", buf, 0xCu);
            }

          }
        }
        v92 = (void *)v63;
        v94 = v61;
        objc_msgSend(v85, "objectForKey:", v62);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "sortedArrayUsingComparator:", &__block_literal_global_550);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        v101 = 0u;
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v99;
          do
          {
            for (j = 0; j != v67; ++j)
            {
              if (*(_QWORD *)v99 != v68)
                objc_enumerationMutation(v65);
              v70 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
              objc_msgSend(v70, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v62, 0, v96->_shouldGenerateDerivatives, v97);
              v71 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addRecord:ignoreBatchSize:", v71, 1);
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v124 = v71;
                  _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_DEBUG, "Adding asset %@ to initial batch", buf, 0xCu);
                }

              }
              objc_msgSend(v70, "computeSyncAttributes");
              v73 = (void *)objc_claimAutoreleasedReturnValue();

              if (v73)
              {
                objc_msgSend(v70, "scopedIdentifier");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "addComputeSyncRelevantAsset:", v74);

              }
            }
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v98, v120, 16);
          }
          while (v67);
        }

        v61 = v94 + 1;
      }
      while ((void *)(v94 + 1) != contexta);
      contexta = (void *)objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v102, v121, 16);
    }
    while (contexta);
  }

}

- (void)_processPendingObjects:(id)a3 withBatchManager:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v18, "count");
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v14 = 0;
    do
    {
      objc_msgSend(v18, "objectAtIndex:", v14, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);

      if ((unint64_t)objc_msgSend(v11, "count") >= 0x32)
      {
        v24[0] = v13;
        v24[1] = 3221225472;
        v24[2] = __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke;
        v24[3] = &unk_1E3677998;
        v24[4] = self;
        v16 = v11;
        v25 = v16;
        v26 = v8;
        v27 = v9;
        objc_msgSend(v27, "performTransactionAndWait:", v24);
        objc_msgSend(v16, "removeAllObjects");

      }
      ++v14;
    }
    while (objc_msgSend(v18, "count") > v14);
  }
  if (objc_msgSend(v11, "count", v18))
  {
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke_2;
    v20[3] = &unk_1E3677998;
    v20[4] = self;
    v17 = v11;
    v21 = v17;
    v22 = v8;
    v23 = v9;
    objc_msgSend(v23, "performTransactionAndWait:", v20);
    objc_msgSend(v17, "removeAllObjects");

  }
  objc_autoreleasePoolPop(v10);

}

- (id)_personsToUploadIncludingReverseOrderedMergeTargetsForPersons:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v5)
  {
    v6 = v5;
    v21 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x19AEC1554]();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v8, "reverseOrderedMergeTargetPersons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (!objc_msgSend(v15, "cloudLocalState"))
                objc_msgSend(v4, "addObject:", v15);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          }
          while (v12);
        }

        objc_msgSend(v4, "addObject:", v8);
        objc_autoreleasePoolPop(v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v6);
  }

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(obj, "valueForKey:", CFSTR("personUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "valueForKey:", CFSTR("personUUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "All unpushed merge targets for %@: %@", buf, 0x16u);

    }
  }

  return v4;
}

- (void)uploadDeletedRecordsFromPlist:(id)a3
{
  id v5;
  PLCloudPhotoLibraryBatchManager *v6;
  BOOL v7;
  NSObject *v8;
  NSMutableDictionary *recordsToDelete;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  uint64_t i;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  NSMutableArray *uploadBatchArray;
  void *v25;
  void *v26;
  NSMutableDictionary *obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  NSMutableDictionary *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  if (-[NSMutableDictionary count](self->_recordsToDelete, "count"))
    v7 = *MEMORY[0x1E0D115D0] == 0;
  else
    v7 = 0;
  if (v7)
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      recordsToDelete = self->_recordsToDelete;
      *(_DWORD *)buf = 138412290;
      v42 = recordsToDelete;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "recordsToDelete is not empty %@, overwriting it from file", buf, 0xCu);
    }

  }
  objc_storeStrong((id *)&self->_recordsToDeletePlistPath, a3);
  v26 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v5);
  v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  v11 = self->_recordsToDelete;
  self->_recordsToDelete = v10;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = self->_recordsToDelete;
  v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v29)
  {
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("RKVersion")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("RKAlbum")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("RKFolder")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("RKMaster")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("RKMemory")) & 1) != 0
          || (objc_msgSend(v13, "isEqualToString:", CFSTR("RKPerson")) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("RKFaceCrop")))
        {
          v30 = i;
          v14 = (objc_class *)objc_opt_class();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_recordsToDelete, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v32;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v32 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
                v21 = objc_alloc_init(v14);
                objc_msgSend(v21, "setChangeType:", 1024);
                -[PLLibraryServicesManager mainScopeIdentifier](self->_libraryServicesManager, "mainScopeIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v22, v20);
                objc_msgSend(v21, "setScopedIdentifier:", v23);
                -[PLCloudPhotoLibraryBatchManager addRecord:](v6, "addRecord:", v21);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v17);
          }

          i = v30;
        }
      }
      v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v29);
  }

  uploadBatchArray = self->_uploadBatchArray;
  -[PLCloudPhotoLibraryBatchManager drainBatches](v6, "drainBatches");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](uploadBatchArray, "addObjectsFromArray:", v25);

}

- (void)uploadFullPhotoLibraryToCloud:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLCloudPhotoLibraryBatchManager *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  NSObject *v29;
  NSMutableArray *uploadBatchArray;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  PLCloudBatchUploader *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  PLCloudPhotoLibraryBatchManager *v46;
  _QWORD v47[4];
  id v48;
  PLCloudPhotoLibraryBatchManager *v49;
  _QWORD v50[4];
  id v51;
  PLCloudPhotoLibraryBatchManager *v52;
  _QWORD v53[4];
  id v54;
  PLCloudPhotoLibraryBatchManager *v55;
  _QWORD v56[4];
  id v57;
  PLCloudBatchUploader *v58;
  PLCloudPhotoLibraryBatchManager *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  _QWORD v67[4];
  id v68;
  PLCloudPhotoLibraryBatchManager *v69;
  _QWORD v70[4];
  id v71;
  PLCloudBatchUploader *v72;
  PLCloudPhotoLibraryBatchManager *v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  v7 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  if (objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke;
    v70[3] = &unk_1E3677530;
    v71 = v4;
    v72 = self;
    v73 = v7;
    objc_msgSend(v71, "performBlockAndWait:", v70);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount")
    && objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2;
    v67[3] = &unk_1E3677C18;
    v68 = v4;
    v69 = v7;
    objc_msgSend(v68, "performBlockAndWait:", v67);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_136;
    v63[3] = &unk_1E3677530;
    v64 = v5;
    v65 = v4;
    v66 = v6;
    objc_msgSend(v65, "performBlockAndWait:", v63);

  }
  v8 = objc_msgSend(v5, "count");
  v9 = v5;
  if (v8
    || !-[PLCloudPhotoLibraryBatchManager isAboveMaximumResourceBudget](v7, "isAboveMaximumResourceBudget", v5)
    && -[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount") <= 49
    && (v10 = objc_msgSend(v6, "count"), v9 = v6, v10))
  {
    -[PLCloudBatchUploader _processPendingObjects:withBatchManager:inLibrary:](self, "_processPendingObjects:withBatchManager:inLibrary:", v9, v7, v4);
  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount", v9))
  {
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_137;
    v60[3] = &unk_1E3677C18;
    v11 = v4;
    v61 = v11;
    v12 = v6;
    v62 = v12;
    objc_msgSend(v11, "performTransactionAndWait:", v60);
    if (objc_msgSend(v12, "count"))
      -[PLCloudBatchUploader _processPendingObjects:withBatchManager:inLibrary:](self, "_processPendingObjects:withBatchManager:inLibrary:", v12, v7, v11);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount")
    && objc_msgSend(MEMORY[0x1E0D11348], "serverSupportsVision"))
  {
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_138;
    v56[3] = &unk_1E3677530;
    v57 = v4;
    v58 = self;
    v59 = v7;
    objc_msgSend(v57, "performBlockAndWait:", v56);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_139;
    v53[3] = &unk_1E3677C18;
    v54 = v4;
    v55 = v7;
    objc_msgSend(v54, "performBlockAndWait:", v53);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_142;
    v50[3] = &unk_1E3677C18;
    v51 = v4;
    v52 = v7;
    objc_msgSend(v51, "performBlockAndWait:", v50);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_145;
    v47[3] = &unk_1E3677C18;
    v48 = v4;
    v49 = v7;
    objc_msgSend(v48, "performBlockAndWait:", v47);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_148;
    v44[3] = &unk_1E3677C18;
    v45 = v4;
    v46 = v7;
    objc_msgSend(v45, "performBlockAndWait:", v44);

  }
  if (!-[PLCloudPhotoLibraryBatchManager currentBatchCount](v7, "currentBatchCount"))
  {
    objc_msgSend(v4, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deletedMemoryUUIDsFilePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "mainScopeIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v14 && objc_msgSend(v16, "fileExistsAtPath:", v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v14);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v75 = v38;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Syncing %@ memories deleted during migration", buf, 0xCu);
          }

        }
        v32 = v17;
        v33 = v14;
        v34 = v6;
        v35 = self;
        v36 = v5;
        v37 = v4;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v19 = v38;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v41 != v22)
                objc_enumerationMutation(v19);
              v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v15, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
              v25 = (void *)objc_msgSend(MEMORY[0x1E0D113D0], "newDeleteChangeWithScopedIdentifier:", v24);
              -[PLCloudPhotoLibraryBatchManager addRecord:](v7, "addRecord:", v25);

            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v78, 16);
          }
          while (v21);
        }

        v5 = v36;
        v6 = v34;
        self = v35;
        v17 = v32;
      }
      v39 = 0;
      v26 = objc_msgSend(v17, "removeItemAtPath:error:", v14, &v39, v32, v33, v34, v35, v36, v37);
      v27 = v39;
      if ((v26 & 1) == 0 && !*MEMORY[0x1E0D115D0])
      {
        v28 = v17;
        __CPLAssetsdOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v75 = v14;
          v76 = 2112;
          v77 = v27;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Failed to delete %@: %@", buf, 0x16u);
        }

        v17 = v28;
      }

    }
  }
  uploadBatchArray = self->_uploadBatchArray;
  -[PLCloudPhotoLibraryBatchManager drainBatches](v7, "drainBatches");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](uploadBatchArray, "addObjectsFromArray:", v31);

}

- (void)_cleanUploadedResources:(id)a3 inLibrary:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  char v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v29;
  __int128 v30;
  id v31;
  id v32;
  id v33;
  id obj;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  int v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31 = a4;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v5, "resources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v47;
    *(_QWORD *)&v7 = 138412546;
    v30 = v7;
    v33 = v5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v11, "identity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "fileURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", objc_msgSend(v11, "resourceType"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v11, "deleteAfterUpload");
            *(_DWORD *)buf = 138412802;
            v51 = v15;
            v52 = 2112;
            v53 = v16;
            v54 = 1024;
            v55 = v17;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Checking: %@, type: %@ will delete after upload: %d", buf, 0x1Cu);

            v5 = v33;
          }

        }
        if (objc_msgSend(v11, "deleteAfterUpload", v30) && objc_msgSend(v11, "resourceType") != 1)
        {
          objc_msgSend(v11, "identity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "fileURL");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "fileExistsAtPath:", v20))
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v20;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "removing %@ that was uploaded.", buf, 0xCu);
              }

            }
            v45 = 0;
            v23 = objc_msgSend(v21, "removeItemAtPath:error:", v20, &v45);
            v24 = v45;
            v32 = v24;
            if ((v23 & 1) != 0)
            {
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = v30;
                  v51 = v11;
                  v52 = 2112;
                  v53 = v20;
                  _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "removed uploaded resource for %@ at %@", buf, 0x16u);
                }

              }
              objc_msgSend(v11, "itemScopedIdentifier");
              v26 = objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke;
                v41[3] = &unk_1E3677530;
                v42 = v26;
                v43 = v31;
                v44 = v11;
                objc_msgSend(v43, "performTransactionAndWait:", v41);

                v27 = v42;
                goto LABEL_32;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke_152;
                v35[3] = &unk_1E3670C40;
                v36 = v26;
                v28 = v31;
                v37 = v28;
                v38 = v11;
                v39 = v20;
                v40 = v21;
                v29 = v28;
                v5 = v33;
                objc_msgSend(v29, "performTransactionAndWait:", v35);

                v27 = v36;
                goto LABEL_32;
              }
              if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v51 = v5;
                  _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "invalid item change to remove uploaded resources for %@", buf, 0xCu);
                }
LABEL_32:

              }
LABEL_33:

              v24 = v32;
            }
            else if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v51 = v20;
                _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "failed to remove derivative file %@", buf, 0xCu);
              }
              goto LABEL_33;
            }

          }
          continue;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v8);
  }

}

- (id)_getLocalRecordFromCPLRecord:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v7, 0, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v8, v6);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLFaceCrop faceCropsWithUUIDs:inPhotoLibrary:](PLFaceCrop, "faceCropsWithUUIDs:inPhotoLibrary:", v10, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v8, v6);
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!+[PLUserFeedback shouldHandleCPLSuggestionChange:](PLUserFeedback, "shouldHandleCPLSuggestionChange:", v5))
        {
          +[PLSuggestion suggestionWithUUID:inPhotoLibrary:](PLSuggestion, "suggestionWithUUID:inPhotoLibrary:", v8, v6);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        objc_msgSend(v6, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLUserFeedback userFeedbackWithUUID:inManagedObjectContext:](PLUserFeedback, "userFeedbackWithUUID:inManagedObjectContext:", v8, v10);
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "managedObjectContext");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v8, v10);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "managedObjectContext");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v8, v15);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v10)
            {
              v12 = 0;
              goto LABEL_25;
            }
            v13 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLGraphNodeContainer, "newNodeContainerWithNode:", v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v12 = 0;
              goto LABEL_18;
            }
            objc_msgSend(v6, "managedObjectContext");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLShare shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithScopeIdentifier:includeTrashed:inManagedObjectContext:", v8, 1, v10);
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
      v12 = v13;
    }
LABEL_25:

    goto LABEL_18;
  }
  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v7, v6, 0);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v12 = (void *)v9;
LABEL_18:

  return v12;
}

- (void)_processChangeToFullRecordCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLCloudBatchUploader *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need change the upload type to a full record.", buf, 0x20u);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__PLCloudBatchUploader__processChangeToFullRecordCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E3677998;
  v19 = v11;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "performTransactionAndWait:", v18);

}

- (void)_processIncludeMasterCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _BYTE *v14;
  NSObject *v15;
  PLCloudPhotoLibraryBatchManager *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  PLCloudPhotoLibraryBatchManager *v21;
  id v22;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  NSMutableArray *uploadBatchArray;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  PLCloudBatchUploader *v39;
  PLCloudPhotoLibraryBatchManager *v40;
  id v41;
  _BYTE *v42;
  uint8_t v43[128];
  uint8_t v44[4];
  id v45;
  _BYTE buf[24];
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      v47 = v10;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to include the missing master.", buf, 0x20u);
    }

  }
  v16 = objc_alloc_init(PLCloudPhotoLibraryBatchManager);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v47) = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __92__PLCloudBatchUploader__processIncludeMasterCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v35[3] = &unk_1E3675B18;
  v18 = v11;
  v36 = v18;
  v19 = v12;
  v37 = v19;
  v20 = v13;
  v38 = v20;
  v39 = self;
  v42 = buf;
  v21 = v16;
  v40 = v21;
  v22 = v17;
  v41 = v22;
  objc_msgSend(v20, "performTransactionAndWait:", v35);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.quarantined"), 0, 0, 0);
  }
  if (objc_msgSend(v22, "count") && !*v14)
  {
    __CPLAssetsdOSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 138412290;
      v45 = v22;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Can't find some records to include master for: %@", v44, 0xCu);
    }

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v25 = v19;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v25);
        objc_msgSend(v18, "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i), (_QWORD)v31);
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v26);
  }

  uploadBatchArray = self->_uploadBatchArray;
  -[PLCloudPhotoLibraryBatchManager drainBatches](v21, "drainBatches");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](uploadBatchArray, "addObjectsFromArray:", v30);

  _Block_object_dispose(buf, 8);
}

- (void)quarantineRecord:(id)a3 uploadTracker:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PLCloudBatchUploader_quarantineRecord_uploadTracker_inLibrary___block_invoke;
  v14[3] = &unk_1E3677998;
  v14[4] = self;
  v15 = v8;
  v16 = v10;
  v17 = v9;
  v11 = v9;
  v12 = v10;
  v13 = v8;
  objc_msgSend(v12, "performTransaction:", v14);

}

- (void)_quarantineObject:(id)a3 uploadTracker:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "setCloudLocalState:", 4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v8;
    v7 = v6;
    if (v6 && objc_msgSend(v6, "isPlaceholderAsset"))
      objc_msgSend(v7, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "stopTrackingMaster:", v8);
  }

}

- (void)_processQuarantineRecordsCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 inLibrary:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v32 = a6;
  v31 = a7;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v44 = v13;
      v45 = 2112;
      v46 = v14;
      v47 = 2112;
      v48 = v12;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to quarantine records", buf, 0x20u);
    }

  }
  v30 = v12;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v13, "records");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v22, "scopedIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "containsObject:", v23))
        {
          -[PLCloudBatchUploader quarantineRecord:uploadTracker:inLibrary:](self, "quarantineRecord:uploadTracker:inLibrary:", v22, v32, v31);
          v19 = 1;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(v13, "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v26);
  }

  if ((v19 & 1) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.quarantined"), 0, 0, 0);
  }

}

- (void)_processInvalidScopeCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLCloudBatchUploader *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to push the scope.", buf, 0x20u);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__PLCloudBatchUploader__processInvalidScopeCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E3677998;
  v19 = v11;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "performTransactionAndWait:", v18);

}

- (void)_processInvalidResourceCopySourceCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLCloudBatchUploader *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Received error while uploading batch: %@ forRecords: %@ : Error: %@. We need to check if the source resources exists.", buf, 0x20u);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __104__PLCloudBatchUploader__processInvalidResourceCopySourceCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E3677998;
  v19 = v11;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "performTransactionAndWait:", v18);

}

- (void)_processInvalidExpungeableResourceTypesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLCloudBatchUploader *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Received error while uploading batch: %@ forRecords: %@ : Error: %@. We need to repush the full master record.", buf, 0x20u);
    }

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __110__PLCloudBatchUploader__processInvalidExpungeableResourceTypesCommitError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v18[3] = &unk_1E3677998;
  v19 = v11;
  v20 = v12;
  v21 = self;
  v22 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  objc_msgSend(v15, "performTransactionAndWait:", v18);

}

- (void)_addLocalResourcesToRecord:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PLCloudBatchUploader *v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke;
  v13[3] = &unk_1E3677530;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke_157;
  v11[3] = &unk_1E3677AA0;
  v12 = v14;
  v9 = v14;
  v10 = v7;
  objc_msgSend(v10, "performTransactionAndWait:completionHandler:", v13, v11);

}

- (void)tryToFixCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 uploadTracker:(id)a6 inLibrary:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;

  v40 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "objectForKey:", CFSTR("regenerateDerivativeError"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("regenerateDerivativeError"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processGenerateDerivativesCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processGenerateDerivativesCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v18, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("needMasterError"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("needMasterError"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processIncludeMasterCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processIncludeMasterCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v21, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("needFullChangeError"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("needFullChangeError"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processChangeToFullRecordCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processChangeToFullRecordCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v24, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("repushAlbumError"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("repushAlbumError"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processRepushAlbumError:inUploadBatch:forRecords:inLibrary:](self, "_processRepushAlbumError:inUploadBatch:forRecords:inLibrary:", v40, v12, v27, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("quarantinedRecordError"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("quarantinedRecordError"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processQuarantineRecordsCommitError:inUploadBatch:forRecords:uploadTracker:inLibrary:](self, "_processQuarantineRecordsCommitError:inUploadBatch:forRecords:uploadTracker:inLibrary:", v40, v12, v30, v14, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("invalidScopeError"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("invalidScopeError"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processInvalidScopeCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processInvalidScopeCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v33, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("invalidResourceCopySourceError"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("invalidResourceCopySourceError"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processInvalidResourceCopySourceCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processInvalidResourceCopySourceCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v36, v15);

  }
  objc_msgSend(v13, "objectForKey:", CFSTR("invalidExpungeableResourceTypes"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("invalidExpungeableResourceTypes"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudBatchUploader _processInvalidExpungeableResourceTypesCommitError:inUploadBatch:forRecords:inLibrary:](self, "_processInvalidExpungeableResourceTypesCommitError:inUploadBatch:forRecords:inLibrary:", v40, v12, v39, v15);

  }
}

- (void)_processGenerateDerivativesCommitError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to re-generate derivatives", buf, 0x20u);
    }

  }
  v25 = v10;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v11, "records", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v20, "scopedIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v12, "containsObject:", v21);

        if (v22)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v20;
              _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Re-generating derivatives for record %@", buf, 0xCu);
            }

          }
          -[PLCloudBatchUploader _addLocalResourcesToRecord:inLibrary:](self, "_addLocalResourcesToRecord:inLibrary:", v20, v13);
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

}

- (BOOL)_processRepushAlbumError:(id)a3 inUploadBatch:(id)a4 forRecords:(id)a5 inLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  PLCloudBatchUploader *v24;
  id v25;
  uint64_t *v26;
  SEL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v33 = v12;
      v34 = 2112;
      v35 = v13;
      v36 = 2112;
      v37 = v11;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@ forRecords: %@ : Error: %@. We need to repush these albums", buf, 0x20u);
    }

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __84__PLCloudBatchUploader__processRepushAlbumError_inUploadBatch_forRecords_inLibrary___block_invoke;
  v21[3] = &unk_1E36741F8;
  v16 = v13;
  v22 = v16;
  v17 = v14;
  v23 = v17;
  v24 = self;
  v26 = &v28;
  v27 = a2;
  v18 = v12;
  v25 = v18;
  objc_msgSend(v17, "performBlockAndWait:", v21);
  v19 = *((_BYTE *)v29 + 24) != 0;

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (BOOL)_updateDeletionRecordListForKey:(id)a3 removingRecordID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_recordsToDelete, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") && objc_msgSend(v8, "containsObject:", v7))
  {
    objc_msgSend(v8, "removeObject:", v7);
    if (!objc_msgSend(v8, "count"))
      -[NSMutableDictionary removeObjectForKey:](self->_recordsToDelete, "removeObjectForKey:", v6);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_clearSuccessfullyPushedDeletedRecords:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  _BYTE *v13;
  NSObject *v14;
  NSString *recordsToDeletePlistPath;
  int v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  id v21;
  NSObject *v22;
  NSString *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  NSString *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "scopedIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v11 = CFSTR("RKVersion");
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_12;
        objc_opt_class();
        v11 = CFSTR("RKMaster");
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_12;
        objc_opt_class();
        v11 = CFSTR("RKMemory");
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (objc_opt_class(), v11 = CFSTR("RKPerson"), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), v11 = CFSTR("RKFaceCrop"), (objc_opt_isKindOfClass() & 1) != 0)
          || (objc_opt_class(), v11 = CFSTR("RKAlbum"), (objc_opt_isKindOfClass() & 1) != 0))
        {
LABEL_12:
          if (-[PLCloudBatchUploader _updateDeletionRecordListForKey:removingRecordID:](self, "_updateDeletionRecordListForKey:removingRecordID:", v11, v10))
          {
            v6 = 1;
          }
          else if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("RKAlbum")))
          {
            v6 = -[PLCloudBatchUploader _updateDeletionRecordListForKey:removingRecordID:](self, "_updateDeletionRecordListForKey:removingRecordID:", CFSTR("RKFolder"), v10);
          }
          else
          {
            v6 = 0;
          }
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v5);
    if (v6)
    {
      v12 = -[NSMutableDictionary count](self->_recordsToDelete, "count");
      v13 = (_BYTE *)MEMORY[0x1E0D115D0];
      if (v12)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            recordsToDeletePlistPath = self->_recordsToDeletePlistPath;
            v16 = -[NSMutableDictionary count](self->_recordsToDelete, "count");
            *(_DWORD *)buf = 138543618;
            v31 = recordsToDeletePlistPath;
            v32 = 1026;
            LODWORD(v33) = v16;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Updating %{public}@: still has %{public}d records", buf, 0x12u);
          }

        }
        -[NSMutableDictionary writeToFile:atomically:](self->_recordsToDelete, "writeToFile:atomically:", self->_recordsToDeletePlistPath, 1);
        goto LABEL_37;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = self->_recordsToDeletePlistPath;
          *(_DWORD *)buf = 138543362;
          v31 = v18;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Deleting %{public}@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_recordsToDeletePlistPath;
      v25 = 0;
      objc_msgSend(v19, "removeItemAtPath:error:", v20, &v25);
      v21 = v25;

      if (v21)
      {
        if (*v13)
        {
LABEL_36:

          goto LABEL_37;
        }
        __CPLAssetsdOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = self->_recordsToDeletePlistPath;
          *(_DWORD *)buf = 138543618;
          v31 = v23;
          v32 = 2114;
          v33 = v21;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@: %{public}@", buf, 0x16u);
        }
      }
      else
      {
        v22 = self->_recordsToDeletePlistPath;
        self->_recordsToDeletePlistPath = 0;
      }

      goto LABEL_36;
    }
  }
LABEL_37:

}

- (id)processCommitError:(id)a3 andFinalizeError:(id)a4 forUploadBatchContainer:(id)a5 withUploadTracker:(id)a6 inLibrary:(id)a7
{
  _BYTE *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  unsigned int v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  id v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t *v69;
  uint64_t *v70;
  __int16 v71;
  char v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint8_t buf[8];
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v38 = (unint64_t)a3;
  v40 = (unint64_t)a4;
  v42 = a5;
  v35 = a6;
  v54 = a7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "batch");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38 | v40)
  {
    if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:")|| +[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", v40))
    {
      v37 = 1;
LABEL_5:
      v43 = 1;
      goto LABEL_23;
    }
    if (objc_msgSend(v39, "count"))
    {
      if ((objc_msgSend(v42, "wasFixed") & 1) != 0 || (objc_msgSend(v42, "wasSplit") & 1) != 0)
      {
        v12 = (_BYTE *)MEMORY[0x1E0D115D0];
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = objc_msgSend(v42, "retryCount");
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Batch retry count: %d", buf, 8u);
          }

        }
        if (objc_msgSend(v42, "wasSplit") && objc_msgSend(v42, "retryCount"))
        {
          if (!*v12)
          {
            __CPLAssetsdOSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v15 = objc_msgSend(v42, "retryCount");
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v15;
              _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Batch exceeded max retry count: %d for permanent failure, marking as failed", buf, 8u);
            }

          }
          v37 = 0;
          goto LABEL_5;
        }
        objc_msgSend(v42, "batchesSplitForError");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudBatchUploader _pushBatches:](self, "_pushBatches:", v16);

      }
      else
      {
        -[PLCloudBatchUploader _push:](self, "_push:", v42);
        objc_msgSend(v42, "setWasFixed:", 1);
        objc_msgSend(v42, "incrementRetryCount");
      }
    }
  }
  v37 = 0;
  v43 = 0;
LABEL_23:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(v39, "records");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  v19 = v43 | ((v38 | v40) == 0);
  if (v18)
  {
    v20 = *(_QWORD *)v78;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v78 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v21);
        if ((v19 & objc_msgSend(v22, "supportsResources")) == 1)
          -[PLCloudBatchUploader _cleanUploadedResources:inLibrary:](self, "_cleanUploadedResources:inLibrary:", v22, v54);
        objc_msgSend(v22, "scopedIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          if (objc_msgSend(v22, "changeType") == 1024)
          {
            objc_msgSend(v53, "addObject:", v22);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v52, "addObject:", v23);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v51, "addObject:", v24);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v50, "addObject:", v23);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v49, "addObject:", v24);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      if (+[PLUserFeedback shouldHandleCPLSuggestionChange:](PLUserFeedback, "shouldHandleCPLSuggestionChange:", v22))
                      {
                        objc_msgSend(v46, "addObject:", v24);
                      }
                      else
                      {
                        objc_msgSend(v47, "addObject:", v24);
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v45, "addObject:", v24);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v44, "addObject:", v24);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            objc_msgSend(v41, "addObject:", v24);
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                              objc_msgSend(v36, "addObject:", v24);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing identifier for change %@, Please file a Radar to Photos Backend iCloud with 'cplctl diagnose' logs and relate to 32789330"), objc_opt_class(), v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          PLSimulateCrash();

        }
        ++v21;
      }
      while (v18 != v21);
      v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      v18 = v26;
    }
    while (v26);
  }

  v27 = 0;
  *(_QWORD *)buf = 0;
  v82 = buf;
  v73 = 0;
  v74 = &v73;
  v83 = 0x2020000000;
  v84 = 0;
  v75 = 0x2020000000;
  v76 = 0;
  if (((v37 | v19 ^ 1) & 1) == 0)
  {
    if (v43)
      v28 = 2;
    else
      v28 = 1;
    if ((v43 & 1) == 0
      && objc_msgSend(v53, "count", 0)
      && -[NSMutableDictionary count](self->_recordsToDelete, "count"))
    {
      -[PLCloudBatchUploader _clearSuccessfullyPushedDeletedRecords:](self, "_clearSuccessfullyPushedDeletedRecords:", v53);
    }
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __112__PLCloudBatchUploader_processCommitError_andFinalizeError_forUploadBatchContainer_withUploadTracker_inLibrary___block_invoke;
    v55[3] = &unk_1E365FCC0;
    v56 = v51;
    v57 = v54;
    v71 = v28;
    v58 = v49;
    v59 = v47;
    v60 = v46;
    v61 = v45;
    v62 = v41;
    v63 = v36;
    v64 = v52;
    v69 = buf;
    v70 = &v73;
    v65 = v50;
    v72 = v43;
    v66 = v35;
    v67 = v48;
    v68 = v44;
    objc_msgSend(v57, "performTransactionAndWait:", v55);

    v27 = *((_QWORD *)v82 + 3);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setValue:forKey:", v29, CFSTR("pushedPhotoCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74[3]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setValue:forKey:", v30, CFSTR("pushedVideoCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setValue:forKey:", v31, CFSTR("resetSyncNeeded"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v38 | v40) != 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setValue:forKey:", v32, CFSTR("hadError"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v43);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setObject:forKey:", v33, CFSTR("hadPermanentError"));

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(buf, 8);

  return v48;
}

- (void)recordMomentSharesNeedingForceSync:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCloudBatchUploader *v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PLCloudBatchUploader_recordMomentSharesNeedingForceSync_inLibrary___block_invoke;
  v8[3] = &unk_1E3677C18;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "performBlockAndWait:", v8);

}

- (void)processMomentSharesNeedingForceSyncInLibrary:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if (-[NSMutableSet count](self->_momentSharesNeedingForceSync, "count"))
  {
    -[NSMutableSet allObjects](self->_momentSharesNeedingForceSync, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMomentShare forceSyncMomentShares:photoLibrary:](PLMomentShare, "forceSyncMomentShares:photoLibrary:", v4, v5);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__PLCloudBatchUploader_processMomentSharesNeedingForceSyncInLibrary___block_invoke;
    v6[3] = &unk_1E3677AA0;
    v6[4] = self;
    objc_msgSend(v5, "performBlockAndWait:", v6);
    -[NSMutableSet removeAllObjects](self->_momentSharesNeedingForceSync, "removeAllObjects");
  }

}

- (PLLibraryServicesManager)libraryServicesManager
{
  return self->_libraryServicesManager;
}

- (BOOL)initialUpload
{
  return self->_initialUpload;
}

- (void)setInitialUpload:(BOOL)a3
{
  self->_initialUpload = a3;
}

- (BOOL)shouldGenerateDerivatives
{
  return self->_shouldGenerateDerivatives;
}

- (void)setShouldGenerateDerivatives:(BOOL)a3
{
  self->_shouldGenerateDerivatives = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_momentSharesNeedingForceSync, 0);
  objc_storeStrong((id *)&self->_recordsToDeletePlistPath, 0);
  objc_storeStrong((id *)&self->_recordsToDelete, 0);
  objc_storeStrong((id *)&self->_cameraAsset, 0);
  objc_storeStrong((id *)&self->_downloadedDeleteRecords, 0);
  objc_storeStrong((id *)&self->_uploadBatchArray, 0);
}

void __69__PLCloudBatchUploader_processMomentSharesNeedingForceSyncInLibrary___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setForceSyncAttempted:", 1, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __69__PLCloudBatchUploader_recordMomentSharesNeedingForceSync_inLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "forceSyncAttempted", (_QWORD)v7) & 1) == 0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __112__PLCloudBatchUploader_processCommitError_andFinalizeError_forUploadBatchContainer_withUploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  unsigned __int16 v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  unsigned __int16 v17;
  int v18;
  NSObject *v19;
  id v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  unsigned __int16 v27;
  int v28;
  NSObject *v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  unsigned __int16 v40;
  int v41;
  NSObject *v42;
  id v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  unsigned __int16 v53;
  int v54;
  NSObject *v55;
  id v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t ii;
  void *v65;
  unsigned __int16 v66;
  int v67;
  NSObject *v68;
  id v69;
  int v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t jj;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  unsigned __int16 v80;
  int v81;
  NSObject *v82;
  id v83;
  int v84;
  void *v85;
  id v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t kk;
  void *v93;
  void *v94;
  void *v95;
  unsigned __int16 v96;
  int v97;
  NSObject *v98;
  id v99;
  int v100;
  char v101;
  uint64_t v102;
  int v103;
  NSObject *v104;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  const __CFString *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t mm;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t nn;
  void *v129;
  unsigned __int16 v130;
  int v131;
  NSObject *v132;
  id v133;
  int v134;
  __int128 v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id obj;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  uint8_t v187[128];
  uint8_t buf[4];
  id v189;
  __int16 v190;
  const __CFString *v191;
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;

  v201 = *MEMORY[0x1E0C80C00];
  +[PLGenericAlbum albumsWithCloudGUIDs:inLibrary:](PLGenericAlbum, "albumsWithCloudGUIDs:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v183;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v183 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "cloudLocalState");
        v8 = *(unsigned __int16 *)(a1 + 152);
        if (v8 != v7)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v6, "cloudGUID");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              v11 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v10;
              v190 = 1024;
              LODWORD(v191) = v11;
              _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Album %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v8) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v6, "setCloudLocalState:", (__int16)v8);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v182, v200, 16);
    }
    while (v3);
  }

  +[PLMemory memoriesWithUUIDs:inPhotoLibrary:](PLMemory, "memoriesWithUUIDs:inPhotoLibrary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v178 = 0u;
  v179 = 0u;
  v180 = 0u;
  v181 = 0u;
  v140 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v179;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v179 != v14)
          objc_enumerationMutation(v140);
        v16 = *(void **)(*((_QWORD *)&v178 + 1) + 8 * j);
        v17 = objc_msgSend(v16, "cloudLocalState");
        v18 = *(unsigned __int16 *)(a1 + 152);
        if (v18 != v17)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "uuid");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              v21 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v20;
              v190 = 1024;
              LODWORD(v191) = v21;
              _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Memory %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v18) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v16, "setCloudLocalState:", (__int16)v18);
        }
      }
      v13 = objc_msgSend(v140, "countByEnumeratingWithState:objects:count:", &v178, v199, 16);
    }
    while (v13);
  }

  +[PLSuggestion suggestionsWithUUIDs:inPhotoLibrary:](PLSuggestion, "suggestionsWithUUIDs:inPhotoLibrary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v174 = 0u;
  v175 = 0u;
  v176 = 0u;
  v177 = 0u;
  v139 = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v175;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v175 != v24)
          objc_enumerationMutation(v139);
        v26 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * k);
        v27 = objc_msgSend(v26, "cloudLocalState");
        v28 = *(unsigned __int16 *)(a1 + 152);
        if (v28 != v27)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v26, "uuid");
              v30 = (id)objc_claimAutoreleasedReturnValue();
              v31 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v30;
              v190 = 1024;
              LODWORD(v191) = v31;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "Suggestion %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v28) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v26, "setCloudLocalState:", (__int16)v28);
        }
      }
      v23 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v174, v198, 16);
    }
    while (v23);
  }

  v32 = *(_QWORD *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUserFeedback userFeedbacksWithUUIDs:inManagedObjectContext:](PLUserFeedback, "userFeedbacksWithUUIDs:inManagedObjectContext:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v172 = 0u;
  v173 = 0u;
  v170 = 0u;
  v171 = 0u;
  v138 = v34;
  v35 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v171;
    do
    {
      for (m = 0; m != v36; ++m)
      {
        if (*(_QWORD *)v171 != v37)
          objc_enumerationMutation(v138);
        v39 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * m);
        v40 = objc_msgSend(v39, "cloudLocalState");
        v41 = *(unsigned __int16 *)(a1 + 152);
        if (v41 != v40)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v39, "uuid");
              v43 = (id)objc_claimAutoreleasedReturnValue();
              v44 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v43;
              v190 = 1024;
              LODWORD(v191) = v44;
              _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEBUG, "User Feedback %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v41) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v39, "setCloudLocalState:", (__int16)v41);
        }
      }
      v36 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v170, v197, 16);
    }
    while (v36);
  }

  v45 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personsWithUUIDs:inManagedObjectContext:](PLPerson, "personsWithUUIDs:inManagedObjectContext:", v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v137 = v47;
  v48 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v166, v196, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v167;
    do
    {
      for (n = 0; n != v49; ++n)
      {
        if (*(_QWORD *)v167 != v50)
          objc_enumerationMutation(v137);
        v52 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * n);
        v53 = objc_msgSend(v52, "cloudLocalState");
        v54 = *(unsigned __int16 *)(a1 + 152);
        if (v54 != v53)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v52, "personUUID");
              v56 = (id)objc_claimAutoreleasedReturnValue();
              v57 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v56;
              v190 = 1024;
              LODWORD(v191) = v57;
              _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEBUG, "Person %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v54) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v52, "setCloudLocalState:", (__int16)v54);
        }
      }
      v49 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v166, v196, 16);
    }
    while (v49);
  }

  v58 = *(_QWORD *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithScopeIdentifiers:includeTrashed:inManagedObjectContext:](PLLibraryScope, "shareWithScopeIdentifiers:includeTrashed:inManagedObjectContext:", v58, 1, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v164 = 0u;
  v165 = 0u;
  v162 = 0u;
  v163 = 0u;
  v136 = v60;
  v61 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v162, v195, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v163;
    do
    {
      for (ii = 0; ii != v62; ++ii)
      {
        if (*(_QWORD *)v163 != v63)
          objc_enumerationMutation(v136);
        v65 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * ii);
        v66 = objc_msgSend(v65, "cloudLocalState");
        v67 = *(unsigned __int16 *)(a1 + 152);
        if (v67 != v66)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v65, "uuid");
              v69 = (id)objc_claimAutoreleasedReturnValue();
              v70 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v69;
              v190 = 1024;
              LODWORD(v191) = v70;
              _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEBUG, "Library Scope %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v67) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v65, "setCloudLocalState:", (__int16)v67);
        }
      }
      v62 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v162, v195, 16);
    }
    while (v62);
  }

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v71 = *(id *)(a1 + 88);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v158, v194, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v159;
    do
    {
      for (jj = 0; jj != v73; ++jj)
      {
        if (*(_QWORD *)v159 != v74)
          objc_enumerationMutation(v71);
        v76 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * jj);
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        if (v78)
        {
          v79 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:", v78);
          v80 = -[NSObject cloudLocalState](v79, "cloudLocalState");
          v81 = *(unsigned __int16 *)(a1 + 152);
          if (v81 != v80)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
              {
                -[NSObject uuid](v79, "uuid");
                v83 = (id)objc_claimAutoreleasedReturnValue();
                v84 = *(__int16 *)(a1 + 152);
                *(_DWORD *)buf = 138412546;
                v189 = v83;
                v190 = 1024;
                LODWORD(v191) = v84;
                _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEBUG, "Social Group %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

              }
              LOWORD(v81) = *(_WORD *)(a1 + 152);
            }
            -[NSObject setCloudLocalState:](v79, "setCloudLocalState:", (__int16)v81);
          }
        }
        else
        {
          if (*MEMORY[0x1E0D115D0])
            goto LABEL_95;
          __CPLAssetsdOSLogDomain();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v189 = v76;
            _os_log_impl(&dword_199541000, v79, OS_LOG_TYPE_DEBUG, "PLCloudBatchUploader nil social group node with UUID: %@", buf, 0xCu);
          }
        }

LABEL_95:
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v158, v194, 16);
    }
    while (v73);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v86 = *(id *)(a1 + 96);
  v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v154, v193, 16);
  if (!v87)
  {

    goto LABEL_123;
  }
  v89 = v87;
  v90 = 0;
  v91 = *(_QWORD *)v155;
  *(_QWORD *)&v88 = 138412546;
  v135 = v88;
  do
  {
    for (kk = 0; kk != v89; ++kk)
    {
      if (*(_QWORD *)v155 != v91)
        objc_enumerationMutation(v86);
      v93 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * kk);
      +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v93, *(_QWORD *)(a1 + 40), 1, v135);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v94;
      if (v94)
      {
        objc_msgSend(v94, "setUploadAttempts:", 0);
        objc_msgSend(v95, "setLastUploadAttemptDate:", 0);
        v96 = objc_msgSend(v95, "cloudLocalState");
        v97 = *(unsigned __int16 *)(a1 + 152);
        if (v97 != v96)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v98 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v95, "cloudAssetGUID");
              v99 = (id)objc_claimAutoreleasedReturnValue();
              v100 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = v135;
              v189 = v99;
              v190 = 1024;
              LODWORD(v191) = v100;
              _os_log_impl(&dword_199541000, v98, OS_LOG_TYPE_DEBUG, "Asset %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v97) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v95, "setCloudLocalState:", (__int16)v97);
          v90 |= *(_WORD *)(a1 + 152) == 2;
        }
        if (objc_msgSend(v95, "shouldIncludeInCPLCounts"))
        {
          v101 = objc_msgSend(v95, "isPhoto");
          v102 = a1 + 136;
          if ((v101 & 1) != 0 || (v103 = objc_msgSend(v95, "isVideo"), v102 = a1 + 144, v103))
            ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v102 + 8) + 24);
        }
        +[PLCPLFacePushSupport markSyncableFacesAsPushedInAsset:](PLCPLFacePushSupport, "markSyncableFacesAsPushedInAsset:", v95);
        objc_msgSend(v95, "allAssetCPLResources");
        v104 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "unionSet:", v104);
      }
      else
      {
        if (*MEMORY[0x1E0D115D0])
          goto LABEL_118;
        __CPLAssetsdOSLogDomain();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v189 = v93;
          _os_log_impl(&dword_199541000, v104, OS_LOG_TYPE_ERROR, "Failed to find asset %@ in pushed assets", buf, 0xCu);
        }
      }

LABEL_118:
    }
    v89 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v154, v193, 16);
  }
  while (v89);

  if ((v90 & 1) != 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.failedtopush"), 0, 0, 0);
  }
LABEL_123:
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v106 = *(id *)(a1 + 104);
  v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v150, v192, 16);
  if (!v107)
    goto LABEL_150;
  v108 = v107;
  v109 = *(_QWORD *)v151;
  while (2)
  {
    v110 = 0;
    while (2)
    {
      if (*(_QWORD *)v151 != v109)
        objc_enumerationMutation(v106);
      v111 = *(void **)(*((_QWORD *)&v150 + 1) + 8 * v110);
      +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v111, 0, *(_QWORD *)(a1 + 40));
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = v112;
      if (v112)
      {
        if (*(unsigned __int16 *)(a1 + 152) != (unsigned __int16)objc_msgSend(v112, "cloudLocalState"))
        {
          if (objc_msgSend(v113, "cloudLocalState") == 3)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v114 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v189 = v113;
                _os_log_impl(&dword_199541000, v114, OS_LOG_TYPE_DEBUG, "Master %@ was uploaded before, leaving the state as Uploaded", buf, 0xCu);
              }

            }
          }
          else
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v116 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
              {
                v117 = CFSTR("Failed");
                if (*(_WORD *)(a1 + 152) == 1)
                  v117 = CFSTR("Pushed");
                *(_DWORD *)buf = 138412546;
                v189 = v113;
                v190 = 2112;
                v191 = v117;
                _os_log_impl(&dword_199541000, v116, OS_LOG_TYPE_DEBUG, "Master %@ was pushed, marking cloudLocalState to %@", buf, 0x16u);
              }

            }
            objc_msgSend(v113, "setCloudLocalState:", *(__int16 *)(a1 + 152));
          }
        }
        objc_msgSend(v113, "allMasterResources");
        v115 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "unionSet:", v115);
        if (*(_BYTE *)(a1 + 154))
        {
          objc_msgSend(*(id *)(a1 + 112), "stopTrackingMaster:", v113);
          objc_msgSend(*(id *)(a1 + 120), "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("changedTotalSizeOfUnpushedOriginal"));
        }
        goto LABEL_147;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v189 = v111;
          _os_log_impl(&dword_199541000, v115, OS_LOG_TYPE_ERROR, "Failed to find master %@ in pushed masters", buf, 0xCu);
        }
LABEL_147:

      }
      if (v108 != ++v110)
        continue;
      break;
    }
    v108 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v150, v192, 16);
    if (v108)
      continue;
    break;
  }
LABEL_150:

  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v118 = v85;
  v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v146, v187, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v147;
    do
    {
      for (mm = 0; mm != v120; ++mm)
      {
        if (*(_QWORD *)v147 != v121)
          objc_enumerationMutation(v118);
        v123 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * mm);
        if (*(unsigned __int16 *)(a1 + 152) != (unsigned __int16)objc_msgSend(v123, "cloudLocalState")
          && objc_msgSend(v123, "cloudLocalState") != 3)
        {
          objc_msgSend(v123, "setCloudLocalState:", *(__int16 *)(a1 + 152));
        }
      }
      v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v146, v187, 16);
    }
    while (v120);
  }

  +[PLFaceCrop faceCropsWithUUIDs:inPhotoLibrary:](PLFaceCrop, "faceCropsWithUUIDs:inPhotoLibrary:", *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 40));
  v142 = 0u;
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v124 = (id)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v142, v186, 16);
  if (v125)
  {
    v126 = v125;
    v127 = *(_QWORD *)v143;
    do
    {
      for (nn = 0; nn != v126; ++nn)
      {
        if (*(_QWORD *)v143 != v127)
          objc_enumerationMutation(v124);
        v129 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * nn);
        v130 = objc_msgSend(v129, "cloudLocalState");
        v131 = *(unsigned __int16 *)(a1 + 152);
        if (v131 != v130)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v129, "uuid");
              v133 = (id)objc_claimAutoreleasedReturnValue();
              v134 = *(__int16 *)(a1 + 152);
              *(_DWORD *)buf = 138412546;
              v189 = v133;
              v190 = 1024;
              LODWORD(v191) = v134;
              _os_log_impl(&dword_199541000, v132, OS_LOG_TYPE_DEBUG, "faceCrop %@ was pushed, marking cloudLocalState to %d", buf, 0x12u);

            }
            LOWORD(v131) = *(_WORD *)(a1 + 152);
          }
          objc_msgSend(v129, "setCloudLocalState:", (__int16)v131);
        }
      }
      v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v142, v186, 16);
    }
    while (v126);
  }

}

void __84__PLCloudBatchUploader__processRepushAlbumError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v7, "scopeIdentifier", (_QWORD)v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "mainScopeIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if ((v10 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), CFSTR("PLCloudBatchUploader.m"), 2056, CFSTR("albums are only supported in main scope"));

        }
        objc_msgSend(v7, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v11, *(_QWORD *)(a1 + 40));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v7;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Can't generate CPLRecordChange for album %@, forcing a reset sync", buf, 0xCu);
            }

          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          goto LABEL_20;
        }
        objc_msgSend(v12, "cplAlbumChangeInPhotoLibrary:", *(_QWORD *)(a1 + 40));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 56), "removeRecordWithScopedIdentifier:", v7);
          if (v13)
            objc_msgSend(*(id *)(a1 + 56), "addRecord:", v13);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_20:

}

void __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "scopedIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v2, 0, *(_QWORD *)(a1 + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject assets](v3, "assets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyObject");
      v6 = objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[NSObject createResourcesForMaster:shouldGenerateDerivatives:inPhotoLibrary:](v6, "createResourcesForMaster:shouldGenerateDerivatives:inPhotoLibrary:", v4, *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 33), *(_QWORD *)(a1 + 40));
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = v7;
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v10 = *(_QWORD *)(a1 + 32);
              v17 = 138412546;
              v18 = v8;
              v19 = 2112;
              v20 = v10;
              _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Setting master resources %@ to record %@", (uint8_t *)&v17, 0x16u);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "setResources:", v8);
        }
        else
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = 138412290;
              v18 = v4;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unable to create master resources for %@", (uint8_t *)&v17, 0xCu);
            }

          }
          v8 = 0;
        }
      }
      else
      {
        if (*MEMORY[0x1E0D115D0])
        {
          v6 = 0;
          goto LABEL_36;
        }
        __CPLAssetsdOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v17 = 138412290;
          v18 = v4;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unable to find any asset for cloudMaster %@", (uint8_t *)&v17, 0xCu);
        }
      }

LABEL_36:
LABEL_37:

      goto LABEL_38;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      v17 = 138412290;
      v18 = v2;
      v15 = "Unable to find cloudMaster with scopedIdentifier %@";
LABEL_29:
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v17, 0xCu);
      goto LABEL_36;
    }
    goto LABEL_39;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v2, *(_QWORD *)(a1 + 40), 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v4 = v11;
    if (v11)
    {
      -[NSObject createResourcesForAssetInPhotoLibrary:shouldGenerateDerivatives:](v11, "createResourcesForAssetInPhotoLibrary:shouldGenerateDerivatives:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 33));
      v6 = objc_claimAutoreleasedReturnValue();
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *(_QWORD *)(a1 + 32);
          v17 = 138412546;
          v18 = v6;
          v19 = 2112;
          v20 = v13;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Setting asset resources %@ to record %@", (uint8_t *)&v17, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "setResources:", v6);
      goto LABEL_36;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        goto LABEL_36;
      v17 = 138412290;
      v18 = v2;
      v15 = "Unable to find asset with scopedIdentifier %@";
      goto LABEL_29;
    }
LABEL_39:
    v4 = 0;
    goto LABEL_37;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(a1 + 32);
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Incorrect record type to re-generate derivatives for record: %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_38:

}

void __61__PLCloudBatchUploader__addLocalResourcesToRecord_inLibrary___block_invoke_157(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "resources", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setCanGenerateDerivative:", 0);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __110__PLCloudBatchUploader__processInvalidExpungeableResourceTypesCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
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
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v77;
    v7 = (_BYTE *)MEMORY[0x1E0D115D0];
    v48 = v3;
    v49 = a1;
    v50 = *(_QWORD *)v77;
    do
    {
      v8 = 0;
      v51 = v5;
      do
      {
        if (*(_QWORD *)v77 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v8);
        objc_msgSend(v9, "scopedIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:"))
        {
          objc_msgSend(*(id *)(a1 + 48), "_getLocalRecordFromCPLRecord:inLibrary:", v9, *(_QWORD *)(a1 + 56));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = v10;
            v53 = v8;
            v11 = v10;
            v72 = 0u;
            v73 = 0u;
            v74 = 0u;
            v75 = 0u;
            v54 = v11;
            objc_msgSend(v11, "assets");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v73;
LABEL_10:
              v16 = 0;
              while (1)
              {
                if (*(_QWORD *)v73 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v16);
                if ((int)objc_msgSend(v17, "uploadAttempts") >= 3)
                  break;
                objc_msgSend(v17, "incrementUploadAttempts");
                if (v14 == ++v16)
                {
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
                  if (v14)
                    goto LABEL_10;
                  goto LABEL_16;
                }
              }
              if (!*v7)
              {
                __CPLAssetsdOSLogDomain();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v54, "scopedIdentifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v85 = v21;
                  _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid expungeable resource master repush attempts for cloud master: %@", buf, 0xCu);

                }
              }

              objc_msgSend(v2, "addObject:", v55);
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              objc_msgSend(v54, "assets");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v69;
                do
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v69 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                    objc_msgSend(v27, "scopedIdentifier");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v28)
                    {
                      if (!*v7)
                      {
                        __CPLAssetsdOSLogDomain();
                        v29 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v85 = v28;
                          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Removing CPLAssetChange %@ from batch", buf, 0xCu);
                        }

                      }
                      objc_msgSend(v2, "addObject:", v28);
                    }
                    else if (!*v7)
                    {
                      __CPLAssetsdOSLogDomain();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v85 = v27;
                        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Asset with nil scopedIdentifier %@", buf, 0xCu);
                      }

                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
                }
                while (v24);
              }

              objc_msgSend(v54, "setCloudLocalState:", 2);
              v66 = 0u;
              v67 = 0u;
              v64 = 0u;
              v65 = 0u;
              objc_msgSend(v54, "allMasterResources");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
              v3 = v48;
              a1 = v49;
              v5 = v51;
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v65;
                do
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v65 != v34)
                      objc_enumerationMutation(v31);
                    objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "setCloudLocalState:", 2);
                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v64, v82, 16);
                }
                while (v33);
              }

              v6 = v50;
              v10 = v52;
              if (!*v7)
              {
                __CPLAssetsdOSLogDomain();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v55;
                  _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Removing CPLMasterChange %@ from batch and marking cloud master as CPLPushFailed", buf, 0xCu);
                }
                goto LABEL_51;
              }
            }
            else
            {
LABEL_16:

              objc_msgSend(v54, "cplFullRecord");
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "addObject:", v55);
              objc_msgSend(v47, "addObject:", v18);
              if (*v7)
              {
                v6 = v50;
                v5 = v51;
                v10 = v52;
              }
              else
              {
                __CPLAssetsdOSLogDomain();
                v19 = objc_claimAutoreleasedReturnValue();
                v10 = v52;
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v55;
                  _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Repushing full master record for cloud master %@", buf, 0xCu);
                }

                v6 = v50;
                v5 = v51;
              }
LABEL_51:

            }
            v8 = v53;
          }

        }
        ++v8;
      }
      while (v8 != v5);
      v36 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v76, v87, 16);
      v5 = v36;
    }
    while (v36);
  }

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v37 = v2;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v61 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(a1 + 32), "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v60, v81, 16);
    }
    while (v39);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v42 = v47;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v57;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(a1 + 32), "addRecord:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m));
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v80, 16);
    }
    while (v44);
  }

}

void __104__PLCloudBatchUploader__processInvalidResourceCopySourceCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  NSObject *v74;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  id obj;
  id v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
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
  _BYTE v120[128];
  _BYTE v121[128];
  uint8_t v122[128];
  uint8_t buf[4];
  void *v124;
  __int16 v125;
  void *v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v96 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v97 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  v89 = a1;
  v85 = (void *)v2;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v117;
    v86 = *(_QWORD *)v117;
    v87 = v3;
    do
    {
      v8 = 0;
      v88 = v6;
      do
      {
        if (*(_QWORD *)v117 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v8);
        objc_msgSend(v9, "scopedIdentifier", v85);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v10))
        {
          objc_msgSend(*(id *)(a1 + 48), "_getLocalRecordFromCPLRecord:inLibrary:", v9, *(_QWORD *)(a1 + 56));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = v10;
            v90 = v11;
            v92 = v8;
            v12 = v11;
            if (objc_msgSend(v12, "isPlaceholderAsset"))
            {
              if ((int)objc_msgSend(v12, "uploadAttempts") >= 2)
              {
                if (!*v5)
                {
                  __CPLAssetsdOSLogDomain();
                  v13 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v12, "scopedIdentifier");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v124 = v14;
                    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid resource repush attempts for placeholder asset: %@", buf, 0xCu);

                  }
                }
                objc_msgSend(v96, "addObject:", v12);
                goto LABEL_48;
              }
              if (!*v5)
              {
                __CPLAssetsdOSLogDomain();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "scopedIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v124 = v37;
                  _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Will attempt to repush source asset for placeholder asset: %@", buf, 0xCu);

                }
              }
              v34 = v97;
              v35 = v12;
LABEL_54:
              objc_msgSend(v34, "addObject:", v35);
            }
            goto LABEL_55;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = v10;
            v90 = v11;
            v92 = v8;
            v15 = v11;
            if (objc_msgSend(v15, "placeholderState") != 1)
              goto LABEL_55;
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            objc_msgSend(v15, "assets");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
            if (!v17)
            {

              v3 = v87;
              v6 = v88;
              v7 = v86;
              goto LABEL_55;
            }
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v113;
            while (1)
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v113 != v20)
                  objc_enumerationMutation(v16);
                v22 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * v21);
                if (objc_msgSend(v22, "isPlaceholderAsset"))
                {
                  if ((int)objc_msgSend(v22, "uploadAttempts") < 2)
                  {
                    if (*v5)
                    {
                      v28 = v97;
                    }
                    else
                    {
                      __CPLAssetsdOSLogDomain();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v22, "scopedIdentifier");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v124 = v29;
                        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Will attempt to repush source asset for placeholder asset: %@", buf, 0xCu);

                        v5 = (_BYTE *)MEMORY[0x1E0D115D0];
                      }
                      v28 = v97;
LABEL_35:

                    }
                  }
                  else
                  {
                    if (!*v5)
                    {
                      __CPLAssetsdOSLogDomain();
                      v23 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v22, "scopedIdentifier");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v124 = v24;
                        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Exceeded max invalid resource repush attempts for placeholder asset: %@", buf, 0xCu);

                      }
                      if (!*v5)
                      {
                        __CPLAssetsdOSLogDomain();
                        v25 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                        {
                          objc_msgSend(v22, "scopedIdentifier");
                          v26 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v15, "scopedIdentifier");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412546;
                          v124 = v26;
                          v125 = 2112;
                          v126 = v27;
                          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Removing placeholder asset %@ that is associated with removed placeholder master %@", buf, 0x16u);

                          v5 = (_BYTE *)MEMORY[0x1E0D115D0];
                        }
                        v19 = 1;
                        v28 = v96;
                        goto LABEL_35;
                      }
                    }
                    v19 = 1;
                    v28 = v96;
                  }
                  objc_msgSend(v28, "addObject:", v22);
                }
                ++v21;
              }
              while (v18 != v21);
              v30 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
              v18 = v30;
              if (!v30)
              {

                v2 = (uint64_t)v85;
                v7 = v86;
                v3 = v87;
                v6 = v88;
                if ((v19 & 1) != 0)
                {
                  if (!*v5)
                  {
                    __CPLAssetsdOSLogDomain();
                    v31 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                    {
                      objc_msgSend(v15, "scopedIdentifier");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v124 = v32;
                      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Removing placeholder master %@, since its source resource can't be found", buf, 0xCu);

                    }
                  }
                  objc_msgSend(*(id *)(v89 + 56), "managedObjectContext");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "deleteObject:", v15);

                  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
LABEL_48:
                  v34 = (void *)v2;
                  v35 = v93;
                  goto LABEL_54;
                }
LABEL_55:
                v11 = v90;

                a1 = v89;
                v8 = v92;
                v10 = v93;
                break;
              }
            }
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v38 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
      v6 = v38;
    }
    while (v38);
  }

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v96;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v109 != v41)
          objc_enumerationMutation(obj);
        v43 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        if (!*v5)
        {
          __CPLAssetsdOSLogDomain();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v43, "scopedIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v124 = v45;
            _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "Removing placeholder asset %@, since its source resource can't be found", buf, 0xCu);

          }
        }
        objc_msgSend(v43, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL, v85);
        +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("Deleting placeholder asset since its source resource can't be found"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "deleteWithReason:", v46);

        v5 = (_BYTE *)MEMORY[0x1E0D115D0];
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
    }
    while (v40);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v47 = v85;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
  v49 = v89;
  if (v48)
  {
    v50 = v48;
    v51 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v105 != v51)
          objc_enumerationMutation(v47);
        objc_msgSend(*(id *)(v89 + 32), "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j), v85);
      }
      v50 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v104, v121, 16);
    }
    while (v50);
  }
  v91 = v47;

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v94 = v97;
  v53 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
  v54 = (_BYTE *)MEMORY[0x1E0D115D0];
  v99 = v53;
  if (v53)
  {
    v98 = *(_QWORD *)v101;
    do
    {
      v55 = 0;
      do
      {
        if (*(_QWORD *)v101 != v98)
          objc_enumerationMutation(v94);
        v56 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v55);
        objc_msgSend(v56, "fetchSourceAssetForDuplicationIfExists", v85);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        if (v57)
        {
          if (!*v54)
          {
            __CPLAssetsdOSLogDomain();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v57, "scopedIdentifier");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v124 = v59;
              _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEFAULT, "Regenerating asset resources for source asset %@ and adding to currentUploadBatch", buf, 0xCu);

            }
          }
          objc_msgSend(v57, "master");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "scopedIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v61, 8, 0, *(_QWORD *)(v49 + 56));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = *(void **)(v49 + 32);
          objc_msgSend(v62, "scopedIdentifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "removeRecordWithScopedIdentifier:", v64);

          if (v62)
            objc_msgSend(*(id *)(v49 + 32), "addRecord:", v62);
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v56, "scopedIdentifier");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v124 = v66;
              _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEFAULT, "Removing placeholder records from currentUploadBatch and deleting master %@", buf, 0xCu);

            }
          }
          objc_msgSend(v56, "master");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = *(void **)(v49 + 32);
          objc_msgSend(v56, "scopedIdentifier");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "removeRecordWithScopedIdentifier:", v69);

          v70 = *(void **)(v49 + 32);
          objc_msgSend(v67, "scopedIdentifier");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "removeRecordWithScopedIdentifier:", v71);

          if (v67)
          {
            objc_msgSend(v56, "setMaster:", 0);
            objc_msgSend(*(id *)(v49 + 56), "managedObjectContext");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "deleteObject:", v67);

          }
          v73 = +[PLManagedAsset attemptToRecreateMasterAndAssetResourcesForPlaceholderAssetRepush:sourceAsset:library:](PLManagedAsset, "attemptToRecreateMasterAndAssetResourcesForPlaceholderAssetRepush:sourceAsset:library:", v56, v57, *(_QWORD *)(v49 + 56));
          v54 = (_BYTE *)MEMORY[0x1E0D115D0];
          if (v73)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v56, "scopedIdentifier");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v124 = v75;
                _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_DEFAULT, "Recreating master for placeholder asset %@ and adding master record to currentUploadBatch", buf, 0xCu);

                v54 = (_BYTE *)MEMORY[0x1E0D115D0];
              }

            }
            objc_msgSend(v56, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", *(_QWORD *)(v49 + 56), 0);
            v76 = objc_claimAutoreleasedReturnValue();
            if (v76)
              objc_msgSend(*(id *)(v49 + 32), "addRecord:", v76);
            if (!*v54)
            {
              __CPLAssetsdOSLogDomain();
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v56, "scopedIdentifier");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v124 = v78;
                _os_log_impl(&dword_199541000, v77, OS_LOG_TYPE_DEFAULT, "Recreating asset record for placeholder asset %@ and adding to currentUploadBatch", buf, 0xCu);

              }
            }
            objc_msgSend(v56, "master");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "scopedIdentifier");
            v80 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v56, "cplAssetChangeWithMasterScopedIdentifier:withChangeType:shouldGenerateDerivatives:inLibrary:", v80, 0, 0, *(_QWORD *)(v49 + 56));
            v81 = v49;
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            if (v82)
              objc_msgSend(*(id *)(v81 + 32), "addRecord:", v82);

            v49 = v81;
LABEL_114:
            v54 = (_BYTE *)MEMORY[0x1E0D115D0];
            goto LABEL_115;
          }
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v76 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v56, "scopedIdentifier");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "scopedIdentifier");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v124 = v83;
              v125 = 2112;
              v126 = v84;
              _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_ERROR, "Failed to recreate resources on placeholder asset %@, source asset %@ can't be found", buf, 0x16u);

              goto LABEL_114;
            }
LABEL_115:

          }
          objc_msgSend(v56, "incrementUploadAttempts");

        }
        ++v55;
      }
      while (v99 != v55);
      v99 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v100, v120, 16);
    }
    while (v99);
  }

}

void __91__PLCloudBatchUploader__processInvalidScopeCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v8, "scopedIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9))
        {
          objc_msgSend(*(id *)(a1 + 48), "_getLocalRecordFromCPLRecord:inLibrary:", v8, *(_QWORD *)(a1 + 56));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v10, "momentShare");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11 && objc_msgSend(v11, "status") == 1)
            {
              objc_msgSend(v12, "cplScopeChange");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v13);

LABEL_18:
              goto LABEL_19;
            }
          }
          else
          {
            v12 = 0;
          }
          if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v10;
              _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Can't find moment share for %@, marking it as CPLPushFailed", buf, 0xCu);
            }

          }
          objc_msgSend(v10, "setCloudLocalState:", 2);
          objc_msgSend(v2, "addObject:", v9);
          goto LABEL_18;
        }
LABEL_19:

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v5);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = v2;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(a1 + 32), "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v17);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v25;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(a1 + 32), "addRecord:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v22);
  }

}

void __65__PLCloudBatchUploader_quarantineRecord_uploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getLocalRecordFromCPLRecord:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_quarantineObject:uploadTracker:", v2, *(_QWORD *)(a1 + 56));
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 138412290;
        v7 = v2;
        v4 = "Local object is quarantined: %@";
LABEL_8:
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 40);
      v6 = 138412290;
      v7 = v5;
      v4 = "Can't find local object to quarantine for record: %@";
      goto LABEL_8;
    }
LABEL_9:

  }
}

void __92__PLCloudBatchUploader__processIncludeMasterCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v1 = a1;
  v39 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v33;
    v7 = &off_1E3659000;
    *(_QWORD *)&v4 = 138412290;
    v28 = v4;
    do
    {
      v8 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        objc_msgSend(v9, "scopedIdentifier", v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v1 + 40), "containsObject:", v10))
        {
          objc_msgSend(v7[476], "assetWithScopedIdentifier:inLibrary:prefetchResources:", v10, *(_QWORD *)(v1 + 48), 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            objc_msgSend(v11, "master");
            v13 = objc_claimAutoreleasedReturnValue();
            if (!v13)
              goto LABEL_16;
            v14 = (void *)v13;
            objc_msgSend(v12, "master");
            v15 = v1;
            v16 = v7;
            v17 = v6;
            v18 = v2;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v12;
            v20 = objc_msgSend(v19, "cloudLocalState");

            v2 = v18;
            v6 = v17;
            v7 = v16;
            v1 = v15;
            v5 = v29;

            v21 = v20 == 4;
            v12 = v30;
            if (!v21)
            {
LABEL_16:
              objc_msgSend(v12, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", *(_QWORD *)(v1 + 48), 1);
              v24 = objc_claimAutoreleasedReturnValue();
              if (v24)
              {
                objc_msgSend(*(id *)(v1 + 64), "addRecord:", v24);
                objc_msgSend(*(id *)(v1 + 64), "addRecord:", v9);
              }
              else
              {
                if (!*MEMORY[0x1E0D115D0])
                {
                  __CPLAssetsdOSLogDomain();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "cloudAssetGUID");
                    v31 = v12;
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v28;
                    v37 = v27;
                    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Can't find/create master for record %@, marking as failed", buf, 0xCu);

                    v12 = v31;
                  }

                }
                objc_msgSend(v12, "setCloudLocalState:", 2);
              }
              goto LABEL_26;
            }
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v30, "cloudAssetGUID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v28;
                v37 = v23;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Master was quarantined, also quarantine the asset %@", buf, 0xCu);

                v12 = v30;
              }

            }
            objc_msgSend(*(id *)(v1 + 56), "_quarantineObject:uploadTracker:", v12, 0);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 24) = 1;
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            __CPLAssetsdOSLogDomain();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(0, "cloudAssetGUID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v28;
              v37 = v25;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Can't find asset for record %@", buf, 0xCu);

              v12 = 0;
            }
LABEL_26:

          }
          objc_msgSend(*(id *)(v1 + 72), "removeObject:", v10);

        }
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

}

void __97__PLCloudBatchUploader__processChangeToFullRecordCommitError_inUploadBatch_forRecords_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  __int128 v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "records");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v38;
    v8 = (_BYTE *)MEMORY[0x1E0D115D0];
    *(_QWORD *)&v5 = 138412290;
    v27 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v38 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v10, "scopedIdentifier", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11))
        {
          objc_msgSend(*(id *)(a1 + 48), "_getLocalRecordFromCPLRecord:inLibrary:", v10, *(_QWORD *)(a1 + 56));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            objc_msgSend(v12, "cplFullRecord");
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v15 = v14;
              objc_msgSend(v28, "addObject:", v14);
              goto LABEL_13;
            }
            if (!*v8)
            {
              __CPLAssetsdOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                v44 = v13;
                _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Can't create full record type for %@, marking it as CPLPushFailed", buf, 0xCu);
              }

            }
            objc_msgSend(v13, "setCloudLocalState:", 2);
          }
          else if (!*v8)
          {
            __CPLAssetsdOSLogDomain();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v44 = v11;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Can't find local object to create full record type: %@", buf, 0xCu);
            }
LABEL_13:

          }
          objc_msgSend(v2, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v6);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v17 = v2;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(a1 + 32), "removeRecordWithScopedIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v19);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v22 = v28;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(a1 + 32), "addRecord:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v24);
  }

}

void __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "assetResourceForCPLType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[NSObject markAsNotLocallyAvailable](v3, "markAsNotLocallyAvailable");
    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v7 = *(_QWORD *)(a1 + 48);
          v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "unable to find uploaded cloud resource %@", (uint8_t *)&v8, 0xCu);
        }

      }
      v4 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "unable to find asset for uploaded resource %@", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_13:

}

void __58__PLCloudBatchUploader__cleanUploadedResources_inLibrary___block_invoke_152(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", *(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(v2, "rm_cloudResourcesForResourceType:", objc_msgSend(*(id *)(a1 + 48), "resourceType"));
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v3, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v4 = v3;
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
      {
        v6 = v5;
        v19 = v3;
        v20 = v2;
        v7 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v23 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            v10 = (void *)MEMORY[0x19AEC1554]();
            objc_msgSend(v9, "fileURL");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "path");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v12, "isEqualToString:", *(_QWORD *)(a1 + 56)) & 1) == 0)
            {
              v13 = *(void **)(a1 + 64);
              v21 = 0;
              v14 = objc_msgSend(v13, "removeItemAtPath:error:", v12, &v21);
              v15 = v21;
              if ((v14 & 1) == 0 && !*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v28 = v12;
                  _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "failed to remove derivative file %@ for duplicated asset", buf, 0xCu);
                }

              }
            }
            objc_msgSend(v9, "markAsNotLocallyAvailable", v19, v20);

            objc_autoreleasePoolPop(v10);
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v6);
        v3 = v19;
        v2 = v20;
      }
    }
    else
    {
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_25:

        goto LABEL_26;
      }
      __CPLAssetsdOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v28 = v18;
        v29 = 2112;
        v30 = v2;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "unable to find uploaded cloud resource %@ in cloudMaster %@", buf, 0x16u);
      }
    }

    goto LABEL_25;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "unable to find cloud master for uploaded resource %@", buf, 0xCu);
    }
    goto LABEL_25;
  }
LABEL_26:

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPerson personsToUploadInManagedObjectContext:limit:](PLPerson, "personsToUploadInManagedObjectContext:limit:", v2, 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v9 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending people", buf, 0xCu);
    }

  }
  objc_msgSend(a1[5], "_personsToUploadIncludingReverseOrderedMergeTargetsForPersons:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_133;
  v6[3] = &unk_1E366FED0;
  v7 = a1[6];
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[PLFaceCrop faceCropsToUploadInPhotoLibrary:limit:](PLFaceCrop, "faceCropsToUploadInPhotoLibrary:limit:", *(_QWORD *)(a1 + 32), 50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending faceCrops", buf, 0xCu);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_134;
  v4[3] = &unk_1E365FC20;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_136(id *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1[4], "count"))
  {
    +[PLGenericAlbum albumsToUploadInitiallyInLibrary:limit:](PLGenericAlbum, "albumsToUploadInitiallyInLibrary:limit:", a1[5], 100);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "addObjectsFromArray:", v2);
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = objc_msgSend(a1[4], "count");
        v9 = 134217984;
        v10 = v4;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending albums", (uint8_t *)&v9, 0xCu);
      }

    }
  }
  if (!objc_msgSend(a1[6], "count"))
  {
    objc_msgSend(a1[5], "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetsToUploadInitiallyInManagedObjectContext:limit:](PLManagedAsset, "assetsToUploadInitiallyInManagedObjectContext:limit:", v5, 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[6], "addObjectsFromArray:", v6);
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(a1[6], "count");
        v9 = 134217984;
        v10 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Found %lu pending assets", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_137(uint64_t a1)
{
  id v2;

  +[PLManagedAsset assetsToRetryInLibrary:limit:](PLManagedAsset, "assetsToRetryInLibrary:limit:", *(_QWORD *)(a1 + 32), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v2);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_138(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PLDetectedFace syncableFacesToUploadInitiallyInLibrary:limit:](PLDetectedFace, "syncableFacesToUploadInitiallyInLibrary:limit:", *(_QWORD *)(a1 + 32), 50);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending syncable faces", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "associatedAssetForFaceOrTorso:orTemporal:", 1, 0, (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    objc_msgSend(*(id *)(a1 + 40), "_processPendingObjects:withBatchManager:inLibrary:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_139(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[PLMemory memoriesToUploadInPhotoLibrary:limit:](PLMemory, "memoriesToUploadInPhotoLibrary:limit:", *(_QWORD *)(a1 + 32), 100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending memories", buf, 0xCu);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_140;
  v4[3] = &unk_1E36650C8;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_142(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[PLSuggestion suggestionsToUploadInPhotoLibrary:limit:](PLSuggestion, "suggestionsToUploadInPhotoLibrary:limit:", *(_QWORD *)(a1 + 32), 100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v7 = objc_msgSend(v2, "count");
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Found %lu pending suggestions", buf, 0xCu);
    }

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_143;
  v4[3] = &unk_1E365FC48;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v4);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_145(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUserFeedback userFeedbacksToUploadInManagedObjectContext:limit:](PLUserFeedback, "userFeedbacksToUploadInManagedObjectContext:limit:", v2, 100);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending user feedbacks", buf, 0xCu);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_146;
  v5[3] = &unk_1E365FC70;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_2_148(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSocialGroup socialGroupsToUploadInManagedObjectContext:limit:](PLSocialGroup, "socialGroupsToUploadInManagedObjectContext:limit:", v2, 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Found %lu pending social groups", buf, 0xCu);
    }

  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_150;
  v5[3] = &unk_1E365FC98;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_150(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplSocialGroupChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_146(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplSuggestionChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_143(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplSuggestionChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_140(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplMemoryChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_134(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplFaceCropChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

void __54__PLCloudBatchUploader_uploadFullPhotoLibraryToCloud___block_invoke_133(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "cplPersonChange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRecord:", v3);

}

uint64_t __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendOneBatch:toBatchManager:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __74__PLCloudBatchUploader__processPendingObjects_withBatchManager_inLibrary___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendOneBatch:toBatchManager:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __61__PLCloudBatchUploader__sendAssets_toBatchManager_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cplMasterChangeInLibrary:shouldGenerateDerivatives:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 33));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPhotoIris") & 1) != 0)
  {
    v6 = 18;
  }
  else if ((objc_msgSend(v3, "isRAWPlusJPEG") & 1) != 0)
  {
    v6 = 17;
  }
  else
  {
    if (!objc_msgSend(v3, "isRAWOnly"))
      goto LABEL_13;
    v6 = 2;
  }
  if (objc_msgSend(v4, "hasResourceOfType:notInMasterChange:", v6, v5))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412802;
        v10 = v4;
        v11 = 2112;
        v12 = v5;
        v13 = 2114;
        v14 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Using duplicate master change %@ instead of %@ because it has an additional resource of type: %{public}@", (uint8_t *)&v9, 0x20u);

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 56));
  }
LABEL_13:

}

uint64_t __61__PLCloudBatchUploader__sendAssets_toBatchManager_inLibrary___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  if (objc_msgSend(v6, "isCloudPhotoLibraryAsset")
    && !objc_msgSend(v7, "isCloudPhotoLibraryAsset"))
  {
    goto LABEL_7;
  }
  if ((objc_msgSend(v6, "isCloudPhotoLibraryAsset") & 1) == 0
    && (objc_msgSend(v7, "isCloudPhotoLibraryAsset") & 1) != 0)
  {
LABEL_11:
    v11 = 1;
    goto LABEL_19;
  }
  objc_msgSend(v6, "cloudAssetGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v7, "cloudAssetGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (!v10)
    {
LABEL_7:
      v11 = -1;
      goto LABEL_19;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "cloudAssetGUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v7, "cloudAssetGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v6, "dateCreated");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_15;
  v16 = (void *)v15;
  objc_msgSend(v6, "dateCreated");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateCreated");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v17, "compare:", v18);

  if (!v11)
  {
LABEL_15:
    objc_msgSend(v6, "addedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v6, "addedDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addedDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v20, "compare:", v21);

    }
    else
    {
      v11 = 0;
    }

  }
LABEL_19:

  return v11;
}

void __63__PLCloudBatchUploader__sendOneBatch_toBatchManager_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
LABEL_5:
    objc_msgSend(v4, "addObject:", v3);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Unsupported object %@ to be uploaded", (uint8_t *)&v6, 0xCu);
    }

  }
LABEL_10:

}

void __70__PLCloudBatchUploader__incrementUploadAttemptsAndPushStateForAssets___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t i;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v2)
  {
    v4 = v2;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    v7 = (_BYTE *)MEMORY[0x1E0D115D0];
    *(_QWORD *)&v3 = 67109378;
    v14 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v1);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "incrementUploadAttempts", v14, (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setLastUploadAttemptDate:", v10);

        if ((int)objc_msgSend(v9, "uploadAttempts") >= 10)
        {
          if (!*v7)
          {
            __CPLAssetsdOSLogDomain();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = objc_msgSend(v9, "uploadAttempts");
              *(_DWORD *)buf = v14;
              v20 = v12;
              v21 = 2112;
              v22 = v9;
              _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Retried %d time for asset %@, giving up", buf, 0x12u);
            }

          }
          if (objc_msgSend(v9, "cloudLocalState") != 2)
          {
            objc_msgSend(v9, "setCloudLocalState:", 2);
            v5 = 1;
          }
        }
      }
      v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v4);

    if ((v5 & 1) != 0)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.failedtopush"), 0, 0, 0);
    }
  }
  else
  {

  }
}

void __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "personUUID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v10, "personUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(v10, "cplPersonChange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addRecord:", v7);
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v10, "personUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

void __120__PLCloudBatchUploader_createBatchesForChanges_outInsertedPhotoCount_outInsertedVideoCount_withUploadTracker_inLibrary___block_invoke_103(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "supportsCloudUpload"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v5, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __152__PLCloudBatchUploader_handleUploadBatchesFromLocalEvent_outInsertedPhotoCount_outInsertedVideoCount_shouldTriggerPrefetch_withUploadTracker_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_fetchChangesFromLocalEvent:shouldTriggerPrefetch:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v2, "insertedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_incrementUploadAttemptsAndPushStateForAssets:", v4);

  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "summaryCounts");
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Upload changes: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  if (!objc_msgSend(v2, "isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 32), "createBatchesForChanges:outInsertedPhotoCount:outInsertedVideoCount:withUploadTracker:inLibrary:", v2, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!*v5)
    {
      __CPLAssetsdOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "batches = %@", (uint8_t *)&v10, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "addBatches:", v8);
    goto LABEL_14;
  }
  if (!*v5)
  {
    __CPLAssetsdOSLogDomain();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "ignoring this event for now, no change", (uint8_t *)&v10, 2u);
    }
LABEL_14:

  }
}

@end
