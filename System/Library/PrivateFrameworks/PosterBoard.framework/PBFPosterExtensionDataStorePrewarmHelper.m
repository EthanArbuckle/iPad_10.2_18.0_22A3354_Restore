@implementation PBFPosterExtensionDataStorePrewarmHelper

- (PBFPosterExtensionDataStorePrewarmHelper)initWithPlan:(id)a3
{
  id v5;
  void *v6;
  PBFPosterExtensionDataStorePrewarmHelper *v7;
  PBFPosterExtensionDataStorePrewarmHelper *v8;
  uint64_t v9;
  PBFPosterExtensionDataStorePrewarmPlan *plan;
  uint64_t v11;
  BSAtomicFlag *invalidationFlag;
  uint64_t v13;
  BSAtomicFlag *finishedFlag;
  uint64_t v15;
  NSMutableDictionary *lock_fatalErrorForPhase;
  uint64_t v17;
  NSMutableDictionary *lock_nonFatalErrorsForPhase;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  dispatch_group_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *dispatchGroupForPhase;
  uint64_t v31;
  NSDictionary *completionFlagForPhase;
  dispatch_workloop_t inactive;
  OS_dispatch_workloop *workloop;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("plan"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStorePrewarmHelper initWithPlan:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v36), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBABCFE8);
  }
  v6 = v5;
  v42.receiver = self;
  v42.super_class = (Class)PBFPosterExtensionDataStorePrewarmHelper;
  v7 = -[PBFPosterExtensionDataStorePrewarmHelper init](&v42, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v6, "copy");
    plan = v8->_plan;
    v8->_plan = (PBFPosterExtensionDataStorePrewarmPlan *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    invalidationFlag = v8->_invalidationFlag;
    v8->_invalidationFlag = (BSAtomicFlag *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
    finishedFlag = v8->_finishedFlag;
    v8->_finishedFlag = (BSAtomicFlag *)v13;

    v15 = objc_opt_new();
    lock_fatalErrorForPhase = v8->_lock_fatalErrorForPhase;
    v8->_lock_fatalErrorForPhase = (NSMutableDictionary *)v15;

    v17 = objc_opt_new();
    lock_nonFatalErrorsForPhase = v8->_lock_nonFatalErrorsForPhase;
    v8->_lock_nonFatalErrorsForPhase = (NSMutableDictionary *)v17;

    v19 = (void *)objc_opt_new();
    v20 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v6;
    objc_msgSend(v6, "prewarmPhasePlan");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v25);
          v27 = dispatch_group_create();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v27, v26);

          v28 = (void *)objc_opt_new();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v23);
    }

    v29 = objc_msgSend(v19, "copy");
    dispatchGroupForPhase = v8->_dispatchGroupForPhase;
    v8->_dispatchGroupForPhase = (NSDictionary *)v29;

    v31 = objc_msgSend(v20, "copy");
    completionFlagForPhase = v8->_completionFlagForPhase;
    v8->_completionFlagForPhase = (NSDictionary *)v31;

    -[PBFPosterExtensionDataStorePrewarmHelper setActivePhase:](v8, "setActivePhase:", CFSTR("PBFPrewarmPhaseNull"));
    inactive = dispatch_workloop_create_inactive("com.apple.PosterBoard.prewarmWorkloop");
    workloop = v8->_workloop;
    v8->_workloop = (OS_dispatch_workloop *)inactive;

    dispatch_workloop_set_autorelease_frequency((dispatch_workloop_t)v8->_workloop, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = v37;
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PBFPosterExtensionDataStorePrewarmHelper invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterExtensionDataStorePrewarmHelper;
  -[PBFPosterExtensionDataStorePrewarmHelper dealloc](&v3, sel_dealloc);
}

- (void)executePrewarmWithExecutor:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id lock_completion;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  BSAtomicFlag *v23;
  OS_dispatch_workloop *v24;
  BSAtomicFlag *v25;
  _QWORD block[4];
  id v27;
  BSAtomicFlag *v28;
  PBFPosterExtensionDataStorePrewarmHelper *v29;
  id v30;
  os_signpost_id_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    -[PBFPosterExtensionDataStorePrewarmHelper plan](self, "plan");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFPosterExtensionDataStorePrewarmHelper activePhase](self, "activePhase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("PBFPrewarmPhaseNull"));

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v8, "prewarmPhasePlan");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        if (v7)
          (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, 1, 0, 0);
        goto LABEL_16;
      }
      os_unfair_lock_lock(&self->_lock);
      v13 = (void *)objc_msgSend(v7, "copy");
      lock_completion = self->_lock_completion;
      self->_lock_completion = v13;

      BSAbsoluteMachTimeNow();
      self->_lock_startTime = v15;
      os_unfair_lock_unlock(&self->_lock);
      PBFLogPrewarm();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v17;
        _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_DEFAULT, "(%{public}@) Executing prewarm", buf, 0xCu);

      }
      PBFLogPrewarm();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_signpost_id_generate(v18);

      PBFLogPrewarm();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        objc_msgSend(v8, "prewarmPhasePlan");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v22;
        _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "ExecutePrewarm", "Phases: %{public}@", buf, 0xCu);

      }
      v23 = self->_invalidationFlag;
      v24 = self->_workloop;
      dispatch_activate((dispatch_object_t)v24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__PBFPosterExtensionDataStorePrewarmHelper_executePrewarmWithExecutor_completion___block_invoke;
      block[3] = &unk_1E86F6F28;
      v27 = v8;
      v28 = v23;
      v31 = v19;
      v29 = self;
      v30 = v6;
      v25 = v23;
      dispatch_async((dispatch_queue_t)v24, block);

    }
    else
    {
      if (!v7)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFPosterExtensionDataStorePrewarmHelperErrorDomain, -31339, 0);
      v25 = (BSAtomicFlag *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, BSAtomicFlag *))v7 + 2))(v7, 0, 0, v25);
    }

    goto LABEL_16;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", PBFPosterExtensionDataStorePrewarmHelperErrorDomain, -31342, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v8);
    goto LABEL_16;
  }
LABEL_17:

}

void __82__PBFPosterExtensionDataStorePrewarmHelper_executePrewarmWithExecutor_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_1CB9FA000, "prewarm", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DETACHED);
  v39 = (void *)objc_opt_new();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "prewarmPhasePlan");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v41;
    v37 = v2;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        PBFLogPrewarm();
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = *(_QWORD *)(a1 + 64);
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v7;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
        }

        BSAbsoluteMachTimeNow();
        v12 = v11;
        PBFLogPrewarm();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v14;
          v47 = 2114;
          v48 = v7;
          _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Start phase %{public}@", buf, 0x16u);

        }
        if (objc_msgSend(*(id *)(a1 + 40), "getFlag"))
        {
          PBFLogPrewarm();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v28;
            v47 = 2114;
            v48 = v7;
            _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "(%{public}@) Prewarm invalidated @ phase %{public}@", buf, 0x16u);

          }
          v2 = v37;
          goto LABEL_34;
        }
        objc_msgSend(*(id *)(a1 + 48), "setActivePhase:", v7);
        objc_msgSend(*(id *)(a1 + 32), "timeoutIntervalForPhase:", v7);
        v16 = v15;
        objc_msgSend(*(id *)(a1 + 32), "executionBlockForPhase:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
          v17 = *(void **)(a1 + 56);
        v19 = _Block_copy(v17);

        objc_msgSend(*(id *)(a1 + 48), "_executePhase:executionBlock:context:timeout:", v7, v19, v39, v16);
        v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        BSAbsoluteMachTimeNow();
        v22 = v21;
        PBFLogPrewarm();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = *(_QWORD *)(a1 + 64);
        if (v20 != 0.0)
        {
          if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v7;
            _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v24, OS_SIGNPOST_INTERVAL_END, v25, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
          }

          PBFLogPrewarm();
          v29 = objc_claimAutoreleasedReturnValue();
          v2 = v37;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v36;
            v47 = 2114;
            v48 = v7;
            v49 = 2114;
            v50 = v20;
            _os_log_error_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_ERROR, "(%{public}@) Fatal error @ phase %{public}@: %{public}@", buf, 0x20u);

          }
          PBFLogPrewarm();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v46 = v31;
            v47 = 2114;
            v48 = v7;
            v49 = 2048;
            v50 = v22 - v12;
            _os_log_impl(&dword_1CB9FA000, v30, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ execution time: %f seconds", buf, 0x20u);

          }
LABEL_34:

          goto LABEL_35;
        }
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          *(_DWORD *)buf = 138543362;
          v46 = v7;
          _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v24, OS_SIGNPOST_INTERVAL_END, v25, "ExecutePrewarmPhase", "Phase: %{public}@", buf, 0xCu);
        }

        PBFLogPrewarm();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v46 = v27;
          v47 = 2114;
          v48 = v7;
          v49 = 2048;
          v50 = v22 - v12;
          _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished phase %{public}@; execution time: %f seconds",
            buf,
            0x20u);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      v2 = v37;
      if (v4)
        continue;
      break;
    }
  }
LABEL_35:

  objc_msgSend(*(id *)(a1 + 48), "setActivePhase:", CFSTR("PBFPrewarmPhaseNull"));
  objc_msgSend(*(id *)(a1 + 48), "_markAsDoneAndFireCompletionHandlers");
  os_activity_scope_leave(&state);
  PBFLogPrewarm();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  v34 = *(_QWORD *)(a1 + 64);
  if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    objc_msgSend(*(id *)(a1 + 32), "prewarmPhasePlan");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v46 = v35;
    _os_signpost_emit_with_name_impl(&dword_1CB9FA000, v33, OS_SIGNPOST_INTERVAL_END, v34, "ExecutePrewarm", "Phases: %{public}@", buf, 0xCu);

  }
}

- (void)appendCompletionObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSObject *v6;
  void *v7;
  NSMutableArray *lock_completionObservers;
  NSMutableArray *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ((-[BSAtomicFlag getFlag](self->_finishedFlag, "getFlag") & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_lock);
      PBFLogPrewarm();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Firing completion observer after finish", (uint8_t *)&v13, 0xCu);

      }
      -[PBFPosterExtensionDataStorePrewarmHelper _fireCompletionHandler:reason:](self, "_fireCompletionHandler:reason:", v4, CFSTR("Post finish fire completion handler for prewarmer"));
    }
    else
    {
      lock_completionObservers = self->_lock_completionObservers;
      if (!lock_completionObservers)
      {
        v9 = (NSMutableArray *)objc_opt_new();
        v10 = self->_lock_completionObservers;
        self->_lock_completionObservers = v9;

        lock_completionObservers = self->_lock_completionObservers;
      }
      v11 = (void *)objc_msgSend(v4, "copy");
      v12 = _Block_copy(v11);
      -[NSMutableArray bs_safeAddObject:](lock_completionObservers, "bs_safeAddObject:", v12);

      os_unfair_lock_unlock(p_lock);
    }
  }

}

- (id)_executePhase:(id)a3 executionBlock:(id)a4 context:(id)a5 timeout:(double)a6
{
  __CFString *v10;
  void (**v11)(id, id, id, PBFPosterExtensionDataStorePrewarmHelper *);
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  void *v17;
  id lock_cancellationHandlerForCurrentPhase;
  dispatch_time_t v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  uint64_t block;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  double v51;
  const __CFString *v52;
  __CFString *v53;
  const __CFString *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = (void (**)(id, id, id, PBFPosterExtensionDataStorePrewarmHelper *))a4;
  v12 = a5;
  if (v10 && v11)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dispatchGroupForPhase, "objectForKeyedSubscript:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v13);
    v11[2](v11, v10, v12, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v17 = _Block_copy(v15);
    lock_cancellationHandlerForCurrentPhase = self->_lock_cancellationHandlerForCurrentPhase;
    self->_lock_cancellationHandlerForCurrentPhase = v17;

    os_unfair_lock_unlock(&self->_lock);
    v19 = dispatch_time(0, (uint64_t)(a6 * 1000000000.0));
    if (dispatch_group_wait(v13, v19))
    {
      if (v15)
      {
        -[NSDictionary objectForKeyedSubscript:](self->_completionFlagForPhase, "objectForKeyedSubscript:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "getFlag");

        if ((v21 & 1) == 0)
        {
          block = MEMORY[0x1E0C809B0];
          v42 = 3221225472;
          v43 = __89__PBFPosterExtensionDataStorePrewarmHelper__executePhase_executionBlock_context_timeout___block_invoke;
          v44 = &unk_1E86F5418;
          v45 = v15;
          dispatch_async(MEMORY[0x1E0C80D38], &block);

        }
      }
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = PBFPosterExtensionDataStorePrewarmHelperErrorDomain;
      v52 = CFSTR("phase");
      v53 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -31340, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFPosterExtensionDataStorePrewarmHelper noteNonFatalError:](self, "noteNonFatalError:", v25);

      PBFLogPrewarm();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v47 = v27;
      v48 = 2114;
      v49 = v10;
      v50 = 2048;
      v51 = a6;
      _os_log_error_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_ERROR, "(%{public}@) phase %{public}@ exceeded timeout of %f seconds", buf, 0x20u);
    }
    else
    {
      PBFLogPrewarm();
      v26 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        os_unfair_lock_lock(&self->_lock);
        v33 = self->_lock_cancellationHandlerForCurrentPhase;
        self->_lock_cancellationHandlerForCurrentPhase = 0;

        -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_fatalErrorForPhase, "objectForKeyedSubscript:", v10);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](self->_lock_nonFatalErrorsForPhase, "objectForKey:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "count"))
        {
          PBFLogPrewarm();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
            v40 = v12;
            v36 = v15;
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v47 = v37;
            v48 = 2114;
            v49 = v10;
            v50 = 2114;
            v51 = *(double *)&v34;
            _os_log_impl(&dword_1CB9FA000, v35, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ received non fatal errors: %{public}@", buf, 0x20u);

            v15 = v36;
            v12 = v40;
          }

        }
        -[NSDictionary objectForKeyedSubscript:](self->_completionFlagForPhase, "objectForKeyedSubscript:", v10, v40, block, v42, v43, v44);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setFlag:", 1);

        os_unfair_lock_unlock(p_lock);
        goto LABEL_23;
      }
      -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v27;
      v48 = 2114;
      v49 = v10;
      _os_log_impl(&dword_1CB9FA000, v26, OS_LOG_TYPE_DEFAULT, "(%{public}@) phase %{public}@ received completion", buf, 0x16u);
    }

    goto LABEL_18;
  }
  PBFLogPrewarm();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[PBFPosterExtensionDataStorePrewarmHelper _executePhase:executionBlock:context:timeout:].cold.1();

  v29 = (void *)MEMORY[0x1E0CB35C8];
  v30 = PBFPosterExtensionDataStorePrewarmHelperErrorDomain;
  if (v10)
    v31 = v10;
  else
    v31 = CFSTR("(unknown phase)");
  v54 = CFSTR("phase");
  v55[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, -31341, v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v32;
}

uint64_t __89__PBFPosterExtensionDataStorePrewarmHelper__executePhase_executionBlock_context_timeout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_markAsDoneAndFireCompletionHandlers
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1();
  objc_msgSend(*v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_7(&dword_1CB9FA000, v2, v3, "(%{public}@) populating finalized error: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_fireCompletionHandler:(id)a3 reason:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  NSError *v9;
  NSError *v10;
  NSError *v11;
  NSError *v12;
  _QWORD v13[4];
  NSError *v14;
  NSError *v15;
  id v16;

  v6 = a3;
  if (v6)
  {
    p_lock = &self->_lock;
    v8 = a4;
    os_unfair_lock_lock(&self->_lock);
    v9 = self->_lock_finalizedAmalgamtedNonfatalErrors;
    v10 = self->_lock_finalizedError;
    os_unfair_lock_unlock(p_lock);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__PBFPosterExtensionDataStorePrewarmHelper__fireCompletionHandler_reason___block_invoke;
    v13[3] = &unk_1E86F2E08;
    v15 = v9;
    v16 = v6;
    v14 = v10;
    v11 = v9;
    v12 = v10;
    PBFDispatchAsyncWithString(v8, QOS_CLASS_USER_INITIATED, v13);

  }
}

uint64_t __74__PBFPosterExtensionDataStorePrewarmHelper__fireCompletionHandler_reason___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL, _QWORD))(a1[6] + 16))(a1[6], a1[4] == 0, a1[5]);
}

- (void)invalidate
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_9_2(a1), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "(%{public}@) Invalidation *ALREADY* received; bailing.",
    (uint8_t *)&v4,
    0xCu);

}

uint64_t __54__PBFPosterExtensionDataStorePrewarmHelper_invalidate__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)noteNonFatalError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[PBFPosterExtensionDataStorePrewarmHelper activePhase](self, "activePhase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag");
    PBFLogPrewarm();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if ((v7 & 1) != 0)
    {
      if (v9)
      {
        -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v10;
        v18 = 2114;
        v19 = v6;
        v20 = 2114;
        v21 = v4;
        _os_log_error_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received non fatal error after invalidation for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);

      }
    }
    else
    {
      if (v9)
      {
        -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v15;
        v18 = 2114;
        v19 = v6;
        v20 = 2114;
        v21 = v4;
        _os_log_error_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received non fatal error for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);

      }
      -[NSDictionary objectForKeyedSubscript:](self->_completionFlagForPhase, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "getFlag");

      if ((v12 & 1) != 0)
        goto LABEL_12;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_nonFatalErrorsForPhase, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v14 = (void *)objc_opt_new();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_nonFatalErrorsForPhase, "setObject:forKeyedSubscript:", v14, v6);

      }
      -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_nonFatalErrorsForPhase, "objectForKeyedSubscript:", v6);
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v8, "addObject:", v4);
    }

LABEL_12:
    os_unfair_lock_unlock(p_lock);

  }
}

- (void)finishedWithError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PBFPosterExtensionDataStorePrewarmHelper activePhase](self, "activePhase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag") & 1) != 0)
  {
    PBFLogPrewarm();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v9;
        v18 = 2114;
        v19 = v6;
        v20 = 2114;
        v21 = v4;
        _os_log_error_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_ERROR, "(%{public}@) Received fatal error after invalidation for phase %{public}@: %{public}@", (uint8_t *)&v16, 0x20u);
LABEL_13:

      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v9;
      v18 = 2114;
      v19 = v6;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_DEFAULT, "(%{public}@) Finished %{public}@ but prewarmer was invalidated", (uint8_t *)&v16, 0x16u);
      goto LABEL_13;
    }

    goto LABEL_15;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_completionFlagForPhase, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "setFlag:", 1);

  if (!v11)
  {
LABEL_15:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_16;
  }
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_fatalErrorForPhase, "setObject:forKeyedSubscript:", v4, v6);
  -[NSDictionary objectForKeyedSubscript:](self->_dispatchGroupForPhase, "objectForKeyedSubscript:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  PBFLogPrewarm();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PBFPosterExtensionDataStorePrewarmHelper finishedWithError:].cold.1();
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[PBFPosterExtensionDataStorePrewarmPlan identifier](self->_plan, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v15;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "(%{public}@) received finish for phase %{public}@", (uint8_t *)&v16, 0x16u);

  }
  os_unfair_lock_unlock(p_lock);
  if (v12)
  {
    dispatch_group_leave(v12);

  }
LABEL_16:

}

- (PBFPosterExtensionDataStorePrewarmPlan)plan
{
  return (PBFPosterExtensionDataStorePrewarmPlan *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)activePhase
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setActivePhase:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePhase, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_lock_finalizedAmalgamtedNonfatalErrors, 0);
  objc_storeStrong((id *)&self->_lock_finalizedError, 0);
  objc_storeStrong(&self->_lock_cancellationHandlerForCurrentPhase, 0);
  objc_storeStrong((id *)&self->_lock_fatalErrorForPhase, 0);
  objc_storeStrong((id *)&self->_lock_nonFatalErrorsForPhase, 0);
  objc_storeStrong(&self->_lock_completion, 0);
  objc_storeStrong((id *)&self->_lock_completionObservers, 0);
  objc_storeStrong((id *)&self->_dispatchGroupForPhase, 0);
  objc_storeStrong((id *)&self->_completionFlagForPhase, 0);
  objc_storeStrong((id *)&self->_finishedFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
}

- (void)initWithPlan:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_executePhase:executionBlock:context:timeout:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1();
  objc_msgSend((id)OUTLINED_FUNCTION_9_2(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_7(&dword_1CB9FA000, v2, v3, "(%{public}@) phase %{public}@ failed to execute; no execution block or phase is unknown? ",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_20();
}

- (void)finishedWithError:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_1();
  objc_msgSend((id)OUTLINED_FUNCTION_9_2(v0), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_7(&dword_1CB9FA000, v2, v3, "(%{public}@) received finish for phase %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

@end
