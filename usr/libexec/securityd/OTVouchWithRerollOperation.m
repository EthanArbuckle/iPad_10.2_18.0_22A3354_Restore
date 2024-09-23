@implementation OTVouchWithRerollOperation

- (OTVouchWithRerollOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 saveVoucher:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OTVouchWithRerollOperation;
  v14 = -[CKKSGroupOperation init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 166), a3);
    objc_storeStrong((id *)(v15 + 134), a4);
    objc_storeStrong((id *)(v15 + 142), a5);
    v15[128] = a6;
  }

  return (OTVouchWithRerollOperation *)v15;
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
  id v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE buf[24];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher for reroll", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTVouchWithRerollOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stateHolder"));
  v24 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadOrCreateAccountMetadata:", &v24));
  v10 = v24;

  if (v10)
  {
    v11 = sub_10000EF14("SecError");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "octagon: Error loading account metadata: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation finishOp](self, "finishOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerID"));
    -[OTVouchWithRerollOperation setPeerID:](self, "setPeerID:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "oldPeerID"));
    -[OTVouchWithRerollOperation setOldPeerID:](self, "setOldPeerID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getTPSyncingPolicy"));
    -[OTVouchWithRerollOperation setSyncingPolicy:](self, "setSyncingPolicy:", v16);

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cuttlefishXPCWrapper"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeAccount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation peerID](self, "peerID"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000D069C;
    v22[3] = &unk_1002E8BE8;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v18, "fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:", v20, v21, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)proceedWithFilteredTLKShares:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTVouchWithRerollOperation oldPeerID](self, "oldPeerID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000D0258;
  v11[3] = &unk_1002DDDB8;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  objc_msgSend(v6, "vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:", v8, v9, v10, v11);

  objc_destroyWeak(&v13);
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

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSString)peerID
{
  return (NSString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (NSString)oldPeerID
{
  return (NSString *)objc_getProperty(self, a2, 190, 1);
}

- (void)setOldPeerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 198, 1);
}

- (void)setSyncingPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 198);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_oldPeerID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_peerID + 6), 0);
  objc_storeStrong((id *)((char *)&self->_finishOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucherSig + 6), 0);
  objc_storeStrong((id *)((char *)&self->_voucher + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_saveVoucher + 6), 0);
}

@end
