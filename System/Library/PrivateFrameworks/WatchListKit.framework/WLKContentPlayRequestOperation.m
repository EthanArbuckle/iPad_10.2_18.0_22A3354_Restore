@implementation WLKContentPlayRequestOperation

- (WLKContentPlayRequestOperation)initWithCanonicalID:(id)a3 caller:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WLKContentPlayRequestOperation *v10;
  uint64_t v11;
  NSString *canonicalID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(CFSTR("content/{id}/play"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{id}"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:", v8, 0, 0, 0, v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)WLKContentPlayRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v14, sel_initWithRequestProperties_, v9);
  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    canonicalID = v10->_canonicalID;
    v10->_canonicalID = (NSString *)v11;

  }
  return v10;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  WLKDictionaryResponseProcessor *v5;

  v5 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v5, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v5, "processResponseData:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WLKContentPlayRequestOperation setResponse:](self, "setResponse:", v4);
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (WLKContentPlayResponse)response
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
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
