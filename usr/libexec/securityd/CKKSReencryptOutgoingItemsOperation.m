@implementation CKKSReencryptOutgoingItemsOperation

- (CKKSReencryptOutgoingItemsOperation)init
{

  return 0;
}

- (CKKSReencryptOutgoingItemsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 holdOperation:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKKSReencryptOutgoingItemsOperation *v15;
  CKKSReencryptOutgoingItemsOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSReencryptOutgoingItemsOperation;
  v15 = -[CKKSResultOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    -[CKKSReencryptOutgoingItemsOperation addNullableDependency:](v16, "addNullableDependency:", v14);
  }

  return v16;
}

- (void)main
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSReencryptOutgoingItemsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10019B820;
  v5[3] = &unk_1002EA880;
  v5[4] = self;
  objc_msgSend(v4, "dispatchSyncWithSQLTransaction:", v5);

}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 88, 1);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained((id *)&self->_ckks);
}

- (void)setCkks:(id)a3
{
  objc_storeWeak((id *)&self->_ckks, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ckks);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
