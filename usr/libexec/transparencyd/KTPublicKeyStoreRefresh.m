@implementation KTPublicKeyStoreRefresh

- (KTPublicKeyStoreRefresh)initWithDependencies:(id)a3 initialFetch:(BOOL)a4 intendedState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTPublicKeyStoreRefresh;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 142), a3);
    v15[120] = a4;
    objc_storeStrong((id *)(v15 + 126), a6);
    objc_storeStrong((id *)(v15 + 134), a5);
    v16 = v15;
  }

  return (KTPublicKeyStoreRefresh *)v15;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _BYTE buf[24];

  if (-[KTPublicKeyStoreRefresh isInitialFetch](self, "isInitialFetch")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publicKeyStore")),
        v5 = objc_msgSend(v4, "initiallyFetched"),
        v4,
        v3,
        v5))
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh intendedState](self, "intendedState"));
    -[KTPublicKeyStoreRefresh setNextState:](self, "setNextState:", v21);

  }
  else
  {
    if (qword_1002A7648 != -1)
      dispatch_once(&qword_1002A7648, &stru_100246128);
    v6 = (void *)qword_1002A7650;
    if (os_log_type_enabled((os_log_t)qword_1002A7650, OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicKeyStore"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Fetching public key store because disk key store (%@) not ready", buf, 0xCu);

    }
    v10 = objc_alloc_init((Class)NSOperation);
    -[KTPublicKeyStoreRefresh setFinishedOp:](self, "setFinishedOp:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh finishedOp](self, "finishedOp"));
    objc_msgSend(v11, "setName:", CFSTR("KTPublicKeyStoreFetch"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v12);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publicKeyStore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logClient"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataStore"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTPublicKeyStoreRefresh deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "contextStore"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10011B570;
    v22[3] = &unk_1002459D0;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v14, "updatePublicKeyStores:diskStore:contextStore:complete:", v16, v18, v20, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 126);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (BOOL)isInitialFetch
{
  return self->_isInitialFetch;
}

- (void)setIsInitialFetch:(BOOL)a3
{
  self->_isInitialFetch = a3;
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_isInitialFetch + 6), 0);
}

@end
