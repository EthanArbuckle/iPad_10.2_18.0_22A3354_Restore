@implementation _PSSuggester

- (_PSSuggester)init
{
  void *v3;
  _PSSuggester *v4;

  +[_PSSuggesterConfiguration defaultConfiguration](_PSSuggesterConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_PSSuggester initWithConfiguration:](self, "initWithConfiguration:", v3);

  return v4;
}

+ (id)suggesterWithDaemon
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[_PSSuggesterConfiguration defaultConfiguration](_PSSuggesterConfiguration, "defaultConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithDaemonUsingConfiguration:", v3);

  return v4;
}

+ (void)setHasInitializedCache:(BOOL)a3
{
  atomic_store(a3, _hasInitializedCache);
}

+ (BOOL)hasInitializedCache
{
  unsigned __int8 v2;

  v2 = atomic_load(_hasInitializedCache);
  return v2 & 1;
}

+ (void)initializePSSuggesterCacheWithMaxSuggestionCount:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = +[_PSSuggesterCache defaultServiceWithMaxSuggestionCount:](_PSSuggesterCache, "defaultServiceWithMaxSuggestionCount:", a3);
  +[_PSSuggester setHasInitializedCache:](_PSSuggester, "setHasInitializedCache:", 1);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "Initialized _PSSuggesterCache", v5, 2u);
  }

}

- (_PSSuggester)initWithDaemonUsingConfiguration:(id)a3
{
  id v5;
  _PSSuggester *v6;
  _PSSuggester *v7;
  id v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  uint64_t v12;
  NSDictionary *appBundleIdToShareExtensionMapping;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *peopleSuggestionQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *appExtensionQueue;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_PSSuggester;
  v6 = -[_PSSuggester init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v9 = objc_msgSend(v8, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v9;

    _CDInteractionNSXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_connection, "setRemoteObjectInterface:", v11);

    _PSShareSheetSuggestionBundleIDMapping(0);
    v12 = objc_claimAutoreleasedReturnValue();
    appBundleIdToShareExtensionMapping = v7->_appBundleIdToShareExtensionMapping;
    v7->_appBundleIdToShareExtensionMapping = (NSDictionary *)v12;

    v14 = MEMORY[0x1E0C80D50];
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.peopleSuggestionQueue", v15);
    peopleSuggestionQueue = v7->_peopleSuggestionQueue;
    v7->_peopleSuggestionQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.appExtensionQueue", v18);
    appExtensionQueue = v7->_appExtensionQueue;
    v7->_appExtensionQueue = (OS_dispatch_queue *)v19;

    -[NSXPCConnection resume](v7->_connection, "resume");
  }

  return v7;
}

- (_PSSuggester)initWithConfiguration:(id)a3
{
  return -[_PSSuggester initWithConfiguration:feedbackRecording:](self, "initWithConfiguration:feedbackRecording:", a3, 0);
}

- (_PSSuggester)initWithConfiguration:(id)a3 feedbackRecording:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  _PSSuggester *v8;
  _PSSuggester *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *feedbackQueue;
  NSObject *v13;
  _QWORD block[4];
  _PSSuggester *v16;
  objc_super v17;

  v4 = a4;
  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PSSuggester;
  v8 = -[_PSSuggester init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create("_ps_suggester_feedback", v10);
      feedbackQueue = v9->_feedbackQueue;
      v9->_feedbackQueue = (OS_dispatch_queue *)v11;

      v13 = v9->_feedbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke;
      block[3] = &unk_1E43FEB68;
      v16 = v9;
      dispatch_async(v13, block);

    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  -[NSXPCConnection invalidate](self->_userConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PSSuggester;
  -[_PSSuggester dealloc](&v3, sel_dealloc);
}

- (id)contactStore
{
  os_unfair_lock_s *p_lock;
  CNContactStore *contactStore;
  void *v5;
  objc_class *v6;
  CNContactStore *v7;
  CNContactStore *v8;
  CNContactStore *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getCNContactStoreClass_softClass_2;
    v15 = getCNContactStoreClass_softClass_2;
    if (!getCNContactStoreClass_softClass_2)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getCNContactStoreClass_block_invoke_2;
      v11[3] = &unk_1E43FEA00;
      v11[4] = &v12;
      __getCNContactStoreClass_block_invoke_2((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = (CNContactStore *)objc_alloc_init(v6);
    v8 = self->_contactStore;
    self->_contactStore = v7;

    contactStore = self->_contactStore;
  }
  v9 = contactStore;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)shareSheetInteractionsFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_PSSuggester configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggester shareSheetInteractionsFromContext:maximumNumberOfSuggestions:](self, "shareSheetInteractionsFromContext:maximumNumberOfSuggestions:", v4, objc_msgSend(v5, "maximumNumberOfSuggestions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shareSheetInteractionsFromContext:(id)a3 maximumNumberOfSuggestions:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_activity_scope_state_s v14;

  v6 = a3;
  v7 = _os_activity_create(&dword_1A07F4000, "Duet: Share Sheet Suggestions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v7, &v14);
  os_activity_scope_leave(&v14);

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
  }

  -[_PSSuggester configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestionModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictWithPredictionContext:maxSuggestions:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v14, 2u);
  }

  return v11;
}

- (id)appExtensionSuggestionsFromContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  os_activity_scope_state_s v12;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A07F4000, "Duet: App Suggestions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  os_activity_scope_leave(&v12);

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
  }

  -[_PSSuggester configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suggestionModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appExtensionSuggestionsFromContext:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v12, 2u);
  }

  return v9;
}

- (id)candidatesForShareSheetRankingCompute
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_activity_scope_state_s v11;

  v3 = _os_activity_create(&dword_1A07F4000, "Duet: Candidates for Share Sheet Ranking", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v3, &v11);
  os_activity_scope_leave(&v11);

  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v11.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidatesForShareSheetRankingTotalTime", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
  }

  -[_PSSuggester configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestionModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "candidatesForShareSheetRanking");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_pas_mappedSetWithTransform:", &__block_literal_global_9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    LOWORD(v11.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidatesForShareSheetRankingTotalTime", (const char *)&unk_1A0908603, (uint8_t *)&v11, 2u);
  }

  return v8;
}

- (id)candidatesForShareSheetRanking
{
  NSObject *v3;
  unsigned __int8 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t v23[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "Fetching candidates for Share Sheet ranking", buf, 2u);
  }

  v4 = atomic_load(_hasInitializedCache);
  if ((v4 & 1) != 0)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Checking cache for initialized candidates", buf, 2u);
    }

    -[_PSSuggester getCacheSuggestions](self, "getCacheSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_120);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_122_0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "Returning candidates array from cache", buf, 2u);
      }
      goto LABEL_19;
    }

  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v10, OS_LOG_TYPE_DEFAULT, "Requesting candidates over XPC", buf, 2u);
  }

  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v11)
  {
    objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_125);
    v9 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4;
    v21 = __Block_byref_object_dispose__4;
    v22 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_126;
    v16[3] = &unk_1E43FFC20;
    v16[4] = buf;
    -[NSObject candidatesForShareSheetRanking:](v9, "candidatesForShareSheetRanking:", v16);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *((_QWORD *)v18 + 5);
      *(_DWORD *)v23 = 138477827;
      v24 = v13;
      _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_INFO, "Fetched candidates %{private}@", v23, 0xCu);
    }

    v8 = *((id *)v18 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSSuggester candidatesForShareSheetRanking].cold.1();

    -[_PSSuggester candidatesForShareSheetRankingCompute](self, "candidatesForShareSheetRankingCompute");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject allObjects](v9, "allObjects");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

  return v8;
}

- (id)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  _QWORD v13[5];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t v20[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Fetching candidates for Share Sheet ranking", buf, 2u);
  }

  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_128);
    v8 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__4;
    v18 = __Block_byref_object_dispose__4;
    v19 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke_129;
    v13[3] = &unk_1E43FFC68;
    v13[4] = buf;
    -[NSObject computeShareSheetEphemeralFeaturesWithPredictionContext:reply:](v8, "computeShareSheetEphemeralFeaturesWithPredictionContext:reply:", v4, v13);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((_QWORD *)v15 + 5);
      *(_DWORD *)v20 = 138477827;
      v21 = v10;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "Fetched candidates %{private}@", v20, 0xCu);
    }

    v11 = *((id *)v15 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSSuggester candidatesForShareSheetRanking].cold.1();
    v11 = (id)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

- (id)suggestInteractionsFromContext:(id)a3
{
  id v4;
  AeroMLTracerSession *v5;
  void *v6;
  void *v7;
  AeroMLTracerSession *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  __int128 *p_buf;
  uint8_t v34[16];
  __int128 buf;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [AeroMLTracerSession alloc];
  objc_msgSend(v4, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peopleSuggesterShareSheetProjectName](_PSConstants, "peopleSuggesterShareSheetProjectName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[AeroMLTracerSession initWithTraceId:projectName:](v5, "initWithTraceId:projectName:", v6, v7);

  -[AeroMLTracerSession createRootSpanWithName:](v8, "createRootSpanWithName:", CFSTR("syncsuggestInteractionsFromContext_End2End"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryStartDate:", v10);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  if (objc_msgSend(v11, "integerForKey:", CFSTR("SharingPeopleSuggestionsDisabled")) == 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A07F4000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet People Suggestions disabled in Settings Switch", (uint8_t *)&buf, 2u);
    }
    v13 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v4, "locationUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForNearbyLOIIdentifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLocationUUIDs:", v17);

    }
    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "locationUUIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_INFO, "Prediction Context - LocationUUIDs: %@", (uint8_t *)&buf, 0xCu);

    }
    -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
    v20 = objc_claimAutoreleasedReturnValue();
    v12 = v20;
    if (v20)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__4;
      v38 = __Block_byref_object_dispose__4;
      v39 = 0;
      -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v20, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_DEFAULT, "_PSSuggester: calling suggestInteractionsFromContext", v34, 2u);
      }

      v23 = (void *)MEMORY[0x1E0CB37E8];
      -[_PSSuggester configuration](self, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "maximumNumberOfSuggestions"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x1E0C809B0];
      v29 = 3221225472;
      v30 = __47___PSSuggester_suggestInteractionsFromContext___block_invoke_141;
      v31 = &unk_1E43FFCB0;
      p_buf = &buf;
      v32 = v4;
      objc_msgSend(v21, "suggestInteractionsFromContext:maxSuggestions:reply:", v32, v25, &v28);

      objc_msgSend(v9, "end", v28, v29, v30, v31);
      v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[_PSSuggester suggestInteractionsFromContext:].cold.1();

      -[_PSSuggester shareSheetInteractionsFromContext:](self, "shareSheetInteractionsFromContext:", v4);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

- (void)asyncSuggestInteractionsFromContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70___PSSuggester_asyncSuggestInteractionsFromContext_completionHandler___block_invoke;
  v10[3] = &unk_1E43FFCD8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[_PSSuggester asyncSuggestInteractionsFromContext:timeout:completionHandler:](self, "asyncSuggestInteractionsFromContext:timeout:completionHandler:", v8, v10, 978307200.0);

}

- (id)getCacheSuggestions
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, unsigned __int8);
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v2, OS_LOG_TYPE_DEFAULT, "Cache is available, fetching cached suggestions", buf, 2u);
  }

  +[_PSSuggesterCache defaultService](_PSSuggesterCache, "defaultService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performInitialFetchIfNeeded");
  v26 = 0;
  objc_msgSend(v3, "getCachedSuggestionsAndSessionID:", &v26);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 134218243;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "Fetched %tu cached suggestions: %{private}@", buf, 0x16u);
  }

  if (objc_msgSend(v4, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v8 = MEMORY[0x1E0C809B0];
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __35___PSSuggester_getCacheSuggestions__block_invoke;
    v24 = &unk_1E43FF3A0;
    v9 = v7;
    v25 = v9;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v21);
    if (!v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v21, v22, v23, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v26;
      v26 = v11;

      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[_PSEnsembleModel predictWithPredictionContext:maxSuggestions:contactKeysToFetch:].cold.6();

    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v14 = (void *)getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0;
    v30 = getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0;
    if (!getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0)
    {
      *(_QWORD *)buf = v8;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke_0;
      v32 = &unk_1E43FEA00;
      v33 = &v27;
      __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke_0((uint64_t)buf);
      v14 = (void *)v28[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v27, 8);
    v16 = [v15 alloc];
    v17 = v26;
    v18 = (void *)objc_msgSend(v9, "copy");
    v19 = (void *)objc_msgSend(v16, "initWithIdentifier:responseType:suggestions:", v17, 1, v18);

    objc_msgSend(getPSMetricsManagerClass_0(), "recordWithPeopleInference:", v19);
  }

  return v4;
}

- (void)showNotificationToFileARadarForUserStudyParticipants
{
  void *v2;
  int v3;
  dispatch_time_t v4;
  _QWORD block[4];
  id v6;

  if (_PASIsInternalDevice())
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.logging"));
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("shareSheetUserStudyParticipant"));

    if (v3)
    {
      v4 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_193;
      block[3] = &unk_1E43FFD00;
      v6 = &__block_literal_global_154;
      dispatch_after(v4, MEMORY[0x1E0C80D38], block);

    }
  }
}

- (void)asyncSuggestInteractionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  AeroMLTracerSession *v10;
  void *v11;
  void *v12;
  AeroMLTracerSession *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *peopleSuggestionQueue;
  id v43;
  id v44;
  id v45;
  double v46;
  dispatch_time_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  AeroMLTracerSession *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  _QWORD block[4];
  id v61;
  id v62;
  id v63;
  _PSSuggester *v64;
  id v65;
  id v66;
  char v67;
  _QWORD v68[4];
  id v69;
  _PSSuggester *v70;
  id v71;
  id v72;
  id v73;
  _QWORD *v74;
  _QWORD v75[5];
  id v76;
  id v77;
  __int128 *p_buf;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD v81[6];
  _QWORD v82[3];
  char v83;
  _QWORD v84[5];
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  __int128 buf;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t);
  void (*v93)(uint64_t);
  id v94;
  uint64_t v95;
  const __CFString *v96;
  const __CFString *v97;
  void *v98;
  uint64_t v99;
  _QWORD v100[3];

  v100[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v57 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryStartDate:", v9);

  v10 = [AeroMLTracerSession alloc];
  objc_msgSend(v8, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants peopleSuggesterShareSheetProjectName](_PSConstants, "peopleSuggesterShareSheetProjectName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AeroMLTracerSession initWithTraceId:projectName:](v10, "initWithTraceId:projectName:", v11, v12);

  v55 = v13;
  -[AeroMLTracerSession createRootSpanWithName:](v13, "createRootSpanWithName:", CFSTR("asyncSuggestInteractionsFromContext_End2End"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "start");
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  if (objc_msgSend(v56, "integerForKey:", CFSTR("SharingPeopleSuggestionsDisabled")) == 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet People Suggestions disabled in Settings Switch", (uint8_t *)&buf, 2u);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v99 = *MEMORY[0x1E0CB2D50];
    v100[0] = CFSTR("Share Sheet People Suggestions disabled in Settings Switch");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, &v99, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v16);

    v97 = CFSTR("SharingPeopleSuggestionsDisabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "logErrorEventWithName:details:attributes:", CFSTR("PSShareSheetPeopleSuggestionsDisabled"), CFSTR("Share Sheet People Suggestions disabled in Settings Switch, return empty suggestion list"), v18);

    (*((void (**)(id, _QWORD, _QWORD, void *))v57 + 2))(v57, MEMORY[0x1E0C9AA60], 0, v58);
  }
  else
  {
    objc_msgSend(v8, "locationUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForNearbyLOIIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLocationUUIDs:", v22);

    }
    +[_PSLogging coreBehaviorChannel](_PSLogging, "coreBehaviorChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "locationUUIDs");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1A07F4000, v23, OS_LOG_TYPE_INFO, "Prediction Context - LocationUUIDs: %@", (uint8_t *)&buf, 0xCu);

    }
    -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v58)
    {
      if (os_signpost_enabled(v25))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }

      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncFallbackTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v91 = 0x3032000000;
      v92 = __Block_byref_object_copy__4;
      v93 = __Block_byref_object_dispose__4;
      v94 = 0;
      v28 = MEMORY[0x1E0C809B0];
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke;
      v86[3] = &unk_1E43FFD28;
      v29 = v8;
      v87 = v29;
      v30 = v59;
      v88 = v30;
      v31 = v57;
      v89 = v31;
      objc_msgSend(v58, "synchronousRemoteObjectProxyWithErrorHandler:", v86);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x3032000000;
      v84[3] = __Block_byref_object_copy__227;
      v84[4] = __Block_byref_object_dispose__228;
      v85 = (id)MEMORY[0x1A1AFCBF8](v31);
      v82[0] = 0;
      v82[1] = v82;
      v82[2] = 0x2020000000;
      v83 = 0;
      v81[0] = v28;
      v81[1] = 3221225472;
      v81[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_229;
      v81[3] = &unk_1E43FFD50;
      v81[4] = self;
      v81[5] = v84;
      v32 = (void *)MEMORY[0x1A1AFCBF8](v81);
      v75[0] = v28;
      v75[1] = 3221225472;
      v75[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_2;
      v75[3] = &unk_1E43FFD78;
      p_buf = &buf;
      v75[4] = self;
      v79 = v84;
      v33 = v29;
      v76 = v33;
      v80 = v82;
      v34 = v30;
      v77 = v34;
      v35 = (void *)MEMORY[0x1A1AFCBF8](v75);
      v68[0] = v28;
      v68[1] = 3221225472;
      v68[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_241;
      v68[3] = &unk_1E43FFDA0;
      v36 = v34;
      v69 = v36;
      v37 = v32;
      v72 = v37;
      v70 = self;
      v74 = v82;
      v38 = v33;
      v71 = v38;
      v39 = v35;
      v73 = v39;
      v40 = (void *)MEMORY[0x1A1AFCBF8](v68);
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.coreduet.logging"));
      LODWORD(v33) = objc_msgSend(v41, "BOOLForKey:", CFSTR("addCacheDelay"));

      peopleSuggestionQueue = self->_peopleSuggestionQueue;
      block[0] = v28;
      block[1] = 3221225472;
      block[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_248;
      block[3] = &unk_1E43FFDC8;
      v61 = v38;
      v67 = (char)v33;
      v62 = v36;
      v63 = v54;
      v64 = self;
      v65 = v37;
      v66 = v39;
      v43 = v39;
      v44 = v54;
      v45 = v37;
      dispatch_async(peopleSuggestionQueue, block);
      v46 = a4 + 2.0;
      if (!(_DWORD)v33)
        v46 = a4;
      v47 = dispatch_time(0, (uint64_t)(v46 * 1000000000.0));
      dispatch_after(v47, (dispatch_queue_t)self->_peopleSuggestionQueue, v40);

      _Block_object_dispose(v82, 8);
      _Block_object_dispose(v84, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[_PSSuggester suggestInteractionsFromContext:].cold.1();

      v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v95 = *MEMORY[0x1E0CB2D50];
      v96 = CFSTR("Unable to get xpc connection for share sheet suggestions");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v49);

      +[_PSConstants suggestionPathXPCConnectionFailure](_PSConstants, "suggestionPathXPCConnectionFailure");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSuggestionPath:", v51);

      objc_msgSend(v59, "logErrorEventWithName:details:attributes:", CFSTR("getUserDaemonXPCConnectionFailed"), CFSTR("Unable to get xpc connection for share sheet suggestions"), MEMORY[0x1E0C9AA70]);
      objc_msgSend(v59, "createSubSpanWithName:", CFSTR("FallbackToInProcessSuggestion"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "start");
      -[_PSSuggester shareSheetInteractionsFromContext:](self, "shareSheetInteractionsFromContext:", v8);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD, void *))v57 + 2))(v57, v53, 0, v50);

      objc_msgSend(v52, "end");
    }
  }

}

- (id)shareExtensionSuggestionsFromContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  os_activity_scope_state_s state;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  if (self->_connection)
  {
    v5 = _os_activity_create(&dword_1A07F4000, "Duet: Share Sheet Suggestions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__4;
    v13 = __Block_byref_object_dispose__4;
    v14 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_256);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke_257;
    v9[3] = &unk_1E43FEC50;
    v9[4] = &state;
    objc_msgSend(v6, "shareExtensionSuggestionsFromContext:reply:", v4, v9);
    v7 = *(id *)(state.opaque[1] + 40);

    _Block_object_dispose(&state, 8);
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___PSSuggester_asyncShareExtensionSuggestionsFromContext_completionHandler___block_invoke;
  v8[3] = &unk_1E43FFE10;
  v9 = v6;
  v7 = v6;
  -[_PSSuggester asyncShareExtensionSuggestionsFromContext:timeout:completionHandler:](self, "asyncShareExtensionSuggestionsFromContext:timeout:completionHandler:", a3, v8, 978307200.0);

}

- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD, void *);
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  dispatch_time_t v21;
  void (**v22)(id, void *, _QWORD, void *);
  void *v23;
  OS_dispatch_queue *appExtensionQueue;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  _QWORD block[5];
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[8];
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[3];
  char v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD, void *))a5;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__4;
    v50[4] = __Block_byref_object_dispose__4;
    v51 = 0;
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_259);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasOnceToken73 != -1)
      dispatch_once(&asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasOnceToken73, &__block_literal_global_261);
    v12 = (id)asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult;
    if (dispatch_semaphore_wait(v12, 0))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v13, OS_LOG_TYPE_DEFAULT, "Too many requests in progress, your request was cancelled", buf, 2u);
      }

    }
    else
    {
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v49 = 0;
      *(_QWORD *)buf = 0;
      v43 = buf;
      v44 = 0x3032000000;
      v45 = __Block_byref_object_copy__227;
      v46 = __Block_byref_object_dispose__228;
      v47 = (id)MEMORY[0x1A1AFCBF8](v9);
      v19 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_262;
      v41[3] = &unk_1E43FFE58;
      v41[4] = self;
      v41[5] = v50;
      v41[6] = v48;
      v41[7] = buf;
      v20 = (void *)MEMORY[0x1A1AFCBF8](v41);
      v21 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      v22 = v9;
      v23 = v11;
      appExtensionQueue = self->_appExtensionQueue;
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_263;
      block[3] = &unk_1E43FFE80;
      block[4] = self;
      v25 = v8;
      v26 = v8;
      v38 = v26;
      v40 = v48;
      v27 = v20;
      v39 = v27;
      v28 = appExtensionQueue;
      v11 = v23;
      v9 = v22;
      dispatch_after(v21, v28, block);
      v29 = self->_appExtensionQueue;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_264;
      v32[3] = &unk_1E43FFEA8;
      v33 = v11;
      v30 = v26;
      v8 = v25;
      v34 = v30;
      v36 = v27;
      v35 = v12;
      v31 = v27;
      dispatch_async(v29, v32);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v48, 8);
    }

    _Block_object_dispose(v50, 8);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_PSSuggester suggestInteractionsFromContext:].cold.1();

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v52 = *MEMORY[0x1E0CB2D50];
    v53[0] = CFSTR("Unable to get xpc connection for share sheet suggestions");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.PeopleSuggester"), 1, v16);

    -[_PSSuggester shareSheetInteractionsFromContext:](self, "shareSheetInteractionsFromContext:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v18, 0, v17);

  }
}

- (id)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSXPCConnection *v10;
  NSXPCConnection *connection;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t v17[8];
  _QWORD v18[5];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedNameSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    v9 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v10 = (NSXPCConnection *)objc_msgSend(v9, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = self->_connection;
    self->_connection = v10;

    _CDInteractionNSXPCInterface();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v12);

    -[NSXPCConnection resume](self->_connection, "resume");
  }
  os_unfair_lock_unlock(&self->_lock);
  *(_QWORD *)buf = 0;
  v20 = buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_265);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke_266;
  v18[3] = &unk_1E43FEC50;
  v18[4] = buf;
  objc_msgSend(v13, "rankedNameSuggestionsFromContext:name:reply:", v6, v7, v18);
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedNameSuggestionsTotalTime", (const char *)&unk_1A0908603, v17, 2u);
  }

  v15 = *((id *)v20 + 5);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint8_t v20[8];
  _QWORD v21[5];
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = a4;
  v6 = a3;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedGlobalSuggestionsTotalTime", (const char *)&unk_1A0908603, buf, 2u);
  }

  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    *(_QWORD *)buf = 0;
    v23 = buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    v27 = 0;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_267);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[_PSSuggester configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "maximumNumberOfSuggestions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSSuggester configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "excludeBackfillSuggestions");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke_268;
    v21[3] = &unk_1E43FEC50;
    v21[4] = buf;
    objc_msgSend(v10, "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:reply:", v6, v4, v13, v15, v21);

    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedGlobalSuggestionsTotalTime", (const char *)&unk_1A0908603, v20, 2u);
    }

    v17 = *((id *)v23 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_PSSuggester rankedGlobalSuggestionsFromContext:contactsOnly:].cold.1();

    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint8_t v19[8];
  _QWORD v20[5];
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedSiriNLSuggestionsTotalTime", (const char *)&unk_1A0908603, buf, 2u);
  }

  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    *(_QWORD *)buf = 0;
    v22 = buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__4;
    v25 = __Block_byref_object_dispose__4;
    v26 = 0;
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_269);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke_270;
    v20[3] = &unk_1E43FEC50;
    v20[4] = buf;
    objc_msgSend(v14, "rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:reply:", v8, v9, v10, v20);
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedSiriNLSuggestionsTotalTime", (const char *)&unk_1A0908603, v19, 2u);
    }

    v16 = *((id *)v22 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_PSSuggester rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:].cold.1();

    v16 = (id)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)_getUserDaemonXPCConnection
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *connection;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    connection = self->_connection;
    self->_connection = v5;

    _CDInteractionNSXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_connection, "resume");
  }
  os_unfair_lock_unlock(p_lock);
  return self->_connection;
}

- (id)rankedZKWSuggestionsFromContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v28[5];
  uint8_t v29[4];
  uint64_t v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "seedRecipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "[rankedZKWSuggestionsFromContext] Serving request from bundle %@, seed: %@", buf, 0x16u);

  }
  if ((objc_msgSend(v4, "supportsZKWSuggestions") & 1) != 0)
  {
    -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZkwSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
      }

      -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_271_0);
      v10 = objc_claimAutoreleasedReturnValue();
      -[_PSSuggester configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "maximumNumberOfSuggestions");

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v32 = __Block_byref_object_copy__4;
      v33 = __Block_byref_object_dispose__4;
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_272;
      v28[3] = &unk_1E43FEC50;
      v28[4] = buf;
      -[NSObject zkwSuggestionsFromContext:maxSuggestions:reply:](v10, "zkwSuggestionsFromContext:maxSuggestions:reply:", v4, v13, v28);

      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZkwSuggestionsTotalTime", (const char *)&unk_1A0908603, v29, 2u);
      }

      objc_msgSend(v4, "bundleID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        objc_msgSend(v4, "bundleID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v19, "isEqualToString:", v20);

      }
      if (rankedZKWSuggestionsFromContext___pasOnceToken104 != -1)
        dispatch_once(&rankedZKWSuggestionsFromContext___pasOnceToken104, &__block_literal_global_274);
      v21 = (id)rankedZKWSuggestionsFromContext___pasExprOnceResult;
      v22 = v21;
      if (v17 && (objc_msgSend(v21, "isEqualToString:", CFSTR("pstool")) & 1) == 0)
      {
        objc_msgSend(v4, "bundleID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[_PSCNAutocompleteFeedback createVendedSuggestionsFeedbackWithBundleIdentifier:suggestions:isImplicit:](_PSCNAutocompleteFeedback, "createVendedSuggestionsFeedbackWithBundleIdentifier:suggestions:isImplicit:", v23, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSSuggester provideFeedbackForContactsAutocompleteSuggestions:](self, "provideFeedbackForContactsAutocompleteSuggestions:", v24);

      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
        *(_DWORD *)v29 = 134217984;
        v30 = v26;
        _os_log_impl(&dword_1A07F4000, v25, OS_LOG_TYPE_DEFAULT, "[rankedZKWSuggestionsFromContext] returning %tu suggestion(s).", v29, 0xCu);
      }

      v18 = *(id *)(*(_QWORD *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_PSSuggester rankedZKWSuggestionsFromContext:].cold.1();
      v18 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_PSSuggester rankedZKWSuggestionsFromContext:].cold.2(v4, v8);
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return v18;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v13[8];
  _QWORD v14[5];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "searchPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSearchResultsTotalTime", " enableTelemetry=YES ", buf, 2u);
      }

      objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_279);
      v9 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      v16 = buf;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__4;
      v19 = __Block_byref_object_dispose__4;
      v20 = 0;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_280;
      v14[3] = &unk_1E43FEC50;
      v14[4] = buf;
      -[NSObject autocompleteSearchResultsWithPredictionContext:reply:](v9, "autocompleteSearchResultsWithPredictionContext:reply:", v4, v14);
      +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSearchResultsTotalTime", (const char *)&unk_1A0908603, v13, 2u);
      }

      v11 = *((id *)v16 + 5);
      _Block_object_dispose(buf, 8);

    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_PSSuggester autocompleteSearchResultsWithPredictionContext:].cold.1();
      v11 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    -[_PSSuggester rankedZKWSuggestionsFromContext:](self, "rankedZKWSuggestionsFromContext:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t v15[8];
  _QWORD v16[5];
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v18 = buf;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4;
    v21 = __Block_byref_object_dispose__4;
    v22 = 0;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_281);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke_282;
    v16[3] = &unk_1E43FEC50;
    v16[4] = buf;
    objc_msgSend(v11, "rankedAutocompleteSuggestionsFromContext:candidates:reply:", v6, v7, v16);
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A07F4000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSuggestionsTotalTime", (const char *)&unk_1A0908603, v15, 2u);
    }

    v13 = *((id *)v18 + 5);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSSuggester rankedAutocompleteSuggestionsFromContext:candidates:].cold.1();

    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)rankedFamilySuggestions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__4;
    v13 = __Block_byref_object_dispose__4;
    v14 = 0;
    objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_283);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39___PSSuggester_rankedFamilySuggestions__block_invoke_284;
    v8[3] = &unk_1E43FEC50;
    v8[4] = &v9;
    objc_msgSend(v4, "rankedFamilySuggestionsWithReply:", v8);
    v5 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_PSSuggester rankedFamilySuggestions].cold.1();

    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)familyRecommendationSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_285);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke_286;
    v11[3] = &unk_1E43FEC50;
    v11[4] = &v12;
    objc_msgSend(v7, "familyRecommendedSuggestionsWithPredictionContext:reply:", v4, v11);
    v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSSuggester familyRecommendationSuggestionsWithPredictionContext:].cold.1();

    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)photosRelationshipSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_287);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke_288;
    v11[3] = &unk_1E43FEC50;
    v11[4] = &v12;
    objc_msgSend(v7, "photosRelationshipSuggestionsWithPredictionContext:reply:", v4, v11);
    v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSSuggester photosRelationshipSuggestionsWithPredictionContext:].cold.1();

    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)photosContactInferencesSuggestionsWithPredictionContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_289);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke_290;
    v11[3] = &unk_1E43FEC50;
    v11[4] = &v12;
    objc_msgSend(v7, "photosContactInferencesSuggestionsWithPredictionContext:reply:", v4, v11);
    v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSSuggester photosContactInferencesSuggestionsWithPredictionContext:].cold.1();

    v8 = (id)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)hourOfDayProbabilitiesToInteractWithContact:(id)a3
{
  id v3;
  _PSHeuristics *v4;
  void *v5;
  void *v6;
  void *v7;
  _PSHeuristics *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [_PSHeuristics alloc];
  v5 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PSHeuristics initWithKnowledgeStore:interactionStore:contactResolver:messageInteractionCache:](v4, "initWithKnowledgeStore:interactionStore:contactResolver:messageInteractionCache:", 0, v7, 0, 0);

  if (v3)
  {
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSHeuristics hourOfDayProbabilitiesToInteractWithContacts:](v8, "hourOfDayProbabilitiesToInteractWithContacts:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v12;
}

- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3
{
  id v3;
  _PSHeuristics *v4;
  void *v5;
  void *v6;
  void *v7;
  _PSHeuristics *v8;
  void *v9;

  v3 = a3;
  v4 = [_PSHeuristics alloc];
  v5 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_PSHeuristics initWithKnowledgeStore:interactionStore:contactResolver:messageInteractionCache:](v4, "initWithKnowledgeStore:interactionStore:contactResolver:messageInteractionCache:", 0, v7, 0, 0);

  -[_PSHeuristics hourOfDayProbabilitiesToInteractWithContacts:](v8, "hourOfDayProbabilitiesToInteractWithContacts:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  if (v7)
  {
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_294);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke_295;
    v14[3] = &unk_1E43FFC68;
    v14[4] = &v15;
    objc_msgSend(v9, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:reply:", v6, v10, v14);

    v11 = (id)v16[5];
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_PSSuggester relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:].cold.1();

    v11 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (BOOL)isTransportBundleIDSupported:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "suggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "supportedBundleIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "action");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transportBundleID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v8, "containsObject:", v10);

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  return (char)v5;
}

- (void)generatePSRTelemetry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL8 v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _BOOL8 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  id v114;
  void *v115;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  v7 = &unk_1E442AA60;
  if (v6)
  {
    v8 = 0;
    v9 = 0;
    v10 = &unk_1E442AA60;
  }
  else
  {
    if (objc_msgSend(v3, "indexOfEngagedSuggestion"))
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v3, "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transportBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    }
    +[_PSConstants shareplayBundleIds](_PSConstants, "shareplayBundleIds");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transportBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v13, "containsObject:", v15);

    objc_msgSend(v3, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "suggestion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reasonType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("assistant"));

    if (v19)
      v10 = &unk_1E442AA78;
    else
      v10 = &unk_1E442AA60;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "indexOfEngagedSuggestion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("indexSelected"));

    objc_msgSend(v3, "action");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "suggestion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("engagedSuggestionProxyReason"));

    objc_msgSend(v3, "action");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "suggestion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "reasonType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("_PSHeuristics"));

    if ((v27 & 1) == 0)
    {
      objc_msgSend(v3, "action");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "suggestion");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "reasonType");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("suggestionsProxiesFromStats"));

      if (v31)
        v7 = &unk_1E442AA78;
      else
        v7 = &unk_1E442AA90;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("engagedSuggestionProxy"));
    objc_msgSend(v3, "action");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "suggestion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "reasonType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("engagedSuggestionProxy_debug"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "wasAirDropShown"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("airdropShown"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("airdropEngaged"));

  v37 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "numberWithBool:", objc_msgSend(v38, "isSharePlayAvailable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("sharePlayAvailable"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("sharePlayEngaged"));

  v41 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "context");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "supportedBundleIds");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "action");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "transportBundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberWithBool:", objc_msgSend(v43, "containsObject:", v45));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("appSharingIntent"));

  v47 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "action");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v48, "type"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("engagementType"));

  objc_msgSend(v3, "suggestions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
  {
    objc_msgSend(v3, "suggestions");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count") != 0;

  }
  else
  {
    v52 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v53, CFSTR("suggestionAvailable"));

  v54 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "suggestions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "count"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("suggestionNumber"));

  v57 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "numberOfVisibleSuggestions");
  objc_msgSend(v57, "numberWithFloat:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("numberOfVisibleSuggestions"));

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  v60 = objc_msgSend(v59, "integerForKey:", CFSTR("SharingPeopleSuggestionsDisabled")) == 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v61, CFSTR("peopleSuggestionsSetting"));

  objc_msgSend(v3, "action");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "transportBundleID");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v63, CFSTR("transportApp"));

  objc_msgSend(v3, "context");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "bundleID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v65, CFSTR("sourceApp"));

  objc_msgSend(v3, "suggestions");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "firstObject");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "utiList");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("contentShared"));

  objc_msgSend(v3, "context");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "sessionID");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, CFSTR("sessionId"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("userExperienceFlow"));
  v71 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "context");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "suggestionCompletionDate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v74 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v74, "suggestionDate");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "timeIntervalSinceDate:", v75);
  objc_msgSend(v71, "numberWithInt:", (int)(v76 * 1000.0));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, CFSTR("sessionLatency"));

  v78 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "context");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "numberWithBool:", objc_msgSend(v79, "timedOut"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v80, CFSTR("modelTimeout"));

  objc_msgSend(v3, "context");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "suggestionPath");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants suggestionPathNormal](_PSConstants, "suggestionPathNormal");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v74) = objc_msgSend(v82, "isEqualToString:", v83);

  if ((v74 & 1) != 0)
  {
    v84 = &unk_1E442AA60;
  }
  else
  {
    objc_msgSend(v3, "context");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "suggestionPath");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSConstants suggestionPathBestEffort](_PSConstants, "suggestionPathBestEffort");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v86, "isEqualToString:", v87);

    if ((v88 & 1) != 0)
    {
      v84 = &unk_1E442AA78;
    }
    else
    {
      objc_msgSend(v3, "context");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "suggestionPath");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSConstants suggestionPathCachedSuggestion](_PSConstants, "suggestionPathCachedSuggestion");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqualToString:", v91);

      if (v92)
        v84 = &unk_1E442AAA8;
      else
        v84 = &unk_1E442AA90;
    }
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v84, CFSTR("suggestionPath"));
  objc_msgSend(v3, "context");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "suggestionPath");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, CFSTR("suggestionPath_debug"));

  objc_msgSend(v3, "context");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trialDeploymentId");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v96, CFSTR("trialDeploymentId"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v97, CFSTR("trialDeploymentId"));

  }
  objc_msgSend(v3, "context");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "trialExperimentId");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v99, CFSTR("trialExperimentId"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v100, CFSTR("trialExperimentId"));

  }
  objc_msgSend(v3, "context");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "trialTreatmentId");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (v102)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v102, CFSTR("trialTreatmentId"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v103, CFSTR("trialTreatmentId"));

  }
  objc_msgSend(v3, "context");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "bundleID");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(&unk_1E442C820, "containsObject:", v105);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v107, CFSTR("isPhotos"));

  v108 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "context");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "numberWithBool:", objc_msgSend(v109, "isPSRActive"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v110, CFSTR("PSRActive"));

  v111 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "delay");
  objc_msgSend(v111, "numberWithInt:", (int)(v112 * 1000.0));
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v113, CFSTR("sessionDelayInMilliseconds"));

  v115 = v4;
  v114 = v4;
  AnalyticsSendEventLazy();

}

- (void)provideFeedbackForSuggestions:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  _PSSuggester *v111;
  void *v112;
  unsigned int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  _BYTE buf[24];
  void *v123;
  uint64_t *v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v111 = self;
  connection = self->_connection;
  if (!connection)
  {
    os_unfair_lock_lock(&self->_lock);
    v6 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v7 = (NSXPCConnection *)objc_msgSend(v6, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    v8 = self->_connection;
    self->_connection = v7;

    _CDInteractionNSXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_connection, "resume");
    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
  }
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_378);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "conversationIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "action");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "type");
  objc_msgSend(v4, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "saveFeedbackInCoreDuetd:forSessionId:feedbackActionType:isFallbackFetch:reply:", v12, v14, v16, objc_msgSend(v17, "isFallbackFetch"), &__block_literal_global_381);

  objc_msgSend(v4, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "timedOut");

  objc_msgSend(v4, "action");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "type");

  v22 = 0;
  v23 = 2;
  switch(v21)
  {
    case 0:
      if (!objc_msgSend(v4, "indexOfEngagedSuggestion"))
      {
        objc_msgSend(v4, "action");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "transportBundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.UIKit.activity.AirDrop"));

        if ((v26 & 1) != 0)
        {
          v22 = 0;
          v23 = 3;
          goto LABEL_18;
        }
      }
      if (objc_msgSend(v4, "indexOfEngagedSuggestion") == 0x7FFFFFFFFFFFFFFFLL)
      {
        v22 = 0;
      }
      else
      {
        objc_msgSend(v4, "action");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "suggestion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "conversationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22
          || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
              v30 = (void *)objc_claimAutoreleasedReturnValue(),
              v31 = objc_msgSend(v30, "isEqual:", v22),
              v30,
              v31))
        {
          objc_msgSend(v4, "action");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "suggestion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "derivedIntentIdentifier");
          v34 = objc_claimAutoreleasedReturnValue();

          v23 = 0;
          v22 = (void *)v34;
          goto LABEL_18;
        }
      }
      v23 = 0;
      goto LABEL_18;
    case 1:
      goto LABEL_18;
    case 2:
      v22 = 0;
      v23 = 4;
      goto LABEL_18;
    case 4:
      if (-[_PSSuggester isTransportBundleIDSupported:](v111, "isTransportBundleIDSupported:", v4))
        v23 = 5;
      else
        v23 = 6;
      objc_msgSend(v4, "action");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "transportBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      objc_msgSend(v4, "context");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sessionID");
      v36 = objc_claimAutoreleasedReturnValue();

      if (v36)
        v37 = (__CFString *)v36;
      else
        v37 = CFSTR("INVALID");
      v38 = objc_msgSend(v4, "wasAirDropShown");
      objc_msgSend(v4, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "trialExperimentId");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "context");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "trialTreatmentId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "context");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "trialDeploymentId");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        v123 = v44;
        _os_log_debug_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEBUG, "TrialInfo for feedback: %@, %@, %@", buf, 0x20u);
      }

      v118 = 0;
      v119 = &v118;
      v120 = 0x2050000000;
      v46 = (void *)getPSFeedbackMetricsEventClass_softClass;
      v121 = getPSFeedbackMetricsEventClass_softClass;
      if (!getPSFeedbackMetricsEventClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPSFeedbackMetricsEventClass_block_invoke;
        v123 = &unk_1E43FEA00;
        v124 = &v118;
        __getPSFeedbackMetricsEventClass_block_invoke((uint64_t)buf);
        v46 = (void *)v119[3];
      }
      v47 = objc_retainAutorelease(v46);
      _Block_object_dispose(&v118, 8);
      LOBYTE(v110) = v19;
      v48 = (void *)objc_msgSend([v47 alloc], "initWithId:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionTimeoutOccurred:", v37, v23, v22, v38, 0, 0, v40, v42, v44, v110);
      if (v48)
      {
        objc_msgSend(getPSMetricsManagerClass_0(), "recordWithFeedback:", v48);
      }
      else
      {
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          -[_PSSuggester provideFeedbackForSuggestions:].cold.3();

      }
      break;
    default:
      break;
  }
  objc_msgSend(v4, "action");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "type");

  switch(v51)
  {
    case 0:
      v52 = objc_msgSend(v4, "indexOfEngagedSuggestion");
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = v53;
      if (v52 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          -[_PSSuggester provideFeedbackForSuggestions:].cold.2();
        goto LABEL_47;
      }
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "action");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "transportBundleID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v57;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v59;
        _os_log_impl(&dword_1A07F4000, v54, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Engagement with suggestion at index %@, transport: %@", buf, 0x16u);

      }
      -[_PSSuggester _recordFeedbackToInteractionStoreWithFeedback:mechanism:](v111, "_recordFeedbackToInteractionStoreWithFeedback:mechanism:", v4, 20);
      goto LABEL_51;
    case 1:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v54, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Engagement with non-suggestion", buf, 2u);
      }
      goto LABEL_47;
    case 2:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v54, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Abandonment", buf, 2u);
      }
      goto LABEL_47;
    case 4:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "action");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "transportBundleID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v56;
        _os_log_impl(&dword_1A07F4000, v54, OS_LOG_TYPE_INFO, "Feedback for app suggestions: Engagement with transport: %@", buf, 0xCu);

      }
      goto LABEL_47;
    default:
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        -[_PSSuggester provideFeedbackForSuggestions:].cold.1();
LABEL_47:

LABEL_51:
      objc_msgSend(v4, "suggestions");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "firstObject");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend(v61, "familySuggestion");

      objc_msgSend(v4, "action");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "suggestion");
      v115 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v115, "bundleID");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "derivedIntentIdentifier");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      if (v116)
      {
        objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15C80], "keyPathWithKey:", CFSTR("/sharesheet/selectedSuggestion"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v116, CFSTR("bundleID"));
        if (v112)
        {
          +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v116, "isEqualToString:", v66);

          if ((v67 & 1) == 0)
            objc_msgSend(v65, "setObject:forKeyedSubscript:", v112, CFSTR("derivedIntentIdentifier"));
        }
        v68 = (void *)objc_msgSend(v65, "copy");
        objc_msgSend(v63, "setObject:forKeyedSubscript:", v68, v64);

        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v116;
          _os_log_impl(&dword_1A07F4000, v69, OS_LOG_TYPE_INFO, "Set selected suggestion in context store for bundleID %@", buf, 0xCu);
        }

      }
      objc_msgSend(v4, "suggestions");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "firstObject");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isAdaptedModelCreated");

      objc_msgSend(v4, "suggestions");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "firstObject");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v74, "isAdaptedModelUsed");

      objc_msgSend(v4, "suggestions");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "firstObject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "adaptedModelRecipeID");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "suggestions");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "firstObject");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "supportedBundleIDs");
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "suggestions");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "firstObject");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "utiList");
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v113);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "feedbackPayloadShowFamily:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = (void *)objc_msgSend(v86, "mutableCopy");

      v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
      v89 = objc_msgSend(v88, "integerForKey:", CFSTR("SharingPeopleSuggestionsDisabled"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v90, CFSTR("peopleSuggestionsDisabled"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v72);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v91, CFSTR("isAdaptedModelCreated"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v75);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v92, CFSTR("isAdaptedModelUsed"));

      objc_msgSend(v87, "setObject:forKeyedSubscript:", v78, CFSTR("adaptedModelRecipeID"));
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v72);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v75);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v94;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v95;
        *(_WORD *)&buf[22] = 2112;
        v123 = v78;
        _os_log_impl(&dword_1A07F4000, v93, OS_LOG_TYPE_INFO, "Adapted model use and availability indicators are set as isAdaptedModelCreated:%@, isAdaptedModelUsed:%@, adaptedModelRecipeID:%@", buf, 0x20u);

      }
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v81, CFSTR("supportedBundleIds"));
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v81;
        _os_log_impl(&dword_1A07F4000, v96, OS_LOG_TYPE_INFO, "Comma seperated supported bundleID list:%@", buf, 0xCu);
      }

      objc_msgSend(v87, "setObject:forKeyedSubscript:", v84, CFSTR("uti"));
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v84;
        _os_log_impl(&dword_1A07F4000, v97, OS_LOG_TYPE_INFO, "Comma seperated UTI list:%@", buf, 0xCu);
      }

      v98 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "context");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "numberWithInteger:", objc_msgSend(v99, "suggestionPurpose"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setObject:forKeyedSubscript:", v100, CFSTR("suggestionPurpose"));

      objc_msgSend(v4, "action");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "suggestion");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "recipients");
      v103 = (void *)objc_claimAutoreleasedReturnValue();

      if (v103)
      {
        v104 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v4, "action");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "suggestion");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "recipients");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "numberWithUnsignedInteger:", objc_msgSend(v107, "count"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setObject:forKeyedSubscript:", v108, CFSTR("recipientCount"));

      }
      if ((v113 & 1) == 0)
        -[_PSSuggester generatePSRTelemetry:](v111, "generatePSRTelemetry:", v4);
      v117 = v87;
      v109 = v87;
      AnalyticsSendEventLazy();
      objc_msgSend(v4, "donateToBiome");

      return;
  }
}

- (void)_recordFeedbackToInteractionStoreWithFeedback:(id)a3 mechanism:(int64_t)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  void *v12;
  NSDictionary *appBundleIdToShareExtensionMapping;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  id obja;
  id obj;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  void *v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  connection = self->_connection;
  if (!connection)
  {
    os_unfair_lock_lock(&self->_lock);
    v8 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v9 = (NSXPCConnection *)objc_msgSend(v8, "initWithMachServiceName:options:", *MEMORY[0x1E0D15B18], 4096);
    v10 = self->_connection;
    self->_connection = v9;

    _CDInteractionNSXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v11);

    -[NSXPCConnection resume](self->_connection, "resume");
    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
  }
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_408);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  appBundleIdToShareExtensionMapping = self->_appBundleIdToShareExtensionMapping;
  objc_msgSend(v6, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportBundleID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](appBundleIdToShareExtensionMapping, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v6, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transportBundleID");
    v17 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "suggestion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "groupName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGroupName:", v21);

  v79 = (void *)v17;
  objc_msgSend(v12, "setTargetBundleId:", v17);
  objc_msgSend(v6, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bundleID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBundleId:", v23);

  objc_msgSend(v12, "setMechanism:", a4);
  objc_msgSend(v6, "action");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "suggestion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "derivedIntentIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDerivedIntentIdentifier:", v26);

  objc_msgSend(v6, "action");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "suggestion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_uri");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v12;
  if (v30)
  {
    objc_msgSend(v12, "setContentURL:", v30);
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "action");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "suggestion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "image");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLWithString:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentURL:", v35);

  }
  v36 = (void *)objc_opt_new();
  v98[0] = MEMORY[0x1E0C809B0];
  v98[1] = 3221225472;
  v98[2] = __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_410;
  v98[3] = &unk_1E43FFF98;
  v78 = v36;
  v99 = v78;
  v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFCBF8](v98);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v82 = v6;
  objc_msgSend(v6, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "attachments");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v39;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v95;
    v43 = "peoplesuggester_rewrite";
    do
    {
      v44 = 0;
      v83 = v41;
      do
      {
        if (*(_QWORD *)v95 != v42)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v44);
        ((void (**)(_QWORD, void *, _QWORD, _QWORD))v37)[2](v37, v45, 0, 0);
        if (_os_feature_enabled_impl())
        {
          v46 = v43;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          objc_msgSend(v45, "photoSceneDescriptors");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v91;
            do
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v91 != v50)
                  objc_enumerationMutation(v47);
                ((void (**)(_QWORD, void *, _QWORD, _QWORD))v37)[2](v37, v45, *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i), 0);
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
            }
            while (v49);
          }

          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          objc_msgSend(v45, "peopleInPhoto");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v87;
            do
            {
              for (j = 0; j != v54; ++j)
              {
                if (*(_QWORD *)v87 != v55)
                  objc_enumerationMutation(v52);
                ((void (**)(_QWORD, void *, _QWORD, _QWORD))v37)[2](v37, v45, 0, *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
            }
            while (v54);
          }

          v43 = v46;
          v41 = v83;
        }
        ++v44;
      }
      while (v44 != v41);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
    }
    while (v41);
  }

  objc_msgSend(v80, "setAttachments:", v78);
  objc_msgSend(v82, "action");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "suggestion");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "conversationIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v82, "action");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "suggestion");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "conversationIdentifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setDomainIdentifier:", v62);

    v63 = v79;
  }
  else
  {
    objc_msgSend(v80, "derivedIntentIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringByReplacingOccurrencesOfString:withString:", CFSTR("conversationIdentifier"), &stru_1E4402490);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "substringWithRange:", 1, objc_msgSend(v65, "length") - 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), CFSTR("conversationIdentifier"), v60);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "derivedIntentIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v65) = objc_msgSend(v66, "isEqualToString:", v67);

    v63 = v79;
    if ((_DWORD)v65)
    {
      objc_msgSend(v60, "stringByRemovingPercentEncoding");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setDomainIdentifier:", v61);
    }
    else
    {
      objc_msgSend(v80, "derivedIntentIdentifier");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "stringByRemovingPercentEncoding");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setDomainIdentifier:", v68);

    }
  }

  objc_msgSend(v82, "action");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "suggestion");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "recipients");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "_pas_mappedArrayWithTransform:", &__block_literal_global_418);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setRecipients:", v72);

  objc_msgSend(v80, "targetBundleId");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSConstants sharePlayBundleId](_PSConstants, "sharePlayBundleId");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = objc_msgSend(v73, "isEqualToString:", v74);

  if ((_DWORD)v71)
    v75 = 2;
  else
    v75 = 1;
  objc_msgSend(v80, "setDirection:", v75);
  NSUserName();
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "setNsUserName:", v76);

  v100 = v80;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "recordInteractions:enforceDataLimits:enforcePrivacy:reply:", v77, 1, 1, &__block_literal_global_420);

}

- (void)provideSuggestLessFeedbackForShareSheetSuggestion:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
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
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2050000000;
  v5 = (void *)getBMPeopleSuggesterSuggestLessFeedbackClass_softClass;
  v22 = getBMPeopleSuggesterSuggestLessFeedbackClass_softClass;
  if (!getBMPeopleSuggesterSuggestLessFeedbackClass_softClass)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __getBMPeopleSuggesterSuggestLessFeedbackClass_block_invoke;
    v18[3] = &unk_1E43FEA00;
    v18[4] = &v19;
    __getBMPeopleSuggesterSuggestLessFeedbackClass_block_invoke((uint64_t)v18);
    v5 = (void *)v20[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v19, 8);
  v7 = [v6 alloc];
  objc_msgSend(v4, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "derivedIntentId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithIdentifier:bundleId:derivedIdentifier:conversationIdentifier:handle:contactIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", CFSTR("shareSheetSuggestLessFeedback"), v8, v9, v10, v11, v12, 0, 0, 0, 0);

  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "PeopleSuggester");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "SuggestLessFeedback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendEvent:", v13);

  -[_PSSuggester deleteInteractionsMatchingSuggestLessFeedback:](self, "deleteInteractionsMatchingSuggestLessFeedback:", v4);
}

- (id)buildFilteringPredicateMatchingSuggestLessFeedback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[16];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "derivedIntentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_2:

    goto LABEL_3;
  }
  objc_msgSend(v3, "conversationId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v3, "conversationId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("domainIdentifier == %@"), v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v4, "addObject:", v5);
    goto LABEL_2;
  }
LABEL_3:
  objc_msgSend(v3, "derivedIntentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v3, "derivedIntentId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithFormat:", CFSTR("derivedIntentIdentifier == %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v4, "addObject:", v9);

  }
  if (!objc_msgSend(v4, "count"))
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSSuggester buildFilteringPredicateMatchingSuggestLessFeedback:].cold.1();

    objc_msgSend(v3, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3880];
    if (v11)
    {
      objc_msgSend(v3, "handle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "predicateWithFormat:", CFSTR("ANY recipients.identifier IN %@"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(v4, "addObject:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v19);

      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_DEFAULT, "SuggestLess: Feedback handle is nil. Falling back to NO predicate", buf, 2u);
      }
    }

  }
  v20 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442AAC0, &unk_1E442AAD8, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateWithFormat:", CFSTR("direction IN %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v4, "addObject:", v22);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)deleteInteractionsMatchingSuggestLessFeedback:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *connection;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[_PSSuggester buildFilteringPredicateMatchingSuggestLessFeedback:](self, "buildFilteringPredicateMatchingSuggestLessFeedback:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  if (connection)
  {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_437_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_438;
    v16[3] = &unk_1E4400040;
    v17 = v4;
    objc_msgSend(v7, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:reply:", v5, 0, 0, v16);

  }
  -[_PSSuggester configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestionModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_PSSuggester configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suggestionModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageInteractionCache:", 0);

    -[_PSSuggester configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "suggestionModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShareInteractionCache:", 0);

    -[_PSSuggester configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suggestionModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "populateCaches");

  }
}

- (void)provideFeedbackForMessagesZkwSuggestions:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_441);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject provideFeedbackForContactsAutocompleteSuggestions:](v7, "provideFeedbackForContactsAutocompleteSuggestions:", v4);
  }
  else
  {
    +[_PSLogging suggestionSignpost](_PSLogging, "suggestionSignpost");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSSuggester provideFeedbackForContactsAutocompleteSuggestions:].cold.1();
  }

}

- (void)writeFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *feedbackQueue;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (self->_feedbackQueue)
  {
    switch(objc_msgSend(v4, "feedbackType"))
    {
      case 0:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.3();
        break;
      case 1:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.4();
        break;
      case 2:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.5();
        break;
      case 3:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.6();
        break;
      case 4:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.7();
        break;
      case 5:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.8();
        break;
      default:
        +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.2();
        break;
    }

    feedbackQueue = self->_feedbackQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke;
    v9[3] = &unk_1E4400068;
    v9[4] = self;
    v10 = v5;
    dispatch_async(feedbackQueue, v9);

  }
  else
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.1();

  }
}

- (id)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[_PSSuggester _getUserDaemonXPCConnection](self, "_getUserDaemonXPCConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_442);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke_443;
  v12[3] = &unk_1E44000B0;
  v10 = v6;
  v13 = v10;
  objc_msgSend(v9, "validateCoreMLScoringModelWithRawInput:predictionContext:reply:", v7, v10, v12);

  return v10;
}

- (_PSSuggesterConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_appExtensionQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_appBundleIdToShareExtensionMapping, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_feedbackSource, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_userConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4
{
  return -[_PSSuggester shareInformationForPhotoId:dateInterval:interactionStoreDB:](self, "shareInformationForPhotoId:dateInterval:interactionStoreDB:", a3, a4, 0);
}

- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4 interactionStoreDB:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  _PSPhotosShareInformation *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  void *v44;
  NSObject *v45;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  id v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  int v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  double v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v55 = v7;
  if (v7)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v49 = v10;
    objc_msgSend(MEMORY[0x1E0D158E0], "storeWithDirectory:readOnly:", v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v8;
    objc_msgSend(v8, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1A1AFCA24]();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E442AB20, &unk_1E442AB38, 0);
    objc_autoreleasePoolPop(v14);
    v16 = (void *)MEMORY[0x1A1AFCA24]();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E442AB50, 0);
    objc_autoreleasePoolPop(v16);
    v48 = v11;
    LOBYTE(v47) = 0;
    +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:singleRecipient:fetchLimit:", v11, v12, v13, v15, 0, 0, 0, v17, v47, 10000);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v18;
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
    if (v53)
    {
      v54 = 0;
      v52 = *(_QWORD *)v69;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v69 != v52)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "attachments");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v21 = v20;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v65;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v65 != v24)
                  objc_enumerationMutation(v21);
                objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "photoLocalIdentifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v26;
                if (v26)
                {
                  v28 = objc_msgSend(v26, "rangeOfString:", CFSTR("/"));
                  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ((objc_msgSend(v27, "isEqualToString:", v55) & 1) != 0)
                      goto LABEL_22;
                  }
                  else
                  {
                    objc_msgSend(v27, "substringToIndex:", v28);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "isEqualToString:", v55);

                    if ((v30 & 1) != 0)
                    {
LABEL_22:
                      ++v54;

                      goto LABEL_23;
                    }
                  }
                }

              }
              v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v80, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_23:

        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v81, 16);
      }
      while (v53);
    }
    else
    {
      v54 = 0;
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v33 = obj;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
    if (v34)
    {
      v35 = v34;
      v36 = 0;
      v37 = *(_QWORD *)v61;
      do
      {
        for (k = 0; k != v35; ++k)
        {
          if (*(_QWORD *)v61 != v37)
            objc_enumerationMutation(v33);
          objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "attachments");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0u;
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v57;
            do
            {
              for (m = 0; m != v41; ++m)
              {
                if (*(_QWORD *)v57 != v42)
                  objc_enumerationMutation(v39);
                objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * m), "photoLocalIdentifier");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v44)
                  ++v36;

              }
              v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v78, 16);
            }
            while (v41);
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v60, v79, 16);
      }
      while (v35);
    }
    else
    {
      v36 = 0;
    }

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v73 = v55;
      v74 = 1024;
      v75 = v54;
      v76 = 2048;
      v77 = (double)v54 / (double)v36;
      _os_log_debug_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEBUG, "Number of interactions for photoId: %@: %d (Normalized: %lf)", buf, 0x1Cu);
    }

    v32 = -[_PSPhotosShareInformation initWithInteractionCount:totalInteractionCount:]([_PSPhotosShareInformation alloc], "initWithInteractionCount:totalInteractionCount:", v54, v36);
    v10 = v49;
    v8 = v50;
    v31 = v48;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[_PSSuggester(PhotosShareCount) shareInformationForPhotoId:dateInterval:interactionStoreDB:].cold.1(v31);
    v32 = 0;
  }

  return v32;
}

- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4
{
  return -[_PSSuggester interactionCountForHandle:fetchLimit:interactionStoreDB:](self, "interactionCountForHandle:fetchLimit:interactionStoreDB:", a3, a4, 0);
}

- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4 interactionStoreDB:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  _PSInteractionInformation *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  _QWORD v116[4];
  id v117;
  id v118;
  uint8_t buf[4];
  id v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  _QWORD v127[3];

  v127[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v127[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v127, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSContactResolver normalizedHandlesDictionaryFromHandles:](_PSContactResolver, "normalizedHandlesDictionaryFromHandles:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C99E60];
    v111 = v11;
    -[NSObject allValues](v11, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    v16 = (void *)objc_opt_new();
    v112 = v9;
    objc_msgSend(MEMORY[0x1E0D158E0], "storeWithDirectory:readOnly:", v9, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v18, 0, &unk_1E442CA90, 0, 0, v17, a4, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "addObjectsFromArray:", v19);
    objc_msgSend(v15, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionsMatchingAnySender:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnySender:store:fetchLimit:messageInteractionCache:", v20, v17, a4, 0);
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v16;
    objc_msgSend(v16, "addObjectsFromArray:", v22);
    v110 = v15;
    objc_msgSend(v15, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)v17;
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v24, 0, &unk_1E442CAA8, 0, 0, v17, a4, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)objc_opt_new();
    v27 = (void *)objc_opt_new();
    v113 = v22;
    v114 = v16;
    if (objc_msgSend(v22, "count"))
    {
      v106 = v25;
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke;
      v116[3] = &unk_1E44004A8;
      v117 = v21;
      v28 = v27;
      v118 = v28;
      v29 = v16;
      objc_msgSend(v16, "_pas_filteredArrayWithTest:", v116);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v21;
      if (v31)
      {
        -[_PSSuggester _dateFormatter](self, "_dateFormatter");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "startDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "stringFromDate:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, CFSTR("recentIncomingStartDate"));

        v29 = v16;
      }
      objc_msgSend(v30, "endDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        -[_PSSuggester _dateFormatter](self, "_dateFormatter");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "endDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringFromDate:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("recentIncomingEndDate"));

        v29 = v16;
      }
      objc_msgSend(v30, "bundleId");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, CFSTR("recentIncomingBundleId"));

      objc_msgSend(v30, "domainIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v40, CFSTR("recentIncomingDomainId"));

      objc_msgSend(v30, "account");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v41, CFSTR("recentIncomingAccount"));

      objc_msgSend(v30, "recipients");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "count");

      if (v43)
      {
        objc_msgSend(v30, "recipients");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "firstObject");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v46, CFSTR("recentIncomingRecipientContactId"));

        objc_msgSend(v45, "displayName");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          objc_msgSend(v45, "displayName");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v48, CFSTR("recentIncomingRecipientDisplayName"));

        }
      }
      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringValue");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v50, CFSTR("incomingCalls"));

        objc_msgSend(v28, "firstObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "startDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v52, CFSTR("recentIncomingCallStartDate"));

        objc_msgSend(v51, "endDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v53, CFSTR("recentIncomingCallEndDate"));

        objc_msgSend(v51, "bundleId");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v54, CFSTR("recentIncomingCallBundleId"));

        objc_msgSend(v51, "domainIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v55, CFSTR("recentIncomingCallDomainId"));

        objc_msgSend(v51, "account");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v56, CFSTR("recentIncomingCallAccount"));

        objc_msgSend(v30, "recipients");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "count");

        if (v58)
        {
          objc_msgSend(v51, "recipients");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "firstObject");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "identifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v61, CFSTR("recentIncomingCallRecipientContactId"));

          objc_msgSend(v60, "displayName");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v62, CFSTR("recentIncomingCallRecipientDisplayName"));

        }
      }

      v23 = v29;
      v25 = v106;
    }
    else
    {
      v108 = (void *)MEMORY[0x1E0C9AA60];
      v7 = v21;
    }
    if (objc_msgSend(v25, "count"))
    {
      v107 = v27;
      objc_msgSend(v25, "_pas_filteredArrayWithTest:", &__block_literal_global_18);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "stringValue");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v67, CFSTR("outgoingCalls"));

      objc_msgSend(v25, "firstObject");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "startDate");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        -[_PSSuggester _dateFormatter](self, "_dateFormatter");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "stringFromDate:", v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v71, CFSTR("recentOutgoingStartDate"));

      }
      objc_msgSend(v68, "endDate");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (v72)
      {
        -[_PSSuggester _dateFormatter](self, "_dateFormatter");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "stringFromDate:", v72);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v74, CFSTR("recentOutgoingEndDate"));

      }
      objc_msgSend(v68, "bundleId");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v75, CFSTR("recentOutgoingBundleId"));

      objc_msgSend(v68, "domainIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v76, CFSTR("recentOutgoingDomainId"));

      objc_msgSend(v68, "account");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v77, CFSTR("recentOutgoingAccount"));

      objc_msgSend(v68, "recipients");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "count");

      if (v79)
      {
        objc_msgSend(v68, "recipients");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "firstObject");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v81, "identifier");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v82, CFSTR("recentOutgoingRecipientContactId"));

        objc_msgSend(v81, "displayName");
        v83 = (void *)objc_claimAutoreleasedReturnValue();

        if (v83)
        {
          objc_msgSend(v81, "displayName");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v84, CFSTR("recentOutgoingRecipientDisplayName"));

        }
      }
      if (objc_msgSend(v65, "count"))
      {
        objc_msgSend(v65, "firstObject");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "startDate");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v86, CFSTR("recentOutgoingCallStartDate"));

        objc_msgSend(v85, "endDate");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v87, CFSTR("recentOutgoingCallEndDate"));

        objc_msgSend(v85, "bundleId");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v88, CFSTR("recentOutgoingCallBundleId"));

        objc_msgSend(v85, "domainIdentifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v89, CFSTR("recentOutgoingCallDomainId"));

        objc_msgSend(v85, "account");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v90, CFSTR("recentOutgoingCallAccount"));

        objc_msgSend(v85, "recipients");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "count");

        if (v92)
        {
          objc_msgSend(v85, "recipients");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "firstObject");
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v94, "identifier");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v95, CFSTR("recentOutgoingCallRecipientContactId"));

          objc_msgSend(v94, "displayName");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v96, CFSTR("recentOutgoingCallRecipientDisplayName"));

        }
      }

      v23 = v114;
      v27 = v107;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "stringValue");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v98, CFSTR("incoming"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "stringValue");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v100, CFSTR("outgoing"));

    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      v103 = objc_msgSend(v108, "count");
      v104 = objc_msgSend(v113, "count");
      v105 = objc_msgSend(v25, "count");
      *(_DWORD *)buf = 138413058;
      v120 = v7;
      v121 = 2048;
      v122 = v103;
      v123 = 2048;
      v124 = v104;
      v125 = 2048;
      v126 = v105;
      _os_log_debug_impl(&dword_1A07F4000, v101, OS_LOG_TYPE_DEBUG, "_PSSuggester: For handle %@, interaction count: incoming %tu (%tu), outgoing %tu", buf, 0x2Au);
    }

    v64 = -[_PSInteractionInformation initWithHandle:interactionInformation:]([_PSInteractionInformation alloc], "initWithHandle:interactionInformation:", v7, v26);
    v63 = v111;
    v9 = v112;
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[_PSSuggester(InteractionInformation) interactionCountForHandle:fetchLimit:interactionStoreDB:].cold.1(v63);
    v64 = 0;
  }

  return v64;
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_177);
  return (id)_dateFormatter_dateFormatter;
}

- (BOOL)interactionAvailableForHandle:(id)a3
{
  return -[_PSSuggester interactionAvailableForHandle:interactionStoreDB:](self, "interactionAvailableForHandle:interactionStoreDB:", a3, 0);
}

- (BOOL)interactionAvailableForHandle:(id)a3 interactionStoreDB:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0D158E0], "storeWithDirectory:readOnly:", v7, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v18[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:directions:mechanisms:interactionDuration:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:directions:mechanisms:interactionDuration:store:fetchLimit:", v9, &unk_1E442CCE8, &unk_1E442CCD0, v8, 10, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_PSSuggester(InteractionAvailable) interactionAvailableForHandle:interactionStoreDB:].cold.3((uint64_t)v5, v10);
    }
    else
    {
      v17 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:directions:mechanisms:interactionDuration:store:fetchLimit:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandles:directions:mechanisms:interactionDuration:store:fetchLimit:", v13, &unk_1E442CD00, &unk_1E442CCD0, v8, 10, 30.0);
      v11 = objc_claimAutoreleasedReturnValue();

      v14 = -[NSObject count](v11, "count");
      v12 = v14 != 0;
      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[_PSSuggester(InteractionAvailable) interactionAvailableForHandle:interactionStoreDB:].cold.2((uint64_t)v5, v11);

    }
    v12 = 1;
    goto LABEL_15;
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_PSSuggester(InteractionInformation) interactionCountForHandle:fetchLimit:interactionStoreDB:].cold.1(v8);
  v12 = 0;
LABEL_16:

  return v12;
}

- (void)candidatesForShareSheetRanking
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for candidate generation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)suggestInteractionsFromContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for share sheet suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedGlobalSuggestionsFromContext:contactsOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for ranked global suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for ranked Siri NL Contact Suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedZKWSuggestionsFromContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for ranked ZKW suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedZKWSuggestionsFromContext:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1A07F4000, a2, OS_LOG_TYPE_ERROR, "Unsupported bundleId %@ for ranked ZKW suggestions", v4, 0xCu);

}

- (void)autocompleteSearchResultsWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for autocompleteSearchResults", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedAutocompleteSuggestionsFromContext:candidates:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for rankedAutocompleteSuggestionsFromContext", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)rankedFamilySuggestions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for rankedFamilySuggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)familyRecommendationSuggestionsWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for familyRecommendationSuggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)photosRelationshipSuggestionsWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for photosRelationshipSuggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for photosContactInferencesSuggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for relativeAppUsageProbabilitiesForCandidateBundleIds", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)provideFeedbackForSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Feedback with unknown action type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)provideFeedbackForSuggestions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Feedback with unknown suggestion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)provideFeedbackForSuggestions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_1A07F4000, v0, v1, "Share Sheet feedback is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)buildFilteringPredicateMatchingSuggestLessFeedback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "SuggestLess: could not find domainIdentifier or derivedIntentIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)provideFeedbackForContactsAutocompleteSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Unable to get xpc connection for provideFeedbackForContactsAutocompleteSuggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Cannot log CNAutocomplete feedback outside of coreduetd / knowledge-agent process.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received unrecognized event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'Entered' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'Exited' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'VendedSuggestions' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'TappedSuggestion' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'TypedHandle' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "_PSSuggester: Received 'ErasedHandle' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
