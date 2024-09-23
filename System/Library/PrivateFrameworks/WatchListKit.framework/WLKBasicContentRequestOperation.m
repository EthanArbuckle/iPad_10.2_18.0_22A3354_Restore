@implementation WLKBasicContentRequestOperation

- (WLKBasicContentRequestOperation)initWithContentID:(id)a3 caller:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  WLKBasicContentRequestOperation *v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[WLKBasicContentRequestOperation initWithContentIDs:caller:](self, "initWithContentIDs:caller:", v9, v7, v12, v13);
  return v10;
}

- (WLKBasicContentRequestOperation)initWithContentIDs:(id)a3 caller:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  WLKBasicContentRequestOperation *v12;
  uint64_t v13;
  NSArray *contentIDs;
  objc_super v16;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("ids"));

  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", CFSTR("content/get"), v9, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)WLKBasicContentRequestOperation;
  v12 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v16, sel_initWithRequestProperties_, v11);
  if (v12)
  {
    v13 = objc_msgSend(v6, "copy");
    contentIDs = v12->_contentIDs;
    v12->_contentIDs = (NSArray *)v13;

  }
  return v12;
}

- (void)processResponse
{
  void *v3;
  WLKBasicContentRequestResponse *v4;
  WLKBasicContentRequestResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKBasicContentRequestResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (WLKBasicContentMetadata)basicContentMetadata
{
  void *v2;
  void *v3;
  void *v4;

  -[WLKBasicContentRequestOperation response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (WLKBasicContentMetadata *)v4;
}

- (NSArray)contentIDs
{
  return self->_contentIDs;
}

- (WLKBasicContentRequestResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_contentIDs, 0);
}

@end
