@implementation OTTriggerEscrowUpdateOperation

- (OTTriggerEscrowUpdateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTTriggerEscrowUpdateOperation *v12;
  OTTriggerEscrowUpdateOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTTriggerEscrowUpdateOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_deps, a3);
    objc_storeStrong((id *)&v13->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
  }

  return v13;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  _BOOL4 v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggering escrow update", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTTriggerEscrowUpdateOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation deps](self, "deps"));
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(objc_msgSend(v7, "escrowRequestClass"), "request:", &v20));
  v9 = v20;

  if (!v8 || v9)
  {
    v14 = sub_10000EF14("octagon-sos");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Unable to acquire a EscrowRequest object: %@", buf, 0xCu);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v16);

    -[CKKSResultOperation setError:](self, "setError:", v9);
  }
  else
  {
    v19 = 0;
    objc_msgSend(v8, "triggerEscrowUpdate:error:", CFSTR("octagon-sos"), &v19);
    v9 = v19;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    objc_msgSend(v10, "logResultForEvent:hardFailure:result:", CFSTR("OctagonEventUpgradeSilentEscrow"), 1, v9);

    v11 = sub_10000EF14("octagon-sos");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to request silent escrow update: %@", buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v9);
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requested silent escrow update", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation intendedState](self, "intendedState"));
      -[OTTriggerEscrowUpdateOperation setNextState:](self, "setNextState:", v17);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTTriggerEscrowUpdateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v18);

  }
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
