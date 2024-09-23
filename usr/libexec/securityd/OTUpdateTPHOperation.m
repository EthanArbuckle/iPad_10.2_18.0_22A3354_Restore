@implementation OTUpdateTPHOperation

- (OTUpdateTPHOperation)initWithDependencies:(id)a3 intendedState:(id)a4 peerUnknownState:(id)a5 determineCDPState:(id)a6 errorState:(id)a7 forceRefetch:(BOOL)a8 retryFlag:(id)a9
{
  id v15;
  id v16;
  id v17;
  char *v18;
  char *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)OTUpdateTPHOperation;
  v18 = -[CKKSGroupOperation init](&v25, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v19 + 142), a4);
    objc_storeStrong((id *)(v19 + 134), a7);
    objc_storeStrong((id *)(v19 + 158), a5);
    objc_storeStrong((id *)(v19 + 166), a6);
    v19[128] = a8;
    objc_storeStrong((id *)(v19 + 182), a9);
  }

  return (OTUpdateTPHOperation *)v19;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  TrustedPeersHelperIntendedTPPBSecureElementIdentity *v7;
  NSObject *v8;
  const void *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  void *v23;
  TrustedPeersHelperIntendedTPPBSecureElementIdentity *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  BOOL v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id location;
  uint8_t buf[4];
  id v38;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000CB8FC;
  v34[3] = &unk_1002EB598;
  objc_copyWeak(&v35, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v34));
  -[OTUpdateTPHOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateHolder"));
  v33 = 0;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadOrCreateAccountMetadata:", &v33));
  v28 = v33;

  if (!v29 || v28)
  {
    v9 = sub_10000EF14("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v28;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "octagon: Unable to load current metadata: %@", buf, 0xCu);
    }
    v24 = 0;
  }
  else
  {
    v7 = [TrustedPeersHelperIntendedTPPBSecureElementIdentity alloc];
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "parsedSecureElementIdentity"));
    v24 = -[TrustedPeersHelperIntendedTPPBSecureElementIdentity initWithSecureElementIdentity:](v7, "initWithSecureElementIdentity:", v8);
  }

  if (objc_msgSend(v29, "hasAttemptedJoin"))
    v21 = objc_msgSend(v29, "attemptedJoin") == 2;
  else
    v21 = 0;
  if (-[OTUpdateTPHOperation forceRefetch](self, "forceRefetch"))
  {
    v10 = sub_10000EF14("octagon");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Forcing a full refetch", buf, 2u);
    }

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "cuttlefishXPCWrapper"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "activeAccount"));
  v20 = -[OTUpdateTPHOperation forceRefetch](self, "forceRefetch");
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "deviceInformationAdapter"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "deviceInformationAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "serialNumber"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTUpdateTPHOperation deps](self, "deps"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceInformationAdapter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "osVersion"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000CBC10;
  v30[3] = &unk_1002DD378;
  objc_copyWeak(&v31, &location);
  v32 = v21;
  objc_msgSend(v23, "updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:", v22, v20, v13, v16, v19, 0, 0, 0, v24, 0, 0, v30);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (BOOL)forceRefetch
{
  return self->_forceRefetch;
}

- (void)setForceRefetch:(BOOL)a3
{
  self->_forceRefetch = a3;
}

- (OctagonStateString)peerUnknownState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 158, 1);
}

- (void)setPeerUnknownState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (OctagonStateString)determineCDPState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 166, 1);
}

- (void)setDetermineCDPState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (OctagonFlagString)retryFlag
{
  return (OctagonFlagString *)objc_getProperty(self, a2, 182, 1);
}

- (void)setRetryFlag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_determineCDPState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_peerUnknownState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)(&self->_forceRefetch + 6), 0);
}

@end
