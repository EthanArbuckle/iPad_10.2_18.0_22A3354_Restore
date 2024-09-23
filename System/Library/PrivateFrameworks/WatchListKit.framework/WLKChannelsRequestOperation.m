@implementation WLKChannelsRequestOperation

- (WLKChannelsRequestOperation)initWithCaller:(id)a3
{
  return -[WLKChannelsRequestOperation initWithCaller:isFilteredByUserChannels:](self, "initWithCaller:isFilteredByUserChannels:", a3, 0);
}

- (WLKChannelsRequestOperation)initWithCaller:(id)a3 isFilteredByUserChannels:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  WLKChannelsRequestOperation *v10;
  WLKChannelsRequestOperation *v11;
  objc_super v13;
  const __CFString *v14;
  _QWORD v15[2];

  v4 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    v7 = CFSTR("true");
  else
    v7 = CFSTR("false");
  v14 = CFSTR("filterByUserChannels");
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:", CFSTR("channels"), v8, 0, 0, v6, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)WLKChannelsRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v13, sel_initWithRequestProperties_, v9);
  v11 = v10;
  if (v10)
  {
    -[WLKChannelsRequestOperation setCaller:](v10, "setCaller:", v6);
    -[WLKChannelsRequestOperation setFiltered:](v11, "setFiltered:", v4);
  }

  return v11;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  void *v5;
  WLKChannelsResponse *v6;
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
    v6 = -[WLKChannelsResponse initWithDictionary:expirationDate:environmentHash:filtered:]([WLKChannelsResponse alloc], "initWithDictionary:expirationDate:environmentHash:filtered:", v7, v5, -[WLKUTSNetworkRequestOperation environmentHash](self, "environmentHash"), -[WLKChannelsRequestOperation filtered](self, "filtered"));
    -[WLKChannelsRequestOperation setChannelsResponse:](self, "setChannelsResponse:", v6);

    v3 = v7;
  }

}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (WLKChannelsResponse)channelsResponse
{
  return self->_channelsResponse;
}

- (void)setChannelsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_channelsResponse, a3);
}

- (NSString)caller
{
  return self->_caller;
}

- (void)setCaller:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_channelsResponse, 0);
}

@end
