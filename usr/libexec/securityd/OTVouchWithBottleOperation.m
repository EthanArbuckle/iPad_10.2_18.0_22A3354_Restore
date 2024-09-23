@implementation OTVouchWithBottleOperation

- (OTVouchWithBottleOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 bottleID:(id)a6 entropy:(id)a7 bottleSalt:(id)a8 saveVoucher:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  char *v19;
  char *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v16 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)OTVouchWithBottleOperation;
  v19 = -[CKKSGroupOperation init](&v25, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 190), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 142), a5);
    objc_storeStrong((id *)(v20 + 150), a6);
    objc_storeStrong((id *)(v20 + 158), a7);
    objc_storeStrong((id *)(v20 + 166), a8);
    v20[128] = a9;
  }

  return (OTVouchWithBottleOperation *)v20;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher using a bottle with escrow record id: %@", buf, 0xCu);

  }
  v6 = objc_alloc_init((Class)NSOperation);
  -[OTVouchWithBottleOperation setFinishedOp:](self, "setFinishedOp:", v6);

  v7 = objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
  LOBYTE(v7) = v8 == 0;

  if ((v7 & 1) == 0)
  {
    v9 = sub_10000EF14("octagon");
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "using passed in altdsid, altdsid is: %@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeAccount"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "altDSID"));

  if (v10)
  {
    -[OTVouchWithBottleOperation setBottleSalt:](self, "setBottleSalt:", v10);
LABEL_8:

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cuttlefishXPCWrapper"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeAccount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000854F8;
    v25[3] = &unk_1002DC570;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v15, "preflightVouchWithBottleWithSpecificUser:bottleID:reply:", v17, v18, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    return;
  }
  v19 = sub_10000EF14("authkit");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "activeAccount"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, CFSTR("No altDSID configured")));
  -[CKKSResultOperation setError:](self, "setError:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v24);

}

- (void)proceedWithPeerID:(id)a3 refetchWasNeeded:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cuttlefishXPCWrapper"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeAccount"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100085280;
  v10[3] = &unk_1002E8BE8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v7, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", v9, v5, v10);

  objc_destroyWeak(&v11);
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
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleID](self, "bottleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation entropy](self, "entropy"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithBottleOperation bottleSalt](self, "bottleSalt"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100084E3C;
  v13[3] = &unk_1002DDDB8;
  objc_copyWeak(&v15, &location);
  v12 = v4;
  v14 = v12;
  objc_msgSend(v6, "vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:", v8, v9, v10, v11, v12, v13);

  objc_destroyWeak(&v15);
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

- (NSString)bottleID
{
  return *(NSString **)((char *)&self->_nextState + 6);
}

- (void)setBottleID:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_nextState + 6), a3);
}

- (NSData)entropy
{
  return *(NSData **)((char *)&self->_bottleID + 6);
}

- (void)setEntropy:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_bottleID + 6), a3);
}

- (NSString)bottleSalt
{
  return *(NSString **)((char *)&self->_entropy + 6);
}

- (void)setBottleSalt:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_entropy + 6), a3);
}

- (NSData)voucher
{
  return *(NSData **)((char *)&self->_bottleSalt + 6);
}

- (void)setVoucher:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_bottleSalt + 6), a3);
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
  return (OTOperationDependencies *)objc_getProperty(self, a2, 190, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 198, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 198);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_bottleSalt + 6), 0);
  objc_storeStrong((id *)((char *)&self->_entropy + 6), 0);
  objc_storeStrong((id *)((char *)&self->_bottleID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

@end
