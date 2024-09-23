@implementation KTConfigBagFetchOperation

- (KTConfigBagFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 triggerInterface:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTConfigBagFetchOperation *v15;
  KTConfigBagFetchOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTConfigBagFetchOperation;
  v15 = -[KTGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_triggerInterface, a6);
  }

  return v16;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[KTConfigBagFetchOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTConfigBagFetchOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTConfigBagFetchOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logClient"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100132498;
  v7[3] = &unk_1002459D0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "configureFromNetwork:", v7);

  objc_destroyWeak(&v8);
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTriggerInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerInterface, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
