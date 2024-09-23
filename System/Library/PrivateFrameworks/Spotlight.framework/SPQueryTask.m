@implementation SPQueryTask

uint64_t __69__SPQueryTask_updateResultsThroughDelegate_state_unchanged_sections___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushAndPostUpdates");
}

- (unint64_t)queryKind
{
  return self->_queryKind;
}

- (unint64_t)queryIdForFeedback
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SPQueryTask query](self, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "queryIdent");

  return v4;
}

- (SPSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (SPQueryTask)init
{
  SPQueryTask *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  int v6;
  OS_dispatch_queue *v7;
  NSObject *queryProcessor;
  dispatch_queue_t v9;
  OS_dispatch_queue *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SPQueryTask;
  v2 = -[SPQueryTask init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("query results", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = _os_feature_enabled_impl();
    v2->_clientRankAndBlend = v6;
    if (v6)
    {
      v7 = (OS_dispatch_queue *)(id)sQueryQueue_0;
      queryProcessor = v2->_queryProcessor;
      v2->_queryProcessor = v7;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      queryProcessor = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_queue_create("query processor", queryProcessor);
      v10 = v2->_queryProcessor;
      v2->_queryProcessor = (OS_dispatch_queue *)v9;

    }
  }
  return v2;
}

- (void)pushAndPostUpdates
{
  SPQueryResponse *v4;
  os_log_type_t v5;
  unsigned int v6;
  const char *v7;
  NSObject *p_super;
  os_log_type_t v9;
  uint32_t v10;
  unint64_t *p_deferredUpdate;
  unint64_t v12;
  unint64_t v13;
  NSArray *v14;
  NSArray *sections;
  NSString *sessionEntityString;
  void *v17;
  unint64_t v18;
  int v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  void *WeakRetained;
  void *v24;
  os_log_type_t v25;
  _DWORD v26[2];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!atomic_load((unsigned int *)&self->_updatesDisabled))
  {
    p_deferredUpdate = (unint64_t *)&self->_deferredUpdate;
    do
    {
      while (1)
      {
        v12 = atomic_load(p_deferredUpdate);
        v13 = __ldaxr(p_deferredUpdate);
        if (v13 == v12)
          break;
        __clrex();
      }
    }
    while (__stlxr(0, p_deferredUpdate));
    if (!v12)
    {
      SPLogForSPLogCategoryDefault();
      v4 = (SPQueryResponse *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BE84B00] ^ 1;
      if (!os_log_type_enabled(&v4->super, v25))
        goto LABEL_28;
      LOWORD(v26[0]) = 0;
      v7 = "pushAndPostUpdates - nothing to post";
      p_super = &v4->super;
      v9 = v25;
      v10 = 2;
      goto LABEL_4;
    }
    v4 = -[SPQueryResponse initWithTask:]([SPQueryResponse alloc], "initWithTask:", self);
    v14 = *(NSArray **)(v13 + 8);
    if (v14)
    {
      sections = self->_sections;
      self->_sections = v14;

    }
    if (*(_QWORD *)v13)
    {
      sessionEntityString = self->_sessionEntityString;
      self->_sessionEntityString = *(NSString **)v13;

    }
    v17 = (void *)-[NSArray copy](self->_sections, "copy");
    -[SPQueryResponse setResultSections:](v4, "setResultSections:", v17);

    -[SPQueryResponse setSessionEntityString:](v4, "setSessionEntityString:", self->_sessionEntityString);
    v18 = *(_QWORD *)(v13 + 24);
    -[SPQueryResponse setState:](v4, "setState:", v18);
    self->_state = v18;
    v19 = *(unsigned __int8 *)(v13 + 16);
    SPLogForSPLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE84B00] ^ 1;
    v22 = os_log_type_enabled(v20, v21);
    if (v19)
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_2279CC000, v20, v21, "Post clear", (uint8_t *)v26, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "resultsDidBecomeInvalid:", self);
      objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logWithBundleID:indexOperation:itemCount:reason:", CFSTR("com.apple.SpotlightUI"), 4, 1, CFSTR("UserInput"));

    }
    else
    {
      if (v22)
      {
        LOWORD(v26[0]) = 0;
        _os_log_impl(&dword_2279CC000, v20, v21, "Post updates", (uint8_t *)v26, 2u);
      }

      -[SPQueryResponse setKind:](v4, "setKind:", *(unsigned __int8 *)(v13 + 32));
      -[SPQueryTask postSearchAgentUpdatedResultsToDelegate:](self, "postSearchAgentUpdatedResultsToDelegate:", v4);
      if (self->_state - 1 > 1)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x24BDC2430], "sharedInstance");
      WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "logWithBundleID:indexOperation:itemCount:reason:", CFSTR("com.apple.SpotlightUI"), 5, 1, CFSTR("UserInput"));
    }

LABEL_27:
    free((void *)v13);
    goto LABEL_28;
  }
  SPLogForSPLogCategoryDefault();
  v4 = (SPQueryResponse *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(&v4->super, v5))
  {
    v6 = atomic_load((unsigned int *)&self->_updatesDisabled);
    v26[0] = 67109120;
    v26[1] = v6;
    v7 = "Skip posting; updates disabled %d.";
    p_super = &v4->super;
    v9 = v5;
    v10 = 8;
LABEL_4:
    _os_log_impl(&dword_2279CC000, p_super, v9, v7, (uint8_t *)v26, v10);
  }
LABEL_28:

}

- (void)postSearchAgentUpdatedResultsToDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v11, "sessionEntityString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BE3D0C8]);
    objc_msgSend(v11, "sessionEntityString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithSessionEntityString:", v8);

    objc_msgSend(MEMORY[0x24BE3D0C0], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSharedMapsUserSessionEntity:shareSessionIDWithMaps:", v9, 1);

  }
  objc_msgSend(WeakRetained, "didReceiveResponse:", v11);

}

- (NSMutableArray)mutableSections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 unchanged:(BOOL)a5 sections:(id)a6
{
  _BOOL4 v6;
  NSObject *queryProcessor;
  id v11;
  void *v12;
  id WeakRetained;
  char v14;
  void *v15;
  _QWORD *v16;
  id v17;
  id v18;
  unint64_t *p_deferredUpdate;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  const void *v23;
  NSObject *dispatchQueue;
  dispatch_block_t v25;
  _QWORD block[5];

  v6 = a5;
  queryProcessor = self->_queryProcessor;
  v11 = a6;
  dispatch_assert_queue_V2(queryProcessor);
  -[SPQueryTask retainAndMergeSections:forState:](self, "retainAndMergeSections:forState:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SPQueryTask readyToUpdate](self, "readyToUpdate"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[SPQueryTask unsafeSessionEntityString](self, "unsafeSessionEntityString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = malloc_type_malloc(0x28uLL, 0x10600402A2A81BBuLL);
      if (v15)
        v17 = v15;
      *v16 = v15;
      if (v12)
        v18 = v12;
      v16[1] = v12;
      *((_BYTE *)v16 + 16) = a3;
      v16[3] = a4;
      p_deferredUpdate = (unint64_t *)&self->_deferredUpdate;
      *((_BYTE *)v16 + 32) = v6;
      if (v6)
      {
        do
        {
          while (1)
          {
            v20 = atomic_load(p_deferredUpdate);
            v21 = __ldaxr(p_deferredUpdate);
            if (v21 == v20)
              break;
            __clrex();
          }
        }
        while (__stlxr(0, p_deferredUpdate));
        if (v20)
          *((_BYTE *)v16 + 32) = 0;
        atomic_store((unint64_t)v16, p_deferredUpdate);
      }
      else
      {
        do
        {
          while (1)
          {
            v20 = atomic_load(p_deferredUpdate);
            v22 = __ldaxr(p_deferredUpdate);
            if (v22 == v20)
              break;
            __clrex();
          }
        }
        while (__stlxr((unint64_t)v16, p_deferredUpdate));
      }
      if (v20)
      {
        v23 = *(const void **)(v20 + 8);
        if (v23)
          CFRelease(v23);
        if (*(_QWORD *)v20)
          CFRelease(*(CFTypeRef *)v20);
        free((void *)v20);
      }
      else
      {
        dispatchQueue = self->_dispatchQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __69__SPQueryTask_updateResultsThroughDelegate_state_unchanged_sections___block_invoke;
        block[3] = &unk_24F01B428;
        block[4] = self;
        v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
        dispatch_async(dispatchQueue, v25);

      }
    }
  }

}

- (void)updateResultsThroughDelegate:(BOOL)a3 state:(unint64_t)a4 sections:(id)a5
{
  -[SPQueryTask updateResultsThroughDelegate:state:unchanged:sections:](self, "updateResultsThroughDelegate:state:unchanged:sections:", a3, a4, 0, a5);
}

- (id)retainAndMergeSections:(id)a3 forState:(unint64_t)a4
{
  return a3;
}

- (BOOL)readyToUpdate
{
  return 1;
}

- (OS_dispatch_queue)queryProcessor
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMutableSections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SPQueryTaskDelegate)delegate
{
  return (SPQueryTaskDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.searchd"));
  v3 = (void *)sUserDefaults;
  sUserDefaults = v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("query queue", v6);
  v5 = (void *)sQueryQueue_0;
  sQueryQueue_0 = (uint64_t)v4;

}

+ (id)queryQueue
{
  return (id)sQueryQueue_0;
}

- (NSString)searchString
{
  return 0;
}

- (void)enableUpdates
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__SPQueryTask_enableUpdates__block_invoke;
  block[3] = &unk_24F01B428;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SPQueryTask_enableUpdates__block_invoke(uint64_t a1)
{
  int v1;
  unsigned int *v3;
  unsigned int v4;
  NSObject *v5;
  os_log_type_t v6;
  unsigned int v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  if (v1 <= 0)
    __28__SPQueryTask_enableUpdates__block_invoke_cold_1();
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 - 1, v3));
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v5, v6))
  {
    v7 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
    v9[0] = 67109120;
    v9[1] = v7;
    _os_log_impl(&dword_2279CC000, v5, v6, "Enable updates %d", (uint8_t *)v9, 8u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "pushAndPostUpdates");
}

- (void)disableUpdates
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__SPQueryTask_disableUpdates__block_invoke;
  block[3] = &unk_24F01B428;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

void __29__SPQueryTask_disableUpdates__block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  NSObject *v4;
  os_log_type_t v5;
  unsigned int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 8);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE84B00] ^ 1;
  if (os_log_type_enabled(v4, v5))
  {
    v6 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_2279CC000, v4, v5, "Disable updates %d", (uint8_t *)v7, 8u);
  }

}

- (BOOL)forceStableResults
{
  return self->_forceStableResults;
}

- (void)setForceStableResults:(BOOL)a3
{
  self->_forceStableResults = a3;
}

- (unint64_t)maxTopHitAppResults
{
  return self->_maxTopHitAppResults;
}

- (void)setMaxTopHitAppResults:(unint64_t)a3
{
  self->_maxTopHitAppResults = a3;
}

- (unint64_t)whyQuery
{
  return self->_whyQuery;
}

- (void)setWhyQuery:(unint64_t)a3
{
  self->_whyQuery = a3;
}

- (void)setQueryKind:(unint64_t)a3
{
  self->_queryKind = a3;
}

- (int64_t)maxUISuggestions
{
  return self->_maxUISuggestions;
}

- (void)setMaxUISuggestions:(int64_t)a3
{
  self->_maxUISuggestions = a3;
}

- (SPSearchQueryContext)previousQueryContext
{
  return self->_previousQueryContext;
}

- (void)setPreviousQueryContext:(id)a3
{
  objc_storeStrong((id *)&self->_previousQueryContext, a3);
}

- (NSString)rankingDebugLog
{
  return self->_rankingDebugLog;
}

- (void)setRankingDebugLog:(id)a3
{
  objc_storeStrong((id *)&self->_rankingDebugLog, a3);
}

- (BOOL)live
{
  return self->_live;
}

- (void)setLive:(BOOL)a3
{
  self->_live = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSString)sessionEntityString
{
  return self->_sessionEntityString;
}

- (void)setSessionEntityString:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEntityString, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)unsafeSections
{
  return self->_unsafeSections;
}

- (NSArray)unsafeCombinedSuggestions
{
  return self->_unsafeCombinedSuggestions;
}

- (NSArray)unsafeParsecSuggestions
{
  return self->_unsafeParsecSuggestions;
}

- (NSString)unsafeSessionEntityString
{
  return self->_unsafeSessionEntityString;
}

- (void)setQueryProcessor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (SPDaemonQueryToken)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (unint64_t)unsafeState
{
  return self->_unsafeState;
}

- (void)setUnsafeState:(unint64_t)a3
{
  self->_unsafeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_queryProcessor, 0);
  objc_storeStrong((id *)&self->_unsafeSessionEntityString, 0);
  objc_storeStrong((id *)&self->_unsafeParsecSuggestions, 0);
  objc_storeStrong((id *)&self->_unsafeCombinedSuggestions, 0);
  objc_storeStrong((id *)&self->_unsafeSections, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionEntityString, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_rankingDebugLog, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_mutableSections, 0);
  objc_storeStrong((id *)&self->_previousQueryContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __28__SPQueryTask_enableUpdates__block_invoke_cold_1()
{
  __assert_rtn("-[SPQueryTask enableUpdates]_block_invoke", "SPQueryTask.m", 125, "_updatesDisabled>0");
}

@end
