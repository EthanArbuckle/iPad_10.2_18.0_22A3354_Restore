@implementation SFSuggestedUserProvider

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_10);
  return (id)sharedProvider_provider;
}

void __41__SFSuggestedUserProvider_sharedProvider__block_invoke()
{
  SFSuggestedUserProvider *v0;
  void *v1;

  v0 = objc_alloc_init(SFSuggestedUserProvider);
  v1 = (void *)sharedProvider_provider;
  sharedProvider_provider = (uint64_t)v0;

}

- (SFSuggestedUserProvider)init
{
  SFSuggestedUserProvider *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  SFSuggestedUserProvider *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFSuggestedUserProvider;
  v2 = -[SFSuggestedUserProvider init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.SafariFoundation.%@.%p"), v5, v2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__accountStoreChangedNotification_, *MEMORY[0x24BE82FE8], 0);

    v10 = v2;
  }

  return v2;
}

- (void)_accountStoreChangedNotification:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SFSuggestedUserProvider__accountStoreChangedNotification___block_invoke;
  block[3] = &unk_24C935460;
  block[4] = self;
  dispatch_async(queue, block);
}

void __60__SFSuggestedUserProvider__accountStoreChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

- (id)_allCachedSuggestedUsersWithType:(int64_t)a3
{
  NSArray *suggestedNonEmails;
  NSArray *v5;
  NSArray *v6;

  if (a3)
  {
    if (a3 == 2)
    {
      suggestedNonEmails = self->_suggestedNonEmails;
      goto LABEL_13;
    }
    if (a3 == 1)
    {
      suggestedNonEmails = self->_suggestedEmails;
LABEL_13:
      v6 = suggestedNonEmails;
      return v6;
    }
  }
  else if (!self->_suggestedEmails || !self->_suggestedNonEmails)
  {
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_suggestedEmails)
    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:");
  if (self->_suggestedNonEmails)
    -[NSArray addObjectsFromArray:](v6, "addObjectsFromArray:");
  -[NSArray sortUsingSelector:](v6, "sortUsingSelector:", sel_compare_);
  return v6;
}

- (id)_cachedSuggestedUsersWithType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v8 = a4;
  -[SFSuggestedUserProvider _allCachedSuggestedUsersWithType:](self, "_allCachedSuggestedUsersWithType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __76__SFSuggestedUserProvider__cachedSuggestedUsersWithType_matchingText_limit___block_invoke;
    v13[3] = &unk_24C936538;
    v14 = v8;
    objc_msgSend(v9, "safari_filterObjectsUsingBlock:", v13);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (objc_msgSend(v9, "count") < a5)
    a5 = objc_msgSend(v9, "count");
  objc_msgSend(v9, "subarrayWithRange:", 0, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __76__SFSuggestedUserProvider__cachedSuggestedUsersWithType_matchingText_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safari_hasCaseInsensitivePrefix:", *(_QWORD *)(a1 + 32)))
    v4 = objc_msgSend(v3, "safari_isCaseInsensitiveEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;
  else
    v4 = 0;

  return v4;
}

- (void)suggestedUsersOfType:(int64_t)a3 completionHandler:(id)a4
{
  -[SFSuggestedUserProvider suggestedUsersOfType:matchingText:limit:completionHandler:](self, "suggestedUsersOfType:matchingText:limit:completionHandler:", a3, 0, 2, a4);
}

- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 completionHandler:(id)a5
{
  -[SFSuggestedUserProvider suggestedUsersOfType:matchingText:limit:completionHandler:](self, "suggestedUsersOfType:matchingText:limit:completionHandler:", a3, 0, 2, a5);
}

- (void)suggestedUsersOfType:(int64_t)a3 matchingText:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;
  unint64_t v17;

  v10 = a4;
  v11 = a6;
  if (v11)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __85__SFSuggestedUserProvider_suggestedUsersOfType_matchingText_limit_completionHandler___block_invoke;
    block[3] = &unk_24C936560;
    block[4] = self;
    v16 = a3;
    v14 = v10;
    v17 = a5;
    v15 = v11;
    dispatch_async(queue, block);

  }
}

void __85__SFSuggestedUserProvider_suggestedUsersOfType_matchingText_limit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "_cachedSuggestedUsersWithType:matchingText:limit:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "savedAccountsWithPasswords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = 0;
    objc_msgSend(v3, "_getSuggestedUsersFromSavedAccounts:suggestedEmails:suggestedNonEmails:", v5, &v17, &v16);
    v6 = v17;
    v7 = v16;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = v6;
    v10 = v6;

    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = v7;
    v13 = v7;

    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_cachedSuggestedUsersWithType:matchingText:limit:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

  }
}

- (void)_getSuggestedUsersFromSavedAccounts:(id)a3 suggestedEmails:(id *)a4 suggestedNonEmails:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __98__SFSuggestedUserProvider__getSuggestedUsersFromSavedAccounts_suggestedEmails_suggestedNonEmails___block_invoke;
  v30[3] = &unk_24C936588;
  v23 = v8;
  v31 = v23;
  v10 = v9;
  v32 = v10;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BBA4A8](v30);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "user");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "length") && (objc_msgSend(v17, "userIsNeverSaveMarker") & 1) == 0)
        {
          if ((objc_msgSend(v6, "containsObject:", v18) & 1) != 0
            || (objc_msgSend(v7, "containsObject:", v18) & 1) == 0
            && (objc_msgSend(v18, "safari_looksLikeEmailAddress") & 1) != 0)
          {
            v19 = v6;
            v20 = 1;
          }
          else
          {
            v19 = v7;
            v20 = 2;
          }
          objc_msgSend(v19, "addObject:", v18);
          ((void (**)(_QWORD, uint64_t, void *))v11)[2](v11, v20, v18);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v14);
  }

  objc_msgSend(v23, "allValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "allValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sortedArrayUsingSelector:", sel_compare_);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

}

void __98__SFSuggestedUserProvider__getSuggestedUsersFromSavedAccounts_suggestedEmails_suggestedNonEmails___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = 40;
  if (a2 == 1)
    v5 = 32;
  v6 = *(id *)(a1 + v5);
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "setUsageFrequency:", objc_msgSend(v7, "usageFrequency") + 1);
  }
  else
  {
    +[SFSuggestedUser suggestedUserWithValue:type:](SFSuggestedUser, "suggestedUserWithValue:type:", v9, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUsageFrequency:", 1);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedNonEmails, 0);
  objc_storeStrong((id *)&self->_suggestedEmails, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
