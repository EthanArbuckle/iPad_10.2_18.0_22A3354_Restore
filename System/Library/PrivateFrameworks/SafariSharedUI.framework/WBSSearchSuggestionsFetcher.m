@implementation WBSSearchSuggestionsFetcher

- (WBSSearchSuggestionsFetcher)initWithSuggestionsURLTemplate:(id)a3
{
  id v5;
  WBSSearchSuggestionsFetcher *v6;
  WBSSearchSuggestionsFetcher *v7;
  WBSSearchSuggestionsFetcher *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSSearchSuggestionsFetcher;
  v6 = -[WBSSearchSuggestionsFetcher init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestionsURLTemplate, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isFetching
{
  return self->_numberOfPendingFetches != 0;
}

- (void)updateSuggestionsRequestWithSearchTerms:(id)a3 userAgentString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  WBSOpenSearchURLTemplate *suggestionsURLTemplate;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ++self->_numberOfPendingFetches;
  -[WBSSearchSuggestionsFetcher _searchHelperConnection](self, "_searchHelperConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke;
  v19[3] = &unk_1E5445998;
  v19[4] = self;
  v13 = v10;
  v20 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  suggestionsURLTemplate = self->_suggestionsURLTemplate;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_8;
  v17[3] = &unk_1E54459C0;
  v17[4] = self;
  v16 = v13;
  v18 = v16;
  objc_msgSend(v14, "updateSuggestionsRequestWithSearchTerms:suggestionsURLTemplate:userAgentString:completionHandler:", v8, suggestionsURLTemplate, v9, v17);

}

void __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (id)WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "safari_privacyPreservingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_cold_1(v5, v6, v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_fetchDidFinishWithResponse:error:completionHandler:", 0, v3, *(_QWORD *)(a1 + 40));
}

uint64_t __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDidFinishWithResponse:error:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)cancelExistingSuggestionsRequest
{
  void *v3;
  void *v4;

  if (self->_numberOfPendingFetches)
  {
    -[WBSSearchSuggestionsFetcher _searchHelperConnection](self, "_searchHelperConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelExistingSuggestionsRequestOfFetcherWithSuggestionsURLTemplate:", self->_suggestionsURLTemplate);

    self->_numberOfPendingFetches = 0;
  }
}

- (void)disconnectFromSearchHelperIfNecessary
{
  void *v3;

  if (self->_hasConnectionToSearchHelper)
  {
    objc_msgSend(MEMORY[0x1E0D8A1D0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeClient:", self);

    self->_hasConnectionToSearchHelper = 0;
  }
}

- (id)_searchHelperConnection
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D8A1D0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchHelperConnectionRequestedByClient:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  self->_hasConnectionToSearchHelper = 1;
  return v4;
}

- (void)_fetchDidFinishWithResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__WBSSearchSuggestionsFetcher__fetchDidFinishWithResponse_error_completionHandler___block_invoke;
  v14[3] = &unk_1E54459E8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

uint64_t __83__WBSSearchSuggestionsFetcher__fetchDidFinishWithResponse_error_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[4];
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
    *(_QWORD *)(v1 + 8) = v2 - 1;
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[5], a1[6]);
}

- (WBSOpenSearchURLTemplate)suggestionsURLTemplate
{
  return self->_suggestionsURLTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsURLTemplate, 0);
}

void __105__WBSSearchSuggestionsFetcher_updateSuggestionsRequestWithSearchTerms_userAgentString_completionHandler___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "WBSSearchSuggestionsFetcher received an error: %{public}@", buf, 0xCu);

}

@end
