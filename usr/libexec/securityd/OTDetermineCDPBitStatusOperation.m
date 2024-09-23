@implementation OTDetermineCDPBitStatusOperation

- (OTDetermineCDPBitStatusOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OTDetermineCDPBitStatusOperation *v12;
  OTDetermineCDPBitStatusOperation *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OTDetermineCDPBitStatusOperation;
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
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const void *v12;
  NSObject *v13;
  _BOOL4 v14;
  const void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  id v27;
  const void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  id location;
  id v36;
  uint8_t v37[4];
  id v38;
  __int128 buf;
  uint64_t v40;
  int v41;

  v3 = sub_10000EF14("octagon-cdp-status");
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking CDP status", (uint8_t *)&buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stateHolder"));
  v36 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "loadOrCreateAccountMetadata:", &v36));
  v8 = v36;

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lockStateTracker"));
    v11 = objc_msgSend(v10, "isLockedError:", v8);

    v12 = sub_10000EF14("octagon-cdp-status");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Device is locked! restarting on unlock", (uint8_t *)&buf, 2u);
      }

      -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", CFSTR("WaitForClassCUnlock"));
      -[CKKSResultOperation setError:](self, "setError:", v8);
    }
    else
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", (uint8_t *)&buf, 0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v8);
    }
  }
  else
  {
    v15 = sub_10000EF14("octagon-cdp-status");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v7, "cdpState");
      if (v17 >= 3)
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v17));
      else
        v18 = *(&off_1002DC3A0 + v17);
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CDP is %@", (uint8_t *)&buf, 0xCu);

    }
    if (objc_msgSend(v7, "cdpState") == 2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation intendedState](self, "intendedState"));
      -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", v19);

    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v40 = 0x2020000000;
      v41 = 0;
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cuttlefishXPCWrapper"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "activeAccount"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000722A4;
      v33[3] = &unk_1002DC380;
      objc_copyWeak(&v34, &location);
      v33[4] = &buf;
      objc_msgSend(v21, "trustStatusWithSpecificUser:reply:", v23, v33);

      v24 = objc_msgSend(v7, "cdpState");
      if (v24 != *(_DWORD *)(*((_QWORD *)&buf + 1) + 24))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stateHolder"));
        v31 = 0;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000726AC;
        v32[3] = &unk_1002DDDE0;
        v32[4] = &buf;
        objc_msgSend(v26, "persistAccountChanges:error:", v32, &v31);
        v27 = v31;

        if (v27)
        {
          v28 = sub_10000EF14("octagon-cdp-status");
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v37 = 138412290;
            v38 = v27;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", v37, 0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v27);
        }

        v24 = *(_DWORD *)(*((_QWORD *)&buf + 1) + 24);
      }
      if (v24 == 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation intendedState](self, "intendedState"));
        -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", v30);

      }
      else
      {
        -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", CFSTR("WaitForCDP"));
      }
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end
