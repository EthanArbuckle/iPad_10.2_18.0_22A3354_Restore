@implementation TILanguageModelOfflineLearningAgent

- (TILanguageModelOfflineLearningAgent)init
{
  TILanguageModelOfflineLearningAgent *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TILanguageModelOfflineLearningAgent;
  v2 = -[TILanguageModelOfflineLearningAgent init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TextInput.language-model.offline-learning", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (BOOL)continueLearningTaskWithStrategy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0A2708]();
  -[TILanguageModelOfflineLearningAgent currentLearningTask](self, "currentLearningTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextOutgoingMessageBatch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = objc_msgSend(v8, "count");
        objc_msgSend(v6, "clientIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%s Retrieved %lu messages from %@ for %@"), "-[TILanguageModelOfflineLearningAgent continueLearningTaskWithStrategy:]", v26, v6, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(v4, "filterMessages:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "recipient");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "copy");

          if (objc_msgSend(v18, "length"))
            objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v14);
    }

    +[TILanguageModelOfflineLearningAgent contactRecordsForRecipients:](TILanguageModelOfflineLearningAgent, "contactRecordsForRecipients:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v4, "learnMessages:withRecipientRecords:", v12, v19);

  }
  else
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "clientIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringWithFormat:", CFSTR("%s Finished importing data for %@"), "-[TILanguageModelOfflineLearningAgent continueLearningTaskWithStrategy:]", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v31;
        _os_log_debug_impl(&dword_1DA6F2000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(v4, "didFinishLearning");
    -[TILanguageModelOfflineLearningAgent currentLearningTask](self, "currentLearningTask");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "didFinishLearning");

    v23 = (void *)objc_opt_class();
    -[TILanguageModelOfflineLearningAgent currentLearningTask](self, "currentLearningTask");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "didFinishLearningWithAgent:task:", self, v12);
    v20 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v20;
}

- (void)performLearningIfNecessaryWithStrategy:(id)a3 lastAdaptationTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 == 0.0)
  {
    objc_msgSend(v6, "learningTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "retainBackgroundActivityAssertion");

      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__20681;
      v20 = __Block_byref_object_dispose__20682;
      v21 = v7;
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)v17[5], "learningTask");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "clientIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%s Beginning offline learing task for client '%@'"), "-[TILanguageModelOfflineLearningAgent performLearningIfNecessaryWithStrategy:lastAdaptationTime:]", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      -[TILanguageModelOfflineLearningAgent dispatchQueue](self, "dispatchQueue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      TIDispatchAsync();

      _Block_object_dispose(&v16, 8);
    }
  }

}

- (void)performTaskInBackground:(id)a3
{
  TIDispatchAsync();
}

- (void)handleRemovalOfLearnedModels
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TILanguageModelOfflineLearningAgent currentLearningTask](self, "currentLearningTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Canceling learning due to a Reset Keyboard Dictionary event."), "-[TILanguageModelOfflineLearningAgent handleRemovalOfLearnedModels]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v8 = v6;
        _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TILanguageModelOfflineLearningAgent currentLearningTask](self, "currentLearningTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCancelled:", 1);

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (TILanguageModelOfflineLearningTask)currentLearningTask
{
  return self->_currentLearningTask;
}

- (void)setCurrentLearningTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentLearningTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLearningTask, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "learningTask");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  TIDispatchSync();
  objc_msgSend(v4, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    while ((objc_msgSend(*(id *)(a1 + 32), "continueLearningTaskWithStrategy:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) & 1) != 0);
  }
  v3 = (void *)MEMORY[0x1E0C80D38];
  TIDispatchSync();

}

uint64_t __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentLearningTask:", *(_QWORD *)(a1 + 40));
}

uint64_t __97__TILanguageModelOfflineLearningAgent_performLearningIfNecessaryWithStrategy_lastAdaptationTime___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  TIOSLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "learningTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%s Finished offline learing task for client '%@'"), "-[TILanguageModelOfflineLearningAgent performLearningIfNecessaryWithStrategy:lastAdaptationTime:]_block_invoke_3", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v10;
    _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseBackgroundActivityAssertion");

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentLearningTask:", 0);
}

+ (id)sharedLearningAgent
{
  if (+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::onceToken != -1)
    dispatch_once(&+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::onceToken, &__block_literal_global_20705);
  return (id)+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance;
}

+ (id)contactRecordsForRecipients:(id)a3
{
  return TIAddressBookFindRecordsMatchingRecipients(a3);
}

void __58__TILanguageModelOfflineLearningAgent_sharedLearningAgent__block_invoke()
{
  TILanguageModelOfflineLearningAgent *v0;
  void *v1;

  v0 = objc_alloc_init(TILanguageModelOfflineLearningAgent);
  v1 = (void *)+[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance;
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent]::__sharedInstance = (uint64_t)v0;

}

@end
