@implementation WLKCanonicalPlayablesSiriRequestOperation

- (WLKCanonicalPlayablesSiriRequestOperation)initWithStatsID:(id)a3 caller:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WLKCanonicalPlayablesSiriRequestOperation *v13;
  uint64_t v14;
  NSString *statsID;
  objc_super v17;
  const __CFString *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20[0] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a4;
  objc_msgSend(v7, "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = CFSTR("statsIds");
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", CFSTR("/siri/sports-tune-in"), v11, CFSTR("GET"), 0, 0, v8, 0, &unk_1E68C99B0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17.receiver = self;
  v17.super_class = (Class)WLKCanonicalPlayablesSiriRequestOperation;
  v13 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v17, sel_initWithRequestProperties_, v12);
  if (v13)
  {
    v14 = objc_msgSend(v6, "copy");
    statsID = v13->_statsID;
    v13->_statsID = (NSString *)v14;

  }
  return v13;
}

- (WLKCanonicalPlayablesSiriRequestOperation)initWithSportsEventID:(id)a3 caller:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  WLKCanonicalPlayablesSiriRequestOperation *v10;
  uint64_t v11;
  NSString *sportsEventID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(CFSTR("/sporting-events/{sportingEventId}"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{sportingEventId}"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v8, 0, CFSTR("GET"), 0, 0, v7, 0, &unk_1E68C99B0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)WLKCanonicalPlayablesSiriRequestOperation;
  v10 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v14, sel_initWithRequestProperties_, v9);
  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    sportsEventID = v10->_sportsEventID;
    v10->_sportsEventID = (NSString *)v11;

  }
  return v10;
}

- (void)processResponse
{
  void *v3;
  void *v4;
  WLKCanonicalPlayablesResponse *v5;
  void *v6;
  WLKCanonicalPlayablesResponse *v7;
  WLKCanonicalPlayablesResponse *response;
  WLKCanonicalPlayablesResponse *v9;
  WLKDictionaryResponseProcessor *v10;

  v10 = objc_alloc_init(WLKDictionaryResponseProcessor);
  if (self->_statsID)
  {
    -[WLKDictionaryResponseProcessor setObjectClass:](v10, "setObjectClass:", objc_opt_class());
    -[WLKNetworkRequestOperation data](self, "data");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKDictionaryResponseProcessor processResponseData:error:](v10, "processResponseData:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = [WLKCanonicalPlayablesResponse alloc];
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WLKCanonicalPlayablesResponse initWithSiriResponse:statsID:](v5, "initWithSiriResponse:statsID:", v6, self->_statsID);
    response = self->_response;
    self->_response = v7;

  }
  else
  {
    -[WLKDictionaryResponseProcessor setObjectClass:](v10, "setObjectClass:", objc_opt_class());
    -[WLKNetworkRequestOperation data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLKDictionaryResponseProcessor processResponseData:error:](v10, "processResponseData:error:", v4, 0);
    v9 = (WLKCanonicalPlayablesResponse *)objc_claimAutoreleasedReturnValue();
    v6 = self->_response;
    self->_response = v9;
  }

}

- (NSString)statsID
{
  return self->_statsID;
}

- (NSString)sportsEventID
{
  return self->_sportsEventID;
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_sportsEventID, 0);
  objc_storeStrong((id *)&self->_statsID, 0);
}

@end
