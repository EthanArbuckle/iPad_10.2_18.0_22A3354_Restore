@implementation KTFetchURIOperation

- (KTFetchURIOperation)initWithURI:(id)a3 application:(id)a4 dependencies:(id)a5
{
  id v8;
  id v9;
  id v10;
  KTFetchURIOperation *v11;
  KTFetchURIOperation *v12;
  id v13;
  KTFetchURIOperation *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)KTFetchURIOperation;
  v11 = -[KTGroupOperation init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFetchURIOperation setUri:](v11, "setUri:", v8);
    -[KTFetchURIOperation setApplication:](v12, "setApplication:", v9);
    -[KTFetchURIOperation setDeps:](v12, "setDeps:", v10);
    v13 = objc_alloc_init((Class)NSOperation);
    -[KTFetchURIOperation setFinishedOp:](v12, "setFinishedOp:", v13);

    v14 = v12;
  }

  return v12;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _BYTE location[12];
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation uri](self, "uri"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation application](self, "application"));
  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyRPCRequestBuilder buildQueryRequest:application:error:](TransparencyRPCRequestBuilder, "buildQueryRequest:application:error:", v3, v4, &v19));
  v6 = v19;
  -[KTFetchURIOperation setQueryRequest:](self, "setQueryRequest:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation queryRequest](self, "queryRequest"));
  LODWORD(v3) = v7 == 0;

  if ((_DWORD)v3)
  {
    if (qword_1002A7730 != -1)
      dispatch_once(&qword_1002A7730, &stru_1002478F8);
    v14 = (void *)qword_1002A7738;
    if (os_log_type_enabled((os_log_t)qword_1002A7738, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation uri](self, "uri"));
      *(_DWORD *)location = 141558530;
      *(_QWORD *)&location[4] = 1752392040;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "FetchKTSelf: failed to create query request for %{mask.hash}@: %@", location, 0x20u);

    }
    -[KTResultOperation setError:](self, "setError:", v6);
  }
  else
  {
    v8 = objc_alloc_init((Class)NSOperation);
    -[KTFetchURIOperation setFinishedOp:](self, "setFinishedOp:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logClient"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchURIOperation queryRequest](self, "queryRequest"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10013A26C;
    v17[3] = &unk_100247980;
    objc_copyWeak(&v18, (id *)location);
    objc_msgSend(v12, "fetchQuery:uuid:completionHandler:", v13, v10, v17);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);

  }
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUri:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (QueryRequest)queryRequest
{
  return (QueryRequest *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQueryRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (QueryResponse)queryResponse
{
  return (QueryResponse *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQueryResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_queryResponse, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_uri, 0);
}

@end
