@implementation OTRecreateInheritanceKeyOperation

- (OTRecreateInheritanceKeyOperation)initWithUUID:(id)a3 oldIK:(id)a4 dependencies:(id)a5
{
  id v8;
  id v9;
  id v10;
  OTRecreateInheritanceKeyOperation *v11;
  id v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)OTRecreateInheritanceKeyOperation;
  v11 = -[CKKSGroupOperation init](&v14, "init");
  if (v11)
  {
    v12 = v8;
    if (!v8)
      v12 = objc_alloc_init((Class)NSUUID);
    objc_storeStrong((id *)&v11->_uuid, v12);
    if (!v8)

    objc_storeStrong((id *)&v11->_oldIK, a4);
    objc_storeStrong((id *)&v11->_deps, a5);
  }

  return v11;
}

- (void)groupStart
{
  id v3;
  void *v4;
  OTFetchCKKSKeysOperation *v5;
  void *v6;
  OTFetchCKKSKeysOperation *v7;
  OTFetchCKKSKeysOperation *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  OTFetchCKKSKeysOperation *v14;
  __CFString *v15;
  id v16;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[OTRecreateInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v5, "initWithDependencies:refetchNeeded:", v6, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000AE804;
  v13 = &unk_1002EB5C0;
  objc_copyWeak(&v16, &location);
  v8 = v7;
  v14 = v8;
  v15 = &stru_1002EE888;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("setting-recovery-tlks"), &v10));
  objc_msgSend(v9, "addDependency:", v8, v10, v11, v12, v13);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3 salt:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  uint8_t buf[4];
  id v30;

  v24 = a3;
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation oldIK](self, "oldIK"));
  v27 = 0;
  v10 = objc_msgSend(v7, "initWithUUID:oldIK:error:", v8, v9, &v27);
  v11 = v27;
  -[OTRecreateInheritanceKeyOperation setIk:](self, "setIk:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation ik](self, "ik"));
  v13 = v12 == 0;

  if (v13)
  {
    v22 = sub_10000EF14("SecError");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon: failed to recreate inheritance key: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation ik](self, "ik"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "recoveryKeyData"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cuttlefishXPCWrapper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTRecreateInheritanceKeyOperation uuid](self, "uuid"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000AE5CC;
    v25[3] = &unk_1002DCB60;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v18, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v20, v16, v6, v24, v21, 2, v25);

    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIk:(id)a3
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

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOldIK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_oldIK, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ik, 0);
}

@end
