@implementation OTDetermineCDPCapableAccountStatusOperation

- (OTDetermineCDPCapableAccountStatusOperation)initWithDependencies:(id)a3 stateIfCDPCapable:(id)a4 stateIfNotCDPCapable:(id)a5 stateIfNoAccount:(id)a6 errorState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  OTDetermineCDPCapableAccountStatusOperation *v17;
  OTDetermineCDPCapableAccountStatusOperation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OTDetermineCDPCapableAccountStatusOperation;
  v17 = -[CKKSGroupOperation init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deps, a3);
    objc_storeStrong((id *)&v18->_intendedState, a4);
    objc_storeStrong((id *)&v18->_stateIfNotCDPCapable, a5);
    objc_storeStrong((id *)&v18->_stateIfNoAccount, a6);
    objc_storeStrong((id *)&v18->_nextState, a7);
  }

  return v18;
}

- (void)groupStart
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  const void *v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  const void *v21;
  NSObject *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const void *v34;
  NSObject *v35;
  void *v36;
  __CFString *v37;
  const void *v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  const void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  __CFString *v51;
  char v52;
  id v53;
  id v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  __CFString *v58;

  v3 = objc_alloc_init((Class)NSOperation);
  -[OTDetermineCDPCapableAccountStatusOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeAccount"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "altDSID"));

  if (v7)
    goto LABEL_2;
  v21 = sub_10000EF14("octagon");
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "activeAccount"));
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "iCloud account is not present or not configured: %@", buf, 0xCu);

  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "accountsAdapter"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "personaAdapter"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "containerName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "contextID"));
  v54 = 0;
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "findAccountForCurrentThread:optionalAltDSID:cloudkitContainerName:octagonContextID:error:", v27, 0, v29, v31, &v54));
  v18 = (__CFString *)v54;

  if (v19)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString altDSID](v19, "altDSID"));

    if (v32)
    {
      if (!v18)
      {
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString altDSID](v19, "altDSID"));

LABEL_2:
        v8 = sub_10000EF14("octagon");
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iCloud account(altDSID %@) is configured; checking if account is CDP capable",
            buf,
            0xCu);
        }

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authKitAdapter"));
        v12 = objc_msgSend(v11, "accountIsCDPCapableByAltDSID:", v7);

        v13 = sub_10000EF14("octagon");
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = CFSTR("not capable");
          if (v12)
            v15 = CFSTR("capable");
          *(_DWORD *)buf = 138412290;
          v56 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Account is %@", buf, 0xCu);
        }

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stateHolder"));
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_10015D5D8;
        v50[3] = &unk_1002E9288;
        v52 = v12;
        v18 = v7;
        v51 = v18;
        v49 = 0;
        objc_msgSend(v17, "persistAccountChanges:error:", v50, &v49);
        v19 = (__CFString *)v49;

        if (v12)
          v20 = objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation intendedState](self, "intendedState"));
        else
          v20 = objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation stateIfNotCDPCapable](self, "stateIfNotCDPCapable"));
        v33 = (void *)v20;
        -[OTDetermineCDPCapableAccountStatusOperation setNextState:](self, "setNextState:", v20);

        if (v19)
        {
          v34 = sub_10000EF14("SecError");
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v19;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "octagon: unable to save new account state: %@", buf, 0xCu);
          }

        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v36);

        v37 = v51;
        goto LABEL_29;
      }
    }
  }
  v38 = sub_10000EF14("SecError");
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "contextID"));
    *(_DWORD *)buf = 138412546;
    v56 = v41;
    v57 = 2112;
    v58 = v18;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "octagon-account: unable to determine active account(%@); assuming no account is present: %@",
      buf,
      0x16u);

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation deps](self, "deps"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stateHolder"));
  v53 = 0;
  objc_msgSend(v43, "persistAccountChanges:error:", &stru_1002E9260, &v53);
  v37 = (__CFString *)v53;

  if (v37)
  {
    v44 = sub_10000EF14("SecError");
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v37;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "octagon: unable to save new account state: %@", buf, 0xCu);
    }

  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation stateIfNoAccount](self, "stateIfNoAccount"));
  -[OTDetermineCDPCapableAccountStatusOperation setNextState:](self, "setNextState:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPCapableAccountStatusOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v47);

LABEL_29:
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

- (OctagonStateString)stateIfNotCDPCapable
{
  return (OctagonStateString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setStateIfNotCDPCapable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (OctagonStateString)stateIfNoAccount
{
  return (OctagonStateString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setStateIfNoAccount:(id)a3
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
  objc_storeStrong((id *)&self->_stateIfNoAccount, 0);
  objc_storeStrong((id *)&self->_stateIfNotCDPCapable, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
