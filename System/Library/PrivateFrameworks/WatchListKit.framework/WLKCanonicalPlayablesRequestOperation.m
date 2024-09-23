@implementation WLKCanonicalPlayablesRequestOperation

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 profiles:(id)a4 caller:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  WLKCanonicalPlayablesRequestOperation *v16;
  uint64_t v17;
  NSString *contentID;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = (objc_class *)MEMORY[0x1E0C99E08];
  v11 = a5;
  v12 = objc_alloc_init(v10);
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("profiles"));

  }
  objc_msgSend(CFSTR("view/product/{id}/personalized"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("{id}"), v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", v14, v12, 0, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v20.receiver = self;
  v20.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v16 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v20, sel_initWithRequestProperties_, v15);
  if (v16)
  {
    v17 = objc_msgSend(v8, "copy");
    contentID = v16->_contentID;
    v16->_contentID = (NSString *)v17;

  }
  return v16;
}

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 isMovie:(BOOL)a5
{
  id v8;
  id v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  WLKCanonicalPlayablesRequestOperation *v14;
  uint64_t v15;
  NSString *contentID;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = CFSTR("/movies/{movieId}");
    v11 = CFSTR("{movieId}");
  }
  else
  {
    v10 = CFSTR("/shows/{showId}");
    v11 = CFSTR("{showId}");
  }
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v10, "stringByReplacingOccurrencesOfString:withString:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v12, &unk_1E68CA0F0, CFSTR("GET"), 0, 0, v9, 0, &unk_1E68C9980, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v14 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v18, sel_initWithRequestProperties_, v13);
  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;

  }
  return v14;
}

- (WLKCanonicalPlayablesRequestOperation)initWithContentID:(id)a3 caller:(id)a4 canonicalType:(int64_t)a5
{
  id v8;
  id v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  WLKCanonicalPlayablesRequestOperation *v14;
  uint64_t v15;
  NSString *contentID;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  switch(a5)
  {
    case 0:
      v10 = CFSTR("/shows/{showId}");
      v11 = CFSTR("{showId}");
      goto LABEL_7;
    case 1:
      v10 = CFSTR("/movies/{movieId}");
      v11 = CFSTR("{movieId}");
      goto LABEL_7;
    case 2:
      v10 = CFSTR("/sporting-events/{sportingEventId}");
      v11 = CFSTR("{sportingEventId}");
      goto LABEL_7;
    case 3:
      v10 = CFSTR("/episodes/{episodeId}");
      v11 = CFSTR("{episodeId}");
LABEL_7:
      -[__CFString stringByReplacingOccurrencesOfString:withString:](v10, "stringByReplacingOccurrencesOfString:withString:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid canonical type."));
      v12 = 0;
      break;
  }
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:httpBody:headers:caller:timeout:apiVersion:options:", v12, &unk_1E68CA118, CFSTR("GET"), 0, 0, v9, 0, &unk_1E68C9980, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)WLKCanonicalPlayablesRequestOperation;
  v14 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v18, sel_initWithRequestProperties_, v13);
  if (v14)
  {
    v15 = objc_msgSend(v8, "copy");
    contentID = v14->_contentID;
    v14->_contentID = (NSString *)v15;

  }
  return v14;
}

- (void)processResponse
{
  void *v3;
  WLKCanonicalPlayablesResponse *v4;
  WLKCanonicalPlayablesResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKCanonicalPlayablesResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (NSString)contentID
{
  return self->_contentID;
}

- (WLKCanonicalPlayablesResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
