@implementation WLKSportsFavoriteRequestOperation

- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4
{
  return -[WLKSportsFavoriteRequestOperation initWithAction:ids:caller:](self, "initWithAction:ids:caller:", a3, a4, 0);
}

- (WLKSportsFavoriteRequestOperation)initWithAction:(unint64_t)a3 ids:(id)a4 caller:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  WLKSportsFavoriteRequestOperation *v13;
  WLKSportsFavoriteRequestOperation *v14;
  uint64_t v15;
  NSArray *ids;
  uint64_t v17;
  NSString *caller;
  objc_super v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 == 2)
  {
    WLKRequireNonNilParameter((uint64_t)v8);
    v21 = CFSTR("id");
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("favorite-teams"), v12, CFSTR("DELETE"), 0, 0, v9, 0, &unk_1E68C9920, 0x200000);
LABEL_7:
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  if (a3 == 1)
  {
    WLKRequireNonNilParameter((uint64_t)v8);
    v23 = CFSTR("id");
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("favorite-teams"), v12, CFSTR("POST"), 0, 0, v9, 0, &unk_1E68C9920, 0x200000);
    goto LABEL_7;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid action provided (%ld)"), a3);
    v10 = 0;
  }
  else
  {
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("favorite-teams"), 0, CFSTR("GET"), 0, 0, v9, 0, &unk_1E68C9920, 2097160);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v20.receiver = self;
  v20.super_class = (Class)WLKSportsFavoriteRequestOperation;
  v13 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v20, sel_initWithRequestProperties_, v10);
  v14 = v13;
  if (v13)
  {
    v13->_action = a3;
    v15 = objc_msgSend(v8, "copy");
    ids = v14->_ids;
    v14->_ids = (NSArray *)v15;

    v17 = objc_msgSend(v9, "copy");
    caller = v14->_caller;
    v14->_caller = (NSString *)v17;

  }
  return v14;
}

- (void)processResponse
{
  void *v3;
  WLKSportsFavoriteResponse *v4;
  WLKSportsFavoriteResponse *response;
  NSObject *v6;
  WLKDictionaryResponseProcessor *v7;

  v7 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v7, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v7, "processResponseData:error:", v3, 0);
  v4 = (WLKSportsFavoriteResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

  if (-[WLKSportsFavoriteRequestOperation action](self, "action") == 1
    || -[WLKSportsFavoriteRequestOperation action](self, "action") == 2)
  {
    dispatch_get_global_queue(21, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, &__block_literal_global_23);

  }
}

void __52__WLKSportsFavoriteRequestOperation_processResponse__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  if (WLKIsTVApp())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = objc_alloc(MEMORY[0x1E0C99EA0]);
    WLKTVAppBundleID();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v0, "initWithSuiteName:", v1);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v2, CFSTR("WLKSettingsLastSyncDate"));

  v3 = objc_alloc_init(MEMORY[0x1E0D51618]);
  WLKTVAppBundleID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("WLKSettingsLastSyncDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:", v4, v5);

}

- (void)prepareURLRequest:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WLKSportsFavoriteRequestOperation *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __55__WLKSportsFavoriteRequestOperation_prepareURLRequest___block_invoke;
  v5[3] = &unk_1E68A8768;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WLKSportsFavoriteRequestOperation;
  v5[0] = MEMORY[0x1E0C809B0];
  v3 = v7;
  -[WLKUTSNetworkRequestOperation prepareURLRequest:](&v4, sel_prepareURLRequest_, v5);

}

void __55__WLKSportsFavoriteRequestOperation_prepareURLRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v5, "action") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_preparePOSTQueryOnlyWithRequest:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = (id)v7;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_preparePOSTQueryOnlyWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v3, "HTTPBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);

    if (v8 && v11)
    {
      objc_msgSend(v8, "setQuery:", v11);
      objc_msgSend(v8, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v4, "setURL:", v12);
        objc_msgSend(v4, "setHTTPBody:", 0);
        objc_msgSend(v4, "setValue:forHTTPHeaderField:", 0, CFSTR("Content-Type"));
      }

    }
  }

  return v4;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSArray)ids
{
  return self->_ids;
}

- (NSString)caller
{
  return self->_caller;
}

- (WLKSportsFavoriteResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_ids, 0);
}

@end
