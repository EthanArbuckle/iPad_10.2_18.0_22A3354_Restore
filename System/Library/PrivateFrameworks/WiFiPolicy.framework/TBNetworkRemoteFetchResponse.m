@implementation TBNetworkRemoteFetchResponse

+ (id)responseWithNetworkSearchResults:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNetworkSearchResults:", v4);

  return v5;
}

- (TBNetworkRemoteFetchResponse)initWithNetworkSearchResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TBError *v14;
  uint64_t v15;
  TBNetworkRemoteFetchResponse *v16;
  objc_super v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    NSLog(CFSTR("%s: GEOWiFiQualityNetworkSearchResult is greater than 1 (count %lu)"), "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", objc_msgSend(v4, "count"));
  objc_msgSend(v5, "matches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "matches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 >= 2)
    NSLog(CFSTR("%s: GEOWiFiESSMatch is greater than 1 (count %lu)"), "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", objc_msgSend(v4, "count"));
  NSLog(CFSTR("%s: result count: %lu"), "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]", objc_msgSend(v4, "count"));
  if (objc_msgSend(v7, "status") != 1)
  {
    NSLog(CFSTR("%s: match status is not OK"), "-[TBNetworkRemoteFetchResponse initWithNetworkSearchResults:]");
    v14 = [TBError alloc];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR("No results returned from remote source");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[TBError initWithType:userInfo:](v14, "initWithType:userInfo:", 154, v11);
LABEL_10:
    v13 = (void *)v15;
    v12 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v7, "ess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("nil ess from response");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[TBError responseErrorWithUserInfo:](TBError, "responseErrorWithUserInfo:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v7, "ess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_11:

  v18.receiver = self;
  v18.super_class = (Class)TBNetworkRemoteFetchResponse;
  v16 = -[TBRemoteFetchResponse initWithResults:tiles:error:](&v18, sel_initWithResults_tiles_error_, v12, 0, v13);

  return v16;
}

- (GEOWiFiQualityNetworkSearchResult)networkSearchResult
{
  return self->_networkSearchResult;
}

- (void)setNetworkSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_networkSearchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkSearchResult, 0);
}

@end
