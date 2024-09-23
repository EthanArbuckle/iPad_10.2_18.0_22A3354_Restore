@implementation APServerRetryRequester

- (id)initFromServerRequest:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  APServerRetryRequester *v11;
  objc_super v13;

  v5 = a3;
  v6 = sub_100103440((uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = sub_100103434((uint64_t)v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v13.receiver = self;
  v13.super_class = (Class)APServerRetryRequester;
  v11 = -[APServerRequester initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:](&v13, "initWithBundleID:requestIdentifier:contextIdentifier:contentIdentifier:idAccount:", v7, v9, 0, 0, v10);

  if (v11)
    objc_storeStrong((id *)&v11->_serverRequest, a3);

  return v11;
}

- (id)headers
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRetryRequester serverRequest](self, "serverRequest"));
  v3 = sub_10010344C((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (Class)responseClass
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRetryRequester serverRequest](self, "serverRequest"));
  v3 = sub_100103464((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (Class)v4;
}

- (id)protoBuffer
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRetryRequester serverRequest](self, "serverRequest"));
  v3 = sub_100103458((uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (id)buildURLForRequestProtobuf:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APServerRetryRequester serverRequest](self, "serverRequest", a3));
  v4 = sub_1000303DC((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

- (void)responseReceived:(id)a3 responseProtobuf:(id)a4 error:(id)a5
{
  -[APServerRetryRequester setResponseResult:](self, "setResponseResult:", +[APLegacyMetricRetryManager resultForResponse:error:](APLegacyMetricRetryManager, "resultForResponse:error:", a3, a5));
}

- (int64_t)responseResult
{
  return self->_responseResult;
}

- (void)setResponseResult:(int64_t)a3
{
  self->_responseResult = a3;
}

- (APServerRequest)serverRequest
{
  return self->_serverRequest;
}

- (void)setServerRequest:(id)a3
{
  objc_storeStrong((id *)&self->_serverRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverRequest, 0);
}

@end
