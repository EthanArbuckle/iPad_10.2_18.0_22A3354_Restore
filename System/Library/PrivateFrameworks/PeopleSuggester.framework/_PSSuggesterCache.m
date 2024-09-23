@implementation _PSSuggesterCache

- (_PSSuggesterCache)initWithMaxSuggestionCount:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_source_t v9;
  void *v10;
  void *v11;
  _PSSuggester *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  dispatch_time_t v23;
  NSObject *v24;
  _QWORD v26[4];
  id v27;
  id location;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)_PSSuggesterCache;
  v5 = -[_PSSuggesterCache init](&v29, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple._PSSuggesterCache.queue", v6);
    v8 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v7;

    v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, *((dispatch_queue_t *)v5 + 1));
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    *((_DWORD *)v5 + 14) = 0;
    *((_QWORD *)v5 + 8) = 0;
    *((_QWORD *)v5 + 9) = 0;
    +[_PSSuggesterConfiguration defaultConfiguration](_PSSuggesterConfiguration, "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaximumNumberOfSuggestions:", objc_msgSend(v4, "integerValue"));
    v12 = -[_PSSuggester initWithDaemonUsingConfiguration:]([_PSSuggester alloc], "initWithDaemonUsingConfiguration:", v11);
    v13 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v12;

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_backgroundRefetch, CFSTR("_CDInteractionStoreRecordedShareSheetInteractionNotification"), 0);

    +[_PSConfig defaultConfig](_PSConfig, "defaultConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("cacheUpdateInterval"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20 * 1000000000.0;

    v22 = *((_QWORD *)v5 + 2);
    v23 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v22, v23, (unint64_t)v21, 0xDF8475800uLL);
    objc_initWeak(&location, v5);
    v24 = *((_QWORD *)v5 + 2);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __48___PSSuggesterCache_initWithMaxSuggestionCount___block_invoke;
    v26[3] = &unk_1E4400328;
    objc_copyWeak(&v27, &location);
    dispatch_source_set_event_handler(v24, v26);
    dispatch_resume(*((dispatch_object_t *)v5 + 2));
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);

  }
  return (_PSSuggesterCache *)v5;
}

+ (id)defaultService
{
  return +[_PSSuggesterCache defaultServiceWithMaxSuggestionCount:](_PSSuggesterCache, "defaultServiceWithMaxSuggestionCount:", &unk_1E442AEE0);
}

+ (id)defaultServiceWithMaxSuggestionCount:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___PSSuggesterCache_defaultServiceWithMaxSuggestionCount___block_invoke;
  block[3] = &unk_1E43FEB68;
  v9 = v3;
  v4 = defaultServiceWithMaxSuggestionCount___pasOnceToken8;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&defaultServiceWithMaxSuggestionCount___pasOnceToken8, block);
  v6 = (id)defaultServiceWithMaxSuggestionCount___pasExprOnceResult;

  return v6;
}

- (void)backgroundRefetch
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___PSSuggesterCache_backgroundRefetch__block_invoke;
  block[3] = &unk_1E43FEB68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)performInitialFetchIfNeeded
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cachedPeopleSuggestions)
    -[_PSSuggesterCache _refetch](self, "_refetch");
  os_unfair_lock_unlock(p_lock);
}

- (void)refetch
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_PSSuggesterCache _refetch](self, "_refetch");
  os_unfair_lock_unlock(p_lock);
}

- (void)_refetch
{
  int v3;
  _PSPredictionContext *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *cachedPeopleSuggestions;
  NSString *v13;
  NSString *cachedSessionID;
  NSObject *v15;
  NSArray *v16;
  int v17;
  NSArray *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked");
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = (_PSPredictionContext *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A07F4000, &v4->super, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Not refetching suggestions due to Class C lock.", (uint8_t *)&v17, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A07F4000, &v4->super, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Refetching suggestions", (uint8_t *)&v17, 2u);
    }

    v4 = objc_alloc_init(_PSPredictionContext);
    -[_PSPredictionContext setIsFallbackFetch:](v4, "setIsFallbackFetch:", 1);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPredictionContext setSessionID:](v4, "setSessionID:", v7);

    -[_PSSuggester suggestInteractionsFromContext:](self->_suggester, "suggestInteractionsFromContext:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_cachedContext, v4);
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[_PSPredictionContext sessionID](v4, "sessionID");
      v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v17 = 138412547;
      v18 = v10;
      v19 = 2113;
      v20 = v8;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: fetched suggestions with sessionID %@: %{private}@", (uint8_t *)&v17, 0x16u);

    }
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_21);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedPeopleSuggestions = self->_cachedPeopleSuggestions;
    self->_cachedPeopleSuggestions = v11;

    -[_PSPredictionContext sessionID](v4, "sessionID");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedSessionID = self->_cachedSessionID;
    self->_cachedSessionID = v13;

    ++self->_fetches;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_cachedPeopleSuggestions;
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: updated _cachedPeopleSuggestions: %@", (uint8_t *)&v17, 0xCu);
    }

  }
}

- (id)getCachedSuggestions
{
  return -[_PSSuggesterCache getCachedSuggestionsAndSessionID:](self, "getCachedSuggestionsAndSessionID:", 0);
}

- (id)getCachedSuggestionsAndSessionID:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_cachedPeopleSuggestions;
  if (a3)
    objc_storeStrong(a3, self->_cachedSessionID);
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)getCachedContext
{
  return self->_cachedContext;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("cachedSuggestions: %@, cachedSessionID: %@, cachedContext: %@"), self->_cachedPeopleSuggestions, self->_cachedSessionID, self->_cachedContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPeopleSuggestions, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_cachedSessionID, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
