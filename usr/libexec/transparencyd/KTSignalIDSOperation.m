@implementation KTSignalIDSOperation

- (KTSignalIDSOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 selfValidationResult:(id)a6 stateMachine:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  KTSignalIDSOperation *v17;
  KTSignalIDSOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)KTSignalIDSOperation;
  v17 = -[KTGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_nextState, a5);
    objc_storeStrong((id *)&v18->_selfValidationResult, a6);
    objc_storeStrong((id *)&v18->_stateMachine, a7);
  }

  return v18;
}

- (void)groupStart
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation selfValidationResult](self, "selfValidationResult"));
  -[KTSignalIDSOperation setSelfValidationResult:](self, "setSelfValidationResult:", 0);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
  v5 = (void *)v4;
  v6 = (void *)kKTApplicationIdentifierIDS;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicKeyStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationPublicKeyStore:", v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stateMonitor"));
  v13 = objc_msgSend(v12, "treeStateUnstable:logBeginTime:", v7, objc_msgSend(v10, "patLogBeginningMs"));

  if (v13)
  {
    if (qword_1002A7948 != -1)
      dispatch_once(&qword_1002A7948, &stru_100249710);
    v14 = qword_1002A7950;
    if (os_log_type_enabled((os_log_t)qword_1002A7950, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "KTSignalIDSOperation skipping repair trigger due to unstable tree state", buf, 2u);
    }
  }
  else
  {
    v15 = objc_alloc_init((Class)NSOperation);
    -[KTSignalIDSOperation setFinishedOp:](self, "setFinishedOp:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v16);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSignalIDSOperation deps](self, "deps"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsOperations"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100165F58;
    v19[3] = &unk_100249738;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v18, "triggerIDSCheck:selfValidationResult:complete:", v7, v3, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 144, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSelfValidationResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_selfValidationResult, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
