@implementation WBSPageContextDataFetcher

- (void)clearExtractedSchemaData
{
  NSDictionary *filteredSchemaData;

  filteredSchemaData = self->_filteredSchemaData;
  if (filteredSchemaData)
  {
    self->_filteredSchemaData = 0;

  }
}

- (void)fetchSchemaDataForWebView:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke;
  v6[3] = &unk_1E5444BC0;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  +[WBSSchemaDataExtractor fetchDataFromWebView:completionHandler:](WBSSchemaDataExtractor, "fetchDataFromWebView:completionHandler:", v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)WeakRetained + 1);
    if (v5)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v8[2];
      v8[2] = v10;

      objc_msgSend(*(id *)(a1 + 32), "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pageContextDataFetcherDidFinishFetching:forURL:withError:", v8, v12, v6);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pageContextDataFetcherDidFinishFetching:forURL:withError:", v8, v13, v6);

      v14 = WBS_LOG_CHANNEL_PREFIXSchemaDataLoading();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke_cold_1(v14, v6);
    }

  }
}

- (WBSPageContextDataFetcherDelegate)delegate
{
  return (WBSPageContextDataFetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)filteredSchemaData
{
  return self->_filteredSchemaData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSchemaData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__WBSPageContextDataFetcher_fetchSchemaDataForWebView___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to extract Microdata from webpage: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
