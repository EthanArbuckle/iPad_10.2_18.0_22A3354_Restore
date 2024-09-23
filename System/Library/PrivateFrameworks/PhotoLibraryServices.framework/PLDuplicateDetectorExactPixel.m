@implementation PLDuplicateDetectorExactPixel

- (PLDuplicateDetectorExactPixel)initWithSourceOIDs:(id)a3
{
  id v5;
  PLDuplicateDetectorExactPixel *v6;
  PLDuplicateDetectorExactPixel *v7;
  NSMutableSet *v8;
  NSMutableSet *processedOIDs;
  NSMutableSet *v10;
  NSMutableSet *processedHashes;
  uint64_t v12;
  NSData *invalidHashDataToExclude;
  uint64_t v14;
  NSData *invalidAlternateHashDataToExclude;
  void *v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLDuplicateDetectorExactPixel;
  v6 = -[PLDuplicateDetectorExactPixel init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceAssetOIDs, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    processedOIDs = v7->_processedOIDs;
    v7->_processedOIDs = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    processedHashes = v7->_processedHashes;
    v7->_processedHashes = v10;

    v7->_enableEXIFDataAccess = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &initWithSourceOIDs__bytes, 24, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    invalidHashDataToExclude = v7->_invalidHashDataToExclude;
    v7->_invalidHashDataToExclude = (NSData *)v12;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &initWithSourceOIDs__bytes_20, 25, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    invalidAlternateHashDataToExclude = v7->_invalidAlternateHashDataToExclude;
    v7->_invalidAlternateHashDataToExclude = (NSData *)v14;

    if (MEMORY[0x19AEC04BC]())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_enableScreenshotProcessing = objc_msgSend(v16, "BOOLForKey:", CFSTR("PLDuplicateEnableScreenshotProcessing"));

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_disablePostProcessing = objc_msgSend(v17, "BOOLForKey:", CFSTR("PLDuplicateDisablePostProcessing"));

    }
  }

  return v7;
}

- (id)detectDuplicatesWithPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  id *v14;
  BOOL v15;
  id v16;
  void *v17;
  char v18;
  id obj;
  _QWORD v21[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__43652;
  v35 = __Block_byref_object_dispose__43653;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__43652;
  v29 = __Block_byref_object_dispose__43653;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__PLDuplicateDetectorExactPixel_detectDuplicatesWithPhotoLibrary_error___block_invoke;
  v21[3] = &unk_1E3676348;
  v21[4] = self;
  v7 = v6;
  v22 = v7;
  v23 = &v25;
  v24 = &v31;
  objc_msgSend(v7, "performBlockAndWait:", v21);
  if (v26[5])
  {
    -[PLDuplicateDetectorExactPixel _generateDuplicateContainerFromResults:](self, "_generateDuplicateContainerFromResults:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)v26[5];
    v26[5] = 0;

    if (!objc_msgSend(v8, "count"))
    {
      PLDuplicateDetectionGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: Post processing skipped, results container empty", buf, 2u);
      }
      goto LABEL_6;
    }
    if (self->_disablePostProcessing)
    {
      PLDuplicateDetectionGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: Post processing disabled via defaults", buf, 2u);
      }
LABEL_6:

      goto LABEL_23;
    }
    self->_enableEXIFDataAccess = !+[PLDuplicateDetector duplicateDetectorCompletedDateBackgroundMigrationAction:](PLDuplicateDetector, "duplicateDetectorCompletedDateBackgroundMigrationAction:", v7);
    PLDuplicateDetectionGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (self->_enableEXIFDataAccess)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138543362;
      v38 = v12;
      v13 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Duplicate Processing Detector: enableEXIFDataAccess: %{public}@", buf, 0xCu);

    }
    v14 = (id *)(v32 + 5);
    obj = (id)v32[5];
    v15 = -[PLDuplicateDetectorExactPixel _postProcessDuplicateWithPhotoLibrary:resultContainer:error:](self, "_postProcessDuplicateWithPhotoLibrary:resultContainer:error:", v7, v8, &obj);
    objc_storeStrong(v14, obj);
    v16 = (id)v32[5];
    v17 = v16;
    if (a4)
      v18 = v15;
    else
      v18 = 1;
    if ((v18 & 1) == 0)
      *a4 = objc_retainAutorelease(v16);

  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = objc_retainAutorelease((id)v32[5]);
  }
LABEL_23:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v8;
}

- (id)_generateDuplicateContainerFromResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke;
  v19[3] = &unk_1E36761F0;
  v19[4] = self;
  v20 = v6;
  v21 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v19);
  v14 = v8;
  v15 = 3221225472;
  v16 = __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke_2;
  v17 = &unk_1E366A3D0;
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v11 = v18;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", &v14);

  -[PLDuplicateDetectorExactPixel _generateDuplicateContainerFromProcessedHashOIDMap:oidHashMap:](self, "_generateDuplicateContainerFromProcessedHashOIDMap:oidHashMap:", v11, v9, v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v12;
}

- (void)_addKey:(id)a3 value:(id)a4 map:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = a5;
  if (v10 && v7)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);
    }
    objc_msgSend(v9, "addObject:", v7);

  }
}

- (id)_generateDuplicateContainerFromProcessedHashOIDMap:(id)a3 oidHashMap:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__43652;
  v20[4] = __Block_byref_object_dispose__43653;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromProcessedHashOIDMap_oidHashMap___block_invoke;
  v15[3] = &unk_1E366A3F8;
  v19 = v20;
  v15[4] = self;
  v9 = v6;
  v16 = v9;
  v10 = v7;
  v17 = v10;
  v11 = v8;
  v18 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v18;
  v13 = v11;

  _Block_object_dispose(v20, 8);
  return v13;
}

- (void)_updateDuplicateAssetOIDResults:(id)a3 forAssetOID:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((-[NSMutableSet containsObject:](self->_processedOIDs, "containsObject:", v11) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_processedOIDs, "addObject:", v11);
    objc_msgSend(v10, "addObject:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v13, "objectForKeyedSubscript:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[PLDuplicateDetectorExactPixel _updateDuplicateAssetOIDResults:forHash:relatedProcessedHashOIDMap:oidHashMap:](self, "_updateDuplicateAssetOIDResults:forHash:relatedProcessedHashOIDMap:oidHashMap:", v10, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v12, v13);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (void)_updateDuplicateAssetOIDResults:(id)a3 forHash:(id)a4 relatedProcessedHashOIDMap:(id)a5 oidHashMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((-[NSMutableSet containsObject:](self->_processedHashes, "containsObject:", v11) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_processedHashes, "addObject:", v11);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v12, "objectForKeyedSubscript:", v11, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          -[PLDuplicateDetectorExactPixel _updateDuplicateAssetOIDResults:forAssetOID:relatedProcessedHashOIDMap:oidHashMap:](self, "_updateDuplicateAssetOIDResults:forAssetOID:relatedProcessedHashOIDMap:oidHashMap:", v10, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), v12, v13);
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

  }
}

- (id)_sceneprintRequestWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C97B48];
  v5 = a3;
  +[PLSceneprint entityName](PLSceneprint, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLDuplicateDetectorExactPixel _predicateWithPhotoLibrary:](self, "_predicateWithPhotoLibrary:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  -[PLDuplicateDetectorExactPixel _propertiesToFetch](self, "_propertiesToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v9);

  objc_msgSend(v7, "setResultType:", 2);
  v12[0] = CFSTR("additionalAssetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRelationshipKeyPathsForPrefetching:", v10);

  return v7;
}

- (id)_limitedSelectionPredicateWithPhotoLibrary:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_sourceAssetOIDs, "count"))
  {
    v13 = 0;
    v14 = 0;
    -[PLDuplicateDetectorExactPixel _fetchLimitedSelectionHashes:alternativeHashes:photoLibrary:](self, "_fetchLimitedSelectionHashes:alternativeHashes:photoLibrary:", &v14, &v13, v4);
    v5 = v14;
    v6 = v13;
    v7 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("duplicateMatchingData"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("duplicateMatchingAlternateData"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "orPredicateWithSubpredicates:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_hashIsValidPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("duplicateMatchingData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("duplicateMatchingAlternateData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("duplicateMatchingData"), self->_invalidHashDataToExclude);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("duplicateMatchingAlternateData"), self->_invalidAlternateHashDataToExclude);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_predicateWithPhotoLibrary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = a3;
  -[PLDuplicateDetectorExactPixel _limitedSelectionPredicateWithPhotoLibrary:](self, "_limitedSelectionPredicateWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuplicateDetectorExactPixel _hashIsValidPredicate](self, "_hashIsValidPredicate", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(v5, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLDuplicateDetector duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:](PLDuplicateDetector, "duplicateDetectorProcessingFilterAssetsPredicateWithPrefix:processingType:pathManager:", CFSTR("additionalAssetAttributes.asset"), 2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_fetchLimitedSelectionHashes:(id *)a3 alternativeHashes:(id *)a4 photoLibrary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PLDuplicateDetectorExactPixel *v22;
  id v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_sourceAssetOIDs, "count"));
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v11 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchRequestWithEntityName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), self->_sourceAssetOIDs);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v14);

    v25[0] = CFSTR("additionalAttributes.sceneprint.duplicateMatchingData");
    v25[1] = CFSTR("additionalAttributes.sceneprint.duplicateMatchingAlternateData");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPropertiesToFetch:", v15);

    objc_msgSend(v13, "setResultType:", 2);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke;
    v19[3] = &unk_1E3670C40;
    v20 = v8;
    v21 = v13;
    v22 = self;
    v16 = v9;
    v23 = v16;
    v17 = v10;
    v24 = v17;
    v18 = v13;
    objc_msgSend(v20, "performBlockAndWait:", v19);

    if (a3)
      *a3 = objc_retainAutorelease(v16);
    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }

}

- (id)_propertiesToFetch
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("duplicateMatchingData");
  v3[1] = CFSTR("duplicateMatchingAlternateData");
  v3[2] = CFSTR("additionalAssetAttributes.asset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_postProcessDuplicateWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  PLDuplicateDetectorExactPixel *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  PLDuplicateDetectorExactPixel *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v47 = 0;
  v35 = self;
  v37 = v8;
  -[PLDuplicateDetectorExactPixel _postProcessFetchMetadataWithPhotoLibrary:resultContainer:error:](self, "_postProcessFetchMetadataWithPhotoLibrary:resultContainer:error:", v8, v9, &v47);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v47;
  v12 = v11;
  v36 = (void *)v10;
  if (v10)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v14)
    {
      v31 = v9;
      v34 = *(_QWORD *)v44;
      v15 = v14;
      v32 = v13;
      do
      {
        v16 = 0;
        v33 = v15;
        do
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v16);
          +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("extendedAttributes.dateCreated"), 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = MEMORY[0x1E0C809B0];
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke;
          v40[3] = &unk_1E366A420;
          v20 = v36;
          v41 = v20;
          v42 = v35;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v17, v20, v18, 0, v40);

          +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("aspectR"), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v19;
          v38[1] = 3221225472;
          v38[2] = __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke_2;
          v38[3] = &unk_1E366C200;
          v22 = v20;
          v39 = v22;
          +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v17, v22, v21, 0, v38);

          objc_msgSend(v37, "pathManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v18) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", v23);

          if ((_DWORD)v18)
          {
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("kindSubtype"), 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("activeLibraryScopeParticipationState"), 0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:](PLDuplicateDetectorPostProcessing, "sharedLibraryLivePhotoPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v17, v22, v24, v25, v26);

            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("activeLibraryScopeParticipationState"), 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v33;
            +[PLDuplicateDetectorSortKey sortKey:reverse:](PLDuplicateDetectorSortKey, "sortKey:reverse:", CFSTR("additionalAttributes.originalStableHash"), 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLDuplicateDetectorPostProcessing sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:](PLDuplicateDetectorPostProcessing, "sharedLibraryRawPlusJPEGPostProcessDuplicateSubGroupSplitDecisionBlockWithMetadataMap:", v22);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v32;
            +[PLDuplicateDetectorPostProcessing postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:](PLDuplicateDetectorPostProcessing, "postProcessDuplicateSubGroupWithResult:metadataMap:metadataKey:secondarySortKey:subGroupSplitDecisionBlock:", v17, v22, v27, v28, v29);

          }
          objc_msgSend(v17, "compactSubGroups");

          ++v16;
        }
        while (v15 != v16);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v15);

      v9 = v31;
    }
    else
    {

    }
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v11);
  }

  return v36 != 0;
}

- (id)_postProcessFetchMetadataWithPhotoLibrary:(id)a3 resultContainer:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  void *context;
  id v32;
  _QWORD v34[4];
  id v35;
  PLDuplicateDetectorExactPixel *v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v63 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "group");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v10);
  }

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__43652;
  v60 = __Block_byref_object_dispose__43653;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__43652;
  v54 = __Block_byref_object_dispose__43653;
  v55 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__43652;
  v48[4] = __Block_byref_object_dispose__43653;
  v49 = 0;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke;
  v42[3] = &unk_1E3675150;
  v42[4] = self;
  v32 = v8;
  v43 = v32;
  v15 = v6;
  v44 = v15;
  v45 = &v50;
  v46 = &v56;
  v47 = v48;
  v16 = objc_msgSend(v15, "performBlockAndWait:", v42);
  if (!v51[5])
  {
    v28 = (id)v57[5];
    v18 = 0;
LABEL_26:
    if (a5)
    {
      v28 = objc_retainAutorelease(v28);
      *a5 = v28;
    }
    goto LABEL_28;
  }
  context = (void *)MEMORY[0x19AEC1554](v16);
  v17 = objc_alloc(MEMORY[0x1E0C99E08]);
  v18 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend((id)v51[5], "count"));
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = (id)v51[5];
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("objectID"));
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        if (v23)
          v26 = v24 == 0;
        else
          v26 = 1;
        if (!v26)
          objc_msgSend(v18, "setObject:forKey:", v23, v24);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v66, 16);
    }
    while (v20);
  }

  if (self->_enableEXIFDataAccess)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke_84;
    v34[3] = &unk_1E3676EA0;
    v37 = v48;
    v35 = v18;
    v36 = self;
    objc_msgSend(v15, "performBlockAndWait:", v34);

  }
  objc_autoreleasePoolPop(context);
  v27 = v51[5];
  v28 = (id)v57[5];
  if (!v27)
    goto LABEL_26;
LABEL_28:

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  return v18;
}

- (BOOL)_postProcessIsValidDateSource:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (id)_postProcessingRequestWithDuplicateAssetOIDs:(id)a3 pathManager:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[2];
  _QWORD v37[5];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C97B48];
  v6 = a4;
  v7 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setResultType:", 2);
  v40[0] = CFSTR("additionalAttributes");
  v40[1] = CFSTR("extendedAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("width"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("height"));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E3764398);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB35D0];
  v33 = (void *)v14;
  v34 = (void *)v13;
  v39[0] = v13;
  v39[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "expressionForFunction:arguments:", CFSTR("multiply:by:"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v18, "setName:", CFSTR("aspectR"));
  v19 = (void *)MEMORY[0x1E0CB35D0];
  v38[0] = v12;
  v38[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "expressionForFunction:arguments:", CFSTR("divide:by:"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setExpression:", v21);

  objc_msgSend(v18, "setExpressionResultType:", 500);
  v37[0] = CFSTR("objectID");
  v37[1] = CFSTR("additionalAttributes.importedBy");
  v37[2] = CFSTR("additionalAttributes.dateCreatedSource");
  v37[3] = CFSTR("extendedAttributes.dateCreated");
  v37[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = +[PLDuplicateProcessor sharedLibraryDedupeEnabledWithPathManager:](PLDuplicateProcessor, "sharedLibraryDedupeEnabledWithPathManager:", v6);

  if ((_DWORD)v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("packedBadgeAttributes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E375EC70);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v12;
    v25 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v25, "setName:", CFSTR("rjPacked"));
    v26 = (void *)MEMORY[0x1E0CB35D0];
    v36[0] = v23;
    v36[1] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "expressionForFunction:arguments:", CFSTR("bitwiseAnd:with:"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setExpression:", v28);

    objc_msgSend(v25, "setExpressionResultType:", 200);
    v35[0] = CFSTR("kind");
    v35[1] = CFSTR("kindSubtype");
    v35[2] = CFSTR("activeLibraryScopeParticipationState");
    v35[3] = CFSTR("additionalAttributes.originalStableHash");
    v35[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v12 = v32;
    v22 = (void *)v30;
  }
  objc_msgSend(v9, "setPropertiesToFetch:", v22);

  return v9;
}

- (id)_postProcessingRequestAssetsFromDuplicateAssetOIDs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPredicate:", v7);
  objc_msgSend(v6, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v10[0] = CFSTR("master.mediaMetadata");
  v10[1] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidAlternateHashDataToExclude, 0);
  objc_storeStrong((id *)&self->_invalidHashDataToExclude, 0);
  objc_storeStrong((id *)&self->_processedHashes, 0);
  objc_storeStrong((id *)&self->_processedOIDs, 0);
  objc_storeStrong((id *)&self->_sourceAssetOIDs, 0);
}

void __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  const __CFString *v21;
  _BYTE *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  id obj;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_postProcessingRequestWithDuplicateAssetOIDs:pathManager:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startedQueryStatsWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v9, "executeFetchRequest:error:", v5, &obj);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(v8, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    PLDuplicateDetectionGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v43 = v17;
      v44 = 2112;
      v45 = CFSTR("Post processing query");
      v46 = 2112;
      v47 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLDuplicateDetectionGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v43 = v20;
      v44 = 2112;
      v45 = v21;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);

    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      goto LABEL_18;
  }
  v22 = *(_BYTE **)(a1 + 32);
  if (v22[32])
  {
    objc_msgSend(v22, "_postProcessingRequestAssetsFromDuplicateAssetOIDs:", *(_QWORD *)(a1 + 40));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0D732B0];
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "startedQueryStatsWithContext:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v40 = *(id *)(v28 + 40);
    objc_msgSend(v27, "executeFetchRequest:error:", v23, &v40);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v28 + 40), v40);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    objc_msgSend(v26, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      PLDuplicateDetectionGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v43 = v35;
        v44 = 2112;
        v45 = CFSTR("Post processing EXIF query");
        v46 = 2112;
        v47 = v32;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

      }
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      PLDuplicateDetectionGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v43 = v38;
        v44 = 2112;
        v45 = v39;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to post processing fetch request for %{public}@. Error: %@", buf, 0x16u);

      }
    }
  }
  else
  {
LABEL_18:
    v26 = v8;
    v23 = v5;
  }

}

void __97__PLDuplicateDetectorExactPixel__postProcessFetchMetadataWithPhotoLibrary_resultContainer_error___block_invoke_84(uint64_t a1)
{
  NSObject *v2;
  id v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  PLDuplicateDetectionGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Duplicate Processing Detector: Slow path accessing creation date", buf, 2u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    v20 = v3;
    v21 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x19AEC1554]();
        v10 = *(void **)(a1 + 32);
        objc_msgSend(v8, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("extendedAttributes.dateCreated"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          objc_msgSend(v8, "metadataFromMediaPropertiesOrOriginalResource");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(a1 + 40), "_postProcessIsValidDateSource:", objc_msgSend(v14, "creationDateSource")))
          {
            objc_msgSend(v14, "utcCreationDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
              objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("extendedAttributes.dateCreated"));
              v17 = *(void **)(a1 + 32);
              objc_msgSend(v8, "objectID");
              v18 = objc_claimAutoreleasedReturnValue();
              v19 = (void *)v18;
              if (v16 && v18)
                objc_msgSend(v17, "setObject:forKey:", v16, v18);

              v3 = v20;
            }

            v6 = v21;
          }

        }
        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

}

BOOL __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
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
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  double v24;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("extendedAttributes.dateCreated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("extendedAttributes.dateCreated"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("additionalAttributes.importedBy"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("additionalAttributes.importedBy"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "isEqualToNumber:", v15);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("additionalAttributes.dateCreatedSource"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "shortValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("additionalAttributes.dateCreatedSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "shortValue");

  v23 = 0;
  if (v9 && v11 && v16)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_postProcessIsValidDateSource:", v19)
      && objc_msgSend(*(id *)(a1 + 40), "_postProcessIsValidDateSource:", v22))
    {
      objc_msgSend(v9, "timeIntervalSinceDate:", v11);
      v23 = v24 < 4.0 && v24 > 0.0;
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

BOOL __93__PLDuplicateDetectorExactPixel__postProcessDuplicateWithPhotoLibrary_resultContainer_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  _BOOL8 v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("aspectR"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("aspectR"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v12 = v11;
  objc_msgSend(v10, "doubleValue");
  v14 = v13 > v12 + 0.01 || v13 < v12 + -0.01;

  return v14;
}

void __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startedQueryStatsWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v19 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v6, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v19;

  objc_msgSend(v4, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v12;
      v22 = 2112;
      v23 = CFSTR("Hashes for Limited Selection query");
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (v7)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke_61;
    v16[3] = &unk_1E366A7C0;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

    v13 = v17;
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to fetch hashes for %{public}@. Error: %@", buf, 0x16u);

    }
  }

}

void __93__PLDuplicateDetectorExactPixel__fetchLimitedSelectionHashes_alternativeHashes_photoLibrary___block_invoke_61(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneprint.duplicateMatchingData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("additionalAttributes.sceneprint.duplicateMatchingAlternateData"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v6, "addObject:", v8);
    v7 = v8;
  }

}

void __95__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromProcessedHashOIDMap_oidHashMap___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PLDuplicateGroup *v10;
  void *v11;
  PLDuplicateGroup *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_updateDuplicateAssetOIDResults:forAssetOID:relatedProcessedHashOIDMap:oidHashMap:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v13);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count") >= 2)
  {
    v10 = [PLDuplicateGroup alloc];
    v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "copy");
    v12 = -[PLDuplicateGroup initWithGroupResults:](v10, "initWithGroupResults:", v11);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  }

}

void __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additionalAssetAttributes.asset"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duplicateMatchingData"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_addKey:value:map:", v4, v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duplicateMatchingAlternateData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_addKey:value:map:", v5, v6, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_addKey:value:map:", v6, v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_addKey:value:map:", v6, v5, *(_QWORD *)(a1 + 48));

}

void __72__PLDuplicateDetectorExactPixel__generateDuplicateContainerFromResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

void __72__PLDuplicateDetectorExactPixel_detectDuplicatesWithPhotoLibrary_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const __CFString *v18;
  id obj;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_sceneprintRequestWithPhotoLibrary:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D732B0];
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startedQueryStatsWithContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v6, "executeFetchRequest:error:", v2, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  objc_msgSend(v5, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    PLDuplicateDetectionGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = CFSTR("Main sceneprint query");
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);

    }
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLDuplicateDetectionGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Duplicate Processing Detector: Failed to fetch request for %{public}@. Error: %@", buf, 0x16u);

    }
  }

}

@end
