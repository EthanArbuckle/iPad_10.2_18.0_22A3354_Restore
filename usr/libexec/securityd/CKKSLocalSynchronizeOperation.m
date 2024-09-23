@implementation CKKSLocalSynchronizeOperation

- (CKKSLocalSynchronizeOperation)init
{

  return 0;
}

- (CKKSLocalSynchronizeOperation)initWithCKKSKeychainView:(id)a3 operationDependencies:(id)a4
{
  id v6;
  id v7;
  char *v8;
  char *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKKSLocalSynchronizeOperation;
  v8 = -[CKKSGroupOperation init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)(v8 + 132), v6);
    *((_DWORD *)v9 + 32) = 0;
    objc_storeStrong((id *)(v9 + 140), a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "holdLocalSynchronizeOperation"));
    objc_msgSend(v9, "addNullableDependency:", v10);

  }
  return (CKKSLocalSynchronizeOperation *)v9;
}

- (void)groupStart
{
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009DE58;
  v4[3] = &unk_1002DC868;
  v4[4] = self;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CKKSLocalSynchronizeOperation ckks](self, "ckks"));
  v5 = v3;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "dispatchSyncWithSQLTransaction:", v4);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_loadWeakRetained((id *)(&self->_restartCount + 1));
}

- (void)setCkks:(id)a3
{
  objc_storeWeak((id *)(&self->_restartCount + 1), a3);
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 140, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 140);
}

- (int)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(int)a3
{
  self->_restartCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 4), 0);
  objc_destroyWeak((id *)(&self->_restartCount + 1));
}

@end
