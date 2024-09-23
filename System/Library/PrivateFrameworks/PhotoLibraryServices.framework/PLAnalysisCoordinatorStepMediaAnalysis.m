@implementation PLAnalysisCoordinatorStepMediaAnalysis

- (PLAnalysisCoordinatorStepMediaAnalysis)initWithLibraryServicesManager:(id)a3 parentTaskID:(id)a4 processingType:(unint64_t)a5
{
  PLAnalysisCoordinatorStepMediaAnalysis *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLAnalysisCoordinatorStepMediaAnalysis;
  result = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:](&v7, sel_initWithLibraryServicesManager_parentTaskID_, a3, a4);
  if (result)
    result->_processingType = a5;
  return result;
}

- (void)performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  unint64_t processingType;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  _QWORD v23[5];
  id v24;
  NSObject *v25;
  os_signpost_id_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLAnalysisCoordinatorGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    processingType = self->_processingType;
    *(_DWORD *)buf = 138543618;
    v28 = (uint64_t)v12;
    v29 = 2048;
    v30 = processingType;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Media Analysis Step. Type: %lu", buf, 0x16u);

  }
  PLAnalysisCoordinatorGetLog();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    v18 = objc_msgSend(v8, "count");
    v19 = self->_processingType;
    -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v28 = v18;
    v29 = 2050;
    v30 = v19;
    v31 = 2114;
    v32 = v20;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "AnalysisCoordinatorStepMediaAnalysis", "asset count: %{public}lu, type: %{public}lu, parent task: %{public}@", buf, 0x20u);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3254779904;
  v23[2] = __98__PLAnalysisCoordinatorStepMediaAnalysis_performStepForAssets_withProgress_withCompletionHandler___block_invoke;
  v23[3] = &unk_1E365EAE0;
  v23[4] = self;
  v25 = v17;
  v26 = v15;
  v21 = v10;
  v24 = v21;
  v22 = v17;
  -[PLAnalysisCoordinatorStepMediaAnalysis _performStepForAssets:withProgress:withCompletionHandler:](self, "_performStepForAssets:withProgress:withCompletionHandler:", v8, v9, v23);

}

- (void)_performStepForAssets:(id)a3 withProgress:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  PLAnalysisCoordinatorStepMediaAnalysis *v21;
  id v22;
  id v23;
  uint64_t v24;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[PLAnalysisCoordinatorStep libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "databaseContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "newShortLivedLibraryWithName:", "-[PLAnalysisCoordinatorStepMediaAnalysis _performStepForAssets:withProgress:withCompletionHandler:]");

  if (v12)
  {
    v13 = objc_msgSend(v17, "count");
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E3676218;
    v19 = v17;
    v20 = v12;
    v21 = self;
    v22 = v8;
    v24 = v13;
    v23 = v9;
    objc_msgSend(v20, "performBlockAndWait:", v18);

    v14 = v19;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D732B8];
    v14 = (void *)PLErrorCreate();
    objc_msgSend(v15, "failureWithError:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v16);

  }
}

- (void)cancel
{
  os_unfair_lock_s *p_lock_currentMediaAnalysisRequestID;
  int64_t currentMediaAnalysisRequestID;
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock_currentMediaAnalysisRequestID = &self->_lock_currentMediaAnalysisRequestID;
  os_unfair_lock_lock(&self->_lock_currentMediaAnalysisRequestID);
  currentMediaAnalysisRequestID = self->_currentMediaAnalysisRequestID;
  v5 = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
  PLAnalysisCoordinatorGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (currentMediaAnalysisRequestID == v5)
  {
    if (v7)
    {
      -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Media Analysis step but no active media request ID", (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      -[PLAnalysisCoordinatorStep parentTaskID](self, "parentTaskID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_currentMediaAnalysisRequestID;
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = v10;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Media Analysis step with media request ID: %lu", (uint8_t *)&v11, 0x16u);

    }
    +[PLMediaAnalysisServiceRequestAdapter cancelRequest:](PLMediaAnalysisServiceRequestAdapter, "cancelRequest:", self->_currentMediaAnalysisRequestID);
    self->_currentMediaAnalysisRequestID = +[PLMediaAnalysisServiceRequestAdapter invalidRequestID](PLMediaAnalysisServiceRequestAdapter, "invalidRequestID");
  }
  os_unfair_lock_unlock(p_lock_currentMediaAnalysisRequestID);
}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetsWithObjectIDs:inLibrary:](PLManagedAsset, "assetsWithObjectIDs:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v8), "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  v10 = *(_QWORD **)(a1 + 48);
  v11 = v10[5];
  objc_msgSend(v10, "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "libraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_2;
  v25[3] = &unk_1E366EFD8;
  v14 = *(void **)(a1 + 56);
  v25[4] = *(_QWORD *)(a1 + 48);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_24;
  v21 = &unk_1E366F000;
  v15 = v14;
  v17 = *(void **)(a1 + 64);
  v16 = *(_QWORD *)(a1 + 72);
  v22 = v15;
  v24 = v16;
  v23 = v17;
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) = +[PLMediaAnalysisServiceRequestAdapter requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:](PLMediaAnalysisServiceRequestAdapter, "requestProcessingTypes:forAssetsWithLocalIdentifiers:fromPhotoLibraryWithURL:progressHandler:completionHandler:", v11, v3, v13, v25, &v18);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  if (objc_msgSend(*(id *)(a1 + 56), "isCancelled", v18, v19, v20, v21))
    objc_msgSend(*(id *)(a1 + 48), "cancel");

}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_2(uint64_t a1, double a2)
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLAnalysisCoordinatorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "parentTaskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = a2;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Progress update: %f", (uint8_t *)&v6, 0x16u);

  }
}

void __99__PLAnalysisCoordinatorStepMediaAnalysis__performStepForAssets_withProgress_withCompletionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(_QWORD *)(a1 + 48) + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x1E0D732B8];
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "successWithResult:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

}

void __98__PLAnalysisCoordinatorStepMediaAnalysis_performStepForAssets_withProgress_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLAnalysisCoordinatorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "parentTaskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v10 = 138543874;
    v11 = v5;
    v12 = 2050;
    v13 = v6;
    v14 = 2114;
    v15 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished Media Analysis Step for type: %{public}lu with result: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  v7 = *(id *)(a1 + 48);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_END, v9, "AnalysisCoordinatorStepMediaAnalysis", ", (uint8_t *)&v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
