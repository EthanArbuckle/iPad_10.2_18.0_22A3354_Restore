@implementation KTFetchKTSelfOperation

- (KTFetchKTSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTFetchKTSelfOperation *v15;
  KTFetchKTSelfOperation *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)KTFetchKTSelfOperation;
  v15 = -[KTGroupOperation init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a4);
    objc_storeStrong((id *)&v16->_application, a3);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = dispatch_queue_create("FetchKTSelf_URIWaiter", v18);
    -[KTFetchKTSelfOperation setUriQueue:](v16, "setUriQueue:", v19);

  }
  return v16;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011C9A8;
  v10[3] = &unk_10023A970;
  objc_copyWeak(&v11, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTResultOperation blockOperationWithBlock:](KTResultOperation, "blockOperationWithBlock:", v10));
  -[KTFetchKTSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchKTSelfOperation application](self, "application"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011CB04;
  v8[3] = &unk_10023C6F0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "fetchSelfVerificationInfoForApplication:complete:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTResultOperation)finishedOp
{
  return (KTResultOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUriQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uriQueue, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
