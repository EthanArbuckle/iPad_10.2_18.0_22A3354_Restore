@implementation PHAForcedHighlightEnrichmentTask

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (int)priority
{
  return -1;
}

- (double)period
{
  return 86400.0;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAForcedHighlightEnrichmentTask _highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:](self, "_highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "workingContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "PHAForcedHighlightEnrichmentTask: %tu highlights to force enrich", buf, 0xCu);
  }

  if (objc_msgSend(v11, "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75FF8]), "initWithHighlightTailorOptions:", -[PHAForcedHighlightEnrichmentTask tailorOptions](self, "tailorOptions"));
    v15 = objc_alloc(MEMORY[0x1E0D75F88]);
    v22 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithManager:enrichmentProcessors:", v8, v16);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __79__PHAForcedHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke;
    v20[3] = &unk_1E8521438;
    v21 = v9;
    v18 = objc_msgSend(v17, "enrichDataModelForHighlightUUIDs:withError:progressBlock:", v11, a5, v20);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAForcedHighlightEnrichmentTask timeoutFatal:]", "PHAForcedHighlightEnrichmentTask.m", 66, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAForcedHighlightEnrichmentTask is stuck", v3, 2u);
  }
}

- (unint64_t)tailorOptions
{
  return 1073742079;
}

- (id)_highlightUUIDsNeedingForceEnrichmentInPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  uint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2629800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastEnrichmentDate"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v9);

  v10 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil || %K < %@"), CFSTR("lastEnrichmentDate"), CFSTR("lastEnrichmentDate"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d || %K == %d"), CFSTR("kind"), 0, CFSTR("kind"), 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("category"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v15);

  objc_msgSend(v5, "setFetchLimit:", 500);
  objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
  v25 = *MEMORY[0x1E0CD1D88];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v16);

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v18)
  {
    v19 = v18;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v18);
    for (i = 0; i != v19; ++i)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v23);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

uint64_t __79__PHAForcedHighlightEnrichmentTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
  *a2 = result;
  return result;
}

@end
