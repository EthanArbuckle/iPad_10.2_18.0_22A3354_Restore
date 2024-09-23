@implementation WBSOpenSearchSchemaFetcher

+ (id)sharedFetcher
{
  WBSOpenSearchSchemaFetcher *v2;

  {
    v2 = (WBSOpenSearchSchemaFetcher *)+[WBSOpenSearchSchemaFetcher sharedFetcher]::fetcher;
  }
  else
  {
    v2 = objc_alloc_init(WBSOpenSearchSchemaFetcher);
    +[WBSOpenSearchSchemaFetcher sharedFetcher]::fetcher = (uint64_t)v2;
  }
  return v2;
}

- (void)fetchOpenSearchDescriptionWithURL:(id)a3
{
  id v4;
  NSMutableSet *openSearchDescriptionURLs;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WBSOpenSearchSchemaFetcher *v15;
  _QWORD v16[4];
  id v17;
  WBSOpenSearchSchemaFetcher *v18;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_openSearchDescriptionURLs, "containsObject:", v4) & 1) == 0)
  {
    openSearchDescriptionURLs = self->_openSearchDescriptionURLs;
    if (openSearchDescriptionURLs)
    {
      -[NSMutableSet addObject:](openSearchDescriptionURLs, "addObject:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v4);
      v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_openSearchDescriptionURLs;
      self->_openSearchDescriptionURLs = v6;

    }
    +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchHelperConnectionRequestedByClient:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke;
    v16[3] = &unk_1E4B3BD98;
    v11 = v4;
    v17 = v11;
    v18 = self;
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_15;
    v13[3] = &unk_1E4B3BAF8;
    v14 = v11;
    v15 = self;
    objc_msgSend(v12, "fetchOpenSearchDescriptionWithURL:completionHandler:", v14, v13);

  }
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2;
  block[3] = &unk_1E4B2B2A8;
  v8 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1();
  }
  return objc_msgSend(*(id *)(a1 + 48), "_didFinishFetchingOpenSearchDescriptionDocumentWithURL:", *(_QWORD *)(a1 + 40));
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_16;
  v11[3] = &unk_1E4B399F0;
  v12 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_16(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  WBSOpenSearchDescription *v6;
  void *v7;
  WBSOpenSearchDescription *v8;
  void *v9;
  void *v10;
  id v11;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1();
    objc_msgSend(*(id *)(a1 + 48), "_didFinishFetchingOpenSearchDescriptionDocumentWithURL:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("OpenSearchDescriptionDocumentURL"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("OpenSearchDescriptionSearchURLTemplate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("OpenSearchDescriptionURLTemplateForSuggestionsInJSON"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("OpenSearchDescriptionURLTemplateForSuggestionsInXML"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [WBSOpenSearchDescription alloc];
    objc_msgSend(v11, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WBSOpenSearchDescription initWithDescriptionDocumentURLString:searchURLTemplate:urlTemplateForSuggestionsInJSON:urlTemplateForSuggestionsInXML:](v6, "initWithDescriptionDocumentURLString:searchURLTemplate:urlTemplateForSuggestionsInJSON:urlTemplateForSuggestionsInXML:", v7, v3, v4, v5);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("WBSOpenSearchDescription"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("WBSOpenSearchSchemaFetcherDidCollectDescriptionNotification"), *(_QWORD *)(a1 + 48), v9);

    objc_msgSend(*(id *)(a1 + 48), "_didFinishFetchingOpenSearchDescriptionDocumentWithURL:", v11);
  }
}

- (void)_didFinishFetchingOpenSearchDescriptionDocumentWithURL:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMutableSet removeObject:](self->_openSearchDescriptionURLs, "removeObject:");
  if (!-[NSMutableSet count](self->_openSearchDescriptionURLs, "count"))
  {
    +[WBSSearchHelperConnectionManager sharedManager](WBSSearchHelperConnectionManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeClient:", self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_openSearchDescriptionURLs, 0);
}

void __64__WBSOpenSearchSchemaFetcher_fetchOpenSearchDescriptionWithURL___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_1_7(&dword_1A3D90000, v0, v1, "Fetch OpenSource description from %{sensitive, mask.hash}@ failed.", v2, v3, v4, v5, v6);
}

@end
