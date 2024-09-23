@implementation WLKAdamIDToCanonicalIDRequestOperation

- (WLKAdamIDToCanonicalIDRequestOperation)initWithAdamId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WLKAdamIDToCanonicalIDRequestOperation *v9;
  WLKAdamIDToCanonicalIDRequestOperation *v10;
  objc_super v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("ids");
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", CFSTR("contents/lookup"), v7, 0, 0, 0, 0, &unk_1E68C9998, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WLKAdamIDToCanonicalIDRequestOperation;
  v9 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v12, sel_initWithRequestProperties_, v8);
  v10 = v9;
  if (v9)
    -[WLKAdamIDToCanonicalIDRequestOperation setAdamId:](v9, "setAdamId:", v4);

  return v10;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WLKAdamIDToCanonicalIDResponse *v7;
  id v8;

  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    objc_msgSend(v3, "wlk_dictionaryForKey:", CFSTR("content"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[WLKAdamIDToCanonicalIDRequestOperation adamId](self, "adamId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "wlk_dictionaryForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = -[WLKAdamIDToCanonicalIDResponse initWithDictionary:]([WLKAdamIDToCanonicalIDResponse alloc], "initWithDictionary:", v6);
        -[WLKAdamIDToCanonicalIDRequestOperation setResponse:](self, "setResponse:", v7);

      }
    }

    v3 = v8;
  }

}

- (WLKAdamIDToCanonicalIDResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (NSString)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
  objc_storeStrong((id *)&self->_adamId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamId, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
