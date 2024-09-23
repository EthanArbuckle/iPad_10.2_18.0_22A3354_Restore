@implementation WLKMarkAsWatchedRequestOperation

- (WLKMarkAsWatchedRequestOperation)initWithItemID:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  WLKMarkAsWatchedRequestOperation *v9;
  WLKMarkAsWatchedRequestOperation *v10;
  WLKMarkAsWatchedRequestOperation *v11;
  objc_super v13;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("id"));
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("play-history"), 0, CFSTR("POST"), v7, &unk_1E68CA140, 0, 0, &unk_1E68C9A10, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13.receiver = self;
    v13.super_class = (Class)WLKMarkAsWatchedRequestOperation;
    v9 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v13, sel_initWithRequestProperties_, v8);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_itemID, a3);
    self = v10;

    v11 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("item ID is required"));
    v11 = 0;
  }

  return v11;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSString)brandID
{
  return self->_brandID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brandID, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
