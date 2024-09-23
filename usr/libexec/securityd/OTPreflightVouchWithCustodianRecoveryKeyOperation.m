@implementation OTPreflightVouchWithCustodianRecoveryKeyOperation

- (OTPreflightVouchWithCustodianRecoveryKeyOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 tphcrk:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v15;
  OTPreflightVouchWithCustodianRecoveryKeyOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTPreflightVouchWithCustodianRecoveryKeyOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    objc_storeStrong((id *)&v16->_tphcrk, a6);
  }

  return v16;
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
  _QWORD v12[4];
  id v13;
  uint8_t buf[8];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating voucher using a custodian recovery key", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTPreflightVouchWithCustodianRecoveryKeyOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cuttlefishXPCWrapper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeAccount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPreflightVouchWithCustodianRecoveryKeyOperation tphcrk](self, "tphcrk"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000F8674;
  v12[3] = &unk_1002DDD68;
  objc_copyWeak(&v13, (id *)buf);
  objc_msgSend(v8, "preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:", v10, v11, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)salt
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSalt:(id)a3
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

- (TrustedPeersHelperCustodianRecoveryKey)tphcrk
{
  return (TrustedPeersHelperCustodianRecoveryKey *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTphcrk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tphcrk, 0);
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
