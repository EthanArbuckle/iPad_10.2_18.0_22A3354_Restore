@implementation WBSSmartHistorySearcher

- (WBSSmartHistorySearcher)initWithTopics:(id)a3
{
  id v4;
  WBSSmartHistorySearcher *v5;
  uint64_t v6;
  NSArray *topics;
  WBSSmartHistorySearcher *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSmartHistorySearcher;
  v5 = -[WBSSmartHistorySearcher init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    topics = v5->_topics;
    v5->_topics = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)_searchItemsInTopic:(id)a3 forText:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = v7;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "historyItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v13, "title");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v13, "title");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "rangeOfString:options:", v8, a5);

          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_10;
        }
        objc_msgSend(v13, "urlString");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v13, "urlString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "rangeOfString:options:", v8, a5);

          if (v21 != 0x7FFFFFFFFFFFFFFFLL)
LABEL_10:
            objc_msgSend(v24, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  return v24;
}

- (id)_searchTopicsForText:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  WBSHistoryTopicTag *v16;
  WBSSmartHistorySearcher *v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v18 = self;
  obj = self->_topics;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "title", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "rangeOfString:options:", v6, a4);

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
        {
          -[WBSSmartHistorySearcher _searchItemsInTopic:forText:options:](v18, "_searchItemsInTopic:forText:options:", v12, v6, a4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
          {
            v16 = -[WBSHistoryTopicTag initWithTag:historyItems:]([WBSHistoryTopicTag alloc], "initWithTag:historyItems:", v12, v15);
            objc_msgSend(v7, "addObject:", v16);

          }
        }
        else
        {
          objc_msgSend(v7, "addObject:", v12);
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v7;
}

- (void)performSearchWithText:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *searchQueue;
  id v11;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17[2];
  id location;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak(&location, self);
    searchQueue = self->_searchQueue;
    if (!searchQueue)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p.searchQueue"), objc_opt_class(), self);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
      v13 = self->_searchQueue;
      self->_searchQueue = v12;

      searchQueue = self->_searchQueue;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__WBSSmartHistorySearcher_performSearchWithText_options_completionHandler___block_invoke;
    block[3] = &unk_1E4B3FB98;
    objc_copyWeak(v17, &location);
    v16 = v9;
    v15 = v8;
    v17[1] = (id)a4;
    dispatch_async(searchQueue, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, NSArray *))v9 + 2))(v9, self->_topics);
  }

}

void __75__WBSSmartHistorySearcher_performSearchWithText_options_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_searchTopicsForText:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_topics, 0);
}

@end
