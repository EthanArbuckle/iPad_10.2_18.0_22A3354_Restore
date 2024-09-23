@implementation OTCreateInheritanceKeyWithClaimTokenAndWrappingKey

- (OTCreateInheritanceKeyWithClaimTokenAndWrappingKey)initWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 dependencies:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OTCreateInheritanceKeyWithClaimTokenAndWrappingKey *v14;
  id v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)OTCreateInheritanceKeyWithClaimTokenAndWrappingKey;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  if (v14)
  {
    v15 = v10;
    if (!v10)
      v15 = objc_alloc_init((Class)NSUUID);
    objc_storeStrong((id *)&v14->_uuid, v15);
    if (!v10)

    objc_storeStrong((id *)&v14->_claimTokenData, a4);
    objc_storeStrong((id *)&v14->_wrappingKeyData, a5);
    objc_storeStrong((id *)&v14->_deps, a6);
  }

  return v14;
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
  -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v5, "initWithDependencies:refetchNeeded:", v6, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_1000AF1BC;
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
  void *v10;
  id v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const void *v23;
  NSObject *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id location;
  uint8_t buf[4];
  id v31;

  v25 = a3;
  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = objc_alloc((Class)OTInheritanceKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey claimTokenData](self, "claimTokenData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey wrappingKeyData](self, "wrappingKeyData"));
  v28 = 0;
  v11 = objc_msgSend(v7, "initWithUUID:claimTokenData:wrappingKeyData:error:", v8, v9, v10, &v28);
  v12 = v28;
  -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey setIk:](self, "setIk:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey ik](self, "ik"));
  v14 = v13 == 0;

  if (v14)
  {
    v23 = sub_10000EF14("SecError");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "octagon: failed to create inheritance key (w/claimtoken+wrappingkey): %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey ik](self, "ik"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recoveryKeyData"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "base64EncodedStringWithOptions:", 0));

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "cuttlefishXPCWrapper"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "activeAccount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey uuid](self, "uuid"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000AEF84;
    v26[3] = &unk_1002DCB60;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v19, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v21, v17, v6, v25, v22, 2, v26);

    objc_destroyWeak(&v27);
  }

  objc_destroyWeak(&location);
}

- (NSData)claimTokenData
{
  return (NSData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setClaimTokenData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSData)wrappingKeyData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setWrappingKeyData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OTInheritanceKey)ik
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OTInheritanceKey)oldIK
{
  return (OTInheritanceKey *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOldIK:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_oldIK, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ik, 0);
  objc_storeStrong((id *)&self->_wrappingKeyData, 0);
  objc_storeStrong((id *)&self->_claimTokenData, 0);
}

@end
