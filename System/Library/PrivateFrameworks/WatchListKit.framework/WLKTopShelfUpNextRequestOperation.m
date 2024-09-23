@implementation WLKTopShelfUpNextRequestOperation

- (WLKTopShelfUpNextRequestOperation)init
{
  return -[WLKTopShelfUpNextRequestOperation initWithQueryParameters:options:](self, "initWithQueryParameters:options:", 0, 1);
}

- (WLKTopShelfUpNextRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WLKTopShelfUpNextRequestOperation *v10;
  objc_super v12;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", 15.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:clientProtocolVersion:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:clientProtocolVersion:", CFSTR("watchlist/topShelf"), v7, 0, 0, 0, v8, a4, &unk_1E68C98D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)WLKTopShelfUpNextRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v12, sel_initWithRequestProperties_, v9);

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
  -[WLKTopShelfUpNextRequestOperation setResponse:](self, "setResponse:", v4);

}

- (WLKContinueWatchingResponse)response
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
}

@end
