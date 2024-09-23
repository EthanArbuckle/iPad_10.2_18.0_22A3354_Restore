@implementation KTFetchIDMSOperation

- (KTFetchIDMSOperation)initWithDependencies:(id)a3 specificUser:(id)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  KTFetchIDMSOperation *v15;
  KTFetchIDMSOperation *v16;
  KTFetchIDMSOperation *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KTFetchIDMSOperation;
  v15 = -[KTGroupOperation init](&v19, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_specificUser, a4);
    objc_storeStrong((id *)&v16->_intendedState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
    v17 = v16;
  }

  return v16;
}

- (void)groupStart
{
  void *v3;
  id v4;
  KTResultOperation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation specificUser](self, "specificUser"));

  if (v3)
  {
    v4 = objc_alloc_init((Class)NSOperation);
    -[KTFetchIDMSOperation setFinishedOp:](self, "setFinishedOp:", v4);

    v5 = objc_alloc_init(KTResultOperation);
    v6 = -[KTResultOperation timeout:](v5, "timeout:", 30000000000);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation finishedOp](self, "finishedOp"));
    -[KTResultOperation addDependency:](v5, "addDependency:", v7);

    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    objc_msgSend(v8, "addOperation:", v5);

    location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idmsOperations"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFetchIDMSOperation specificUser](self, "specificUser"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "altDSID"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100132034;
    v14[3] = &unk_100247220;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "refreshDeviceList:complete:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kTransparencyErrorInternal, -392, 0));
    -[KTResultOperation setError:](self, "setError:", v13);

  }
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

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpecificUser:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificUser, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
