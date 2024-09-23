@implementation OctagonCheckTrustStateOperation

- (OctagonCheckTrustStateOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OctagonCheckTrustStateOperation *v12;
  OctagonCheckTrustStateOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OctagonCheckTrustStateOperation;
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
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = objc_alloc_init((Class)NSOperation);
  -[OctagonCheckTrustStateOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuttlefishXPCWrapper"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeAccount"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015E580;
  v9[3] = &unk_1002E92B8;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "fetchTrustStateWithSpecificUser:reply:", v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)afterTPHTrustState:(id)a3 trustedPeers:(id)a4
{
  id v5;
  const void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  const void *v17;
  NSObject *v18;
  _BOOL4 v19;
  const __CFString *v20;
  char v21;
  uint64_t v22;
  const void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  unsigned int v28;
  const void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  unsigned int v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  const void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  const void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  unsigned int v57;
  id v58;
  const void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned __int8 v66;
  OctagonPendingFlag *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  unsigned int v72;
  const void *v73;
  NSObject *v74;
  void *v75;
  __CFString **v76;
  void *v77;
  void *v78;
  unsigned int v79;
  const void *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int v84;
  const void *v85;
  NSObject *v86;
  _BOOL4 v87;
  __CFString **v88;
  unsigned int v89;
  const void *v90;
  _BOOL4 v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  const char *v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  uint8_t buf[4];
  id v102;
  __int16 v103;
  void *v104;

  v5 = a3;
  if (objc_msgSend(v5, "memberChanges"))
  {
    v6 = sub_10000EF14("octagon");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Member list changed", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "octagonAdapter"));
    objc_msgSend(v9, "sendTrustedPeerSetChangedUpdate");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stateHolder"));
  v100 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadOrCreateAccountMetadata:", &v100));
  v13 = v100;

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lockStateTracker"));
    v16 = objc_msgSend(v15, "isLockedError:", v13);

    v17 = sub_10000EF14("SecError");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 138412290;
        v102 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to fetch current account state. Can't ensure consistency: %@", buf, 0xCu);
      }

      goto LABEL_93;
    }
    if (v19)
    {
      *(_DWORD *)buf = 138412290;
      v102 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to fetch current account state due to lock state: %@", buf, 0xCu);
    }

    v20 = CFSTR("WaitForClassCUnlock");
LABEL_92:
    -[OctagonCheckTrustStateOperation setNextState:](self, "setNextState:", v20);
LABEL_93:
    v58 = (id)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation finishedOp](self, "finishedOp"));
    -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v58);
    goto LABEL_94;
  }
  if ((objc_msgSend(v5, "peerStatus") & 4) != 0
    || (objc_msgSend(v5, "peerStatus") & 0x20) != 0)
  {
    v21 = 1;
    v22 = 1;
  }
  else if ((objc_msgSend(v5, "peerStatus") & 0x40) != 0
         || (objc_msgSend(v5, "peerStatus") & 2) != 0
         || (objc_msgSend(v5, "peerStatus") & 1) != 0)
  {
    v21 = 0;
    v22 = 2;
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  v23 = sub_10000EF14("octagon-consistency");
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = TPPeerStatusToString(objc_msgSend(v5, "peerStatus"));
    v26 = (id)objc_claimAutoreleasedReturnValue(v25);
    v27 = *(&off_1002E92F8 + v22);
    *(_DWORD *)buf = 138412546;
    v102 = v26;
    v103 = 2112;
    v104 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "TPH's trust state (%@) is considered %@", buf, 0x16u);

  }
  v28 = objc_msgSend(v12, "trustState");
  if ((_DWORD)v22 == v28)
  {
    v29 = sub_10000EF14("octagon-consistency");
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = TPPeerStatusToString(objc_msgSend(v5, "peerStatus"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138412290;
      v102 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "TPH peer status matches cache: (%@)", buf, 0xCu);

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    objc_msgSend(v33, "logSuccessForEventNamed:", CFSTR("OctagonEventCheckTrustState"));

  }
  else
  {
    v34 = sub_10000EF14("SecError");
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = objc_msgSend(v12, "trustState");
      if (v36 >= 3)
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v36));
      else
        v37 = *(&off_1002E92F8 + v36);
      v38 = v37;
      v39 = *(&off_1002E92F8 + v22);
      *(_DWORD *)buf = 138412546;
      v102 = v38;
      v103 = 2112;
      v104 = v39;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Locally cached status (%@) does not match TPH's current peer status (%@)", buf, 0x16u);

    }
    v40 = objc_msgSend(v12, "trustState");
    v41 = v21 ^ 1;
    if (v40 != 2)
      v41 = 1;
    if ((v41 & 1) == 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
      objc_msgSend(v42, "logHardFailureForEventNamed:withAttributes:", CFSTR("OctagonEventCheckTrustState"), 0);

    }
    objc_msgSend(v12, "setTrustState:", v22);
  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
  if (objc_msgSend(v43, "isEqualToString:", v44))
  {

    goto LABEL_39;
  }
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
  if (v48)
  {

LABEL_46:
    v50 = sub_10000EF14("SecError");
    v51 = objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
      *(_DWORD *)buf = 138412546;
      v102 = v52;
      v103 = 2112;
      v104 = v53;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Locally cached peer ID (%@) does not match TPH's current peer ID (%@)", buf, 0x16u);

    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
    objc_msgSend(v12, "setPeerID:", v54);

    goto LABEL_49;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));

  if (v49)
    goto LABEL_46;
LABEL_39:
  v45 = sub_10000EF14("octagon-consistency");
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerID"));
    *(_DWORD *)buf = 138412290;
    v102 = v47;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "TPH peer ID matches cache: (%@)", buf, 0xCu);

  }
  if ((_DWORD)v22 == v28)
  {
LABEL_54:
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "osVersion"));

    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "deviceInformationAdapter"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "osVersion"));

      if (v64)
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "osVersion"));
        v66 = objc_msgSend(v64, "isEqualToString:", v65);

        if ((v66 & 1) == 0)
        {
          v67 = -[OctagonPendingFlag initWithFlag:conditions:]([OctagonPendingFlag alloc], "initWithFlag:conditions:", CFSTR("recd_push"), 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "flagHandler"));
          objc_msgSend(v69, "handlePendingFlag:", v67);

        }
      }

    }
    v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
    if (v70)
    {
      v71 = (void *)v70;
      v72 = objc_msgSend(v12, "trustState");

      if (v72 == 2)
      {
        v73 = sub_10000EF14("octagon");
        v74 = objc_claimAutoreleasedReturnValue(v73);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerID"));
          *(_DWORD *)buf = 138412290;
          v102 = v75;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Appear to be trusted for peer %@; ensuring correct state",
            buf,
            0xCu);

        }
        v76 = &off_1002E92E0;
        goto LABEL_91;
      }
    }
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "sosAdapter"));
    if (objc_msgSend(v78, "sosEnabled"))
    {
      v79 = objc_msgSend(v12, "trustState");

      if (v79 != 2)
      {
        v80 = sub_10000EF14("octagon");
        v74 = objc_claimAutoreleasedReturnValue(v80);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trustStateAsString:", objc_msgSend(v12, "trustState")));
          *(_DWORD *)buf = 138412290;
          v102 = v81;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Have iCloud account but not trusted in Octagon yet: %@; attempting SOS upgrade",
            buf,
            0xCu);

        }
        v76 = &off_1002E92E8;
        goto LABEL_91;
      }
    }
    else
    {

    }
    v89 = objc_msgSend(v12, "trustState");
    v90 = sub_10000EF14("octagon");
    v74 = objc_claimAutoreleasedReturnValue(v90);
    v91 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
    if (v89 == 2)
    {
      if (v91)
      {
        v92 = objc_msgSend(v12, "trustState");
        if (v92 >= 3)
          v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v92));
        else
          v93 = *(&off_1002E92F8 + v92);
        *(_DWORD *)buf = 138412290;
        v102 = v93;
        v96 = "Unknown trust state (%@). Assuming untrusted...";
LABEL_89:
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, v96, buf, 0xCu);

      }
    }
    else if (v91)
    {
      v95 = objc_msgSend(v12, "trustState");
      if (v95 >= 3)
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v95));
      else
        v93 = *(&off_1002E92F8 + v95);
      *(_DWORD *)buf = 138412290;
      v102 = v93;
      v96 = "Have iCloud account but not trusted in Octagon (%@)";
      goto LABEL_89;
    }
    v76 = &off_1002E92F0;
LABEL_91:

    v20 = *v76;
    goto LABEL_92;
  }
LABEL_49:
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "stateHolder"));
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_10015E524;
  v98[3] = &unk_1002EAF10;
  v99 = v12;
  v97 = 0;
  v57 = objc_msgSend(v56, "persistAccountChanges:error:", v98, &v97);
  v58 = v97;

  if (v57 && !v58)
  {
    v59 = sub_10000EF14("octagon-consistency");
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Saved new account metadata", buf, 2u);
    }

    goto LABEL_54;
  }
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation deps](self, "deps"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "lockStateTracker"));
  v84 = objc_msgSend(v83, "isLockedError:", v58);

  v85 = sub_10000EF14("SecError");
  v86 = objc_claimAutoreleasedReturnValue(v85);
  v87 = os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT);
  if (v84)
  {
    if (v87)
    {
      *(_DWORD *)buf = 138412290;
      v102 = v58;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to save new account state due to lock state: %@", buf, 0xCu);
    }

    v88 = &off_1002E92D8;
  }
  else
  {
    if (v87)
    {
      *(_DWORD *)buf = 138412290;
      v102 = v58;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "octagon-consistency: Unable to save new account state. Erroring: %@", buf, 0xCu);
    }

    -[CKKSResultOperation setError:](self, "setError:", v58);
    v88 = &off_1002E92A8;
  }
  -[OctagonCheckTrustStateOperation setNextState:](self, "setNextState:", *v88);
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonCheckTrustStateOperation finishedOp](self, "finishedOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v94);

LABEL_94:
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
