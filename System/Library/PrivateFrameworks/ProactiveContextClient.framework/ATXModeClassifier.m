@implementation ATXModeClassifier

+ (void)provideModeClassifierWhenReadyWithDuetHelper:(id)a3 block:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0D81590];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ATXModeClassifier_provideModeClassifierWhenReadyWithDuetHelper_block___block_invoke;
  v7[3] = &unk_1E942DF70;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "runBlockWhenDeviceIsClassCUnlocked:", v7);

}

void __72__ATXModeClassifier_provideModeClassifierWhenReadyWithDuetHelper_block___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (void)provideModeClassifierWhenReadyWithBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81590];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__ATXModeClassifier_provideModeClassifierWhenReadyWithBlock___block_invoke;
  v6[3] = &unk_1E942DF70;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "runBlockWhenDeviceIsClassCUnlocked:", v6);

}

void __61__ATXModeClassifier_provideModeClassifierWhenReadyWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_opt_new();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (ATXModeClassifier)init
{
  ATXModeClassifier *v3;
  uint64_t v4;
  ATXConfiguredModeService *modeService;
  CLLocationManager *v6;
  CLLocationManager *locationManager;
  ATXModeHeuristicClassifier *v8;
  ATXModeHeuristicClassifier *heuristicModeClassifier;
  ATXModeAnchorModelSuggestionServer *v10;
  ATXModeAnchorModelSuggestionServer *anchorModelSuggestionServer;
  objc_class *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  void *v18;
  void *v19;
  uint64_t v20;
  BMStream *inferredModeStream;
  ATXMicrolocationRecordingTrigger *v22;
  ATXMicrolocationRecordingTrigger *microlocationRecordingTrigger;
  id v24;
  id v25;
  uint64_t v26;
  _PASSimpleCoalescingTimer *modeExpirationTimer;
  id *v28;
  ATXUserFocusInferredMode *v29;
  ATXUserFocusInferredMode *v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  _PASQueueLock *lock;
  NSObject *v37;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44;
  id location;
  objc_super v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)ATXModeClassifier;
  v3 = -[ATXModeClassifier init](&v46, sel_init);
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("ATXModeClassifier.m"), 71, CFSTR("ATXModeClassifier must not be initialized when the device is Class C locked"));

    }
    v4 = objc_opt_new();
    modeService = v3->_modeService;
    v3->_modeService = (ATXConfiguredModeService *)v4;

    v6 = (CLLocationManager *)objc_alloc_init(MEMORY[0x1E0C9E3C8]);
    locationManager = v3->_locationManager;
    v3->_locationManager = v6;

    v8 = -[ATXModeHeuristicClassifier initWithConfiguredModeService:locationManager:]([ATXModeHeuristicClassifier alloc], "initWithConfiguredModeService:locationManager:", v3->_modeService, v3->_locationManager);
    heuristicModeClassifier = v3->_heuristicModeClassifier;
    v3->_heuristicModeClassifier = v8;

    -[ATXModeHeuristicClassifier setDelegate:](v3->_heuristicModeClassifier, "setDelegate:", v3);
    -[ATXModeHeuristicClassifier update](v3->_heuristicModeClassifier, "update");
    v10 = -[ATXModeAnchorModelSuggestionServer initWithConfiguredModeService:]([ATXModeAnchorModelSuggestionServer alloc], "initWithConfiguredModeService:", v3->_modeService);
    anchorModelSuggestionServer = v3->_anchorModelSuggestionServer;
    v3->_anchorModelSuggestionServer = v10;

    -[ATXModeAnchorModelSuggestionServer setDelegate:](v3->_anchorModelSuggestionServer, "setDelegate:", v3);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v16;

    BiomeLibrary();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UserFocus");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "InferredMode");
    v20 = objc_claimAutoreleasedReturnValue();
    inferredModeStream = v3->_inferredModeStream;
    v3->_inferredModeStream = (BMStream *)v20;

    v22 = -[ATXMicrolocationRecordingTrigger initWithInferredModeStream:]([ATXMicrolocationRecordingTrigger alloc], "initWithInferredModeStream:", v3->_inferredModeStream);
    microlocationRecordingTrigger = v3->_microlocationRecordingTrigger;
    v3->_microlocationRecordingTrigger = v22;

    objc_initWeak(&location, v3);
    v24 = objc_alloc(MEMORY[0x1E0D81618]);
    v25 = MEMORY[0x1E0C80D38];
    v40 = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __25__ATXModeClassifier_init__block_invoke;
    v43 = &unk_1E942DA58;
    objc_copyWeak(&v44, &location);
    v26 = objc_msgSend(v24, "initWithQueue:operation:", MEMORY[0x1E0C80D38], &v40);
    modeExpirationTimer = v3->_modeExpirationTimer;
    v3->_modeExpirationTimer = (_PASSimpleCoalescingTimer *)v26;

    v28 = (id *)objc_opt_new();
    v29 = [ATXUserFocusInferredMode alloc];
    v30 = -[ATXUserFocusInferredMode initWithStream:](v29, "initWithStream:", v3->_inferredModeStream, v40, v41, v42, v43);
    -[ATXUserFocusInferredMode currentMode](v30, "currentMode");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v28[1];
    v28[1] = (id)v31;

    __atxlog_handle_modes();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v28[1], "modeIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v34;
      _os_log_impl(&dword_1D2C00000, v33, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier initing with current mode: %@", buf, 0xCu);

    }
    -[ATXModeClassifier _setUpModeExpirationTimerIfNeededWithModeOrigin:](v3, "_setUpModeExpirationTimerIfNeededWithModeOrigin:", objc_msgSend(v28[1], "origin"));
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81600]), "initWithGuardedData:serialQueue:", v28, v3->_queue);

    lock = v3->_lock;
    v3->_lock = (_PASQueueLock *)v35;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }
  __atxlog_handle_modes();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[ATXModeClassifier init].cold.1(v37);

  return v3;
}

void __25__ATXModeClassifier_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_expireMode");

}

- (id)currentMode
{
  _PASQueueLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__ATXModeClassifier_currentMode__block_invoke;
  v5[3] = &unk_1E942DF98;
  v5[4] = &v6;
  -[_PASQueueLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__ATXModeClassifier_currentMode__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a2 + 8), "modeIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)_isModeType:(int)a3 uuid:(id)a4 sameAsModeFromEvent:(id)a5
{
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v12;
  BOOL v13;

  v7 = (unint64_t)a4;
  v8 = a5;
  objc_msgSend(v8, "modeIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 && v9 && (objc_msgSend((id)v7, "isEqualToString:", v9) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v12 = objc_msgSend(v8, "modeType");
    if (v7 | v10)
      v13 = 0;
    else
      v13 = v12 == a3;
    v11 = v13;
  }

  return v11;
}

- (void)_updateWithGuardedData:(id)a3 newModeUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 modeOrigin:(int)a7 originBundleId:(id)a8 originAnchorType:(id)a9 uiLocation:(unint64_t)a10 confidenceScore:(double)a11 serializedTriggers:(id)a12 allowsSmartEntry:(BOOL)a13 shouldSuggestTriggers:(BOOL)a14
{
  uint64_t v16;
  uint64_t v17;
  id *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  unint64_t v59;
  uint64_t v60;

  v16 = *(_QWORD *)&a7;
  v17 = *(_QWORD *)&a6;
  v60 = *MEMORY[0x1E0C80C00];
  v21 = (id *)a3;
  v22 = a4;
  v23 = a5;
  v24 = a8;
  v25 = a9;
  v26 = a12;
  if (-[ATXModeClassifier _isModeType:uuid:sameAsModeFromEvent:](self, "_isModeType:uuid:sameAsModeFromEvent:", v17, v22, v21[1]))
  {
    __atxlog_handle_modes();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v21[1], "modeIdentifier");
      v28 = v24;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v21[1], "modeType");
      *(_DWORD *)buf = 138544130;
      v51 = (uint64_t)v22;
      v52 = 2048;
      v53 = (int)v17;
      v54 = 2114;
      v55 = v29;
      v56 = 2048;
      v57 = v30;
      _os_log_impl(&dword_1D2C00000, v27, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: not updating because new mode (%{public}@, %lu) is same as current mode (%{public}@, %lu)", buf, 0x2Au);

      v24 = v28;
    }
  }
  else
  {
    v31 = v25;
    v32 = v16;
    v49 = v24;
    objc_msgSend(v21[1], "modeIdentifier");
    v33 = objc_claimAutoreleasedReturnValue();
    __atxlog_handle_modes();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(v21[1], "modeType");
      *(_DWORD *)buf = 138544386;
      v51 = v33;
      v52 = 2048;
      v53 = v35;
      v54 = 2114;
      v55 = v22;
      v56 = 2048;
      v57 = (int)v17;
      v58 = 2048;
      v59 = a10;
      _os_log_impl(&dword_1D2C00000, v34, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: mode updated from uuid:%{public}@, modeType:%lu to uuid:%{public}@, modeType:%lu, uiLocation of new suggestion: %lu", buf, 0x34u);
    }

    v36 = (void *)objc_opt_class();
    LOWORD(v47) = __PAIR16__(a14, a13);
    v46 = v26;
    v37 = v22;
    v24 = v49;
    v48 = v33;
    v38 = v22;
    v39 = v26;
    v40 = v32;
    v41 = v32;
    v25 = v31;
    objc_msgSend(v36, "updateModeWithUUID:userModeName:modeType:modeOrigin:originAnchorType:originBundleId:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:currentMode:stream:", v37, v23, v17, v41, v31, v49, a11, a10, v46, v47, v21[1], self->_inferredModeStream);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v21[1];
    v21[1] = v42;
    v44 = v42;

    -[_PASSimpleCoalescingTimer cancelPendingOperations](self->_modeExpirationTimer, "cancelPendingOperations");
    v45 = v40;
    v26 = v39;
    v22 = v38;
    v27 = v48;
    -[ATXModeClassifier _setUpModeExpirationTimerIfNeededWithModeOrigin:](self, "_setUpModeExpirationTimerIfNeededWithModeOrigin:", v45);
  }

}

+ (id)updateModeWithUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originAnchorType:(id)a7 originBundleId:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13 currentMode:(id)a14 stream:(id)a15
{
  id v19;
  id v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v50;
  id v52;
  id v53;
  id v54;

  v50 = a3;
  v19 = a4;
  v20 = a7;
  v53 = a8;
  v52 = a11;
  v54 = a15;
  if (a14)
  {
    v21 = (objc_class *)MEMORY[0x1E0D02338];
    v22 = a14;
    v46 = [v21 alloc];
    v45 = (void *)objc_opt_new();
    objc_msgSend(v22, "modeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v22, "isAutomationEnabled"));
    v47 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uuid");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (const __CFString *)v25;
    else
      v27 = &stru_1E942FC10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "uiLocation"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v22, "modeType");
    objc_msgSend(v22, "userModeName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v44) = v30;
    v32 = (void *)objc_msgSend(v46, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v45, v23, 1, 0, v24, v27, 0, v28, v29, MEMORY[0x1E0C9AA60], v44, MEMORY[0x1E0C9AAA0], v31);

    v20 = v47;
    objc_msgSend(v54, "source");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sendEvent:", v32);

  }
  v34 = (void *)objc_opt_new();
  objc_msgSend(v34, "UUIDString");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc(MEMORY[0x1E0D02338]);
  v36 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a12);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a9);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a10);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = a5;
  v41 = (void *)objc_msgSend(v35, "initWithAbsoluteTimestamp:modeIdentifier:origin:originBundleID:isAutomationEnabled:isStart:uuid:originAnchorType:uiLocation:confidenceScore:serializedTriggers:modeType:shouldSuggestTriggers:userModeName:", v36, v50, a6, v53, v37, MEMORY[0x1E0C9AAB0], v48, v20, v38, v39, v52, v44, v40, v19);

  objc_msgSend(v54, "source");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "sendEvent:", v41);

  return v41;
}

- (void)_updateWithNewModeUUID:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 uiLocation:(unint64_t)a9 confidenceScore:(double)a10 serializedTriggers:(id)a11 allowsSmartEntry:(BOOL)a12 shouldSuggestTriggers:(BOOL)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _PASQueueLock *lock;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  unint64_t v37;
  double v38;
  int v39;
  int v40;
  BOOL v41;
  BOOL v42;

  v20 = a3;
  v21 = a4;
  v22 = a7;
  v23 = a8;
  v24 = a11;
  lock = self->_lock;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __194__ATXModeClassifier__updateWithNewModeUUID_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_uiLocation_confidenceScore_serializedTriggers_allowsSmartEntry_shouldSuggestTriggers___block_invoke;
  v31[3] = &unk_1E942DFC0;
  v31[4] = self;
  v32 = v20;
  v39 = a5;
  v40 = a6;
  v33 = v21;
  v34 = v22;
  v36 = v24;
  v37 = a9;
  v38 = a10;
  v35 = v23;
  v41 = a12;
  v42 = a13;
  v26 = v24;
  v27 = v23;
  v28 = v22;
  v29 = v21;
  v30 = v20;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v31);

}

uint64_t __194__ATXModeClassifier__updateWithNewModeUUID_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_uiLocation_confidenceScore_serializedTriggers_allowsSmartEntry_shouldSuggestTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  LOWORD(v3) = *(_WORD *)(a1 + 104);
  return objc_msgSend(*(id *)(a1 + 32), "_updateWithGuardedData:newModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 96), *(unsigned int *)(a1 + 100), *(_QWORD *)(a1 + 56), *(double *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 72), v3);
}

- (void)_updateWithNewModeUUIDIfNeeded:(id)a3 userModeName:(id)a4 modeType:(int)a5 modeOrigin:(int)a6 originBundleId:(id)a7 originAnchorType:(id)a8 confidenceScore:(double)a9 serializedTriggers:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _PASQueueLock *lock;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[2];
  int v35;
  int v36;
  id location;

  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  objc_initWeak(&location, self);
  lock = self->_lock;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke;
  v28[3] = &unk_1E942E038;
  objc_copyWeak(v34, &location);
  v35 = a5;
  v22 = v17;
  v29 = v22;
  v36 = a6;
  v23 = v19;
  v30 = v23;
  v24 = v20;
  v31 = v24;
  v34[1] = *(id *)&a9;
  v25 = v21;
  v32 = v25;
  v26 = v18;
  v33 = v26;
  -[_PASQueueLock runAsyncWithLockAcquired:](lock, "runAsyncWithLockAcquired:", v28);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "_isModeType:uuid:sameAsModeFromEvent:", *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 32), v3[1]);
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = *(void **)(a1 + 32);
        v10 = *(int *)(a1 + 88);
        objc_msgSend(v3[1], "modeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3[1], "modeType");
        *(_DWORD *)buf = 138544130;
        v30 = v9;
        v31 = 2048;
        v32 = v10;
        v33 = 2114;
        v34 = v11;
        v35 = 2048;
        v36 = v12;
        _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: not updating because new mode (%{public}@, %lu) is same as current mode (%{public}@, %lu)", buf, 0x2Au);

      }
    }
    else
    {
      if (v8)
      {
        objc_msgSend(v3[1], "modeIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v3[1], "modeType");
        v16 = *(void **)(a1 + 32);
        v17 = *(int *)(a1 + 88);
        *(_DWORD *)buf = 138544130;
        v30 = v14;
        v31 = 2048;
        v32 = v15;
        v33 = 2114;
        v34 = v16;
        v35 = 2048;
        v36 = v17;
        _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: fetching combined score for current mode (uuid: %{public}@, type:%lu) and new mode (uuid: %{public}@, type:%lu) to see if we should update", buf, 0x2Au);

      }
      v18 = (void *)v5[5];
      v19 = v3[1];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_30;
      v20[3] = &unk_1E942E010;
      v20[4] = v5;
      v21 = *(id *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 88);
      v22 = *(id *)(a1 + 40);
      v23 = *(id *)(a1 + 48);
      v27 = *(_QWORD *)(a1 + 80);
      v24 = *(id *)(a1 + 56);
      v25 = v3;
      v26 = *(id *)(a1 + 64);
      objc_msgSend(v18, "fetchCombinedSuggestionScoreForModeEvent:completionHandler:", v19, v20);

    }
  }
  else
  {
    __atxlog_handle_modes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_cold_1(v13);

  }
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_30(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v3;
    _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: fetched score for current mode: %@. Fetching score and flags for new mode.", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v7 = *(unsigned int *)(a1 + 96);
  v8 = *(unsigned int *)(a1 + 100);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(double *)(a1 + 88);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_31;
  v16[3] = &unk_1E942DFE8;
  v12 = *(_QWORD *)(a1 + 64);
  v17 = *(id *)(a1 + 72);
  v18 = v3;
  v13 = *(id *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v19 = v13;
  v20 = v14;
  v26 = *(_DWORD *)(a1 + 100);
  v21 = *(id *)(a1 + 80);
  v27 = *(_DWORD *)(a1 + 96);
  v22 = *(id *)(a1 + 48);
  v23 = *(id *)(a1 + 56);
  v25 = *(_QWORD *)(a1 + 88);
  v24 = *(id *)(a1 + 64);
  v15 = v3;
  objc_msgSend(v6, "fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:modeType:origin:originBundleId:originAnchorType:confidenceScore:secondsSinceSuggested:serializedTriggers:completionHandler:", v5, v7, v8, v9, v10, v12, v11, 0.0, v16);

}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_31(uint64_t a1, void *a2, int a3, char a4, char a5)
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  __atxlog_handle_modes();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "modeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v18 = v11;
    v19 = 2114;
    v20 = v12;
    v21 = 2114;
    v22 = v13;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_1D2C00000, v10, OS_LOG_TYPE_DEFAULT, "Comparing current mode: %{public}@ (combinedScore: %{public}@, with new mode: %{public}@ (combinedScore: %{public}@)", buf, 0x2Au);

  }
  if (!v9 || !*(_QWORD *)(a1 + 40))
  {
    __atxlog_handle_modes();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_31_cold_1(a1, (uint64_t)v9, v14);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "_shouldUpdateMode:currentModeScore:newModeOrigin:newModeScore:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "origin"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 104), v9))
  {
    v15 = 3;
    if (!a3)
      v15 = 1;
    BYTE1(v16) = a4;
    LOBYTE(v16) = a5;
    objc_msgSend(*(id *)(a1 + 56), "_updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 108), *(unsigned int *)(a1 + 104), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(double *)(a1 + 96), v15, *(_QWORD *)(a1 + 88), v16);
  }

}

- (BOOL)allowSmartEntryWithModeUUID:(id)a3
{
  void *v3;
  BOOL v4;

  -[ATXConfiguredModeService DNDModeConfigurationForActivityWithUUID:](self->_modeService, "DNDModeConfigurationForActivityWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowSmartEntry") == 2;

  return v4;
}

- (BOOL)_shouldUpdateMode:(int)a3 currentModeScore:(id)a4 newModeOrigin:(int)a5 newModeScore:(id)a6
{
  id v9;
  id v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;

  v9 = a4;
  v10 = a6;
  if (BMUserFocusInferredModeOriginIsHeuristic(a3)
    && (BMUserFocusInferredModeOriginIsHeuristic(a5) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
    objc_msgSend(v9, "doubleValue");
    v11 = v13 >= v14;
  }

  return v11;
}

- (void)_setUpModeExpirationTimerIfNeededWithModeOrigin:(int)a3
{
  if (a3 == 11)
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_modeExpirationTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, 7200.0);
}

- (void)_expireMode
{
  ATXModeHeuristicClassifier *heuristicModeClassifier;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  uint64_t v14;

  v14 = 0;
  v13 = 0;
  heuristicModeClassifier = self->_heuristicModeClassifier;
  v11 = 0;
  v12 = 0;
  v9 = 0;
  v10 = 0;
  -[ATXModeHeuristicClassifier currentModeUUID:userModeName:modeType:confidenceScore:origin:originBundleId:serializedTrigger:allowsSmartEntry:](heuristicModeClassifier, "currentModeUUID:userModeName:modeType:confidenceScore:origin:originBundleId:serializedTrigger:allowsSmartEntry:", &v12, &v11, (char *)&v14 + 4, 0, &v14, &v10, &v9, &v13);
  v4 = v12;
  v5 = v11;
  v6 = v10;
  v7 = v9;
  LOWORD(v8) = v13;
  -[ATXModeClassifier _updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:](self, "_updateWithNewModeUUID:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:uiLocation:confidenceScore:serializedTriggers:allowsSmartEntry:shouldSuggestTriggers:", v4, v5, HIDWORD(v14), v14, v6, 0, -1.0, 1, v7, v8);

}

- (void)clientModel:(id)a3 didUpdatePredictionWithUUID:(id)a4 userModeName:(id)a5 modeType:(int)a6 confidenceScore:(double)a7 modeOrigin:(int)a8 originBundleId:(id)a9 originAnchorType:(id)a10 serializedTriggers:(id)a11
{
  uint64_t v13;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v13 = *(_QWORD *)&a6;
  v33 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a11;
  v20 = a10;
  v21 = a9;
  v22 = a5;
  __atxlog_handle_modes();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v25;
    v29 = 2114;
    v30 = v18;
    v31 = 2048;
    v32 = (int)v13;
    _os_log_impl(&dword_1D2C00000, v23, OS_LOG_TYPE_DEFAULT, "ATXModeClassifier: %{public}@ updated its mode prediction: modeUUID: %{public}@, modeType: %lu", buf, 0x20u);

  }
  -[ATXModeClassifier _updateWithNewModeUUIDIfNeeded:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:confidenceScore:serializedTriggers:](self, "_updateWithNewModeUUIDIfNeeded:userModeName:modeType:modeOrigin:originBundleId:originAnchorType:confidenceScore:serializedTriggers:", v18, v22, v13, a8, v21, v20, a7, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_modeExpirationTimer, 0);
  objc_storeStrong((id *)&self->_microlocationRecordingTrigger, 0);
  objc_storeStrong((id *)&self->_heuristicModeClassifier, 0);
  objc_storeStrong((id *)&self->_anchorModelSuggestionServer, 0);
  objc_storeStrong((id *)&self->_modeService, 0);
  objc_storeStrong((id *)&self->_inferredModeStream, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D2C00000, log, OS_LOG_TYPE_DEBUG, "ATXModeClassifier finished initialization", v1, 2u);
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "ATXModeClassifier: couldn't perform update operation because swelf is nil", v1, 2u);
}

void __152__ATXModeClassifier__updateWithNewModeUUIDIfNeeded_userModeName_modeType_modeOrigin_originBundleId_originAnchorType_confidenceScore_serializedTriggers___block_invoke_31_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_1D2C00000, log, OS_LOG_TYPE_ERROR, "ATXModeClassifer: something went wrong fetching widget scores! currentModeScore: %@, newModeScore: %@", (uint8_t *)&v4, 0x16u);
}

@end
