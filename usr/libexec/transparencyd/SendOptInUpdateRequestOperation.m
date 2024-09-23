@implementation SendOptInUpdateRequestOperation

- (SendOptInUpdateRequestOperation)initWithDependenics:(id)a3 optInRequest:(id)a4
{
  id v6;
  id v7;
  SendOptInUpdateRequestOperation *v8;
  SendOptInUpdateRequestOperation *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SendOptInUpdateRequestOperation;
  v8 = -[KTGroupOperation init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[SendOptInUpdateRequestOperation setDeps:](v8, "setDeps:", v6);
    -[SendOptInUpdateRequestOperation setRequest:](v9, "setRequest:", v7);
  }

  return v9;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;

  v3 = objc_alloc_init((Class)NSOperation);
  -[SendOptInUpdateRequestOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  if (qword_1002A7AD8 != -1)
    dispatch_once(&qword_1002A7AD8, &stru_10024B7B8);
  v5 = (void *)qword_1002A7AE0;
  if (os_log_type_enabled((os_log_t)qword_1002A7AE0, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation request](self, "request"));
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "sending opt-in state change to IDS: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsOperations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SendOptInUpdateRequestOperation request](self, "request"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018EF60;
  v11[3] = &unk_10024B800;
  v11[4] = self;
  objc_msgSend(v9, "sendOptInUpdateRequest:withCompletion:", v10, v11);

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

- (NSDictionary)request
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (IDSKTOptInResult)result
{
  return (IDSKTOptInResult *)objc_getProperty(self, a2, 144, 1);
}

- (void)setResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
}

@end
