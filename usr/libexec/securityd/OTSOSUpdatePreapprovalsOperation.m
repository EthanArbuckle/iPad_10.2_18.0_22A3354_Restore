@implementation OTSOSUpdatePreapprovalsOperation

- (OTSOSUpdatePreapprovalsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 sosNotPresentState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTSOSUpdatePreapprovalsOperation *v15;
  OTSOSUpdatePreapprovalsOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTSOSUpdatePreapprovalsOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_sosNotPresentState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
  }

  return v16;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  const void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  uint8_t buf[4];
  id v31;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sosAdapter"));
  v5 = objc_msgSend(v4, "sosEnabled");

  if ((v5 & 1) != 0)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000CE59C;
    v27[3] = &unk_1002EB598;
    objc_copyWeak(&v28, &location);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v27));
    -[OTSOSUpdatePreapprovalsOperation setFinishedOp:](self, "setFinishedOp:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sosAdapter"));
    v26 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:](OTSOSAdapterHelpers, "peerPublicSigningKeySPKIsForCircle:error:", v9, &v26));
    v11 = v26;

    if (!v10 || v11)
    {
      v20 = sub_10000EF14("SecError");
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't fetch trusted peers; stopping preapproved key update: %@",
          buf,
          0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation sosNotPresentState](self, "sosNotPresentState"));
      -[OTSOSUpdatePreapprovalsOperation setNextState:](self, "setNextState:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation finishedOp](self, "finishedOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v23);

    }
    else
    {
      v12 = sub_10000EF14("octagon-sos");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating SOS preapproved keys to %@", buf, 0xCu);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cuttlefishXPCWrapper"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTSOSUpdatePreapprovalsOperation deps](self, "deps"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeAccount"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000CE78C;
      v24[3] = &unk_1002DD438;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v15, "setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:", v17, v10, v24);

      objc_destroyWeak(&v25);
    }

    objc_destroyWeak(&v28);
  }
  else
  {
    v18 = sub_10000EF14("octagon-sos");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

  }
  objc_destroyWeak(&location);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)sosNotPresentState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSosNotPresentState:(id)a3
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
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_sosNotPresentState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
