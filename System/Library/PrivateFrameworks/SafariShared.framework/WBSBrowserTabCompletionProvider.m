@implementation WBSBrowserTabCompletionProvider

- (WBSBrowserTabCompletionProvider)init
{
  WBSBrowserTabCompletionProvider *v2;
  WBSBrowserTabCompletionProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WBSBrowserTabCompletionProvider;
  v2 = -[WBSBrowserTabCompletionProvider init](&v5, sel_init);
  if (v2)
  {
    if (-[WBSBrowserTabCompletionProvider init]::onceToken != -1)
      dispatch_once(&-[WBSBrowserTabCompletionProvider init]::onceToken, &__block_literal_global_5);
    v3 = v2;
  }

  return v2;
}

uint64_t __39__WBSBrowserTabCompletionProvider_init__block_invoke()
{
  return +[WBSURLCompletionDatabase initializeURLCompletionOnMainThread](WBSURLCompletionDatabase, "initializeURLCompletionOnMainThread");
}

- (void)_prepareQueue
{
  NSOperationQueue *queue;
  NSOperationQueue *v4;
  NSOperationQueue *v5;
  id v6;

  queue = self->_queue;
  if (queue)
  {
    -[NSOperationQueue cancelAllOperations](queue, "cancelAllOperations");
  }
  else
  {
    v4 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    v5 = self->_queue;
    self->_queue = v4;

    -[NSOperationQueue setQualityOfService:](self->_queue, "setQualityOfService:", 17);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.operationQueue"), objc_opt_class(), self);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setName:](self->_queue, "setName:");

  }
}

- (NSArray)tabInfos
{
  NSArray *tabInfos;
  id WeakRetained;
  NSArray *v5;
  NSArray *v6;

  tabInfos = self->_tabInfos;
  if (!tabInfos)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "tabInfosForBrowserTabCompletionProvider:", self);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_tabInfos;
    self->_tabInfos = v5;

    tabInfos = self->_tabInfos;
  }
  return tabInfos;
}

- (id)selectedTabInfo
{
  WBSBrowserTabCompletionInfo *selectedTabInfo;
  id WeakRetained;
  WBSBrowserTabCompletionInfo *v5;
  WBSBrowserTabCompletionInfo *v6;

  selectedTabInfo = self->_selectedTabInfo;
  if (!selectedTabInfo)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "selectedTabInfoForBrowserTabCompletionProvider:", self);
    v5 = (WBSBrowserTabCompletionInfo *)objc_claimAutoreleasedReturnValue();
    v6 = self->_selectedTabInfo;
    self->_selectedTabInfo = v5;

    selectedTabInfo = self->_selectedTabInfo;
  }
  return selectedTabInfo;
}

- (void)setCurrentQuery:(id)a3 forQueryID:(int64_t)a4
{
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSString *currentQuery;
  NSArray *v10;
  NSArray *currentTabCompletionMatches;
  NSString *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSOperationQueue *queue;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24[2];
  id location;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(v6, "length");
  currentQuery = self->_currentQuery;
  if (v8)
  {
    if (!objc_msgSend(v6, "isEqualToString:", currentQuery))
    {
      -[WBSBrowserTabCompletionProvider _prepareQueue](self, "_prepareQueue");
      currentTabCompletionMatches = self->_currentTabCompletionMatches;
      self->_currentTabCompletionMatches = 0;

      v12 = (NSString *)objc_msgSend(v6, "copy");
      v13 = self->_currentQuery;
      self->_currentQuery = v12;

      -[WBSBrowserTabCompletionProvider tabInfos](self, "tabInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "copy");

      -[WBSBrowserTabCompletionProvider selectedTabInfo](self, "selectedTabInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      queue = self->_queue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke;
      v20[3] = &unk_1E4B2A338;
      objc_copyWeak(v24, &location);
      v21 = v6;
      v18 = v15;
      v22 = v18;
      v23 = v16;
      v24[1] = (id)a4;
      v19 = v16;
      -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v20);

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);

      goto LABEL_8;
    }
    if (!self->_currentTabCompletionMatches)
      goto LABEL_8;
  }
  else
  {
    self->_currentQuery = 0;

    v10 = self->_currentTabCompletionMatches;
    self->_currentTabCompletionMatches = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  objc_msgSend(WeakRetained, "didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:", self);
LABEL_8:

}

void __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_matchesForQuery:tabInfos:selectedTabInfo:forQueryID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke_2;
    block[3] = &unk_1E4B2A310;
    objc_copyWeak(&v12, v2);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v11 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v12);
  }

}

void __62__WBSBrowserTabCompletionProvider_setCurrentQuery_forQueryID___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  char v4;
  uint64_t v5;
  id v6;
  id v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_isOperationValidForQuery:tabInfos:selectedTabInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v3 = v8;
    if ((v4 & 1) != 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 56), "copy");
      v6 = v8[7];
      v8[7] = (id)v5;

      v7 = objc_loadWeakRetained(v8 + 5);
      objc_msgSend(v7, "didFindMatchesForCurrentQueryInBrowserTabCompletionProvider:", v8);

      v3 = v8;
    }
  }

}

- (void)tabCompletionMatchesForQuery:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, NSArray *);
  NSArray *currentTabCompletionMatches;
  NSArray *v9;
  NSString *v10;
  NSString *currentQuery;
  void *v12;
  void *v13;
  NSOperationQueue *queue;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(id, NSArray *);
  id v20;
  id location;

  v6 = a3;
  v7 = (void (**)(id, NSArray *))a4;
  if (objc_msgSend(v6, "isEqualToString:", self->_currentQuery))
  {
    if (self->_currentTabCompletionMatches)
      currentTabCompletionMatches = self->_currentTabCompletionMatches;
    else
      currentTabCompletionMatches = (NSArray *)MEMORY[0x1E0C9AA60];
    v7[2](v7, currentTabCompletionMatches);
  }
  else
  {
    -[WBSBrowserTabCompletionProvider _prepareQueue](self, "_prepareQueue");
    v9 = self->_currentTabCompletionMatches;
    self->_currentTabCompletionMatches = 0;

    v10 = (NSString *)objc_msgSend(v6, "copy");
    currentQuery = self->_currentQuery;
    self->_currentQuery = v10;

    -[WBSBrowserTabCompletionProvider tabInfos](self, "tabInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_initWeak(&location, self);
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke;
    v16[3] = &unk_1E4B2A388;
    objc_copyWeak(&v20, &location);
    v19 = v7;
    v17 = v6;
    v18 = v13;
    v15 = v13;
    -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v16);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

void __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_matchesForQuery:tabInfos:selectedTabInfo:forQueryID:", a1[4], a1[5], 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke_2;
    block[3] = &unk_1E4B2A360;
    objc_copyWeak(&v12, v2);
    v11 = a1[6];
    v8 = a1[4];
    v9 = a1[5];
    v10 = v5;
    v6 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v12);
  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __82__WBSBrowserTabCompletionProvider_tabCompletionMatchesForQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "_isOperationValidForQuery:tabInfos:selectedTabInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0) & 1) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 48), "copy");
    v3 = (void *)WeakRetained[7];
    WeakRetained[7] = v2;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)invalidate
{
  NSArray *tabInfos;
  WBSBrowserTabCompletionInfo *selectedTabInfo;
  NSArray *currentTabCompletionMatches;
  NSString *currentQuery;

  -[NSOperationQueue cancelAllOperations](self->_queue, "cancelAllOperations");
  tabInfos = self->_tabInfos;
  self->_tabInfos = 0;

  selectedTabInfo = self->_selectedTabInfo;
  self->_selectedTabInfo = 0;

  currentTabCompletionMatches = self->_currentTabCompletionMatches;
  self->_currentTabCompletionMatches = 0;

  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

}

- (id)bestTabCompletionMatchWithTopHitURL:(id)a3
{
  -[WBSBrowserTabCompletionProvider bestTabCompletionMatchFromMatches:withTopHitURL:](self, "bestTabCompletionMatchFromMatches:withTopHitURL:", self->_currentTabCompletionMatches, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestTabCompletionMatchFromMatches:(id)a3 withTopHitURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v26 = v6;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setHighlyRelevant:", 0);
    objc_msgSend(v28, "safari_userVisibleHostWithoutWWWSubdomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      obj = v6;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v30;
LABEL_5:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          objc_msgSend(v13, "tabGroupUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (!v15)
            break;
          objc_msgSend(v13, "windowUUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSBrowserTabCompletionInfo windowUUID](self->_selectedTabInfo, "windowUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if ((v18 & 1) == 0)
            break;
          objc_msgSend(v13, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "safari_isTopLevelURL");

          if ((v20 & 1) != 0)
          {
            objc_msgSend(v13, "url");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "safari_userVisibleHostWithoutWWWSubdomain");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v9, "isEqualToString:", v22);

            if (v23)
            {
              objc_msgSend(v13, "setHighlyRelevant:", 1);
              v24 = v13;

              goto LABEL_16;
            }
          }
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v10)
              goto LABEL_5;
            break;
          }
        }
      }

    }
    v24 = v8;
LABEL_16:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)_matchesForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5 forQueryID:(int64_t)a6
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id WeakRetained;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  WBSBrowserTabCompletionMatch *v31;
  id v33;
  id v35;
  id obj;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v13, "url");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "url");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqual:", v18) & 1) == 0)
          {

LABEL_11:
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            if ((objc_opt_respondsToSelector() & 1) == 0
              || (objc_msgSend(v13, "url"),
                  v23 = (void *)objc_claimAutoreleasedReturnValue(),
                  v24 = objc_msgSend(WeakRetained, "browserTabCompletionProvider:doesURLRepresentNativeContent:", self, v23), v23, (v24 & 1) == 0))
            {
              objc_msgSend(v13, "url");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "safari_isSafariExtensionURL");

              if (!v26)
                goto LABEL_18;
              if ((objc_opt_respondsToSelector() & 1) == 0
                || (objc_msgSend(v13, "url"),
                    v27 = (void *)objc_claimAutoreleasedReturnValue(),
                    v28 = objc_msgSend(WeakRetained, "browserTabCompletionProvider:shouldExtensionURLAppearAsSwitchToTabItem:", self, v27), v27, (v28 & 1) != 0))
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  objc_msgSend(v13, "url");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(WeakRetained, "browserTabCompletionProvider:alternativeDisplayTextForURLForExtensionURL:", self, v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_19;
                }
LABEL_18:
                v30 = 0;
LABEL_19:
                v31 = -[WBSBrowserTabCompletionMatch initWithTabInfo:userTypedString:alternativeDisplayTextForURL:forQueryID:]([WBSBrowserTabCompletionMatch alloc], "initWithTabInfo:userTypedString:alternativeDisplayTextForURL:forQueryID:", v13, v35, v30, a6);
                if (v31)
                  objc_msgSend(v33, "addObject:", v31);

              }
            }

            continue;
          }
          objc_msgSend(v13, "title");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "isEqual:", v20);

          if ((v21 & 1) == 0)
            goto LABEL_11;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v10);
  }

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __88__WBSBrowserTabCompletionProvider__matchesForQuery_tabInfos_selectedTabInfo_forQueryID___block_invoke;
  v38[3] = &unk_1E4B2A3B0;
  v38[4] = self;
  objc_msgSend(v33, "sortUsingComparator:", v38);

  return v33;
}

uint64_t __88__WBSBrowserTabCompletionProvider__matchesForQuery_tabInfos_selectedTabInfo_forQueryID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareTabMatch:otherTabMatch:", a2, a3);
}

- (BOOL)_isOperationValidForQuery:(id)a3 tabInfos:(id)a4 selectedTabInfo:(id)a5
{
  id v8;
  NSArray *v9;
  WBSBrowserTabCompletionInfo *v10;
  BOOL v11;

  v8 = a3;
  v9 = (NSArray *)a4;
  v10 = (WBSBrowserTabCompletionInfo *)a5;
  v11 = (objc_msgSend(v8, "isEqualToString:", self->_currentQuery) & 1) != 0
     && (self->_tabInfos == v9 || -[NSArray isEqualToArray:](v9, "isEqualToArray:"))
     && self->_selectedTabInfo == v10;

  return v11;
}

- (int64_t)_compareTabMatch:(id)a3 otherTabMatch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "tabGroupUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "tabGroupUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 || !v9)
  {
    if (v8 && !v9)
    {
      v10 = 1;
      goto LABEL_14;
    }
    -[WBSBrowserTabCompletionInfo windowUUID](self->_selectedTabInfo, "windowUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", v11);

    objc_msgSend(v7, "windowUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", v11);

    v16 = v13 ^ 1;
    if (((v13 ^ 1 | v15) & 1) == 0)
      goto LABEL_10;
    v17 = v15 ^ 1;
    if ((v13 | v15 ^ 1) == 1)
    {
      v18 = objc_msgSend(v6, "matchLocation");
      if (v18 > objc_msgSend(v7, "matchLocation"))
      {
LABEL_10:
        v10 = -1;
        goto LABEL_13;
      }
      v19 = objc_msgSend(v6, "matchLocation");
      if (v19 >= objc_msgSend(v7, "matchLocation"))
      {
        objc_msgSend(v6, "url");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "safari_isTopLevelURL");

        objc_msgSend(v7, "url");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "safari_isTopLevelURL");

        if (((v22 ^ 1 | v24) & 1) == 0)
          goto LABEL_10;
        if ((v22 | v24 ^ 1) == 1)
        {
          objc_msgSend(v6, "tabGroupUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {

          }
          else
          {
            objc_msgSend(v7, "tabGroupUUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v26)
              v27 = 1;
            else
              v27 = v16;
            if (((v27 | v17) & 1) == 0)
            {
              v28 = -[WBSBrowserTabCompletionProvider _distanceFromSelectedTabForTabMatch:](self, "_distanceFromSelectedTabForTabMatch:", v6);
              v29 = -[WBSBrowserTabCompletionProvider _distanceFromSelectedTabForTabMatch:](self, "_distanceFromSelectedTabForTabMatch:", v7);
              v30 = -1;
              if (v28 >= v29)
                v30 = 1;
              if (v28 == v29)
                v10 = 0;
              else
                v10 = v30;
              goto LABEL_13;
            }
          }
          v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
    }
    v10 = 1;
    goto LABEL_13;
  }
  v10 = -1;
LABEL_14:

  return v10;
}

- (unint64_t)_distanceFromSelectedTabForTabMatch:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[WBSBrowserTabCompletionInfo tabIndex](self->_selectedTabInfo, "tabIndex");
  v6 = objc_msgSend(v4, "tabIndex");
  if ((uint64_t)(v5 - v6) >= 0)
    v7 = v5 - v6;
  else
    v7 = v6 - v5;

  return v7;
}

- (WBSBrowserTabCompletionProviderSource)dataSource
{
  return (WBSBrowserTabCompletionProviderSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (WBSBrowserTabCompletionProviderDelegate)delegate
{
  return (WBSBrowserTabCompletionProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentQuery
{
  return self->_currentQuery;
}

- (NSArray)currentTabCompletionMatches
{
  return self->_currentTabCompletionMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTabCompletionMatches, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_selectedTabInfo, 0);
  objc_storeStrong((id *)&self->_tabInfos, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
