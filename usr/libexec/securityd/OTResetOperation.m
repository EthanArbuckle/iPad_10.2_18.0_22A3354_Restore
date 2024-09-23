@implementation OTResetOperation

- (id)init:(id)a3 contextID:(id)a4 reason:(int64_t)a5 idmsTargetContext:(id)a6 idmsCuttlefishPassword:(id)a7 notifyIdMS:(BOOL)a8 intendedState:(id)a9 dependencies:(id)a10 errorState:(id)a11 cuttlefishXPCWrapper:(id)a12
{
  id v17;
  char *v18;
  char *v19;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a3;
  v28 = a4;
  v27 = a6;
  v26 = a7;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v17 = a12;
  v30.receiver = self;
  v30.super_class = (Class)OTResetOperation;
  v18 = -[CKKSGroupOperation init](&v30, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 134), a9);
    objc_storeStrong((id *)(v19 + 142), a11);
    objc_storeStrong((id *)(v19 + 174), a3);
    objc_storeStrong((id *)(v19 + 182), a4);
    objc_storeStrong((id *)(v19 + 190), a12);
    *(_QWORD *)(v19 + 150) = a5;
    objc_storeStrong((id *)(v19 + 158), a6);
    objc_storeStrong((id *)(v19 + 166), a7);
    v19[128] = a8;
    objc_storeStrong((id *)(v19 + 198), a10);
  }

  return v19;
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
  id v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unsigned int IsInternalRelease;
  unsigned __int8 v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon-authkit");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to reset octagon", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTResetOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));

  if (v31)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authKitAdapter"));
    v34 = 0;
    v30 = objc_msgSend(v10, "accountIsDemoAccountByAltDSID:error:", v31, &v34);
    v11 = v34;

    if (v11)
    {
      v14 = sub_10000EF14("SecError");
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-authkit: failed to fetch demo account flag: %@", buf, 0xCu);
      }

    }
    IsInternalRelease = SecIsInternalRelease(v12, v13);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeAccount"));
    v19 = -[OTResetOperation resetReason](self, "resetReason");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation idmsTargetContext](self, "idmsTargetContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation idmsCuttlefishPassword](self, "idmsCuttlefishPassword"));
    v22 = -[OTResetOperation notifyIdMS](self, "notifyIdMS");
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001C395C;
    v32[3] = &unk_1002EB050;
    objc_copyWeak(&v33, (id *)buf);
    LOBYTE(v28) = v30;
    objc_msgSend(v16, "resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:", v18, v19, v20, v21, v22, IsInternalRelease, v28, v32);

    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v23 = sub_10000EF14("authkit");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTResetOperation deps](self, "deps"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "activeAccount"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
    -[CKKSResultOperation setError:](self, "setError:", v27);

    v11 = (id)objc_claimAutoreleasedReturnValue(-[OTResetOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);
  }

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

- (int64_t)resetReason
{
  return *(int64_t *)((char *)&self->_nextState + 6);
}

- (void)setResetReason:(int64_t)a3
{
  *(OctagonStateString **)((char *)&self->_nextState + 6) = (OctagonStateString *)a3;
}

- (NSString)idmsTargetContext
{
  return (NSString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setIdmsTargetContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (NSString)idmsCuttlefishPassword
{
  return (NSString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setIdmsCuttlefishPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (BOOL)notifyIdMS
{
  return self->_notifyIdMS;
}

- (void)setNotifyIdMS:(BOOL)a3
{
  self->_notifyIdMS = a3;
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 174, 1);
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setContextID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 190, 1);
}

- (void)setCuttlefishXPCWrapper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 198, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 198);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 206, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 206);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_cuttlefishXPCWrapper + 6), 0);
  objc_storeStrong((id *)((char *)&self->_contextID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_containerName + 6), 0);
  objc_storeStrong((id *)((char *)&self->_idmsCuttlefishPassword + 6), 0);
  objc_storeStrong((id *)((char *)&self->_idmsTargetContext + 6), 0);
  objc_storeStrong((id *)((char *)&self->_resetReason + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_notifyIdMS + 6), 0);
}

@end
