@implementation WLKWatchListModificationRequestOperation

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 canonicalID:(id)a4 caller:(id)a5
{
  return (WLKWatchListModificationRequestOperation *)-[WLKWatchListModificationRequestOperation _initWithAction:identifier:identifierType:brandID:caller:](self, "_initWithAction:identifier:identifierType:brandID:caller:", a3, a4, CFSTR("Canonical"), 0, a5);
}

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 statsID:(id)a4 caller:(id)a5
{
  return (WLKWatchListModificationRequestOperation *)-[WLKWatchListModificationRequestOperation _initWithAction:identifier:identifierType:brandID:caller:](self, "_initWithAction:identifier:identifierType:brandID:caller:", a3, a4, CFSTR("Stats"), 0, a5);
}

- (id)_initWithAction:(unint64_t)a3 identifier:(id)a4 identifierType:(id)a5 brandID:(id)a6 caller:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  WLKWatchListModificationRequestOperation *v20;
  WLKWatchListModificationRequestOperation *v21;
  WLKWatchListModificationRequestOperation *v22;
  objc_super v24;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, CFSTR("id"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("idType"));
    if (v15)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, CFSTR("brandId"));
    if (a3 == 1)
    {
      +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("watchlist"), v17, CFSTR("DELETE"), 0, 0, v16, 0, &unk_1E68C9878, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid action provided (%ld)"), a3);
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v17, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("watchlist"), 0, CFSTR("POST"), v18, &unk_1E68CA0A0, v16, 0, &unk_1E68C9878, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v24.receiver = self;
    v24.super_class = (Class)WLKWatchListModificationRequestOperation;
    v21 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v24, sel_initWithRequestProperties_, v19);
    v22 = v21;
    if (v21)
    {
      v21->_action = a3;
      objc_storeStrong((id *)&v21->_itemID, a4);
    }
    self = v22;

    v20 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("identifier is required"));
    v20 = 0;
  }

  return v20;
}

- (WLKWatchListModificationRequestOperation)initWithAction:(unint64_t)a3 channelID:(id)a4 externalID:(id)a5 caller:(id)a6
{
  id v10;
  id v11;
  id v12;
  WLKWatchListModificationRequestOperation *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("channelID is required");
LABEL_6:
    objc_msgSend(v14, "raise:format:", v15, v16);
    v13 = 0;
    goto LABEL_7;
  }
  if (!v11)
  {
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = *MEMORY[0x1E0C99778];
    v16 = CFSTR("externalID is required");
    goto LABEL_6;
  }
  self = (WLKWatchListModificationRequestOperation *)-[WLKWatchListModificationRequestOperation _initWithAction:identifier:identifierType:brandID:caller:](self, "_initWithAction:identifier:identifierType:brandID:caller:", a3, v11, CFSTR("External"), v10, v12);
  v13 = self;
LABEL_7:

  return v13;
}

- (void)processResponse
{
  void *v3;
  WLKWatchListModificationResponse *v4;
  WLKWatchListModificationResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKWatchListModificationResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (WLKWatchListModificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
