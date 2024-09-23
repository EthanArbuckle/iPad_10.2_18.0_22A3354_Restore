@implementation OTCreateCustodianRecoveryKeyOperation

- (OTCreateCustodianRecoveryKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v6;
  id v7;
  OTCreateCustodianRecoveryKeyOperation *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OTCreateCustodianRecoveryKeyOperation;
  v8 = -[CKKSGroupOperation init](&v11, "init");
  if (v8)
  {
    v9 = v6;
    if (!v6)
      v9 = objc_alloc_init((Class)NSUUID);
    objc_storeStrong((id *)&v8->_uuid, v9);
    if (!v6)

    objc_storeStrong((id *)&v8->_deps, a4);
  }

  return v8;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  OTFetchCKKSKeysOperation *v9;
  void *v10;
  OTFetchCKKSKeysOperation *v11;
  OTFetchCKKSKeysOperation *v12;
  id v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  OTFetchCKKSKeysOperation *v21;
  id v22;
  id v23;
  _BYTE location[24];

  v3 = objc_alloc_init((Class)NSOperation);
  -[OTCreateCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));

  if (v7)
  {
    v8 = v7;
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = [OTFetchCKKSKeysOperation alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    v11 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v9, "initWithDependencies:refetchNeeded:", v10, 0);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000ACF44;
    v20[3] = &unk_1002EB5C0;
    objc_copyWeak(&v23, (id *)location);
    v12 = v11;
    v21 = v12;
    v13 = v8;
    v22 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("setting-recovery-tlks"), v20));
    objc_msgSend(v14, "addDependency:", v12);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v15 = sub_10000EF14("authkit");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeAccount"));
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
    -[CKKSResultOperation setError:](self, "setError:", v19);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
  }

}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void *v21;
  id location;
  uint8_t buf[4];
  void *v24;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v21 = 0;
  v8 = (void *)SecPasswordGenerate(1, &v21, 0);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cuttlefishXPCWrapper"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation uuid](self, "uuid"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000ACAE4;
    v18[3] = &unk_1002DCB38;
    objc_copyWeak(&v20, &location);
    v19 = v8;
    objc_msgSend(v10, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v12, v19, v7, v6, v13, 1, v18);

    objc_destroyWeak(&v20);
  }
  else
  {
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon: failed to create string: %@", buf, 0xCu);
    }

    v16 = v21;
    -[CKKSResultOperation setError:](self, "setError:", v21);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);

  }
  objc_destroyWeak(&location);

}

- (OTCustodianRecoveryKey)crk
{
  return (OTCustodianRecoveryKey *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCrk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_crk, 0);
}

@end
