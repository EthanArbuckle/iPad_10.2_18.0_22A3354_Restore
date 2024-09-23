@implementation OTSetCDPBitOperation

- (OTSetCDPBitOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTSetCDPBitOperation *v12;
  OTSetCDPBitOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTSetCDPBitOperation;
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
  void *v3;
  void *v4;
  id v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSetCDPBitOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateHolder"));
  v9 = 0;
  objc_msgSend(v4, "persistAccountChanges:error:", &stru_1002DC998, &v9);
  v5 = v9;

  v6 = sub_10000EF14("octagon-cdp-status");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to set CDP bit: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully set CDP bit", buf, 2u);
    }

    v7 = objc_claimAutoreleasedReturnValue(-[OTSetCDPBitOperation intendedState](self, "intendedState"));
    -[OTSetCDPBitOperation setNextState:](self, "setNextState:", v7);
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
