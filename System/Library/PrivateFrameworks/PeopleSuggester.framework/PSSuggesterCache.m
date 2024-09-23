@implementation PSSuggesterCache

void __48___PSSuggesterCache_initWithMaxSuggestionCount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 1));
    v3 = v2[8];
    v2[8] = v3 + 1;
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        v6 = v2[9];
        v8 = 134218240;
        v9 = v3;
        v10 = 2048;
        v11 = v6;
        _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Timer tick: Refreshing cache (ticks=%tu, fetches=%tu)", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(v2, "refetch");
    }
    else
    {
      if (v5)
      {
        v7 = v2[9];
        v8 = 134218240;
        v9 = 0;
        v10 = 2048;
        v11 = v7;
        _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "_PSSuggesterCache: Timer tick: Initial fetch (ticks=%tu, fetches=%tu)", (uint8_t *)&v8, 0x16u);
      }

      objc_msgSend(v2, "performInitialFetchIfNeeded");
    }
  }

}

void __58___PSSuggesterCache_defaultServiceWithMaxSuggestionCount___block_invoke(uint64_t a1)
{
  void *v2;
  _PSSuggesterCache *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1A1AFCA24]();
  v3 = -[_PSSuggesterCache initWithMaxSuggestionCount:]([_PSSuggesterCache alloc], "initWithMaxSuggestionCount:", *(_QWORD *)(a1 + 32));
  v4 = (void *)defaultServiceWithMaxSuggestionCount___pasExprOnceResult;
  defaultServiceWithMaxSuggestionCount___pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

uint64_t __38___PSSuggesterCache_backgroundRefetch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refetch");
}

id __29___PSSuggesterCache__refetch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v2, "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@\n%@"), v4, CFSTR("Cached Suggestion"));
  objc_msgSend(v2, "setReason:", v5);

  return v2;
}

@end
