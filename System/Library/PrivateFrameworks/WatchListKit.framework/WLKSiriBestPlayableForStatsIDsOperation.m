@implementation WLKSiriBestPlayableForStatsIDsOperation

- (WLKSiriBestPlayableForStatsIDsOperation)initWithStatsIDs:(id)a3 caller:(id)a4
{
  id v5;
  id v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WLKSiriBestPlayableForStatsIDsOperation *v22;
  uint64_t v23;
  NSArray *statsIDs;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (uint64_t *)MEMORY[0x1E0C99778];
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The statsIDs parameter must not be nil."));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("The statsIDs parameter must be an array."));
  if (!objc_msgSend(v5, "count"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("The statsIDs parameter must not be an empty array."));
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    v12 = *v7;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v12, CFSTR("The statsIDs values must all be strings."));
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v10);
  }

  v14 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortDescriptorWithKey:ascending:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingDescriptors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = CFSTR("ids");
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(","));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", CFSTR("siri/bestPlayableForStatsIds"), v20, 0, v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v27.receiver = self;
  v27.super_class = (Class)WLKSiriBestPlayableForStatsIDsOperation;
  v22 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v27, sel_initWithRequestProperties_, v21);
  if (v22)
  {
    v23 = objc_msgSend(v8, "copy");
    statsIDs = v22->_statsIDs;
    v22->_statsIDs = (NSArray *)v23;

  }
  return v22;
}

- (void)processResponse
{
  void *v3;
  WLKSiriBestPlayablesResponse *v4;
  WLKSiriBestPlayablesResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKSiriBestPlayablesResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (NSArray)statsIDs
{
  return self->_statsIDs;
}

- (WLKSiriBestPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_statsIDs, 0);
}

@end
