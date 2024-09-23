@implementation TIAnalyticsService

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6
{
  uint64_t v6;

  LOBYTE(v6) = a6;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, a4, 0, 0, a5, v6, 0);
}

- (void)_dispatchEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5 values:(id)a6 inputMode:(id)a7 testingParameters:(id)a8 allowSparsePayload:(BOOL)a9 withCompletionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OS_dispatch_queue *queue;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;

  v34 = a3;
  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = (void *)objc_msgSend(a4, "copy");
  v22 = (void *)objc_msgSend(v20, "copy");

  v23 = (void *)objc_msgSend(v19, "copy");
  v24 = (void *)objc_msgSend(v18, "copy");

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v17, 1);
  queue = self->_queue;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke;
  v35[3] = &unk_1E243A690;
  v35[4] = self;
  v36 = v21;
  v37 = v24;
  v38 = v22;
  v43 = a9;
  v39 = v23;
  v40 = v25;
  v41 = v34;
  v42 = v16;
  v27 = v16;
  v28 = v34;
  v29 = v25;
  v30 = v23;
  v31 = v22;
  v32 = v24;
  v33 = v21;
  TIDispatchAsync(queue, v35);

}

- (void)_registerEventSpec:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *queue;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__TIAnalyticsService__registerEventSpec_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E243A628;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  TIDispatchAsync(queue, v11);

}

- (void)registerEventSpec:(id)a3
{
  -[TIAnalyticsService _registerEventSpec:withCompletionHandler:](self, "_registerEventSpec:withCompletionHandler:", a3, 0);
}

+ (id)sharedInstance
{
  void *v2;

  v2 = (void *)__mockInstance;
  if (!__mockInstance)
  {
    if (sharedInstance_onceToken_212 != -1)
      dispatch_once(&sharedInstance_onceToken_212, &__block_literal_global_213);
    v2 = (void *)sharedInstance_instance_211;
  }
  return v2;
}

void __36__TIAnalyticsService_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_211;
  sharedInstance_instance_211 = v0;

}

- (TIAnalyticsService)init
{
  void *v3;
  TIAnalyticsService *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[TIAnalyticsService initWithProvider:](self, "initWithProvider:", v3);

  return v4;
}

- (TIAnalyticsService)initWithProvider:(id)a3
{
  id v5;
  TIAnalyticsService *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableDictionary *eventSpecs;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIAnalyticsService;
  v6 = -[TIAnalyticsService init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.keyboard.analytics.inputModeParserQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_provider, a3);
    v10 = objc_opt_new();
    eventSpecs = v6->_eventSpecs;
    v6->_eventSpecs = (NSMutableDictionary *)v10;

  }
  return v6;
}

- (BOOL)registerEventSpec:(id)a3 error:(id *)a4
{
  -[TIAnalyticsService _registerEventSpec:withCompletionHandler:](self, "_registerEventSpec:withCompletionHandler:", a3, 0);
  return 1;
}

- (void)dispatchEventWithName:(id)a3
{
  uint64_t v3;

  LOBYTE(v3) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, 0, 0, v3, 0);
}

- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, a4, 0, v4, 0);
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, 0, 0, v4, 0);
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, a5, 0, v5, 0);
}

- (void)dispatchEventWithName:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, 0, 0, v4, a4);
}

- (void)dispatchEventWithName:(id)a3 inputMode:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, a4, 0, v5, a5);
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, 0, 0, v5, a5);
}

- (void)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 withCompletionHandler:(id)a6
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, a5, 0, v6, a6);
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 withCompletionHandler:(id)a7
{
  uint64_t v7;

  LOBYTE(v7) = a6;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, a4, 0, 0, a5, v7, a7);
}

- (BOOL)dispatchEventWithName:(id)a3 error:(id *)a4
{
  uint64_t v5;

  LOBYTE(v5) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, 0, 0, v5, 0);
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 inputMode:(id)a4 error:(id *)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, 0, a4, 0, v6, 0);
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 error:(id *)a5
{
  uint64_t v6;

  LOBYTE(v6) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, 0, 0, v6, 0);
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 values:(id)a4 inputMode:(id)a5 error:(id *)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, 0, a4, a5, 0, v7, 0);
  return 1;
}

- (BOOL)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6 error:(id *)a7
{
  uint64_t v8;

  LOBYTE(v8) = a6;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.keyboard"), a3, a4, 0, 0, a5, v8, 0);
  return 1;
}

- (void)dispatchEventToInputAnalyticsDomainWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 allowSparsePayload:(BOOL)a6
{
  uint64_t v6;

  LOBYTE(v6) = a6;
  -[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:](self, "_dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:", CFSTR("com.apple.inputAnalytics"), a3, a4, 0, 0, a5, v6, 0);
}

- (void)addSettings:(id)a3 toPayload:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v8;
    objc_msgSend(v8, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
            -[TIAnalyticsService appendToErrors:code:message:](self, "appendToErrors:code:message:", v10, 3, CFSTR("The event payload already includes the '%@' key."), v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    v8 = v18;
    objc_msgSend(v9, "addEntriesFromDictionary:", v18);
  }

}

- (id)settingsFromInputMode:(id)a3 eventSpec:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  TIAnalyticsService *v13;
  id v14;
  uint64_t v15;

  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(a4, "isInputModeRequired"))
  {
    if (!v8 || !objc_msgSend(v8, "length"))
      goto LABEL_10;
    v12 = CFSTR("The input mode is not required and should not be provided.");
    v13 = self;
    v14 = v9;
    v15 = 5;
LABEL_9:
    -[TIAnalyticsService appendToErrors:code:message:](v13, "appendToErrors:code:message:", v14, v15, v12);
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  if (!v8 || !objc_msgSend(v8, "length"))
  {
    v12 = CFSTR("The input mode is required.");
    v13 = self;
    v14 = v9;
    v15 = 4;
    goto LABEL_9;
  }
  +[TIInputModeParser sharedInstance](TIInputModeParser, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parseInputMode:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v11;
}

- (id)settingsFromPayload:(id)a3 andValues:(id)a4 eventSpec:(id)a5 allowSparsePayload:(BOOL)a6 errors:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  TIAnalyticsService *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  id v45;
  id v46;
  id v47;
  void *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = v13;
  if (v10 && v11)
  {
    v15 = CFSTR("Either the 'payload' or the 'values' argument must be nil.");
    v16 = self;
    v17 = v14;
    v18 = 6;
LABEL_11:
    -[TIAnalyticsService appendToErrors:code:message:](v16, "appendToErrors:code:message:", v17, v18, v15);
    v24 = 0;
    goto LABEL_37;
  }
  if (!v11)
  {
    if (!v10)
    {
      v49 = v13;
      v46 = 0;
      v47 = 0;
      v25 = objc_opt_new();
      goto LABEL_13;
    }
LABEL_9:
    v49 = v14;
    v46 = v11;
    v47 = v10;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v24 = (id)v25;
    goto LABEL_14;
  }
  v19 = objc_msgSend(v11, "count");
  objc_msgSend(v12, "fieldSpecs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v19 != v21)
  {
    v15 = CFSTR("The value count must match the field count.");
    v16 = self;
    v17 = v14;
    v18 = 7;
    goto LABEL_11;
  }
  if (v10)
    goto LABEL_9;
  v49 = v14;
  v47 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fieldSpecs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __88__TIAnalyticsService_settingsFromPayload_andValues_eventSpec_allowSparsePayload_errors___block_invoke;
  v60[3] = &unk_1E243A6B8;
  v24 = v22;
  v61 = v24;
  v46 = v11;
  v62 = v11;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v60);

LABEL_14:
  v26 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v45 = v12;
  objc_msgSend(v12, "fieldSpecs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v28)
    goto LABEL_27;
  v29 = v28;
  v30 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v29; ++i)
    {
      if (*(_QWORD *)v57 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_msgSend(v32, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKey:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v55 = 0;
        v35 = objc_msgSend(v32, "validate:error:", v34, &v55);
        v36 = v55;
        if ((v35 & 1) == 0)
          objc_msgSend(v49, "addObject:", v36);
      }
      else
      {
        if (a6)
          goto LABEL_25;
        objc_msgSend(v32, "name");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        -[TIAnalyticsService appendToErrors:code:message:](self, "appendToErrors:code:message:", v49, 8, CFSTR("The value for field '%@' is missing."), v36);
      }

LABEL_25:
      objc_msgSend(v32, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v37);

    }
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  }
  while (v29);
LABEL_27:

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v24, "allKeys");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  v12 = v45;
  v14 = v49;
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(v38);
        v43 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
        if ((objc_msgSend(v26, "containsObject:", v43) & 1) == 0)
          -[TIAnalyticsService appendToErrors:code:message:](self, "appendToErrors:code:message:", v49, 9, CFSTR("The field '%@' is not defined in the event."), v43);
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
    }
    while (v40);
  }

  v11 = v46;
  v10 = v47;
LABEL_37:

  return v24;
}

- (void)appendToErrors:(id)a3 code:(int64_t)a4 message:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];
  uint64_t v16;

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend([v7 alloc], "initWithFormat:arguments:", v8, &v16);

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v14 = CFSTR("message");
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TIAnalyticsErrorDomain"), a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v13);

}

- (void)sendCoreAnalyticsEventToDomain:(id)a3 withName:(id)a4 payload:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  objc_msgSend(a3, "stringByAppendingFormat:", CFSTR(".%@"), a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TIAnalyticsService provider](self, "provider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dispatchEventWithName:payload:", v10, v8);

}

- (void)queueCompletionHandler:(id)a3
{
  TIDispatchAsync(self->_queue, a3);
}

- (NSMutableDictionary)eventSpecs
{
  return self->_eventSpecs;
}

- (TIAnalyticsServiceProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_eventSpecs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __88__TIAnalyticsService_settingsFromPayload_andValues_eventSpec_allowSparsePayload_errors___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v8, v7);
}

void __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventSpecs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "settingsFromInputMode:eventSpec:errors:", *(_QWORD *)(a1 + 48), v4, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSettings:toPayload:errors:", v7, v5, v2);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "settingsFromPayload:andValues:eventSpec:allowSparsePayload:errors:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4, *(unsigned __int8 *)(a1 + 96), v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSettings:toPayload:errors:", v9, v5, v2);

    objc_msgSend(*(id *)(a1 + 32), "addSettings:toPayload:errors:", *(_QWORD *)(a1 + 72), v5, v2);
    if (objc_msgSend(v2, "count"))
    {
      IXADefaultLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unable to dispatch event '%@' because of the following errors:"), "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", *(_QWORD *)(a1 + 40));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v17;
        _os_log_error_impl(&dword_18C56E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_227);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sendCoreAnalyticsEventToDomain:withName:payload:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40), v5);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to dispatch event '%@' because it's not registered."), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IXADefaultLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v12;
      _os_log_impl(&dword_18C56E000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v18 = CFSTR("message");
    v19 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("TIAnalyticsErrorDomain"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v15);

  }
  v16 = *(_QWORD *)(a1 + 88);
  if (v16)
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v2);

}

void __138__TIAnalyticsService__dispatchEventToDomain_withName_payload_values_inputMode_testingParameters_allowSparsePayload_withCompletionHandler___block_invoke_225(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXADefaultLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s   %@"), "-[TIAnalyticsService _dispatchEventToDomain:withName:payload:values:inputMode:testingParameters:allowSparsePayload:withCompletionHandler:]_block_invoke", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v7;
    _os_log_error_impl(&dword_18C56E000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
}

void __63__TIAnalyticsService__registerEventSpec_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "eventSpecs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("TIAnalyticsEventSpec with name '%@' is already registered."), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    IXADefaultLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TIAnalyticsService _registerEventSpec:withCompletionHandler:]_block_invoke", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_debug_impl(&dword_18C56E000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v17 = CFSTR("message");
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("TIAnalyticsErrorDomain"), 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "eventSpecs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 40);
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v14);

    v11 = 0;
  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v11);

}

+ (void)setMockInstance:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__mockInstance != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__mockInstance, a3);
    v4 = v5;
  }

}

@end
