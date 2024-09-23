@implementation WLKUpNextWidgetRequestOperation

- (WLKUpNextWidgetRequestOperation)init
{
  return -[WLKUpNextWidgetRequestOperation initWithQueryParameters:options:](self, "initWithQueryParameters:options:", 0, 1);
}

- (WLKUpNextWidgetRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WLKUpNextWidgetRequestOperation *v10;
  objc_super v12;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", 15.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", CFSTR("shelves/up-next-widget"), v7, 0, 0, 0, v8, &unk_1E68C96B0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)WLKUpNextWidgetRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v12, sel_initWithRequestProperties_, v9);

  return v10;
}

- (void)processResponse
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  WLKUpNextItemCollection *v7;
  WLKUpNextItemCollection *itemCollection;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKChannelsResponse parseChannelsFromPayload:](WLKChannelsResponse, "parseChannelsFromPayload:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9 = CFSTR("WLKModelContextKeyChannels");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[WLKUpNextItemCollection initWithDictionary:context:]([WLKUpNextItemCollection alloc], "initWithDictionary:context:", v3, v6);
  itemCollection = self->_itemCollection;
  self->_itemCollection = v7;

}

- (WLKUpNextItemCollection)itemCollection
{
  return self->_itemCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

@end
