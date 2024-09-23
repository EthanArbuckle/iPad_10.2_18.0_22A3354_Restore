@implementation OTStashAccountSettingsOperation

- (OTStashAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 accountSettings:(id)a6 accountWide:(BOOL)a7 forceFetch:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  char *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)OTStashAccountSettingsOperation;
  v18 = -[CKKSGroupOperation init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a7;
    v19[129] = a8;
  }

  return (OTStashAccountSettingsOperation *)v19;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[8];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "stashing account settings", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTStashAccountSettingsOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v16 = -[OTStashAccountSettingsOperation accountWide](self, "accountWide");
  v15 = -[OTStashAccountSettingsOperation forceFetch](self, "forceFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cuttlefishXPCWrapper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTStashAccountSettingsOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contextID"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000A056C;
  v17[3] = &unk_1002DC928;
  objc_copyWeak(&v18, (id *)buf);
  +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:](OTStashAccountSettingsOperation, "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:", v16, v15, v8, v10, v12, v14, v17);

  objc_destroyWeak(&v18);
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

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (OTAccountSettingsContainer)accountSettings
{
  return (OTAccountSettingsContainer *)objc_getProperty(self, a2, 166, 1);
}

- (void)setAccountSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (BOOL)accountWide
{
  return self->_accountWide;
}

- (void)setAccountWide:(BOOL)a3
{
  self->_accountWide = a3;
}

- (BOOL)forceFetch
{
  return self->_forceFetch;
}

- (void)setForceFetch:(BOOL)a3
{
  self->_forceFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_forceFetch + 5), 0);
}

+ (void)performWithAccountWide:(BOOL)a3 forceFetch:(BOOL)a4 cuttlefishXPCWrapper:(id)a5 activeAccount:(id)a6 containerName:(id)a7 contextID:(id)a8 reply:(id)a9
{
  _BOOL8 v12;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  id *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v12 = a4;
  v13 = a3;
  v14 = a7;
  v15 = a8;
  v16 = a9;
  if (v13)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000A083C;
    v24[3] = &unk_1002DC8B8;
    v17 = &v25;
    v25 = v14;
    v18 = &v26;
    v26 = v15;
    v19 = &v27;
    v27 = v16;
    objc_msgSend(a5, "fetchAccountSettingsWithSpecificUser:forceFetch:reply:", a6, v12, v24);
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A0AE0;
    v20[3] = &unk_1002DC8E0;
    v17 = &v21;
    v21 = v14;
    v18 = &v22;
    v22 = v15;
    v19 = &v23;
    v23 = v16;
    objc_msgSend(a5, "fetchTrustStateWithSpecificUser:reply:", a6, v20);
  }

}

@end
