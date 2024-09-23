@implementation VKCVisualSearchResult

- (VKCVisualSearchResult)initWithGatingResult:(id)a3
{
  id v5;
  VKCVisualSearchResult *v6;
  VKCVisualSearchResult *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  VKCVisualSearchResultItem *v18;
  NSArray *resultItems;
  VKCVisualSearchResult *v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VKCVisualSearchResult;
  v6 = -[VKCVisualSearchResult init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gatingResult, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v21 = v7;
    -[MADVIVisualSearchGatingResult resultItems](v7->_gatingResult, "resultItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v9)
    {
      v10 = v9;
      v23 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v12, "domains");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v25 != v16)
                  objc_enumerationMutation(v13);
                v18 = -[VKCVisualSearchResultItem initWithGatingResultItem:domain:]([VKCVisualSearchResultItem alloc], "initWithGatingResultItem:domain:", v12, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
                -[NSArray addObject:](v8, "addObject:", v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            }
            while (v15);
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v10);
    }

    v7 = v21;
    resultItems = v21->_resultItems;
    v21->_resultItems = v8;

  }
  return v7;
}

- (void)setAnalysis:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_storeWeak((id *)&self->_analysis, v4);
  -[VKCVisualSearchResult resultItems](self, "resultItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__VKCVisualSearchResult_setAnalysis___block_invoke;
  v7[3] = &unk_1E94644E0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __37__VKCVisualSearchResult_setAnalysis___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAnalysis:", *(_QWORD *)(a1 + 32));
}

- (NSData)payload
{
  return (NSData *)-[MADVIVisualSearchGatingResult payload](self->_gatingResult, "payload");
}

- (NSData)userFeedbackPayload
{
  return (NSData *)-[MADVIVisualSearchResult userFeedbackPayload](self->_searchResult, "userFeedbackPayload");
}

- (void)setSearchResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSArray *v8;
  NSArray *resultItems;
  uint8_t v10[16];

  objc_storeStrong((id *)&self->_searchResult, a3);
  v5 = a3;
  v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.visualSearch");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1D2E0D000, v6, OS_LOG_TYPE_DEFAULT, "VisualSearch: Request completed", v10, 2u);
  }

  -[MADVIVisualSearchResult resultItems](self->_searchResult, "resultItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vk_compactMap:", &__block_literal_global_21);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  resultItems = self->_resultItems;
  self->_resultItems = v8;

}

VKCVisualSearchResultItem *__41__VKCVisualSearchResult_setSearchResult___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VKCVisualSearchResultItem *v3;

  v2 = a2;
  v3 = -[VKCVisualSearchResultItem initWithSearchResultItem:]([VKCVisualSearchResultItem alloc], "initWithSearchResultItem:", v2);

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ with %lu results"), self, -[NSArray count](self->_resultItems, "count"));
}

- (VKCImageAnalysis)analysis
{
  return (VKCImageAnalysis *)objc_loadWeakRetained((id *)&self->_analysis);
}

- (MADVIVisualSearchResult)searchResult
{
  return self->_searchResult;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (MADVIVisualSearchGatingResult)gatingResult
{
  return self->_gatingResult;
}

- (void)setGatingResult:(id)a3
{
  objc_storeStrong((id *)&self->_gatingResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gatingResult, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_destroyWeak((id *)&self->_analysis);
}

@end
