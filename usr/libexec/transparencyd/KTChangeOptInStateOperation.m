@implementation KTChangeOptInStateOperation

- (KTChangeOptInStateOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5 optinStates:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  KTChangeOptInStateOperation *v14;
  KTChangeOptInStateOperation *v15;
  KTChangeOptInStateOperation *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTChangeOptInStateOperation;
  v14 = -[KTGroupOperation init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    -[KTChangeOptInStateOperation setDeps:](v14, "setDeps:", v10);
    -[KTChangeOptInStateOperation setOptInStates:](v15, "setOptInStates:", v13);
    -[KTChangeOptInStateOperation setIntendedState:](v15, "setIntendedState:", v11);
    -[KTChangeOptInStateOperation setErrorState:](v15, "setErrorState:", v12);
    v16 = v15;
  }

  return v15;
}

- (void)groupStart
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  _BOOL8 v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  void *v42;

  if (qword_1002A7B78 != -1)
    dispatch_once(&qword_1002A7B78, &stru_10024C2B8);
  v3 = (void *)qword_1002A7B80;
  if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "targetOptInStates"));
    v7 = objc_msgSend(v6, "count");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTarget"));
    *(_DWORD *)buf = 67109378;
    v40 = v7;
    v41 = 2112;
    v42 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "KTChangeOptInStateOperation: start %d/%@", buf, 0x12u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "targetOptInStates"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentTarget"));

    if (v14)
    {
      if (qword_1002A7B78 != -1)
        dispatch_once(&qword_1002A7B78, &stru_10024C2D8);
      v15 = qword_1002A7B80;
      if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "KTChangeOptInStateOperation: already have a target pending", buf, 2u);
      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "targetOptInStates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    objc_msgSend(v20, "setCurrentTarget:", v19);

    v21 = objc_alloc_init((Class)NSOperation);
    -[KTChangeOptInStateOperation setFinishedOp:](self, "setFinishedOp:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cloudRecords"));
    LODWORD(v18) = objc_msgSend(v24, "enforceCKOptInRecords");

    if ((_DWORD)v18)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cloudRecords"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentTarget"));
      v38 = 0;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "getAggregateOptInStateForApplication:error:", v28, &v38));
      v30 = v38;

      if (v30)
      {
        if (objc_msgSend(v30, "code") == (id)9)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "domain"));
          v32 = objc_msgSend(v31, "isEqual:", CFSTR("com.apple.Transparency"));

          if (v32)
          {

            v30 = 0;
          }
        }
        v33 = 0;
      }
      else
      {
        v33 = objc_msgSend(v29, "state") == (id)1;
      }
      -[KTChangeOptInStateOperation evalCurrentOptInState:optInStateError:](self, "evalCurrentOptInState:optInStateError:", v33, v30);

    }
    else
    {
      v30 = (id)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentTarget"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "kvs"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10019A2B8;
      v37[3] = &unk_10024C300;
      v37[4] = self;
      +[KTOptInManagerServer optInManagerOptInState:sync:store:complete:](KTOptInManagerServer, "optInManagerOptInState:sync:store:complete:", v34, 1, v36, v37);

    }
  }
}

- (void)evalCurrentOptInState:(BOOL)a3 optInStateError:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  KTChangeOptInStateOperation *v47;
  id v48;
  uint8_t buf[4];
  _BYTE v50[14];
  __int16 v51;
  _BOOL4 v52;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTarget"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "targetOptInStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (!v11)
  {
    if (qword_1002A7B78 != -1)
      dispatch_once(&qword_1002A7B78, &stru_10024C320);
    v17 = qword_1002A7B80;
    if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v50 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Warning: no target application available: %@", buf, 0xCu);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    objc_msgSend(v18, "setCurrentTarget:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v16);
    goto LABEL_18;
  }
  if (qword_1002A7B78 != -1)
    dispatch_once(&qword_1002A7B78, &stru_10024C340);
  v12 = (void *)qword_1002A7B80;
  if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v50 = objc_msgSend(v11, "targetState");
    *(_WORD *)&v50[4] = 2112;
    *(_QWORD *)&v50[6] = v8;
    v51 = 1024;
    v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Changing state %d for application: %@ (current state: %d)", buf, 0x18u);

  }
  if (v6)
  {
    if (qword_1002A7B78 != -1)
      dispatch_once(&qword_1002A7B78, &stru_10024C360);
    v14 = qword_1002A7B80;
    if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v50 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Warning: changing state despite error in getOptInState: %@", buf, 0xCu);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v15);

    objc_msgSend(v11, "setError:", v6);
LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    objc_msgSend(v16, "completedCurrentTarget");
LABEL_18:

LABEL_19:
    v19 = (id)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    objc_msgSend(v19, "addOperation:", v20);
    goto LABEL_20;
  }
  v21 = objc_msgSend(v11, "targetState");
  if (v21 == (id)1)
  {
    if (!v4)
      goto LABEL_24;
LABEL_29:
    if (qword_1002A7B78 != -1)
      dispatch_once(&qword_1002A7B78, &stru_10024C380);
    v30 = (void *)qword_1002A7B80;
    if (os_log_type_enabled((os_log_t)qword_1002A7B80, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentTarget"));
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v50 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "State target accomplished state, change for %{public}@", buf, 0xCu);

    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stateMonitor"));
    objc_msgSend(v35, "setOptInState:everOptIn:", v4, 1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation intendedState](self, "intendedState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v36);

    goto LABEL_12;
  }
  if (!v21 && !v4)
    goto LABEL_29;
LABEL_24:
  if (!objc_msgSend(v11, "targetState"))
  {
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", CFSTR("SetOptIO"));
    goto LABEL_19;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "accountOperations"));
  v48 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "primaryAccount:", &v48));
  v19 = v48;

  if (v20)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountOperations"));
    v26 = objc_msgSend(v25, "eligibleForOptIn:", v20);

    if ((v26 & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation deps](self, "deps"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "idsOperations"));
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10019A9F8;
      v44[3] = &unk_10024C428;
      v45 = v8;
      v46 = v11;
      v47 = self;
      objc_msgSend(v28, "getKeyTransparencyOptInEligiblityForApplication:withCompletion:", v45, v44);

      v29 = v45;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAccount, -160, CFSTR("Account is not eligble to opt-in")));
      -[KTResultOperation setError:](self, "setError:", v29);
      objc_msgSend(v11, "setError:", v29);
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
      -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
      objc_msgSend(v41, "completedCurrentTarget");

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
      objc_msgSend(v42, "addOperation:", v43);

    }
  }
  else
  {
    -[KTResultOperation setError:](self, "setError:", v19);
    objc_msgSend(v11, "setError:", v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation errorState](self, "errorState"));
    -[KTChangeOptInStateOperation setNextState:](self, "setNextState:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation optInStates](self, "optInStates"));
    objc_msgSend(v38, "completedCurrentTarget");

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[KTChangeOptInStateOperation finishedOp](self, "finishedOp"));
    objc_msgSend(v29, "addOperation:", v39);

  }
LABEL_20:

}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIntendedState:(id)a3
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

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 144, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setErrorState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOptInStates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInStates, 0);
  objc_storeStrong((id *)&self->_errorState, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
}

@end
