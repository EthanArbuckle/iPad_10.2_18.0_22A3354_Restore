@implementation STSSearchModel

- (STSSearchModel)init
{
  STSSearchModel *v2;
  NSArray *v3;
  NSArray *sections;
  dispatch_queue_t v5;
  OS_dispatch_queue *mutableSectionsQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *queryQueue;
  NSMutableDictionary *v9;
  NSMutableDictionary *zkwResultStore;
  NSMutableDictionary *v11;
  NSMutableDictionary *searchResultStore;
  uint64_t v13;
  NSArray *categoryList;
  NSMutableArray *v15;
  NSMutableArray *recentsToDedup;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STSSearchModel;
  v2 = -[STSSearchModel init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    sections = v2->_sections;
    v2->_sections = v3;

    v5 = dispatch_queue_create("com.apple.messages.searchbrowser.sectionq", 0);
    mutableSectionsQueue = v2->_mutableSectionsQueue;
    v2->_mutableSectionsQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.messages.searchbrowser.queryq", MEMORY[0x24BDAC9C0]);
    queryQueue = v2->_queryQueue;
    v2->_queryQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    zkwResultStore = v2->_zkwResultStore;
    v2->_zkwResultStore = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    searchResultStore = v2->_searchResultStore;
    v2->_searchResultStore = v11;

    -[STSSearchModel defaultCategoryList](v2, "defaultCategoryList");
    v13 = objc_claimAutoreleasedReturnValue();
    categoryList = v2->_categoryList;
    v2->_categoryList = (NSArray *)v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recentsToDedup = v2->_recentsToDedup;
    v2->_recentsToDedup = v15;

    -[STSSearchModel loadReportConcernStoreFromDefaults](v2, "loadReportConcernStoreFromDefaults");
  }
  return v2;
}

- (void)fetchMoreResults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  _QWORD v11[5];

  -[NSArray firstObject](self->_sections, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "results");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moreResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __34__STSSearchModel_fetchMoreResults__block_invoke;
    v11[3] = &unk_24E746270;
    v11[4] = self;
    objc_msgSend(v9, "loadSearchResultsWithCompletionHandler:", v11);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", self, 0, 0);

  }
}

void __34__STSSearchModel_fetchMoreResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  STSSearchResultSection *v12;
  uint64_t v13;
  void *v14;
  unint64_t i;
  void *v16;
  id v17;
  STSSearchResultSection *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD block[5];
  STSSearchResultSection *v23;
  id v24;
  id v25;
  __int128 *p_buf;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[5];
  __int128 buf;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "More results loaded %@ results", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x2020000000;
    v33 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_10;
    v30[3] = &unk_24E7461F8;
    v30[4] = &buf;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v30);
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_2;
    v27[3] = &unk_24E746220;
    v7 = v3;
    v28 = v7;
    v19 = v5;
    v29 = v19;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);
    v20 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v20, "removeObjectsInArray:", v19);
    v8 = (void *)objc_msgSend(v20, "copy");

    objc_msgSend(*(id *)(a1 + 32), "resultsWithReportedImagesRemoved:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "results");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[STSSearchResultSection initWithResultsArray:]([STSSearchResultSection alloc], "initWithResultsArray:", v11);
    v13 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = v13; i < objc_msgSend(v9, "count") + v13; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_4;
    block[3] = &unk_24E746248;
    block[4] = *(_QWORD *)(a1 + 32);
    v23 = v12;
    v3 = v9;
    v24 = v3;
    v25 = v14;
    p_buf = &buf;
    v17 = v14;
    v18 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    _Block_object_dispose(&buf, 8);
  }

}

void __34__STSSearchModel_fetchMoreResults__block_invoke_10(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "queryId"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "queryId");
    *a4 = 1;
  }

}

void __34__STSSearchModel_fetchMoreResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__STSSearchModel_fetchMoreResults__block_invoke_3;
  v6[3] = &unk_24E746220;
  v7 = v3;
  v4 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __34__STSSearchModel_fetchMoreResults__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    *a4 = 1;
  }

}

void __34__STSSearchModel_fetchMoreResults__block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a1[5];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didLoadResults:indexPaths:queryId:", a1[6], a1[7], *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 40));
  objc_msgSend(WeakRetained, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", a1[4], a1[7], 0);

}

+ (id)serverURLString
{
  void *v2;
  __CFString *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("TCServerURLKey"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("https://api.smoot.apple.com");
  }
  return v3;
}

- (id)createQuerySession
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("TCUseThirdParty"));

  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", 0, 104857600, CFSTR("Search"));
  objc_msgSend(v4, "setURLCache:", v5);

  objc_msgSend(v4, "setHTTPCookieStorage:", 0);
  objc_msgSend(v4, "setHTTPMaximumConnectionsPerHost:", 8);
  objc_msgSend(v4, "set_connectionCacheCellPurgeTimeout:", 10.0);
  objc_msgSend(v4, "set_allowsTCPFastOpen:", 1);
  objc_msgSend(v4, "set_allowsTLSSessionTickets:", 1);
  if (v3)
  {
    v9 = CFSTR("User-Agent");
    v10[0] = CFSTR("Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13C75 Safari/601.1");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHTTPAdditionalHeaders:", v6);

  }
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)appendQueryItemsForRequest:(id)a3 type:(int64_t)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  if ((unint64_t)a4 > 9)
    v7 = 0;
  else
    v7 = off_24E746518[a4];
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("qtype"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  objc_msgSend(v5, "setQueryItems:", v6);
}

- (void)performSearchWithQueryString:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a5;
  -[STSSearchModel _clearSectionsAndNotifyDelegate](self, "_clearSectionsAndNotifyDelegate");
  -[NSMutableArray removeAllObjects](self->_recentsToDedup, "removeAllObjects");
  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);
      objc_msgSend(v12, "searchModelWillFetchQuerySuggestionsCompletions:", self);

    }
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke;
  v14[3] = &unk_24E7462E8;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  -[STSSearchModel _performParsecdSearchQuery:requestType:completion:](self, "_performParsecdSearchQuery:requestType:completion:", v8, a4, v14);

}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD block[4];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_cold_1((uint64_t)v11, (uint64_t)v13);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_53;
    block[3] = &unk_24E746298;
    v40 = *(id *)(a1 + 40);
    v39 = v13;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v14 = v40;
  }
  else
  {
    objc_msgSend(v12, "results");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v12, "results");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDBD1A8];
    }

    if (a3 == 8 || (a3 & 0xFFFFFFFFFFFFFFFBLL) - 1 <= 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "resultsWithReportedImagesRemoved:", v16);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count"))
      {
        v33[0] = MEMORY[0x24BDAC760];
        v33[1] = 3221225472;
        v33[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_2;
        v33[3] = &unk_24E7462C0;
        v14 = v14;
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(a1 + 40);
        v34 = v14;
        v35 = v17;
        v37 = a4;
        v36 = v18;
        dispatch_async(MEMORY[0x24BDAC9B8], v33);

      }
      else
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        STSLocalizedString(CFSTR("ERROR_DESC_NO_RESULTS_FOR_QUERY"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", v20, v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = *MEMORY[0x24BDD0FC8];
        v42[0] = v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 2, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_3;
        v30[3] = &unk_24E746298;
        v24 = *(id *)(a1 + 40);
        v31 = v23;
        v32 = v24;
        v25 = v23;
        dispatch_async(MEMORY[0x24BDAC9B8], v30);

      }
    }
    else
    {
      if (!a3)
      {
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_4;
        v26[3] = &unk_24E7462C0;
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = v12;
        v29 = a4;
        v28 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x24BDAC9B8], v26);

      }
      v14 = v16;
    }
  }

}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  STSSearchResultSection *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  STSSearchResultSection *v17;
  STSSearchResultSection *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  char v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  id v31;
  STSSearchResultSection *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchProviderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_updateSearchProviderImageForResult:", v4);

  }
  v5 = -[STSSearchResultSection initWithResultsArray:]([STSSearchResultSection alloc], "initWithResultsArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v8);

      ++v7;
    }
    while (v7 < objc_msgSend(*(id *)(a1 + 32), "count"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = 0x24BDBC000uLL;
  if (v11 > 0)
  {
    v13 = v11;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v13; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

    }
    v17 = [STSSearchResultSection alloc];
    v18 = -[STSSearchResultSection initWithResultsArray:](v17, "initWithResultsArray:", MEMORY[0x24BDBD1A8]);
    v33[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(v20 + 16);
    *(_QWORD *)(v20 + 16) = v19;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) != 0)
    {
      v24 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
      objc_msgSend(v24, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", *(_QWORD *)(a1 + 40), 0, v14);

    }
    v12 = 0x24BDBC000;
  }
  v32 = v5;
  objc_msgSend(*(id *)(v12 + 3632), "arrayWithObjects:count:", &v32, 1);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(void **)(v26 + 16);
  *(_QWORD *)(v26 + 16) = v25;

  v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  v29 = objc_opt_respondsToSelector();

  if ((v29 & 1) != 0)
  {
    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "didLoadResults:indexPaths:queryId:", *(_QWORD *)(a1 + 32), v6, *(_QWORD *)(a1 + 56));

    v31 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(v31, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", *(_QWORD *)(a1 + 40), v6, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 40), "suggestions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v8, "searchModelUpdatedQuerySuggestions:", *(_QWORD *)(a1 + 32));

    +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "suggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didShowQuerySuggestions:queryId:", v10, *(_QWORD *)(a1 + 56));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)prefetchRecentsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  STSSearchModel *v23;
  void *v24;
  void (**v25)(_QWORD);
  NSArray *obj;
  _QWORD block[4];
  NSObject *v28;
  id v29;
  STSSearchModel *v30;
  id v31;
  void (**v32)(_QWORD);
  _QWORD v33[4];
  id v34;
  void *v35;
  id v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (-[NSArray count](self->_recentResults, "count"))
  {
    v25 = v4;
    v5 = dispatch_group_create();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequestCachePolicy:", 1);
    objc_msgSend(v7, "setURLCache:", 0);
    v24 = v7;
    objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v23 = self;
    obj = self->_recentResults;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
          dispatch_group_enter(v5);
          objc_msgSend(v13, "thumbnail");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "urlValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setHTTPMethod:", CFSTR("HEAD"));
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke;
          v33[3] = &unk_24E746310;
          v34 = v6;
          v35 = v13;
          v36 = v15;
          v37 = v5;
          v17 = v15;
          objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v16, v33);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "resume");

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v10);
    }

    dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_68;
    block[3] = &unk_24E746338;
    v28 = v5;
    v29 = v8;
    v30 = v23;
    v31 = v6;
    v4 = v25;
    v32 = v25;
    v20 = v6;
    v21 = v8;
    v22 = v5;
    dispatch_async(v19, block);

  }
  else
  {
    v4[2](v4);
  }

}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend(a3, "statusCode");
  if (!a4 || v6 == 200)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v11 = 138412290;
      v12 = v10;
      v8 = MEMORY[0x24BDACB70];
      v9 = "successfully downloaded header for image %@, adding to recents";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v11 = 138412290;
    v12 = v7;
    v8 = MEMORY[0x24BDACB70];
    v9 = "failed to download header for image %@, removing from to recents";
LABEL_7:
    _os_log_impl(&dword_2217E8000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_68(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = *(NSObject **)(a1 + 32);
  v3 = dispatch_time(0, 10000000000);
  dispatch_group_wait(v2, v3);
  objc_msgSend(*(id *)(a1 + 40), "invalidateAndCancel");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 80), *(id *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  dispatch_get_global_queue(9, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_2;
  block[3] = &unk_24E7457A8;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(v5, block);

}

void __48__STSSearchModel_prefetchRecentsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "updateRecentResults:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

}

- (void)performZKWSearchQueryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  STSSearchModel *v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;

  v4 = a3;
  -[STSSearchModel _clearSectionsAndNotifyDelegate](self, "_clearSectionsAndNotifyDelegate");
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke;
  v14[3] = &unk_24E7457A8;
  v7 = v5;
  v15 = v7;
  -[STSSearchModel prefetchRecentsWithCompletion:](self, "prefetchRecentsWithCompletion:", v14);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2;
  v10[3] = &unk_24E7463B0;
  v12 = self;
  v13 = v4;
  v11 = v7;
  v8 = v4;
  v9 = v7;
  -[STSSearchModel _performParsecdSearchQuery:requestType:completion:](self, "_performParsecdSearchQuery:requestType:completion:", &stru_24E7469D8, 4, v10);

}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[2];
  id v22;
  id v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  id v27;

  v10 = a2;
  v11 = a5;
  v12 = a6;
  v13 = *(NSObject **)(a1 + 32);
  v14 = dispatch_time(0, 11000000000);
  dispatch_group_wait(v13, v14);
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_cold_1((uint64_t)v12);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_71;
    block[3] = &unk_24E746298;
    v15 = &v27;
    v27 = *(id *)(a1 + 48);
    v26 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v16 = v26;
  }
  else
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_72;
    v20[3] = &unk_24E746388;
    v15 = (id *)v21;
    v17 = v11;
    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(a1 + 48);
    v21[0] = v17;
    v21[1] = v18;
    v24 = a4;
    v23 = v19;
    v22 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);

    v16 = v23;
  }

}

uint64_t __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_72(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  STSSearchResultSection *v21;
  STSSearchResultSection *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id WeakRetained;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  STSSearchResultSection *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  STSSearchResultSection *v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "results");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = *(_QWORD *)(a1 + 40);
  v44 = v4;
  if (*(_QWORD *)(v5 + 80))
  {
    v6 = v4;
    objc_msgSend(*(id *)(v5 + 152), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80));
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_3;
    v45[3] = &unk_24E746360;
    v46 = v3;
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 40);
    v47 = v8;
    v48 = v9;
    v10 = v3;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v45);
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v11, "removeObjectsInArray:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "arrayByAddingObjectsFromArray:", v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v43 = -[STSSearchResultSection initWithResultsArray:]([STSSearchResultSection alloc], "initWithResultsArray:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v14);

      ++v13;
    }
    while (v13 < objc_msgSend(v3, "count"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16 > 0)
  {
    v17 = v16;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != v17; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v20);

    }
    v21 = [STSSearchResultSection alloc];
    v22 = -[STSSearchResultSection initWithResultsArray:](v21, "initWithResultsArray:", MEMORY[0x24BDBD1A8]);
    v52[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    v25 = *(void **)(v24 + 16);
    *(_QWORD *)(v24 + 16) = v23;

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
    objc_msgSend(WeakRetained, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", *(_QWORD *)(a1 + 40), 0, v18);

  }
  v51 = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD *)(a1 + 40);
  v29 = *(void **)(v28 + 16);
  *(_QWORD *)(v28 + 16) = v27;

  +[STSFeedbackReporter sharedInstance](STSFeedbackReporter, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "didLoadResults:indexPaths:queryId:", v3, v12, *(_QWORD *)(a1 + 64));

  v31 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 40));
  objc_msgSend(v31, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", *(_QWORD *)(a1 + 40), v12, 0);

  if (objc_msgSend(v3, "count"))
  {
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "searchProviderImage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v33)
    {
      objc_msgSend(v3, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_updateSearchProviderImageForResult:", v34);

    }
    v35 = *(_QWORD *)(a1 + 56);
    if (v35)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v35 + 16))(v35, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_72_cold_1();
    v36 = (void *)MEMORY[0x24BDD17C8];
    STSLocalizedString(CFSTR("ERROR_DESC_NO_SUGGESTIONS_FOUND"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", v37, *(_QWORD *)(a1 + 48));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = *MEMORY[0x24BDD0FC8];
    v50 = v38;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("STSErrorDomain"), 2, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(_QWORD *)(a1 + 56);
    if (v41)
      (*(void (**)(uint64_t, _QWORD, void *))(v41 + 16))(v41, 0, v40);

  }
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueryId:", objc_msgSend(v4, "queryId"));

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_4;
  v9[3] = &unk_24E746360;
  v10 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 152), "removeObject:", *(_QWORD *)(a1 + 32));
    *a4 = 1;
  }

}

- (void)_performParsecdSearchQuery:(id)a3 requestType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSString *currentQuery;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, void *, void *, void *);
  void *v28;
  STSSearchModel *v29;
  id v30;
  id v31;
  int64_t v32;

  v8 = a3;
  v9 = a5;
  v10 = 22;
  switch(a4)
  {
    case 0:
      v10 = 21;
      goto LABEL_8;
    case 1:
      goto LABEL_8;
    case 2:
    case 3:
    case 5:
    case 6:
      v10 = 8;
      goto LABEL_8;
    case 4:
      +[STSSearchModel incrementClientQueryId](STSSearchModel, "incrementClientQueryId");
      objc_msgSend(MEMORY[0x24BE1FA88], "zeroKeywordRequest:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7:
      v10 = 9;
      goto LABEL_8;
    case 8:
      v10 = 23;
      goto LABEL_8;
    default:
      v10 = 0;
LABEL_8:
      +[STSSearchModel incrementClientQueryId](STSSearchModel, "incrementClientQueryId");
      v12 = +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId");
      objc_msgSend(MEMORY[0x24BE1FA68], "searchRequestWithString:triggerEvent:queryId:", v8, v10, v12);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v13 = (void *)v11;
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scale");
      objc_msgSend(v13, "setScale:");

      objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentInputMode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifierWithLayouts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setKeyboardInputMode:", v17);

      -[STSSearchModel appendQueryItemsForRequest:type:](self, "appendQueryItemsForRequest:type:", v13, a4);
      -[STSSearchModel parsecSession](self, "parsecSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __68__STSSearchModel__performParsecdSearchQuery_requestType_completion___block_invoke;
      v28 = &unk_24E7463D8;
      v29 = self;
      v31 = v9;
      v19 = v8;
      v30 = v19;
      v32 = a4;
      v20 = v9;
      objc_msgSend(v18, "taskWithRequest:completion:", v13, &v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      currentQuery = self->_currentQuery;
      self->_currentQuery = (NSString *)v19;
      v23 = v19;

      -[STSSearchModel setCurrentTask:](self, "setCurrentTask:", v21, v25, v26, v27, v28, v29);
      -[STSSearchModel currentTask](self, "currentTask");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "resume");

      return;
  }
}

void __68__STSSearchModel__performParsecdSearchQuery_requestType_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = (void *)a1[4];
  v9 = a2;
  objc_msgSend(v8, "currentTask");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
    (*(void (**)(_QWORD, _QWORD, _QWORD, unint64_t, id, id))(a1[6] + 16))(a1[6], a1[5], a1[7], +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"), v11, v7);

}

- (void)_updateSearchProviderImageForResult:(id)a3
{
  id v3;

  objc_msgSend(a3, "sts_searchProviderImage");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadImageDataWithCompletionHandler:", &__block_literal_global_3);

}

void __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  if (v2)
  {
    +[STSImageCache sharedCache](STSImageCache, "sharedCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchProviderImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke_2;
      block[3] = &unk_24E7457A8;
      v6 = v2;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __54__STSSearchModel__updateSearchProviderImageForResult___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = objc_alloc(MEMORY[0x24BEBD640]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v7 = (id)objc_msgSend(v2, "initWithData:scale:", v3);

  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STSImageCache sharedCache](STSImageCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchProviderImage:", v5);

}

- (void)removeQuerySuggestions
{
  NSArray *querySuggestions;

  querySuggestions = self->_querySuggestions;
  self->_querySuggestions = (NSArray *)MEMORY[0x24BDBD1A8];

}

- (void)_clearSectionsAndNotifyDelegate
{
  void *v3;
  void *v4;
  NSArray *sections;
  id WeakRetained;
  id v7;

  -[NSArray firstObject](self->_sections, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sts_map:", &__block_literal_global_84);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  sections = self->_sections;
  self->_sections = (NSArray *)MEMORY[0x24BDBD1A8];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", self, 0, v4);

}

uint64_t __49__STSSearchModel__clearSectionsAndNotifyDelegate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
}

- (void)_clearQuerySuggestionsAndNotifyDelegate
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__STSSearchModel__clearQuerySuggestionsAndNotifyDelegate__block_invoke;
  block[3] = &unk_24E7457A8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __57__STSSearchModel__clearQuerySuggestionsAndNotifyDelegate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  char v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = MEMORY[0x24BDBD1A8];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v6, "searchModelUpdatedQuerySuggestions:", *(_QWORD *)(a1 + 32));

  }
}

- (void)removeResultAtIndexPath:(id)a3
{
  NSArray *sections;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  sections = self->_sections;
  v5 = a3;
  -[NSArray firstObject](sections, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObjectAtIndex:", objc_msgSend(v5, "row"));
  objc_msgSend(v6, "setResults:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "searchModel:insertedResultsAtIndexPaths:removedResultsAtIndexPaths:", self, 0, v10);
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  uint8_t v5[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "bag loaded", v5, 2u);
  }
}

- (id)mockQuerySuggestions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  if (mockQuerySuggestions_swap)
    v2 = &unk_24E7575F0;
  else
    v2 = &unk_24E7575D8;
  mockQuerySuggestions_swap ^= 1u;
  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__STSSearchModel_mockQuerySuggestions__block_invoke;
  v7[3] = &unk_24E746480;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

void __38__STSSearchModel_mockQuerySuggestions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = (id)objc_opt_new();
  objc_msgSend(v4, "setSuggestion:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

- (PARSession)parsecSession
{
  PARSession *parsecSession;
  void *v4;
  void *v5;
  PARSession *v6;

  parsecSession = self->_parsecSession;
  if (!parsecSession)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1FA78]), "initWithId:userAgent:", CFSTR("Messages-searchToShare-session"), CFSTR("Messages/1.0"));
    objc_msgSend(v4, "setDontPreloadImages:", 1);
    objc_msgSend(MEMORY[0x24BE1FA70], "sessionWithConfiguration:delegate:startImmediately:", v4, self, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);
    v6 = self->_parsecSession;
    self->_parsecSession = (PARSession *)v5;

    parsecSession = self->_parsecSession;
  }
  return parsecSession;
}

- (void)performCategoryListRequest:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *, void *);
  void *v17;
  STSSearchModel *v18;
  id v19;

  v4 = a3;
  v5 = +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId");
  self->_categoryListRequestQueryId = v5;
  objc_msgSend(MEMORY[0x24BE1FA88], "zeroKeywordRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentInputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifierWithLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardInputMode:", v9);

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v6, "setScale:");

  -[STSSearchModel appendQueryItemsForRequest:type:](self, "appendQueryItemsForRequest:type:", v6, 7);
  -[STSSearchModel parsecSession](self, "parsecSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __45__STSSearchModel_performCategoryListRequest___block_invoke;
  v17 = &unk_24E7464A8;
  v18 = self;
  v19 = v4;
  v12 = v4;
  objc_msgSend(v11, "taskWithRequest:completion:", v6, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);
}

void __45__STSSearchModel_performCategoryListRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(v14, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v14, "suggestions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 72);
    *(_QWORD *)(v11 + 72) = v10;

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v6);

}

- (id)defaultCategoryList
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__STSSearchModel_defaultCategoryList__block_invoke;
  v6[3] = &unk_24E7464D0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(&unk_24E757608, "enumerateObjectsUsingBlock:", v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void __37__STSSearchModel_defaultCategoryList__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x24BE84F98];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithSuggestion:query:score:type:", v4, &stru_24E7469D8, 1, 0.0);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

+ (unint64_t)clientQueryId
{
  return queryId;
}

+ (void)incrementClientQueryId
{
  ++queryId;
}

- (id)resultsWithReportedImagesRemoved:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  STSSearchModel *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __51__STSSearchModel_resultsWithReportedImagesRemoved___block_invoke;
  v13 = &unk_24E746220;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);
  return v8;
}

void __51__STSSearchModel_resultsWithReportedImagesRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Removed reported image from result set", v7, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (void)addSearchResultToReportConcernStore:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_reportConcernStore, "objectForKey:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || !objc_msgSend(v7, "length"))
  {

  }
  else if (v5)
  {
    -[NSMutableDictionary setObject:forKey:](self->_reportConcernStore, "setObject:forKey:", v5, v7);
  }
  -[STSSearchModel saveReportConcernStoreToUserDefaults](self, "saveReportConcernStoreToUserDefaults");

}

- (id)removeOutdatedReportedResults:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__STSSearchModel_removeOutdatedReportedResults___block_invoke;
  v8[3] = &unk_24E7464F8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __48__STSSearchModel_removeOutdatedReportedResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v8, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "day") > -31)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Removed expired reported image", v10, 2u);
  }

}

- (void)saveReportConcernStoreToUserDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[NSMutableDictionary copy](self->_reportConcernStore, "copy");
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("STSReportConcernResults"));

  objc_msgSend(v4, "synchronize");
}

- (void)loadReportConcernStoreFromDefaults
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *reportConcernStore;
  id v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryForKey:", CFSTR("STSReportConcernResults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchModel removeOutdatedReportedResults:](self, "removeOutdatedReportedResults:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  reportConcernStore = self->_reportConcernStore;
  self->_reportConcernStore = v5;

  -[STSSearchModel saveReportConcernStoreToUserDefaults](self, "saveReportConcernStoreToUserDefaults");
}

- (unint64_t)numberOfReportedResults
{
  void *v2;
  unint64_t v3;

  -[NSMutableDictionary allKeys](self->_reportConcernStore, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSString)currentQuery
{
  return self->_currentQuery;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSArray)querySuggestions
{
  return self->_querySuggestions;
}

- (void)setQuerySuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_querySuggestions, a3);
}

- (NSArray)predictedSuggestions
{
  return self->_predictedSuggestions;
}

- (void)setPredictedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_predictedSuggestions, a3);
}

- (STSSearchModelDelegate)delegate
{
  return (STSSearchModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STSRecentsDelegate)recentsDelegate
{
  return (STSRecentsDelegate *)objc_loadWeakRetained((id *)&self->_recentsDelegate);
}

- (void)setRecentsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_recentsDelegate, a3);
}

- (STSSearchModelQuerySuggestionsDelegate)querySuggestionsDelegate
{
  return (STSSearchModelQuerySuggestionsDelegate *)objc_loadWeakRetained((id *)&self->_querySuggestionsDelegate);
}

- (void)setQuerySuggestionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_querySuggestionsDelegate, a3);
}

- (void)setParsecSession:(id)a3
{
  objc_storeStrong((id *)&self->_parsecSession, a3);
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (void)setCategoryList:(id)a3
{
  objc_storeStrong((id *)&self->_categoryList, a3);
}

- (NSArray)recentResults
{
  return self->_recentResults;
}

- (void)setRecentResults:(id)a3
{
  objc_storeStrong((id *)&self->_recentResults, a3);
}

- (unint64_t)categoryListRequestQueryId
{
  return self->_categoryListRequestQueryId;
}

- (void)setCategoryListRequestQueryId:(unint64_t)a3
{
  self->_categoryListRequestQueryId = a3;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(id)a3
{
  objc_storeStrong((id *)&self->_conversationID, a3);
}

- (PARTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (OS_dispatch_queue)mutableSectionsQueue
{
  return self->_mutableSectionsQueue;
}

- (void)setMutableSectionsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSectionsQueue, a3);
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (void)setQueryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queryQueue, a3);
}

- (NSMutableDictionary)zkwResultStore
{
  return self->_zkwResultStore;
}

- (void)setZkwResultStore:(id)a3
{
  objc_storeStrong((id *)&self->_zkwResultStore, a3);
}

- (NSMutableDictionary)searchResultStore
{
  return self->_searchResultStore;
}

- (void)setSearchResultStore:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultStore, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (NSMutableArray)recentsToDedup
{
  return self->_recentsToDedup;
}

- (void)setRecentsToDedup:(id)a3
{
  objc_storeStrong((id *)&self->_recentsToDedup, a3);
}

- (NSMutableDictionary)reportConcernStore
{
  return self->_reportConcernStore;
}

- (void)setReportConcernStore:(id)a3
{
  objc_storeStrong((id *)&self->_reportConcernStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernStore, 0);
  objc_storeStrong((id *)&self->_recentsToDedup, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchResultStore, 0);
  objc_storeStrong((id *)&self->_zkwResultStore, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_mutableSectionsQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_recentResults, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_parsecSession, 0);
  objc_destroyWeak((id *)&self->_querySuggestionsDelegate);
  objc_destroyWeak((id *)&self->_recentsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_predictedSuggestions, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
}

void __70__STSSearchModel_performSearchWithQueryString_requestType_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Search with query %@ failed: %@", (uint8_t *)&v2, 0x16u);
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ZKW search failed: %@", (uint8_t *)&v1, 0xCu);
}

void __54__STSSearchModel_performZKWSearchQueryWithCompletion___block_invoke_2_72_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2217E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ZKW search returned 0 results", v0, 2u);
}

@end
