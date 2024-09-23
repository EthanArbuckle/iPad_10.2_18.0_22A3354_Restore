@implementation PLAnalysisCoordinatorStepSearchSuggestions

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
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Search Suggestions Step", buf, 0xCu);

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
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AnalysisCoordinatorStepSearchSuggestions", "asset count: %{public}lu, parent task: %{public}@", buf, 0x16u);

  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3254779904;
  v21[2] = __102__PLAnalysisCoordinatorStepSearchSuggestions_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E365EAE0;
  v21[4] = self;
  v23 = v16;
  v24 = v14;
  v19 = v10;
  v22 = v19;
  v20 = v16;
  -[PLAnalysisCoordinatorStepSearchSuggestions _performStepForAssets:withProgress:withCompletionHandler:](self, "_performStepForAssets:withProgress:withCompletionHandler:", v8, v9, v21);

}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSObject *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSObject *))a5;
  -[PLAnalysisCoordinatorStep libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLAnalysisCoordinatorStepSearchSuggestions _performStepForAssets:withProgress:withCompletionHandler:]");

  if (v13)
  {
    objc_msgSend(v13, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "wellKnownPhotoLibraryIdentifier");

    if (v15 == 1)
    {
      +[PLInitialSuggestionsManager generateInitialSuggestionsForPhotoLibrary:](PLInitialSuggestionsManager, "generateInitialSuggestionsForPhotoLibrary:", v13);
      objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + objc_msgSend(v8, "count"));
      v16 = (void *)MEMORY[0x1E0D732B8];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "successWithResult:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v10[2](v10, v18);
    }
    else
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 134217984;
        v23 = v15;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Initial suggestion generation requested for unsupported library with identifier: %tu. No initial suggestions will be generated.", (uint8_t *)&v22, 0xCu);
      }
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D732B8];
    v20 = (void *)PLErrorCreate();
    objc_msgSend(v19, "failureWithError:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v10[2](v10, v21);

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
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Search Suggestions Step request to be cancelled, cannot actively stop but step will end soon", (uint8_t *)&v5, 0xCu);

  }
}

void __102__PLAnalysisCoordinatorStepSearchSuggestions_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Search Suggestions Step with result: %{public}@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(id *)(a1 + 48);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorStepSearchSuggestions", ", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
