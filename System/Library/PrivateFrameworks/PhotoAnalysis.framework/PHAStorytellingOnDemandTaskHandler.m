@implementation PHAStorytellingOnDemandTaskHandler

- (PHAStorytellingOnDemandTaskHandler)initWithGraphManager:(id)a3 jobTimeHandler:(id)a4
{
  id v7;
  id v8;
  PHAStorytellingOnDemandTaskHandler *v9;
  PHAStorytellingOnDemandTaskHandler *v10;
  void *v11;
  uint64_t v12;
  PHPhotoLibrary *photoLibrary;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *executionQueue;
  uint64_t v17;
  NSMutableArray *operationsToRun;
  os_log_t v19;
  OS_os_log *loggingConnection;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHAStorytellingOnDemandTaskHandler;
  v9 = -[PHAStorytellingOnDemandTaskHandler init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graphManager, a3);
    -[PGManager workingContext](v10->_graphManager, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v10->_photoLibrary;
    v10->_photoLibrary = (PHPhotoLibrary *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.photoanalysis.ondemandtask", v14);
    executionQueue = v10->_executionQueue;
    v10->_executionQueue = (OS_dispatch_queue *)v15;

    v10->_isShutdown = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    operationsToRun = v10->_operationsToRun;
    v10->_operationsToRun = (NSMutableArray *)v17;

    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v10->_jobTimeHandler, v8);
    v19 = os_log_create("com.apple.photoanalysisd", "ondemandtaskhandler");
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v19;

  }
  return v10;
}

- (void)handleOperation:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray addObject:](self->_operationsToRun, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
  -[PHAStorytellingOnDemandTaskHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDemandTaskHandlerStartingOperation:", self);

  -[PHAStorytellingOnDemandTaskHandler dequeueOperationsIfNeeded](self, "dequeueOperationsIfNeeded");
}

- (BOOL)validateOperation:(id)a3 forConnection:(id)a4
{
  return 1;
}

- (id)nextOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray firstObject](self->_operationsToRun, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSMutableArray removeObjectAtIndex:](self->_operationsToRun, "removeObjectAtIndex:", 0);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)hasRemainingOperations
{
  PHAStorytellingOnDemandTaskHandler *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_operationsToRun, "count") != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)dequeueOperationsIfNeeded
{
  NSObject *executionQueue;
  _QWORD block[5];

  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke;
  block[3] = &unk_1E8521740;
  block[4] = self;
  dispatch_async(executionQueue, block);
}

- (BOOL)isQuiescent
{
  os_unfair_lock_s *p_lock;
  BOOL v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_operationsToRun, "count"))
    v4 = 0;
  else
    v4 = self->_onDemandTaskProgressReporter == 0;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)cancelCurrentOperation
{
  -[MARootProgressReporter cancelOperation](self->_onDemandTaskProgressReporter, "cancelOperation");
}

- (void)forceCancellationIfShutdown
{
  if (self->_isShutdown)
    -[MARootProgressReporter cancelOperation](self->_onDemandTaskProgressReporter, "cancelOperation");
}

- (void)shutdown
{
  NSObject *executionQueue;
  _QWORD block[5];

  -[MARootProgressReporter cancelOperation](self->_onDemandTaskProgressReporter, "cancelOperation");
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_operationsToRun, "removeAllObjects");
  os_unfair_lock_unlock(&self->_lock);
  self->_isShutdown = 1;
  executionQueue = self->_executionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PHAStorytellingOnDemandTaskHandler_shutdown__block_invoke;
  block[3] = &unk_1E8521740;
  block[4] = self;
  dispatch_sync(executionQueue, block);
}

- (void)requestOnDemandTasksWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  PHAMemoryElectionTask *v9;
  PHASuggestionGenerationTask *v10;
  PHAWallpaperSuggestionGenerationWeeklyTask *v11;
  void *v12;
  void *v13;
  PHAMemoryElectionTask **v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  PHAMemoryElectionTask *v43;
  PHAMemoryElectionTask *v44;
  PHAMemoryElectionTask *v45;
  PHAMemoryElectionTask *v46;
  PHAMemoryElectionTask *v47;
  PHAMemoryElectionTask *v48;
  PHAMemoryElectionTask *v49;
  PHAMemoryElectionTask *v50;
  PHAMemoryElectionTask *v51;
  _QWORD v52[5];

  v52[3] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D72150]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("contentGeneration")))
  {
    v9 = objc_alloc_init(PHAMemoryElectionTask);
    v52[0] = v9;
    v10 = objc_alloc_init(PHASuggestionGenerationTask);
    v52[1] = v10;
    v11 = -[PHAWallpaperSuggestionGenerationWeeklyTask initWithGenerationOptions:]([PHAWallpaperSuggestionGenerationWeeklyTask alloc], "initWithGenerationOptions:", 31);
    v52[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("reportActiveUserFeature")))
    {
      v9 = objc_alloc_init(PHAFeaturesUsageReportingTask);
      v51 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v51;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("sharedLibrarySuggestionsDaily")))
    {
      v9 = -[PHASharedLibrarySuggestionGenerationTask initWithTaskType:]([PHASharedLibrarySuggestionGenerationTask alloc], "initWithTaskType:", 0);
      v50 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v50;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("sharedLibrarySuggestionsWeekly")))
    {
      v9 = -[PHASharedLibrarySuggestionGenerationTask initWithTaskType:]([PHASharedLibrarySuggestionGenerationTask alloc], "initWithTaskType:", 1);
      v49 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v49;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("removeFeaturedContent")))
    {
      v9 = objc_alloc_init(PHARemoveFeaturedContentTask);
      v48 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v48;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("photosChallenge")))
    {
      v9 = objc_alloc_init(PHAPhotosChallengeTask);
      v47 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v47;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperNightly")))
    {
      v9 = objc_alloc_init(PHAWallpaperSuggestionGenerationNightlyTask);
      v46 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v46;
    }
    else if (objc_msgSend(v8, "hasPrefix:", CFSTR("wallpaperWeekly")))
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeekly")) & 1) != 0)
      {
        v15 = 31;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeeklyShuffleOnly")) & 1) != 0)
      {
        v15 = 1;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeeklyTopOnly")) & 1) != 0)
      {
        v15 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeeklySettlingEffectOnly")) & 1) != 0)
      {
        v15 = 4;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeeklyAmbientOnly")) & 1) != 0)
      {
        v15 = 8;
      }
      else
      {
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("wallpaperWeeklyMe")))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 3, CFSTR("Task not supported returned NO"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v36);

          goto LABEL_54;
        }
        v15 = 16;
      }
      v9 = -[PHAWallpaperSuggestionGenerationWeeklyTask initWithGenerationOptions:]([PHAWallpaperSuggestionGenerationWeeklyTask alloc], "initWithGenerationOptions:", v15);
      v45 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v45;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("userAnalyticsBiomeWeekly")))
    {
      v9 = -[PHAUserAnalyticsBiomeTask initWithTaskType:]([PHAUserAnalyticsBiomeTask alloc], "initWithTaskType:", 1);
      v44 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v44;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("userAnalyticsBiomeDaily")))
      {
        v12 = 0;
        goto LABEL_36;
      }
      v9 = -[PHAUserAnalyticsBiomeTask initWithTaskType:]([PHAUserAnalyticsBiomeTask alloc], "initWithTaskType:", 0);
      v43 = v9;
      v13 = (void *)MEMORY[0x1E0C99D20];
      v14 = &v43;
    }
    objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_36:
  if (objc_msgSend(v12, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v16 = v12;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v39;
      while (2)
      {
        v21 = 0;
        v22 = v19;
        do
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v16);
          v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v21);
          if (!objc_msgSend(v23, "shouldRunWithGraphManager:", self->_graphManager))
          {
            v31 = (void *)MEMORY[0x1E0CB35C8];
            v32 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v23, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "stringWithFormat:", CFSTR("%@'s shouldRunWithGraphManager returned NO"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "pl_analysisErrorWithCode:localizedDescription:", 14, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, 0, v35);

            goto LABEL_53;
          }
          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          v37 = v22;
          v26 = objc_msgSend(v23, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v37);
          v19 = v37;

          if (!v26)
          {
            v30 = 0;
            goto LABEL_52;
          }
          ++v21;
          v22 = v19;
        }
        while (v18 != v21);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v18)
          continue;
        break;
      }
    }
    else
    {
      v19 = 0;
    }
    v30 = 1;
LABEL_52:

    v7[2](v7, v30, v19);
LABEL_53:

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No tasks to run for %@"), v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pl_analysisErrorWithCode:localizedDescription:", 19, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v29);

  }
LABEL_54:

}

- (void)generateMemoriesWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  PGManager *graphManager;
  char v10;
  id v11;
  void *v12;
  PHAMemoryElectionTask *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  uint64_t v36;
  PGManager *v37;
  MARootProgressReporter *onDemandTaskProgressReporter;
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;

  v7 = a3;
  v8 = a5;
  graphManager = self->_graphManager;
  v43 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v43);
  v11 = v43;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    v40 = v11;
    v13 = objc_alloc_init(PHAMemoryElectionTask);
    -[PHAMemoryElectionTask name](v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v14);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionDateKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PHAMemoryElectionTask setUniversalDate:](v13, "setUniversalDate:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAMemoryElectionTask setUniversalDate:](v13, "setUniversalDate:", v16);

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionLocationKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAMemoryElectionTask setLocation:](v13, "setLocation:", v17);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionExtraParametersKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("notification"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAMemoryElectionTask setForceNotification:](v13, "setForceNotification:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionRequestedCategoryKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
      -[PHAMemoryElectionTask setRequestedCategory:](v13, "setRequestedCategory:", objc_msgSend(v20, "unsignedIntegerValue"));
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionRequestedTriggerKey"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      -[PHAMemoryElectionTask setRequestedTriggerType:](v13, "setRequestedTriggerType:", objc_msgSend(v22, "unsignedIntegerValue"));
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionRequestedFeatureTypeKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = (void *)MEMORY[0x1E0D75D28];
      v27 = objc_msgSend(v24, "unsignedIntegerValue");
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionRequestedFeatureIdentifierKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "featureWithType:name:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAMemoryElectionTask setRequestedFeature:](v13, "setRequestedFeature:", v29);

    }
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionRequestedUniqueMemoryIdentifierKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAMemoryElectionTask setRequestedUniqueMemoryIdentifier:](v13, "setRequestedUniqueMemoryIdentifier:", v30);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionReasonKey"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      v33 = objc_msgSend(v31, "unsignedIntegerValue") == 1;
    else
      v33 = 1;
    -[PHAMemoryElectionTask setUserInitiated:](v13, "setUserInitiated:", v33);
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PHMemoryOptionCommitChangesKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      v36 = objc_msgSend(v34, "BOOLValue") ^ 1;
    else
      v36 = 0;
    -[PHAMemoryElectionTask setCreateTransientMemories:](v13, "setCreateTransientMemories:", v36);
    v37 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __80__PHAStorytellingOnDemandTaskHandler_generateMemoriesWithOptions_context_reply___block_invoke;
    v41[3] = &unk_1E8520178;
    v42 = v8;
    -[PHAMemoryElectionTask runWithGraphManager:progressReporter:reply:](v13, "runWithGraphManager:progressReporter:reply:", v37, onDemandTaskProgressReporter, v41);

    v12 = v40;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
  }

}

- (void)generateSuggestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  PGManager *graphManager;
  char v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  __int16 v16;
  __objc2_class *v17;
  PHAWallpaperSuggestionGenerationWeeklyTask *v18;
  uint64_t v19;
  void *v20;
  unsigned __int16 v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  PHAWallpaperSuggestionGenerationWeeklyTask *v36;
  PHAWallpaperSuggestionGenerationWeeklyTask *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD *, void *);
  void *v41;
  id v42;
  PHAStorytellingOnDemandTaskHandler *v43;
  id v44;
  id v45;
  id v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  graphManager = self->_graphManager;
  v46 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v46);
  v11 = v46;
  if ((v10 & 1) != 0)
  {
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __83__PHAStorytellingOnDemandTaskHandler_generateSuggestionsWithOptions_context_reply___block_invoke;
    v41 = &unk_1E85201A0;
    v12 = v7;
    v42 = v12;
    v43 = self;
    v13 = v8;
    v45 = v13;
    v11 = v11;
    v44 = v11;
    v14 = _Block_copy(&v38);
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D722D0], v38, v39, v40, v41);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v16 == 8)
    {
      v18 = [PHAWallpaperSuggestionGenerationWeeklyTask alloc];
      v19 = 8;
    }
    else
    {
      if (v16 != 6)
      {
        if (v16 == 1)
        {
          v17 = PHASharingSuggestionGenerationTask;
        }
        else
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D72288]);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          if (!v16 && !v27)
          {
            v28 = (void *)MEMORY[0x1E0CB35C8];
            v47 = CFSTR("Unsupported generate suggestions options");
            v48[0] = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photoanalysis"), 17, v29);
            v30 = objc_claimAutoreleasedReturnValue();

            (*((void (**)(id, _QWORD, uint64_t))v13 + 2))(v13, 0, v30);
            v11 = (id)v30;
LABEL_25:

            goto LABEL_26;
          }
          v17 = PHASuggestionGenerationTask;
        }
        v36 = (PHAWallpaperSuggestionGenerationWeeklyTask *)objc_alloc_init(v17);
LABEL_24:
        v37 = v36;
        (*((void (**)(void *, PHAWallpaperSuggestionGenerationWeeklyTask *))v14 + 2))(v14, v36);

        goto LABEL_25;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D722C0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      objc_msgSend(MEMORY[0x1E0CD17D0], "allTopWallpaperSuggestionSubtypes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "containsObject:", v23);

      if ((v24 & 1) != 0)
      {
        v25 = 2;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD17D0], "allShuffleWallpaperSuggestionSubtypes");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v31, "containsObject:", v32);

        v34 = 23;
        if (v21 == 901)
          v34 = 16;
        v35 = 4;
        if (v21 != 680)
          v35 = v34;
        if ((v33 & 1) != 0)
          v25 = 1;
        else
          v25 = v35;
      }
      v18 = [PHAWallpaperSuggestionGenerationWeeklyTask alloc];
      v19 = v25;
    }
    v36 = -[PHAWallpaperSuggestionGenerationWeeklyTask initWithGenerationOptions:](v18, "initWithGenerationOptions:", v19);
    goto LABEL_24;
  }
  (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
LABEL_26:

}

- (void)reportMetricsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v6)(id, uint64_t, id);
  PGManager *graphManager;
  char v8;
  id v9;
  PHAMetricReportingTask *v10;
  void *v11;
  PGManager *v12;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v14;
  id v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v6 = (void (**)(id, uint64_t, id))a5;
  graphManager = self->_graphManager;
  v20 = 0;
  v8 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v20);
  v9 = v20;
  if ((v8 & 1) != 0)
  {
    v10 = objc_alloc_init(PHAMetricReportingTask);
    -[PHAMetricReportingTask name](v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v11);

    v12 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v19 = v9;
    v14 = -[PHAMetricReportingTask runWithGraphManager:progressReporter:error:](v10, "runWithGraphManager:progressReporter:error:", v12, onDemandTaskProgressReporter, &v19);
    v15 = v19;

    if ((_DWORD)v14)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAMetricReportingTask name](v10, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v17, v18);

    }
    v6[2](v6, v14, v15);

  }
  else
  {
    v6[2](v6, 0, v9);
    v15 = v9;
  }

}

- (void)requestGenerateQuestionsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  PGManager *graphManager;
  char v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  PHAPhotosChallengeTask *v33;
  PHAPhotosChallengeTask *v34;
  void *v35;
  PGManager *v36;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v38;
  id v39;
  id WeakRetained;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _BOOL8 v46;
  void *v47;
  void *v48;
  void **v49;
  uint64_t *v50;
  _BOOL8 v51;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a5;
  graphManager = self->_graphManager;
  v54 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v54);
  v11 = v54;
  if ((v10 & 1) == 0)
  {
    v8[2](v8, 0, v11);
    goto LABEL_7;
  }
  v12 = *MEMORY[0x1E0D721D8];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721D8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if (v14)
  {
    +[PHAPhotosChallengeTask currentQuestionsKVSDataFromGraphManager:](PHAPhotosChallengeTask, "currentQuestionsKVSDataFromGraphManager:", self->_graphManager);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v12;
    v62[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v8)[2](v8, v16, 0);

    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721B8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    +[PHAPhotosChallengeTask removeCurrentKVSDataFromGraphManager:](PHAPhotosChallengeTask, "removeCurrentKVSDataFromGraphManager:", self->_graphManager);
    v8[2](v8, MEMORY[0x1E0C9AA70], 0);
    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721F0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (v20)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721B0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v45 = v23;

    v46 = +[PHAPhotosChallengeTask postSubmissionNotificationIfNeededWithGraphManager:notificationDate:](PHAPhotosChallengeTask, "postSubmissionNotificationIfNeededWithGraphManager:notificationDate:", self->_graphManager, v45);
    v59 = *MEMORY[0x1E0D721C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v47;
    v48 = (void *)MEMORY[0x1E0C99D80];
    v49 = &v60;
    v50 = &v59;
LABEL_25:
    objc_msgSend(v48, "dictionaryWithObjects:forKeys:count:", v49, v50, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, id))v8)[2](v8, v52, 0);

    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721E8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "BOOLValue");

  if (v25)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721B0]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    v45 = v28;

    v51 = +[PHAPhotosChallengeTask postNewQuestionsNotificationIfNeededWithGraphManager:notificationDate:](PHAPhotosChallengeTask, "postNewQuestionsNotificationIfNeededWithGraphManager:notificationDate:", self->_graphManager, v45);
    v57 = *MEMORY[0x1E0D721C0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v51);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v47;
    v48 = (void *)MEMORY[0x1E0C99D80];
    v49 = &v58;
    v50 = &v57;
    goto LABEL_25;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721E0]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedIntegerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D721A8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "integerValue");

  v33 = objc_alloc_init(PHAPhotosChallengeTask);
  v34 = v33;
  if (v32)
    -[PHAPhotosChallengeTask setLimit:](v33, "setLimit:", v32);
  if (v30)
    -[PHAPhotosChallengeTask setQuestionOptions:](v34, "setQuestionOptions:", v30);
  -[PHAPhotosChallengeTask name](v34, "name");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v35);

  v36 = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v53 = v11;
  v38 = -[PHAPhotosChallengeTask runWithGraphManager:progressReporter:error:](v34, "runWithGraphManager:progressReporter:error:", v36, onDemandTaskProgressReporter, &v53);
  v39 = v53;

  if ((_DWORD)v38)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAPhotosChallengeTask name](v34, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v41, v42);

  }
  v55 = *MEMORY[0x1E0D721D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, id))v8)[2](v8, v44, v39);

  v11 = v39;
LABEL_7:

}

- (void)requestSyndicationProcessingWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, id, id);
  PGManager *graphManager;
  char v10;
  id v11;
  PHASyndicationTask *v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  PGManager *v18;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v20;
  id v21;
  id WeakRetained;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v7 = a3;
  v8 = (void (**)(id, id, id))a5;
  graphManager = self->_graphManager;
  v29 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v29);
  v11 = v29;
  if ((v10 & 1) != 0)
  {
    v12 = objc_alloc_init(PHASyndicationTask);
    v13 = (_QWORD *)MEMORY[0x1E0D722F0];
    v14 = (_QWORD *)MEMORY[0x1E0D722E8];
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D722E8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASyndicationTask setPerformCurationJob:](v12, "setPerformCurationJob:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v7, "objectForKeyedSubscript:", *v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASyndicationTask setPerformGuestInferenceJob:](v12, "setPerformGuestInferenceJob:", objc_msgSend(v16, "BOOLValue"));

    }
    -[PHASyndicationTask name](v12, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v17);

    v18 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v28 = v11;
    v20 = -[PHASyndicationTask runWithGraphManager:progressReporter:error:](v12, "runWithGraphManager:progressReporter:error:", v18, onDemandTaskProgressReporter, &v28);
    v21 = v28;

    if ((_DWORD)v20)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHASyndicationTask name](v12, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v23, v24);

    }
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[PHASyndicationTask performCurationJob](v12, "performCurationJob"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, *v14);

    }
    if (-[PHASyndicationTask performGuestInferenceJob](v12, "performGuestInferenceJob"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, *v13);

    }
    v8[2](v8, v25, v21);

  }
  else
  {
    v8[2](v8, 0, v11);
    v21 = v11;
  }

}

- (void)requestExternalAssetRelevanceProcessingWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *, id);
  PGManager *graphManager;
  char v7;
  id v8;
  PHAExternalAssetsTask *v9;
  void *v10;
  PGManager *v11;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v5 = (void (**)(id, void *, id))a4;
  graphManager = self->_graphManager;
  v20 = 0;
  v7 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v20);
  v8 = v20;
  if ((v7 & 1) != 0)
  {
    v9 = objc_alloc_init(PHAExternalAssetsTask);
    -[PHAExternalAssetsTask name](v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v10);

    v11 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v19 = v8;
    v13 = -[PHAExternalAssetsTask runWithGraphManager:progressReporter:error:](v9, "runWithGraphManager:progressReporter:error:", v11, onDemandTaskProgressReporter, &v19);
    v14 = v19;

    if ((_DWORD)v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAExternalAssetsTask name](v9, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v16, v17);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v18, v14);

  }
  else
  {
    v5[2](v5, 0, v8);
    v14 = v8;
  }

}

- (void)cacheCPAnalyticsPropertiesWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, id);
  PHACachingCPAnalyticsPropertiesTask *v6;
  void *v7;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;

  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = objc_alloc_init(PHACachingCPAnalyticsPropertiesTask);
  -[PHACachingCPAnalyticsPropertiesTask name](v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v7);

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v15 = 0;
  v10 = -[PHACachingCPAnalyticsPropertiesTask runWithGraphManager:progressReporter:error:](v6, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v15);
  v11 = v15;
  if ((_DWORD)v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHACachingCPAnalyticsPropertiesTask name](v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v13, v14);

  }
  v5[2](v5, v10, v11);

}

- (void)requestEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  PHAPeopleSuggestionEnrichmentTask *v9;
  PHAForcedHighlightEnrichmentTask *v10;
  PHAHighlightCollectionEnrichmentTask *v11;
  PHASearchEnrichmentTask *v12;
  PHAAssetRevGeocodeEnrichmentTask *v13;
  PHAUserBehaviorEnrichmentTask *v14;
  PHAPortraitDonationEnrichmentTask *v15;
  PHAMemoriesEnrichmentTask *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  id v42;
  id WeakRetained;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void (**v49)(id, void *);
  id *location;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  void *v61;
  _BYTE v62[128];
  _QWORD v63[10];

  v63[8] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v47 = a4;
  v49 = (void (**)(id, void *))a5;
  v9 = objc_alloc_init(PHAPeopleSuggestionEnrichmentTask);
  v63[0] = v9;
  v10 = objc_alloc_init(PHAForcedHighlightEnrichmentTask);
  v63[1] = v10;
  v11 = objc_alloc_init(PHAHighlightCollectionEnrichmentTask);
  v63[2] = v11;
  v12 = objc_alloc_init(PHASearchEnrichmentTask);
  v63[3] = v12;
  v13 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  v63[4] = v13;
  v14 = objc_alloc_init(PHAUserBehaviorEnrichmentTask);
  v63[5] = v14;
  v15 = objc_alloc_init(PHAPortraitDonationEnrichmentTask);
  v63[6] = v15;
  v16 = -[PHAMemoriesEnrichmentTask initWithOptions:]([PHAMemoriesEnrichmentTask alloc], "initWithOptions:", v8);
  v63[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 8);
  location = (id *)objc_claimAutoreleasedReturnValue();

  v48 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("processor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("force-all")) & 1) != 0)
    {
      v19 = location;
    }
    else
    {
      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("backgroundjob"), &stru_1E85223A0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("background"), &stru_1E85223A0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "stringByReplacingOccurrencesOfString:withString:", CFSTR("processor"), &stru_1E85223A0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("enrichment"), &stru_1E85223A0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v23 = location;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      v19 = v23;
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v57;
        while (2)
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v57 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            objc_msgSend(v28, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "lowercaseString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v30, "containsString:", v18))
            {
              v61 = v28;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_15;
            }

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
          if (v25)
            continue;
          break;
        }
        v19 = v23;
      }
LABEL_15:

    }
    if (!objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v49[2](v49, v31);

    }
  }
  else
  {
    v19 = location;
  }
  v46 = v18;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v32 = v19;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v33)
  {
    v34 = v33;
    v35 = 0;
    v36 = *(_QWORD *)v53;
    while (2)
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v53 != v36)
          objc_enumerationMutation(v32);
        v38 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
        if (objc_msgSend(v38, "currentPlatformIsSupported", v46, v47)
          && objc_msgSend(v38, "shouldRunWithGraphManager:", self->_graphManager))
        {
          objc_msgSend(v38, "name");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v39);

          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          v51 = v35;
          LODWORD(v39) = objc_msgSend(v38, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v51);
          v42 = v51;

          if (!(_DWORD)v39)
          {
            v49[2](v49, v42);
            v35 = v42;
            goto LABEL_32;
          }
          WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "name");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v44, v45);

          v35 = v42;
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v34)
        continue;
      break;
    }
  }
  else
  {
    v35 = 0;
  }
LABEL_32:

  v49[2](v49, 0);
}

- (void)requestHighlightEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PHAHighlightEnrichmentTask *v21;
  id WeakRetained;
  id v23;
  void *v24;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  PHAStorytellingOnDemandTaskHandler *v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (!v11)
  {

    v19 = 255;
    goto LABEL_35;
  }
  v12 = v11;
  v31 = self;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v36;
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v36 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("force"), v31))
      {
        v14 |= 0x40000000uLL;
        goto LABEL_25;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("ignoreRequirements")))
      {
        v14 |= 0xFFFFFFFF80000000;
        goto LABEL_25;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("curation")))
      {
        v14 |= 0x10uLL;
LABEL_24:
        v13 = 1;
        goto LABEL_25;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("keyAsset")))
      {
        v14 |= 8uLL;
        goto LABEL_24;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("title")))
      {
        v14 |= 6uLL;
        goto LABEL_24;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("promotionScore")))
      {
        v14 |= 1uLL;
        goto LABEL_24;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("momentTitles")))
      {
        v14 |= 0x20uLL;
        goto LABEL_24;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("visibilityScore")))
      {
        v14 |= 0x40uLL;
        goto LABEL_24;
      }
      if (objc_msgSend(v17, "isEqualToString:", CFSTR("momentLocations")))
      {
        v14 |= 0x80uLL;
        goto LABEL_24;
      }
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);

      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorForInvalidParameterValue:named:", v17, CFSTR("option"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v30);

        v23 = v10;
        goto LABEL_41;
      }
      objc_msgSend(v9, "addObject:", v17);
LABEL_25:
      ++v16;
    }
    while (v12 != v16);
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v12 = v18;
  }
  while (v18);

  if ((v13 & 1) != 0)
    v19 = v14;
  else
    v19 = v14 | 0xFF;
  self = v31;
LABEL_35:
  if (objc_msgSend(v9, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75FF8]), "initWithHighlightTailorOptions:", v19);
    v39 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v21 = (PHAHighlightEnrichmentTask *)objc_claimAutoreleasedReturnValue();

    WeakRetained = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75F88]), "initWithManager:enrichmentProcessors:", self->_graphManager, v21);
    v34 = 0;
    objc_msgSend(WeakRetained, "enrichDataModelForHighlightUUIDs:withError:progressBlock:", v9, &v34, &__block_literal_global_2784);
    v23 = v34;
    goto LABEL_39;
  }
  v21 = objc_alloc_init(PHAHighlightEnrichmentTask);
  -[PHAHighlightEnrichmentTask setTailorOptions:](v21, "setTailorOptions:", v19);
  -[PHAEnrichmentTask name](v21, "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v24);

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v33 = 0;
  v27 = -[PHAHighlightEnrichmentTask runWithGraphManager:progressReporter:error:](v21, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v33);
  v23 = v33;
  if (v27)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAEnrichmentTask name](v21, "name");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v28, v29);

LABEL_39:
  }

  v8[2](v8, v23);
LABEL_41:

}

- (void)requestHighlightCollectionEnrichmentWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  void (**v7)(id, id);
  id v8;
  PHAHighlightCollectionEnrichmentTask *v9;
  void *v10;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;

  v7 = (void (**)(id, id))a5;
  v8 = a3;
  v9 = -[PHAHighlightCollectionEnrichmentTask initWithOptions:]([PHAHighlightCollectionEnrichmentTask alloc], "initWithOptions:", v8);

  -[PHAEnrichmentTask name](v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v10);

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v17 = 0;
  LODWORD(v8) = -[PHAEnrichmentTask runWithGraphManager:progressReporter:error:](v9, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v17);
  v13 = v17;
  if ((_DWORD)v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAEnrichmentTask name](v9, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v15, v16);

  }
  v7[2](v7, v13);

}

- (void)requestAssetRevGeocodingWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, id);
  PHAAssetRevGeocodeEnrichmentTask *v6;
  void *v7;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  _BOOL4 v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;

  v5 = (void (**)(id, id))a4;
  v6 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  -[PHAEnrichmentTask name](v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v7);

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v15 = 0;
  v10 = -[PHAEnrichmentTask runWithGraphManager:progressReporter:error:](v6, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v15);
  v11 = v15;
  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAEnrichmentTask name](v6, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v13, v14);

  }
  v5[2](v5, v11);

}

- (void)requestAssetRevGeocodingForAssetLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  void *v7;
  PGManager *graphManager;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  OS_os_log *loggingConnection;
  void *v17;
  void *v18;
  id v19;

  v7 = (void *)MEMORY[0x1E0D76208];
  graphManager = self->_graphManager;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = a3;
  -[PGManager workingContext](graphManager, "workingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseGeoFetchOptionsForPhotoLibrary:", v12);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v10, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x1E0D76208]);
  -[PGManager photoLibrary](self->_graphManager, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = self->_loggingConnection;
  -[PGManager locationCache](self->_graphManager, "locationCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithPhotoLibrary:homeLocations:loggingConnection:locationCache:", v15, MEMORY[0x1E0C9AA60], loggingConnection, v17);

  objc_msgSend(v18, "revGeocodeAssets:progressBlock:", v13, &__block_literal_global_294);
  v9[2](v9, 0);

}

- (void)requestRevGeocodingSyndicationLibraryWithContext:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, id);
  PGManager *graphManager;
  char v7;
  id v8;
  PHARevGeocodeSyndicationTask *v9;
  void *v10;
  PGManager *v11;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v13;
  id v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = (void (**)(id, uint64_t, id))a4;
  graphManager = self->_graphManager;
  v19 = 0;
  v7 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v19);
  v8 = v19;
  if ((v7 & 1) != 0)
  {
    v9 = objc_alloc_init(PHARevGeocodeSyndicationTask);
    -[PHARevGeocodeSyndicationTask name](v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v10);

    v11 = self->_graphManager;
    onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
    v18 = v8;
    v13 = -[PHARevGeocodeSyndicationTask runWithGraphManager:progressReporter:error:](v9, "runWithGraphManager:progressReporter:error:", v11, onDemandTaskProgressReporter, &v18);
    v14 = v18;

    if ((_DWORD)v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_jobTimeHandler);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHARevGeocodeSyndicationTask name](v9, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setLibraryScopedWorkerPreferencesValue:forKey:", v16, v17);

    }
    v5[2](v5, v13, v14);

  }
  else
  {
    v5[2](v5, 0, v8);
    v14 = v8;
  }

}

- (void)runPerformanceTest:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *loggingConnection;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  if ((PFOSVariantHasInternalDiagnostics() & 1) == 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "Performance test is only available on Apple internal.", (uint8_t *)&v17, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v13);

  }
  v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_DEFAULT, "Running Performance Test: %@", (uint8_t *)&v17, 0xCu);
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("CachingCPAnalytics")))
  {
    -[PHAStorytellingOnDemandTaskHandler _runCachingCPAnalyticsTestWithOptions:reply:](self, "_runCachingCPAnalyticsTestWithOptions:reply:", v10, v11);
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Enrichment")))
  {
    -[PHAStorytellingOnDemandTaskHandler _runEnrichmentTestWithOptions:reply:](self, "_runEnrichmentTestWithOptions:reply:", v10, v11);
  }
  else
  {
    v15 = self->_loggingConnection;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v9;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v16);

  }
}

- (void)_runCachingCPAnalyticsTestWithOptions:(id)a3 reply:(id)a4
{
  void (**v5)(id, uint64_t, id);
  PHACachingCPAnalyticsPropertiesTask *v6;
  void *v7;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  uint64_t v10;
  id v11;
  id v12;

  v5 = (void (**)(id, uint64_t, id))a4;
  v6 = objc_alloc_init(PHACachingCPAnalyticsPropertiesTask);
  -[PHACachingCPAnalyticsPropertiesTask name](v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v7);

  graphManager = self->_graphManager;
  onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
  v12 = 0;
  v10 = -[PHACachingCPAnalyticsPropertiesTask runWithGraphManager:progressReporter:error:](v6, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v12);
  v11 = v12;
  v5[2](v5, v10, v11);

}

- (void)_runEnrichmentTestWithOptions:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  PHAPeopleSuggestionEnrichmentTask *v8;
  PHAHighlightCollectionEnrichmentTask *v9;
  PHASearchEnrichmentTask *v10;
  PHAAssetRevGeocodeEnrichmentTask *v11;
  PHAUserBehaviorEnrichmentTask *v12;
  PHAPortraitDonationEnrichmentTask *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  PGManager *graphManager;
  MARootProgressReporter *onDemandTaskProgressReporter;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[8];

  v32[6] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = objc_alloc_init(PHAPeopleSuggestionEnrichmentTask);
  v32[0] = v8;
  v9 = objc_alloc_init(PHAHighlightCollectionEnrichmentTask);
  v32[1] = v9;
  v10 = objc_alloc_init(PHASearchEnrichmentTask);
  v32[2] = v10;
  v11 = objc_alloc_init(PHAAssetRevGeocodeEnrichmentTask);
  v32[3] = v11;
  v12 = objc_alloc_init(PHAUserBehaviorEnrichmentTask);
  v32[4] = v12;
  v13 = objc_alloc_init(PHAPortraitDonationEnrichmentTask);
  v32[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v21, "currentPlatformIsSupported")
          && objc_msgSend(v21, "shouldRunWithGraphManager:", self->_graphManager))
        {
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGProgressCallChecker setTaskName:](self->_progressCallChecker, "setTaskName:", v22);

          graphManager = self->_graphManager;
          onDemandTaskProgressReporter = self->_onDemandTaskProgressReporter;
          v26 = v18;
          LODWORD(v22) = objc_msgSend(v21, "runWithGraphManager:progressReporter:error:", graphManager, onDemandTaskProgressReporter, &v26);
          v25 = v26;

          if (!(_DWORD)v22)
          {
            v7[2](v7, 0, v25);

            goto LABEL_16;
          }
          v18 = v25;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v17)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }

  v7[2](v7, 1, 0);
  v25 = v18;
LABEL_16:

}

- (void)requestSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4 context:(id)a5 reply:(id)a6
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  PGManager *graphManager;
  char v11;
  id v12;
  void *v13;
  id v14;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a6;
  graphManager = self->_graphManager;
  v14 = 0;
  v11 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v14);
  v12 = v14;
  if ((v11 & 1) != 0)
  {
    -[PGManager suggestedContributionsForAssetsMetadata:](self->_graphManager, "suggestedContributionsForAssetsMetadata:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v13, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v9)[2](v9, 0, v12);
  }

}

- (void)requestSuggestedRecipientsForAssetLocalIdentifiers:(id)a3 momentLocalIdentifiers:(id)a4 options:(id)a5 context:(id)a6 reply:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, _QWORD);
  PGManager *graphManager;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, _QWORD))a7;
  graphManager = self->_graphManager;
  v40 = 0;
  LOBYTE(a7) = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v40);
  v16 = v40;
  if ((a7 & 1) != 0)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("PHPeopleSuggestionClientKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v19 = objc_msgSend(v17, "unsignedIntegerValue");
    else
      v19 = 0;
    objc_msgSend(MEMORY[0x1E0D76238], "optionsForClient:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("PHSuggestedRecipientsSharingStreamKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
      objc_msgSend(v20, "setSharingStream:", objc_msgSend(v21, "unsignedIntegerValue"));
    -[PGManager suggestedRecipientsForAssetLocalIdentifiers:momentLocalIdentifiers:sharingOptions:](self->_graphManager, "suggestedRecipientsForAssetLocalIdentifiers:momentLocalIdentifiers:sharingOptions:", v11, v12, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      v31 = v22;
      v32 = v20;
      v33 = v18;
      v34 = v12;
      v35 = v11;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v25 = v23;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v37 != v28)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v30);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v27);
      }

      v14[2](v14, v24, 0);
      v12 = v34;
      v11 = v35;
      v20 = v32;
      v18 = v33;
      v22 = v31;
    }
    else
    {
      v14[2](v14, (void *)MEMORY[0x1E0C9AA60], 0);
    }

  }
  else
  {
    ((void (**)(id, void *, id))v14)[2](v14, 0, v16);
  }

}

- (void)requestRelationshipInferencesForPersonLocalIdentifiers:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  PGManager *graphManager;
  char v10;
  id v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  graphManager = self->_graphManager;
  v13 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v13);
  v11 = v13;
  if ((v10 & 1) != 0)
  {
    -[PGManager relationshipInferencesForPersonLocalIdentifiers:](self->_graphManager, "relationshipInferencesForPersonLocalIdentifiers:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12, 0);

  }
  else
  {
    ((void (**)(id, void *, id))v8)[2](v8, 0, v11);
  }

}

- (void)requestSuggestedPersonsWithOptions:(id)a3 context:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, void *, id);
  PGManager *graphManager;
  char v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a5;
  graphManager = self->_graphManager;
  v17 = 0;
  v10 = -[PGManager isReadyWithError:](graphManager, "isReadyWithError:", &v17);
  v11 = v17;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("PHPeopleSuggestionClientKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      switch(objc_msgSend(v12, "unsignedIntegerValue"))
      {
        case 0:
        case 2:
        case 3:
          goto LABEL_4;
        case 1:
          -[PGManager suggestedPersonsForHome](self->_graphManager, "suggestedPersonsForHome");
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 4:
          -[PGManager suggestedPersonsForSharedLibraryParticipants](self->_graphManager, "suggestedPersonsForSharedLibraryParticipants");
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        case 5:
          -[PGManager suggestedPersonsForSharedLibraryContentInclusion](self->_graphManager, "suggestedPersonsForSharedLibraryContentInclusion");
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v15 = (void *)v16;
          break;
        default:
          v15 = 0;
          break;
      }
    }
    else
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB35C8], "pl_analysisErrorWithCode:localizedDescription:", 17, CFSTR("-[PHAOnDiskGraphServiceWorker requestSuggestedPersonsWithOptions:context:reply:] does not support the passed in client"));
      v14 = objc_claimAutoreleasedReturnValue();

      v15 = 0;
      v11 = (id)v14;
    }
    v8[2](v8, v15, v11);

  }
  else
  {
    v8[2](v8, 0, v11);
  }

}

- (MARootProgressReporter)onDemandTaskProgressReporter
{
  return self->_onDemandTaskProgressReporter;
}

- (PHAJobTimeHandlerProtocol)jobTimeHandler
{
  return (PHAJobTimeHandlerProtocol *)objc_loadWeakRetained((id *)&self->_jobTimeHandler);
}

- (PHAStorytellingOnDemandTaskHandlerDelegate)delegate
{
  return (PHAStorytellingOnDemandTaskHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_jobTimeHandler);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_progressCallChecker, 0);
  objc_storeStrong((id *)&self->_onDemandTaskProgressReporter, 0);
  objc_storeStrong((id *)&self->_operationsToRun, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
}

void __83__PHAStorytellingOnDemandTaskHandler_generateSuggestionsWithOptions_context_reply___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setSuggestionOptionsDictionary:", v3);
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 48), "setTaskName:", v5);

  v6 = a1[5];
  v7 = *(_QWORD *)(v6 + 8);
  v8 = *(_QWORD *)(v6 + 40);
  v11 = 0;
  objc_msgSend(v4, "generateSuggestionsWithGraphManager:progressReporter:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __80__PHAStorytellingOnDemandTaskHandler_generateMemoriesWithOptions_context_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__PHAStorytellingOnDemandTaskHandler_shutdown__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

}

void __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  qos_class_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nextOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = os_log_create("com.apple.photoanalysisd", "taskProgress");
    objc_msgSend(v2, "progressBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D761C8]), "initWithTaskName:loggingConnection:", CFSTR("OnDemandTask"), v3);
    v6 = objc_alloc(MEMORY[0x1E0D42A70]);
    v7 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_2;
    v24[3] = &unk_1E8520150;
    v8 = v4;
    v26 = v8;
    objc_copyWeak(&v27, &location);
    v9 = v5;
    v25 = v9;
    v10 = objc_msgSend(v6, "initWithProgressBlock:", v24);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v5);
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_3;
    v23[3] = &unk_1E8521740;
    v23[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "setCancellationBlock:", v23);
    v13 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "invocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = qos_class_self();
      PHADescriptionForQoS(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_DEFAULT, "Running task '%@' at QoS %@", buf, 0x16u);

    }
    objc_msgSend(v2, "runOperation");
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;

    v20 = objc_msgSend(*(id *)(a1 + 32), "hasRemainingOperations");
    v21 = *(void **)(a1 + 32);
    if (v20)
    {
      objc_msgSend(v21, "dequeueOperationsIfNeeded");
    }
    else
    {
      objc_msgSend(v21, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "onDemandTaskHandlerDidFinishOperation:", *(_QWORD *)(a1 + 32));

    }
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }

}

void __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  char v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v5 = 0;
    (*(void (**)(uint64_t, char *))(v2 + 16))(v2, &v5);
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "cancelCurrentOperation");

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "checkCallsWithProgress:stop:", 0);
  }
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v4, "forceCancellationIfShutdown");

}

uint64_t __63__PHAStorytellingOnDemandTaskHandler_dequeueOperationsIfNeeded__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancelOperation");
}

@end
