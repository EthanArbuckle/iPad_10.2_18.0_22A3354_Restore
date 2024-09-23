@implementation KTFetchIDSSelfOperation

- (KTFetchIDSSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTFetchIDSSelfOperation *v15;
  KTFetchIDSSelfOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTFetchIDSSelfOperation;
  v15 = -[KTGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a4);
    objc_storeStrong((id *)&v16->_application, a3);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
  }

  return v16;
}

+ (id)lastSelfIDSFetch:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smDataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSettingsDate:", CFSTR("KTIDSLastSelfFetch")));

  return v4;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[KTFetchIDSSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = 0;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsOperations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDSSelfOperation application](self, "application"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10015AE2C;
  v8[3] = &unk_100248D28;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v6, "fetchSelfVerificationInfo:completionBlock:", v7, v8);

  objc_destroyWeak(&v9);
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
