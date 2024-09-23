@implementation WLKChannelLookupOperation

- (WLKChannelLookupOperation)initWithAdamId:(id)a3
{
  void *v4;
  void *v5;
  WLKChannelLookupOperation *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@/%@"), CFSTR("channels"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", v4, 0, 0, 0, 0, 0, &unk_1E68C9830, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)WLKChannelLookupOperation;
  v6 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v8, sel_initWithRequestProperties_, v5);

  return v6;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  void *v5;
  WLKChannelResponse *v6;
  id v7;

  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "wlk_numberForKey:", CFSTR("expirationInSeconds"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4
      || (-[WLKNetworkRequestOperation httpHeaderMaxAge](self, "httpHeaderMaxAge"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(unint64_t)objc_msgSend(v4, "unsignedIntegerValue"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v6 = -[WLKChannelResponse initWithDictionary:expirationDate:environmentHash:]([WLKChannelResponse alloc], "initWithDictionary:expirationDate:environmentHash:", v7, v5, -[WLKUTSNetworkRequestOperation environmentHash](self, "environmentHash"));
    -[WLKChannelLookupOperation setChannelResponse:](self, "setChannelResponse:", v6);

    v3 = v7;
  }

}

- (WLKChannelResponse)channelResponse
{
  return self->_channelResponse;
}

- (void)setChannelResponse:(id)a3
{
  objc_storeStrong((id *)&self->_channelResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelResponse, 0);
}

@end
