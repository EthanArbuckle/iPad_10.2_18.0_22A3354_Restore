@implementation TVPResourceLoadingRequest

- (TVPResourceLoadingRequest)initWithAssetResourceLoadingRequest:(id)a3
{
  id v5;
  TVPResourceLoadingRequest *v6;
  TVPResourceLoadingRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVPResourceLoadingRequest;
  v6 = -[TVPResourceLoadingRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_loadingRequest, a3);

  return v7;
}

- (NSURL)URL
{
  void *v2;
  void *v3;
  void *v4;

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (BOOL)isCancelled
{
  void *v2;
  char v3;

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCancelled");

  return v3;
}

- (void)finishLoadingWithResponse:(id)a3 data:(id)a4 renewalDate:(id)a5 redirect:(id)a6
{
  AVAssetResourceLoadingRequest *loadingRequest;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  loadingRequest = self->_loadingRequest;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  -[AVAssetResourceLoadingRequest setResponse:](loadingRequest, "setResponse:", a3);
  -[AVAssetResourceLoadingRequest setRedirect:](self->_loadingRequest, "setRedirect:", v11);

  -[AVAssetResourceLoadingRequest contentInformationRequest](self->_loadingRequest, "contentInformationRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRenewalDate:", v12);

  -[AVAssetResourceLoadingRequest dataRequest](self->_loadingRequest, "dataRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "respondWithData:", v13);

  -[AVAssetResourceLoadingRequest finishLoading](self->_loadingRequest, "finishLoading");
}

- (void)finishLoadingWithResponseData:(id)a3 renewalDate:(id)a4 keyType:(int64_t)a5
{
  id *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (a5 == 1)
  {
    v8 = (id *)MEMORY[0x24BDB20D8];
  }
  else
  {
    if (a5 != 2)
    {
      v18 = 0;
      goto LABEL_7;
    }
    v8 = (id *)MEMORY[0x24BDB20E0];
  }
  v18 = *v8;
LABEL_7:
  v9 = a4;
  v10 = a3;
  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInformationRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentType:", v18);

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInformationRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRenewalDate:", v9);

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "respondWithData:", v10);

  -[TVPResourceLoadingRequest loadingRequest](self, "loadingRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "finishLoading");

}

- (void)finishLoadingWithError:(id)a3
{
  -[AVAssetResourceLoadingRequest finishLoadingWithError:](self->_loadingRequest, "finishLoadingWithError:", a3);
}

- (NSNumber)avRequestID
{
  void *v2;
  void *v3;

  -[TVPResourceLoadingRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tvp_numberForKey:", CFSTR("FCUP_Response_RequestID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[AVAssetResourceLoadingRequest serializableRepresentation](self->_loadingRequest, "serializableRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (TVPResourceLoadingRequest)init
{
  -[TVPResourceLoadingRequest doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (AVAssetResourceLoadingRequest)loadingRequest
{
  return self->_loadingRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingRequest, 0);
}

@end
