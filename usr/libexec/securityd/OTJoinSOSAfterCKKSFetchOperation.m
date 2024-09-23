@implementation OTJoinSOSAfterCKKSFetchOperation

- (OTJoinSOSAfterCKKSFetchOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTJoinSOSAfterCKKSFetchOperation *v12;
  OTJoinSOSAfterCKKSFetchOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTJoinSOSAfterCKKSFetchOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intendedState, a4);
    objc_storeStrong((id *)&v13->_nextState, a5);
    objc_storeStrong((id *)&v13->_operationDependencies, a3);
  }

  return v13;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  const void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  OTWaitOnPriorityViews *v11;
  void *v12;
  OTWaitOnPriorityViews *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sosAdapter"));
  v5 = objc_msgSend(v4, "sosEnabled");

  v6 = sub_10000EF14("octagon-sos");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "joining SOS", buf, 2u);
    }

    v9 = objc_alloc_init((Class)NSOperation);
    -[OTJoinSOSAfterCKKSFetchOperation setFinishedOp:](self, "setFinishedOp:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v10);

    v11 = [OTWaitOnPriorityViews alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
    v13 = -[OTWaitOnPriorityViews initWithDependencies:](v11, "initWithDependencies:", v12);

    v14 = -[CKKSResultOperation timeout:](v13, "timeout:", 10000000000);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v13);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100085E54;
    v16[3] = &unk_1002EB598;
    objc_copyWeak(&v17, (id *)buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSResultOperation named:withBlock:](CKKSResultOperation, "named:withBlock:", CFSTR("join-sos-after-fetch"), v16));
    objc_msgSend(v15, "addDependency:", v13);
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }

    v13 = (OTWaitOnPriorityViews *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation intendedState](self, "intendedState"));
    -[OTJoinSOSAfterCKKSFetchOperation setNextState:](self, "setNextState:", v13);
  }

}

- (void)proceedAfterFetch
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  const void *v18;
  NSObject *v19;
  char v20;
  void *v21;
  const void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  id v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sosAdapter"));
  v27 = 0;
  v5 = objc_msgSend(v4, "joinAfterRestore:", &v27);
  v6 = v27;

  if (!v6
    || objc_msgSend(v6, "code") != (id)1
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "domain")),
        v8 = objc_msgSend(v7, "isEqualToString:", kSOSErrorDomain),
        v7,
        !v8))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sosAdapter"));
    v26 = 0;
    v12 = objc_msgSend(v11, "circleStatus:", &v26);
    v9 = v26;

    if (v9 && objc_msgSend(v9, "code") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
      if (objc_msgSend(v13, "isEqualToString:", kSOSErrorDomain))
      {

        goto LABEL_22;
      }

    }
    if (v12 != -1)
    {
      if (v6 || ((v5 ^ 1) & 1) != 0 || v12 == 2 || v12 == 1)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation operationDependencies](self, "operationDependencies"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sosAdapter"));
        v25 = 0;
        v16 = objc_msgSend(v15, "resetToOffering:", &v25);
        v17 = v25;

        v18 = sub_10000EF14("octagon-sos");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          v29 = v16;
          v30 = 2112;
          v31 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SOSCCResetToOffering complete: %d %@", buf, 0x12u);
        }

        v20 = v17 ? 0 : v16;
        if ((v20 & 1) == 0)
        {
          -[CKKSResultOperation setError:](self, "setError:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
          -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v24);

          goto LABEL_26;
        }
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation intendedState](self, "intendedState"));
      -[OTJoinSOSAfterCKKSFetchOperation setNextState:](self, "setNextState:", v21);

LABEL_25:
      v17 = (id)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v17);
LABEL_26:

      goto LABEL_27;
    }
LABEL_22:
    v22 = sub_10000EF14("octagon-sos");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v29 = v12;
      v30 = 2112;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Error fetching circle status: %d, error:%@", buf, 0x12u);
    }

    -[CKKSResultOperation setError:](self, "setError:", v9);
    goto LABEL_25;
  }
  -[CKKSResultOperation setError:](self, "setError:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[OTJoinSOSAfterCKKSFetchOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v9);
LABEL_27:

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

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOperationDependencies:(id)a3
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
  objc_storeStrong((id *)&self->_operationDependencies, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
