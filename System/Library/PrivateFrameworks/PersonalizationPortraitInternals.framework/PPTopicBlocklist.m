@implementation PPTopicBlocklist

- (PPTopicBlocklist)initWithTrialWrapper:(id)a3
{
  id v5;
  PPTopicBlocklist *v6;
  PPTopicBlocklist *v7;
  PPTrialWrapper *trialWrapper;
  uint64_t v9;
  TRINotificationToken *trialToken;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPTopicBlocklist;
  v6 = -[PPTopicBlocklist init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialWrapper, a3);
    -[PPTopicBlocklist _loadAssetData]((uint64_t)v7);
    location = 0;
    objc_initWeak(&location, v7);
    trialWrapper = v7->_trialWrapper;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PPTopicBlocklist_initWithTrialWrapper___block_invoke;
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
  v3.super_class = (Class)PPTopicBlocklist;
  -[PPTopicBlocklist dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldBlock:(id)a3
{
  return -[_PASCFBurstTrie payloadForString:](self->_blocklistTrie, "payloadForString:", a3) != 0;
}

- (id)indicesOfBlockedTopicsInRecordArray:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PPTopicBlocklist_indicesOfBlockedTopicsInRecordArray___block_invoke;
  v4[3] = &unk_1E7E1C2C0;
  v4[4] = self;
  objc_msgSend(a3, "indexesOfObjectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)indicesOfBlockedTopicsInScoredTopicArray:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__PPTopicBlocklist_indicesOfBlockedTopicsInScoredTopicArray___block_invoke;
  v4[3] = &unk_1E7E1C2E8;
  v4[4] = self;
  objc_msgSend(a3, "indexesOfObjectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_blocklistTrie, 0);
}

uint64_t __61__PPTopicBlocklist_indicesOfBlockedTopicsInScoredTopicArray___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "scoredTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topicIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "shouldBlock:", v5);

  return v6;
}

uint64_t __56__PPTopicBlocklist_indicesOfBlockedTopicsInRecordArray___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topicIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "shouldBlock:", v4);

  return v5;
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
  objc_msgSend(*(id *)(a1 + 16), "filepathForFactor:namespaceName:", CFSTR("topicBlocklist.trie"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pp_topics_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "Loading topic blocklist from \"%@\".", (uint8_t *)&v10, 0xCu);
  }

  if (!v2)
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      v7 = "Failed to read path for topic blocklist.";
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
      v7 = "Failed to initialize topic blocklist trie from file at \"%@\";
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

void __41__PPTopicBlocklist_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PPTopicBlocklist _loadAssetData]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_16214 != -1)
    dispatch_once(&sharedInstance__pasOnceToken2_16214, &__block_literal_global_16215);
  return (id)sharedInstance__pasExprOnceResult_16216;
}

void __34__PPTopicBlocklist_sharedInstance__block_invoke()
{
  void *v0;
  PPTopicBlocklist *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = [PPTopicBlocklist alloc];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[PPTopicBlocklist initWithTrialWrapper:](v1, "initWithTrialWrapper:", v2);
  v4 = (void *)sharedInstance__pasExprOnceResult_16216;
  sharedInstance__pasExprOnceResult_16216 = v3;

  objc_autoreleasePoolPop(v0);
}

@end
