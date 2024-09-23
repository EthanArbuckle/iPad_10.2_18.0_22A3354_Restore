@implementation WLKPlayHistoryRemoveRequestOperation

- (WLKPlayHistoryRemoveRequestOperation)initWithChannelID:(id)a3 externalID:(id)a4 caller:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  WLKPlayHistoryRemoveRequestOperation *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[WLKPlayActivityDecorateVODOperation identifierForPlayActivityID:channelID:duration:](WLKPlayActivityDecorateVODOperation, "identifierForPlayActivityID:channelID:duration:", a4, a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("deleteId");
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:caller:", CFSTR("watchlist/playHistory/remove"), v10, CFSTR("POST"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](self, "initWithRequestProperties:", v11);
  return v12;
}

- (void)processResponse
{
  void *v3;
  WLKContinueWatchingResponse *v4;
  WLKContinueWatchingResponse *response;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKContinueWatchingResponse *)objc_claimAutoreleasedReturnValue();
  response = self->_response;
  self->_response = v4;

}

- (WLKContinueWatchingResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
