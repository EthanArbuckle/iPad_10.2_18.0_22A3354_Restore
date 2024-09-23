@implementation SHStubbedNetworkRequester

- (SHStubbedNetworkRequester)initWithHTTPResponse:(id)a3 requestData:(id)a4 downloadFileURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  SHStubbedNetworkRequester *v12;
  SHStubbedNetworkRequester *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHStubbedNetworkRequester;
  v12 = -[SHStubbedNetworkRequester init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_requestData, a4);
    objc_storeStrong((id *)&v13->_downloadFileURL, a5);
    objc_storeStrong((id *)&v13->_httpResponse, a3);
  }

  return v13;
}

- (void)downloadResourceFromRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SHStubbedNetworkRequester httpResponse](self, "httpResponse");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHStubbedNetworkRequester downloadFileURL](self, "downloadFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *, _QWORD))a4 + 2))(v6, v8, v7, 0);

}

- (void)performRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[SHStubbedNetworkRequester httpResponse](self, "httpResponse");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHStubbedNetworkRequester requestData](self, "requestData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *, _QWORD))a4 + 2))(v6, v8, v7, 0);

}

- (NSData)requestData
{
  return self->_requestData;
}

- (NSURL)downloadFileURL
{
  return self->_downloadFileURL;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpResponse, 0);
  objc_storeStrong((id *)&self->_downloadFileURL, 0);
  objc_storeStrong((id *)&self->_requestData, 0);
}

@end
