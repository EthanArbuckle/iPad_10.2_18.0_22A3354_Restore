@implementation PLDuplicateProcessor

- (PLDuplicateProcessor)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLDuplicateProcessor *v6;
  PLDuplicateProcessor *v7;
  NSMutableSet *v8;
  NSMutableSet *inFlightMergeAssetUuids;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  PLLazyObject *lazyAppPrivateData;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  id (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id location[2];
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PLDuplicateProcessor;
  v6 = -[PLDuplicateProcessor init](&v28, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lsm, a3);
    v7->_processingLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    inFlightMergeAssetUuids = v7->_inFlightMergeAssetUuids;
    v7->_inFlightMergeAssetUuids = v8;

    v7->_inFlightMergeLock._os_unfair_lock_opaque = 0;
    v10 = objc_initWeak(location, v7);

    v11 = objc_alloc(MEMORY[0x1E0D73248]);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __55__PLDuplicateProcessor_initWithLibraryServicesManager___block_invoke;
    v24 = &unk_1E3670E50;
    objc_copyWeak(&v26, location);
    v12 = v5;
    v25 = v12;
    v13 = objc_msgSend(v11, "initWithBlock:", &v21);

    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
    lazyAppPrivateData = v7->_lazyAppPrivateData;
    v7->_lazyAppPrivateData = (PLLazyObject *)v13;

    v7->_enableEXIFDataAccess = 1;
    v15 = PLIsReallyAssetsd();
    if ((v15 & 1) == 0 && !MEMORY[0x19AEC0720](v15, v16, v17, v18))
      goto LABEL_5;
    if (!+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v12, v21, v22, v23, v24))
    {
LABEL_5:
      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Processing: invalid platform or library", (uint8_t *)location, 2u);
      }

      v7 = 0;
    }
  }

  return v7;
}

- (id)_photoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  id v7;

  -[PLDuplicateProcessor unitTestLibrary](self, "unitTestLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLDuplicateProcessor unitTestLibrary](self, "unitTestLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", objc_msgSend(v7, "UTF8String"));

  }
  return v4;
}

- (id)_appPrivateData
{
  return (id)-[PLLazyObject objectValue](self->_lazyAppPrivateData, "objectValue");
}

- (BOOL)_isValidSharedLibraryStateWithLibrary:(id)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = +[PLDuplicateProcessor isExitingSharedLibraryForLibrary:](PLDuplicateProcessor, "isExitingSharedLibraryForLibrary:", a3);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D74498];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("Duplicate processing shared library is exiting");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 49406, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      *a4 = objc_retainAutorelease(v9);

  }
  return !v5;
}

- (BOOL)processDuplicatesOfAssetObjectIds:(id)a3 processingType:(unint64_t)a4 error:(id *)a5 continuationHandler:(id)a6
{
  id v10;
  id v11;
  os_unfair_lock_s *p_processingLock;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if ((PLIsAssetsd() & 1) != 0 || (PLIsInternalTool() & 1) != 0 || (MEMORY[0x19AEC0720]() & 1) != 0)
  {
    p_processingLock = &self->_processingLock;
    os_unfair_lock_lock(&self->_processingLock);
    -[PLDuplicateProcessor _photoLibrary](self, "_photoLibrary");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __99__PLDuplicateProcessor_processDuplicatesOfAssetObjectIds_processingType_error_continuationHandler___block_invoke;
    v24[3] = &unk_1E365FD20;
    v24[4] = self;
    v25 = (id)v13;
    v26 = a4;
    v15 = (id)v13;
    LOBYTE(v13) = -[PLDuplicateProcessor _batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:library:error:continuationHandler:processingBatchBlock:](self, "_batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:library:error:continuationHandler:processingBatchBlock:", v14, v15, &v27, v11, v24);
    v16 = v27;

    os_unfair_lock_unlock(p_processingLock);
    v17 = v16;
    if ((v13 & 1) != 0)
    {
      v18 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0D74498];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = CFSTR("processing duplicates needs to be performed on the service");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 41005, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v22;
  }
  if (a5)
  {
    v17 = objc_retainAutorelease(v17);
    v18 = 0;
    *a5 = v17;
  }
  else
  {
    v18 = 0;
  }
LABEL_10:

  return v18;
}

- (BOOL)_batchEnumerateOrGenerateAssetObjectIdsFromStartingAssetOIDs:(id)a3 library:(id)a4 error:(id *)a5 continuationHandler:(id)a6 processingBatchBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  char v26;
  id v27;
  id v28;
  BOOL v29;
  PLDuplicateProcessor *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t (**v34)(id);
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (**v50)(id, id, id *);
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v50 = (uint64_t (**)(id, id, id *))a7;
  v15 = v12;
  v53 = v14;
  if (objc_msgSend(v15, "count"))
  {
    if (v14 && (unint64_t)objc_msgSend(v15, "count") >= 0x5DD)
    {
      v16 = (void *)MEMORY[0x19AEC1554]();
      -[PLDuplicateProcessor _buildInterruptBatchFromStartingOIDs:library:](self, "_buildInterruptBatchFromStartingOIDs:library:", v15, v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v16);
      v18 = 0;
    }
    else
    {
      v18 = 0;
      v17 = v15;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x19AEC1554]();
    v58 = 0;
    -[PLDuplicateProcessor _fetchAssetOIDsForPhotoLibrary:error:](self, "_fetchAssetOIDsForPhotoLibrary:error:", v13, &v58);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v58;
    if (!v20)
    {
      objc_autoreleasePoolPop(v19);
      v17 = v15;
      goto LABEL_42;
    }
    v21 = objc_msgSend(v20, "count");
    if (v21 >= 0x5DD)
      v22 = v20;
    else
      v22 = 0;
    v17 = v22;

    if (v14 && v21 >= 0x5DD)
    {
      -[PLDuplicateProcessor _buildInterruptBatchFromStartingOIDs:library:](self, "_buildInterruptBatchFromStartingOIDs:library:", v17, v13);
      v23 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v23;
    }

    objc_autoreleasePoolPop(v19);
  }
  if ((unint64_t)objc_msgSend(v17, "count") <= 0x5DC)
  {
    v57 = v18;
    v24 = -[PLDuplicateProcessor _isValidSharedLibraryStateWithLibrary:error:](self, "_isValidSharedLibraryStateWithLibrary:error:", v13, &v57);
    v25 = v57;

    if (v24)
    {
      v56 = v25;
      v26 = v50[2](v50, v17, &v56);
      v27 = v56;

      v28 = v27;
      if ((v26 & 1) != 0)
        goto LABEL_36;
      goto LABEL_17;
    }
    v18 = v25;
LABEL_42:
    v28 = v18;
    if (a5)
      goto LABEL_18;
    goto LABEL_43;
  }
  v30 = self;
  v31 = objc_msgSend(v17, "count");
  if (!v31)
  {
    v44 = v53;
    if (v53)
      -[PLDuplicateProcessor _setInterruptMarker:](self, "_setInterruptMarker:", 0);
    v28 = v18;
    v29 = 1;
    goto LABEL_45;
  }
  v32 = v31;
  v51 = v13;
  v52 = v17;
  v46 = a5;
  v47 = v15;
  v33 = 0;
  v49 = *MEMORY[0x1E0D74498];
  v48 = *MEMORY[0x1E0CB2D50];
  v34 = (uint64_t (**)(id))v53;
  do
  {
    v35 = (void *)MEMORY[0x19AEC1554]();
    if (v33 + 1500 <= v32)
      v36 = 1500;
    else
      v36 = v32 - v33;
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v33, v36);
    objc_msgSend(v52, "objectsAtIndexes:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34 && (v34[2](v34) & 1) == 0)
    {
      objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLDuplicateProcessor _setInterruptMarker:](v30, "_setInterruptMarker:", v41);

      v42 = (void *)MEMORY[0x1E0CB35C8];
      v59 = v48;
      v60[0] = CFSTR("Duplicate processing was cancelled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", v49, 49406, v43);
      v40 = (id)objc_claimAutoreleasedReturnValue();

      v39 = 0;
LABEL_29:
      v18 = v40;
      goto LABEL_30;
    }
    v55 = v18;
    v39 = -[PLDuplicateProcessor _isValidSharedLibraryStateWithLibrary:error:](v30, "_isValidSharedLibraryStateWithLibrary:error:", v51, &v55, v46, v47);
    v40 = v55;

    if (!v39)
      goto LABEL_29;
    v54 = v40;
    v39 = v50[2](v50, v38, &v54);
    v18 = v54;

    v33 += v36;
LABEL_30:

    objc_autoreleasePoolPop(v35);
    v34 = (uint64_t (**)(id))v53;
  }
  while (v39 && v33 < v32);
  if (v53 && ((v39 ^ 1) & 1) == 0)
    -[PLDuplicateProcessor _setInterruptMarker:](v30, "_setInterruptMarker:", 0);
  v28 = v18;
  v13 = v51;
  v17 = v52;
  a5 = v46;
  v15 = v47;
  if ((v39 & 1) != 0)
  {
LABEL_36:
    v29 = 1;
    goto LABEL_44;
  }
LABEL_17:
  if (a5)
  {
LABEL_18:
    v28 = objc_retainAutorelease(v28);
    v29 = 0;
    *a5 = v28;
    goto LABEL_44;
  }
LABEL_43:
  v29 = 0;
LABEL_44:
  v44 = v53;
LABEL_45:

  return v29;
}

- (void)_setInterruptMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URIRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[PLDuplicateProcessor _appPrivateData](self, "_appPrivateData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v8, "setValue:forKey:error:", v7, CFSTR("DuplicateProcessingLibraryInterruptMarker"), &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to set the interrupt marker. Error: %@", buf, 0xCu);
    }

  }
}

- (id)_resumeInterruptMarker
{
  void *v2;
  void *v3;

  -[PLDuplicateProcessor _appPrivateData](self, "_appPrivateData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("DuplicateProcessingLibraryInterruptMarker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_buildInterruptBatchFromStartingOIDs:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_814);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateProcessor _resumeInterruptMarker](self, "_resumeInterruptMarker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "indexOfObject:", v10);
  v12 = v7;
  if (v11)
  {
    v12 = v7;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "subarrayWithRange:", v11, objc_msgSend(v7, "count") - v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v12;
}

- (BOOL)_processDuplicatesWithPhotoLibrary:(id)a3 processingType:(unint64_t)a4 assetObjectIds:(id)a5 error:(id *)a6
{
  char v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  PLDuplicateDetectorMetadata *v21;
  PLDuplicateProcessor *v22;
  id v23;
  _BOOL4 v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  PLDuplicateDetectorExactPixel *v30;
  _BOOL4 v31;
  void *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  BOOL v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  char v43;
  PLDuplicateProcessor *v45;
  void *v46;
  id *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v8 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 1) == 0)
    goto LABEL_7;
  if (PLIsInternalTool())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("com.apple.Photos.backend.disableFingerprintDuplicateProcessing"));

    if ((v14 & 1) != 0)
    {
      PLDuplicateDetectionGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata matching disabled via defaults: com.apple.Photos.backend.disableFingerprintDuplicateProcessing", buf, 2u);
      }

LABEL_7:
      v16 = 0;
      if ((v8 & 2) == 0)
        goto LABEL_8;
      goto LABEL_16;
    }
  }
  v46 = v12;
  v47 = a6;
  PLDuplicateDetectionGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata duplicate matching", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  v21 = -[PLDuplicateDetectorMetadata initWithSourceOIDs:]([PLDuplicateDetectorMetadata alloc], "initWithSourceOIDs:", v11);
  v49 = 0;
  v45 = self;
  v22 = self;
  v23 = v10;
  v24 = -[PLDuplicateProcessor _detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:detector:duplicateType:error:](v22, "_detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:detector:duplicateType:error:", v10, v21, 1, &v49);
  v17 = v49;
  objc_msgSend(v19, "stop");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PLDuplicateDetectionGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v19, "perfCheckLogStringWithPerfCheckInfo:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v27;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: metadata matching completed%@", buf, 0xCu);

  }
  if (!v24)
  {
    v37 = 0;
    v10 = v23;
    goto LABEL_30;
  }
  v16 = v17;
  v10 = v23;
  v11 = v20;
  v12 = v46;
  a6 = v47;
  self = v45;
  if ((v8 & 2) == 0)
  {
LABEL_8:
    v17 = v16;
    if ((v8 & 4) == 0)
      goto LABEL_27;
    goto LABEL_22;
  }
LABEL_16:
  v46 = v12;
  v47 = a6;
  PLDuplicateDetectionGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: exact pixel matching", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73300], "start");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  v30 = -[PLDuplicateDetectorExactPixel initWithSourceOIDs:]([PLDuplicateDetectorExactPixel alloc], "initWithSourceOIDs:", v11);
  v48 = v16;
  v31 = -[PLDuplicateProcessor _detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:detector:duplicateType:error:](self, "_detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:detector:duplicateType:error:", v10, v30, 2, &v48);
  v17 = v48;

  objc_msgSend(v29, "stop");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  PLDuplicateDetectionGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v29, "perfCheckLogStringWithPerfCheckInfo:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v34;
    _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: exact pixel matching completed%@", buf, 0xCu);

  }
  if (v31)
  {
    v11 = v20;
    v12 = v46;
    a6 = v47;
    if ((v8 & 4) == 0)
    {
LABEL_27:
      v37 = 1;
      goto LABEL_31;
    }
LABEL_22:
    PLDuplicateDetectionGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: similar matching", buf, 2u);
    }

    PLDuplicateDetectionGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Similar pixel matching currently unsupported", buf, 2u);
    }

    goto LABEL_27;
  }
  v37 = 0;
LABEL_30:
  v11 = v20;
  v12 = v46;
  a6 = v47;
LABEL_31:
  objc_msgSend(v12, "stop");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  PLDuplicateDetectionGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "perfCheckLogStringWithPerfCheckInfo:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v51 = v40;
    _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: completed%@", buf, 0xCu);

  }
  v41 = v17;
  v42 = v41;
  if (a6)
    v43 = v37;
  else
    v43 = 1;
  if ((v43 & 1) == 0)
    *a6 = objc_retainAutorelease(v41);

  return v37;
}

- (BOOL)_detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary:(id)a3 detector:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  id v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  int v25;
  BOOL v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  PLDuplicateProcessor *v33;
  id v34;
  uint64_t *v35;
  __int128 *p_buf;
  signed __int16 v37;
  id obj;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t v43[4];
  void *v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49[3];

  v49[2] = *(id *)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateProcessor.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detector"));

  }
  PLDuplicateDetectionGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: detecting duplicates with detector: %{public}@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__713;
  v48 = __Block_byref_object_dispose__714;
  v49[0] = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  obj = 0;
  objc_msgSend(v12, "detectDuplicatesWithPhotoLibrary:error:", v11, &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v49, obj);
  if (v16)
  {
    v17 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke;
    v31[3] = &unk_1E36633E8;
    v18 = v16;
    v35 = &v39;
    v32 = v18;
    v33 = self;
    v37 = a5;
    v34 = v11;
    p_buf = &buf;
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke_55;
    v29[3] = &unk_1E3677AA0;
    v30 = v34;
    objc_msgSend(v30, "performTransactionAndWait:completionHandler:", v31, v29);
    if (!objc_msgSend(v18, "count"))
    {
      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v43 = 138412290;
        v44 = v21;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: completed for %@ with no matches detected", v43, 0xCu);

      }
    }

    if (*((_BYTE *)v40 + 24))
    {
      v22 = *(id *)(*((_QWORD *)&buf + 1) + 40);
      goto LABEL_18;
    }
  }
  else
  {
    *((_BYTE *)v40 + 24) = 0;
  }
  PLDuplicateDetectionGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v43 = 138412290;
    v44 = v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Duplicate Processing: failed. Error: %@", v43, 0xCu);
  }

  v25 = *((unsigned __int8 *)v40 + 24);
  v22 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  if (!v25 && a6)
  {
    v22 = objc_retainAutorelease(v22);
    *a6 = v22;
  }
LABEL_18:

  v26 = *((_BYTE *)v40 + 24) != 0;
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&buf, 8);

  return v26;
}

- (BOOL)_processedDuplicateAssetSubGroupWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v23 = 0;
  v24 = 0;
  -[PLDuplicateProcessor _processedDuplicateAssetsWithPhotoLibrary:assetObjectIDs:duplicateType:associatedDuplicateAlbum:error:](self, "_processedDuplicateAssetsWithPhotoLibrary:assetObjectIDs:duplicateType:associatedDuplicateAlbum:error:", v10, a4, v7, &v24, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  v13 = v23;
  v14 = v13;
  if (!v11)
  {
    v17 = v13;
    if (a6)
      goto LABEL_5;
LABEL_7:
    v18 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v11, "count"))
  {
    PLDuplicateDetectionGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: no new assets to add to duplicate album %{public}@", buf, 0xCu);

    }
    v17 = v14;
    goto LABEL_11;
  }
  v22 = v14;
  v15 = -[PLDuplicateProcessor _insertIntoDuplicateAlbum:assets:duplicateType:photoLibrary:error:](self, "_insertIntoDuplicateAlbum:assets:duplicateType:photoLibrary:error:", v12, v11, v7, v10, &v22);
  v16 = v22;

  v17 = v16;
  if (v15)
  {
LABEL_11:
    v18 = 1;
    goto LABEL_12;
  }
  if (!a6)
    goto LABEL_7;
LABEL_5:
  v17 = objc_retainAutorelease(v17);
  v18 = 0;
  *a6 = v17;
LABEL_12:

  return v18;
}

- (id)_processedDuplicateAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 duplicateType:(signed __int16)a5 associatedDuplicateAlbum:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  id v29;
  uint8_t buf[16];
  id v31;
  id v32;

  v9 = a5;
  v32 = 0;
  -[PLDuplicateProcessor _fetchAssetsWithPhotoLibrary:assetObjectIDs:error:](self, "_fetchAssetsWithPhotoLibrary:assetObjectIDs:error:", a3, a4, &v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v32;
  if (v11)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PLDuplicateProcessor _duplicateAlbumsFromAssets:](self, "_duplicateAlbumsFromAssets:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v31 = v12;
      v16 = -[PLDuplicateProcessor _moveDuplicateAlbumAssestFromAlbums:toTargetAlbum:duplicateType:error:](self, "_moveDuplicateAlbumAssestFromAlbums:toTargetAlbum:duplicateType:error:", v14, v15, v9, &v31);
      v29 = v31;

      if (!v16)
      {
        v18 = 0;
        v17 = (id)MEMORY[0x1E0C9AA60];
        v12 = v29;
        goto LABEL_19;
      }
      if ((_DWORD)v9 == 1)
        objc_msgSend(v15, "metadataMatchingAssets");
      else
        objc_msgSend(v15, "perceptualMatchingAssets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filteredSetUsingPredicate:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22 == objc_msgSend(v13, "count"))
        objc_msgSend(v13, "removeAllObjects");

      v12 = v29;
    }
    if (objc_msgSend(v13, "count"))
    {
      v17 = v13;
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "Duplicate Processing: no new duplicate assets added, skipping", buf, 2u);
      }

      v17 = (id)MEMORY[0x1E0C9AA60];
    }
    v18 = 1;
LABEL_19:

    if (!a6)
      goto LABEL_21;
    goto LABEL_20;
  }
  v15 = 0;
  v17 = 0;
  v18 = 0;
  if (a6)
LABEL_20:
    *a6 = objc_retainAutorelease(v15);
LABEL_21:
  v24 = v12;
  v25 = v24;
  if (a7)
    v26 = v18;
  else
    v26 = 1;
  if ((v26 & 1) == 0)
    *a7 = objc_retainAutorelease(v24);

  v27 = v17;
  return v27;
}

- (BOOL)_processedRemoveExclusionGroupAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  v9 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  v20 = 0;
  v13 = objc_msgSend((id)objc_opt_class(), "_removeAssetsFromDuplicateAlbumUsingFetchRequest:library:error:", v11, v9, &v20);

  v14 = v20;
  PLDuplicateDetectionGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_INFO, "Duplicate Processing: Removed excluded asset from duplicate albums", buf, 2u);
    }

    v17 = v14;
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to remove excluded assets from duplicate albums. Error: %@", buf, 0xCu);
    }

    v18 = v14;
    if (a5)
      *a5 = objc_retainAutorelease(v18);
  }

  return v13;
}

- (id)_fetchAssetsWithPhotoLibrary:(id)a3 assetObjectIDs:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  v9 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  v35[0] = CFSTR("albums");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", v13);

  v14 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(v9, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startedQueryStatsWithContext:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v11, &v28);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (__CFString *)v28;

  objc_msgSend(v16, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v18, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    PLDuplicateDetectionGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v23;
      v31 = 2112;
      v32 = CFSTR("Duplicate Processing: Fetch assets");
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (!v18)
  {
    PLDuplicateDetectionGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);

    }
    if (a5)
      *a5 = objc_retainAutorelease(v19);
  }

  return v18;
}

- (id)_fetchAssetOIDsForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PLDuplicateProcessor *v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__713;
  v19 = __Block_byref_object_dispose__714;
  v20 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PLDuplicateProcessor__fetchAssetOIDsForPhotoLibrary_error___block_invoke;
  v10[3] = &unk_1E3674DF8;
  v7 = v6;
  v11 = v7;
  v12 = self;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)_moveDuplicateAlbumAssestFromAlbums:(id)a3 toTargetAlbum:(id)a4 duplicateType:(signed __int16)a5 error:(id *)a6
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  BOOL v34;
  id *v36;
  id v37;
  NSObject *v38;
  unsigned int v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  const __CFString *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v40 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v13 = 0;
LABEL_30:
    v33 = v13;
    v34 = 1;
    goto LABEL_31;
  }
  if (v9)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v37 = v8;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v11)
    {
      v12 = v11;
      v36 = a6;
      v13 = 0;
      v14 = *(_QWORD *)v43;
      v38 = v10;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isEqual:", v9, v36) & 1) == 0)
          {
            objc_msgSend(v16, "assets");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (v18)
            {
              PLDuplicateDetectionGetLog();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v49 = v18;
                v50 = 2114;
                v51 = v20;
                _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Relocating %tu matching assets from album: %{public}@", buf, 0x16u);

              }
              if (v40 == 1)
              {
                PLDuplicateDetectionGetLog();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(CFSTR("PLDuplicateTypeMetadata"), "substringFromIndex:", objc_msgSend(CFSTR("PLDuplicateType"), "length"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v49 = (uint64_t)v22;
                  _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Duplicate Processing: Duplicate assets from detector %{public}@ is associated with multiple albums", buf, 0xCu);

                }
              }
              objc_msgSend(v16, "assets");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "array");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = v13;
              v25 = v9;
              v26 = -[PLDuplicateProcessor _insertIntoDuplicateAlbum:assets:duplicateType:photoLibrary:error:](self, "_insertIntoDuplicateAlbum:assets:duplicateType:photoLibrary:error:", v9, v24, v40, 0, &v41);
              v27 = v41;

              if (!v26)
              {
                a6 = v36;
                v8 = v37;
                v31 = v38;
                v9 = v25;
                goto LABEL_25;
              }
              objc_msgSend(v16, "delete");
              v13 = v27;
              v10 = v38;
              v9 = v25;
            }
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v12)
          continue;
        break;
      }
    }
    else
    {
      v13 = 0;
    }

    v8 = v37;
    goto LABEL_30;
  }
  v28 = (void *)MEMORY[0x1E0CB35C8];
  v29 = *MEMORY[0x1E0D74498];
  v46 = *MEMORY[0x1E0CB2D50];
  v47 = CFSTR("Missing target album required for duplicate asset relocation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 49404, v30);
  v27 = (id)objc_claimAutoreleasedReturnValue();

  PLDuplicateDetectionGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v49 = (uint64_t)v27;
    _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Duplicate Processing: target album not specified for asset relocation. Error: %@", buf, 0xCu);
  }
LABEL_25:

  v32 = v27;
  v33 = v32;
  if (a6)
  {
    v33 = objc_retainAutorelease(v32);
    v34 = 0;
    *a6 = v33;
  }
  else
  {
    v34 = 0;
  }
LABEL_31:

  return v34;
}

- (BOOL)_insertIntoDuplicateAlbum:(id)a3 assets:(id)a4 duplicateType:(signed __int16)a5 photoLibrary:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  __CFString *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v9 = a5;
  v40[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v11;
  if (v11
    || (+[PLDuplicateAlbum insertIntoPhotoLibrary:](PLDuplicateAlbum, "insertIntoPhotoLibrary:", v13),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v14, "addAssets:type:", v12, v9);
    objc_msgSend(v14, "sortAssets");
    PFMap();
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v12, "count");
      if (v11)
        v18 = CFSTR("e");
      else
        v18 = CFSTR("n");
      objc_msgSend(v14, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString componentsJoinedByString:](v15, "componentsJoinedByString:", CFSTR(","));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 134218754;
      v32 = v17;
      v33 = 2114;
      v34 = v18;
      v35 = 2114;
      v36 = v19;
      v37 = 2114;
      v38 = v20;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Duplicate Processing: Added %tu assets to duplicate album [%{public}@/%{public}@], assets:[%{public}@]", (uint8_t *)&v31, 0x2Au);

    }
    v21 = 1;
  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D74498];
    v39 = *MEMORY[0x1E0CB2D50];
    v40[0] = CFSTR("Unable to create duplicate album");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 49404, v25);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    PLDuplicateDetectionGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = (uint64_t)v29;
      v33 = 2112;
      v34 = v26;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to create a new duplicate album: %{public}@. Error: %@", (uint8_t *)&v31, 0x16u);

    }
    v30 = v26;
    v15 = v30;
    if (a7)
    {
      v15 = objc_retainAutorelease(v30);
      v21 = 0;
      *a7 = v15;
      v14 = v15;
    }
    else
    {
      v21 = 0;
      v14 = v30;
    }
  }

  return v21;
}

- (id)_duplicateAlbumsFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "albums", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v16, "isDuplicateAlbum") && (objc_msgSend(v16, "isDeleted") & 1) == 0)
              {
                objc_msgSend(v4, "addObject:", v16);
                goto LABEL_17;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_17:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isMerging
{
  PLDuplicateProcessor *v2;
  os_unfair_lock_s *p_inFlightMergeLock;

  v2 = self;
  p_inFlightMergeLock = &self->_inFlightMergeLock;
  os_unfair_lock_lock(&self->_inFlightMergeLock);
  LOBYTE(v2) = -[NSMutableSet count](v2->_inFlightMergeAssetUuids, "count") != 0;
  os_unfair_lock_unlock(p_inFlightMergeLock);
  return (char)v2;
}

- (BOOL)assetsArePendingForDuplicateMergeProcessing:(id)a3
{
  id v4;
  os_unfair_lock_s *p_inFlightMergeLock;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    p_inFlightMergeLock = &self->_inFlightMergeLock;
    os_unfair_lock_lock(&self->_inFlightMergeLock);
    v6 = -[NSMutableSet intersectsSet:](self->_inFlightMergeAssetUuids, "intersectsSet:", v4);
    os_unfair_lock_unlock(p_inFlightMergeLock);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)mergeDuplicateAssetsWithAssetUUIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  BOOL v9;
  void *v10;
  id *v11;
  BOOL v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  id v37;
  id obj;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__713;
  v43 = __Block_byref_object_dispose__714;
  v44 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (id *)(v40 + 5);
    obj = (id)v40[5];
    v9 = -[PLDuplicateProcessor _isMergeFeatureEnabled:](self, "_isMergeFeatureEnabled:", &obj);
    objc_storeStrong(v8, obj);
    if (v9)
    {
      -[PLDuplicateProcessor _photoLibrary](self, "_photoLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id *)(v40 + 5);
      v37 = (id)v40[5];
      v12 = -[PLDuplicateProcessor _isValidSharedLibraryStateWithLibrary:error:](self, "_isValidSharedLibraryStateWithLibrary:error:", v10, &v37);
      objc_storeStrong(v11, v37);
      if (v12)
      {
        objc_msgSend(v10, "libraryBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = PLIsCloudPhotoLibraryDisableInProgressForPhotoLibraryBundle(v13);

        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v49 = *MEMORY[0x1E0CB2D50];
          v50 = CFSTR("Cannot merge duplicates during iCPL disable");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 49409, v16);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v40[5];
          v40[5] = v17;

        }
        else
        {
          if ((PLIsAssetsd() & 1) != 0 || (PLIsInternalTool() & 1) != 0 || MEMORY[0x19AEC0720]())
          {
            objc_msgSend(v10, "managedObjectContext");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setNonCoalescing:", 1);

            if (self->_enableEXIFDataAccess)
              self->_enableEXIFDataAccess = !+[PLDuplicateDetector duplicateDetectorCompletedDateBackgroundMigrationAction:](PLDuplicateDetector, "duplicateDetectorCompletedDateBackgroundMigrationAction:", v10);
            PLDuplicateDetectionGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              if (self->_enableEXIFDataAccess)
                v25 = CFSTR("YES");
              else
                v25 = CFSTR("NO");
              v26 = v25;
              *(_DWORD *)buf = 138543362;
              v48 = v26;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Duplicate Merge Processing: enableEXIFDataAccess: %{public}@", buf, 0xCu);

            }
            objc_msgSend(v6, "allObjects");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLDuplicateProcessor _inFlightMergeAssetsAddUUIDs:](self, "_inFlightMergeAssetsAddUUIDs:", v27);

            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke;
            v32[3] = &unk_1E365FD88;
            v32[4] = self;
            v33 = v6;
            v34 = v10;
            v36 = &v39;
            v35 = v7;
            -[PLDuplicateProcessor _processCloudScopedIdentifiersFromAssetUUIDS:library:completionHandler:](self, "_processCloudScopedIdentifiersFromAssetUUIDS:library:completionHandler:", v33, v34, v32);

            goto LABEL_22;
          }
          v28 = (void *)MEMORY[0x1E0CB35C8];
          v45 = *MEMORY[0x1E0CB2D50];
          v46 = CFSTR("processing duplicates needs to be performed on the service");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41005, v29);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v40[5];
          v40[5] = v30;

        }
      }
      if (v7)
        (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v40[5]);
LABEL_22:

      goto LABEL_23;
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("Missing asset identifiers required for merge");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 49403, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v40[5];
    v40[5] = v21;

  }
  if (v7)
    (*((void (**)(id, _QWORD, uint64_t))v7 + 2))(v7, 0, v40[5]);
LABEL_23:
  _Block_object_dispose(&v39, 8);

}

- (BOOL)_processMergeAlbumAssetOIDMap:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  id v27;
  id v28;
  BOOL v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  BOOL v35;
  id v36;
  id *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v38 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v39 = a4;
  v10 = a5;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  v43 = v13;
  if (v15)
  {
    v16 = v15;
    v42 = v10;
    v17 = 0;
    v18 = *(_QWORD *)v49;
    v19 = 1;
    v40 = v9;
    while (2)
    {
      v20 = 0;
      v41 = v16;
      do
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(v14);
        objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v20), v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v21);

        if ((unint64_t)objc_msgSend(v13, "count") >= 0x65)
        {
          v22 = v14;
          v23 = (void *)MEMORY[0x19AEC1554]();
          v47 = v17;
          -[PLDuplicateProcessor _fetchAssetsFromUUIDs:library:error:](self, "_fetchAssetsFromUUIDs:library:error:", v13, v42, &v47);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v47;

          if (v24)
          {
            v46 = v25;
            v26 = -[PLDuplicateProcessor _processMergeAssets:localIdentifierMap:library:error:](self, "_processMergeAssets:localIdentifierMap:library:error:", v24, v39, v42, &v46);
            v27 = v46;

            v25 = v27;
          }
          else
          {
            v26 = 0;
          }
          v13 = v43;
          objc_msgSend(v43, "removeAllObjects");

          objc_autoreleasePoolPop(v23);
          v19 = v26;
          if (!v26)
          {
            v14 = v22;

            v17 = v25;
            v9 = v40;
            v10 = v42;
            goto LABEL_17;
          }
          v17 = v25;
          v14 = v22;
          v9 = v40;
          v16 = v41;
        }
        ++v20;
      }
      while (v16 != v20);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      if (v16)
        continue;
      break;
    }

    v10 = v42;
    if (!v19)
      goto LABEL_17;
  }
  else
  {

    v17 = 0;
  }
  if (!objc_msgSend(v13, "count", v38))
  {
    v28 = v17;
    v29 = 1;
    goto LABEL_27;
  }
  v30 = v13;
  v31 = v14;
  v32 = (void *)MEMORY[0x19AEC1554]();
  v45 = v17;
  -[PLDuplicateProcessor _fetchAssetsFromUUIDs:library:error:](self, "_fetchAssetsFromUUIDs:library:error:", v30, v10, &v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v45;

  if (!v33)
  {
    objc_autoreleasePoolPop(v32);
    v17 = v34;
    v14 = v31;
LABEL_17:
    v28 = v17;
    goto LABEL_18;
  }
  v44 = v34;
  v35 = -[PLDuplicateProcessor _processMergeAssets:localIdentifierMap:library:error:](self, "_processMergeAssets:localIdentifierMap:library:error:", v33, v39, v10, &v44);
  v36 = v44;

  objc_autoreleasePoolPop(v32);
  v28 = v36;
  if (v35)
  {
    v29 = 1;
    v14 = v31;
    goto LABEL_27;
  }
  v14 = v31;
LABEL_18:
  if (v38)
  {
    v28 = objc_retainAutorelease(v28);
    v29 = 0;
    *v38 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_27:

  return v29;
}

- (BOOL)_processMergeAssets:(id)a3 localIdentifierMap:(id)a4 library:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  id v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  __int128 *v34;
  _QWORD *v35;
  uint64_t *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint64_t *v40;
  __int128 *p_buf;
  _QWORD *v42;
  uint64_t *v43;
  _QWORD v44[4];
  id obj;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  const __CFString *v57;
  __int128 buf;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__713;
  v50 = __Block_byref_object_dispose__714;
  v51 = 0;
  obj = 0;
  v13 = -[PLDuplicateProcessor _isValidSharedLibraryStateWithLibrary:error:](self, "_isValidSharedLibraryStateWithLibrary:error:", v12, &obj);
  objc_storeStrong(&v51, obj);
  if (v13)
  {
    PLDuplicateDetectionGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v10, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: start merge processing for %tu asset", (uint8_t *)&buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x19AEC1554]();
    -[PLDuplicateProcessor _processAlbumGroupingFromAssets:localIdentifierToCloudIdentifiers:library:](self, "_processAlbumGroupingFromAssets:localIdentifierToCloudIdentifiers:library:", v10, v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      PLDuplicateDetectionGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(v17, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: merging %tu duplicate groups", (uint8_t *)&buf, 0xCu);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v59 = 0x2020000000;
      v60 = 0;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x2020000000;
      v44[3] = 0;
      v20 = MEMORY[0x1E0C809B0];
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke;
      v37[3] = &unk_1E3675CD0;
      v40 = &v52;
      v37[4] = self;
      v38 = v17;
      p_buf = &buf;
      v42 = v44;
      v39 = v12;
      v43 = &v46;
      v32[0] = v20;
      v32[1] = 3221225472;
      v32[2] = __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke_2;
      v32[3] = &unk_1E3673340;
      v33 = v39;
      v34 = &buf;
      v35 = v44;
      v36 = &v52;
      objc_msgSend(v33, "performTransactionAndWait:completionHandler:", v37, v32);

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      *((_BYTE *)v53 + 24) = 0;
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v56 = *MEMORY[0x1E0CB2D50];
      v57 = CFSTR("Duplicate merge album grouping failed to identify groups");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 49404, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v47[5];
      v47[5] = v24;

      PLDuplicateDetectionGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = v47[5];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v27;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Album grouping failure. Error: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_autoreleasePoolPop(v16);
    v28 = *((unsigned __int8 *)v53 + 24);
    v29 = (id)v47[5];
    v30 = v29;
    if (!v28 && a6)
      *a6 = objc_retainAutorelease(v29);

    v21 = *((_BYTE *)v53 + 24) != 0;
  }
  else
  {
    v21 = 0;
    if (a6)
      *a6 = objc_retainAutorelease((id)v47[5]);
  }
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
  return v21;
}

- (BOOL)_processMergeGroupContainer:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 library:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  PLDuplicateMergeCrashRecovery *v14;
  id v15;
  PLDuplicateMergeCrashRecovery *v16;
  id v17;
  void *v18;
  char v19;
  _QWORD v21[5];
  id v22;
  PLDuplicateMergeCrashRecovery *v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t *v26;
  unint64_t *v27;
  unint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _QWORD v39[4];

  v12 = a3;
  v13 = a6;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__713;
  v33 = __Block_byref_object_dispose__714;
  v34 = 0;
  v14 = -[PLDuplicateMergeCrashRecovery initWithPhotoLibrary:]([PLDuplicateMergeCrashRecovery alloc], "initWithPhotoLibrary:", v13);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __104__PLDuplicateProcessor__processMergeGroupContainer_processedAssetCount_skippedAssetCount_library_error___block_invoke;
  v21[3] = &unk_1E365FDB0;
  v24 = &v35;
  v21[4] = self;
  v27 = a4;
  v28 = a5;
  v25 = v39;
  v15 = v13;
  v22 = v15;
  v26 = &v29;
  v16 = v14;
  v23 = v16;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);
  LODWORD(v13) = *((unsigned __int8 *)v36 + 24);
  v17 = (id)v30[5];
  v18 = v17;
  if (!(_DWORD)v13 && a7)
    *a7 = objc_retainAutorelease(v17);

  v19 = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v39, 8);

  return v19;
}

- (BOOL)_processMergeGroup:(id)a3 processedAssetCount:(unint64_t *)a4 skippedAssetCount:(unint64_t *)a5 processedAssetCountAfterSave:(unint64_t *)a6 library:(id)a7 error:(id *)a8
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  BOOL v36;
  int HasDomainAndCode;
  _BOOL4 v39;
  unint64_t *v40;
  PLDuplicateProcessor *v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a7;
  objc_msgSend(a3, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_115);
  if (!v16)
  {
    PLDuplicateDetectionGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = 0;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge sort failure. Error: %@", buf, 0xCu);
    }

    v32 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") < 2)
  {
    ++*a5;
    PLDuplicateDetectionGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "shortDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = (uint64_t)v33;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: skipped single asset merge : %{public}@", buf, 0xCu);

    }
    v27 = 0;
    goto LABEL_14;
  }
  v41 = self;
  PLDuplicateDetectionGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v40 = a6;
    v19 = v17;
    v20 = v14;
    v21 = a8;
    v22 = objc_msgSend(v16, "count");
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shortDescription");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v44 = v22;
    a8 = v21;
    v14 = v20;
    v17 = v19;
    a6 = v40;
    v45 = 2114;
    v46 = v24;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: merging %tu assets using target asset %{public}@", buf, 0x16u);

  }
  objc_msgSend(v17, "assetObjectID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v26 = +[PLDuplicateMerge mergeAssets:targetAssetOID:photolibrary:error:](PLDuplicateMerge, "mergeAssets:targetAssetOID:photolibrary:error:", v16, v25, v14, &v42);
  v27 = v42;

  v28 = objc_msgSend(v16, "count");
  if (v26)
  {
    *a4 += v28;
    *a6 += objc_msgSend(v16, "count");
    PLDuplicateDetectionGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    self = v41;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v17, "shortDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = (uint64_t)v30;
      v45 = 2114;
      v46 = CFSTR("YES");
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: completed merge to target asset %{public}@. Success: %{public}@", buf, 0x16u);

    }
LABEL_14:
    v34 = 1;
    goto LABEL_15;
  }
  *a5 += v28;
  HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();
  PLDuplicateDetectionGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  v39 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
  self = v41;
  if (HasDomainAndCode)
  {
    if (v39)
    {
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v27;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: skipped merge - not ready. Error: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  if (v39)
  {
    *(_DWORD *)buf = 138412290;
    v44 = (uint64_t)v27;
    _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge failure. Error: %@", buf, 0xCu);
  }
  v34 = 0;
LABEL_15:

  objc_msgSend(v16, "valueForKey:", CFSTR("assetUUID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateProcessor _inFlightMergeAssetsRemoveUUIDs:](self, "_inFlightMergeAssetsRemoveUUIDs:", v35);

  v32 = v27;
  if ((v34 & 1) != 0)
  {
    v36 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (a8)
  {
    v32 = objc_retainAutorelease(v32);
    v36 = 0;
    *a8 = v32;
  }
  else
  {
    v36 = 0;
  }
LABEL_20:

  return v36;
}

- (id)_processAlbumGroupingFromAssets:(id)a3 localIdentifierToCloudIdentifiers:(id)a4 library:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  PLDuplicateProcessor *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke;
  v21 = &unk_1E3677998;
  v22 = v8;
  v23 = self;
  v24 = v12;
  v25 = v9;
  v13 = v9;
  v14 = v12;
  v15 = v8;
  objc_msgSend(v11, "performBlockAndWait:", &v18);

  objc_msgSend(v14, "allValues", v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_processContainersAssetUUIDS:(id)a3 library:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PLDuplicateProcessor *v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v8 >> 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __61__PLDuplicateProcessor__processContainersAssetUUIDS_library___block_invoke;
  v17[3] = &unk_1E365FDF8;
  v22 = v8;
  v23 = 100;
  v18 = v9;
  v19 = self;
  v20 = v6;
  v11 = v10;
  v21 = v11;
  v12 = v6;
  v13 = v9;
  objc_msgSend(v12, "performBlockAndWait:", v17);
  v14 = v21;
  v15 = v11;

  return v15;
}

- (void)_processCloudScopedIdentifiersFromAssetUUIDS:(id)a3 library:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isCloudPhotoLibraryEnabled"))
  {
    objc_msgSend(v9, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudPhotoLibraryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v20 = 0;
      -[PLDuplicateProcessor _fetchCloudIdentifiersFromAssetUUIDs:library:error:](self, "_fetchCloudIdentifiersFromAssetUUIDs:library:error:", v8, v9, &v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v20;
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDuplicateProcessor _processCloudScopedIdentifierFromLocalIdentifiers:localToCloudIdentifierMap:cplManager:completionHandler:](self, "_processCloudScopedIdentifierFromLocalIdentifiers:localToCloudIdentifierMap:cplManager:completionHandler:", v15, 0, v12, v10);

      }
      else if (v10)
      {
        (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v14);
      }

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D74498];
      v23 = *MEMORY[0x1E0CB2D50];
      v24[0] = CFSTR("cloudPhotolibraryManager missing for CPL enabled SPL");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 49402, v18);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      PLDuplicateDetectionGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Unable to access cloud library manager for asset merge. Error: %@", buf, 0xCu);
      }

      if (v10)
        (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v14);
    }

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, 1, 0, 0);
  }

}

- (void)_processCloudScopedIdentifierFromLocalIdentifiers:(id)a3 localToCloudIdentifierMap:(id)a4 cplManager:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  PLDuplicateProcessor *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v18)
        objc_enumerationMutation(v15);
      objc_msgSend(v14, "addObject:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v19));
      if ((unint64_t)objc_msgSend(v14, "count") > 0x1388)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v17)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v15, "minusSet:", v14);
  if (!v11)
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
  if (objc_msgSend(v14, "count"))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __129__PLDuplicateProcessor__processCloudScopedIdentifierFromLocalIdentifiers_localToCloudIdentifierMap_cplManager_completionHandler___block_invoke;
    v20[3] = &unk_1E36603D8;
    v25 = v13;
    v21 = v11;
    v22 = self;
    v23 = v15;
    v24 = v12;
    objc_msgSend(v24, "getCloudScopedIdentifiersForLocalIdentifiers:completionHandler:", v14, v20);

  }
  else if (v13)
  {
    (*((void (**)(id, uint64_t, id, _QWORD))v13 + 2))(v13, 1, v11, 0);
  }

}

- (id)_fetchAssetsFromUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  return -[PLDuplicateProcessor _fetchAssetsFromReference:isOID:library:error:](self, "_fetchAssetsFromReference:isOID:library:error:", a3, 0, a4, a5);
}

- (id)_fetchAssetsFromOIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  return -[PLDuplicateProcessor _fetchAssetsFromReference:isOID:library:error:](self, "_fetchAssetsFromReference:isOID:library:error:", a3, 1, a4, a5);
}

- (id)_fetchAssetsFromReference:(id)a3 isOID:(BOOL)a4 library:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  PLDuplicateProcessor *v22;
  uint64_t *v23;
  uint64_t *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__713;
  v36 = __Block_byref_object_dispose__714;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__713;
  v30 = __Block_byref_object_dispose__714;
  v31 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__PLDuplicateProcessor__fetchAssetsFromReference_isOID_library_error___block_invoke;
  v19[3] = &unk_1E365FE20;
  v25 = a4;
  v12 = v10;
  v20 = v12;
  v13 = v11;
  v23 = &v26;
  v24 = &v32;
  v21 = v13;
  v22 = self;
  objc_msgSend(v13, "performBlockAndWait:", v19);
  v14 = v27[5];
  v15 = (id)v33[5];
  v16 = v15;
  if (!v14 && a6)
    *a6 = objc_retainAutorelease(v15);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

- (id)_fetchCloudIdentifiersFromAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PLDuplicateProcessor *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v8 = a3;
  v9 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__713;
  v33 = __Block_byref_object_dispose__714;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__713;
  v27 = __Block_byref_object_dispose__714;
  v28 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke;
  v16[3] = &unk_1E3675150;
  v10 = v8;
  v17 = v10;
  v11 = v9;
  v18 = v11;
  v19 = self;
  v20 = &v29;
  v21 = &v23;
  v22 = &v35;
  objc_msgSend(v11, "performBlockAndWait:", v16);
  LODWORD(v9) = *((unsigned __int8 *)v36 + 24);
  v12 = (id)v30[5];
  v13 = v12;
  if (!(_DWORD)v9 && a5)
    *a5 = objc_retainAutorelease(v12);

  v14 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v14;
}

- (BOOL)_isAssetValidForMerge:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "isTrashed");
  if (objc_msgSend(v3, "isHidden"))
    v4 |= 2uLL;
  if (objc_msgSend(v3, "cloudDeleteState") == 1)
    v5 = v4 | 4;
  else
    v5 = v4;
  if (v5)
  {
    PLDuplicateDetectionGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: Duplicate asset %{public}@ is invalid for merge processing. Reason: %tu", (uint8_t *)&v9, 0x16u);

    }
  }

  return v5 == 0;
}

- (BOOL)_isMergeFeatureEnabled:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager cloudPhotoLibraryManager](self->_lsm, "cloudPhotoLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cplConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_10;
  objc_msgSend(v5, "valueForKey:", CFSTR("feature.version.duplicateprocessor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || objc_msgSend(v6, "unsignedShortValue") < 2)
  {

LABEL_10:
    v14 = 1;
    goto LABEL_11;
  }
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0D74498];
  v18 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("feature disabled by server. server version: %hu, client version: %hu"), objc_msgSend(v7, "unsignedShortValue"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 45998, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PLDuplicateDetectionGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Merged feature disabled: %{public}@", buf, 0xCu);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v12);

  v14 = 0;
LABEL_11:

  return v14;
}

- (void)_inFlightMergeAssetsAddUUIDs:(id)a3
{
  os_unfair_lock_s *p_inFlightMergeLock;
  id v5;

  p_inFlightMergeLock = &self->_inFlightMergeLock;
  v5 = a3;
  os_unfair_lock_lock(p_inFlightMergeLock);
  -[NSMutableSet addObjectsFromArray:](self->_inFlightMergeAssetUuids, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_inFlightMergeLock);
}

- (void)_inFlightMergeAssetsRemoveUUIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock(&self->_inFlightMergeLock);
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet minusSet:](self->_inFlightMergeAssetUuids, "minusSet:", v4);

  }
  os_unfair_lock_unlock(&self->_inFlightMergeLock);

}

- (PLPhotoLibrary)unitTestLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUnitTestLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestLibrary, 0);
  objc_storeStrong((id *)&self->_lazyAppPrivateData, 0);
  objc_storeStrong((id *)&self->_inFlightMergeAssetUuids, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

void __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id obj;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v28[0] = CFSTR("cloudAssetGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v6);

  objc_msgSend(v4, "setResultType:", 2);
  v7 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedQueryStatsWithContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);

  objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    PLDuplicateDetectionGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v16;
      v24 = 2112;
      v25 = CFSTR("Duplicate Processing: Fetch assets from reference");
      v26 = 2112;
      v27 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v12)
  {
    PFMap();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (!*(_QWORD *)(v20 + 40))
      *(_QWORD *)(v20 + 40) = MEMORY[0x1E0C9AA60];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }

}

uint64_t __75__PLDuplicateProcessor__fetchCloudIdentifiersFromAssetUUIDs_library_error___block_invoke_130(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("cloudAssetGUID"));
}

void __70__PLDuplicateProcessor__fetchAssetsFromReference_isOID_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  id obj;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 72))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 32), v19);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  +[PLDuplicateAsset relationshipKeyPathsForMergePrefetching](PLDuplicateAsset, "relationshipKeyPathsForMergePrefetching");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRelationshipKeyPathsForPrefetching:", v6);

  v7 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedQueryStatsWithContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v11 + 40);
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &obj);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v11 + 40), obj);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v22 = v18;
      v23 = 2112;
      v24 = CFSTR("Duplicate Processing: Fetch assets from reference");
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

}

void __129__PLDuplicateProcessor__processCloudScopedIdentifierFromLocalIdentifiers_localToCloudIdentifierMap_cplManager_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:", a2);
    objc_msgSend(*(id *)(a1 + 40), "_processCloudScopedIdentifierFromLocalIdentifiers:localToCloudIdentifierMap:cplManager:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Failed to get scoped identifiers for asset merge. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __61__PLDuplicateProcessor__processContainersAssetUUIDS_library___block_invoke(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *context;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 64))
  {
    v2 = 0;
    while (1)
    {
      context = (void *)MEMORY[0x19AEC1554]();
      v3 = *(_QWORD *)(a1 + 64);
      v4 = *(_QWORD *)(a1 + 72) + v2 <= v3 ? *(_QWORD *)(a1 + 72) : v3 - v2;
      v24 = v2;
      v20 = v4;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v2, v4);
      objc_msgSend(*(id *)(a1 + 32), "objectsAtIndexes:");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      v29 = 0;
      v21 = (void *)v5;
      objc_msgSend(v6, "_fetchAssetsFromUUIDs:library:error:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v29;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      if (v9)
        break;
LABEL_20:
      v2 = v20 + v24;

      objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reset");

      objc_autoreleasePoolPop(context);
      if ((unint64_t)(v20 + v24) >= *(_QWORD *)(a1 + 64))
        return;
    }
    v10 = v9;
    v11 = *(_QWORD *)v26;
LABEL_8:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
      objc_msgSend(v13, "duplicateAlbum", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        break;
      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Duplicate asset %{public}@ is missing a duplicate album reference", buf, 0xCu);
LABEL_17:

      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        if (!v10)
          goto LABEL_20;
        goto LABEL_8;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v16, v15);
    }
    objc_msgSend(v13, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v16, "addObject:", v17);
    goto LABEL_17;
  }
}

void __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke_2;
  v3[3] = &unk_1E3660798;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __98__PLDuplicateProcessor__processAlbumGroupingFromAssets_localIdentifierToCloudIdentifiers_library___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  PLDuplicateAsset *v11;
  void *v12;
  void *v13;
  void *v14;
  PLDuplicateAsset *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_isAssetValidForMerge:", v3);
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v23[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_duplicateAlbumsFromAssets:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);
      }
      v11 = [PLDuplicateAsset alloc];
      v12 = *(void **)(a1 + 48);
      objc_msgSend(v3, "cloudAssetGUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLDuplicateAsset initWithAsset:cloudScopedIdentifier:enableEXIFDataAccess:](v11, "initWithAsset:cloudScopedIdentifier:enableEXIFDataAccess:", v3, v14, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));

      objc_msgSend(v10, "addObject:", v15);
    }
    else
    {
      PLDuplicateDetectionGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v22 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: Duplicate asset %{public}@ is not part of a duplicate album", buf, 0xCu);

      }
      v18 = *(void **)(a1 + 32);
      objc_msgSend(v3, "uuid");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v15 = (PLDuplicateAsset *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_inFlightMergeAssetsRemoveUUIDs:", v15);
    }

  }
  else
  {
    objc_msgSend(v3, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_inFlightMergeAssetsRemoveUUIDs:", v9);
  }

}

uint64_t __124__PLDuplicateProcessor__processMergeGroup_processedAssetCount_skippedAssetCount_processedAssetCountAfterSave_library_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:enabledMergeComparison:", a3, 1);
}

void __104__PLDuplicateProcessor__processMergeGroupContainer_processedAssetCount_skippedAssetCount_library_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id obj;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 80);
  v7 = *(_QWORD *)(a1 + 88);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24;
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(v8 + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v10, "_processMergeGroup:processedAssetCount:skippedAssetCount:processedAssetCountAfterSave:library:error:", a2, v6, v7, v9, v11, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_QWORD *)(v14 + 24) >= 0x65uLL)
    {
      *(_QWORD *)(v14 + 24) = 0;
      objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v20 = *(id *)(v16 + 40);
      v17 = objc_msgSend(v15, "save:", &v20);
      objc_storeStrong((id *)(v16 + 40), v20);

      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 48), "removeCrashRecoveryMarkerFileWithError:", 0);
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        PLDuplicateDetectionGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v23 = v19;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Duplicate Merge Processing: merge save failure. Error: %@", buf, 0xCu);
        }

      }
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *a4 = 1;
}

void __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8) + 24;
  v6 = *(_QWORD *)(a1[9] + 8) + 24;
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v2, "_processMergeGroupContainer:processedAssetCount:skippedAssetCount:library:error:", v3, v5, v6, v4, &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v8;
}

void __77__PLDuplicateProcessor__processMergeAssets_localIdentifierMap_library_error___block_invoke_2(uint64_t a1)
{
  PLDuplicateMergeCrashRecovery *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[PLDuplicateMergeCrashRecovery initWithPhotoLibrary:]([PLDuplicateMergeCrashRecovery alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
  -[PLDuplicateMergeCrashRecovery removeCrashRecoveryMarkerFileWithError:](v2, "removeCrashRecoveryMarkerFileWithError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  PLDuplicateDetectionGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = v7;
    v9 = 134218498;
    v10 = v5;
    v11 = 2048;
    v12 = v6;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Duplicate Merge Processing: completed merge, processed %tu, skipped: %tu. Success: %{public}@", (uint8_t *)&v9, 0x20u);

  }
}

void __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke_2;
    v14[3] = &unk_1E3662440;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = *(id *)(a1 + 48);
    v17 = v7;
    v13 = *(_OWORD *)(a1 + 56);
    v11 = (id)v13;
    v18 = v13;
    objc_msgSend(v9, "async:identifyingBlock:library:", v14, 0, 0);

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, id))(v12 + 16))(v12, 0, v8);
  }

}

void __77__PLDuplicateProcessor_mergeDuplicateAssetsWithAssetUUIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id obj;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(a1 + 32), "_processContainersAssetUUIDS:library:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v3, "_processMergeAlbumAssetOIDMap:localIdentifierMap:library:error:", v2, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_inFlightMergeAssetsRemoveUUIDs:", v9);

  v10 = *(_QWORD *)(a1 + 64);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

uint64_t __90__PLDuplicateProcessor__insertIntoDuplicateAlbum_assets_duplicateType_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_compactDebugDescription");
}

void __61__PLDuplicateProcessor__fetchAssetOIDsForPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setResultType:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v6);

  v7 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startedQueryStatsWithContext:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v4, &v23);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (__CFString *)v23;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v11;

  objc_msgSend(v9, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLDuplicateDetectionGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v18;
      v26 = 2112;
      v27 = CFSTR("Duplicate Processing: Fetch asset oids");
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLDuplicateDetectionGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v21;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);

    }
    v22 = *(_QWORD **)(a1 + 56);
    if (v22)
      *v22 = objc_retainAutorelease(v12);
  }

}

void __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint8_t buf[16];
  id v34;
  id obj;
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
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v41;
    v30 = *(_QWORD *)v41;
LABEL_3:
    v6 = 0;
    v31 = v4;
    while (1)
    {
      if (*(_QWORD *)v41 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v6);
      if (objc_msgSend(v7, "hasSubGroups"))
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v7, "subGroups");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v9)
        {
          v10 = v9;
          v11 = v2;
          v12 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v37 != v12)
                objc_enumerationMutation(v8);
              v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              v15 = *(void **)(a1 + 40);
              v16 = *(_QWORD *)(a1 + 48);
              v17 = *(__int16 *)(a1 + 72);
              v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              obj = *(id *)(v18 + 40);
              v19 = objc_msgSend(v15, "_processedDuplicateAssetSubGroupWithPhotoLibrary:assetObjectIDs:duplicateType:error:", v16, v14, v17, &obj);
              objc_storeStrong((id *)(v18 + 40), obj);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
            }
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v10);
          v2 = v11;
          v5 = v30;
          v4 = v31;
        }
      }
      else
      {
        objc_msgSend(v7, "group");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v22 = *(void **)(a1 + 40);
          v23 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v7, "group");
          v8 = objc_claimAutoreleasedReturnValue();
          v24 = *(__int16 *)(a1 + 72);
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v34 = *(id *)(v25 + 40);
          LOBYTE(v22) = objc_msgSend(v22, "_processedDuplicateAssetSubGroupWithPhotoLibrary:assetObjectIDs:duplicateType:error:", v23, v8, v24, &v34);
          objc_storeStrong((id *)(v25 + 40), v34);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v22;
        }
        else
        {
          PLDuplicateDetectionGetLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Duplicate Processing: No new duplicate assets to add. Processing exclusion assets", buf, 2u);
          }
        }
      }

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
        && objc_msgSend(v7, "hasExcludedItems"))
      {
        v26 = *(void **)(a1 + 40);
        v27 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v7, "excludedGroup");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v32 = *(id *)(v29 + 40);
        LOBYTE(v26) = objc_msgSend(v26, "_processedRemoveExclusionGroupAssetsWithPhotoLibrary:assetObjectIDs:error:", v27, v28, &v32);
        objc_storeStrong((id *)(v29 + 40), v32);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v26;

      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        break;
      if (++v6 == v4)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __114__PLDuplicateProcessor__detectDuplicatesAndInsertIntoDuplicateAlbumWithPhotoLibrary_detector_duplicateType_error___block_invoke_55(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "refreshAllObjects");

}

uint64_t __69__PLDuplicateProcessor__buildInterruptBatchFromStartingOIDs_library___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __99__PLDuplicateProcessor_processDuplicatesOfAssetObjectIds_processingType_error_continuationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processDuplicatesWithPhotoLibrary:processingType:assetObjectIds:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3);
}

id __55__PLDuplicateProcessor_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appPrivateDataForLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isDuplicateProcessorEnabledForLibraryServicesManager:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if ((MEMORY[0x19AEC0720]() & 1) != 0 || (PLIsInternalTool() & 1) != 0)
  {
    v4 = 1;
  }
  else if (v3)
  {
    v4 = (unint64_t)objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier") < 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isExitingSharedLibraryForLibrary:(id)a3
{
  id v3;
  id v4;
  char v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PLDuplicateProcessor_isExitingSharedLibraryForLibrary___block_invoke;
  v7[3] = &unk_1E3677C68;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

+ (void)signalBackgroundJobServiceDuplicateProcessingWithLibrary:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDuplicateProcessor isDuplicateProcessorEnabledForLibraryServicesManager:](PLDuplicateProcessor, "isDuplicateProcessorEnabledForLibraryServicesManager:", v4))
  {
    PLDuplicateDetectionGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "libraryBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Registering duplicate detection activity on library bundle %@", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(v4, "backgroundJobService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signalBackgroundProcessingNeededOnLibrary:", v3);

  }
}

+ (BOOL)removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v22;
  uint8_t buf[4];
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("duplicateAssetVisibilityState"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("activeLibraryScopeParticipationState"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v14);

  v22 = 0;
  v15 = objc_msgSend(a1, "_removeAssetsFromDuplicateAlbumUsingFetchRequest:library:error:", v9, v7, &v22);

  v16 = v22;
  PLDuplicateDetectionGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_INFO, "Duplicate Processing: Removed all duplicate shared library assets from duplicate albums", buf, 2u);
    }

    v19 = v16;
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to remove all duplicate shared library assets from duplicate albums. Error: %@", buf, 0xCu);
    }

    v20 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v20);
  }

  return v15;
}

+ (BOOL)_removeAssetsFromDuplicateAlbumUsingFetchRequest:(id)a3 library:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__713;
  v27 = __Block_byref_object_dispose__714;
  v28 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke;
  v17[3] = &unk_1E366C010;
  v10 = v9;
  v18 = v10;
  v11 = v8;
  v19 = v11;
  v20 = &v23;
  v21 = &v29;
  v22 = a1;
  objc_msgSend(v10, "performTransactionAndWait:", v17);
  v12 = *((unsigned __int8 *)v30 + 24);
  v13 = (id)v24[5];
  v14 = v13;
  if (!v12 && a5)
    *a5 = objc_retainAutorelease(v13);

  v15 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

+ (BOOL)sharedLibraryDedupeEnabledWithPathManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "isSystemPhotoLibraryPathManager"))
  {
    v4 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(v3, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appPrivateDataForLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "valueForKey:", CFSTR("DuplicateSharedLibraryCPLConfigurationFeatureVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "unsignedIntValue") == 0;
    else
      v9 = 1;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (void)updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:(id)a3 cplConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  uint64_t v28;
  unsigned int v29;
  NSObject *v30;
  int v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint32_t v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint32_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  NSObject *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D73280];
  objc_msgSend(v6, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isSystemPhotoLibraryURL:", v10);

  if ((_DWORD)v8)
  {
    objc_msgSend(v7, "valueForKey:", CFSTR("feature.version.duplicateprocessorsharedlibrary"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = (void *)v11;
    else
      v12 = &unk_1E375D110;
    v13 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(v6, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appPrivateDataForLibraryURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "valueForKey:", CFSTR("DuplicateSharedLibraryCPLConfigurationFeatureVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
LABEL_13:
      v29 = objc_msgSend(v12, "unsignedIntValue");
      if (v29 <= objc_msgSend(v17, "unsignedIntValue"))
      {
        PLDuplicateDetectionGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
          v55 = 2114;
          v56 = v12;
          v57 = 2114;
          v58 = (uint64_t)v17;
          _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "%s: Server feature version is %{public}@ and persisted feature version is %{public}@. No-op since server version is lower or equal to persisted", buf, 0x20u);
        }
        goto LABEL_32;
      }
      if (!objc_msgSend(v12, "unsignedIntValue"))
      {
LABEL_33:

        goto LABEL_34;
      }
      PLDuplicateDetectionGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        v55 = 2114;
        v56 = v12;
        v57 = 2114;
        v58 = (uint64_t)v17;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "%s: Server feature version is %{public}@ and persisted feature version is %{public}@. Going to remove all duplicate shared library assets since since server version is higher than persisted", buf, 0x20u);
      }

      v51 = 0;
      v31 = objc_msgSend(a1, "removeAllDuplicateSharedLibraryAssetFromAlbumWithPhotoLibrary:error:", v6, &v51);
      v32 = v51;
      PLDuplicateDetectionGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v31)
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 136315138;
        v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        v35 = "%s: Successfully removed all duplicate shared library assets";
        v36 = v34;
        v37 = OS_LOG_TYPE_DEFAULT;
        v38 = 12;
      }
      else
      {
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_DWORD *)buf = 136315394;
        v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        v55 = 2112;
        v56 = v32;
        v35 = "%s: Failed to remove all duplicate shared library assets. Error: %@";
        v36 = v34;
        v37 = OS_LOG_TYPE_ERROR;
        v38 = 22;
      }
      _os_log_impl(&dword_199541000, v36, v37, v35, buf, v38);
LABEL_25:

      v50 = 0;
      v40 = objc_msgSend(v16, "setValue:forKey:error:", v12, CFSTR("DuplicateSharedLibraryCPLConfigurationFeatureVersion"), &v50);
      v39 = v50;
      PLDuplicateDetectionGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = v41;
      if (v40)
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "libraryServicesManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "wellKnownPhotoLibraryIdentifier");
          *(_DWORD *)buf = 136315650;
          v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
          v55 = 2114;
          v56 = v17;
          v57 = 2048;
          v58 = v44;
          v45 = "%s: Updating shared library enable marker %{public}@ for library identifier: %td";
          v46 = v42;
          v47 = OS_LOG_TYPE_DEFAULT;
          v48 = 32;
LABEL_30:
          _os_log_impl(&dword_199541000, v46, v47, v45, buf, v48);

        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "libraryServicesManager");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v43, "wellKnownPhotoLibraryIdentifier");
        *(_DWORD *)buf = 136315906;
        v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        v55 = 2114;
        v56 = v17;
        v57 = 2048;
        v58 = v49;
        v59 = 2112;
        v60 = v39;
        v45 = "%s: Failed to update shared library enable marker %{public}@ for library identifier: %td. Error: %@";
        v46 = v42;
        v47 = OS_LOG_TYPE_ERROR;
        v48 = 42;
        goto LABEL_30;
      }

LABEL_32:
      goto LABEL_33;
    }
    v52 = 0;
    v18 = objc_msgSend(v16, "setValue:forKey:error:", &unk_1E375D110, CFSTR("DuplicateSharedLibraryCPLConfigurationFeatureVersion"), &v52);
    v19 = v52;
    PLDuplicateDetectionGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "libraryServicesManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "wellKnownPhotoLibraryIdentifier");
        *(_DWORD *)buf = 136315650;
        v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
        v55 = 2114;
        v56 = &unk_1E375D110;
        v57 = 2048;
        v58 = v23;
        v24 = "%s: Setting the initial shared library enable marker %{public}@ for library identifier: %td";
        v25 = v21;
        v26 = OS_LOG_TYPE_DEFAULT;
        v27 = 32;
LABEL_11:
        _os_log_impl(&dword_199541000, v25, v26, v24, buf, v27);

      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "libraryServicesManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v22, "wellKnownPhotoLibraryIdentifier");
      *(_DWORD *)buf = 136315906;
      v54 = "+[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:]";
      v55 = 2114;
      v56 = &unk_1E375D110;
      v57 = 2048;
      v58 = v28;
      v59 = 2112;
      v60 = v19;
      v24 = "%s: Failed to set the initial shared library enable marker %{public}@ for library identifier: %td. Error: %@";
      v25 = v21;
      v26 = OS_LOG_TYPE_ERROR;
      v27 = 42;
      goto LABEL_11;
    }

    v17 = &unk_1E375D110;
    goto LABEL_13;
  }
LABEL_34:

}

void __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  const __CFString *v17;
  id obj;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedQueryStatsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = CFSTR("albums");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setRelationshipKeyPathsForPrefetching:", v5);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);

  objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v20 = v13;
      v21 = 2112;
      v22 = CFSTR("Duplicate Processing: Remove assets from duplicate album");
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v9)
  {
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &__block_literal_global_80);
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Duplicate Processing: Failed to fetch identifiers for %{public}@. Error: %@", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void __87__PLDuplicateProcessor__removeAssetsFromDuplicateAlbumUsingFetchRequest_library_error___block_invoke_78(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "removeFromDuplicateAlbum");
  PLDuplicateDetectionGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Duplicate Processing: Removing asset [%{public}@] from duplicate album", (uint8_t *)&v5, 0xCu);

  }
}

void __57__PLDuplicateProcessor_isExitingSharedLibraryForLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "exitState") - 1 <= 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

@end
