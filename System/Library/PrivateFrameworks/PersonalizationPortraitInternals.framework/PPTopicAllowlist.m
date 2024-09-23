@implementation PPTopicAllowlist

- (PPTopicAllowlist)initWithTrialWrapper:(id)a3
{
  id v5;
  PPTopicAllowlist *v6;
  PPTopicAllowlist *v7;
  PPTrialWrapper *trialWrapper;
  uint64_t v9;
  TRINotificationToken *trialToken;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPTopicAllowlist;
  v6 = -[PPTopicAllowlist init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialWrapper, a3);
    -[PPTopicAllowlist _loadAssetData]((uint64_t)v7);
    location = 0;
    objc_initWeak(&location, v7);
    trialWrapper = v7->_trialWrapper;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PPTopicAllowlist_initWithTrialWrapper___block_invoke;
    v12[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v13, &location);
    -[PPTrialWrapper addUpdateHandlerForNamespaceName:block:](trialWrapper, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"), v12);
    v9 = objc_claimAutoreleasedReturnValue();
    trialToken = v7->_trialToken;
    v7->_trialToken = (TRINotificationToken *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PPTrialWrapper removeUpdateHandlerForToken:](self->_trialWrapper, "removeUpdateHandlerForToken:", self->_trialToken);
  v3.receiver = self;
  v3.super_class = (Class)PPTopicAllowlist;
  -[PPTopicAllowlist dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldBypassAllowlist:(id)a3
{
  _PASCFBurstTrie *allowlistTrie;
  void *v4;

  allowlistTrie = self->_allowlistTrie;
  +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(allowlistTrie) = -[_PASCFBurstTrie payloadForString:](allowlistTrie, "payloadForString:", v4);

  return (_DWORD)allowlistTrie != 0;
}

- (id)indicesOfAllowedTopicsInRecordArray:(id)a3 clientProcess:(id)a4
{
  id v6;
  id v7;
  _PASCFBurstTrie *allowlistTrie;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(allowlistTrie) = -[_PASCFBurstTrie payloadForString:](allowlistTrie, "payloadForString:", v9);

  if ((_DWORD)allowlistTrie)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__PPTopicAllowlist_indicesOfAllowedTopicsInRecordArray_clientProcess___block_invoke;
    v12[3] = &unk_1E7E14EC0;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)indicesOfAllowedTopicsInScoredTopicArray:(id)a3 clientProcess:(id)a4
{
  id v6;
  id v7;
  _PASCFBurstTrie *allowlistTrie;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(allowlistTrie) = -[_PASCFBurstTrie payloadForString:](allowlistTrie, "payloadForString:", v9);

  if ((_DWORD)allowlistTrie)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PPTopicAllowlist_indicesOfAllowedTopicsInScoredTopicArray_clientProcess___block_invoke;
    v12[3] = &unk_1E7E14EE8;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v6, "indexesOfObjectsPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)filterTopicDictionary:(id)a3 clientProcess:(id)a4
{
  id v6;
  id v7;
  _PASCFBurstTrie *allowlistTrie;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[5];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(allowlistTrie) = -[_PASCFBurstTrie payloadForString:](allowlistTrie, "payloadForString:", v9);

  if ((_DWORD)allowlistTrie)
  {
    v10 = v6;
  }
  else
  {
    objc_msgSend(v6, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__PPTopicAllowlist_filterTopicDictionary_clientProcess___block_invoke;
    v25[3] = &unk_1E7E14F10;
    v25[4] = self;
    v26 = v7;
    objc_msgSend(v11, "_pas_filteredArrayWithTest:", v25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v18, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v15);
    }

  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_allowlistTrie, 0);
}

+ (id)_keyFor:(uint64_t)a1 of:(void *)a2
{
  id v2;
  __CFString *v3;
  void *v4;

  v2 = a2;
  v3 = CFSTR("/ShouldBypassTopicAllowlist/");
  objc_opt_self();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@"), v2, CFSTR("/ShouldBypassTopicAllowlist/"));

  return v4;
}

BOOL __56__PPTopicAllowlist_filterTopicDictionary_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a2;
  v6 = [v4 alloc];
  objc_msgSend(v5, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("Q%@"), v7);
  v9 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v8);

  return v9;
}

- (BOOL)_topicIsAllowedForClientProcess:(void *)a3 topic:
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  _BOOL8 v9;

  if (!a1)
    return 0;
  v4 = *(void **)(a1 + 8);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", CFSTR("%@/%@"), v7, v6);

  v9 = objc_msgSend(v4, "payloadForString:", v8) != 0;
  return v9;
}

BOOL __75__PPTopicAllowlist_indicesOfAllowedTopicsInScoredTopicArray_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v5);

  return v6;
}

BOOL __70__PPTopicAllowlist_indicesOfAllowedTopicsInRecordArray_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(a2, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v5);

  return v6;
}

- (void)_loadAssetData
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 16), "filepathForFactor:namespaceName:", CFSTR("topicAllowlist.trie"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pp_topics_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "Loading topic allowlist from \"%@\".", (uint8_t *)&v10, 0xCu);
  }

  if (!v2)
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      v7 = "Failed to read path for topic allowlist.";
      v8 = v6;
      v9 = 2;
      goto LABEL_11;
    }
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81548]), "initWithPath:", v2);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;

  if (!*(_QWORD *)(a1 + 8))
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v10 = 138412290;
      v11 = v2;
      v7 = "Failed to initialize topic allowlist trie from file at \"%@\";
      v8 = v6;
      v9 = 12;
LABEL_11:
      _os_log_fault_impl(&dword_1C392E000, v8, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v10, v9);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __41__PPTopicAllowlist_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PPTopicAllowlist _loadAssetData]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_430 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_430, &__block_literal_global_431);
  return (id)sharedInstance__pasExprOnceResult_432;
}

void __34__PPTopicAllowlist_sharedInstance__block_invoke()
{
  void *v0;
  PPTopicAllowlist *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = [PPTopicAllowlist alloc];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PPTopicAllowlist initWithTrialWrapper:](v1, "initWithTrialWrapper:", v2);
  v4 = (void *)sharedInstance__pasExprOnceResult_432;
  sharedInstance__pasExprOnceResult_432 = v3;

  objc_autoreleasePoolPop(v0);
}

@end
