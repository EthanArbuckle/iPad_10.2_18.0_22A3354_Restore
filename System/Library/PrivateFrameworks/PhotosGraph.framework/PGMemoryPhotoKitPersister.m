@implementation PGMemoryPhotoKitPersister

- (PGMemoryPhotoKitPersister)initWithPhotoLibrary:(id)a3
{
  id v5;
  PGMemoryPhotoKitPersister *v6;
  PGMemoryPhotoKitPersister *v7;
  os_log_t v8;
  OS_os_log *loggingConnection;
  PGNeighborScoreComputer *v10;
  PGNeighborScoreComputer *neighborScoreComputer;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PGMemoryPhotoKitPersister;
  v6 = -[PGMemoryPhotoKitPersister init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = os_log_create("com.apple.PhotosGraph", "MemoryPhotoKitPersister");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;

    v10 = objc_alloc_init(PGNeighborScoreComputer);
    neighborScoreComputer = v7->_neighborScoreComputer;
    v7->_neighborScoreComputer = v10;

    objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_isAppleMusicSubscriber = +[PGMusicCatalogMonitor checkMusicCatalogEligibilityWithProgressReporter:](PGMusicCatalogMonitor, "checkMusicCatalogEligibilityWithProgressReporter:", v12);

  }
  return v7;
}

- (id)_photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1CAA4EB2C](v7);
        -[PGMemoryPhotoKitPersister _photosGraphDataDictionaryForEnrichedMemory:](self, "_photosGraphDataDictionaryForEnrichedMemory:", v11, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueMemoryIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)_photosGraphDataDictionaryForEnrichedMemory:(id)a3
{
  id v4;
  void *v5;
  PGMemoryPhotosGraphProperties *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "failedEnrichment") & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v6 = -[PGMemoryPhotosGraphProperties initWithEnrichedMemory:neighborScoreComputer:isAppleMusicSubscriber:photoLibrary:loggingConnection:]([PGMemoryPhotosGraphProperties alloc], "initWithEnrichedMemory:neighborScoreComputer:isAppleMusicSubscriber:photoLibrary:loggingConnection:", v4, self->_neighborScoreComputer, self->_isAppleMusicSubscriber, self->_photoLibrary, self->_loggingConnection);
    -[PGMemoryPhotosGraphProperties dictionary](v6, "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)persistLocalMemoriesFromEnrichedMemories:(id)a3 localMemoriesToDelete:(id)a4 progressReporter:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PHPhotoLibrary *photoLibrary;
  id v15;
  id v16;
  id v17;
  _BOOL4 v18;
  id v19;
  NSObject *loggingConnection;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  PGMemoryPhotoKitPersister *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6)
    *a6 = 0;
  if (!objc_msgSend(v10, "count") && !objc_msgSend(v11, "count"))
  {
    LOBYTE(v18) = 1;
    goto LABEL_12;
  }
  -[PGMemoryPhotoKitPersister _photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:](self, "_photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __115__PGMemoryPhotoKitPersister_persistLocalMemoriesFromEnrichedMemories_localMemoriesToDelete_progressReporter_error___block_invoke;
  v29[3] = &unk_1E842C0C0;
  v30 = v12;
  v15 = v11;
  v31 = v15;
  v16 = v10;
  v32 = v16;
  v17 = v13;
  v33 = v17;
  v34 = self;
  v28 = 0;
  v18 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v29, &v28);
  v19 = v28;
  loggingConnection = self->_loggingConnection;
  if (v18)
  {
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      v21 = loggingConnection;
      v22 = objc_msgSend(v16, "count");
      v23 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134218240;
      v36 = v22;
      v37 = 2048;
      v38 = v23;
      _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Successfully persisted %lu and deleted %lu enriched local memories", buf, 0x16u);

    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
  {
    v25 = loggingConnection;
    v26 = objc_msgSend(v16, "count");
    v27 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134218498;
    v36 = v26;
    v37 = 2048;
    v38 = v27;
    v39 = 2112;
    v40 = v19;
    _os_log_error_impl(&dword_1CA237000, v25, OS_LOG_TYPE_ERROR, "[PGMemoryPhotoKitPersister] Failed to persist %lu and delete %lu enriched local memories. Error: %@", buf, 0x20u);

    if (!a6)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (a6)
LABEL_10:
    *a6 = objc_retainAutorelease(v19);
LABEL_11:

LABEL_12:
  return v18;
}

- (id)memoryLocalIdentifiersFromPersistingEnrichedMemories:(id)a3 withPendingState:(unsigned __int16)a4 graph:(id)a5 progressReporter:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *loggingConnection;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  int v25;
  BOOL v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  PHPhotoLibrary *photoLibrary;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  NSObject *v43;
  id *v45;
  void *v46;
  id v47;
  void *v48;
  PGMemoryPhotoKitPersister *v49;
  _BOOL4 v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  PGMemoryPhotoKitPersister *v57;
  id v58;
  id v59;
  id v60;
  uint8_t *v61;
  __int16 v62;
  BOOL v63;
  BOOL v64;
  BOOL v65;
  uint8_t v66[4];
  id v67;
  __int16 v68;
  id v69;
  uint8_t buf[8];
  uint8_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;

  v10 = a4;
  v74 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v51 = a6;
  if (a7)
    *a7 = 0;
  if (!objc_msgSend(v12, "count"))
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_26;
  }
  v45 = a7;
  if ((_DWORD)v10 == 2)
  {
    v14 = 0;
    v15 = 0;
LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("pendingState = %d"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPredicate:", v18);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v20 = loggingConnection;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v15, "count");
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Found %d existing pending memories", buf, 8u);

  }
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("featuredState = %d"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v22);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_loggingConnection;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = v23;
    v25 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v25;
    _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Found %d existing featured memories", buf, 8u);

  }
  if (!(_DWORD)v10)
  {
    v26 = 0;
    v50 = objc_msgSend(v15, "count") != 0;
    goto LABEL_16;
  }
  if ((_DWORD)v10 != 1)
    goto LABEL_14;
  v26 = objc_msgSend(v15, "count") != 0;
LABEL_15:
  v50 = 0;
LABEL_16:
  v27 = -[PGMemoryPhotoKitPersister _enforceUniqueCreationDatesWithPendingState:](self, "_enforceUniqueCreationDatesWithPendingState:", v10);
  objc_msgSend(v12, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "creationDate");
  v29 = objc_claimAutoreleasedReturnValue();

  v30 = 0;
  *(_QWORD *)buf = 0;
  v71 = buf;
  v72 = 0x2020000000;
  v73 = 0;
  if (v27)
  {
    v31 = objc_msgSend(v12, "count");
    v30 = -[PGMemoryPhotoKitPersister _memoryIndexOffsetOnDate:includePendingMemories:](self, "_memoryIndexOffsetOnDate:includePendingMemories:", v29, v50)+ v31;
  }
  v48 = v14;
  v49 = self;
  v32 = v15;
  v73 = v30;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = (void *)v29;
  v47 = v13;
  -[PGMemoryPhotoKitPersister _photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:](self, "_photosGraphDataDictionaryByEnrichedMemoryIdentifierForEnrichedMemories:", v12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __128__PGMemoryPhotoKitPersister_memoryLocalIdentifiersFromPersistingEnrichedMemories_withPendingState_graph_progressReporter_error___block_invoke;
  v53[3] = &unk_1E842C0E8;
  v54 = v51;
  v36 = v12;
  v63 = v27;
  v55 = v36;
  v61 = buf;
  v37 = v34;
  v56 = v37;
  v57 = self;
  v62 = v10;
  v38 = v33;
  v58 = v38;
  v64 = v50;
  v39 = v32;
  v59 = v39;
  v65 = v26;
  v40 = v48;
  v60 = v40;
  v52 = 0;
  LOBYTE(photoLibrary) = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v53, &v52);
  v41 = v52;
  if ((photoLibrary & 1) != 0)
  {
    v16 = v38;
    v42 = v46;
    v13 = v47;
  }
  else
  {
    v43 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v49->_loggingConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138478083;
      v67 = v36;
      v68 = 2112;
      v69 = v41;
      _os_log_error_impl(&dword_1CA237000, v43, OS_LOG_TYPE_ERROR, "[PGMemoryPhotoKitPersister] Failed to persist the enriched memories %{private}@. Error: %@", v66, 0x16u);
    }
    v42 = v46;
    if (v45)
    {
      v13 = v47;
      v16 = 0;
      *v45 = objc_retainAutorelease(v41);
    }
    else
    {
      v16 = 0;
      v13 = v47;
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_26:

  return v16;
}

- (id)_memoryCreationRequestForEnrichedMemory:(id)a3 pendingState:(unsigned __int16)a4 creationDate:(id)a5 photosGraphDataDictionary:(id)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unsigned int v25;
  OS_os_log *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v25 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27 = a6;
  v26 = self->_loggingConnection;
  v10 = (void *)MEMORY[0x1E0CD1640];
  v11 = a5;
  objc_msgSend(v9, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "memoryCategory");
  objc_msgSend(v9, "representativeAssetUUIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "curatedAssetUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedCuratedAssetUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyAssetUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "creationRequestForMemoryWithTitle:subtitle:creationDate:category:subcategory:representativeAssetUUIDs:curatedAssetUUIDs:extendedCuratedAssetUUIDs:keyAssetUUID:", v12, v13, v11, v14, 0, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setPhotosGraphVersion:", objc_msgSend(v9, "photosGraphVersion"));
  objc_msgSend(v19, "setPendingState:", v25);
  objc_msgSend(v9, "uniqueMemoryIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGraphMemoryIdentifier:", v20);

  if (v25 == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLastEnrichmentDate:", v21);

  }
  else
  {
    objc_msgSend(v19, "setLastEnrichmentDate:", 0);
  }
  if (objc_msgSend(v9, "failedEnrichment"))
  {
    objc_msgSend(v19, "setRejected:", 1);
  }
  else
  {
    objc_msgSend(v19, "setRejected:", 0);
    if (v25 != 2)
      objc_msgSend(v19, "setFeaturedState:", 1);
    objc_msgSend((id)objc_opt_class(), "setStoryColorGradeKindFromPhotosGraphProperties:onMemoryChangeRequest:", v27, v19);
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v27, 1, &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v28;
    if (v22)
    {
      objc_msgSend(v19, "setPhotosGraphData:", v22);
    }
    else if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v30 = v27;
      v31 = 2112;
      v32 = v23;
      _os_log_error_impl(&dword_1CA237000, (os_log_t)v26, OS_LOG_TYPE_ERROR, "Failed to archived feature dictionary for photos graph data %{private}@. Error: %@", buf, 0x16u);
    }
    objc_msgSend(v9, "score");
    objc_msgSend(v19, "setScore:");

  }
  return v19;
}

- (BOOL)_enforceUniqueCreationDatesWithPendingState:(unsigned __int16)a3
{
  return a3 != 2;
}

- (unint64_t)_memoryIndexOffsetOnDate:(id)a3 includePendingMemories:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *loggingConnection;
  PGMemoryPhotoKitPersister *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  int v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v4 = a4;
  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludePendingMemories:", v4);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v7);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v12)
  {
    v13 = v12;
    v24 = self;
    v25 = v7;
    v14 = 0;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1CAA4EB2C]();
        v19 = (void *)MEMORY[0x1E0D4B130];
        objc_msgSend(v17, "creationDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "compareDate:toDate:toUnitGranularity:", v6, v20, 16);

        if (!v21)
          ++v14;
        objc_autoreleasePoolPop(v18);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v13);

    if (v14)
    {
      loggingConnection = self->_loggingConnection;
      v7 = v25;
      if (os_log_type_enabled((os_log_t)v24->_loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v31 = v14;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Using memory index offset of %d", buf, 8u);
      }
    }
    else
    {
      v7 = v25;
    }
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (id)_encodedFeaturesFromFeatureNodes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allFeatures", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "encodedFeature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)updateExistingMemories:(id)a3 localMemoryByUniqueIdentifier:(id)a4 progressReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_log *v11;
  PHPhotoLibrary *photoLibrary;
  id v13;
  NSObject *v14;
  char v15;
  id v16;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = self->_loggingConnection;
    photoLibrary = self->_photoLibrary;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__PGMemoryPhotoKitPersister_updateExistingMemories_localMemoryByUniqueIdentifier_progressReporter___block_invoke;
    v19[3] = &unk_1E842C0C0;
    v19[4] = self;
    v20 = v10;
    v13 = v8;
    v21 = v13;
    v22 = v9;
    v14 = v11;
    v23 = v14;
    v18 = 0;
    v15 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v19, &v18);
    v16 = v18;
    if ((v15 & 1) == 0 && os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v25 = v13;
      v26 = 2112;
      v27 = v16;
      _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Failed to update the enriched memories %{private}@. Error: %@", buf, 0x16u);
    }

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (void)cacheMusicAudioAndArtworkForEnrichedMemories:(id)a3 inflationContext:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *loggingConnection;
  _BOOL4 v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  dispatch_time_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id obj;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD v41[4];
  NSObject *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v34 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v14, "flexMusicCuration", v34);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bestSongSuggestions");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v9, "addObject:", v18);
        if (self->_isAppleMusicSubscriber)
        {
          objc_msgSend(v14, "musicCuration");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "keySongAdamID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
            objc_msgSend(v37, "addObject:", v20);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v9, "count"))
    +[PGFlexMusicCacher cacheSongAudioAndArtworkForUIDs:](PGFlexMusicCacher, "cacheSongAudioAndArtworkForUIDs:", v9);
  if (objc_msgSend(v37, "count", v34))
  {
    +[PGMusicCuratorConfigurationWrapper defaultConfiguration](PGMusicCuratorConfigurationWrapper, "defaultConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_group_create();
    v23 = -[PGMemoryPhotoKitPersister _shouldPrefetchMetadataForMemoriesInPhotoLibrary:withConfiguration:](self, "_shouldPrefetchMetadataForMemoriesInPhotoLibrary:withConfiguration:", v35, v21);
    loggingConnection = self->_loggingConnection;
    v25 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
    if (v23)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412290;
        v48 = v37;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[MemoriesMusic] prefetching song display metadata for adam IDs: %@", buf, 0xCu);
      }
      dispatch_group_enter(v22);
      objc_msgSend(v37, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke;
      v41[3] = &unk_1E842C110;
      v42 = v22;
      +[PGMusicCurator fetchSongDisplayMetadataJSONForAdamIDs:inflationContext:progressReporter:completionHandler:](PGMusicCurator, "fetchSongDisplayMetadataJSONForAdamIDs:inflationContext:progressReporter:completionHandler:", v26, v36, v27, v41);

    }
    else if (v25)
    {
      *(_DWORD *)buf = 138412290;
      v48 = v37;
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[MemoriesMusic] usage is such that no song display metadata prefetching will be done for adam IDs: %@", buf, 0xCu);
    }
    v28 = -[PGMemoryPhotoKitPersister _shouldPrefetchAudioForMemoriesInPhotoLibrary:withConfiguration:](self, "_shouldPrefetchAudioForMemoriesInPhotoLibrary:withConfiguration:", v35, v21);
    v29 = self->_loggingConnection;
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        *(_DWORD *)buf = 138412290;
        v48 = v37;
        _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] caching song audio for adam IDs: %@", buf, 0xCu);
      }
      dispatch_group_enter(v22);
      objc_msgSend(v37, "allObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D42A58], "ignoreProgress");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke_183;
      v39[3] = &unk_1E842ECA0;
      v40 = v22;
      +[PGMusicAudioCacher cacheSongAudioForAdamIDs:progressReporter:completionHandler:](PGMusicAudioCacher, "cacheSongAudioForAdamIDs:progressReporter:completionHandler:", v31, v32, v39);

    }
    else if (v30)
    {
      *(_DWORD *)buf = 138412290;
      v48 = v37;
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[MemoriesMusic] usage is such that no song audio caching will be done for adam IDs: %@", buf, 0xCu);
    }
    v33 = dispatch_time(0, 20000000000);
    dispatch_group_wait(v22, v33);

  }
}

- (BOOL)_shouldPrefetchMetadataForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  if (a4)
    v6 = objc_msgSend(a4, "metadataPrefetchThresholdInDays");
  else
    v6 = 60;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)-v6 * 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("lastViewedDate >= %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") != 0;

  return v12;
}

- (BOOL)_shouldPrefetchAudioForMemoriesInPhotoLibrary:(id)a3 withConfiguration:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  if (a4)
    v6 = objc_msgSend(a4, "audioFilePrefetchThresholdInDays");
  else
    v6 = 15;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", (double)-v6 * 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("lastViewedDate >= %@"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v10);

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") != 0;

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neighborScoreComputer, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__PGMemoryPhotoKitPersister_cacheMusicAudioAndArtworkForEnrichedMemories_inflationContext_photoLibrary___block_invoke_183(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__PGMemoryPhotoKitPersister_updateExistingMemories_localMemoryByUniqueIdentifier_progressReporter___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  __int128 v5;
  double v6;
  unint64_t v7;
  double v8;
  uint64_t i;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  char v61;
  void *v62;
  id v63;
  NSObject *v64;
  int v65;
  char v66;
  __int128 v67;
  id obj;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *context;
  uint64_t v78;
  void *v79;
  void *v80;
  int v81;
  int v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  _BYTE v89[20];
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  _BYTE v96[128];
  _QWORD v97[3];

  v97[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncludeGuestAssets:", 1);
  v97[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v3);

  v72 = *(id *)(a1 + 40);
  v4 = objc_msgSend(*(id *)(a1 + 48), "count");
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v78 = a1;
  obj = *(id *)(a1 + 48);
  v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
  if (v71)
  {
    v6 = 1.0 / (double)v4;
    v7 = 0x1E0CD1000uLL;
    v69 = *(_QWORD *)v85;
    v8 = 0.0;
    *(_QWORD *)&v5 = 138478083;
    v67 = v5;
    v70 = v2;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v85 != v69)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        context = (void *)MEMORY[0x1CAA4EB2C]();
        v11 = *(void **)(v78 + 56);
        objc_msgSend(v10, "uniqueMemoryIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "length"))
        {

LABEL_9:
          objc_msgSend(v13, "title", v67);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend(v17, "isEqualToString:", v18) ^ 1;

          goto LABEL_10;
        }
        objc_msgSend(v10, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "length");

        if (v16)
          goto LABEL_9;
        v82 = 0;
LABEL_10:
        objc_msgSend(v13, "subtitle", v67);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "length"))
        {

LABEL_13:
          objc_msgSend(v13, "subtitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "subtitle");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v22, "isEqualToString:", v23) ^ 1;

          goto LABEL_14;
        }
        objc_msgSend(v10, "subtitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        if (v21)
          goto LABEL_13;
        v81 = 0;
LABEL_14:
        objc_msgSend(*(id *)(v7 + 912), "fetchKeyCuratedAssetInAssetCollection:referenceAsset:options:", v13, 0, v2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "keyAssetUUID");
        v26 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = v25;
        v80 = (void *)v26;
        if (v27 == (void *)v26)
        {
          v29 = 0;
        }
        else
        {
          objc_msgSend(v25, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", v26) ^ 1;

        }
        objc_msgSend(*(id *)(v7 + 912), "fetchCuratedAssetsInAssetCollection:options:", v13, v2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fetchedObjects");
        v31 = objc_claimAutoreleasedReturnValue();

        v75 = (void *)v31;
        +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "curatedAssetUUIDs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count") || objc_msgSend(v33, "count"))
        {
          v34 = v33;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v32, "isEqualToSet:", v35) ^ 1;

        }
        else
        {
          v34 = v33;
          v36 = 0;
        }
        v74 = v32;
        objc_msgSend(*(id *)(v7 + 912), "fetchExtendedCuratedAssetsInAssetCollection:options:", v13, v2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "fetchedObjects");
        v38 = objc_claimAutoreleasedReturnValue();

        v73 = (void *)v38;
        +[PGMemoryGenerationHelper assetUUIDsFromAssets:](PGMemoryGenerationHelper, "assetUUIDsFromAssets:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "extendedCuratedAssetUUIDs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v40;
        if (objc_msgSend(v39, "count") || objc_msgSend(v40, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v39, "isEqualToSet:", v41) ^ 1;

        }
        else
        {
          v42 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v13);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setLastEnrichmentDate:", v44);

        v45 = objc_msgSend(v13, "photosGraphVersion");
        if (v45 != objc_msgSend(v10, "photosGraphVersion"))
          objc_msgSend(v43, "setPhotosGraphVersion:", objc_msgSend(v10, "photosGraphVersion"));
        v46 = objc_msgSend(v13, "isRejected");
        if (v46 != objc_msgSend(v10, "failedEnrichment"))
          objc_msgSend(v43, "setRejected:", objc_msgSend(v10, "failedEnrichment"));
        if ((v82 | v81 | v29 | v36 | v42) == 1)
        {
          v47 = *(NSObject **)(v78 + 64);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413570;
            *(_QWORD *)v89 = v13;
            *(_WORD *)&v89[8] = 1024;
            *(_DWORD *)&v89[10] = v82;
            *(_WORD *)&v89[14] = 1024;
            *(_DWORD *)&v89[16] = v81;
            v90 = 1024;
            v91 = v29;
            v92 = 1024;
            v93 = v36;
            v94 = 1024;
            v95 = v42;
            _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "Updating Memory: %@, title %d, subtitle %d, keyAsset %d, curation %d, extendedCuration %d", buf, 0x2Au);
          }
          if (v82)
          {
            objc_msgSend(v10, "title");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setTitle:", v48);

          }
          if (v81)
          {
            objc_msgSend(v10, "subtitle");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setSubtitle:", v49);

          }
          if ((v29 | v36 | v42) == 1)
          {
            objc_msgSend(v10, "representativeAssetUUIDs");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setRepresentativeAssetUUIDs:curatedAssetUUIDs:extendedCuratedAssetUUIDs:keyAssetUUID:", v50, v34, v79, v80);

          }
          objc_msgSend(v13, "score");
          v52 = v51;
          objc_msgSend(v10, "score");
          if (v52 != v53)
          {
            objc_msgSend(v10, "score");
            objc_msgSend(v43, "setScore:");
          }
          objc_msgSend(*(id *)(v78 + 32), "_photosGraphDataDictionaryForEnrichedMemory:", v10);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("storyColorGradeKind"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "integerValue");

          if (!v56)
          {
            objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("storyColorGradeCategory"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = PFStoryColorGradeKindDefaultForColorGradeCategory();

          }
          if (objc_msgSend(v13, "storyColorGradeKind") != v56)
            objc_msgSend(v43, "setStoryColorGradeKind:", v56);
          objc_msgSend(v13, "photosGraphProperties");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v58, "count"))
          {

LABEL_45:
            objc_msgSend(v13, "photosGraphProperties");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isEqualToDictionary:", v54);

            if ((v61 & 1) == 0)
            {
              v83 = 0;
              objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v54, 1, &v83);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v63 = v83;
              if (v62)
              {
                objc_msgSend(v43, "setPhotosGraphData:", v62);
              }
              else
              {
                v64 = *(NSObject **)(v78 + 64);
                if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v67;
                  *(_QWORD *)v89 = v54;
                  *(_WORD *)&v89[8] = 2112;
                  *(_QWORD *)&v89[10] = v63;
                  _os_log_error_impl(&dword_1CA237000, v64, OS_LOG_TYPE_ERROR, "Failed to archived feature dictionary for photos graph data %{private}@. Error: %@", buf, 0x16u);
                }
              }

            }
          }
          else
          {
            v59 = objc_msgSend(v54, "count");

            if (v59)
              goto LABEL_45;
          }

        }
        v8 = v6 + v8;
        v65 = objc_msgSend(v72, "isCancelledWithProgress:", v8);
        v66 = v65;
        if (v65 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v89 = 357;
          *(_WORD *)&v89[4] = 2080;
          *(_QWORD *)&v89[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Memories/PGMemoryPhotoKitPersister.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }

        objc_autoreleasePoolPop(context);
        v2 = v70;
        v7 = 0x1E0CD1000;
        if ((v66 & 1) != 0)
          goto LABEL_62;
      }
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    }
    while (v71);
  }
LABEL_62:

}

void __128__PGMemoryPhotoKitPersister_memoryLocalIdentifiersFromPersistingEnrichedMemories_withPendingState_graph_progressReporter_error___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id v3;
  double v4;
  double v5;
  uint64_t i;
  void *v7;
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
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  char v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
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
  _BYTE v69[128];
  _BYTE v70[128];
  uint8_t v71[128];
  uint8_t buf[4];
  _BYTE v73[14];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v51 = *(id *)(a1 + 32);
  v2 = objc_msgSend(*(id *)(a1 + 40), "count");
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v3 = *(id *)(a1 + 40);
  v52 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
  if (v52)
  {
    v4 = 1.0 / (double)v2;
    v50 = *(_QWORD *)v66;
    v5 = 0.0;
    while (2)
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v66 != v50)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v7, "creationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 98))
        {
          objc_msgSend(v7, "creationDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dateByAddingTimeInterval:", (double)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
          v11 = objc_claimAutoreleasedReturnValue();

          --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
          v9 = (void *)v11;
        }
        v12 = *(void **)(a1 + 48);
        objc_msgSend(v7, "uniqueMemoryIdentifier", v50);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 56), "_memoryCreationRequestForEnrichedMemory:pendingState:creationDate:photosGraphDataDictionary:", v7, *(unsigned __int16 *)(a1 + 96), v9, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 64);
        objc_msgSend(v15, "placeholderForCreatedMemory");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v18);

        v5 = v4 + v5;
        if (objc_msgSend(v51, "isCancelledWithProgress:", v5))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v73 = 163;
            *(_WORD *)&v73[4] = 2080;
            *(_QWORD *)&v73[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Memories/PGMemoryPhotoKitPersister.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          objc_autoreleasePoolPop(v8);
          goto LABEL_48;
        }

        objc_autoreleasePoolPop(v8);
      }
      v52 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v52)
        continue;
      break;
    }
  }

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (*(_BYTE *)(a1 + 99))
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v19 = *(id *)(a1 + 72);
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v62 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setPendingState:", 0);
          v26 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = v26;
            objc_msgSend(v24, "uuid");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v73 = v28;
            _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Unpending memory with uuid %@", buf, 0xCu);

          }
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v21);
    }
  }
  else
  {
    if (!*(_BYTE *)(a1 + 100))
      goto LABEL_36;
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v29 = *(id *)(a1 + 72);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v58 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * k), "uuid");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      }
      while (v31);
    }

    objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 72));
    v35 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      goto LABEL_36;
    v36 = *(void **)(a1 + 72);
    v19 = v35;
    v37 = objc_msgSend(v36, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v73 = v37;
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Deleting %d previously existing pending memories", buf, 8u);
  }

LABEL_36:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = *(id *)(a1 + 80);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v54;
    do
    {
      for (m = 0; m != v40; ++m)
      {
        if (*(_QWORD *)v54 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * m);
        objc_msgSend(v43, "uuid");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v3, "containsObject:", v44);

        if ((v45 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v43);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setFeaturedState:", 0);
          v47 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            v48 = v47;
            objc_msgSend(v43, "uuid");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v73 = v49;
            _os_log_impl(&dword_1CA237000, v48, OS_LOG_TYPE_INFO, "[PGMemoryPhotoKitPersister] Clearing currently featured state for memory with uuid %@", buf, 0xCu);

          }
        }
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    }
    while (v40);
  }

LABEL_48:
}

void __115__PGMemoryPhotoKitPersister_persistLocalMemoriesFromEnrichedMemories_localMemoriesToDelete_progressReporter_error___block_invoke(uint64_t a1)
{
  id v2;
  double v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
    objc_msgSend(MEMORY[0x1E0CD1640], "deleteMemories:", *(_QWORD *)(a1 + 40));
  v3 = 0.1;
  if (objc_msgSend(v2, "isCancelledWithProgress:", 0.1))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v25 = 91;
      v26 = 2080;
      v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Memories/P"
            "GMemoryPhotoKitPersister.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "count");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = *(id *)(a1 + 48);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0.9 / (double)v4;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1CAA4EB2C]();
          v12 = *(void **)(a1 + 56);
          objc_msgSend(v10, "uniqueMemoryIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = *(void **)(a1 + 64);
          objc_msgSend(v10, "creationDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v15, "_memoryCreationRequestForEnrichedMemory:pendingState:creationDate:photosGraphDataDictionary:", v10, 2, v16, v14);

          v3 = v7 + v3;
          if (objc_msgSend(v2, "isCancelledWithProgress:", v3))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v25 = 98;
              v26 = 2080;
              v27 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Me"
                    "mories/PGMemoryPhotoKitPersister.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }

            objc_autoreleasePoolPop(v11);
            goto LABEL_18;
          }

          objc_autoreleasePoolPop(v11);
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_18:

  }
}

+ (void)setStoryColorGradeKindFromPhotosGraphProperties:(id)a3 onMemoryChangeRequest:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storyColorGradeKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (!v7)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storyColorGradeCategory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PFStoryColorGradeKindDefaultForColorGradeCategory();

  }
  objc_msgSend(v5, "setStoryColorGradeKind:", v7);

}

@end
