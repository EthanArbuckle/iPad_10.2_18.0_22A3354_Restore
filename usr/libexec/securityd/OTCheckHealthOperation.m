@implementation OTCheckHealthOperation

- (OTCheckHealthOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 deviceInfo:(id)a6 skipRateLimitedCheck:(BOOL)a7 reportRateLimitingError:(BOOL)a8 repair:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  char *v18;
  char *v19;
  void *v20;
  objc_super v22;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)OTCheckHealthOperation;
  v18 = -[CKKSGroupOperation init](&v22, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 166), a3);
    objc_storeStrong((id *)(v19 + 134), a4);
    objc_storeStrong((id *)(v19 + 142), a5);
    v20 = *(void **)(v19 + 158);
    *(_QWORD *)(v19 + 158) = 0;

    v19[128] = a7;
    v19[129] = a8;
    v19[130] = a9;
  }

  return (OTCheckHealthOperation *)v19;
}

- (BOOL)checkIfPasscodeIsSetForDevice
{
  __int128 v2;
  int v3;
  _BOOL4 v4;
  const void *v5;
  NSObject *v6;
  _BOOL4 v7;
  const void *v8;
  NSObject *v9;
  int v11;
  _BOOL4 v12;
  _OWORD v13[4];
  __int16 v14;

  v14 = -21846;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  v3 = sub_100026AC0(-3, (uint64_t)v13);
  if (v3)
  {
    v4 = v3;
    v5 = sub_10000EF14("SecError");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 67109120;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "octagon-health: aks_get_device_state failed with: %d", (uint8_t *)&v11, 8u);
    }

    v7 = 0;
  }
  else
  {
    v7 = DWORD1(v13[0]) != 3;
  }
  v8 = sub_10000EF14("octagon-health");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 67109120;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "checkIfPasscodeIsSetForDevice is %{BOOL}d", (uint8_t *)&v11, 8u);
  }

  return v7;
}

- (void)groupStart
{
  const void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  const void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL8 v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  const void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  const void *v38;
  NSObject *v39;
  const void *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  unsigned __int8 v44;
  void *v45;
  void *v46;
  const void *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  unsigned __int8 v52;
  void *v53;
  void *v54;
  const void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  NSErrorUserInfoKey v64;
  id v65;
  _BYTE buf[12];
  __int16 v67;
  void *v68;

  v3 = sub_10000EF14("octagon-health");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning cuttlefish health checkup", buf, 2u);
  }

  v5 = objc_alloc_init((Class)NSOperation);
  -[OTCheckHealthOperation setFinishOp:](self, "setFinishOp:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v6);

  v7 = -[OTCheckHealthOperation skipRateLimitingCheck](self, "skipRateLimitingCheck");
  v8 = sub_10000EF14("octagon-health");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "NOT running rate limiting checks!", buf, 2u);
    }
    goto LABEL_6;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "running rate limiting checks!", buf, 2u);
  }

  -[CKKSResultOperation setError:](self, "setError:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stateHolder"));
  v63 = 0;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastHealthCheckupDate:", &v63));
  v21 = v63;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lockStateTracker"));
  LODWORD(v20) = objc_msgSend(v23, "isLockedError:", v21);

  v24 = sub_10000EF14("octagon-health");
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v20)
  {
    if (v26)
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "last health check timestamp: %@", buf, 0xCu);
    }

    v28 = objc_alloc_init((Class)NSDateComponents);
    if (SecIsInternalRelease(v28, v29))
      v30 = -23;
    else
      v30 = -72;
    objc_msgSend(v28, "setHour:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dateByAddingComponents:toDate:options:", v28, v31, 0));

    if (v9 && -[NSObject compare:](v9, "compare:", v59) != (id)-1)
    {
      v33 = sub_10000EF14("octagon-health");
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Last update is within 3 days (%@); rate-limiting this operation",
          buf,
          0xCu);
      }

      v35 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Rate-limited the OTCheckHealthOperation:%@"), v9));
      v64 = NSLocalizedDescriptionKey;
      v65 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), -67671, v36));

      v38 = sub_10000EF14("octagon-health");
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v37;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "rate limited! %@", buf, 0xCu);
      }

      if (-[OTCheckHealthOperation reportRateLimitingError](self, "reportRateLimitingError"))
      {
        -[CKKSResultOperation setError:](self, "setError:", v37);
      }
      else
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation intendedState](self, "intendedState"));
        -[OTCheckHealthOperation setNextState:](self, "setNextState:", v53);

      }
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
      -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v54);

      goto LABEL_42;
    }
    v40 = sub_10000EF14("octagon-health");
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      v67 = 2112;
      v68 = v59;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Not rate-limiting: last updated %@ vs %@", buf, 0x16u);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stateHolder"));
    v62 = 0;
    v44 = objc_msgSend((id)v43, "persistLastHealthCheck:error:", v31, &v62);
    v35 = v62;

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lockStateTracker"));
    LOBYTE(v43) = objc_msgSend(v46, "isLockedError:", v35);

    if ((v43 & 1) != 0)
    {
      v47 = sub_10000EF14("octagon-health");
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
LABEL_41:

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
        -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v37);
LABEL_42:

        return;
      }
      *(_WORD *)buf = 0;
      v49 = "device is locked, not performing cuttlefish check";
      v50 = v48;
      v51 = 2;
    }
    else
    {
      if (v35)
        v52 = 0;
      else
        v52 = v44;
      if ((v52 & 1) != 0)
      {

LABEL_6:
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "cuttlefishXPCWrapper"));
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "activeAccount"));
        v12 = -[OTCheckHealthOperation checkIfPasscodeIsSetForDevice](self, "checkIfPasscodeIsSetForDevice");
        v13 = -[OTCheckHealthOperation repair](self, "repair");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SecureBackup knownICDPFederations:](SecureBackup, "knownICDPFederations:", 0));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "flowID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation deps](self, "deps"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "deviceSessionID"));
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_10005755C;
        v60[3] = &unk_1002DC040;
        objc_copyWeak(&v61, (id *)buf);
        objc_msgSend(v56, "requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:", v11, v12, v13, v14, v16, v18, v60);

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);
        return;
      }
      v55 = sub_10000EF14("SecError");
      v48 = objc_claimAutoreleasedReturnValue(v55);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        goto LABEL_41;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v35;
      v49 = "octagon-health: failed to persist last health check value:%@";
      v50 = v48;
      v51 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
    goto LABEL_41;
  }
  if (v26)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "device is locked, not performing cuttlefish check", buf, 2u);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v27);

}

- (void)handleRepairSuggestions:(id)a3
{
  void *v4;
  unsigned int v5;
  const void *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  -[OTCheckHealthOperation setResults:](self, "setResults:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation results](self, "results"));
  v5 = objc_msgSend(v4, "resetOctagon");

  if (v5)
  {
    v6 = sub_10000EF14("octagon-health");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting Octagon as per Cuttlefish request", buf, 2u);
    }

    v8 = CFSTR("HealthCheckReset");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation results](self, "results"));
    v10 = objc_msgSend(v9, "leaveTrust");

    if (!v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation intendedState](self, "intendedState"));
      -[OTCheckHealthOperation setNextState:](self, "setNextState:", v13);

      goto LABEL_11;
    }
    v11 = sub_10000EF14("octagon-health");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Leaving clique as per Cuttlefish request", v15, 2u);
    }

    v8 = CFSTR("HealthCheckLeaveClique");
  }
  -[OTCheckHealthOperation setNextState:](self, "setNextState:", v8);
LABEL_11:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCheckHealthOperation finishOp](self, "finishOp"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v14);

}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 134, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (OTDeviceInformation)deviceInfo
{
  return (OTDeviceInformation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setDeviceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (BOOL)skipRateLimitingCheck
{
  return self->_skipRateLimitingCheck;
}

- (BOOL)reportRateLimitingError
{
  return self->_reportRateLimitingError;
}

- (BOOL)repair
{
  return self->_repair;
}

- (TrustedPeersHelperHealthCheckResult)results
{
  return (TrustedPeersHelperHealthCheckResult *)objc_getProperty(self, a2, 158, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 166, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 174, 1);
}

- (void)setFinishOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (BOOL)requiresEscrowCheck
{
  return self->_requiresEscrowCheck;
}

- (void)setRequiresEscrowCheck:(BOOL)a3
{
  self->_requiresEscrowCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_results + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deviceInfo + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_requiresEscrowCheck + 3), 0);
}

@end
