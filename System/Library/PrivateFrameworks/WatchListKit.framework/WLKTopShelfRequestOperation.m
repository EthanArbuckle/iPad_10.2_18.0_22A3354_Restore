@implementation WLKTopShelfRequestOperation

- (WLKTopShelfRequestOperation)init
{
  return -[WLKTopShelfRequestOperation initWithQueryParameters:options:](self, "initWithQueryParameters:options:", 0, 1);
}

- (WLKTopShelfRequestOperation)initWithQueryParameters:(id)a3 options:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  WLKTopShelfRequestOperation *v10;
  objc_super v12;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithDouble:", 15.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:clientProtocolVersion:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:options:clientProtocolVersion:", CFSTR("browse/topShelf"), v7, 0, 0, 0, v8, a4, &unk_1E68C9950);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)WLKTopShelfRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v12, sel_initWithRequestProperties_, v9);

  return v10;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *items;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wlk_arrayForKey:", CFSTR("items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKChannelsResponse parseChannelsFromPayload:](WLKChannelsResponse, "parseChannelsFromPayload:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v10 = CFSTR("WLKModelContextKeyChannels");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  +[WLKBrowseItem browseItemsWithDictionaries:context:](WLKBrowseItem, "browseItemsWithDictionaries:context:", v4, v7);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v8;

}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
