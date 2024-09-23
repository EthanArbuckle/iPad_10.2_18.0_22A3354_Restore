@implementation PLFeatureAvailabilityComputer

- (PLFeatureAvailabilityComputer)initWithTransitionDelegate:(id)a3 progressDelegate:(id)a4
{
  id v6;
  id v7;
  PLFeatureAvailabilityComputer *v8;
  PLFeatureAvailabilityComputer *v9;
  uint64_t v10;
  PLMediaProcessingAlgorithmVersionProvider *versionProvider;
  PLFeatureAvailabilityComputer *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLFeatureAvailabilityComputer;
  v8 = -[PLFeatureAvailabilityComputer init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_transitionDelegate, v6);
    objc_storeWeak((id *)&v9->_progressDelegate, v7);
    +[PLFeatureProcessingAlgorithmVersionProvider provider](PLFeatureProcessingAlgorithmVersionProvider, "provider");
    v10 = objc_claimAutoreleasedReturnValue();
    versionProvider = v9->_versionProvider;
    v9->_versionProvider = (PLMediaProcessingAlgorithmVersionProvider *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)computeSnapshotForPhotoLibrary:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  PLFeatureProcessingSnapshot *v12;
  NSObject *v13;
  BOOL v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  os_signpost_id_t v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLPhotosSearchGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeatureAvailability - TotalSnapshotCompute", ", buf, 2u);
  }

  v12 = objc_alloc_init(PLFeatureProcessingSnapshot);
  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "FeatureAvailability - computing processing snapshot", buf, 2u);
  }

  v24 = 0;
  v14 = -[PLFeatureAvailabilityComputer _addPhotosKnowledgeGraphStatusToProcessingSnapshot:photoLibrary:error:](self, "_addPhotosKnowledgeGraphStatusToProcessingSnapshot:photoLibrary:error:", v12, v6, &v24);
  v15 = v24;
  if (v14)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3254779904;
    v20[2] = __82__PLFeatureAvailabilityComputer_computeSnapshotForPhotoLibrary_completionHandler___block_invoke;
    v20[3] = &unk_1E365E6A0;
    v21 = v7;
    v22 = v11;
    v23 = v9;
    -[PLFeatureAvailabilityComputer _step01_AddAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:](self, "_step01_AddAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:", v12, v6, v20);

    v16 = v21;
  }
  else
  {
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[PLFeatureAvailabilityComputer computeSnapshotForPhotoLibrary:completionHandler:]";
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - Failed to fetch graph status, error: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
    v18 = v11;
    v19 = v18;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - TotalSnapshotCompute", ", buf, 2u);
    }

  }
}

- (void)computeAvailabilityForPhotoLibrary:(id)a3 shouldPersist:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_signpost_id_t v23;
  BOOL v24;
  id buf[2];

  v8 = a3;
  v9 = a5;
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - ComputeAndPersistAvailability", ", (uint8_t *)buf, 2u);
  }

  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "FeatureAvailability - computing feature availability", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3254779904;
  v18[2] = __100__PLFeatureAvailabilityComputer_computeAvailabilityForPhotoLibrary_shouldPersist_completionHandler___block_invoke;
  v18[3] = &unk_1E365E710;
  v15 = v9;
  v20 = v15;
  v16 = v13;
  v22 = v16;
  v23 = v11;
  objc_copyWeak(&v21, buf);
  v17 = v8;
  v19 = v17;
  v24 = a4;
  -[PLFeatureAvailabilityComputer computeSnapshotForPhotoLibrary:completionHandler:](self, "computeSnapshotForPhotoLibrary:completionHandler:", v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);

}

- (BOOL)clearAvailabilityStateForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  uint8_t v17[16];
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  PLPhotosSearchGetLog();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FeatureAvailability - ComputeAndPersistAvailability", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v27 = buf;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__74421;
  v30 = __Block_byref_object_dispose__74422;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __77__PLFeatureAvailabilityComputer_clearAvailabilityStateForPhotoLibrary_error___block_invoke;
  v18[3] = &unk_1E3676348;
  v20 = &v22;
  v18[4] = self;
  v12 = v6;
  v19 = v12;
  v21 = buf;
  objc_msgSend(v11, "sync:identifyingBlock:library:", v18, 0, 0);

  if (a4)
    *a4 = objc_retainAutorelease(*((id *)v27 + 5));
  v13 = v10;
  v14 = v13;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_END, v8, "FeatureAvailability - ClearAvailability", ", v17, 2u);
  }

  v15 = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (void)_step01_AddAssetCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PLFeatureAvailabilityComputer__step01_AddAssetCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step02_AddAssetForSceneCountsToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __115__PLFeatureAvailabilityComputer__step02_AddAssetForSceneCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step03_AddCaptioningToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__PLFeatureAvailabilityComputer__step03_AddCaptioningToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step04_AddEmbeddingIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __113__PLFeatureAvailabilityComputer__step04_AddEmbeddingIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step05_AddHighlightStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__PLFeatureAvailabilityComputer__step05_AddHighlightStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step06_AddSceneAnalysisToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__PLFeatureAvailabilityComputer__step06_AddSceneAnalysisToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670CB0;
  objc_copyWeak(&v18, &location);
  v11 = v10;
  v17 = v11;
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "performBlock:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step07_AddSceneAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __117__PLFeatureAvailabilityComputer__step07_AddSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E3670D00;
  v11 = v10;
  v17 = v11;
  objc_copyWeak(&v18, &location);
  v12 = v8;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  -[PLFeatureAvailabilityComputer _fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:](self, "_fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:", 2, v13, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_step08_AddMediaAnalysisIndexingToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __117__PLFeatureAvailabilityComputer__step08_AddMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke;
  v13[3] = &unk_1E3670D50;
  v11 = v10;
  v15 = v11;
  objc_copyWeak(&v16, &location);
  v12 = v8;
  v14 = v12;
  -[PLFeatureAvailabilityComputer _fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:](self, "_fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:", 1, v9, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (BOOL)_addAssetCountsToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 forSceneAnalysis:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t spid;
  id v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v6 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLPhotosSearchGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  v13 = v11;
  v14 = v13;
  spid = v12;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - InitializeCounts", ", buf, 2u);
  }

  if (v6)
  {
    objc_msgSend(v9, "setTotalCuratedAssetForScenesCount:", 0);
    objc_msgSend(v9, "setTotalAssetForScenesCount:", 0);
  }
  else
  {
    objc_msgSend(v9, "setTotalCuratedAssetCount:", 0);
    objc_msgSend(v9, "setTotalAssetCount:", 0);
  }
  objc_msgSend((id)objc_opt_class(), "_predicateForAllAssetsAllowedForProcessingForSceneAnalysis:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v17 = -[PLFeatureAvailabilityComputer _assetCountForPredicate:managedObjectContext:error:](self, "_assetCountForPredicate:managedObjectContext:error:", v16, v10, &v35);
  v18 = v35;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:]";
      v38 = 2112;
      v39 = v18;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    if (a6)
      *a6 = objc_retainAutorelease(v18);
    v20 = v14;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v21 = v20;
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", ", buf, 2u);
      }
    }
    v22 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_predicateForAllCuratedAssetsForSceneAnalysis:", v6);
    v23 = objc_claimAutoreleasedReturnValue();

    v34 = v18;
    v24 = -[PLFeatureAvailabilityComputer _assetCountForPredicate:managedObjectContext:error:](self, "_assetCountForPredicate:managedObjectContext:error:", v23, v10, &v34);
    v25 = v34;

    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[PLFeatureAvailabilityComputer _addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:]";
        v38 = 2112;
        v39 = v25;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      if (a6)
        *a6 = objc_retainAutorelease(v25);
      v27 = v14;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v28 = v27;
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", ", buf, 2u);
        }
      }
      v22 = 0;
    }
    else
    {
      if (v6)
      {
        objc_msgSend(v9, "setTotalAssetForScenesCount:", v17);
        objc_msgSend(v9, "setTotalCuratedAssetForScenesCount:", v24);
      }
      else
      {
        objc_msgSend(v9, "setTotalAssetCount:", v17);
        objc_msgSend(v9, "setTotalCuratedAssetCount:", v24);
      }
      v29 = v14;
      if (v15 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v30 = v29;
        if (os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, spid, "FeatureAvailability - InitializeCounts", ", buf, 2u);
        }
      }
      v22 = 1;
    }
    v18 = v25;
    v16 = (void *)v23;
  }

  return v22;
}

- (unint64_t)_assetCountForPredicate:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v17;

  v7 = (objc_class *)MEMORY[0x1E0C97B48];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEntity:", v12);

  objc_msgSend(v10, "setPredicate:", v9);
  v17 = 0;
  v13 = objc_msgSend(v8, "countForFetchRequest:error:", v10, &v17);

  v14 = v17;
  v15 = v14;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }

  return v13;
}

- (BOOL)_addCaptioningStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  double v28;
  NSObject *v29;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  v12 = v10;
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - Captioning", ", buf, 2u);
  }

  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "FeatureAvailability - adding captioning status to processing snapshot", buf, 2u);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v9, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEntity:", v18);

  objc_msgSend((id)objc_opt_class(), "_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:priority:versionProvider:", 17, 0, self->_versionProvider);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v19);

  v31 = 0;
  v20 = objc_msgSend(v9, "countForFetchRequest:error:", v16, &v31);
  v21 = v31;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[PLFeatureAvailabilityComputer _addCaptioningStatusToProcessingSnapshot:managedObjectContext:error:]";
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v21);
    v25 = v13;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
LABEL_23:
        _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - Captioning", ", buf, 2u);
      }
    }
  }
  else
  {
    v22 = objc_msgSend(v8, "totalCuratedAssetCount");
    if (v22)
      v23 = (double)v20 / (double)v22;
    else
      v23 = 0.0;
    objc_msgSend(v8, "setFractionOfCuratedAssetsWithCaptions:", fmin(v23, 1.0));
    v27 = objc_msgSend(v8, "totalAssetCount");
    if (v27)
      v28 = (double)v20 / (double)v27;
    else
      v28 = 0.0;
    objc_msgSend(v8, "setFractionOfAllAssetsWithCaptions:", v28);
    v29 = v13;
    if (v14 < 0xFFFFFFFFFFFFFFFELL)
    {
      v26 = v29;
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        goto LABEL_23;
      }
    }
  }

  return v20 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_addPhotosKnowledgeGraphStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PLPhotosSearchGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FeatureAvailability - PhotosKnowledgeGraph", ", buf, 2u);
  }

  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "FeatureAvailability - adding knowledge graph status to processing snapshot", v31, 2u);
  }

  objc_msgSend(v8, "photoAnalysisClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
  {
    v22 = (void *)PLErrorCreate();
    v18 = v22;
    if (a5)
      *a5 = objc_retainAutorelease(v22);
    v23 = v12;
    v20 = v23;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)v30 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v10, "FeatureAvailability - PhotosKnowledgeGraph", ", v30, 2u);
    }
    goto LABEL_23;
  }
  objc_msgSend(v15, "requestGraphStatus:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    v24 = PLErrorCreate();
    v20 = v24;
    if (a5)
      *a5 = objc_retainAutorelease(v24);
    v25 = v12;
    v26 = v25;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v10, "FeatureAvailability - PhotosKnowledgeGraph", ", v29, 2u);
    }

    v18 = 0;
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v7, "setPhotosKnowledgeGraphIsReady:", objc_msgSend(v17, "availability") == 2);
  v19 = v12;
  v20 = v19;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v10, "FeatureAvailability - PhotosKnowledgeGraph", ", v28, 2u);
  }
  v21 = 1;
LABEL_24:

  return v21;
}

- (BOOL)_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  BOOL v25;
  unint64_t v26;
  double v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PLPhotosSearchGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FeatureAvailability - VisualUnderstandingClustering", ", buf, 2u);
  }

  PLBackendGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "FeatureAvailability - adding VU cluster index status to processing snapshot", buf, 2u);
  }

  objc_msgSend(v8, "pathManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "libraryURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  +[PLMediaAnalysisServiceRequestAdapter queryVUIndexAssetCountForType:photoLibraryURL:error:](PLMediaAnalysisServiceRequestAdapter, "queryVUIndexAssetCountForType:photoLibraryURL:error:", 0, v16, &v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v32;

  if (!v18)
  {
    v26 = objc_msgSend(v7, "totalCuratedAssetCount");
    if (v26)
    {
      objc_msgSend(v17, "doubleValue");
      v28 = v27 / (double)v26;
    }
    else
    {
      v28 = 0.0;
    }
    objc_msgSend(v7, "setFractionOfCuratedAssetsIndexedInVUClustering:", fmin(v28, 1.0));
    v29 = v12;
    v30 = v29;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v10, "FeatureAvailability - VisualUnderstandingClustering", ", buf, 2u);
    }

    goto LABEL_27;
  }
  v19 = v12;
  v20 = v19;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v10, "FeatureAvailability - VisualUnderstandingClustering", ", buf, 2u);
  }

  if (objc_msgSend(v18, "code") == 46309)
  {
    objc_msgSend(v18, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D74498]);

    if (v22)
    {
      PLBackendGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_INFO, "FeatureAvailability - VU cluster index status is unavailable in this build. Defaulting to available for VU status.", buf, 2u);
      }

      objc_msgSend(v7, "setFractionOfCuratedAssetsIndexedInVUClustering:", 1000000000.0);
LABEL_27:
      v25 = 1;
      goto LABEL_28;
    }
  }
  PLBackendGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "FeatureAvailability - Encountered an error when querying for VU cluster index status.", buf, 2u);
  }

  v25 = 0;
  if (a5)
    *a5 = objc_retainAutorelease(v18);
LABEL_28:

  return v25;
}

- (BOOL)_addEmbeddingVectorIndexingStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLPhotosSearchGetLog();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  v12 = v10;
  v13 = v12;
  v14 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FeatureAvailability - AddVectorIndexingStateToAvailability", ", buf, 2u);
  }

  PLBackendGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "FeatureAvailability - adding embedding vector indexing status to processing snapshot", buf, 2u);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v17, (uint64_t)v9, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setEntity:", v18);

  objc_msgSend((id)objc_opt_class(), "_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:priority:versionProvider:", 17, 0, self->_versionProvider);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v19);

  v29 = 0;
  v20 = objc_msgSend(v9, "countForFetchRequest:error:", v16, &v29);
  v21 = v29;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v21;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of assets with mediaAnalysisImageVersion, error: %@", buf, 0xCu);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v21);
    v25 = v13;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v25;
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
LABEL_20:
        _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - AddVectorIndexingStateToAvailability", ", buf, 2u);
      }
    }
  }
  else
  {
    v22 = objc_msgSend(v8, "totalCuratedAssetCount");
    if (v22)
      v23 = (double)v20 / (double)v22;
    else
      v23 = 0.0;
    objc_msgSend(v8, "setFractionOfCuratedAssetsWithEmbeddingsInVectorIndex:", fmin(v23, 1.0));
    v27 = v13;
    if (v14 < 0xFFFFFFFFFFFFFFFELL)
    {
      v26 = v27;
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        goto LABEL_20;
      }
    }
  }

  return v20 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_addHighlightStatusToProcessingSnapshot:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  BOOL v22;
  id v23;
  void *v24;
  unint64_t v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v7 = a4;
  PLPhotosSearchGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v8;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "FeatureAvailability - HighlightProcessing", ", buf, 2u);
  }

  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "FeatureAvailability - adding highlight enrichment status to processing snapshot", buf, 2u);
  }

  v14 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v15, (uint64_t)v7, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEntity:", v16);

  v34 = 0;
  v17 = objc_msgSend(v7, "countForFetchRequest:error:", v14, &v34);
  v18 = v34;
  if (!v17)
  {
    objc_msgSend(v32, "setFractionOfHighlightsEnriched:", 0.0);
    v23 = v18;
    goto LABEL_27;
  }
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend((id)objc_opt_class(), "_predicateForEnrichedHighlights");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v24);

    v33 = v18;
    v25 = objc_msgSend(v7, "countForFetchRequest:error:", v14, &v33);
    v23 = v33;

    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLBackendGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of enriched highlights, error: %@", buf, 0xCu);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v23);
      v27 = v11;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v28 = v27;
        if (os_signpost_enabled(v27))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", ", buf, 2u);
        }
      }
      v22 = 0;
LABEL_31:
      v18 = v23;
      goto LABEL_32;
    }
    objc_msgSend(v32, "setFractionOfHighlightsEnriched:", (double)v25 / (double)v17);
LABEL_27:
    v29 = v11;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v30 = v29;
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v30, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", ", buf, 2u);
      }
    }
    v22 = 1;
    goto LABEL_31;
  }
  PLBackendGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v18;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of highlights, error: %@", buf, 0xCu);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v18);
  v20 = v11;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - HighlightProcessing", ", buf, 2u);
    }
  }
  v22 = 0;
LABEL_32:

  return v22;
}

- (BOOL)_addAnalysisStatusForMediaTaskID:(unint64_t)a3 toProcessingSnapshot:(id)a4 managedObjectContext:(id)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  unint64_t v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v31;
  id v32;
  uint8_t buf[4];
  unint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v10 = a5;
  PLPhotosSearchGetLog();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "FeatureAvailability - AddAnalysisStatus", ", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext((uint64_t)v16, (uint64_t)v10, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEntity:", v17);

  objc_msgSend((id)objc_opt_class(), "_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:priority:versionProvider:", a3, 0, self->_versionProvider);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v18);

  v32 = 0;
  v19 = objc_msgSend(v10, "countForFetchRequest:error:", v15, &v32);
  v20 = v32;
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 2)
    {
      v23 = objc_msgSend(v31, "totalAssetForScenesCount");
      if (v23)
        v24 = (double)v19 / (double)v23;
      else
        v24 = 0.0;
      objc_msgSend(v31, "setFractionOfAllAssetsAnalyzedForScenes:", v24, v31);
      v22 = 1;
      goto LABEL_20;
    }
    v25 = (void *)PLErrorCreate();
    v26 = v25;
    if (a6)
      *a6 = objc_retainAutorelease(v25);
    PLBackendGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v34 = a3;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "FeatureAvailability - unexpected media processing task ID: %tu", buf, 0xCu);
    }

    goto LABEL_17;
  }
  PLBackendGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    v34 = a3;
    v35 = 2112;
    v36 = v20;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "FeatureAvailability - Failed to fetch count of assets that have been analyzed for media task ID: %tu, error: %@", buf, 0x16u);
  }

  if (!a6)
  {
LABEL_17:
    v22 = 0;
    goto LABEL_20;
  }
  v22 = 0;
  *a6 = objc_retainAutorelease(v20);
LABEL_20:
  v28 = v14;
  v29 = v28;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v29, OS_SIGNPOST_INTERVAL_END, v12, "FeatureAvailability - AddAnalysisStatus", ", buf, 2u);
  }

  return v22;
}

- (BOOL)_addSpotlightSearchIndexingStatusToProcessingSnapshot:(id)a3 forTaskID:(unint64_t)a4 completedCount:(int64_t)a5 totalCount:(int64_t)a6 error:(id *)a7
{
  id v10;
  NSObject *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  uint8_t buf[4];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v26 = a4;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "FeatureAvailability - adding spotlight search indexing status to processing snapshot for taskID: %tu", buf, 0xCu);
  }

  if (a4 == 1)
  {
    v17 = objc_msgSend(v10, "totalAssetCount");
    if (v17)
      v18 = (double)a5 / (double)v17;
    else
      v18 = 0.0;
    objc_msgSend(v10, "setFractionOfAllAssetsWithMediaAnalysisInSearchIndex:", v18);
LABEL_19:
    v23 = 1;
    goto LABEL_20;
  }
  if (a4 == 2)
  {
    v12 = objc_msgSend(v10, "totalCuratedAssetForScenesCount");
    v13 = 0.0;
    v14 = 0.0;
    if (v12)
      v14 = (double)a5 / (double)v12;
    v15 = fmin(v14, 1.0);
    v16 = objc_msgSend(v10, "totalAssetForScenesCount");
    if (v16)
      v13 = (double)a5 / (double)v16;
    objc_msgSend(v10, "setFractionOfCuratedAssetsWithSceneAnalysisInSearchIndex:", v15);
    objc_msgSend(v10, "setFractionOfAllAssetsWithSceneAnalysisInSearchIndex:", fmin(v13, 1.0));
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FeatureAvailability - %s - unexpected media processing taskID: %tu"), "-[PLFeatureAvailabilityComputer _addSpotlightSearchIndexingStatusToProcessingSnapshot:forTaskID:completedCount:totalCount:error:]", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)PLErrorCreate();
  v21 = v20;
  if (a7)
    *a7 = objc_retainAutorelease(v20);
  PLBackendGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = (unint64_t)v19;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v23 = 0;
LABEL_20:

  return v23;
}

- (void)_fetchSpotlightSearchIndexingStatusForTaskID:(unint64_t)a3 photoLibrary:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  os_signpost_id_t v20;
  unint64_t v21;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  PLPhotosSearchGetLog();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FeatureAvailability - IndexingStatusForTaskID", ", buf, 2u);
  }

  objc_msgSend(v7, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchDonationProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3254779904;
    v17[2] = __109__PLFeatureAvailabilityComputer__fetchSpotlightSearchIndexingStatusForTaskID_photoLibrary_completionHandler___block_invoke;
    v17[3] = &unk_1E365E6D8;
    v18 = v8;
    v19 = v12;
    v20 = v10;
    v21 = a3;
    v15 = (id)objc_msgSend(v14, "donationProgressForMediaProcessingTaskID:completionHandler:", a3, v17);

    v16 = v18;
  }
  else
  {
    v16 = (void *)PLErrorCreate();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, 0, v16);
  }

}

- (id)_computeAvailabilityForSnapshot:(id)a3 photoLibrary:(id)a4 shouldPersist:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  PLFeatureAvailability *v11;
  void *v12;

  v6 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PLFeatureAvailability initWithProcessingSnapshot:]([PLFeatureAvailability alloc], "initWithProcessingSnapshot:", v10);

  if (v6)
  {
    -[PLFeatureAvailability dictionary](v11, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFeatureAvailabilityComputer _persistFeatureAvailabilityDictionary:photoLibrary:](self, "_persistFeatureAvailabilityDictionary:photoLibrary:", v12, v9);

  }
  return v11;
}

- (BOOL)_clearAvailabilityForPhotoLibrary:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  -[PLFeatureAvailabilityComputer _persistFeatureAvailabilityDictionary:photoLibrary:](self, "_persistFeatureAvailabilityDictionary:photoLibrary:", 0, v5);
  objc_msgSend(v5, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTimeOfLastFeatureAvailabilityJob:", 0);
  return 1;
}

- (void)_persistFeatureAvailabilityDictionary:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  PLFeatureAvailability *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PLFeatureAvailability *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  PLFeatureAvailabilityProgressDelegate **p_progressDelegate;
  uint64_t i;
  uint64_t v27;
  id WeakRetained;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id *location;
  id obj;
  PLFeatureAvailability *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "globalValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureAvailability");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = v9;
  if (v9)
  {
    v11 = -[PLFeatureAvailability initWithDictionary:]([PLFeatureAvailability alloc], "initWithDictionary:", v9, v9);
    v12 = (void *)MEMORY[0x1E0C99E60];
    v42 = v11;
    -[PLFeatureAvailability availabilityByFeature](v11, "availabilityByFeature");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v15);

    if (v6)
    {
LABEL_3:
      v16 = -[PLFeatureAvailability initWithDictionary:]([PLFeatureAvailability alloc], "initWithDictionary:", v6);
      v17 = (void *)MEMORY[0x1E0C99E60];
      -[PLFeatureAvailability availabilityByFeature](v16, "availabilityByFeature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allKeys");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unionSet:", v20);

      goto LABEL_6;
    }
  }
  else
  {
    v42 = 0;
    if (v6)
      goto LABEL_3;
  }
  v16 = 0;
LABEL_6:
  v38 = v7;
  objc_msgSend(v7, "globalValues", v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v6;
  objc_msgSend(v21, "setFeatureAvailability:", v6);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v10;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v44;
    p_progressDelegate = &self->_progressDelegate;
    location = (id *)&self->_transitionDelegate;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained((id *)p_progressDelegate);
        objc_msgSend(WeakRetained, "featureAvailability:updateProgressForFeature:", v16, v27);

        -[PLFeatureAvailability availabilityByFeature](v42, "availabilityByFeature");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "BOOLValue");

        -[PLFeatureAvailability availabilityByFeature](v16, "availabilityByFeature");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", v27);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "BOOLValue");

        if (v31 != (_DWORD)v34)
        {
          v35 = objc_loadWeakRetained(location);
          objc_msgSend(v35, "availability:feature:didTransition:", v16, v27, v34);

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v23);
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_progressDelegate);
  objc_destroyWeak((id *)&self->_transitionDelegate);
  objc_storeStrong((id *)&self->_versionProvider, 0);
}

void __109__PLFeatureAvailabilityComputer__fetchSpotlightSearchIndexingStatusForTaskID_photoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const char *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[PLFeatureAvailabilityComputer _fetchSpotlightSearchIndexingStatusForTaskID:photoLibrary:completionHandler:]_block_invoke";
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - searchDonationProgress failed with error: %@", (uint8_t *)&v14, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v9 = *(id *)(a1 + 40);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      LOWORD(v14) = 0;
LABEL_12:
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - IndexingStatusForTaskID", ", (uint8_t *)&v14, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = *(const char **)(a1 + 56);
      v14 = 134217984;
      v15 = v12;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "FeatureAvailability - Finished indexing status task for taskID: %tu", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v5, "completedUnitCount");
    objc_msgSend(v5, "totalUnitCount");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v13 = *(id *)(a1 + 40);
    v10 = v13;
    v11 = *(_QWORD *)(a1 + 48);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v14) = 0;
      goto LABEL_12;
    }
  }

}

void __117__PLFeatureAvailabilityComputer__step08_AddMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16[3];
  char v17;

  v9 = a5;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__PLFeatureAvailabilityComputer__step08_AddMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3670D28;
  v17 = a2;
  v11 = v9;
  v13 = v11;
  v15 = a1[5];
  objc_copyWeak(v16, a1 + 6);
  v14 = a1[4];
  v16[1] = a3;
  v16[2] = a4;
  objc_msgSend(v10, "sync:identifyingBlock:library:", v12, 0, 0);

  objc_destroyWeak(v16);
}

void __117__PLFeatureAvailabilityComputer__step08_AddMediaAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 80))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 64);
      v6 = *(_QWORD *)(a1 + 72);
      v16 = 0;
      v7 = objc_msgSend(WeakRetained, "_addSpotlightSearchIndexingStatusToProcessingSnapshot:forTaskID:completedCount:totalCount:error:", v4, 1, v5, v6, &v16);
      v8 = v16;
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[PLFeatureAvailabilityComputer _step08_AddMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:comple"
                "tionHandler:]_block_invoke";
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "FeatureAvailability - %s - finished all processing steps, will signal complete with populated processing snapshot", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", *(_QWORD *)(a1 + 40));
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "-[PLFeatureAvailabilityComputer _step08_AddMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:comple"
                "tionHandler:]_block_invoke";
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v8);
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v15 = (void *)v11;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step08_AddMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
    }
  }
  else
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v18 = "-[PLFeatureAvailabilityComputer _step08_AddMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completion"
            "Handler:]_block_invoke_2";
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v3);
  }

}

void __117__PLFeatureAvailabilityComputer__step07_AddSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(id *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[3];
  char v18;

  v9 = a5;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __117__PLFeatureAvailabilityComputer__step07_AddSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2;
  v12[3] = &unk_1E3670CD8;
  v18 = a2;
  v11 = v9;
  v13 = v11;
  v16 = a1[6];
  objc_copyWeak(v17, a1 + 7);
  v14 = a1[4];
  v17[1] = a3;
  v17[2] = a4;
  v15 = a1[5];
  objc_msgSend(v10, "sync:identifyingBlock:library:", v12, 0, 0);

  objc_destroyWeak(v17);
}

void __117__PLFeatureAvailabilityComputer__step07_AddSceneAnalysisIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 88))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 80);
      v15 = 0;
      v7 = objc_msgSend(WeakRetained, "_addSpotlightSearchIndexingStatusToProcessingSnapshot:forTaskID:completedCount:totalCount:error:", v4, 2, v5, v6, &v15);
      v8 = v15;
      if (v7)
      {
        objc_msgSend(v3, "_step08_AddMediaAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      }
      else
      {
        PLBackendGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v17 = "-[PLFeatureAvailabilityComputer _step07_AddSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:comple"
                "tionHandler:]_block_invoke";
          v18 = 2112;
          v19 = v8;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
        }

        v13 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

      }
    }
    else
    {
      PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step07_AddSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 56));
    }
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v17 = "-[PLFeatureAvailabilityComputer _step07_AddSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completion"
            "Handler:]_block_invoke_2";
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v3);
  }

}

void __109__PLFeatureAvailabilityComputer__step06_AddSceneAnalysisToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(WeakRetained, "_addAnalysisStatusForMediaTaskID:toProcessingSnapshot:managedObjectContext:error:", 2, v3, v4, &v9);
    v6 = v9;

    if (v5)
    {
      objc_msgSend(WeakRetained, "_step07_AddSceneAnalysisIndexingToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[PLFeatureAvailabilityComputer _step06_AddSceneAnalysisToProcessingSnapshot:photoLibrary:completionHandle"
              "r:]_block_invoke";
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step06_AddSceneAnalysisToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }

}

void __111__PLFeatureAvailabilityComputer__step05_AddHighlightStatusToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(WeakRetained, "_addHighlightStatusToProcessingSnapshot:managedObjectContext:error:", v3, v4, &v9);
    v6 = v9;

    if (v5)
    {
      objc_msgSend(WeakRetained, "_step06_AddSceneAnalysisToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[PLFeatureAvailabilityComputer _step05_AddHighlightStatusToProcessingSnapshot:photoLibrary:completionHand"
              "ler:]_block_invoke";
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step05_AddHighlightStatusToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }

}

void __113__PLFeatureAvailabilityComputer__step04_AddEmbeddingIndexingToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    LODWORD(v3) = objc_msgSend(WeakRetained, "_addEmbeddingVectorIndexingStatusToProcessingSnapshot:managedObjectContext:error:", v3, v4, &v13);
    v5 = v13;

    if ((_DWORD)v3)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v12 = v5;
      v8 = objc_msgSend(WeakRetained, "_addVisualUnderstandingClusterIndexStatusToProcessingSnapshot:photoLibrary:error:", v6, v7, &v12);
      v9 = v12;

      if (v8)
      {
        objc_msgSend(WeakRetained, "_step05_AddHighlightStatusToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      v9 = v5;
    }
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[PLFeatureAvailabilityComputer _step04_AddEmbeddingIndexingToProcessingSnapshot:photoLibrary:completionHand"
            "ler:]_block_invoke";
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    goto LABEL_10;
  }
  PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step04_AddEmbeddingIndexingToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
LABEL_11:

}

void __106__PLFeatureAvailabilityComputer__step03_AddCaptioningToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(WeakRetained, "_addCaptioningStatusToProcessingSnapshot:managedObjectContext:error:", v3, v4, &v9);
    v6 = v9;

    if (v5)
    {
      objc_msgSend(WeakRetained, "_step04_AddEmbeddingIndexingToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[PLFeatureAvailabilityComputer _step03_AddCaptioningToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step03_AddCaptioningToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }

}

void __115__PLFeatureAvailabilityComputer__step02_AddAssetForSceneCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(WeakRetained, "_addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:", v3, v4, 1, &v9);
    v6 = v9;

    if (v5)
    {
      objc_msgSend(WeakRetained, "_step03_AddCaptioningToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[PLFeatureAvailabilityComputer _step02_AddAssetForSceneCountsToProcessingSnapshot:photoLibrary:completion"
              "Handler:]_block_invoke";
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step02_AddAssetForSceneCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }

}

void __107__PLFeatureAvailabilityComputer__step01_AddAssetCountsToProcessingSnapshot_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(WeakRetained, "_addAssetCountsToProcessingSnapshot:managedObjectContext:forSceneAnalysis:error:", v3, v4, 0, &v9);
    v6 = v9;

    if (v5)
    {
      objc_msgSend(WeakRetained, "_step02_AddAssetForSceneCountsToProcessingSnapshot:photoLibrary:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[PLFeatureAvailabilityComputer _step01_AddAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke";
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    PLMissingWeakSelfCallCompletionHandlerFromFunctionName((uint64_t)"-[PLFeatureAvailabilityComputer _step01_AddAssetCountsToProcessingSnapshot:photoLibrary:completionHandler:]_block_invoke", *(void **)(a1 + 48));
  }

}

void __77__PLFeatureAvailabilityComputer_clearAvailabilityStateForPhotoLibrary_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  obj = 0;
  v4 = objc_msgSend(v2, "_clearAvailabilityForPhotoLibrary:error:", v3, &obj);
  v5 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
}

void __100__PLFeatureAvailabilityComputer_computeAvailabilityForPhotoLibrary_shouldPersist_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v23 = "-[PLFeatureAvailabilityComputer computeAvailabilityForPhotoLibrary:shouldPersist:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "FeatureAvailability - %s - failed with error: %@", buf, 0x16u);

    }
    v6 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v3, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "failureWithError:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = *(id *)(a1 + 56);
    v10 = v9;
    v11 = *(_QWORD *)(a1 + 64);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FeatureAvailability - ComputeAndPersistAvailability", ", buf, 2u);
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v3, "result");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(unsigned __int8 *)(a1 + 72);
    v21 = 0;
    objc_msgSend(WeakRetained, "_computeAvailabilityForSnapshot:photoLibrary:shouldPersist:error:", v13, v14, v15, &v21);
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = v21;

    if (v10)
      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v10);
    else
      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "FeatureAvailability - finished computing feature availability", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v18 = *(id *)(a1 + 56);
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 64);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v20, "FeatureAvailability - ComputeAndPersistAvailability", ", buf, 2u);
    }

  }
}

void __82__PLFeatureAvailabilityComputer_computeSnapshotForPhotoLibrary_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDateComputed:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "FeatureAvailability - finished computed processing snapshot", buf, 2u);
  }

  v7 = *(id *)(a1 + 40);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v9, "FeatureAvailability - TotalSnapshotCompute", ", v10, 2u);
  }

}

+ (id)_predicateForCountOfProcessedAssetsForMediaProcessingTaskID:(unint64_t)a3 priority:(unint64_t)a4 versionProvider:(id)a5
{
  return PLInternalPredicateForMediaProcessingTaskID(a3, a4, a5, 1, 0, 0.0);
}

+ (id)_predicateForAllCuratedAssetsForSceneAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  PLExtendedAssetsInHighlightPredicate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets](PLManagedAsset, "predicateToIncludeOnlyAllowedForAnalysisAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  objc_msgSend((id)objc_opt_class(), "_predicatesForVisibleAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  objc_msgSend((id)objc_opt_class(), "_savedAssetTypePredicateForSceneAnalysis:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
      objc_msgSend(v4, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_predicateForAllAssetsAllowedForProcessingForSceneAnalysis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets](PLManagedAsset, "predicateToIncludeOnlyAllowedForAnalysisAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  objc_msgSend((id)objc_opt_class(), "_predicatesForVisibleAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend((id)objc_opt_class(), "_savedAssetTypePredicateForSceneAnalysis:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  if (objc_msgSend(v4, "count"))
  {
    if (objc_msgSend(v4, "count") == 1)
      objc_msgSend(v4, "firstObject");
    else
      objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_predicatesForVisibleAssets
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[PLManagedAsset predicateToExcludeHiddenAssets](PLManagedAsset, "predicateToExcludeHiddenAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "addObject:", v3);
  +[PLManagedAsset predicateToExcludeTrashedAssets](PLManagedAsset, "predicateToExcludeTrashedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v2, "addObject:", v4);
  +[PLManagedAsset predicateToExcludeNonvisibleBurstAssets](PLManagedAsset, "predicateToExcludeNonvisibleBurstAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v2, "addObject:", v5);

  return v2;
}

+ (id)_savedAssetTypePredicateForSceneAnalysis:(BOOL)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0D73310], "maskForFeatureAvailabilityForSceneAnalysis:", a3);
  return (id)objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", v3, 1);
}

+ (id)_predicateForEnrichedHighlights
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("enrichmentState"), 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %K"), CFSTR("enrichmentVersion"), CFSTR("highlightVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
