@implementation PLAnalysisCoordinatorStepSearchIndexing

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  NSObject *v23;
  os_signpost_id_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLAnalysisCoordinatorGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v26 = (uint64_t)v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Search Indexing Step", buf, 0xCu);

  }
  PLAnalysisCoordinatorGetLog();
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = objc_msgSend(v8, "count");
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349314;
    v26 = v17;
    v27 = 2114;
    v28 = v18;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AnalysisCoordinatorStepSearchIndexing", "asset count: %{public}lu, parent task: %{public}@", buf, 0x16u);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3254779904;
  v21[2] = __99__PLAnalysisCoordinatorStepSearchIndexing_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E365EAE0;
  v21[4] = self;
  v23 = v16;
  v24 = v14;
  v19 = v10;
  v22 = v19;
  v20 = v16;
  -[PLAnalysisCoordinatorStepSearchIndexing _performStepForAssets:withProgress:withCompletionHandler:](self, "_performStepForAssets:withProgress:withCompletionHandler:", v8, v9, v21);

}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLAnalysisCoordinatorStep libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAnalysisCoordinatorStepSearchIndexing _performStepForAssets:withProgress:withCompletionHandler:]");

  if (v13)
  {
    -[PLAnalysisCoordinatorStep libraryServicesManager](self, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchIndexingEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __100__PLAnalysisCoordinatorStepSearchIndexing__performStepForAssets_withProgress_withCompletionHandler___block_invoke;
      v21[3] = &unk_1E366F590;
      v22 = v10;
      -[PLAnalysisCoordinatorStepSearchIndexing _batchIndexAssetStartingAtIndex:withAssetIDs:searchIndexingEngine:library:progress:withCompletionHandler:](self, "_batchIndexAssetStartingAtIndex:withAssetIDs:searchIndexingEngine:library:progress:withCompletionHandler:", 0, v8, v15, v13, v9, v21);

    }
    else
    {
      v18 = (void *)MEMORY[0x1E0D732B8];
      v19 = (void *)PLErrorCreate();
      objc_msgSend(v18, "failureWithError:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v20);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D732B8];
    v15 = (void *)PLErrorCreate();
    objc_msgSend(v16, "failureWithError:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v17);

  }
}

- (void)_batchIndexAssetStartingAtIndex:(unint64_t)a3 withAssetIDs:(id)a4 searchIndexingEngine:(id)a5 library:(id)a6 progress:(id)a7 withCompletionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  PLAnalysisCoordinatorStepSearchIndexing *v32;
  id v33;
  id v34;
  id v35;
  void (**v36)(id, void *);
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, void *))a8;
  if (objc_msgSend(v14, "count") <= a3)
  {
    v22 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "successWithResult:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v18[2](v18, v24);
  }
  else if (objc_msgSend(v17, "isCancelled"))
  {
    v19 = (void *)MEMORY[0x1E0D732B8];
    v20 = (void *)PLErrorCreate();
    objc_msgSend(v19, "failureWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v21);

  }
  else
  {
    v25 = objc_msgSend(v14, "count");
    if (v25 - a3 >= 0xC8)
      v26 = 200;
    else
      v26 = v25 - a3;
    PLAnalysisCoordinatorGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v28;
      v42 = 2048;
      v43 = a3;
      v44 = 2048;
      v45 = a3 + v26 - 1;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Batch Search Indexing Range [%lu...%lu]", buf, 0x20u);

    }
    objc_msgSend(v14, "subarrayWithRange:", a3, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __148__PLAnalysisCoordinatorStepSearchIndexing__batchIndexAssetStartingAtIndex_withAssetIDs_searchIndexingEngine_library_progress_withCompletionHandler___block_invoke;
    v30[3] = &unk_1E3661850;
    v31 = v17;
    v32 = self;
    v37 = v26;
    v38 = a3;
    v39 = 200;
    v33 = v14;
    v34 = v15;
    v35 = v16;
    v36 = v18;
    objc_msgSend(v34, "indexAssetsIfNeededWithObjectIDs:library:completion:", v29, v35, v30);

  }
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLAnalysisCoordinatorGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Search Indexing Step request to be cancelled, iterations will stop", (uint8_t *)&v5, 0xCu);

  }
}

void __148__PLAnalysisCoordinatorStepSearchIndexing__batchIndexAssetStartingAtIndex_withAssetIDs_searchIndexingEngine_library_progress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(_QWORD *)(a1 + 80) + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
    objc_msgSend(*(id *)(a1 + 40), "_batchIndexAssetStartingAtIndex:withAssetIDs:searchIndexingEngine:library:progress:withCompletionHandler:", *(_QWORD *)(a1 + 96) + *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72));
  }
  else
  {
    PLAnalysisCoordinatorGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "parentTaskID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Batch Search Indexing Failed with Error: %@", (uint8_t *)&v7, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __100__PLAnalysisCoordinatorStepSearchIndexing__performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __99__PLAnalysisCoordinatorStepSearchIndexing_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLAnalysisCoordinatorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "parentTaskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Search Indexing Step with result: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(id *)(a1 + 48);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorStepSearchIndexing", ", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
