@implementation OTVouchWithRecoveryKeyOperation

- (OTVouchWithRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 recoveryKey:(id)a6 saveVoucher:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  char *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OTVouchWithRecoveryKeyOperation;
  v17 = -[CKKSGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 166), a3);
    objc_storeStrong((id *)(v18 + 134), a4);
    objc_storeStrong((id *)(v18 + 142), a5);
    objc_storeStrong((id *)(v18 + 182), a6);
    v18[128] = a7;
  }

  return (OTVouchWithRecoveryKeyOperation *)v18;
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
  void *v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher using a recovery key", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTVouchWithRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "altDSID"));

  if (v9)
  {
    -[OTVouchWithRecoveryKeyOperation setSalt:](self, "setSalt:", v9);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cuttlefishXPCWrapper"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeAccount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation salt](self, "salt"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000CF92C;
    v22[3] = &unk_1002DDD68;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v11, "preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:", v13, v14, v15, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v16 = sub_10000EF14("authkit");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeAccount"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
    -[CKKSResultOperation setError:](self, "setError:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v21);

  }
}

- (void)proceedWithRecoveryKeyID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000CF6B4;
  v9[3] = &unk_1002E8BE8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", v8, v4, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation recoveryKey](self, "recoveryKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRecoveryKeyOperation salt](self, "salt"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000CF270;
  v12[3] = &unk_1002DDDB8;
  objc_copyWeak(&v14, &location);
  v11 = v4;
  v13 = v11;
  objc_msgSend(v6, "vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:", v8, v9, v10, v11, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

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

- (NSData)voucher
{
  return *(NSData **)((char *)&self->_nextState + 6);
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_nextState + 6), a3);
}

- (NSData)voucherSig
{
  return *(NSData **)((char *)&self->_voucher + 6);
}

- (void)setVoucherSig:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_voucher + 6), a3);
}

- (BOOL)saveVoucher
{
  return self->_saveVoucher;
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 166, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 174, 1);
}

- (void)setSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSString)recoveryKey
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 190, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_recoveryKey + 6), 0);
  objc_storeStrong((id *)((char *)&self->_salt + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

@end
