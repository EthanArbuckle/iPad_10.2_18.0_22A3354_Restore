@implementation WLKTopShelfNetworkOperation

- (WLKTopShelfNetworkOperation)initWithEndPoint:(id)a3 queryParameters:(id)a4 ignoreCache:(BOOL)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  WLKTopShelfNetworkOperation *v13;
  objc_super v15;

  if (a5)
    v7 = 9;
  else
    v7 = 1;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "numberWithDouble:", 15.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", v10, v9, 0, 0, 0, v11, &unk_1E68C9860, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v15.receiver = self;
  v15.super_class = (Class)WLKTopShelfNetworkOperation;
  v13 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v15, sel_initWithRequestProperties_, v12);

  return v13;
}

- (void)processResponse
{
  NSDictionary *v3;
  NSDictionary *payload;

  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  payload = self->_payload;
  self->_payload = v3;

}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
