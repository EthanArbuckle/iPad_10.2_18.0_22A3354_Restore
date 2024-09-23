@implementation WBSParsecDSession

- (WBSParsecFeedbackDispatcher)feedbackDispatcher
{
  return (WBSParsecFeedbackDispatcher *)self->_feedbackDispatcher;
}

void __48__WBSParsecDSession__sharedSessionConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Safari/%s"), "8619.1.26.30.5");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D177E0]), "initWithId:userAgent:", CFSTR("Safari"), v5);
  v3 = (void *)+[WBSParsecDSession _sharedSessionConfiguration]::configuration;
  +[WBSParsecDSession _sharedSessionConfiguration]::configuration = v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__parsecEnabledDidChange_, *MEMORY[0x1E0D8A630], 0);

  objc_msgSend(*(id *)(a1 + 32), "_updateParsecAvailabilityInSessionConfiguration:", +[WBSParsecDSession _sharedSessionConfiguration]::configuration);
}

+ (void)_updateParsecAvailabilityInSessionConfiguration:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setParsecEnabled:", objc_msgSend(MEMORY[0x1E0D8A1D8], "areSiriSearchSuggestionsEnabled"));

}

- (WBSParsecDSession)initWithParsecdSession:(id)a3 skipAutoFillDataUpdates:(BOOL)a4
{
  id v7;
  WBSParsecDSession *v8;
  WBSParsecDSession *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *requestProcessingQueue;
  WBSParsecDFeedbackDispatcher *v13;
  WBSParsecDFeedbackDispatcher *feedbackDispatcher;
  WBSParsecDSession *v15;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSParsecDSession;
  v8 = -[WBSParsecDSession init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_skipAutoFillDataUpdates = a4;
    objc_storeStrong((id *)&v8->_parsecdSession, a3);
    -[PARSession setDelegate:](v9->_parsecdSession, "setDelegate:", v9);
    -[WBSParsecDSession _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:](v9, "_startUpdatingAutoFillDataInBackgroundIfPossibleForSession:", v9->_parsecdSession);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDSession.requestProcessingQueue", v10);
    requestProcessingQueue = v9->_requestProcessingQueue;
    v9->_requestProcessingQueue = (OS_dispatch_queue *)v11;

    v9->_geoUserSessionLock._os_unfair_lock_opaque = 0;
    v13 = -[WBSParsecDFeedbackDispatcher initWithSession:]([WBSParsecDFeedbackDispatcher alloc], "initWithSession:", v7);
    feedbackDispatcher = v9->_feedbackDispatcher;
    v9->_feedbackDispatcher = v13;

    v15 = v9;
  }

  return v9;
}

- (void)_startUpdatingAutoFillDataInBackgroundIfPossibleForSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (!self->_skipAutoFillDataUpdates)
  {
    v6 = v4;
    objc_msgSend(v4, "bag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v6;
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke;
      block[3] = &unk_1E54413C0;
      block[4] = self;
      v8 = v6;
      if (-[WBSParsecDSession _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:]::onceToken != -1)
        dispatch_once(&-[WBSParsecDSession _startUpdatingAutoFillDataInBackgroundIfPossibleForSession:]::onceToken, block);

      v4 = v6;
    }
  }

}

+ (id)sharedPARSession
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v6;

  objc_msgSend(a1, "_sharedSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D177D8], "sharedPARSessionWithConfiguration:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__WBSParsecDSession_sharedPARSession__block_invoke;
    block[3] = &unk_1E54425B0;
    v6 = v2;
    if (+[WBSParsecDSession sharedPARSession]::onceToken != -1)
      dispatch_once(&+[WBSParsecDSession sharedPARSession]::onceToken, block);
    v3 = (id)+[WBSParsecDSession sharedPARSession]::sharedSession;

  }
  return v3;
}

+ (id)_sharedSessionConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSParsecDSession__sharedSessionConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSParsecDSession _sharedSessionConfiguration]::onceToken != -1)
    dispatch_once(&+[WBSParsecDSession _sharedSessionConfiguration]::onceToken, block);
  return (id)+[WBSParsecDSession _sharedSessionConfiguration]::configuration;
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  dispatch_queue_t v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.SafariShared.WBSParsecDSession.initialAutofillDataUpdateQueue", v2);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2;
  block[3] = &unk_1E5441410;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v3;
  v5 = v3;
  dispatch_async(v5, block);

}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;
  _QWORD handler[4];
  id v5;
  id v6;
  uint64_t v7;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807F0]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80760], 0);
  v3 = objc_opt_class();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3;
  handler[3] = &unk_1E5445008;
  v7 = v3;
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  xpc_activity_register("com.apple.safarishared.WBSParsecDSession.autoFillDataUpdate", v2, handler);

}

void __37__WBSParsecDSession_sharedPARSession__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D177D8], "sessionWithConfiguration:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[WBSParsecDSession sharedPARSession]::sharedSession;
  +[WBSParsecDSession sharedPARSession]::sharedSession = v1;

}

+ (id)sharedDomainPolicyProvider
{
  if (+[WBSParsecDSession sharedDomainPolicyProvider]::onceToken != -1)
    dispatch_once(&+[WBSParsecDSession sharedDomainPolicyProvider]::onceToken, &__block_literal_global_29);
  return (id)+[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider;
}

void __47__WBSParsecDSession_sharedDomainPolicyProvider__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D8A138]);
  objc_msgSend(MEMORY[0x1E0D8A128], "standardStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithFeedbackAllowList:");
  v2 = (void *)+[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider;
  +[WBSParsecDSession sharedDomainPolicyProvider]::sharedDomainPolicyProvider = v1;

}

+ (id)sharedCorrectionsProcessor
{
  if (+[WBSParsecDSession sharedCorrectionsProcessor]::onceToken != -1)
    dispatch_once(&+[WBSParsecDSession sharedCorrectionsProcessor]::onceToken, &__block_literal_global_10);
  return (id)+[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor;
}

void __47__WBSParsecDSession_sharedCorrectionsProcessor__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x1E0D8A130]);
  objc_msgSend(MEMORY[0x1E0D8A128], "standardStore");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "initWithCorrectionsStore:");
  v2 = (void *)+[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor;
  +[WBSParsecDSession sharedCorrectionsProcessor]::sharedCorrectionsProcessor = v1;

}

+ (void)_parsecEnabledDidChange:(id)a3
{
  id v4;

  objc_msgSend(a1, "_sharedSessionConfiguration", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_updateParsecAvailabilityInSessionConfiguration:");

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *requestProcessingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__WBSParsecDSession_setDelegate___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(requestProcessingQueue, v7);

}

void __33__WBSParsecDSession_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

- (double)uiScale
{
  return self->_uiScale;
}

- (void)setUIScale:(double)a3
{
  self->_uiScale = a3;
}

- (void)setCurrentQuery:(id)a3
{
  id v4;
  NSObject *requestProcessingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__WBSParsecDSession_setCurrentQuery___block_invoke;
  v7[3] = &unk_1E54413C0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(requestProcessingQueue, v7);

}

void __37__WBSParsecDSession_setCurrentQuery___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__WBSParsecDSession_setCurrentQuery___block_invoke_2;
    v4[3] = &unk_1E5444F00;
    v4[4] = v3;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "currentKeyboardIdentifierWithLayoutsForSession:completionHandler:", v3, v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentQuery:withKeyboardInputType:", *(_QWORD *)(a1 + 40), 0);
  }

}

uint64_t __37__WBSParsecDSession_setCurrentQuery___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCurrentQuery:withKeyboardInputType:", *(_QWORD *)(a1 + 40), a2);
}

- (void)_setCurrentQuery:(id)a3 withKeyboardInputType:(id)a4
{
  id v6;
  id v7;
  NSObject *requestProcessingQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  requestProcessingQueue = self->_requestProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke;
  block[3] = &unk_1E5441410;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(requestProcessingQueue, block);

}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *, void *);
  void *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[8];
  uint64_t v33;
  id (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  _BYTE v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v3 != v2 && (objc_msgSend(v3, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "queryString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
    {
      v6 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A840B000, v6, OS_LOG_TYPE_INFO, "Initiating ParsecD query", buf, 2u);
      }
      v7 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "queryString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_cold_1(v8, (uint64_t)v37, v7);
      }

      v9 = (void *)MEMORY[0x1E0D177B0];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "queryString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "searchRequestWithString:triggerEvent:queryId:", v10, objc_msgSend(*(id *)(a1 + 40), "triggerEvent"), objc_msgSend(*(id *)(a1 + 40), "queryID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(*(id *)(a1 + 40), "queryItems");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count"))
          objc_msgSend(v11, "setQueryItems:", v12);
        objc_msgSend(MEMORY[0x1E0D8A210], "shared");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "experimentId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setExperimentId:", v15);

        objc_msgSend(v14, "namespaceName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setExperimentNamespaceId:", v16);

        objc_msgSend(v14, "treatmentId");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTreatmentId:", v17);

        objc_msgSend(v11, "setScale:", *(double *)(*(_QWORD *)(a1 + 32) + 72));
        objc_msgSend(v11, "setKeyboardInputMode:", *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "querySuggestions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "queryString");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v33 = 3221225472;
        v34 = ___ZL37searchSuggestionsFromQuerySuggestionsP7NSArrayIP18WBSQuerySuggestionEP8NSString_block_invoke;
        v35 = &unk_1E5445080;
        v36 = v19;
        objc_msgSend(v18, "safari_mapObjectsUsingBlock:", buf);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setLocalContextualSuggestions:", v21);
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(a1 + 40);
        v24 = *(void **)(v22 + 80);
        v26 = v20;
        v27 = 3221225472;
        v28 = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_30;
        v29 = &unk_1E5444F50;
        v30 = v22;
        v31 = v23;
        objc_msgSend(v24, "taskWithRequest:completion:", v11, &v26);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "resume", v26, v27, v28, v29, v30);
        objc_msgSend(*(id *)(a1 + 32), "setCurrentQueryID:", objc_msgSend(v25, "queryId"));

      }
    }
  }
}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v12 = *(NSObject **)(v10 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_2;
  block[3] = &unk_1E5444F28;
  block[4] = v10;
  v17 = v11;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v13 = v9;
  v14 = v7;
  v15 = v8;
  dispatch_async(v12, block);

}

uint64_t __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D8A2E8]))
  {
    v3 = objc_msgSend(MEMORY[0x1E0D8A120], "isInternalInstall");

    if (v3)
      return objc_msgSend(*(id *)(a1 + 32), "_simulatePARResponseFromJSON:response:task:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {

  }
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveResponse:error:forTask:query:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

- (void)_simulatePARResponseFromJSON:(id)a3 response:(id)a4 task:(id)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *requestProcessingQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  +[WBSPegasusResponseFuzzer sharedFuzzer](WBSPegasusResponseFuzzer, "sharedFuzzer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCompletionQuery queryString](self->_currentQuery, "queryString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "responseForQuery:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v14, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v18++), "setQueryId:", objc_msgSend(v9, "queryID"));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  requestProcessingQueue = self->_requestProcessingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSParsecDSession__simulatePARResponseFromJSON_response_task_error___block_invoke;
  block[3] = &unk_1E5444F28;
  block[4] = self;
  v25 = v14;
  v26 = v11;
  v27 = v10;
  v28 = v9;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v14;
  dispatch_async(requestProcessingQueue, block);

}

uint64_t __70__WBSParsecDSession__simulatePARResponseFromJSON_response_task_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveResponse:error:forTask:query:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_didReceiveResponse:(id)a3 error:(id)a4 forTask:(id)a5 query:(id)a6
{
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_unfair_lock_s *p_geoUserSessionLock;
  GEOUserSessionEntity **p_threadUnsafeGEOUserSessionEntity;
  GEOUserSessionEntity *threadUnsafeGEOUserSessionEntity;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  WBSParsecSearchSessionDelegate *v42;
  void *v43;
  void *v44;
  id v45;
  WBSParsecSearchSessionDelegate *v46;
  id v47;
  void *v48;
  void *v49;
  GEOUserSessionEntity *v50;
  id obj;
  WBSParsecDSession *v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD block[5];
  id v58;
  id v59;
  WBSParsecSearchSessionDelegate *v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v55 = a3;
  v53 = a4;
  v10 = a5;
  v56 = a6;
  v54 = v10;
  v11 = objc_msgSend(v10, "queryId");
  if (v11 == -[WBSParsecDSession currentQueryID](self, "currentQueryID"))
  {
    v52 = self;
    if (v53)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v53, "safari_privacyPreservingDescription");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v71 = v54;
        v72 = 2048;
        v73 = v55;
        v74 = 2114;
        v75 = v48;
        _os_log_error_impl(&dword_1A840B000, v12, OS_LOG_TYPE_ERROR, "Response to task %p was %p with error %{public}@", buf, 0x20u);

      }
    }
    else
    {
      v14 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v71 = v54;
        v72 = 2048;
        v73 = v55;
        _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_INFO, "Response to task %p was %p", buf, 0x16u);
      }
    }
    v15 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[WBSParsecDSession _didReceiveResponse:error:forTask:query:].cold.2();
    p_geoUserSessionLock = &self->_geoUserSessionLock;
    os_unfair_lock_lock(&self->_geoUserSessionLock);
    threadUnsafeGEOUserSessionEntity = self->_threadUnsafeGEOUserSessionEntity;
    p_threadUnsafeGEOUserSessionEntity = &self->_threadUnsafeGEOUserSessionEntity;
    v50 = threadUnsafeGEOUserSessionEntity;
    objc_msgSend(v55, "geoUserSessionEntity");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if ((-[GEOUserSessionEntity isEqual:](v50, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)p_threadUnsafeGEOUserSessionEntity, obj);
      objc_msgSend(MEMORY[0x1E0D27690], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSharedMapsUserSessionEntity:shareSessionIDWithMaps:", *p_threadUnsafeGEOUserSessionEntity, 1);

    }
    os_unfair_lock_unlock(p_geoUserSessionLock);
    objc_msgSend(v55, "results");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D8A120], "isSearchEvaluationLoggingEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v66 = 0u;
      v65 = 0u;
      v49 = v20;
      v22 = v20;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v66 != v24)
              objc_enumerationMutation(v22);
            v26 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(v26, "uuidString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "url");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "absoluteString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "safari_urlHashesOfComponents");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "appendFormat:", CFSTR(" %@ <%@>,"), v27, v30);

          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
        }
        while (v23);
      }

      v31 = WBS_LOG_CHANNEL_PREFIXParsec();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[WBSParsecDSession _didReceiveResponse:error:forTask:query:].cold.1();

      v20 = v49;
    }
    objc_msgSend(v55, "corrections");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "suggestion");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v20;
    objc_msgSend(v56, "setRewrittenQueryStringFromParsec:", v34);

    objc_msgSend(v55, "suggestions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "safari_setByApplyingBlock:", &__block_literal_global_40_0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "querySuggestions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x1E0C809B0];
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_2;
    v63[3] = &unk_1E5444FB8;
    v40 = v37;
    v64 = v40;
    objc_msgSend(v38, "safari_filterObjectsUsingBlock:", v63);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setQuerySuggestions:", v41);

    v42 = v52->_delegate;
    objc_msgSend(v56, "rewrittenQueryStringFromParsec");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "copy");

    block[0] = v39;
    block[1] = 3221225472;
    block[2] = __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_3;
    block[3] = &unk_1E5444FE0;
    block[4] = v52;
    v58 = v44;
    v59 = v54;
    v60 = v42;
    v61 = v35;
    v62 = v56;
    v45 = v35;
    v46 = v42;
    v47 = v44;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v71 = v54;
      _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, "Ignoring response to stale task %p", buf, 0xCu);
    }
  }

}

id __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "suggestion");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

uint64_t __61__WBSParsecDSession__didReceiveResponse_error_forTask_query___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentQueryID");
  result = objc_msgSend(*(id *)(a1 + 48), "queryId");
  if (v2 == result)
    return objc_msgSend(*(id *)(a1 + 56), "session:didReceiveResults:forQuery:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return result;
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  dispatch_time_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  _QWORD block[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t *v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (xpc_activity_set_state((xpc_activity_t)v3, 4))
    {
      v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A840B000, v4, OS_LOG_TYPE_DEFAULT, "Beginning remote data update", buf, 2u);
      }
      v5 = dispatch_group_create();
      dispatch_group_enter(v5);
      v6 = (void *)a1[6];
      v7 = a1[4];
      v8 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_44;
      v33[3] = &unk_1E54425B0;
      v9 = v5;
      v34 = v9;
      objc_msgSend(v6, "_updateAutoFillTLDsIfNeededForSession:completionHandler:", v7, v33);
      dispatch_group_enter(v9);
      v10 = (void *)a1[6];
      v11 = a1[4];
      v31[0] = v8;
      v31[1] = 3221225472;
      v31[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_45;
      v31[3] = &unk_1E54425B0;
      v12 = v9;
      v32 = v12;
      objc_msgSend(v10, "_updateAutoFillCorrectionSetsIfNeededForSession:completionHandler:", v11, v31);
      *(_QWORD *)buf = 0;
      v28 = buf;
      v29 = 0x2020000000;
      v30 = 0;
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_46;
      v24[3] = &unk_1E5441398;
      v26 = buf;
      v25 = v3;
      v13 = (void *)MEMORY[0x1A85D45E4](v24);
      v14 = a1[5];
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_47;
      block[3] = &unk_1E5442848;
      v15 = v13;
      v23 = v15;
      dispatch_group_notify(v12, v14, block);
      v16 = dispatch_time(0, 1800000000000);
      v17 = a1[5];
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2_48;
      v20[3] = &unk_1E5442848;
      v21 = v15;
      v18 = v15;
      dispatch_after(v16, v17, v20);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3_cold_1();
    }
  }

}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_44(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Completed update of domain list", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_45(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A840B000, v2, OS_LOG_TYPE_DEFAULT, "Completed update of correction sets", v3, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_46(uint64_t a1)
{
  NSObject *v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
    {
      v2 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
        __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_46_cold_1();
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_47(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_2_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_updateAutoFillTLDsIfNeededForSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "sharedDomainPolicyProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke;
  v12[3] = &unk_1E5445058;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v8;
  v15 = v10;
  v11 = v8;
  objc_msgSend(v11, "getLastPolicyRetrievalURLStringWithResultHandler:", v12);

}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "bag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawBag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("autofill_tld_whitelist_url"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
  {
LABEL_6:
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
  if (!v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_cold_1();
    goto LABEL_6;
  }
  v7 = a1[4];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51;
  v9[3] = &unk_1E5445030;
  v12 = a1[6];
  v10 = a1[5];
  v11 = v6;
  objc_msgSend(v7, "fileHandleAndAttributesForResource:completion:", CFSTR("autofill_tld_whitelist_url"), v9);

LABEL_7:
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void (**v11)(void);
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v11 = (void (**)(void))MEMORY[0x1A85D45E4](*(_QWORD *)(a1 + 48));
  if (v7)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51_cold_2(v9, (uint64_t)v12, v8);
    }
  }
  else
  {
    objc_msgSend(v6, "readDataToEndOfFile");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setPoliciesWithJSONData:retrievalURLString:", v8, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v10 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51_cold_1();
    }
  }

  SafariShared::ScopeExitHandler::~ScopeExitHandler(&v11);
}

+ (void)_updateAutoFillCorrectionSetsIfNeededForSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[WBSParsecDSession _updateAutoFillCorrectionSetsIfNeededForSession:completionHandler:].cold.1();
  objc_msgSend(a1, "sharedCorrectionsProcessor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke;
  v13[3] = &unk_1E5445058;
  v10 = v6;
  v14 = v10;
  v11 = v7;
  v15 = v9;
  v16 = v11;
  v12 = v9;
  objc_msgSend(v12, "getLastCorrectionsRetrievalURLStringWithResultHandler:", v13);

}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_3();
  objc_msgSend(a1[4], "bag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("autofill_corrections_url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isEqualToString:", v7))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_1();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_2();
    v10 = a1[4];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53;
    v11[3] = &unk_1E5445030;
    v14 = a1[6];
    v12 = a1[5];
    v13 = v7;
    objc_msgSend(v10, "fileHandleAndAttributesForResource:completion:", CFSTR("autofill_corrections_url"), v11);

  }
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void (**v13)(void);
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  v13 = (void (**)(void))MEMORY[0x1A85D45E4](*(_QWORD *)(a1 + 48));
  if (v7)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_3(v9, (uint64_t)v14, v8);
    }

  }
  else if ((unint64_t)objc_msgSend(v6, "seekToEndOfFile") < 0x1E8481)
  {
    objc_msgSend(v6, "seekToFileOffset:", 0);
    objc_msgSend(v6, "readDataToEndOfFile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCorrectionsWithJSONData:retrievalURLString:", v11, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_2();
    }

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCrowdsourcedAutoFill();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_1();
  }
  SafariShared::ScopeExitHandler::~ScopeExitHandler(&v13);

}

- (NSString)rewrittenQueryStringFromParsec
{
  return self->_rewrittenQueryStringFromParsec;
}

- (BOOL)skipAutoFillDataUpdates
{
  return self->_skipAutoFillDataUpdates;
}

- (PARSession)parsecdSession
{
  return self->_parsecdSession;
}

- (unint64_t)currentQueryID
{
  return self->_currentQueryID;
}

- (void)setCurrentQueryID:(unint64_t)a3
{
  self->_currentQueryID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecdSession, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_rewrittenQueryStringFromParsec, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_threadUnsafeGEOUserSessionEntity, 0);
  objc_storeStrong((id *)&self->_feedbackDispatcher, 0);
  objc_storeStrong((id *)&self->_requestProcessingQueue, 0);
}

void __60__WBSParsecDSession__setCurrentQuery_withKeyboardInputType___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, a3, (uint64_t)a3, "Initiating ParsecD query: %{private}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_0();
}

- (void)_didReceiveResponse:error:forTask:query:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, v0, v1, "Parsec Results: [%{public}@]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_didReceiveResponse:error:forTask:query:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = 2113;
  v4 = v0;
  _os_log_debug_impl(&dword_1A840B000, v1, OS_LOG_TYPE_DEBUG, "Response to task %{private}@ was %{private}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Unable to transition update activity to state Continue; bailing",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __80__WBSParsecDSession__startUpdatingAutoFillDataInBackgroundIfPossibleForSession___block_invoke_46_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Unable to transition update activity to state Done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "No new domain policy URL supplied; bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "No domain policy data retrieved; bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __77__WBSParsecDSession__updateAutoFillTLDsIfNeededForSession_completionHandler___block_invoke_51_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Unable to read TLD whitelist: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_0();
}

+ (void)_updateAutoFillCorrectionSetsIfNeededForSession:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1A840B000, v0, v1, "Attempting to update cloud AutoFill corrections", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1A840B000, v0, v1, "Not updating cloud AutoFill corrections since no update is needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1A840B000, v0, v1, "Fetching cloud AutoFill corrections resource", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_4_5(&dword_1A840B000, v0, v1, "Last AutoFill corrections URL: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_1()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v2 = 2048;
  v3 = 2000000;
  _os_log_error_impl(&dword_1A840B000, v0, OS_LOG_TYPE_ERROR, "Cloud AutoFill correction sets exceeded maximum length (%llu > %llu)", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "No correction data retrieved; bailing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__WBSParsecDSession__updateAutoFillCorrectionSetsIfNeededForSession_completionHandler___block_invoke_53_cold_3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Unable to read cloud AutoFill correction sets, error: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1_0();
}

@end
