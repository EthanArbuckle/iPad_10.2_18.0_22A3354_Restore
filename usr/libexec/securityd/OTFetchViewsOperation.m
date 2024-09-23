@implementation OTFetchViewsOperation

- (OTFetchViewsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTFetchViewsOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)(v12 + 150), a3);
    objc_storeStrong((id *)(v13 + 134), a4);
    objc_storeStrong((id *)(v13 + 142), a5);
  }

  return (OTFetchViewsOperation *)v13;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "fetching views", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateHolder"));
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadOrCreateAccountMetadata:", &v18));
  v8 = v18;

  if (!v7 || v8)
  {
    v9 = sub_10000EF14("octagon-ckks");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", buf, 0xCu);
    }

  }
  else
  {
    -[OTFetchViewsOperation setIsInheritedAccount:](self, "setIsInheritedAccount:", objc_msgSend(v7, "isInheritedAccount"));
  }
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "cuttlefishXPCWrapper"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTFetchViewsOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeAccount"));
  v15 = -[OTFetchViewsOperation isInheritedAccount](self, "isInheritedAccount");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100111384;
  v16[3] = &unk_1002DE530;
  objc_copyWeak(&v17, (id *)buf);
  objc_msgSend(v12, "fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:", v14, 0, v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (BOOL)isInheritedAccount
{
  return self->_isInheritedAccount;
}

- (void)setIsInheritedAccount:(BOOL)a3
{
  self->_isInheritedAccount = a3;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_isInheritedAccount + 6), 0);
}

@end
