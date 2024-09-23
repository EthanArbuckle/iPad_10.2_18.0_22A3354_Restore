@implementation WLKFavoritesRequestOperation

- (WLKFavoritesRequestOperation)initWithCaller:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  WLKFavoritesRequestOperation *v8;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11 = CFSTR("type");
  v12[0] = CFSTR("Team");
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:", CFSTR("favorites"), v6, 0, 0, v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)WLKFavoritesRequestOperation;
  v8 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v10, sel_initWithRequestProperties_, v7);

  return v8;
}

- (void)prepareURLRequest:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WLKFavoritesRequestOperation *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke;
  v5[3] = &unk_1E68A7BA0;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WLKFavoritesRequestOperation;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[WLKUTSNetworkRequestOperation prepareURLRequest:](&v4, sel_prepareURLRequest_, v5);

}

void __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "optedIn");

  if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke_2;
    v12[3] = &unk_1E68A7B78;
    v15 = *(id *)(a1 + 40);
    v6 = v3;
    v7 = *(_QWORD *)(a1 + 32);
    v13 = v6;
    v14 = v7;
    WLKFetchIsSportsEnabled(v12);

    v8 = v15;
  }
  else
  {
    WLKNetworkingLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = (id)objc_opt_class();
      v18 = 2112;
      v19 = CFSTR("User is not opted into TV.app");
      v10 = v17;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", buf, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 40);
    WLKError(300, 0, CFSTR("User is not opted into TV.app"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v8);
  }

}

void __50__WLKFavoritesRequestOperation_prepareURLRequest___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, id);
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void (**)(uint64_t, uint64_t, id))(v4 + 16);
    v7 = a3;
    v6(v4, v5, v7);
  }
  else
  {
    v8 = a3;
    WLKNetworkingLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412546;
      v13 = (id)objc_opt_class();
      v14 = 2112;
      v15 = CFSTR("Sports is not enabled");
      v10 = v13;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "%@ - %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 48);
    WLKError(400, v8, CFSTR("Sports is not enabled"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v7);
  }

}

- (void)processResponse
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WLKFavorite *v10;
  NSArray *v11;
  NSArray *favorites;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = -[WLKFavorite initWithDictionary:]([WLKFavorite alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = (NSArray *)objc_msgSend(v4, "copy");
  favorites = self->_favorites;
  self->_favorites = v11;

}

- (NSArray)favorites
{
  return self->_favorites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
}

@end
