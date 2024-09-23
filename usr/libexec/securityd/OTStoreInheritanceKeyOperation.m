@implementation OTStoreInheritanceKeyOperation

- (OTStoreInheritanceKeyOperation)initWithIK:(id)a3 dependencies:(id)a4
{
  id v7;
  id v8;
  OTStoreInheritanceKeyOperation *v9;
  OTStoreInheritanceKeyOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTStoreInheritanceKeyOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ik, a3);
    objc_storeStrong((id *)&v10->_deps, a4);
  }

  return v10;
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
  _QWORD v10[4];
  OTFetchCKKSKeysOperation *v11;
  id v12;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[OTStoreInheritanceKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [OTFetchCKKSKeysOperation alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  v7 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v5, "initWithDependencies:refetchNeeded:", v6, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000ADEF4;
  v10[3] = &unk_1002EA8C8;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("setting-recovery-tlks"), v10));
  objc_msgSend(v9, "addDependency:", v8);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)proceedWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation ik](self, "ik"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recoveryKeyData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "base64EncodedStringWithOptions:", 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cuttlefishXPCWrapper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTStoreInheritanceKeyOperation ik](self, "ik"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000ADCBC;
  v14[3] = &unk_1002DCB60;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v9, "createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:", v11, v7, &stru_1002EE888, v4, v13, 2, v14);

  objc_destroyWeak(&v15);
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

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_ik, 0);
}

@end
