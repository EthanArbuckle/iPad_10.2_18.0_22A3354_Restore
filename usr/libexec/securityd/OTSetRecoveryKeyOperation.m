@implementation OTSetRecoveryKeyOperation

- (OTSetRecoveryKeyOperation)initWithDependencies:(id)a3 recoveryKey:(id)a4
{
  id v7;
  id v8;
  OTSetRecoveryKeyOperation *v9;
  OTSetRecoveryKeyOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OTSetRecoveryKeyOperation;
  v9 = -[CKKSGroupOperation init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deps, a3);
    objc_storeStrong((id *)&v10->_recoveryKey, a4);
  }

  return v10;
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
  -[OTSetRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));

  if (v7)
  {
    v8 = v7;
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v9 = [OTFetchCKKSKeysOperation alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
    v11 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v9, "initWithDependencies:refetchNeeded:", v10, 0);

    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AC390;
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
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeAccount"));
      *(_DWORD *)location = 138412290;
      *(_QWORD *)&location[4] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", location, 0xCu);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
    -[CKKSResultOperation setError:](self, "setError:", v19);

    v13 = (id)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation finishOp](self, "finishOp"));
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
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cuttlefishXPCWrapper"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeAccount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000AC158;
  v13[3] = &unk_1002E8BE8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v9, "setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:", v11, v12, v7, v6, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (NSString)salt
{
  return self->_salt;
}

- (void)setSalt:(id)a3
{
  objc_storeStrong((id *)&self->_salt, a3);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryKey, a3);
}

- (NSData)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)&self->_voucher, a3);
}

- (NSData)voucherSig
{
  return self->_voucherSig;
}

- (void)setVoucherSig:(id)a3
{
  objc_storeStrong((id *)&self->_voucherSig, a3);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_voucherSig, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_salt, 0);
}

@end
