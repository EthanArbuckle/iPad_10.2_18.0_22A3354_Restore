@implementation OTEstablishOperation

- (OTEstablishOperation)initWithDependencies:(id)a3 intendedState:(id)a4 ckksConflictState:(id)a5 errorState:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  OTEstablishOperation *v15;
  OTEstablishOperation *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTEstablishOperation;
  v15 = -[CKKSGroupOperation init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_operationDependencies, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a6);
    objc_storeStrong((id *)&v16->_ckksConflictState, a5);
  }

  return v16;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  OTFetchCKKSKeysOperation *v7;
  void *v8;
  OTFetchCKKSKeysOperation *v9;
  OTFetchCKKSKeysOperation *v10;
  void *v11;
  _QWORD v12[4];
  OTFetchCKKSKeysOperation *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];

  v3 = sub_10000EF14("octagon");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning an establish operation", buf, 2u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100094074;
  v15[3] = &unk_1002EB598;
  objc_copyWeak(&v16, (id *)buf);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v15));
  -[OTEstablishOperation setFinishedOp:](self, "setFinishedOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = [OTFetchCKKSKeysOperation alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v9 = -[OTFetchCKKSKeysOperation initWithDependencies:refetchNeeded:](v7, "initWithDependencies:refetchNeeded:", v8, 0);

  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100094154;
  v12[3] = &unk_1002EA8C8;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v9;
  v13 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("establish-with-keys"), v12));
  objc_msgSend(v11, "addDependency:", v10);
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)proceedWithKeys:(id)a3 pendingTLKShares:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  const void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  NSObject *v23;
  unsigned __int8 v24;
  const void *v25;
  NSObject *v26;
  const void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id location;
  uint8_t buf[4];
  NSObject *v39;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sosAdapter"));
  v10 = objc_msgSend(v9, "sosEnabled");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sosAdapter"));
    v36 = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:error:](OTSOSAdapterHelpers, "peerPublicSigningKeySPKIsForCircle:error:", v12, &v36));
    v14 = v36;

    v15 = sub_10000EF14("octagon-sos");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        v18 = "SOS preapproved keys are %@";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      }
    }
    else if (v17)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v14;
      v18 = "Unable to fetch SOS preapproved keys: %@";
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  v19 = sub_10000EF14("octagon-sos");
  v14 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "SOS not enabled; no preapproved keys", buf, 2u);
  }
  v13 = 0;
LABEL_12:

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateHolder"));
  v35 = 0;
  v22 = objc_msgSend(v21, "persistOctagonJoinAttempt:error:", 2, &v35);
  v23 = v35;

  if (v23)
    v24 = 0;
  else
    v24 = v22;
  if ((v24 & 1) == 0)
  {
    v25 = sub_10000EF14("SecError");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "octagon: failed to save 'attempted join' state: %@", buf, 0xCu);
    }

  }
  v27 = sub_10000EF14("octagon-ckks");
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Beginning establish with keys: %@", buf, 0xCu);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cuttlefishXPCWrapper"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTEstablishOperation operationDependencies](self, "operationDependencies"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "activeAccount"));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100093C6C;
  v33[3] = &unk_1002DEC88;
  objc_copyWeak(&v34, &location);
  objc_msgSend(v30, "establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:", v32, v6, v7, v13, v33);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOperationDependencies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OctagonStateString)ckksConflictState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCkksConflictState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_ckksConflictState, 0);
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
