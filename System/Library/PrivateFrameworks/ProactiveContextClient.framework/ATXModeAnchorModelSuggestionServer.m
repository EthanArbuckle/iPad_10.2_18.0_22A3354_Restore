@implementation ATXModeAnchorModelSuggestionServer

- (ATXModeAnchorModelSuggestionServer)initWithConfiguredModeService:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  ATXModeAnchorModelSuggestionServer *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3B58];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithMachServiceName:", CFSTR("com.apple.proactive.ModeAnchorModelSuggestion.xpc"));
  v7 = -[ATXModeAnchorModelSuggestionServer initWithXPCListener:configuredModeService:](self, "initWithXPCListener:configuredModeService:", v6, v5);

  return v7;
}

- (ATXModeAnchorModelSuggestionServer)initWithXPCListener:(id)a3 configuredModeService:(id)a4
{
  id v7;
  id v8;
  ATXModeAnchorModelSuggestionServer *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXModeAnchorModelSuggestionServer;
  v9 = -[ATXModeAnchorModelSuggestionServer init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D815F0]);
    v11 = (void *)objc_opt_new();
    v12 = objc_msgSend(v10, "initWithGuardedData:", v11);
    lock = v9->_lock;
    v9->_lock = (_PASLock *)v12;

    objc_storeStrong((id *)&v9->_modeService, a4);
    objc_storeStrong((id *)&v9->_xpcListener, a3);
    -[NSXPCListener setDelegate:](v9->_xpcListener, "setDelegate:", v9);
    -[NSXPCListener resume](v9->_xpcListener, "resume");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global);
  v3.receiver = self;
  v3.super_class = (Class)ATXModeAnchorModelSuggestionServer;
  -[ATXModeAnchorModelSuggestionServer dealloc](&v3, sel_dealloc);
}

void __45__ATXModeAnchorModelSuggestionServer_dealloc__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  id v5;

  v3 = (void *)a2[1];
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  v5 = (id)a2[1];
  a2[1] = 0;

}

- (void)fetchCombinedSuggestionScoreForModeEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "modeIdentifier");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "modeType");
  v9 = objc_msgSend(v7, "origin");
  objc_msgSend(v7, "originBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originAnchorType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "confidenceScore");
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v7, "absoluteTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  v18 = v15 - v17;
  objc_msgSend(v7, "serializedTriggers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXModeAnchorModelSuggestionServer fetchCombinedSuggestionScoreForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:](self, "fetchCombinedSuggestionScoreForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", v20, v8, v9, v10, v11, v19, v13, v18, v6);
}

- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _PASLock *lock;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  int v38;
  int v39;

  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke;
  v30[3] = &unk_1E942D9F0;
  v34 = v22;
  v35 = v23;
  v38 = a4;
  v39 = a5;
  v31 = v19;
  v32 = v20;
  v36 = a8;
  v37 = a9;
  v33 = v21;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v23;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v30);

}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;

  v3 = *(void **)(a2 + 8);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2;
  v8 = &unk_1E942D9C8;
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCombinedSuggestionScoreForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(_QWORD *)(a1 + 64), v5, v6, v7, v8);

}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _PASLock *lock;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  double v37;
  int v38;
  int v39;

  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  lock = self->_lock;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke;
  v30[3] = &unk_1E942D9F0;
  v34 = v22;
  v35 = v23;
  v38 = a4;
  v39 = a5;
  v31 = v19;
  v32 = v20;
  v36 = a8;
  v37 = a9;
  v33 = v21;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v23;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v30);

}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;

  v3 = *(void **)(a2 + 8);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2;
  v8 = &unk_1E942D9C8;
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 72), *(double *)(a1 + 80), *(_QWORD *)(a1 + 64), v5, v6, v7, v8);

}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)pingWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (void)anchorModelDidProvideModeSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  ATXModeAnchorModelSuggestionServer *v17;
  id v18;
  void *v19;
  void *v20;
  ATXConfiguredModeService *modeService;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  ATXModeAnchorModelSuggestionServer *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    v54 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Received %{public}lu suggestions", buf, 0xCu);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (!v7)
  {
    v42 = 0;
    v41 = 0;
    v32 = v6;
    goto LABEL_26;
  }
  v8 = v7;
  v44 = 0;
  v43 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v50;
  do
  {
    v11 = 0;
    v45 = v8;
    do
    {
      if (*(_QWORD *)v50 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
      v46 = MEMORY[0x1D82448B0]();
      __atxlog_handle_modes();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "modeUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v10;
        v16 = v9;
        v17 = self;
        v18 = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "isStart"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "anchorType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = (uint64_t)v14;
        v55 = 2114;
        v56 = v19;
        v57 = 2114;
        v58 = v20;
        _os_log_impl(&dword_1D2C00000, v13, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Suggestion modeId: %{public}@, isStart: %{public}@, anchorType: %{public}@", buf, 0x20u);

        v6 = v18;
        self = v17;
        v9 = v16;
        v10 = v15;
        v8 = v45;

      }
      v48 = 0;
      modeService = self->_modeService;
      objc_msgSend(v12, "modeUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      LOBYTE(modeService) = -[ATXConfiguredModeService isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:](modeService, "isActivityWithUUIDConfigured:activityType:allowsSmartEntry:userModeName:", v22, &v48, 0, &v47);
      v23 = v47;

      if ((modeService & 1) == 0)
      {
        __atxlog_handle_modes();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "modeUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v54 = (uint64_t)v26;
          _os_log_impl(&dword_1D2C00000, v25, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Suggestion modeUUID: %{public}@ is not configured, skipping", buf, 0xCu);

        }
        goto LABEL_15;
      }
      if (-[ATXModeAnchorModelSuggestionServer _shouldUpdateHighestConfidenceSuggestion:newSuggestion:](self, "_shouldUpdateHighestConfidenceSuggestion:newSuggestion:", v9, v12))
      {
        v24 = v12;

        v43 = v48;
        v25 = v44;
        v44 = v23;
        v9 = v24;
LABEL_15:
        v27 = (void *)v46;

        goto LABEL_17;
      }
      v27 = (void *)v46;
LABEL_17:

      objc_autoreleasePoolPop(v27);
      ++v11;
    }
    while (v8 != v11);
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  }
  while (v8);

  if (v9)
  {
    __atxlog_handle_modes();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "modeUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isStart"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "anchorType");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = (uint64_t)v29;
      v55 = 2114;
      v56 = v30;
      v57 = 2114;
      v58 = v31;
      _os_log_impl(&dword_1D2C00000, v28, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: Updated suggestion to modeUUID: %{public}@, isStart: %{public}@, anchorType: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v9, "modeUUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = ATXActivityTypeToBMUserFocusInferredModeType(v43);
    if ((objc_msgSend(v9, "isStart") & 1) == 0)
    {

      v32 = 0;
      v33 = 2;
    }
    -[ATXModeAnchorModelSuggestionServer delegate](self, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "score");
    v36 = v35;
    objc_msgSend(v9, "anchorType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serializedTriggers");
    v38 = v9;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = self;
    v41 = v44;
    objc_msgSend(v34, "clientModel:didUpdatePredictionWithUUID:userModeName:modeType:confidenceScore:modeOrigin:originBundleId:originAnchorType:serializedTriggers:", v40, v32, v44, v33, 11, 0, v36, v37, v39);

    v42 = v38;
LABEL_26:

  }
  else
  {
    v42 = 0;
    v41 = v44;
  }

}

- (BOOL)_shouldUpdateHighestConfidenceSuggestion:(id)a3 newSuggestion:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;

  v5 = a3;
  v6 = a4;
  v10 = 1;
  if (v5)
  {
    objc_msgSend(v5, "score");
    v8 = v7;
    objc_msgSend(v6, "score");
    if (v8 >= v9
      && (vabdd_f64(v8, v9) >= 2.22044605e-16
       || (objc_msgSend(v5, "isStart") & 1) != 0
       || (objc_msgSend(v6, "isStart") & 1) == 0))
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _PASLock *lock;
  id v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.proactive.ModeAnchorModelSuggestion.xpc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    ATXModeAnchorModelSuggestionServerXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v9);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "setInterruptionHandler:", &__block_literal_global_15);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_16;
    v20[3] = &unk_1E942DA58;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v7, "setInvalidationHandler:", v20);
    ATXModeAnchorModelSuggestionClientXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11);

    lock = self->_lock;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v18[3] = &unk_1E942DA80;
    v13 = v7;
    v19 = v13;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v18);
    objc_msgSend(v13, "resume");
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v13;
      _os_log_impl(&dword_1D2C00000, v14, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: accepts XPC connection: %{public}@", buf, 0xCu);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    v15 = 1;
  }
  else
  {
    __atxlog_handle_modes();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ATXModeAnchorModelSuggestionServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, (uint64_t)CFSTR("com.apple.proactive.ModeAnchorModelSuggestion.xpc"), v16);

    v15 = 0;
  }

  return v15;
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;

  __atxlog_handle_modes();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0);

}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  __int16 v5[8];

  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 0;
    _os_log_impl(&dword_1D2C00000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionServer: XPC connection invalidated.", (uint8_t *)v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[2], "runWithLockAcquired:", &__block_literal_global_18);

}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_17(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;

}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_storeStrong((id *)(a2 + 8), *(id *)(a1 + 32));
}

- (ATXModeClassifierClientModelDelegate)delegate
{
  return (ATXModeClassifierClientModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __205__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2C00000, v0, v1, "%s: error with xpc connection: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __213__ATXModeAnchorModelSuggestionServer_fetchCombinedSuggestionScoreAndFlagsForModeWithUUID_modeType_origin_originBundleId_originAnchorType_confidenceScore_secondsSinceSuggested_serializedTriggers_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D2C00000, v0, v1, "%s: error with xpc connection: %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_0(&dword_1D2C00000, a3, (uint64_t)a3, "ATXModeAnchorModelSuggestionServer: Rejecting connection %{public}@ without entitlement %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __73__ATXModeAnchorModelSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "ATXModeAnchorModelSuggestionServer: XPC connection interrupted.", v1, 2u);
}

@end
