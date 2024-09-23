@implementation KTFetchServerOptInStatus

- (KTFetchServerOptInStatus)initWithDependencies:(id)a3 reason:(id)a4 retryScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  KTFetchServerOptInStatus *v11;
  KTFetchServerOptInStatus *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KTFetchServerOptInStatus;
  v11 = -[KTGroupOperation init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFetchServerOptInStatus setDeps:](v11, "setDeps:", v8);
    -[KTFetchServerOptInStatus setRetryScheduler:](v12, "setRetryScheduler:", v10);
    -[KTFetchServerOptInStatus setReason:](v12, "setReason:", v9);
  }

  return v12;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _BYTE buf[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMonitor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ktStatus"));

  if (objc_msgSend(v5, "optIn") != (id)2
    && (objc_msgSend(v5, "accountStatus") == (id)4 || objc_msgSend(v5, "accountStatus") == (id)1))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stateMonitor"));
    objc_msgSend(v7, "setServerOptInState:", 2);

    if (qword_1002A4550 != -1)
      dispatch_once(&qword_1002A4550, &stru_10023CA88);
    v8 = qword_1002A4558;
    if (os_log_type_enabled((os_log_t)qword_1002A4558, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KTFetchServerOptInStatus: CDP is ready and we found an opt-in state, skipping KT server opt-in state", buf, 2u);
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountOperations"));
    v29 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryAccount:", &v29));
    v11 = v29;

    if (v25)
    {
      v12 = objc_alloc_init((Class)NSOperation);
      -[KTFetchServerOptInStatus setFinishedOp:](self, "setFinishedOp:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus finishedOp](self, "finishedOp"));
      -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "username"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithUnprefixedURI:](IDSURI, "URIWithUnprefixedURI:", v14));
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contextStore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logClient"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10002A5F4;
      v26[3] = &unk_10023CB78;
      objc_copyWeak(&v28, (id *)buf);
      v20 = kKTApplicationIdentifierIDS;
      v21 = v15;
      v27 = v21;
      objc_msgSend(v17, "contextForApplication:logClient:fetchState:completionHandler:", v20, v19, 1, v26);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stateMonitor"));
      objc_msgSend(v23, "setServerOptInState:", 2);

      if (qword_1002A4550 != -1)
        dispatch_once(&qword_1002A4550, &stru_10023CAA8);
      v24 = qword_1002A4558;
      if (os_log_type_enabled((os_log_t)qword_1002A4558, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "KTFetchServerOptInStatus: failed to check server opt-in, no account: %@", buf, 0xCu);
      }
    }

  }
}

- (void)retry
{
  NSObject *v3;
  KTPendingFlag *v4;
  void *v5;
  KTPendingFlag *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  if (qword_1002A4550 != -1)
    dispatch_once(&qword_1002A4550, &stru_10023CB98);
  v3 = qword_1002A4558;
  if (os_log_type_enabled((os_log_t)qword_1002A4558, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "triggering a server opt-in state fetch retry", v12, 2u);
  }
  v4 = [KTPendingFlag alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus retryScheduler](self, "retryScheduler"));
  v6 = -[KTPendingFlag initWithFlag:conditions:scheduler:](v4, "initWithFlag:conditions:scheduler:", CFSTR("CheckServerOptIn"), 2, v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "flagHandler"));
  objc_msgSend(v8, "handlePendingFlag:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateMonitor"));
  objc_msgSend(v10, "setNewServerOptInRequests:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchServerOptInStatus retryScheduler](self, "retryScheduler"));
  objc_msgSend(v11, "trigger");

}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTNearFutureScheduler)retryScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRetryScheduler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_retryScheduler, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
