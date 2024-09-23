@implementation CKKSDeleteCurrentItemPointersOperation

- (CKKSDeleteCurrentItemPointersOperation)initWithCKKSOperationDependencies:(id)a3 viewState:(id)a4 accessGroup:(id)a5 identifiers:(id)a6 ckoperationGroup:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CKKSDeleteCurrentItemPointersOperation *v17;
  CKKSDeleteCurrentItemPointersOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CKKSDeleteCurrentItemPointersOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_viewState, a4);
    objc_storeStrong((id *)&v18->_accessGroup, a5);
    objc_storeStrong((id *)&v18->_identifiers, a6);
    objc_storeStrong((id *)&v18->_ckoperationGroup, a7);
  }

  return v18;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSDeleteCurrentItemPointersOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "databaseProvider"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100144780;
  v5[3] = &unk_1002E91A0;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "dispatchSyncWithSQLTransaction:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CKKSKeychainViewState)viewState
{
  return (CKKSKeychainViewState *)objc_getProperty(self, a2, 128, 1);
}

- (CKModifyRecordsOperation)modifyRecordsOperation
{
  return (CKModifyRecordsOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setModifyRecordsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCkoperationGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)accessGroup
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAccessGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)identifiers
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ckoperationGroup, 0);
  objc_storeStrong((id *)&self->_modifyRecordsOperation, 0);
  objc_storeStrong((id *)&self->_viewState, 0);
}

@end
