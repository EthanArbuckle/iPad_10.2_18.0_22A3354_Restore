@implementation _PSFTZKWOrchestrator

- (void)_createStructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4
{
  id v6;
  id v7;
  _PSCalendarEventPredictor *v8;
  _PSCalendarEventPredictorDelegateWrapper *v9;
  void *v10;
  _PSCalendarEventPredictorDelegateWrapper *v11;
  _PSCalendarEventPredictorDelegateWrapper *calendarDelegateWrapper;
  id v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = -[_PSCalendarEventPredictor initWithEventStore:contactStore:]([_PSCalendarEventPredictor alloc], "initWithEventStore:contactStore:", v7, v6);

  v9 = [_PSCalendarEventPredictorDelegateWrapper alloc];
  -[_PSFTZKWConfig calendarEventConfig](self->_config, "calendarEventConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_PSCalendarEventPredictorDelegateWrapper initWithCalendarEventPredictor:config:](v9, "initWithCalendarEventPredictor:config:", v8, v10);
  calendarDelegateWrapper = self->_calendarDelegateWrapper;
  self->_calendarDelegateWrapper = v11;

  if (-[_PSFTZKWConfig useBlendingLayer](self->_config, "useBlendingLayer"))
  {
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
    {
      v13 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
      objc_msgSend(getATXProactiveSuggestionClientModelClass_0(), "clientModelIdFromClientModelType:", 29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithClientModelId:requestDelegate:", v14, self->_calendarDelegateWrapper);

      if (v15)
        -[NSMutableArray addObject:](self->_clientModels, "addObject:", v15);

    }
  }

}

- (void)_createUnstructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5
{
  id v7;
  id v8;
  _PSSuggestionFromTextPredictor *v9;
  _PSSuggestionFromTextPredictorDelegateWrapper *v10;
  void *v11;
  _PSSuggestionFromTextPredictorDelegateWrapper *v12;
  _PSSuggestionFromTextPredictorDelegateWrapper *unstructuredCalendarDelegateWrapper;
  id v14;
  void *v15;
  void *v16;

  v7 = a5;
  v8 = a3;
  v9 = -[_PSSuggestionFromTextPredictor initWithEventStore:interactionStore:]([_PSSuggestionFromTextPredictor alloc], "initWithEventStore:interactionStore:", v8, v7);

  v10 = [_PSSuggestionFromTextPredictorDelegateWrapper alloc];
  -[_PSFTZKWConfig unstructuredCalendarConfig](self->_config, "unstructuredCalendarConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_PSSuggestionFromTextPredictorDelegateWrapper initWithTextPredictor:calendarConfig:](v10, "initWithTextPredictor:calendarConfig:", v9, v11);
  unstructuredCalendarDelegateWrapper = self->_unstructuredCalendarDelegateWrapper;
  self->_unstructuredCalendarDelegateWrapper = v12;

  if (-[_PSFTZKWConfig useBlendingLayer](self->_config, "useBlendingLayer"))
  {
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
    {
      v14 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
      objc_msgSend(getATXProactiveSuggestionClientModelClass_0(), "clientModelIdFromClientModelType:", 30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithClientModelId:requestDelegate:", v15, self->_unstructuredCalendarDelegateWrapper);

      -[NSMutableArray addObject:](self->_clientModels, "addObject:", v16);
    }
  }

}

- (void)_createUnstructuredReminderModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5
{
  id v7;
  id v8;
  _PSSuggestionFromTextPredictor *v9;
  _PSSuggestionFromTextPredictorDelegateWrapper *v10;
  void *v11;
  _PSSuggestionFromTextPredictorDelegateWrapper *v12;
  _PSSuggestionFromTextPredictorDelegateWrapper *unstructuredRemindersDelegateWrapper;
  id v14;
  void *v15;
  void *v16;

  v7 = a5;
  v8 = a3;
  v9 = -[_PSSuggestionFromTextPredictor initWithEventStore:interactionStore:]([_PSSuggestionFromTextPredictor alloc], "initWithEventStore:interactionStore:", v8, v7);

  v10 = [_PSSuggestionFromTextPredictorDelegateWrapper alloc];
  -[_PSFTZKWConfig unstructuredRemindersConfig](self->_config, "unstructuredRemindersConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_PSSuggestionFromTextPredictorDelegateWrapper initWithTextPredictor:remindersConfig:](v10, "initWithTextPredictor:remindersConfig:", v9, v11);
  unstructuredRemindersDelegateWrapper = self->_unstructuredRemindersDelegateWrapper;
  self->_unstructuredRemindersDelegateWrapper = v12;

  if (-[_PSFTZKWConfig useBlendingLayer](self->_config, "useBlendingLayer"))
  {
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
    {
      v14 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
      objc_msgSend(getATXProactiveSuggestionClientModelClass_0(), "clientModelIdFromClientModelType:", 31);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithClientModelId:requestDelegate:", v15, self->_unstructuredRemindersDelegateWrapper);

      -[NSMutableArray addObject:](self->_clientModels, "addObject:", v16);
    }
  }

}

- (void)_createFaceTimeInteractionModelWithKNNModel:(id)a3
{
  id v4;
  _PSKNNZKWATXDelegateWrapper *v5;
  void *v6;
  _PSKNNZKWATXDelegateWrapper *v7;
  _PSKNNZKWATXDelegateWrapper *faceTimeInteractionModelDelegateWrapper;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = [_PSKNNZKWATXDelegateWrapper alloc];
  -[_PSFTZKWConfig faceTimeInteractionsConfig](self->_config, "faceTimeInteractionsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PSKNNZKWATXDelegateWrapper initWithKNNModel:primaryInteractionsConfig:](v5, "initWithKNNModel:primaryInteractionsConfig:", v4, v6);

  faceTimeInteractionModelDelegateWrapper = self->_faceTimeInteractionModelDelegateWrapper;
  self->_faceTimeInteractionModelDelegateWrapper = v7;

  if (-[_PSFTZKWConfig useBlendingLayer](self->_config, "useBlendingLayer"))
  {
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
    {
      v9 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
      objc_msgSend(getATXProactiveSuggestionClientModelClass_0(), "clientModelIdFromClientModelType:", 32);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithClientModelId:requestDelegate:", v10, self->_faceTimeInteractionModelDelegateWrapper);

      -[NSMutableArray addObject:](self->_clientModels, "addObject:", v11);
    }
  }
}

- (void)_createFallbackInteractionModelWithKNNModel:(id)a3
{
  id v4;
  _PSKNNZKWATXDelegateWrapper *v5;
  void *v6;
  _PSKNNZKWATXDelegateWrapper *v7;
  _PSKNNZKWATXDelegateWrapper *fallbackInteractionModelDelegateWrapper;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = [_PSKNNZKWATXDelegateWrapper alloc];
  -[_PSFTZKWConfig fallbackInteractionsConfig](self->_config, "fallbackInteractionsConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PSKNNZKWATXDelegateWrapper initWithKNNModel:fallbackInteractionConfig:](v5, "initWithKNNModel:fallbackInteractionConfig:", v4, v6);

  fallbackInteractionModelDelegateWrapper = self->_fallbackInteractionModelDelegateWrapper;
  self->_fallbackInteractionModelDelegateWrapper = v7;

  if (-[_PSFTZKWConfig useBlendingLayer](self->_config, "useBlendingLayer"))
  {
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary_2)
    {
      v9 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
      objc_msgSend(getATXProactiveSuggestionClientModelClass_0(), "clientModelIdFromClientModelType:", 33);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithClientModelId:requestDelegate:", v10, self->_fallbackInteractionModelDelegateWrapper);

      -[NSMutableArray addObject:](self->_clientModels, "addObject:", v11);
    }
  }
}

- (_PSFTZKWOrchestrator)initWithKNNModel:(id)a3 interactionStore:(id)a4
{
  id v6;
  id v7;
  _PSFTZKWOrchestrator *v8;
  uint64_t v9;
  NSMutableArray *clientModels;
  uint64_t v11;
  _PSFTZKWConfig *config;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  OS_dispatch_queue *queue;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_PSFTZKWOrchestrator;
  v8 = -[_PSFTZKWOrchestrator init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    clientModels = v8->_clientModels;
    v8->_clientModels = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    config = v8->_config;
    v8->_config = (_PSFTZKWConfig *)v11;

    objc_storeStrong((id *)&v8->_interactionStore, a4);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v13 = (void *)getEKEventStoreClass_softClass;
    v31 = getEKEventStoreClass_softClass;
    if (!getEKEventStoreClass_softClass)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __getEKEventStoreClass_block_invoke;
      v26 = &unk_1E43FEA00;
      v27 = &v28;
      __getEKEventStoreClass_block_invoke((uint64_t)&v23);
      v13 = (void *)v29[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v28, 8);
    v15 = (void *)objc_msgSend([v14 alloc], "initWithEKOptions:", 128);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v16 = (void *)getCNContactStoreClass_softClass_8;
    v31 = getCNContactStoreClass_softClass_8;
    if (!getCNContactStoreClass_softClass_8)
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __getCNContactStoreClass_block_invoke_8;
      v26 = &unk_1E43FEA00;
      v27 = &v28;
      __getCNContactStoreClass_block_invoke_8((uint64_t)&v23);
      v16 = (void *)v29[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v28, 8);
    v18 = (void *)objc_opt_new();
    -[_PSFTZKWOrchestrator _createStructuredCalendarModelWithEventStore:contactStore:](v8, "_createStructuredCalendarModelWithEventStore:contactStore:", v15, v18);
    -[_PSFTZKWOrchestrator _createUnstructuredCalendarModelWithEventStore:contactStore:interactionStore:](v8, "_createUnstructuredCalendarModelWithEventStore:contactStore:interactionStore:", v15, v18, v7);
    -[_PSFTZKWOrchestrator _createUnstructuredReminderModelWithEventStore:contactStore:interactionStore:](v8, "_createUnstructuredReminderModelWithEventStore:contactStore:interactionStore:", v15, v18, v7);
    -[_PSFTZKWOrchestrator _createFaceTimeInteractionModelWithKNNModel:](v8, "_createFaceTimeInteractionModelWithKNNModel:", v6);
    -[_PSFTZKWOrchestrator _createFallbackInteractionModelWithKNNModel:](v8, "_createFallbackInteractionModelWithKNNModel:", v6);
    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "ps_ft_zkw_orchestrator");
    v19 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v19;

  }
  return v8;
}

- (void)updateConfigWithTrialData:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___PSFTZKWOrchestrator_updateConfigWithTrialData___block_invoke;
  block[3] = &unk_1E43FEB68;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_getBlendingLayerSuggestionsWithContext:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v4 = (void *)getATXInteractionSuggestionRequestClass_softClass;
  v26 = getATXInteractionSuggestionRequestClass_softClass;
  if (!getATXInteractionSuggestionRequestClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getATXInteractionSuggestionRequestClass_block_invoke;
    v21 = &unk_1E43FEA00;
    v22 = &v23;
    __getATXInteractionSuggestionRequestClass_block_invoke((uint64_t)&v18);
    v4 = (void *)v24[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v23, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithOriginatorId:consumerSubType:psPredictionContext:timeout:", CFSTR("PeopleSuggester"), 42, v3, 5.0);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v7 = (void *)getATXProactiveSuggestionConsumerClass_softClass;
  v26 = getATXProactiveSuggestionConsumerClass_softClass;
  if (!getATXProactiveSuggestionConsumerClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getATXProactiveSuggestionConsumerClass_block_invoke;
    v21 = &unk_1E43FEA00;
    v22 = &v23;
    __getATXProactiveSuggestionConsumerClass_block_invoke((uint64_t)&v18);
    v7 = (void *)v24[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v23, 8);
  v9 = (void *)objc_msgSend([v8 alloc], "initWithConsumerSubType:", 42);
  objc_msgSend(v9, "layoutForRequest:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEFAULT, "nil value returned from blending layer, either models timed out or there was no suggestions given", (uint8_t *)&v18, 2u);
    }
    goto LABEL_16;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v11 = (void *)getATXSuggestionLayoutClass_softClass;
  v26 = getATXSuggestionLayoutClass_softClass;
  if (!getATXSuggestionLayoutClass_softClass)
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __getATXSuggestionLayoutClass_block_invoke;
    v21 = &unk_1E43FEA00;
    v22 = &v23;
    __getATXSuggestionLayoutClass_block_invoke((uint64_t)&v18);
    v11 = (void *)v24[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWOrchestrator _getBlendingLayerSuggestionsWithContext:].cold.1((uint64_t)v10, v14);
LABEL_16:
    v16 = MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  objc_msgSend(v10, "oneByOneSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C9AA60];
  if (v14)
    v15 = v14;
  v16 = v15;
LABEL_17:

  return v16;
}

- (id)_getDirectSuggestionsWithContext:(id)a3
{
  return -[_PSFTZKWOrchestrator _getDirectSuggestionsWithContext:withTimeout:](self, "_getDirectSuggestionsWithContext:withTimeout:", a3, 5.0);
}

- (id)_getDirectSuggestionsWithContext:(id)a3 withTimeout:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  dispatch_block_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  void *v17;
  unint64_t i;
  void *v19;
  void *v20;
  id v22;
  uint64_t block;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  double v32;
  uint64_t v33;
  os_unfair_lock_s *v34;
  uint64_t v35;
  void *v36;
  int v37;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_calendarDelegateWrapper, &unk_1E442B438);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_unstructuredCalendarDelegateWrapper, &unk_1E442B450);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_unstructuredRemindersDelegateWrapper, &unk_1E442B468);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_faceTimeInteractionModelDelegateWrapper, &unk_1E442B480);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", self->_fallbackInteractionModelDelegateWrapper, &unk_1E442B498);
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(&unk_1E442CD60, "count"))
  {
    v9 = 0;
    v10 = MEMORY[0x1E0C9AA60];
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v11);

      ++v9;
    }
    while (v9 < objc_msgSend(&unk_1E442CD60, "count"));
  }
  v33 = 0;
  v34 = (os_unfair_lock_s *)&v33;
  v35 = 0x2810000000;
  v36 = &unk_1A09197BE;
  v37 = 0;
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke;
  v26 = &unk_1E4401810;
  v27 = &unk_1E442CD60;
  v22 = v7;
  v28 = v22;
  v12 = v6;
  v29 = v12;
  v31 = &v33;
  v13 = v8;
  v30 = v13;
  v32 = a4;
  v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  if (_getDirectSuggestionsWithContext_withTimeout___pasOnceToken9 != -1)
    dispatch_once(&_getDirectSuggestionsWithContext_withTimeout___pasOnceToken9, &__block_literal_global_37);
  v15 = (id)_getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult;
  dispatch_async(v15, v14);
  if (a4 <= 0.0)
  {
    v16 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    v16 = -1;
  }
  dispatch_block_wait(v14, v16);
  v17 = (void *)objc_opt_new();
  os_unfair_lock_lock(v34 + 8);
  for (i = 0; i < objc_msgSend(&unk_1E442CD60, "count", v22, block, v24, v25, v26); ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObjectsFromArray:", v20);

  }
  os_unfair_lock_unlock(v34 + 8);

  _Block_object_dispose(&v33, 8);
  return v17;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__17;
  v16 = __Block_byref_object_dispose__17;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___PSFTZKWOrchestrator_getSuggestionsWithPredictionContext___block_invoke;
  block[3] = &unk_1E43FF020;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)populateCaches
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  dispatch_block_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuggestionDate:", v4);

  +[_PSConstants facetimeBundleId](_PSConstants, "facetimeBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleID:", v5);

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___PSFTZKWOrchestrator_populateCaches__block_invoke;
  block[3] = &unk_1E4401838;
  objc_copyWeak(&v10, &location);
  v9 = v3;
  v6 = v3;
  v7 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (_PSFTZKWConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientModels, 0);
  objc_storeStrong((id *)&self->_fallbackInteractionModelDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_faceTimeInteractionModelDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_unstructuredRemindersDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_unstructuredCalendarDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_calendarDelegateWrapper, 0);
}

- (void)_getBlendingLayerSuggestionsWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Encountered layout of unknown class: %@", (uint8_t *)&v5, 0xCu);

}

@end
