@implementation PGGraphUpdateManager

- (PGGraphUpdateManager)initWithGraphManager:(id)a3
{
  id v5;
  PGGraphUpdateManager *v6;
  PGGraphUpdateManager *v7;
  PGLibraryChangeListener *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  PGLibraryChangeListener *libraryChangeListener;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *processingQueue;
  dispatch_queue_t v17;
  OS_dispatch_queue *stateQueue;
  PGPhotoChangeToGraphChangeConverter *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PGPhotoChangeToGraphChangeConverter *changeConverter;
  uint64_t v24;
  NSMutableArray *pendingChanges;
  PGGraphUpdateJetsamIndicator *v26;
  void *v27;
  uint64_t v28;
  PGGraphUpdateJetsamIndicator *jetsamIndicator;
  uint64_t v30;
  NSMutableSet *listeners;
  void *v32;
  uint64_t v33;
  PGGraphUpdateHealthRecording *updateHealthRecorder;
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PGGraphUpdateManager;
  v6 = -[PGGraphUpdateManager init](&v36, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    v8 = [PGLibraryChangeListener alloc];
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "analytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGLibraryChangeListener initWithPhotoLibrary:clientIdentifier:analytics:](v8, "initWithPhotoLibrary:clientIdentifier:analytics:", v9, CFSTR("PGGraphUpdateManager"), v10);
    libraryChangeListener = v7->_libraryChangeListener;
    v7->_libraryChangeListener = (PGLibraryChangeListener *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.photoanalysis.graph.updatemanager.livechange", v14);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v15;

    dispatch_set_qos_class_floor((dispatch_object_t)v7->_processingQueue, QOS_CLASS_UTILITY, 0);
    dispatch_activate((dispatch_object_t)v7->_processingQueue);
    v17 = dispatch_queue_create("com.apple.photoanalysis.graph.updatemanager.state", v14);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v17;

    dispatch_set_qos_class_floor((dispatch_object_t)v7->_stateQueue, QOS_CLASS_UTILITY, 0);
    dispatch_activate((dispatch_object_t)v7->_stateQueue);
    v19 = [PGPhotoChangeToGraphChangeConverter alloc];
    -[PGManager photoLibrary](v7->_manager, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "graphLoggingConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PGPhotoChangeToGraphChangeConverter initWithPhotoLibrary:loggingConnection:](v19, "initWithPhotoLibrary:loggingConnection:", v20, v21);
    changeConverter = v7->_changeConverter;
    v7->_changeConverter = (PGPhotoChangeToGraphChangeConverter *)v22;

    v7->_stopRequested = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = objc_claimAutoreleasedReturnValue();
    pendingChanges = v7->_pendingChanges;
    v7->_pendingChanges = (NSMutableArray *)v24;

    v7->_processingState = 0;
    v26 = [PGGraphUpdateJetsamIndicator alloc];
    objc_msgSend(v5, "photoLibrary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[PGGraphUpdateJetsamIndicator initWithPhotoLibrary:](v26, "initWithPhotoLibrary:", v27);
    jetsamIndicator = v7->_jetsamIndicator;
    v7->_jetsamIndicator = (PGGraphUpdateJetsamIndicator *)v28;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = objc_claimAutoreleasedReturnValue();
    listeners = v7->_listeners;
    v7->_listeners = (NSMutableSet *)v30;

    objc_msgSend(v5, "analytics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHealthRecordingFactory graphUpdateHealthRecorderForChangeConsumer:analytics:](PGGraphHealthRecordingFactory, "graphUpdateHealthRecorderForChangeConsumer:analytics:", 1, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    updateHealthRecorder = v7->_updateHealthRecorder;
    v7->_updateHealthRecorder = (PGGraphUpdateHealthRecording *)v33;

  }
  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  const __CFString *v14;
  void *v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v17.receiver = self;
  v17.super_class = (Class)PGGraphUpdateManager;
  -[PGGraphUpdateManager description](&v17, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGGraphUpdateManager processingState](self, "processingState");
  if (v5 > 4)
    v6 = CFSTR("Unknown Processing State");
  else
    v6 = off_1E842A740[v5];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_stopRequested);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_listening);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PGGraphUpdateManager pendingChanges](self, "pendingChanges");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphUpdateManager targetTokenState](self, "targetTokenState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PGGraphUpdateManager executionContext](self, "executionContext");
  if (v13 > 2)
    v14 = CFSTR("Unknown Execution Context");
  else
    v14 = off_1E842A768[v13];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - processing state: %@, stopRequested: %@, listening: %@, number of pending changes: %@, target token state: %@, execution context: %@"), v4, v6, v7, v8, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (void)setListening:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  self->_listening = a3;
}

- (BOOL)isListening
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__PGGraphUpdateManager_isListening__block_invoke;
  v5[3] = &unk_1E8435708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setStopRequested:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  self->_stopRequested = a3;
}

- (BOOL)stopRequested
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__PGGraphUpdateManager_stopRequested__block_invoke;
  v5[3] = &unk_1E8435708;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)startListening
{
  BOOL v3;
  NSObject *stateQueue;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (+[PGUserDefaults suppressGraphLiveUpdate](PGUserDefaults, "suppressGraphLiveUpdate"))
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphUpdateManager_startListening__block_invoke;
  v6[3] = &unk_1E8435708;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v3 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)stopListening
{
  NSObject *stateQueue;
  _QWORD block[5];
  id v5;
  id location;

  if (!+[PGUserDefaults suppressGraphLiveUpdate](PGUserDefaults, "suppressGraphLiveUpdate"))
  {
    objc_initWeak(&location, self);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PGGraphUpdateManager_stopListening__block_invoke;
    block[3] = &unk_1E842A4B8;
    objc_copyWeak(&v5, &location);
    block[4] = self;
    dispatch_sync(stateQueue, block);
    dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_18788);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)addListener:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PGGraphUpdateManager_addListener___block_invoke;
  block[3] = &unk_1E8433828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)removeListener:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PGGraphUpdateManager_removeListener___block_invoke;
  block[3] = &unk_1E8433828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)libraryChangesAvailable:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PGGraphUpdateManager_libraryChangesAvailable___block_invoke;
  block[3] = &unk_1E842A4B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)incrementalChangeNotAvailable
{
  NSObject *stateQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PGGraphUpdateManager_incrementalChangeNotAvailable__block_invoke;
  v4[3] = &unk_1E842A500;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)performFullRebuildWithProgressBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  PGGraphIngestRecipe *v8;
  void *v9;
  void *v10;
  PGGraphIngestRecipe *v11;

  v6 = a4;
  v7 = a3;
  v8 = [PGGraphIngestRecipe alloc];
  -[PGGraphUpdateManager manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGGraphIngestRecipe initWithPhotoLibrary:](v8, "initWithPhotoLibrary:", v10);

  -[PGGraphUpdateManager _performRebuildWithGraphIngestRecipe:progressBlock:completionBlock:](self, "_performRebuildWithGraphIngestRecipe:progressBlock:completionBlock:", v11, v7, v6);
}

- (void)_performRebuildWithGraphIngestRecipe:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *stateQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke;
  block[3] = &unk_1E842A578;
  block[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_sync(stateQueue, block);

}

- (void)setProcessingState:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  PGGraphUpdateManager *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_processingState != (_DWORD)v3)
  {
    switch(self->_processingState)
    {
      case 0u:
        if ((v3 & 0xFE) == 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412802;
          v9 = v5;
          v10 = 2112;
          v11 = v6;
          v12 = 2112;
          v13 = self;
          v7 = MEMORY[0x1E0C81028];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 1u:
        if ((_DWORD)v3 != 3)
        {
          if ((_DWORD)v3 != 2)
            goto LABEL_19;
          -[PGGraphUpdateManager jetsamIndicator](self, "jetsamIndicator");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "markUpdate");
          goto LABEL_21;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412802;
          v9 = v5;
          v10 = 2112;
          v11 = v6;
          v12 = 2112;
          v13 = self;
          v7 = MEMORY[0x1E0C81028];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 2u:
        if (v3 < 2)
          goto LABEL_20;
        if ((_DWORD)v3 == 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412802;
          v9 = v5;
          v10 = 2112;
          v11 = v6;
          v12 = 2112;
          v13 = self;
          v7 = MEMORY[0x1E0C81028];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 3u:
        if ((v3 - 1) >= 2)
        {
LABEL_19:
          if (!(_DWORD)v3)
            goto LABEL_20;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 3);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412802;
          v9 = v5;
          v10 = 2112;
          v11 = v6;
          v12 = 2112;
          v13 = self;
          v7 = MEMORY[0x1E0C81028];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 4u:
        if ((v3 - 2) < 2)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_22;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412802;
          v9 = v5;
          v10 = 2112;
          v11 = v6;
          v12 = 2112;
          v13 = self;
          v7 = MEMORY[0x1E0C81028];
LABEL_28:
          _os_log_fault_impl(&dword_1CA237000, v7, OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected state transition (%@ - %@), please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v8, 0x20u);

        }
        else
        {
          if (v3 > 1)
            goto LABEL_22;
LABEL_20:
          -[PGGraphUpdateManager jetsamIndicator](self, "jetsamIndicator");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "clear");
        }
LABEL_21:

LABEL_22:
        self->_processingState = v3;
        return;
      default:
        goto LABEL_22;
    }
  }
}

- (void)_onStopRequestedWasListening:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v3)
    -[PGGraphUpdateManager _pauseListening](self, "_pauseListening");
  -[PGGraphUpdateManager setProcessingState:](self, "setProcessingState:", 0);
  -[PGGraphUpdateManager setStopRequested:](self, "setStopRequested:", 0);
  -[PGGraphUpdateManager setTargetTokenState:](self, "setTargetTokenState:", 0);
  -[PGGraphUpdateManager listeners](self, "listeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphUpdateManager _notifyListeners:notificationType:](self, "_notifyListeners:notificationType:", v5, 0);

  -[PGGraphUpdateHealthRecording endRecordingInBackground:](self->_updateHealthRecorder, "endRecordingInBackground:", -[PGGraphUpdateManager isConsistencyUpdate](self, "isConsistencyUpdate"));
}

- (void)_signalGraphIsConsistentWithTokens:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphUpdateManager targetTokenState](self, "targetTokenState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "isEqual:", v6, (_QWORD)v12) & 1) != 0)
          {

            -[PGGraphUpdateManager _onEncounteredTargetToken](self, "_onEncounteredTargetToken");
            goto LABEL_12;
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }

LABEL_12:
  }

}

- (void)_onEncounteredTargetToken
{
  void *v3;
  id v4;

  -[PGGraphUpdateManager targetTokenState](self, "targetTokenState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEncounteredTargetToken:", 1);

  -[PGGraphUpdateManager listeners](self, "listeners");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PGGraphUpdateManager _notifyListeners:notificationType:](self, "_notifyListeners:notificationType:", v4, 1);

}

- (void)_notifyListeners:(id)a3 notificationType:(unsigned __int8)a4
{
  NSObject *stateQueue;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unsigned __int8 v12;

  stateQueue = self->_stateQueue;
  v6 = a3;
  dispatch_assert_queue_V2(stateQueue);
  v7 = (void *)objc_msgSend(v6, "copy");

  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraphUpdateManager__notifyListeners_notificationType___block_invoke;
  v10[3] = &unk_1E842A5A0;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  dispatch_async(v8, v10);

}

- (void)_notifyProgress:(double)a3
{
  NSObject *stateQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__18737;
  v19 = __Block_byref_object_dispose__18738;
  v20 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PGGraphUpdateManager__notifyProgress___block_invoke;
  block[3] = &unk_1E8435708;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(stateQueue, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v16[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "graphUpdateMadeProgress:", a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

- (BOOL)_startListening
{
  PGGraphUpdateManagerTargetTokenState *v3;
  void *v4;
  void *v5;
  void *v6;
  PGGraphUpdateManagerTargetTokenState *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t v18[16];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Start Listening", v18, 2u);
  }
  -[PGGraphUpdateManager setProcessingState:](self, "setProcessingState:", 1);
  -[PGGraphUpdateManager setListening:](self, "setListening:", 1);
  v3 = [PGGraphUpdateManagerTargetTokenState alloc];
  -[PGGraphUpdateManager manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PGGraphUpdateManagerTargetTokenState initWithPersistentChangeToken:](v3, "initWithPersistentChangeToken:", v6);
  -[PGGraphUpdateManager setTargetTokenState:](self, "setTargetTokenState:", v7);

  -[PGGraphUpdateManager manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReady");

  if ((v9 & 1) != 0)
  {
    -[PGGraphUpdateManager jetsamIndicator](self, "jetsamIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "updateDidCauseJetsam");

    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - did detect update jetsam, will rebuild graph", v18, 2u);
      }
      -[PGGraphUpdateManager _processRebuild](self, "_processRebuild");
    }
    else
    {
      -[PGGraphUpdateHealthRecording beginRecording](self->_updateHealthRecorder, "beginRecording");
      -[PGGraphUpdateManager libraryChangeListener](self, "libraryChangeListener");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentToken");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v19[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C9AA60];
      }
      -[PGGraphUpdateManager _signalGraphIsConsistentWithTokens:](self, "_signalGraphIsConsistentWithTokens:", v14);
      -[PGGraphUpdateManager libraryChangeListener](self, "libraryChangeListener");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "registerChangeConsumer:", self);

      -[PGGraphUpdateManager libraryChangeListener](self, "libraryChangeListener");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startListening");

    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - starting but graph is not ready", v18, 2u);
  }
  return v9;
}

- (BOOL)_pauseListening
{
  BOOL listening;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Stop Listening", v8, 2u);
  }
  listening = self->_listening;
  -[PGGraphUpdateManager libraryChangeListener](self, "libraryChangeListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopListening");

  -[PGGraphUpdateManager libraryChangeListener](self, "libraryChangeListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterChangeConsumer:", self);

  -[PGGraphUpdateManager pendingChanges](self, "pendingChanges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[PGGraphUpdateManager setListening:](self, "setListening:", 0);
  return listening;
}

- (BOOL)isConsistencyUpdate
{
  return (unint64_t)(self->_executionContext - 1) < 2;
}

- (void)_processPendingChanges
{
  void *v3;
  NSObject *processingQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  PGGraphUpdateManager *v8;
  id v9;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (-[NSMutableArray count](self->_pendingChanges, "count"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_pendingChanges, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingChanges, "removeAllObjects");
    -[PGGraphUpdateManager setProcessingState:](self, "setProcessingState:", 2);
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__PGGraphUpdateManager__processPendingChanges__block_invoke;
    v6[3] = &unk_1E842A5C8;
    objc_copyWeak(&v9, &location);
    v7 = v3;
    v8 = self;
    v5 = v3;
    dispatch_async(processingQueue, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (id)_tokensForChanges:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v7 = 138412290;
    v15 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "changeToken", v15, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v4, "addObject:", v13);
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          v21 = v12;
          _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "GraphLiveUpdate - No token for change: %@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)_processRebuild
{
  BOOL v3;
  NSObject *processingQueue;
  _QWORD v5[5];
  id v6;
  BOOL v7;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v3 = -[PGGraphUpdateManager _pauseListening](self, "_pauseListening");
  -[PGGraphUpdateManager setProcessingState:](self, "setProcessingState:", 4);
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke;
  v5[3] = &unk_1E842A668;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v7 = v3;
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_onFinishedProcessingChangesWithTokens:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PGGraphUpdateManager__onFinishedProcessingChangesWithTokens___block_invoke;
  block[3] = &unk_1E8433828;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

- (void)_triggerFullRebuildDuringLiveUpdate:(BOOL)a3 graphIngestRecipe:(id)a4 progressBlock:(id)a5 keepExistingGraph:(BOOL)a6 completionBlock:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _BOOL8, _QWORD);
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double Current;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  PGManager *manager;
  double v25;
  dispatch_block_t v26;
  PGManager *v27;
  PGGraphUpdateManager *v28;
  id v29;
  uint64_t v30;
  uint32_t denom;
  uint32_t numer;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  PGGraphUpdate *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id *v41;
  BOOL v42;
  _BOOL8 v43;
  void *v44;
  id v45;
  os_signpost_id_t spid;
  id v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  _BOOL4 v51;
  _BOOL4 v52;
  void *v53;
  char v54;
  id obj;
  _QWORD v56[4];
  id v57;
  _QWORD v58[5];
  id v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *p_buf;
  _QWORD v63[4];
  id v64;
  double v65;
  uint64_t v66;
  id *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  _QWORD v76[5];
  mach_timebase_info info;
  int v78;
  _QWORD v79[3];
  uint64_t buf;
  __int128 v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint64_t v85;

  v51 = a6;
  v52 = a3;
  v85 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _BOOL8, _QWORD))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v53 = v11;
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(v11);
  v14 = 0.0;
  if (!v13 || (Current = CFAbsoluteTimeGetCurrent(), Current < 0.01))
  {
LABEL_7:
    -[PGManager graphLoggingConnection](self->_manager, "graphLoggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_signpost_id_generate(v16);
    v18 = v16;
    v19 = v18;
    v50 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PerformFullRebuild", ", (uint8_t *)&buf, 2u);
    }
    spid = v17;

    info = 0;
    mach_timebase_info(&info);
    v48 = mach_absolute_time();
    -[PGManager photoLibrary](self->_manager, "photoLibrary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentToken");
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = -[PGManager currentGraphVersion](self->_manager, "currentGraphVersion");
    v23 = MEMORY[0x1E0C809B0];
    if (v22 - 1 <= 0x12A)
    {
      manager = self->_manager;
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke;
      v76[3] = &unk_1E84353C0;
      v76[4] = self;
      -[PGManager performSynchronousConcurrentGraphReadUsingBlock:](manager, "performSynchronousConcurrentGraphReadUsingBlock:", v76);
    }
    v49 = (void *)v21;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    buf = 0;
    *(_QWORD *)&v81 = &buf;
    *((_QWORD *)&v81 + 1) = 0x3032000000;
    v82 = __Block_byref_object_copy__18737;
    v83 = __Block_byref_object_dispose__18738;
    v84 = 0;
    v66 = 0;
    v67 = (id *)&v66;
    v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__18737;
    v70 = __Block_byref_object_dispose__18738;
    if (v52)
      v25 = 0.5;
    else
      v25 = 1.0;
    v71 = 0;
    v72 = 0;
    v26 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_207);
    v27 = self->_manager;
    v63[0] = v23;
    v63[1] = 3221225472;
    v63[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3;
    v63[3] = &unk_1E842A6B0;
    v47 = v53;
    v64 = v47;
    v65 = v25;
    v58[0] = v23;
    v58[1] = 3221225472;
    v58[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4;
    v58[3] = &unk_1E842A6D8;
    v61 = &v66;
    p_buf = &buf;
    v60 = &v72;
    v28 = self;
    v58[4] = self;
    v29 = v26;
    v59 = v29;
    -[PGManager startLibraryAnalysisWithRecipe:progressBlock:keepExistingGraph:completionBlock:](v27, "startLibraryAnalysisWithRecipe:progressBlock:keepExistingGraph:completionBlock:", v10, v63, v51, v58);
    dispatch_block_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    v30 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v33 = v19;
    v34 = v33;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
    {
      LOWORD(v78) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v34, OS_SIGNPOST_INTERVAL_END, spid, "PerformFullRebuild", " enableTelemetry=YES ", (uint8_t *)&v78, 2u);
    }

    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v78 = 136315394;
      v79[0] = "PerformFullRebuild";
      LOWORD(v79[1]) = 2048;
      *(double *)((char *)&v79[1] + 2) = (float)((float)((float)((float)(v30 - v48) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v78, 0x16u);
    }
    v35 = v34;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0D42A38], "humanReadableMemoryFootprint");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 136315394;
      v79[0] = "PerformFullRebuild";
      LOWORD(v79[1]) = 2112;
      *(_QWORD *)((char *)&v79[1] + 2) = v44;
      _os_log_debug_impl(&dword_1CA237000, v35, OS_LOG_TYPE_DEBUG, "[Memory Footprint] %s : %@", (uint8_t *)&v78, 0x16u);

    }
    if (*((_BYTE *)v73 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(v78) = 0;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - rebuild completed successfully", (uint8_t *)&v78, 2u);
      }
      if (v52)
      {
        v36 = *(_QWORD *)(v81 + 40);
        if (!v36)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            LOWORD(v78) = 0;
            _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - Detected nil processedGraphUpdate following graph rebuild!", (uint8_t *)&v78, 2u);
          }
          v37 = [PGGraphUpdate alloc];
          -[PGManager photoLibrary](v28->_manager, "photoLibrary");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = -[PGGraphUpdate initWithPhotoLibrary:updateType:](v37, "initWithPhotoLibrary:updateType:", v38, 3);
          v40 = *(void **)(v81 + 40);
          *(_QWORD *)(v81 + 40) = v39;

          objc_msgSend(*(id *)(v81 + 40), "setIsResumingFullAnalysis:", 1);
          v36 = *(_QWORD *)(v81 + 40);
        }
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_212;
        v56[3] = &unk_1E8435028;
        v57 = v47;
        v41 = v67;
        obj = v67[5];
        v42 = -[PGGraphUpdateManager _performEnrichmentWithGraphUpdateInventory:enrichmentContext:progressBlock:error:](v28, "_performEnrichmentWithGraphUpdateInventory:enrichmentContext:progressBlock:error:", v36, 1, v56, &obj);
        objc_storeStrong(v41 + 5, obj);
        *((_BYTE *)v73 + 24) = v42;

      }
      if (*((_BYTE *)v73 + 24))
        -[PGLibraryChangeListener persistToken:](v28->_libraryChangeListener, "persistToken:", v49);
      if (v13)
      {
        if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
        {
          v54 = 0;
          v13[2](v13, &v54, 1.0);
          if (v54)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v78 = 67109378;
              LODWORD(v79[0]) = 978;
              WORD2(v79[0]) = 2080;
              *(_QWORD *)((char *)v79 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGGraphUpdateManager.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v78, 0x12u);
            }
            goto LABEL_44;
          }
        }
      }
      if (v12)
      {
        v43 = *((_BYTE *)v73 + 24) != 0;
LABEL_43:
        ((void (**)(id, _BOOL8, id))v12)[2](v12, v43, v67[5]);
      }
LABEL_44:

      _Block_object_dispose(&v66, 8);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v72, 8);
      goto LABEL_45;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v45 = v67[5];
      v78 = 138412290;
      v79[0] = v45;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - rebuild failed with error %@", (uint8_t *)&v78, 0xCu);
      if (!v12)
        goto LABEL_44;
    }
    else if (!v12)
    {
      goto LABEL_44;
    }
    v43 = 0;
    goto LABEL_43;
  }
  LOBYTE(v66) = 0;
  ((void (**)(void *, uint64_t *, double))v13)[2](v13, &v66, 0.0);
  if (!(_BYTE)v66)
  {
    v14 = Current;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x38104000202;
    LOWORD(v81) = 2080;
    *(_QWORD *)((char *)&v81 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Core/PGGraphUpdateManager.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_45:

}

- (void)_triggerUpdateForGraphUpdate:(id)a3
{
  id v4;
  id v5;
  dispatch_block_t v6;
  PGManager *manager;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id *v12;
  BOOL v13;
  uint64_t v14;
  id obj;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__18737;
  v33 = __Block_byref_object_dispose__18738;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18737;
  v27 = __Block_byref_object_dispose__18738;
  v5 = v4;
  v28 = v5;
  v6 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_213_18739);
  manager = self->_manager;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_2;
  v22[3] = &unk_1E842C7C0;
  v22[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_3;
  v17[3] = &unk_1E842A720;
  v19 = &v35;
  v20 = &v29;
  v21 = &v23;
  v9 = v6;
  v18 = v9;
  -[PGManager startGraphUpdate:progressBlock:completionBlock:](manager, "startGraphUpdate:progressBlock:completionBlock:", v5, v22, v17);
  dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_BYTE *)v36 + 24)
    && !-[PGGraphUpdateManager stopRequested](self, "stopRequested")
    && -[PGGraphUpdateManager executionContext](self, "executionContext") != 2)
  {
    if (-[PGGraphUpdateManager executionContext](self, "executionContext") == 1)
      v10 = 1;
    else
      v10 = 2;
    v11 = v24[5];
    v16[1] = 3221225472;
    v16[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_4;
    v16[3] = &unk_1E842C7C0;
    v16[4] = self;
    v12 = (id *)(v30 + 5);
    obj = (id)v30[5];
    v16[0] = v8;
    v13 = -[PGGraphUpdateManager _performEnrichmentWithGraphUpdateInventory:enrichmentContext:progressBlock:error:](self, "_performEnrichmentWithGraphUpdateInventory:enrichmentContext:progressBlock:error:", v11, v10, v16, &obj);
    objc_storeStrong(v12, obj);
    *((_BYTE *)v36 + 24) = v13;
  }
  if (!*((_BYTE *)v36 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = v30[5];
    *(_DWORD *)buf = 138412290;
    v40 = v14;
    _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Update failed with error %@", buf, 0xCu);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
}

- (BOOL)_performEnrichmentWithGraphUpdateInventory:(id)a3 enrichmentContext:(unint64_t)a4 progressBlock:(id)a5 error:(id *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  PGGraphDataModelEnrichmentManager *v17;
  void *v18;
  PGGraphDataModelEnrichmentManager *v19;
  id v20;
  int v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t v37;
  mach_timebase_info info;
  _QWORD v39[4];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  _BYTE v45[18];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v10 = a5;
  v11 = _Block_copy(v10);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  -[PGManager enrichmentLoggingConnection](self->_manager, "enrichmentLoggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EnrichmentUpdate", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v31 = mach_absolute_time();
  +[PGGraphDataModelEnrichmentManager enrichmentProcessorsForDataModelEnrichmentContext:](PGGraphDataModelEnrichmentManager, "enrichmentProcessorsForDataModelEnrichmentContext:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PGGraphDataModelEnrichmentManager alloc];
  -[PGGraphUpdateManager manager](self, "manager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PGGraphDataModelEnrichmentManager initWithManager:enrichmentProcessors:](v17, "initWithManager:enrichmentProcessors:", v18, v16);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __105__PGGraphUpdateManager__performEnrichmentWithGraphUpdateInventory_enrichmentContext_progressBlock_error___block_invoke;
  v33[3] = &unk_1E8434F30;
  v20 = v11;
  v34 = v20;
  v35 = v39;
  v36 = &v40;
  v37 = 0x3F847AE147AE147BLL;
  -[PGGraphDataModelEnrichmentManager enrichDataModelWithGraphUpdateInventory:error:progressBlock:](v19, "enrichDataModelWithGraphUpdateInventory:error:progressBlock:", v32, 0, v33);
  v21 = *((unsigned __int8 *)v41 + 24);
  if (a6 && *((_BYTE *)v41 + 24))
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -4);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v21 = *((unsigned __int8 *)v41 + 24);
  }
  if (v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v45 = 1048;
      *(_WORD *)&v45[4] = 2080;
      *(_QWORD *)&v45[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Core/PGGraphUpdateManager.m";
      v22 = MEMORY[0x1E0C81028];
      v23 = "Cancelled at line %d in file %s";
      v24 = 18;
LABEL_15:
      _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
    }
  }
  else
  {
    v25 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v28 = v15;
    v29 = v28;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v13, "EnrichmentUpdate", ", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v45 = "EnrichmentUpdate";
      *(_WORD *)&v45[8] = 2048;
      *(double *)&v45[10] = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
      v23 = "[Performance] %s: %f ms";
      v22 = v29;
      v24 = 22;
      goto LABEL_15;
    }
  }

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);

  return v21 == 0;
}

- (id)_graphUpdateForPhotoChanges:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  PGGraphUpdate *v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PGGraphUpdate *v20;
  void *v21;
  PGPhotoChangeToGraphChangeConverter *changeConverter;
  void *v23;
  uint64_t v24;
  uint32_t denom;
  uint32_t numer;
  NSObject *v27;
  NSObject *v28;
  PGGraphUpdate *v29;
  uint64_t v31;
  void *context;
  PGGraphUpdate *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  double v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "GraphLiveUpdate - Starting conversion from PHChange to PGGraphUpdate", buf, 2u);
  }
  v5 = -[PGGraphUpdateManager executionContext](self, "executionContext");
  if (v5 > 2)
    v6 = 0;
  else
    v6 = qword_1CA8EC9B0[v5];
  v7 = [PGGraphUpdate alloc];
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[PGGraphUpdate initWithPhotoLibrary:updateType:](v7, "initWithPhotoLibrary:updateType:", v8, v6);

  context = (void *)MEMORY[0x1CAA4EB2C]();
  -[PGManager graphLoggingConnection](self->_manager, "graphLoggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ConversionChanges", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v31 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (!objc_msgSend(v19, "hasIncrementalChanges"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate HasIncrementalChanges is equal to NO, need a full rebuild", buf, 2u);
          }

          objc_autoreleasePoolPop(context);
          v29 = 0;
          v20 = v33;
          goto LABEL_28;
        }
        objc_msgSend(v13, "addObject:", v19);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v16)
        continue;
      break;
    }
  }

  v20 = v33;
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD14A0], "mergePersistedChanges:", v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    changeConverter = self->_changeConverter;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __52__PGGraphUpdateManager__graphUpdateForPhotoChanges___block_invoke;
    v34[3] = &unk_1E842C7C0;
    v34[4] = self;
    -[PGPhotoChangeToGraphChangeConverter graphChangesWithPhotoChange:progressBlock:](changeConverter, "graphChangesWithPhotoChange:progressBlock:", v21, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphUpdateManager _recordInformationFromDatabaseChange:](self, "_recordInformationFromDatabaseChange:", v21);
    -[PGGraphUpdateManager _recordInformationFromGraphChanges:](self, "_recordInformationFromGraphChanges:", v23);
    -[PGGraphUpdate addChanges:](v33, "addChanges:", v23);

  }
  v24 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v27 = v12;
  v28 = v27;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v10, "ConversionChanges", ", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "ConversionChanges";
    v42 = 2048;
    v43 = (float)((float)((float)((float)(v24 - v31) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  objc_autoreleasePoolPop(context);
  v29 = v33;
LABEL_28:

  return v29;
}

- (void)_recordInformationFromDatabaseChange:(id)a3
{
  -[PGGraphUpdateHealthRecording recordNumberOfDatabaseChangesReceived:inBackground:](self->_updateHealthRecorder, "recordNumberOfDatabaseChangesReceived:inBackground:", objc_msgSend(a3, "totalChangeCount"), -[PGGraphUpdateManager isConsistencyUpdate](self, "isConsistencyUpdate"));
}

- (void)_recordInformationFromGraphChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "changeCount");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  -[PGGraphUpdateHealthRecording recordNumberOfDatabaseChangesConvertedToGraphChanges:inBackground:](self->_updateHealthRecorder, "recordNumberOfDatabaseChangesConvertedToGraphChanges:inBackground:", v7, -[PGGraphUpdateManager isConsistencyUpdate](self, "isConsistencyUpdate"));

}

- (void)_recordNumberOfDaysSinceMajorOSUpgradeIfNeeded
{
  void *v3;
  double v4;
  double v5;

  if (self->_dateSinceMajorUpgrade)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_dateSinceMajorUpgrade);
    v5 = v4;

    -[PGGraphUpdateHealthRecording recordNumberOfDaysSinceMajorOSUpgrade:](self->_updateHealthRecorder, "recordNumberOfDaysSinceMajorOSUpgrade:", vcvtmd_u64_f64(v5 / 86400.0));
  }
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (PGLibraryChangeListener)libraryChangeListener
{
  return self->_libraryChangeListener;
}

- (void)setLibraryChangeListener:(id)a3
{
  objc_storeStrong((id *)&self->_libraryChangeListener, a3);
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processingQueue, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateQueue, a3);
}

- (PGPhotoChangeToGraphChangeConverter)changeConverter
{
  return self->_changeConverter;
}

- (void)setChangeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_changeConverter, a3);
}

- (PGManager)manager
{
  return self->_manager;
}

- (unsigned)processingState
{
  return self->_processingState;
}

- (NSMutableArray)pendingChanges
{
  return self->_pendingChanges;
}

- (void)setPendingChanges:(id)a3
{
  objc_storeStrong((id *)&self->_pendingChanges, a3);
}

- (PGGraphUpdateJetsamIndicator)jetsamIndicator
{
  return self->_jetsamIndicator;
}

- (PGGraphUpdateManagerTargetTokenState)targetTokenState
{
  return self->_targetTokenState;
}

- (void)setTargetTokenState:(id)a3
{
  objc_storeStrong((id *)&self->_targetTokenState, a3);
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (void)setExecutionContext:(int64_t)a3
{
  self->_executionContext = a3;
}

- (PGGraphUpdateHealthRecording)updateHealthRecorder
{
  return self->_updateHealthRecorder;
}

- (NSDate)dateSinceMajorUpgrade
{
  return self->_dateSinceMajorUpgrade;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSinceMajorUpgrade, 0);
  objc_storeStrong((id *)&self->_updateHealthRecorder, 0);
  objc_storeStrong((id *)&self->_targetTokenState, 0);
  objc_storeStrong((id *)&self->_jetsamIndicator, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_changeConverter, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_libraryChangeListener, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

uint64_t __52__PGGraphUpdateManager__graphUpdateForPhotoChanges___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stopRequested");
  *a2 = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_notifyProgress:", a3);
  return result;
}

void __105__PGGraphUpdateManager__performEnrichmentWithGraphUpdateInventory_enrichmentContext_progressBlock_error___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

uint64_t __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stopRequested");
  *a2 = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_notifyProgress:", a3);
  return result;
}

void __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_3(_QWORD *a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;
  v14 = v7;

  v11 = *(_QWORD *)(a1[7] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v8;
  v13 = v8;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_4(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stopRequested");
  *a2 = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_notifyProgress:", a3);
  return result;
}

void __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "graph");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "infoNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v4;

}

uint64_t __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(a1 + 40) * a2);
}

void __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a4);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "_recordNumberOfDaysSinceMajorOSUpgradeIfNeeded");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_212(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.5);
}

void __63__PGGraphUpdateManager__onFinishedProcessingChangesWithTokens___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[9])
  {
    objc_msgSend(v2, "_onStopRequestedWasListening:", 1);
  }
  else
  {
    objc_msgSend(v2, "libraryChangeListener");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "consumer:didConsumeChangeTokens:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "_signalGraphIsConsistentWithTokens:", *(_QWORD *)(a1 + 40));
    switch(objc_msgSend(*(id *)(a1 + 32), "processingState"))
    {
      case 0u:
      case 1u:
      case 4u:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v10 = *(void **)(a1 + 32);
          v11 = 138412290;
          v12 = v10;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected state, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v11, 0xCu);
        }
        break;
      case 2u:
        objc_msgSend(*(id *)(a1 + 32), "pendingChanges");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "count");

        v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO);
        if (v5)
        {
          if (v6)
          {
            v7 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(*(id *)(a1 + 32), "pendingChanges");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = 138412290;
            v12 = v9;
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Manager done processing changes but will remain in busy state to process the following additional changes: %@", (uint8_t *)&v11, 0xCu);

          }
          objc_msgSend(*(id *)(a1 + 32), "_processPendingChanges");
        }
        else
        {
          if (v6)
          {
            LOWORD(v11) = 0;
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Manager done processing changes and there are no additional pending changes, to idle state", (uint8_t *)&v11, 2u);
          }
          objc_msgSend(*(id *)(a1 + 32), "setProcessingState:", 1);
        }
        break;
      case 3u:
        objc_msgSend(*(id *)(a1 + 32), "_processRebuild");
        break;
      default:
        return;
    }
  }
}

void __39__PGGraphUpdateManager__processRebuild__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PGGraphIngestRecipe *v3;
  void *v4;
  void *v5;
  PGGraphIngestRecipe *v6;
  _QWORD v7[5];
  char v8;
  _QWORD v9[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [PGGraphIngestRecipe alloc];
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PGGraphIngestRecipe initWithPhotoLibrary:](v3, "initWithPhotoLibrary:", v5);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_2;
    v9[3] = &unk_1E842A5F0;
    v9[4] = *(_QWORD *)(a1 + 32);
    v9[5] = WeakRetained;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_3;
    v7[3] = &unk_1E842A640;
    v7[4] = WeakRetained;
    v8 = *(_BYTE *)(a1 + 48);
    objc_msgSend(WeakRetained, "_triggerFullRebuildDuringLiveUpdate:graphIngestRecipe:progressBlock:keepExistingGraph:completionBlock:", 1, v6, v9, 1, v7);

  }
}

uint64_t __39__PGGraphUpdateManager__processRebuild__block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "stopRequested");
  *a2 = result;
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_notifyProgress:", a3);
  return result;
}

void __39__PGGraphUpdateManager__processRebuild__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_4;
  block[3] = &unk_1E842A618;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v13 = *(_BYTE *)(a1 + 40);
  v8 = v5;
  dispatch_sync(v7, block);

}

_BYTE *__39__PGGraphUpdateManager__processRebuild__block_invoke_4(uint64_t a1)
{
  _BYTE *result;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
      || (v3 = *(_QWORD *)(a1 + 32),
          v4 = 138412290,
          v5 = v3,
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - _processRebuild failed with error %@", (uint8_t *)&v4, 0xCu), !*(_BYTE *)(a1 + 48)))
    {
      result = *(_BYTE **)(a1 + 40);
      return (_BYTE *)objc_msgSend(result, "_onStopRequestedWasListening:", 0);
    }
  }
  result = *(_BYTE **)(a1 + 40);
  if (result[9])
    return (_BYTE *)objc_msgSend(result, "_onStopRequestedWasListening:", 0);
  if (*(_BYTE *)(a1 + 49))
    return (_BYTE *)objc_msgSend(result, "_startListening");
  return result;
}

void __46__PGGraphUpdateManager__processPendingChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  mach_timebase_info v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  char *v16;
  mach_timebase_info v17;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "stopRequested"))
    {
      objc_msgSend(v3, "stateQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __46__PGGraphUpdateManager__processPendingChanges__block_invoke_2;
      block[3] = &unk_1E8435668;
      block[4] = v3;
      dispatch_sync(v4, block);
    }
    else
    {
      objc_msgSend(v3, "_graphUpdateForPhotoChanges:", *(_QWORD *)(a1 + 32));
      v4 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject hasAnythingToDo](v4, "hasAnythingToDo"))
      {
        objc_msgSend(*(id *)(a1 + 40), "manager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "graphLoggingConnection");
        v6 = objc_claimAutoreleasedReturnValue();

        v7 = os_signpost_id_generate(v6);
        v8 = v6;
        v9 = v8;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformUpdate", ", buf, 2u);
        }

        v17 = 0;
        mach_timebase_info(&v17);
        v10 = mach_absolute_time();
        objc_msgSend(v3, "_triggerUpdateForGraphUpdate:", v4);
        v11 = mach_absolute_time();
        v12 = v17;
        v13 = v9;
        v14 = v13;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_END, v7, "PerformUpdate", ", buf, 2u);
        }

        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "PerformUpdate";
          v21 = 2048;
          v22 = (float)((float)((float)((float)(v11 - v10) * (float)v12.numer) / (float)v12.denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

      }
      objc_msgSend(*(id *)(a1 + 40), "_tokensForChanges:", *(_QWORD *)(a1 + 32));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v16;
        v21 = 2112;
        v22 = *(double *)&v15;
        _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "GraphLiveUpdate - UpdateManager consumed %@ tokens: %@", buf, 0x16u);

      }
      objc_msgSend(v3, "_onFinishedProcessingChangesWithTokens:", v15);

    }
  }

}

uint64_t __46__PGGraphUpdateManager__processPendingChanges__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onStopRequestedWasListening:", 1);
}

void __40__PGGraphUpdateManager__notifyProgress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "listeners");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__PGGraphUpdateManager__notifyListeners_notificationType___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 40) == 1)
        {
          objc_msgSend(v7, "graphUpdateIsConsistent", (_QWORD)v8);
        }
        else if (!*(_BYTE *)(a1 + 40))
        {
          objc_msgSend(v7, "graphUpdateDidStop");
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke(id *a1)
{
  void (**v2)(id, _QWORD, void *);
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "processingState"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v5 = a1[4];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - received performFullRebuildWithProgressBlock when not stopped, this is not expected, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)location, 0xCu);
    }
    v2 = (void (**)(id, _QWORD, void *))a1[6];
    if (v2)
    {
      +[PGError errorForCode:](PGError, "errorForCode:", -1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, 0, v3);

    }
  }
  else
  {
    objc_msgSend(a1[4], "setProcessingState:", 4);
    objc_initWeak(location, a1[4]);
    v4 = *((_QWORD *)a1[4] + 4);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_199;
    v6[3] = &unk_1E842A550;
    objc_copyWeak(&v10, location);
    v8 = a1[6];
    v7 = a1[5];
    v9 = a1[7];
    dispatch_async(v4, v6);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_199(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_2;
    v8[3] = &unk_1E842A528;
    v8[4] = WeakRetained;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_triggerFullRebuildDuringLiveUpdate:graphIngestRecipe:progressBlock:keepExistingGraph:completionBlock:", 0, v4, v5, 1, v8);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      +[PGError errorForCode:](PGError, "errorForCode:", -1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

    }
  }

}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_3;
  block[3] = &unk_1E8435668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v5, block);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

uint64_t __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProcessingState:", 0);
}

void __53__PGGraphUpdateManager_incrementalChangeNotAvailable__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  int v2;
  int v3;
  _BYTE *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = WeakRetained;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - incrementalChangeNotAvailable, rebuild will be initiated by UpdateManager (%@)", (uint8_t *)&v3, 0xCu);
  }
  if (WeakRetained && WeakRetained[10])
  {
    v2 = objc_msgSend(WeakRetained, "processingState");
    if (v2)
    {
      if (v2 == 2)
      {
        objc_msgSend(WeakRetained, "setProcessingState:", 3);
      }
      else if (v2 == 1)
      {
        objc_msgSend(WeakRetained, "_processRebuild");
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - received incrementalChangeNotAvailable when stopped, this is not expected, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v3, 0xCu);
    }
  }

}

void __48__PGGraphUpdateManager_libraryChangesAvailable___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  _BOOL8 v9;
  unsigned __int8 *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int8 *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[10];
    objc_msgSend(WeakRetained, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isReady");

    if (v4 && (v6 & 1) != 0)
    {
      objc_msgSend(v3, "pendingChanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", *(_QWORD *)(a1 + 32));

      v8 = objc_msgSend(v3, "processingState");
      if (!v8 || v8 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          v15 = 138412290;
          v16 = v3;
          _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected libraryChangesAvailable call, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      else if (v8 == 1)
      {
        objc_msgSend(v3, "_processPendingChanges");
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = v4 != 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
        v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - ignoring %@ changes because of state - listening: %@, graphIsReady: %@", (uint8_t *)&v15, 0x20u);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        objc_msgSend(v3, "_tokensForChanges:", *(_QWORD *)(a1 + 32));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "libraryChangeListener");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "consumer:didIgnoreChangeTokens:", v3, v13);

      }
    }
  }

}

void __39__PGGraphUpdateManager_removeListener___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "listeners");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __36__PGGraphUpdateManager_addListener___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "listeners");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "targetTokenState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "encounteredTargetToken");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_notifyListeners:notificationType:", v6, 1);

  }
}

void __37__PGGraphUpdateManager_stopListening__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "processingState");
    if ((v3 - 2) >= 3)
    {
      v4 = v3 == 1;
      WeakRetained = v5;
      if (!v4)
        goto LABEL_8;
      objc_msgSend(*(id *)(a1 + 32), "_onStopRequestedWasListening:", 1);
    }
    else
    {
      objc_msgSend(v5, "setStopRequested:", 1);
    }
    WeakRetained = v5;
  }
LABEL_8:

}

void __38__PGGraphUpdateManager_startListening__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "processingState");
  if ((v2 - 1) >= 4)
  {
    if (!v2)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_startListening");
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "GraphLiveUpdate - attempt to start an already running GraphUpdateManager: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __37__PGGraphUpdateManager_stopRequested__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

uint64_t __35__PGGraphUpdateManager_isListening__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 10);
  return result;
}

@end
