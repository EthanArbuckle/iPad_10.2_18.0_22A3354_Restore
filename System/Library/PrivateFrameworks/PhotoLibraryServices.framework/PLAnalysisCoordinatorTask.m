@implementation PLAnalysisCoordinatorTask

- (id)initForFeature:(unint64_t)a3 assets:(id)a4 lsm:(id)a5
{
  id v10;
  id v11;
  PLAnalysisCoordinatorTask *v12;
  void *v13;
  uint64_t v14;
  NSString *taskID;
  uint64_t v16;
  NSArray *steps;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSProgress *progress;
  PLAnalysisCoordinatorTask *v22;
  void *v24;
  objc_super v25;

  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLAnalysisCoordinatorTask;
  v12 = -[PLAnalysisCoordinatorTask init](&v25, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    taskID = v12->_taskID;
    v12->_taskID = (NSString *)v14;

    objc_storeStrong((id *)&v12->_assets, a4);
    objc_storeStrong((id *)&v12->_lsm, a5);
    +[PLAnalysisCoordinatorTask _orderedStepsForFeature:withLibraryServicesManager:taskID:](PLAnalysisCoordinatorTask, "_orderedStepsForFeature:withLibraryServicesManager:taskID:", a3, v11, v12->_taskID);
    v16 = objc_claimAutoreleasedReturnValue();
    steps = v12->_steps;
    v12->_steps = (NSArray *)v16;

    if (!-[NSArray count](v12->_steps, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PLAnalysisCoordinatorTask.m"), 48, CFSTR("Task must have at least one step"));

    }
    v18 = -[NSArray count](v12->_steps, "count");
    v19 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", v19 * v18);
    v20 = objc_claimAutoreleasedReturnValue();
    progress = v12->_progress;
    v12->_progress = (NSProgress *)v20;

    v12->_currentStepIndex = 0;
    v12->_lock_currentStepIndex._os_unfair_lock_opaque = 0;
    v22 = v12;
  }

  return v12;
}

- (void)_executeStepsStartingAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  NSString *taskID;
  NSObject *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *assets;
  NSProgress *progress;
  _QWORD v20[5];
  void (**v21)(id, void *);
  unint64_t v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  os_unfair_lock_lock(&self->_lock_currentStepIndex);
  self->_currentStepIndex = a3;
  os_unfair_lock_unlock(&self->_lock_currentStepIndex);
  if (-[NSArray count](self->_steps, "count") <= a3)
  {
    v14 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "successWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v6[2](v6, v16);
  }
  else
  {
    PLAnalysisCoordinatorGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      taskID = self->_taskID;
      *(_DWORD *)buf = 138543618;
      v24 = taskID;
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing step %lu", buf, 0x16u);
    }

    if (-[NSProgress isCancelled](self->_progress, "isCancelled"))
    {
      PLAnalysisCoordinatorGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_taskID;
        *(_DWORD *)buf = 138543618;
        v24 = v10;
        v25 = 2048;
        v26 = a3;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Abandoning step %lu due to cancelled progress", buf, 0x16u);
      }

      v11 = (void *)MEMORY[0x1E0D732B8];
      v12 = (void *)PLErrorCreate();
      objc_msgSend(v11, "failureWithError:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v13);

    }
    else
    {
      -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      assets = self->_assets;
      progress = self->_progress;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __80__PLAnalysisCoordinatorTask__executeStepsStartingAtIndex_withCompletionHandler___block_invoke;
      v20[3] = &unk_1E366A130;
      v20[4] = self;
      v22 = a3;
      v21 = v6;
      objc_msgSend(v17, "performStepForAssets:withProgress:withCompletionHandler:", assets, progress, v20);

    }
  }

}

- (void)executeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSString *taskID;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSUInteger v12;
  NSString *v13;
  NSProgress *progress;
  uint64_t v15;
  NSObject *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  _QWORD v22[4];
  id v23;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  NSUInteger v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_199541000, "analysis-coordinator-task", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  PLAnalysisCoordinatorGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    taskID = self->_taskID;
    *(_DWORD *)buf = 138543362;
    v26 = (NSUInteger)taskID;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting Task", buf, 0xCu);
  }

  PLAnalysisCoordinatorGetLog();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = -[NSArray count](self->_assets, "count");
    v13 = self->_taskID;
    *(_DWORD *)buf = 134218242;
    v26 = v12;
    v27 = 2114;
    v28 = v13;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "AnalysisCoordinatorTask", "asset count: %lu, uuid: %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  progress = self->_progress;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E3677D48;
  objc_copyWeak(&v23, (id *)buf);
  -[NSProgress setCancellationHandler:](progress, "setCancellationHandler:", v22);
  v18[0] = v15;
  v18[1] = 3254779904;
  v18[2] = __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke_2;
  v18[3] = &unk_1E365EAE0;
  v18[4] = self;
  v16 = v11;
  v20 = v16;
  v21 = v9;
  v17 = v4;
  v19 = v17;
  -[PLAnalysisCoordinatorTask _executeStepsStartingAtIndex:withCompletionHandler:](self, "_executeStepsStartingAtIndex:withCompletionHandler:", 0, v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);

  os_activity_scope_leave(&state);
}

- (void)_cancel
{
  NSObject *v3;
  NSString *taskID;
  unint64_t currentStepIndex;
  NSObject *v6;
  NSString *v7;
  NSUInteger v8;
  unint64_t v9;
  int v10;
  NSString *v11;
  __int16 v12;
  NSUInteger v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLAnalysisCoordinatorGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    taskID = self->_taskID;
    v10 = 138543362;
    v11 = taskID;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling Task", (uint8_t *)&v10, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock_currentStepIndex);
  currentStepIndex = self->_currentStepIndex;
  if (currentStepIndex >= -[NSArray count](self->_steps, "count"))
  {
    PLAnalysisCoordinatorGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = self->_taskID;
      v8 = -[NSArray count](self->_steps, "count");
      v9 = self->_currentStepIndex;
      v10 = 138543874;
      v11 = v7;
      v12 = 2050;
      v13 = v8;
      v14 = 2050;
      v15 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] All %{public}lu steps completed, nothing to cancel. %{public}lu step out of bounds", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_steps, "objectAtIndexedSubscript:", self->_currentStepIndex);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject cancel](v6, "cancel");
  }

  os_unfair_lock_unlock(&self->_lock_currentStepIndex);
}

- (NSString)taskID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_taskID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

void __58__PLAnalysisCoordinatorTask_executeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLAnalysisCoordinatorGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finishing Task with result: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = *(id *)(a1 + 48);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v8, "AnalysisCoordinatorTask", ", (uint8_t *)&v9, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__PLAnalysisCoordinatorTask__executeStepsStartingAtIndex_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    PLAnalysisCoordinatorGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v5;
      v10 = 2048;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Step %lu failed due to %@", (uint8_t *)&v8, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_executeStepsStartingAtIndex:withCompletionHandler:", *(_QWORD *)(a1 + 48) + 1, *(_QWORD *)(a1 + 40));
  }

}

+ (id)_orderedStepsForFeature:(unint64_t)a3 withLibraryServicesManager:(id)a4 taskID:(id)a5
{
  id v7;
  id v8;
  PLAnalysisCoordinatorStepMediaAnalysis *v9;
  PLAnalysisCoordinatorStepMediaAnalysis *v10;
  PLAnalysisCoordinatorStepSearchIndexing *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[2];
  PLAnalysisCoordinatorStepMediaAnalysis *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  switch(a3)
  {
    case 1uLL:
      v9 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 1);
      v22[0] = v9;
      v10 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 16);
      v22[1] = v10;
      v11 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepSearchIndexing alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
      v22[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 2uLL:
      v9 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepSearchIndexing alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
      v21[0] = v9;
      v10 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepSearchSuggestions alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
      v21[1] = v10;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v21;
      goto LABEL_9;
    case 3uLL:
      v9 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 1);
      v20[0] = v9;
      v10 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepSearchIndexing alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
      v20[1] = v10;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v20;
      goto LABEL_9;
    case 4uLL:
      v9 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 8);
      v19 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5uLL:
      v9 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 1);
      v18[0] = v9;
      v10 = -[PLAnalysisCoordinatorStepMediaAnalysis initWithLibraryServicesManager:parentTaskID:processingType:]([PLAnalysisCoordinatorStepMediaAnalysis alloc], "initWithLibraryServicesManager:parentTaskID:processingType:", v7, v8, 8);
      v18[1] = v10;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = v18;
      goto LABEL_9;
    default:
      if (a3 == 100)
      {
        v9 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepEmpty alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
        v17[0] = v9;
        v10 = -[PLAnalysisCoordinatorStep initWithLibraryServicesManager:parentTaskID:]([PLAnalysisCoordinatorStepEmpty alloc], "initWithLibraryServicesManager:parentTaskID:", v7, v8);
        v17[1] = v10;
        v13 = (void *)MEMORY[0x1E0C99D20];
        v14 = v17;
LABEL_9:
        objc_msgSend(v13, "arrayWithObjects:count:", v14, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

      }
      else
      {
        PLAnalysisCoordinatorGetLog();
        v9 = (PLAnalysisCoordinatorStepMediaAnalysis *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_199541000, &v9->super.super, OS_LOG_TYPE_FAULT, "Unaccounted for AnalysisCoordinatorFeature", v16, 2u);
        }
        v12 = (void *)MEMORY[0x1E0C9AA60];
      }
LABEL_11:

      return v12;
  }
}

@end
