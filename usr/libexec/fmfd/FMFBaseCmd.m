@implementation FMFBaseCmd

+ (id)nextTransactionId
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_10004F078;
  v9 = sub_10004F088;
  v10 = 0;
  if (qword_1000B3870 != -1)
    dispatch_once(&qword_1000B3870, &stru_10009ADB0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000140F0;
  block[3] = &unk_10009ADD8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1000B3878, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientPid, 0);
  objc_storeStrong((id *)&self->_requestTokensStatusMap, 0);
  objc_storeStrong((id *)&self->_requestTokensStatusCode, 0);
  objc_storeStrong((id *)&self->_requestTokens, 0);
  objc_storeStrong((id *)&self->_callerIdentifier, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
}

- (BOOL)isTransactionCompleteWithError:(id)a3
{
  unsigned int v5;
  BOOL v6;
  void *v7;
  id v8;
  int64_t modelOldRetryCount;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  int64_t v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v41;
  NSObject *v42;
  int64_t v43;
  unsigned int v44;
  objc_super v45;
  uint8_t buf[4];
  FMFBaseCmd *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  FMFBaseCmd *v51;
  __int16 v52;
  unsigned int v53;

  v45.receiver = self;
  v45.super_class = (Class)FMFBaseCmd;
  v5 = -[FMFBaseCmd isTransactionCompleteWithError:](&v45, "isTransactionCompleteWithError:");
  v6 = v5;
  if (!a3)
  {
    if (v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
      v8 = objc_msgSend(v7, "statusCode");

      if (v8 == (id)409)
      {
        modelOldRetryCount = self->modelOldRetryCount;
        if (modelOldRetryCount > 0)
        {
          v10 = sub_100011D0C();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received 409 (modelIsOld) too many times. Flagging an error", buf, 2u);
          }

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1011, 0));
          -[FMFBaseCmd setError:](self, "setError:", v12);

          return 1;
        }
        self->modelOldRetryCount = modelOldRetryCount + 1;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v36, "postNotificationName:object:userInfo:", off_1000B2FE8, self, 0);

        v37 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
        objc_msgSend(v37, "clearDataAndServerContext");

        v38 = sub_100011D0C();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Received 409 (modelIsOld). Replaying the command after clearing local state", buf, 2u);
        }

LABEL_40:
        -[FMFBaseCmd sendRequest](self, "sendRequest");
        return 0;
      }
    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
  v14 = objc_msgSend(v13, "statusCode");

  if (v14 == (id)401)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1003, 0));
    -[FMFBaseCmd setError:](self, "setError:", v15);

    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMFErrorServerErrorUnauthorized for command(%@), renewing account credentials", buf, 0xCu);
    }

    v18 = -[FMFBaseCmd isUserAction](self, "isUserAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v19, "updateAccountCredentials:", v18);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v20, "setAccountStateUnauthorizedDueTo401");
    goto LABEL_12;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
  v22 = objc_msgSend(v21, "statusCode");

  if (v22 == (id)403)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd valueForResponseHTTPHeader:](self, "valueForResponseHTTPHeader:", CFSTR("x-forbidden-reason")));
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("40399")))
      v24 = 1005;
    else
      v24 = 100;
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, v24, 0));
    -[FMFBaseCmd setError:](self, "setError:", v22);
LABEL_18:

LABEL_19:
    return v6;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
  if ((uint64_t)objc_msgSend(v25, "statusCode") <= 499)
  {

  }
  else
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
    v26 = (uint64_t)objc_msgSend(v22, "statusCode");

    if (v26 <= 599)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
      if (objc_msgSend(v27, "statusCode") == (id)500)
        v28 = 1006;
      else
        v28 = 1007;

      if (!-[FMFBaseCmd isUserAction](self, "isUserAction") && -[FMFBaseCmd retryCount](self, "retryCount") <= 0)
      {
        v41 = sub_100011D0C();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = -[FMFBaseCmd retryCount](self, "retryCount");
          v44 = -[FMFBaseCmd isUserAction](self, "isUserAction");
          *(_DWORD *)buf = 134218754;
          v47 = (FMFBaseCmd *)v43;
          v48 = 2048;
          v49 = v28;
          v50 = 2112;
          v51 = self;
          v52 = 1024;
          v53 = v44;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Retrying due to 500/503, retryCount(%ld), statusCode(%ld), command(%@), isUserAction(%d)", buf, 0x26u);
        }

        -[FMFBaseCmd setRetryCount:](self, "setRetryCount:", (char *)-[FMFBaseCmd retryCount](self, "retryCount") + 1);
        goto LABEL_40;
      }
      v29 = sub_100011D0C();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = -[FMFBaseCmd retryCount](self, "retryCount");
        v32 = -[FMFBaseCmd isUserAction](self, "isUserAction");
        *(_DWORD *)buf = 134218754;
        v47 = (FMFBaseCmd *)v31;
        v48 = 2048;
        v49 = v28;
        v50 = 2112;
        v51 = self;
        v52 = 1024;
        v53 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Returning error code 500/503 retryCount(%ld), statusCode(%ld), command(%@), isUserAction(%d)", buf, 0x26u);
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, v28, 0));
      -[FMFBaseCmd setError:](self, "setError:", v33);

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
      objc_msgSend(v20, "enter5XXGracePeriod");
LABEL_12:

      return v6;
    }
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
  v34 = (uint64_t)objc_msgSend(v23, "statusCode");
  if (v34 >= 200)
  {
    v22 = (id)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
    if ((uint64_t)objc_msgSend(v22, "statusCode") <= 299)
      goto LABEL_18;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd error](self, "error"));

  if (v34 >= 200)
  if (!v35)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 100, 0));
    -[FMFBaseCmd setError:](self, "setError:", v23);
    goto LABEL_19;
  }
  return v6;
}

- (id)path
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[Configuration FMFServiceService](Configuration, "FMFServiceService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dsid"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "deviceUDID"));

  if (qword_1000B3888 != -1)
    dispatch_once(&qword_1000B3888, &stru_10009ADF8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v10 = objc_msgSend(v9, "isAudioAccessory");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_1000B3880));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_1000B3880));
  v13 = objc_claimAutoreleasedReturnValue(-[FMFBaseCmd pathSuffix](self, "pathSuffix"));
  v14 = (void *)v13;
  if (v10)
    v15 = CFSTR("%@ha/%@/%@/%@");
  else
    v15 = CFSTR("%@%@/%@/%@");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v3, v11, v12, v13));

  return v16;
}

- (FMFBaseCmd)initWithClientSession:(id)a3
{
  id v4;
  FMFBaseCmd *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  FMFBaseCmd *v31;
  void *v32;
  void *v33;
  objc_super v35;
  uint8_t buf[4];
  FMFBaseCmd *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)FMFBaseCmd;
  v5 = -[FMFBaseCmd init](&v35, "init");
  if (v5)
  {
    if (!v4)
    {
      v6 = sub_100011D0C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Created without clientSession: %@", buf, 0xCu);
      }

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientPid"));
    -[FMFBaseCmd setClientPid:](v5, "setClientPid:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientBundleId"));
    -[FMFBaseCmd setClientBundleId:](v5, "setClientBundleId:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));

    v12 = objc_msgSend((id)objc_opt_class(v5), "nextTransactionId");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[FMFBaseCmd setTransactionId:](v5, "setTransactionId:", v13);

    if (+[Configuration FMFServiceUseSSL](Configuration, "FMFServiceUseSSL"))
      v14 = CFSTR("https");
    else
      v14 = CFSTR("http");
    -[FMFBaseCmd setScheme:](v5, "setScheme:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dsid"));
    -[FMFBaseCmd setUsername:](v5, "setUsername:", v15);

    -[FMFBaseCmd setPassword:](v5, "setPassword:", CFSTR("password"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fmfAppHostName"));
    -[FMFBaseCmd setHost:](v5, "setHost:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd host](v5, "host"));
    if (!v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[Configuration FMFServiceHost](Configuration, "FMFServiceHost"));
      -[FMFBaseCmd setHost:](v5, "setHost:", v18);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](Daemon, "sharedInstance"));
    v20 = objc_msgSend(v19, "isInternalBuild");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      objc_msgSend(v21, "synchronize");

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringForKey:", CFSTR("FMFDSchemeOverride")));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringForKey:", CFSTR("FMFDHostOverride")));

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringForKey:", CFSTR("FMFDPortOverride")));

      if (objc_msgSend(v23, "length") && objc_msgSend(v25, "length") && objc_msgSend(v27, "length"))
      {
        -[FMFBaseCmd setScheme:](v5, "setScheme:", v23);
        -[FMFBaseCmd setHost:](v5, "setHost:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v27, "integerValue")));
        -[FMFBaseCmd setPort:](v5, "setPort:", v28);

        v29 = sub_100011D0C();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (FMFBaseCmd *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd scheme](v5, "scheme"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd host](v5, "host"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd port](v5, "port"));
          *(_DWORD *)buf = 138412802;
          v37 = v31;
          v38 = 2112;
          v39 = v32;
          v40 = 2112;
          v41 = v33;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Overriding scheme:%@ host:%@ and port: %@", buf, 0x20u);

        }
      }

    }
    -[FMFBaseCmd setupAuthentication](v5, "setupAuthentication");

  }
  return v5;
}

- (BOOL)isUserAction
{
  return 0;
}

- (id)clientContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  id v47;
  uint8_t buf[4];
  id v50;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone localTimeZone](NSTimeZone, "localTimeZone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("appName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "isFMFAppRemoved")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("isFMFAppRemoved"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceUDID"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceUDID"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceClass"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("deviceClass"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v4, "e928760c5fbc1719e59c427e2be01ce6")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("deviceHasPasscode"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("productType"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osVersion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("osVersion"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osBuildVersion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("buildVersion"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "unlockState")));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("unlockState"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "processId")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  objc_msgSend(v3, "safelySetObject:forKey:", v16, CFSTR("processId"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v17, "timeIntervalSince1970");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", floor(v18 * 1000.0)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("currentTime"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "abbreviation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "secondsFromGMT")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v20, v21));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("timezone"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("fencingEnabled"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("7.0"), CFSTR("appVersion"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd platform](self, "platform"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("platform"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "countryCode"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("countryCode"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKey:", NSLocaleCountryCode));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("regionCode"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iCloudAccountName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "account"));
  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "apsEnvironment"));
  v32 = (void *)v31;
  v33 = off_1000B3010;
  if (v31)
    v33 = (__CFString *)v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAPSHandler instanceForEnvironment:](FMFAPSHandler, "instanceForEnvironment:", v34));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "apsToken"));

  if (v28)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("signedInAs"));
  if (v36)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("apsToken"));
  v37 = sub_100011D0C();
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v36;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "APSToken %@", buf, 0xCu);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd callerIdentifier](self, "callerIdentifier"));
  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd callerIdentifier](self, "callerIdentifier"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("callerIdHandle"));

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd clientPid](self, "clientPid"));

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd clientPid](self, "clientPid"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("contextApp"));

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd clientBundleId](self, "clientBundleId"));

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd clientBundleId](self, "clientBundleId"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("contextBundleApp"));

  }
  v45 = sub_100011D0C();
  v46 = objc_claimAutoreleasedReturnValue(v45);
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v3;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "FMBaseCmd: clientContext %@", buf, 0xCu);
  }

  v47 = v3;
  return v47;
}

- (void)setupAuthentication
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dsid"));
  -[FMFBaseCmd setUsername:](self, "setUsername:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "account"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fmfAppToken"));

  -[FMFBaseCmd setPassword:](self, "setPassword:", v8);
}

- (id)headers
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)FMFBaseCmd;
  v2 = -[FMFBaseCmd headers](&v22, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "modelVersion"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osBuildVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FMFD/%@ %@/%@(%@)"), v6, v7, v8, v9, 0));

  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("User-Agent"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("3.0"), CFSTR("X-Apple-Find-API-Ver"));
  objc_msgSend(v3, "setObject:forKey:", CFSTR("1.0"), CFSTR("X-Apple-Realm-Support"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "osBuildVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "clientInfoVersionTagString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@> <%@;%@;%@> <%@/%@>"),
                    v11,
                    v12,
                    v13,
                    v14,
                    v15,
                    v16));

  objc_msgSend(v3, "setObject:forKey:", v17, off_1000B3290);
  if (v21)
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("X-FMF-Model-Version"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("useTestFMFServer"));

  if (v19)
    objc_msgSend(v3, "setObject:forKey:", CFSTR("true"), CFSTR("x-apple-test-application"));

  return v3;
}

- (void)processCommandResponse:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;

  v41 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("commandResponse")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v4 == v5)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestTokens")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v8 == v9)
  {
    -[FMFBaseCmd setRequestTokens:](self, "setRequestTokens:", 0);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestTokens")));
    -[FMFBaseCmd setRequestTokens:](self, "setRequestTokens:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusCode")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v11 == v12)
  {
    -[FMFBaseCmd setRequestTokensStatusCode:](self, "setRequestTokensStatusCode:", 0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusCode")));
    -[FMFBaseCmd setRequestTokensStatusCode:](self, "setRequestTokensStatusCode:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusMap")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v14 == v15)
  {
    -[FMFBaseCmd setRequestTokensStatusMap:](self, "setRequestTokensStatusMap:", 0);
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("statusMap")));
    -[FMFBaseCmd setRequestTokensStatusMap:](self, "setRequestTokensStatusMap:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd response](self, "response"));
  -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", objc_msgSend(v17, "statusCode"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("dataContext")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("serverContext")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if (v18 != v20 && v18)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("dataContext")));
    objc_msgSend(v22, "setCommandDataContext:", v23);

  }
  if (v19 != v21 && v19)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("serverContext")));
    objc_msgSend(v24, "setCommandServerContext:", v25);

  }
  if (v7)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("statusCode")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v26 == v27)
      v28 = 0;
    else
      v28 = v26;
    v29 = v28;

    v30 = objc_msgSend(v29, "integerValue");
    -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("alert")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

    if ((id)-[FMFBaseCmd commandStatus](self, "commandStatus") != (id)599)
      -[FMFBaseCmd commandStatus](self, "commandStatus");
  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("statusCode")));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v33 == v34)
      v35 = 0;
    else
      v35 = v33;
    v36 = v35;

    if (v36)
    {
      -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", objc_msgSend(v36, "integerValue"));
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "objectForKey:", CFSTR("fetchStatus")));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      if (v37 == v38)
        v39 = 0;
      else
        v39 = v37;
      v40 = v39;

      if (v40)
        -[FMFBaseCmd setCommandStatus:](self, "setCommandStatus:", objc_msgSend(v40, "integerValue"));

    }
  }
  -[FMFBaseCmd commandStatus](self, "commandStatus");

}

- (void)setCommandStatus:(int64_t)a3
{
  self->_commandStatus = a3;
}

- (id)jsonBodyDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMFBaseCmd;
  v3 = -[FMFBaseCmd jsonBodyDictionary](&v12, "jsonBodyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd clientContext](self, "clientContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd tapContext](self, "tapContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandServerContext"));

  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("clientContext"));
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("tapContext"));
  if (v8 && -[FMFBaseCmd shouldIncludeServerContext](self, "shouldIncludeServerContext"))
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("serverContext"));
  if (-[FMFBaseCmd shouldIncludeDataContext](self, "shouldIncludeDataContext"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandDataContext"));

    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("dataContext"));

  }
  return v4;
}

- (BOOL)shouldIncludeServerContext
{
  return 1;
}

- (BOOL)shouldIncludeDataContext
{
  return 1;
}

- (void)setTransactionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setRequestTokensStatusMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setRequestTokensStatusCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setRequestTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setClientPid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setClientBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)platform
{
  return CFSTR("iphoneos");
}

- (id)method
{
  return CFSTR("POST");
}

- (int64_t)commandStatus
{
  return self->_commandStatus;
}

- (NSNumber)clientPid
{
  return self->_clientPid;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)callerIdentifier
{
  return self->_callerIdentifier;
}

- (FMFBaseCmd)init
{
  +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("initWithClientSession is the designated initializer for %@"), self);

  return 0;
}

- (void)initFailed
{
  id v3;
  NSObject *v4;
  int v5;
  FMFBaseCmd *v6;

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to instantiate command %@", (uint8_t *)&v5, 0xCu);
  }

}

- (id)result
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FMFBaseCmd.m"), 204, CFSTR("must implement in subclass"));

  return 0;
}

- (NSString)willSucceedNotification
{
  return 0;
}

- (NSString)didSucceedNotification
{
  return 0;
}

- (NSString)willFailNotification
{
  return 0;
}

- (NSString)didFailNotification
{
  return 0;
}

- (NSString)customCommandNotification
{
  return 0;
}

- (id)tapContext
{
  return 0;
}

- (BOOL)responseContainsFullModelUpdate
{
  return 1;
}

- (BOOL)ignoreResponseErrors
{
  return 0;
}

- (BOOL)ignoreAllResponseErrors
{
  return 0;
}

- (BOOL)isFireAndForget
{
  return 0;
}

- (BOOL)allowsEmptyResponse
{
  return 1;
}

- (NSString)pathSuffix
{
  return (NSString *)&stru_10009B948;
}

- (BOOL)isSuccess
{
  void *v3;
  BOOL v4;

  if (-[FMFBaseCmd commandStatus](self, "commandStatus") < 200
    || -[FMFBaseCmd commandStatus](self, "commandStatus") > 299)
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFBaseCmd jsonResponseParseError](self, "jsonResponseParseError"));
  v4 = v3 == 0;

  return v4;
}

- (NSString)groupId
{
  NSString *groupId;

  groupId = self->_groupId;
  if (!groupId)
  {
    -[FMFBaseCmd setGroupId:](self, "setGroupId:", FMFGroupIdOneToOne);
    groupId = self->_groupId;
  }
  return groupId;
}

- (void)setGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_groupId, a3);
}

- (NSCopying)transactionId
{
  return self->_transactionId;
}

- (NSDictionary)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)fmfServerError
{
  return self->_fmfServerError;
}

- (void)setFmfServerError:(int64_t)a3
{
  self->_fmfServerError = a3;
}

- (BOOL)wasErrorHandled
{
  return self->_wasErrorHandled;
}

- (void)setWasErrorHandled:(BOOL)a3
{
  self->_wasErrorHandled = a3;
}

- (void)setCallerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)requestTokens
{
  return self->_requestTokens;
}

- (NSNumber)requestTokensStatusCode
{
  return self->_requestTokensStatusCode;
}

- (NSDictionary)requestTokensStatusMap
{
  return self->_requestTokensStatusMap;
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

@end
