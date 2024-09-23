@implementation KTValidateSelfOperation

- (KTValidateSelfOperation)initWithApplication:(id)a3 dependencies:(id)a4 isOptInSelfValidation:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  char *v11;
  char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)KTValidateSelfOperation;
  v11 = -[KTGroupOperation init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 134), a4);
    objc_storeStrong((id *)(v12 + 142), a3);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("ValidateSelf_URIWaiter", v14);
    objc_msgSend(v12, "setUriQueue:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setTransparentDatas:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setSelfErrors:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setSelfResults:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountKeyService"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "accountKeyService:", v9));
    objc_msgSend(v12, "setAccountKeyServer:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v12, "setCachedTimes:", v21);

    objc_msgSend(v12, "setIsOptInSelfValidation:", v5);
  }

  return (KTValidateSelfOperation *)v12;
}

- (void)groupStart
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[8];

  v3 = objc_alloc_init((Class)NSOperation);
  -[KTValidateSelfOperation setFinishedOp:](self, "setFinishedOp:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v4);

  if (qword_1002A4530 != -1)
    dispatch_once(&qword_1002A4530, &stru_10023C428);
  v5 = qword_1002A4538;
  if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "ValidateSelf: start", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](self, "deps"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "smDataStore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002545C;
  v9[3] = &unk_10023C6F0;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v7, "fetchSelfVerificationInfoForApplication:complete:", v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)hasDeviceErrorForUri:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uriToServerLoggableDatas"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  if (v7)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverLoggableDatas", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "result"))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (void)fillStatus
{
  KTValidateSelfOperation *v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  KTValidateSelfOperation *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  KTPendingFlag *v32;
  void *v33;
  void *v34;
  __int128 v35;
  id obj;
  uint64_t v37;
  void *v38;
  id v39;
  KTValidateSelfOperation *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];

  v2 = self;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  v40 = v2;
  if (v39)
  {
    v37 = *(_QWORD *)v42;
    v38 = 0;
    v4 = 2;
    *(_QWORD *)&v3 = 141558530;
    v35 = v3;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](v2, "selfResults", v35));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

        v9 = objc_msgSend(v8, "unsignedIntegerValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](v2, "selfInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uriToServerLoggableDatas"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v6));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "serverLoggableDatas"));

        if (v9 == (id)1)
        {
          v14 = 0;
        }
        else if (v9)
        {
          v14 = 2;
        }
        else if (-[KTValidateSelfOperation hasDeviceErrorForUri:](v40, "hasDeviceErrorForUri:", v6))
        {
          v14 = 1;
        }
        else
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfErrors](v40, "selfErrors"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("optIn")));

          if (v16)
            v14 = 4;
          else
            v14 = 3;
        }
        if (qword_1002A4530 != -1)
          dispatch_once(&qword_1002A4530, &stru_10023C710);
        v17 = (void *)qword_1002A4538;
        if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v14));
          *(_DWORD *)buf = v35;
          v46 = 1752392040;
          v47 = 2112;
          v48 = v6;
          v49 = 2112;
          v50 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ValidateSelf fillStatus: %{mask.hash}@ has uriStatus %@", buf, 0x20u);

        }
        if (dword_100213FF0[v14] <= dword_100213FF0[v4])
        {
          v20 = v13;

          v38 = v20;
          v4 = v14;
        }
        v2 = v40;

        v5 = (char *)v5 + 1;
      }
      while (v39 != v5);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    }
    while (v39);
  }
  else
  {
    v38 = 0;
    v4 = 2;
  }

  if (qword_1002A4530 != -1)
    dispatch_once(&qword_1002A4530, &stru_10023C730);
  v21 = (void *)qword_1002A4538;
  if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
    *(_DWORD *)buf = 138412290;
    v46 = (uint64_t)v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "ValidateSelf fillStatus: setting selfStatus to %@", buf, 0xCu);

    v2 = v40;
  }
  v24 = v2;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v2, "deps"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stateMonitor"));
  objc_msgSend(v26, "setSelfStatus:", v4);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stateMonitor"));
  objc_msgSend(v28, "setSelfDevices:", v38);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stateMonitor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "statusFilled"));
  objc_msgSend(v31, "fulfill");

  v32 = -[KTPendingFlag initWithFlag:delayInSeconds:]([KTPendingFlag alloc], "initWithFlag:delayInSeconds:", CFSTR("StatusUpdate"), 1.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](v24, "deps"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "flagHandler"));
  objc_msgSend(v34, "handlePendingFlag:", v32);

}

- (BOOL)validateOptInStatusWithAccountKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation ktLogData:accountKey:](self, "ktLogData:accountKey:", v7, v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation deps](self, "deps"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cloudRecords"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
  v17 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "evaluateKTLogData:application:error:", v8, v11, &v17));
  v13 = v17;

  if (v12)
  {
    if (qword_1002A4530 != -1)
      dispatch_once(&qword_1002A4530, &stru_10023C770);
    v14 = qword_1002A4538;
    if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "evaluateKTLogData eval result: %@", buf, 0xCu);
    }
  }
  else
  {
    if (qword_1002A4530 != -1)
      dispatch_once(&qword_1002A4530, &stru_10023C750);
    v15 = qword_1002A4538;
    if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "evaluateKTLogData failure: %@", buf, 0xCu);
    }
    if (a4 && v13)
      *a4 = objc_retainAutorelease(v13);
  }

  return v12 != 0;
}

- (id)ktLogData:(id)a3 accountKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100027CC4;
  v12[3] = &unk_10023C798;
  v13 = v5;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = v7;
  v8 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (void)handleOperationResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *i;
  uint64_t v15;
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
  signed int v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void (**v43)(id, uint64_t, id, void *, void *);
  id v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[6];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t v61[128];
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;

  v43 = (void (**)(id, uint64_t, id, void *, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        v44 = objc_alloc_init((Class)KTSelfValidationDiagnostics);
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "diagnosticsJsonDictionary"));
        objc_msgSend(v44, "setKtSelfVerificationInfoDiagnosticsJson:", v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation accountKeyServer](self, "accountKeyServer"));
        LODWORD(v9) = objc_msgSend(v10, "haveIdentity");

        if ((_DWORD)v9)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v63 = sub_1000285B8;
          v64 = sub_1000285C8;
          v65 = 0;
          v55 = 0;
          v56 = &v55;
          v57 = 0x3032000000;
          v58 = sub_1000285B8;
          v59 = sub_1000285C8;
          v60 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation accountKeyServer](self, "accountKeyServer"));
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_1000285D0;
          v54[3] = &unk_10023C7E0;
          v54[4] = buf;
          v54[5] = &v55;
          objc_msgSend(v11, "signData:completionBlock:", 0, v54);

          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && v56[5])
          {
            objc_msgSend(v44, "setRawAccountKey:");
            objc_msgSend(v44, "setAccountKey:", v56[5]);
          }
          _Block_object_dispose(&v55, 8);

          _Block_object_dispose(buf, 8);
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uriToServerLoggableDatas"));

        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
        if (v13)
        {
          v46 = 1;
          v47 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v51 != v47)
                objc_enumerationMutation(obj);
              v15 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uriToServerLoggableDatas"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v15));

              v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation application](self, "application"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyApplication addApplicationPrefixForIdentifier:uri:](TransparencyApplication, "addApplicationPrefixForIdentifier:uri:", v19, v15));

              v21 = objc_alloc_init((Class)KTSelfValidationURIDiagnostics);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "diagnosticsJsonDictionary"));
              objc_msgSend(v21, "setKtVerificationInfoDiagnosticsJson:", v22);

              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serverLoggableDatas"));
              +[KTLoggableData combineLoggableDatasForUI:byAdding:](KTLoggableData, "combineLoggableDatasForUI:byAdding:", v49, v23);

              v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v20));

              v26 = objc_msgSend(v25, "intValue");
              v27 = CFSTR("OK");
              switch(v26)
              {
                case 0:
                  v46 = v26;
                  v27 = CFSTR("Failed");
                  break;
                case 1:
                  break;
                case 2:
                  v46 = v26;
                  v27 = CFSTR("Pending");
                  break;
                case 3:
                  v27 = CFSTR("Ignored");
                  break;
                default:
                  v46 = 0;
                  v27 = CFSTR("Unknown");
                  break;
              }
              objc_msgSend(v21, "setResult:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation cachedTimes](self, "cachedTimes"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v20));
              objc_msgSend(v21, "setRequestTime:", v29);

              v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfErrors](self, "selfErrors"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v20));

              if (v31)
                objc_msgSend(v21, "setError:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v20));

              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "diagnosticsJsonDictionary"));
              objc_msgSend(v21, "setTransparentDataDiagnosticsJson:", v34);

              objc_msgSend(v48, "setObject:forKeyedSubscript:", v21, v20);
            }
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
          }
          while (v13);
        }
        else
        {
          v46 = 1;
        }

        objc_msgSend(v44, "setUriToDiagnostics:", v48);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allValues"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
        v43[2](v43, v46, v44, v41, v42);

        goto LABEL_32;
      }
    }
    else
    {

    }
  }
  if (qword_1002A4530 != -1)
    dispatch_once(&qword_1002A4530, &stru_10023C7B8);
  v35 = (void *)qword_1002A4538;
  if (os_log_type_enabled((os_log_t)qword_1002A4538, OS_LOG_TYPE_DEFAULT))
  {
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfInfo](self, "selfInfo"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation transparentDatas](self, "transparentDatas"));
    v39 = objc_msgSend(v38, "count");
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[KTValidateSelfOperation selfResults](self, "selfResults"));
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v39;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = objc_msgSend(v40, "count");
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "missing inputdata: selfinfo: %@ transparentDatas: %d selfResults: %d", buf, 0x18u);

  }
  v44 = (id)objc_claimAutoreleasedReturnValue(-[KTResultOperation error](self, "error"));
  v43[2](v43, 0, 0, 0, v44);
LABEL_32:

}

- (NSDate)expectedResolutionDate
{
  return (NSDate *)objc_getProperty(self, a2, 126, 1);
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 134, 1);
}

- (void)setDeps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 134);
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 142, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 142);
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 150, 1);
}

- (void)setFinishedOp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 150);
}

- (OS_dispatch_queue)uriQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 158, 1);
}

- (void)setUriQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 158);
}

- (KTSelfVerificationInfo)selfInfo
{
  return (KTSelfVerificationInfo *)objc_getProperty(self, a2, 166, 1);
}

- (void)setSelfInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 166);
}

- (NSMutableDictionary)transparentDatas
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174, 1);
}

- (void)setTransparentDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 174);
}

- (NSMutableDictionary)selfErrors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182, 1);
}

- (void)setSelfErrors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 182);
}

- (NSMutableDictionary)selfResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190, 1);
}

- (void)setSelfResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 190);
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 198, 1);
}

- (void)setAccountKeyServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 198);
}

- (NSMutableDictionary)cachedTimes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206, 1);
}

- (void)setCachedTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 206);
}

- (BOOL)isOptInSelfValidation
{
  return self->_isOptInSelfValidation;
}

- (void)setIsOptInSelfValidation:(BOOL)a3
{
  self->_isOptInSelfValidation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_accountKeyServer + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfResults + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfErrors + 6), 0);
  objc_storeStrong((id *)((char *)&self->_transparentDatas + 6), 0);
  objc_storeStrong((id *)((char *)&self->_selfInfo + 6), 0);
  objc_storeStrong((id *)((char *)&self->_uriQueue + 6), 0);
  objc_storeStrong((id *)((char *)&self->_finishedOp + 6), 0);
  objc_storeStrong((id *)((char *)&self->_application + 6), 0);
  objc_storeStrong((id *)((char *)&self->_deps + 6), 0);
  objc_storeStrong((id *)((char *)&self->_expectedResolutionDate + 6), 0);
  objc_storeStrong((id *)(&self->_isOptInSelfValidation + 6), 0);
}

@end
