@implementation PGGraphPetIdentityProcessor

- (PGGraphPetIdentityProcessor)initWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4 graph:(id)a5 loggingConnection:(id)a6 cache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PGGraphPetIdentityProcessor *v16;
  PGGraphPetIdentityProcessor *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PGGraphPetIdentityProcessor;
  v16 = -[PGGraphPetIdentityProcessor init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_detectionType = a3;
    objc_storeWeak((id *)&v16->_graph, v13);
    objc_storeWeak((id *)&v17->_photoLibrary, v12);
    objc_storeStrong((id *)&v17->_loggingConnection, a6);
    objc_storeStrong((id *)&v17->_cache, a7);
  }

  return v17;
}

- (id)fetchPetPersons
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  v4 = -[PGGraphPetIdentityProcessor detectionType](self, "detectionType");
  -[PGGraphPetIdentityProcessor photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchPetPersonsWithDetectionType:photoLibrary:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (PGGraph)graph
{
  return (PGGraph *)objc_loadWeakRetained((id *)&self->_graph);
}

- (void)setGraph:(id)a3
{
  objc_storeWeak((id *)&self->_graph, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return (PHPhotoLibrary *)objc_loadWeakRetained((id *)&self->_photoLibrary);
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_photoLibrary, a3);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (PGGraphPetIdentityProcessorCache)cache
{
  return self->_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_destroyWeak((id *)&self->_graph);
}

+ (id)fetchPetPersonsWithDetectionType:(signed __int16)a3 photoLibrary:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v4 = a3;
  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v7);

  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchPetPersonsWithNoKeyFaceAndDetectionType:(signed __int16)a3 photoLibrary:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v4 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v7);

  objc_msgSend(v5, "setMinimumVerifiedFaceCount:", 0);
  objc_msgSend(v5, "setMinimumUnverifiedFaceCount:", 0);
  objc_msgSend(v5, "setIncludeTorsoOnlyPerson:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = nil"), CFSTR("keyFace"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v8);

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fetchInterestingEligiblePetsForWallpaperWithWorkingContext:(id)a3 curationContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
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
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__4589;
  v44 = __Block_byref_object_dispose__4590;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = MEMORY[0x1E0C809B0];
  v45 = v6;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke;
  v39[3] = &unk_1E84355C8;
  v39[4] = &v40;
  objc_msgSend(v5, "performSynchronousConcurrentGraphReadUsingBlock:", v39);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("localIdentifier"), v41[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncludedDetectionTypes:", &unk_1E84E9598);
  if (objc_msgSend((id)v41[5], "count"))
  {
    v12 = (void *)MEMORY[0x1E0CB3528];
    v46[0] = v8;
    v46[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPredicate:", v14);

  }
  else
  {
    objc_msgSend(v11, "setPredicate:", v9);
  }
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__4589;
    v37 = __Block_byref_object_dispose__4590;
    v38 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_190;
    v32[3] = &unk_1E8429118;
    v32[4] = &v33;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v24, "userFeedbackCalculator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34[5], "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userFeedbackTypeByPersonUUIDForPersonUUIDs:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__4589;
    v30 = __Block_byref_object_dispose__4590;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_2;
    v25[3] = &unk_1E8428398;
    v25[4] = &v33;
    v25[5] = &v26;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v25);
    v19 = objc_msgSend((id)v27[5], "count");
    if (v19 == objc_msgSend(v15, "count"))
    {
      v20 = v15;
    }
    else
    {
      v22 = objc_alloc(MEMORY[0x1E0CD1580]);
      v20 = (id)objc_msgSend(v22, "initWithExistingFetchResult:filteredObjectIDs:", v15, v27[5]);
    }
    v21 = v20;
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v21 = v15;
  }

  _Block_object_dispose(&v40, 8);
  return v21;
}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[16];

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "meNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "collection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownedPetNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_DEFAULT, "[PetIdentityProcessor] No me node in graph, cannot find user's inferred pets for wallpaper suggestions! Still searching for favorited pets...", v17, 2u);
    }

  }
}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_190(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __106__PGGraphPetIdentityProcessor_fetchInterestingEligiblePetsForWallpaperWithWorkingContext_curationContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "unsignedIntValue") - 4 <= 0xFFFFFFFD)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(v6, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "loggingConnection");
      v11 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "Unable to find pet for UUID %@", (uint8_t *)&v12, 0xCu);
      }

    }
  }

}

@end
