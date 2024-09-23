@implementation KTFillStatusOperation

- (KTFillStatusOperation)initWithApplication:(id)a3 initialFill:(BOOL)a4 dependencies:(id)a5 intendedState:(id)a6 errorState:(id)a7
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
  v20.super_class = (Class)KTFillStatusOperation;
  v17 = -[KTGroupOperation init](&v20, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 142), a5);
    objc_storeStrong((id *)(v18 + 150), a3);
    objc_storeStrong((id *)(v18 + 126), a6);
    objc_storeStrong((id *)(v18 + 134), a7);
    v18[120] = a4;
  }

  return (KTFillStatusOperation *)v18;
}

+ (id)memoizedKTSelfStatusResult:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "smDataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSettingsData:", CFSTR("KTSelfStatusResult")));

  if (v4)
  {
    v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(KTSelfStatusResult, v5), v4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)groupStart
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;

  if (qword_1002A4540 != -1)
    dispatch_once(&qword_1002A4540, &stru_10023C800);
  v3 = qword_1002A4548;
  if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "FillStatus: start", (uint8_t *)&v13, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stateMonitor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ktStatus"));
  v7 = objc_msgSend(v6, "accountStatus");

  if (v7)
  {
    -[KTFillStatusOperation fillOptInState](self, "fillOptInState");
    -[KTFillStatusOperation fillSystemStatus](self, "fillSystemStatus");
    if (-[KTFillStatusOperation initialFill](self, "initialFill"))
      -[KTFillStatusOperation fillSelfStatus](self, "fillSelfStatus");
    objc_msgSend(v5, "setPendingChanges:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ktStatus"));
    if (v8)
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0));
    else
      v9 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "smDataStore"));
    objc_msgSend(v11, "setSettingsData:data:", CFSTR("KTSelfStatusResult"), v9);

    if (qword_1002A4540 != -1)
      dispatch_once(&qword_1002A4540, &stru_10023C820);
    v12 = qword_1002A4548;
    if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "FillStatus: filled: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  else
  {
    -[KTFillStatusOperation setNextState:](self, "setNextState:", CFSTR("Initializing"));
  }

}

- (void)fillBackgroundStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMonitor"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smDataStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getSettingsNumber:", off_10029E2F8));

  if (v7)
  {
    if (qword_1002A4540 != -1)
      dispatch_once(&qword_1002A4540, &stru_10023C860);
    v8 = qword_1002A4548;
    if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "FillStatus: last background verification result %{public}@", (uint8_t *)&v11, 0xCu);
    }
    if (objc_msgSend(v7, "BOOLValue"))
      v9 = 0;
    else
      v9 = 2;
  }
  else
  {
    if (qword_1002A4540 != -1)
      dispatch_once(&qword_1002A4540, &stru_10023C840);
    v10 = qword_1002A4548;
    if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "FillStatus: no stored background result, defaulting to OK", (uint8_t *)&v11, 2u);
    }
    v9 = 0;
  }
  objc_msgSend(v4, "setSystemStatus:", v9);

}

- (void)fillSystemStatus
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t buf[16];
  uint8_t v26[2];
  __int16 v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMonitor"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ktStatus"));
  v6 = objc_msgSend(v5, "systemStatus");

  if (v6 != (id)5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publicKeyStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationPublicKeyStore:", v9));

    if (v10)
    {
      if ((objc_msgSend(v10, "ready") & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
        v12 = objc_msgSend(v4, "treeStateUnstable:logBeginTime:", v11, objc_msgSend(v10, "patLogBeginningMs"));

        if (v12)
        {
          if (qword_1002A4540 != -1)
            dispatch_once(&qword_1002A4540, &stru_10023C8C0);
          v13 = qword_1002A4548;
          if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FillStatus: system status is tree reset populating", buf, 2u);
          }
          if ((_os_feature_enabled_impl("Transparency", "KTDisableTreeResetStatus") & 1) == 0)
          {
            v21 = v4;
            v22 = 3;
            goto LABEL_31;
          }
          if (qword_1002A4540 != -1)
            dispatch_once(&qword_1002A4540, &stru_10023C8E0);
          v14 = qword_1002A4548;
          if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FillStatus: overriding tree reset system status", v24, 2u);
          }
        }
        if (_os_feature_enabled_impl("Transparency", "KTBackgroundVerificationUI"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ktStatus"));
          v16 = objc_msgSend(v15, "optIn");

          if (v16)
          {
            if (qword_1002A4540 != -1)
              dispatch_once(&qword_1002A4540, &stru_10023C900);
            v17 = qword_1002A4548;
            if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v23 = 0;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FillStatus: reading background verification status", v23, 2u);
            }
            -[KTFillStatusOperation fillBackgroundStatus](self, "fillBackgroundStatus");
            goto LABEL_32;
          }
        }
        v21 = v4;
        v22 = 0;
LABEL_31:
        objc_msgSend(v21, "setSystemStatus:", v22);
LABEL_32:

        goto LABEL_33;
      }
      if (qword_1002A4540 != -1)
        dispatch_once(&qword_1002A4540, &stru_10023C8A0);
      v18 = qword_1002A4548;
      if (!os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEFAULT))
      {
LABEL_30:
        v21 = v4;
        v22 = 4;
        goto LABEL_31;
      }
      *(_WORD *)v26 = 0;
      v19 = "FillStatus: key store not ready";
      v20 = v26;
    }
    else
    {
      if (qword_1002A4540 != -1)
        dispatch_once(&qword_1002A4540, &stru_10023C880);
      v18 = qword_1002A4548;
      if (!os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v27 = 0;
      v19 = "FillStatus: no key store";
      v20 = (uint8_t *)&v27;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
    goto LABEL_30;
  }
LABEL_33:

}

- (void)fillSelfStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMonitor"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accountKeyService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountKeyService:", v7));

  v18 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicPublicKey:", &v18));
  v10 = v18;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataStore"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100029530;
    v16[3] = &unk_10023CA08;
    v17 = v4;
    objc_msgSend(v12, "performAndWaitForLatestSelfRequest:accountKey:block:", v13, v9, v16);

  }
  else
  {
    if (qword_1002A4540 != -1)
      dispatch_once(&qword_1002A4540, &stru_10023CA28);
    v14 = qword_1002A4548;
    if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "FillStatus: unable to get account key for latest self status", v15, 2u);
    }
    objc_msgSend(v4, "setSelfStatus:", 2);
  }

}

- (void)fillOptInState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stateMonitor"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudRecords"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTFillStatusOperation application](self, "application"));
    v18 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getAggregateOptInStateForApplication:error:", v7, &v18));
    v9 = v18;

    if (v8)
    {
      v10 = objc_msgSend(v8, "state");
      v11 = objc_msgSend(v8, "everOptIn");
      v12 = v4;
      v13 = (uint64_t)v10;
LABEL_19:
      objc_msgSend(v12, "setOptInState:everOptIn:", v13, v11);

      goto LABEL_20;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "domain"));
    if (objc_msgSend(v15, "isEqual:", CFSTR("com.apple.Transparency")))
    {
      v16 = objc_msgSend(v9, "code");

      if (v16 == (id)9)
      {
        v12 = v4;
        v13 = 0;
LABEL_18:
        v11 = 0;
        goto LABEL_19;
      }
    }
    else
    {

    }
    if (qword_1002A4540 != -1)
      dispatch_once(&qword_1002A4540, &stru_10023CA48);
    v17 = qword_1002A4548;
    if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "FillStatus: unable to get opt-in for status: %@", buf, 0xCu);
    }
    v12 = v4;
    v13 = 2;
    goto LABEL_18;
  }
  if (qword_1002A4540 != -1)
    dispatch_once(&qword_1002A4540, &stru_10023CA68);
  v14 = qword_1002A4548;
  if (os_log_type_enabled((os_log_t)qword_1002A4548, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "FillStatus: No cloud records to fill status", buf, 2u);
  }
  objc_msgSend(v4, "setOptInState:everOptIn:", 2, 0);
LABEL_20:

}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 126, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 134, 1);
}

- (void)setNextState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 142, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 150, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 158, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (BOOL)initialFill
{
  return self->_initialFill;
}

- (void)setInitialFill:(BOOL)a3
{
  self->_initialFill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_application + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 6), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 6), 0);
  objc_storeStrong((id *)(&self->_initialFill + 6), 0);
}

@end
