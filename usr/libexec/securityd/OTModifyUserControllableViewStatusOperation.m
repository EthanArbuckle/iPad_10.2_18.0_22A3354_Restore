@implementation OTModifyUserControllableViewStatusOperation

- (OTModifyUserControllableViewStatusOperation)initWithDependencies:(id)a3 intendedViewStatus:(int)a4 intendedState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  char *v17;
  char *v18;
  objc_super v20;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)OTModifyUserControllableViewStatusOperation;
  v17 = -[CKKSGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 148), a3);
    *((_DWORD *)v18 + 32) = a4;
    objc_storeStrong((id *)(v18 + 132), a5);
    objc_storeStrong((id *)(v18 + 156), a6);
    objc_storeStrong((id *)(v18 + 140), a7);
  }

  return (OTModifyUserControllableViewStatusOperation *)v18;
}

- (void)groupStart
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const void *v16;
  NSObject *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const void *v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id location;
  uint8_t buf[4];
  const __CFString *v34;

  if (-[OTModifyUserControllableViewStatusOperation intendedViewStatus](self, "intendedViewStatus") == 3)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sosAdapter"));
    v5 = objc_msgSend(v4, "sosEnabled");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sosAdapter"));
      v31 = 0;
      v8 = objc_msgSend(v7, "safariViewSyncingEnabled:", &v31);
      v9 = (__CFString *)v31;

      if (v9)
      {
        v10 = sub_10000EF14("SecError");
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "octagon-ckks: Unable to fetch SOS Safari view status: %@", buf, 0xCu);
        }

        -[CKKSResultOperation setError:](self, "setError:", v9);
      }
      else
      {
        v24 = sub_10000EF14("octagon-ckks");
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = CFSTR("disabled");
          if (v8)
            v26 = CFSTR("enabled");
          *(_DWORD *)buf = 138412290;
          v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Currently SOS believes the safari view is '%@'", buf, 0xCu);
        }

        if (v8)
          v27 = 2;
        else
          v27 = 1;
        -[OTModifyUserControllableViewStatusOperation performWithStatus:](self, "performWithStatus:", v27);
        v9 = 0;
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stateHolder"));
      v30 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "loadOrCreateAccountMetadata:", &v30));
      v9 = (__CFString *)v30;

      if (!v14 || v9)
      {
        v16 = sub_10000EF14("octagon-ckks");
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v9;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", buf, 0xCu);
        }

        v15 = 0;
      }
      else
      {
        v15 = objc_msgSend(v14, "isInheritedAccount");
      }
      v18 = sub_10000EF14("octagon-ckks");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Determining peers' user-controllable views policy", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "cuttlefishXPCWrapper"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "activeAccount"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100041EA0;
      v28[3] = &unk_1002DE530;
      objc_copyWeak(&v29, &location);
      objc_msgSend(v21, "fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:", v23, 0, v15, v28);

      objc_destroyWeak(&v29);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    -[OTModifyUserControllableViewStatusOperation performWithStatus:](self, "performWithStatus:", -[OTModifyUserControllableViewStatusOperation intendedViewStatus](self, "intendedViewStatus"));
  }
}

- (void)performWithStatus:(int)a3
{
  uint64_t v3;
  const void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;
  uint8_t buf[4];
  void *v18;

  v3 = *(_QWORD *)&a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = sub_10000EF14("octagon-ckks");
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[OTModifyUserControllableViewStatusOperation intendedViewStatus](self, "intendedViewStatus");
    if (v7 >= 4)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v7));
    else
      v8 = *(&off_1002DBA70 + v7);
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting user-controllable views to %@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cuttlefishXPCWrapper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTModifyUserControllableViewStatusOperation deps](self, "deps"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeAccount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000419F8;
  v14[3] = &unk_1002EACC0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v10, "updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:walrusSetting:webAccess:reply:", v12, 0, 0, 0, 0, 0, 0, v13, 0, 0, 0, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 132, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 140, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 140);
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 148, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 148);
}

- (OctagonStateString)peerMissingState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 156, 1);
}

- (void)setPeerMissingState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 156);
}

- (int)intendedViewStatus
{
  return self->_intendedViewStatus;
}

- (void)setIntendedViewStatus:(int)a3
{
  self->_intendedViewStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 4), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 4), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 4), 0);
  objc_storeStrong((id *)(&self->_intendedViewStatus + 1), 0);
}

@end
