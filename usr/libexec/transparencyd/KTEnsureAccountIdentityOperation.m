@implementation KTEnsureAccountIdentityOperation

- (KTEnsureAccountIdentityOperation)initWithDependencies:(id)a3 pcsOperation:(id)a4
{
  id v7;
  id v8;
  char *v9;
  char *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTEnsureAccountIdentityOperation;
  v9 = -[KTGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)(v9 + 134), a4);
    objc_storeStrong((id *)(v10 + 142), a3);
    v10[120] = 0;
  }

  return (KTEnsureAccountIdentityOperation *)v10;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation pcsOperation](self, "pcsOperation"));
  v26 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getCurrentKTPCSIdentity:error:", off_1002A39A8, &v26));
  v5 = v26;

  if (v4)
  {
    -[KTEnsureAccountIdentityOperation setIdentity:](self, "setIdentity:", PCSIdentityGetPublicKey(objc_msgSend(v4, "identity")));
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "code") == (id)-25300)
  {
    if (qword_1002A45D0 != -1)
      dispatch_once(&qword_1002A45D0, &stru_10023E710);
    v6 = qword_1002A45D8;
    if (os_log_type_enabled((os_log_t)qword_1002A45D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "There is no identity, ok to continue creating one", buf, 2u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "code") == (id)27)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    v8 = objc_msgSend(v7, "isEqual:", kPCSErrorDomain);

    if ((v8 & 1) != 0)
    {
LABEL_10:
      v9 = (void *)os_transaction_create("ManateeIdentityCreate-KTAccountKey");
      -[KTEnsureAccountIdentityOperation setTransaction:](self, "setTransaction:", v9);

      v10 = objc_alloc_init((Class)NSOperation);
      -[KTEnsureAccountIdentityOperation setFinishedOp:](self, "setFinishedOp:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation finishedOp](self, "finishedOp"));
      -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v11);

      v12 = objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation pcsOperation](self, "pcsOperation"));
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10004D18C;
      v25[3] = &unk_10023E7B8;
      v25[4] = self;
      -[NSObject createManateeIdentity:service:complete:](v12, "createManateeIdentity:service:complete:", 0, off_1002A39A8, v25);
LABEL_11:

      goto LABEL_20;
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lockStateTracker"));
  v15 = objc_msgSend(v14, "isLockedError:", v5);

  if (v15)
  {
    -[KTResultOperation setError:](self, "setError:", v5);
    goto LABEL_20;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reachabilityTracker"));
  v19 = objc_msgSend((id)objc_opt_class(v17, v18), "isNetworkError:", v5);

  if (v19)
  {
    -[KTResultOperation setError:](self, "setError:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTEnsureAccountIdentityOperation deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "networkTimeout"));
    objc_msgSend(v21, "networkWithFeedback:", 1);

    goto LABEL_20;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:errorLevel:underlyingError:description:](TransparencyError, "errorWithDomain:code:errorLevel:underlyingError:description:", kTransparencyErrorInterface, -350, 4, v5, CFSTR("Identity creation failed")));
  -[KTResultOperation setError:](self, "setError:", v22);

  if (qword_1002A45D0 != -1)
    dispatch_once(&qword_1002A45D0, &stru_10023E730);
  v23 = (void *)qword_1002A45D8;
  if (os_log_type_enabled((os_log_t)qword_1002A45D8, OS_LOG_TYPE_ERROR))
  {
    v12 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "createManateeIdentity no identity returned: %@", buf, 0xCu);

    goto LABEL_11;
  }
LABEL_20:

}

- (BOOL)identityCreated
{
  return self->_identityCreated;
}

- (void)setIdentityCreated:(BOOL)a3
{
  self->_identityCreated = a3;
}

- (NSString)identity
{
  return (NSString *)objc_getProperty(self, a2, 126, 1);
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 126);
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 134, 1);
}

- (void)setPcsOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 158, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_pcsOperation + 6), 0);
  objc_storeStrong((id *)((char *)&self->_identity + 6), 0);
  objc_storeStrong((id *)(&self->_identityCreated + 6), 0);
}

@end
