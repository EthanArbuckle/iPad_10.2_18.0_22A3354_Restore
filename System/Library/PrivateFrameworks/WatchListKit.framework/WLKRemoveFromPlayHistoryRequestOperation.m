@implementation WLKRemoveFromPlayHistoryRequestOperation

- (WLKRemoveFromPlayHistoryRequestOperation)initWithItemID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  WLKRemoveFromPlayHistoryRequestOperation *v8;
  WLKRemoveFromPlayHistoryRequestOperation *v9;
  WLKRemoveFromPlayHistoryRequestOperation *v10;
  objc_super v12;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("play-history/%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v6, 0, CFSTR("DELETE"), 0, &unk_1E68CA050, 0, 0, &unk_1E68C96E0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12.receiver = self;
    v12.super_class = (Class)WLKRemoveFromPlayHistoryRequestOperation;
    v8 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v12, sel_initWithRequestProperties_, v7);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_deleteID, a3);
    self = v9;

    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("delete ID is required"));
    v10 = 0;
  }

  return v10;
}

- (NSString)deleteID
{
  return self->_deleteID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteID, 0);
}

@end
