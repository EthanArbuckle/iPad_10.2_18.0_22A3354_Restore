@implementation WLKSearchWatchListRequestOperation

- (WLKSearchWatchListRequestOperation)initWithQuery:(id)a3 caller:(id)a4
{
  void *v5;
  WLKSearchWatchListRequestOperation *v6;
  objc_super v8;

  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", CFSTR("watchlist/search"), a3, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)WLKSearchWatchListRequestOperation;
  v6 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v8, sel_initWithRequestProperties_, v5);

  return v6;
}

- (void)processResponse
{
  void *v3;
  WLKSearchWatchListResponse *v4;
  WLKSearchWatchListResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKSearchWatchListResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (NSDictionary)query
{
  return self->_query;
}

- (WLKSearchWatchListResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
