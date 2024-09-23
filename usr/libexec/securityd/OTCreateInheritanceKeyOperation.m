@implementation OTCreateInheritanceKeyOperation

- (OTCreateInheritanceKeyOperation)initWithUUID:(id)a3 dependencies:(id)a4
{
  id v6;
  id v7;
  OTCreateInheritanceKeyOperation *v8;
  id v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)OTCreateInheritanceKeyOperation;
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
  -[OTCreateInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v5, "initWithDependencies:refetchNeeded:", v6, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000AD7E4;
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
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  id v29;

  v23 = a3;
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation uuid](self, "uuid"));
  v26 = 0;
  v9 = objc_msgSend(v7, "initWithUUID:error:", v8, &v26);
  v10 = v26;
  -[OTCreateInheritanceKeyOperation setIk:](self, "setIk:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation ik](self, "ik"));
  v12 = v11 == 0;

  if (v12)
  {
    v21 = sub_10000EF14("SecError");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v10;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "octagon: failed to create inheritance key: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v15);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation ik](self, "ik"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "recoveryKeyData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "base64EncodedStringWithOptions:", 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "cuttlefishXPCWrapper"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeAccount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyOperation uuid](self, "uuid"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000AD5AC;
    v24[3] = &unk_1002DCB60;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v17, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v19, v15, v6, v23, v20, 2, v24);

    objc_destroyWeak(&v25);
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
  objc_storeStrong((id *)&self->_ik, 0);
}

@end
