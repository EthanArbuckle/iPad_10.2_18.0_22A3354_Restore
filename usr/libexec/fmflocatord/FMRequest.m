@implementation FMRequest

- (FMRequest)init
{
  return -[FMRequest initWithProvider:](self, "initWithProvider:", 0);
}

- (FMRequest)initWithProvider:(id)a3
{
  id v4;
  FMRequest *v5;
  void *v6;
  NSRecursiveLock *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FMRequest;
  v5 = -[FMRequest init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v7 = objc_opt_new(NSRecursiveLock);
    -[FMRequest setRequestModifierLock:](v5, "setRequestModifierLock:", v7);

    -[FMRequest setWillRetry:](v5, "setWillRetry:", 1);
    -[FMRequest setProvider:](v5, "setProvider:", v4);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_networkStateChanged:", CFSTR("com.apple.icloud.fmflocatord.networkChanged"), 0);

  }
  return v5;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000341A4(self);

  -[FMRequest deinitializeRequest](self, "deinitializeRequest");
  v5.receiver = self;
  v5.super_class = (Class)FMRequest;
  -[FMRequest dealloc](&v5, "dealloc");
}

- (void)deinitializeRequest
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ deinitializing...", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.icloud.fmflocatord.networkChanged"), 0);

}

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  if (!qword_100069778)
  {
    v2 = objc_alloc_init((Class)NSMutableDictionary);
    v3 = (void *)qword_100069778;
    qword_100069778 = (uint64_t)v2;

    v4 = objc_alloc_init((Class)NSRecursiveLock);
    v5 = (void *)qword_100069780;
    qword_100069780 = (uint64_t)v4;

  }
}

- (id)urlSession
{
  if (qword_1000697A0 != -1)
    dispatch_once(&qword_1000697A0, &stru_1000561F0);
  return (id)qword_100069788;
}

- (NSURL)requestUrl
{
  return 0;
}

- (NSMutableDictionary)requestBody
{
  return (NSMutableDictionary *)+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
}

- (BOOL)showAuthFailedMessage
{
  return 1;
}

- (NSMutableDictionary)requestHeaders
{
  NSMutableDictionary *v3;
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
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authId"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authId"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("X-Apple-PrsId"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "apsEnvironment"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "apsEnvironment"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, CFSTR("X-Apple-PushEnv"));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PreferencesMgr sharedInstance](PreferencesMgr, "sharedInstance"));
  if (objc_msgSend(v13, "userTestApplication"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-Test-Application"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("7.0"), CFSTR("X-Apple-Find-API-Ver"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RealmSupport serverContextHeaderString](RealmSupport, "serverContextHeaderString"));
  -[NSMutableDictionary fm_safelyMapKey:toObject:](v3, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Ctx"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "productType"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "buildVersion"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fmflocatord/%@ %@/%@"), CFSTR("7.0"), v16, v18));
  if (v19)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v19, CFSTR("User-Agent"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("application/json"), CFSTR("Content-Type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest _basicAuthValue](self, "_basicAuthValue"));
  if (v20)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, CFSTR("Authorization"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("1.0"), CFSTR("X-Apple-Realm-Support"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "httpRequestHeaders"));
  if (v21)
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v21);

  return v3;
}

- (double)firstRetryInterval
{
  return 60.0;
}

- (double)retryIntervalDecayFactor
{
  return 3.0;
}

- (double)maxRetryInterval
{
  return -1.0;
}

- (int64_t)maxTimerBasedNetworkRetries
{
  return 5;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return 3;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return 10;
}

- (BOOL)canRequestBeRetriedNow
{
  if (-[FMRequest isComplete](self, "isComplete"))
    return 0;
  else
    return !-[FMRequest cancelled](self, "cancelled");
}

- (NSString)authToken
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authToken"));

  return (NSString *)v4;
}

- (id)authTokenType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "account"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "authTokenType"));

  return v4;
}

- (BOOL)canReplace:(id)a3
{
  return 1;
}

- (int64_t)responseErrorType
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  int64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseError](self, "httpResponseError"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseError](self, "httpResponseError"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v6 = objc_msgSend(NSURLErrorDomain, "isEqualToString:", v5);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseError](self, "httpResponseError"));
      v8 = objc_msgSend(v7, "code");

      if ((unint64_t)v8 + 1019 < 0x13)
        return qword_100049DE8[(_QWORD)v8 + 1019];
      return 2;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseError](self, "httpResponseError"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v12 = objc_msgSend(NSPOSIXErrorDomain, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseError](self, "httpResponseError"));
      v14 = objc_msgSend(v13, "code");

      if (v14 == (id)22)
        return 513;
    }
  }
  v15 = -[FMRequest httpResponseStatus](self, "httpResponseStatus");
  if (v15 == 401)
    return 257;
  if (v15 == 330)
    return 769;
  if (-[FMRequest httpResponseStatus](self, "httpResponseStatus") < 200)
    return 2;
  return 2 * (-[FMRequest httpResponseStatus](self, "httpResponseStatus") > 299);
}

- (void)setCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id completionHandler;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v5, "lock");

  v6 = objc_retainBlock(v4);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v6;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v8, "unlock");

}

- (void)send
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  uint8_t *v60;
  id v61;
  uint8_t v62[8];
  uint8_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  NSObject *v71;
  __int16 v72;
  id v73;
  uint8_t v74[4];
  NSObject *v75;
  uint8_t v76[16];
  uint8_t v77[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v3, "lock");

  if (!-[FMRequest inProgress](self, "inProgress")
    && !-[FMRequest cancelled](self, "cancelled")
    && !-[FMRequest isComplete](self, "isComplete")
    && -[FMRequest willRetry](self, "willRetry"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
    *(_QWORD *)v62 = 0;
    v63 = v62;
    v64 = 0x3032000000;
    v65 = sub_100021814;
    v66 = sub_100021824;
    v67 = 0;
    -[FMRequest setInProgress:](self, "setInProgress:", 1);
    -[FMRequest setAlertFromServerResponse:](self, "setAlertFromServerResponse:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest willSendHandler](self, "willSendHandler"));

    if (v5)
    {
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[FMRequest willSendHandler](self, "willSendHandler"));
      ((void (**)(_QWORD, FMRequest *))v6)[2](v6, self);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest completionHandler](self, "completionHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "account"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
    if (!v9
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest authToken](self, "authToken")),
          v11 = v10 == 0,
          v10,
          v9,
          v11))
    {
      v38 = sub_10001C4E8();
      v12 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v69 = v39;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ No credentials found. Not sending the request", buf, 0xCu);

      }
      goto LABEL_49;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[FMRequest requestUrl](self, "requestUrl"));
    v13 = sub_10001C4E8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest authToken](self, "authToken"));
      sub_1000350CC(v15, v16, v77, v14);
    }

    v17 = sub_10001C4E8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest authTokenType](self, "authTokenType"));
      *(_DWORD *)buf = 138412290;
      v69 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Using auth token of type - %@", buf, 0xCu);

    }
    if (!v12)
    {
      v40 = sub_10001C4E8();
      v12 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v69 = v41;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ No url found. Not sending the request", buf, 0xCu);

      }
      goto LABEL_49;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject host](v12, "host"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
    v21 = objc_claimAutoreleasedReturnValue(+[RealmSupport redirectedHostForHost:withContext:](RealmSupport, "redirectedHostForHost:withContext:", v55, v20));
    v22 = (void *)*((_QWORD *)v63 + 5);
    *((_QWORD *)v63 + 5) = v21;

    if (*((_QWORD *)v63 + 5) && (objc_msgSend(v55, "isEqualToString:") & 1) == 0)
    {
      v23 = objc_claimAutoreleasedReturnValue(-[NSObject URLByReplacingHost:](v12, "URLByReplacingHost:", *((_QWORD *)v63 + 5)));

      v12 = v23;
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestHeaders](self, "requestHeaders"));
    v24 = objc_claimAutoreleasedReturnValue(-[FMRequest requestBody](self, "requestBody"));
    if (v24)
    {
      v61 = 0;
      v25 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v24, 0, &v61));
      v26 = v61;
      v53 = (void *)v25;
      if (!v25)
      {
        v27 = sub_10001C4E8();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          sub_10003507C(v29, v76, v28);
        }

      }
      if (v26)
      {
        v30 = sub_10001C4E8();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          sub_100035024(v32, (uint64_t)v26, (uint64_t)buf, v31);
        }

        v33 = sub_10001C5C8();
        v34 = objc_claimAutoreleasedReturnValue(v33);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v74 = 138412290;
          v75 = v24;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Encountered a serializing error for the request body : %@", v74, 0xCu);
        }

LABEL_48:
LABEL_49:

        _Block_object_dispose(v62, 8);
        goto LABEL_31;
      }
    }
    else
    {
      v53 = 0;
    }
    v42 = objc_msgSend(v54, "mutableCopy");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Authorization")));

    if (v43)
      objc_msgSend(v42, "setObject:forKeyedSubscript:", CFSTR("REDACTED"), CFSTR("Authorization"));
    v44 = sub_10001C5C8();
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412802;
      v69 = v46;
      v70 = 2112;
      v71 = v12;
      v72 = 2112;
      v73 = v42;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Sending %@ to url %@ with headers: \n%@", buf, 0x20u);

    }
    v47 = sub_10001C5C8();
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412546;
      v69 = v49;
      v70 = 2112;
      v71 = v24;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Sending %@ body dictionary : \n%@ ", buf, 0x16u);

    }
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v12, 1, 120.0));
    objc_msgSend(v26, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v26, "setAllHTTPHeaderFields:", v54);
    if (v53)
      objc_msgSend(v26, "setHTTPBody:", v53);
    -[FMRequest _enablePowerAssertion](self, "_enablePowerAssertion");
    if (!-[FMRequest totalRetryCount](self, "totalRetryCount"))
      -[FMRequest _beginXPCTransaction](self, "_beginXPCTransaction");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest urlSession](self, "urlSession"));
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10002182C;
    v56[3] = &unk_100056218;
    v56[4] = self;
    v57 = 0;
    v60 = v62;
    v58 = v4;
    v59 = v7;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "dataTaskWithRequest:completionHandler:", v26, v56));
    -[FMRequest setCurrentDataTask:](self, "setCurrentDataTask:", v51);

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest currentDataTask](self, "currentDataTask"));
    objc_msgSend(v52, "resume");

    goto LABEL_48;
  }
  v35 = sub_10001C4E8();
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v62 = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not sending", v62, 2u);
  }

LABEL_31:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v37, "unlock");

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v4, "lock");

  -[FMRequest setCancelled:](self, "setCancelled:", 1);
  -[FMRequest setCurrentDataTask:](self, "setCurrentDataTask:", 0);
  -[FMRequest setInProgress:](self, "setInProgress:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest retryTimer](self, "retryTimer"));
  objc_msgSend(v5, "invalidate");

  -[FMRequest setRetryTimer:](self, "setRetryTimer:", 0);
  -[FMRequest setNextRetryTime:](self, "setNextRetryTime:", 0);
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "endXPCTransaction because cancel", v9, 2u);
  }

  -[FMRequest _endXPCTransaction](self, "_endXPCTransaction");
  -[FMRequest _disablePowerAssertion](self, "_disablePowerAssertion");
  objc_msgSend(v3, "didCancelRequest:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v8, "unlock");

}

- (id)_basicAuthValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest authToken](self, "authToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v5, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest authToken](self, "authToken"));
  v11 = CFSTR("(not-nil)");
  if (!v10)
    v11 = CFSTR("(nil)");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v9, v11));

  v13 = sub_10001C4E8();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    sub_10003527C();

  objc_msgSend((id)qword_100069780, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100069778, "objectForKeyedSubscript:", v7));
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
    v17 = v16;
    if (v16 && objc_msgSend(v16, "length"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "base64EncodedString"));
      if (v18)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Basic %@"), v18));
        if (v15)
          objc_msgSend((id)qword_100069778, "setObject:forKeyedSubscript:", v15, v7);
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  objc_msgSend((id)qword_100069780, "unlock");

  return v15;
}

- (void)_beginXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "beginTransaction:", v7);

}

- (void)_endXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "endTransaction:", v7);

}

- (void)_enablePowerAssertion
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PowerMgr sharedInstance](PowerMgr, "sharedInstance"));
  objc_msgSend(v6, "powerAssertionEnableWithReason:", v7);

}

- (void)_disablePowerAssertion
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PowerMgr sharedInstance](PowerMgr, "sharedInstance"));
  objc_msgSend(v6, "powerAssertionDisableWithReason:", v7);

}

- (void)checkAndScheduleRetries
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  NSObject *v18;
  double v19;
  void *v20;
  const __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  void *v30;
  signed int v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  signed int v39;
  uint64_t v40;
  double v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  double v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  double v57;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
  -[FMRequest setNextRetryType:](self, "setNextRetryType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v4)
  {

  }
  else if (-[FMRequest isComplete](self, "isComplete"))
  {
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      v54 = 138412290;
      v55 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ Request is complete", (uint8_t *)&v54, 0xCu);

    }
    -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v8)
  {

  }
  else if (!-[FMRequest canRequestBeRetriedNow](self, "canRequestBeRetriedNow"))
  {
    v9 = sub_10001C4E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      v54 = 138412290;
      v55 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ Request cannot be retried anymore. Not scheduling any more retries", (uint8_t *)&v54, 0xCu);

    }
    -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));

  v13 = -1.0;
  if (!v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest httpResponseHeaders](self, "httpResponseHeaders"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("X-Apple-Retry-After")));

    if (v15)
    {
      objc_msgSend(v15, "doubleValue");
      if (v16 < 0.0)
      {
        v17 = sub_10001C4E8();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        v19 = -1.0;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v54 = 138412290;
          v55 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ Server requested that no more retries be done.", (uint8_t *)&v54, 0xCu);

        }
        v21 = CFSTR("NoMoreRetries");
LABEL_23:

        -[FMRequest setNextRetryType:](self, "setNextRetryType:", v21);
        v13 = v19;
        goto LABEL_24;
      }
      if (v16 > 0.0)
      {
        v19 = v16;
        v22 = sub_10001C4E8();
        v18 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v54 = 138412546;
          v55 = v23;
          v56 = 2048;
          v57 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ Server requested a retry after %f seconds", (uint8_t *)&v54, 0x16u);

        }
        v21 = CFSTR("ServerDelayedRetry");
        goto LABEL_23;
      }
    }
LABEL_24:

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v24)
  {

  }
  else if ((id)-[FMRequest responseErrorType](self, "responseErrorType") == (id)257)
  {
    -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
  }
  v25 = objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v25)
  {
    v26 = (void *)v25;
LABEL_31:

    goto LABEL_34;
  }
  if ((id)-[FMRequest responseErrorType](self, "responseErrorType") == (id)514
    && !-[FMRequest _retryCountForType:](self, "_retryCountForType:", CFSTR("TryOriginalHost")))
  {
    -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("TryOriginalHost"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "account"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "authId"));
    +[RealmSupport clearCachedHostsWithContext:](RealmSupport, "clearCachedHostsWithContext:", v30);

    v13 = 0.0;
    goto LABEL_31;
  }
LABEL_34:
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v27)
  {

  }
  else if ((-[FMRequest responseErrorType](self, "responseErrorType") & 0x200) != 0)
  {
    v28 = -[FMRequest _retryCountForType:](self, "_retryCountForType:", CFSTR("TimerBasedNetworkRetry"));
    if (-[FMRequest maxTimerBasedNetworkRetries](self, "maxTimerBasedNetworkRetries") == -1
      || -[FMRequest maxTimerBasedNetworkRetries](self, "maxTimerBasedNetworkRetries") > v28)
    {
      -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("TimerBasedNetworkRetry"));
      -[FMRequest _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v28);
      v13 = v29;
    }
    else
    {
      v31 = -[FMRequest _consecutiveRetryCountForType:](self, "_consecutiveRetryCountForType:", CFSTR("NotificationBasedNetworkRetry"));
      if (-[FMRequest maxConsecutiveNetworkNotificationRetries](self, "maxConsecutiveNetworkNotificationRetries") == -1
        || -[FMRequest maxConsecutiveNetworkNotificationRetries](self, "maxConsecutiveNetworkNotificationRetries") > v31)
      {
        -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NotificationBasedNetworkRetry"));
        v32 = sub_10001C4E8();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v54 = 138412290;
          v55 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "%@ Waiting for a network-up notification to retry again", (uint8_t *)&v54, 0xCu);

        }
        v13 = -1.0;
      }
      else
      {
        -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
        v35 = sub_10001C4E8();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v54 = 138412290;
          v55 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of consecutive network-up notification based retries", (uint8_t *)&v54, 0xCu);

        }
      }
    }
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  if (v38)
  {

  }
  else if ((id)-[FMRequest responseErrorType](self, "responseErrorType") == (id)769)
  {
    v39 = -[FMRequest _retryCountForType:](self, "_retryCountForType:", CFSTR("RedirectRetry"));
    if (v39)
    {
      v40 = v39;
      if (-[FMRequest maxNonNetworkRelatedRetries](self, "maxNonNetworkRelatedRetries") == -1
        || -[FMRequest maxNonNetworkRelatedRetries](self, "maxNonNetworkRelatedRetries") > v40)
      {
        -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("RedirectRetry"));
        -[FMRequest _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v40);
        v13 = v41;
      }
      else
      {
        -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
        v42 = sub_10001C4E8();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v54 = 138412290;
          v55 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of redirect retries", (uint8_t *)&v54, 0xCu);

        }
      }
    }
    else
    {
      -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("RedirectRetry"));
      v13 = 0.0;
    }
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));

  if (!v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMRequest httpResponseStatus](self, "httpResponseStatus")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "stringValue"));

    v48 = -[FMRequest _retryCountForType:](self, "_retryCountForType:", v47);
    if (-[FMRequest maxNonNetworkRelatedRetries](self, "maxNonNetworkRelatedRetries") == -1
      || -[FMRequest maxNonNetworkRelatedRetries](self, "maxNonNetworkRelatedRetries") > v48)
    {
      -[FMRequest setNextRetryType:](self, "setNextRetryType:", v47);
      -[FMRequest _decayedWaitIntervalForRetryCount:](self, "_decayedWaitIntervalForRetryCount:", v48);
      v13 = v49;
    }
    else
    {
      -[FMRequest setNextRetryType:](self, "setNextRetryType:", CFSTR("NoMoreRetries"));
      v50 = sub_10001C4E8();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
        v54 = 138412546;
        v55 = v52;
        v56 = 2112;
        v57 = *(double *)&v47;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "%@ Stopped retrying since we exceeded the maximum number of retries for status code %@", (uint8_t *)&v54, 0x16u);

      }
    }

  }
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  -[FMRequest setWillRetry:](self, "setWillRetry:", objc_msgSend(v53, "isEqualToString:", CFSTR("NoMoreRetries")) ^ 1);

  -[FMRequest _scheduleRetryAfterTimeInterval:](self, "_scheduleRetryAfterTimeInterval:", v13);
}

- (double)_decayedWaitIntervalForRetryCount:(int64_t)a3
{
  double v5;
  double v6;
  long double v7;
  double v8;
  double v9;
  double v10;
  double result;

  -[FMRequest firstRetryInterval](self, "firstRetryInterval");
  v6 = v5;
  -[FMRequest retryIntervalDecayFactor](self, "retryIntervalDecayFactor");
  v8 = v6 * pow(v7, (double)a3);
  -[FMRequest maxRetryInterval](self, "maxRetryInterval");
  if (v9 <= -1.0)
    return v8;
  -[FMRequest maxRetryInterval](self, "maxRetryInterval");
  if (v8 <= v10)
    return v8;
  -[FMRequest maxRetryInterval](self, "maxRetryInterval");
  return result;
}

- (void)_retryTimerFired
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest retryTimer](self, "retryTimer"));
  objc_msgSend(v3, "invalidate");

  -[FMRequest setRetryTimer:](self, "setRetryTimer:", 0);
  -[FMRequest setNextRetryTime:](self, "setNextRetryTime:", 0);
  if (-[FMRequest inProgress](self, "inProgress"))
  {
    v4 = sub_10001C4E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@ Retry time arrived, but request cannot be retried anymore or retry is already in progress. Not retrying", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    -[FMRequest _retryNow](self, "_retryNow");
  }
}

- (void)_retryNow
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = objc_opt_class(self, v5);
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ Retrying request now...", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[FMRequest setLastRetryTime:](self, "setLastRetryTime:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
  -[FMRequest _incrementRetryCountForType:](self, "_incrementRetryCountForType:", v7);

  -[FMRequest send](self, "send");
}

- (void)_networkCameUp
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100035380(self);

  if (-[FMRequest canRequestBeRetriedNow](self, "canRequestBeRetriedNow")
    && !-[FMRequest inProgress](self, "inProgress"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("TimerBasedNetworkRetry")))
    {

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry"));

      if (!v7)
        return;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry")) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryTime](self, "nextRetryTime"));

      if (v10)
      {
        v11 = sub_10001C4E8();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryTime](self, "nextRetryTime"));
          v27 = 138412546;
          v28 = v13;
          v29 = 2112;
          v30 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ Network up retry already pending for %@", (uint8_t *)&v27, 0x16u);

        }
        goto LABEL_28;
      }
    }
    else
    {

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest lastRetryType](self, "lastRetryType"));
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NotificationBasedNetworkRetry")) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest lastRetryTime](self, "lastRetryTime"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest lastRetryTime](self, "lastRetryTime"));
        objc_msgSend(v8, "timeIntervalSinceDate:", v17);
        v19 = v18;

        if (v19 >= 60.0 || v19 < 0.0)
          v21 = 0.0;
        else
          v21 = 60.0 - v19;
        goto LABEL_23;
      }
    }
    else
    {

    }
    v21 = 0.0;
LABEL_23:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryTime](self, "nextRetryTime"));

    if (!v22
      || (v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryTime](self, "nextRetryTime")),
          objc_msgSend(v23, "timeIntervalSinceDate:", v8),
          v25 = v24,
          v23,
          v25 < 0.0)
      || v25 >= v21)
    {
      -[FMRequest _scheduleRetryAfterTimeInterval:](self, "_scheduleRetryAfterTimeInterval:", v21);
      goto LABEL_30;
    }
    v26 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1000352EC(self);
LABEL_28:

LABEL_30:
  }
}

- (void)_scheduleRetryAfterTimeInterval:(double)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  if (a3 <= 0.0)
  {
    v18 = sub_10001C4E8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (a3 >= 0.0)
    {
      if (v20)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
        *(_DWORD *)buf = 138412546;
        v27 = v22;
        v28 = 2112;
        v29 = v23;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ Scheduling retry of type '%@' to occur now", buf, 0x16u);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[FMRequest setNextRetryTime:](self, "setNextRetryTime:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
      -[FMRequest performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", "_retryNow", v25, 0, 0);

    }
    else
    {
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
        *(_DWORD *)buf = 138412290;
        v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@ Not scheduling any retry", buf, 0xCu);

      }
      -[FMRequest setNextRetryTime:](self, "setNextRetryTime:", 0);
    }
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3));
    -[FMRequest setNextRetryTime:](self, "setNextRetryTime:", v5);

    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest fm_logID](self, "fm_logID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryType](self, "nextRetryType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest nextRetryTime](self, "nextRetryTime"));
      *(_DWORD *)buf = 138412802;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ Scheduling retry of type '%@' to occur at %@", buf, 0x20u);

    }
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.icloud.fmflocatord.retry.%@-%X"), objc_opt_class(self, v11), self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", v13, self, "_retryTimerFired", 0, a3);
    -[FMRequest setRetryTimer:](self, "setRetryTimer:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest retryTimer](self, "retryTimer"));
    objc_msgSend(v15, "setMinimumEarlyFireProportion:", 0.75);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest retryTimer](self, "retryTimer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v16, "scheduleInRunLoop:", v17);

  }
}

- (int)_retryCountForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest totalRetriesByType](self, "totalRetriesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;

  return v7;
}

- (int)_consecutiveRetryCountForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest consecutiveRetriesByType](self, "consecutiveRetriesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = 0;

  return v7;
}

- (void)_incrementRetryCountForType:(id)a3
{
  id v4;
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
  unsigned int v15;
  _UNKNOWN **v16;
  void *v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest totalRetriesByType](self, "totalRetriesByType"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[FMRequest setTotalRetriesByType:](self, "setTotalRetriesByType:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[FMRequest setConsecutiveRetriesByType:](self, "setConsecutiveRetriesByType:", v7);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest totalRetriesByType](self, "totalRetriesByType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v18));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "intValue") + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest totalRetriesByType](self, "totalRetriesByType"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v18);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest consecutiveRetriesByType](self, "consecutiveRetriesByType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v18));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest lastRetryType](self, "lastRetryType"));
    v15 = objc_msgSend(v18, "isEqualToString:", v14);

    if (v15)
      v16 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v13, "intValue") + 1));
    else
      v16 = &off_10005AF08;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest consecutiveRetriesByType](self, "consecutiveRetriesByType"));
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    v4 = v18;
  }
  ++self->_totalRetryCount;

}

- (void)_networkStateChanged:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsNetworkAvailable")));

  v5 = v7;
  if (v7)
  {
    v6 = objc_msgSend(v7, "BOOLValue");
    v5 = v7;
    if (v6)
    {
      -[FMRequest _networkCameUp](self, "_networkCameUp");
      v5 = v7;
    }
  }

}

- (FindBaseServiceProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (BOOL)willRetry
{
  return self->_willRetry;
}

- (void)setWillRetry:(BOOL)a3
{
  self->_willRetry = a3;
}

- (int64_t)httpResponseStatus
{
  return self->_httpResponseStatus;
}

- (void)setHttpResponseStatus:(int64_t)a3
{
  self->_httpResponseStatus = a3;
}

- (NSDictionary)httpResponseHeaders
{
  return self->_httpResponseHeaders;
}

- (void)setHttpResponseHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponseHeaders, a3);
}

- (NSDictionary)httpResponseBody
{
  return self->_httpResponseBody;
}

- (void)setHttpResponseBody:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponseBody, a3);
}

- (NSError)httpResponseError
{
  return self->_httpResponseError;
}

- (void)setHttpResponseError:(id)a3
{
  objc_storeStrong((id *)&self->_httpResponseError, a3);
}

- (FMRequestDelegate)delegate
{
  return (FMRequestDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)willSendHandler
{
  return self->_willSendHandler;
}

- (void)setWillSendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSDictionary)alertFromServerResponse
{
  return self->_alertFromServerResponse;
}

- (void)setAlertFromServerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_alertFromServerResponse, a3);
}

- (FMFURLSessionTask)currentDataTask
{
  return self->_currentDataTask;
}

- (void)setCurrentDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataTask, a3);
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
  objc_storeStrong((id *)&self->_requestModifierLock, a3);
}

- (int64_t)totalRetryCount
{
  return self->_totalRetryCount;
}

- (void)setTotalRetryCount:(int64_t)a3
{
  self->_totalRetryCount = a3;
}

- (NSMutableDictionary)totalRetriesByType
{
  return self->_totalRetriesByType;
}

- (void)setTotalRetriesByType:(id)a3
{
  objc_storeStrong((id *)&self->_totalRetriesByType, a3);
}

- (NSMutableDictionary)consecutiveRetriesByType
{
  return self->_consecutiveRetriesByType;
}

- (void)setConsecutiveRetriesByType:(id)a3
{
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, a3);
}

- (NSString)lastRetryType
{
  return self->_lastRetryType;
}

- (void)setLastRetryType:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryType, a3);
}

- (NSDate)lastRetryTime
{
  return self->_lastRetryTime;
}

- (void)setLastRetryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastRetryTime, a3);
}

- (NSString)nextRetryType
{
  return self->_nextRetryType;
}

- (void)setNextRetryType:(id)a3
{
  objc_storeStrong((id *)&self->_nextRetryType, a3);
}

- (NSDate)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextRetryTime, a3);
}

- (PCPersistentTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimer, 0);
  objc_storeStrong((id *)&self->_nextRetryTime, 0);
  objc_storeStrong((id *)&self->_nextRetryType, 0);
  objc_storeStrong((id *)&self->_lastRetryTime, 0);
  objc_storeStrong((id *)&self->_lastRetryType, 0);
  objc_storeStrong((id *)&self->_consecutiveRetriesByType, 0);
  objc_storeStrong((id *)&self->_totalRetriesByType, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_currentDataTask, 0);
  objc_storeStrong((id *)&self->_alertFromServerResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_willSendHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_httpResponseError, 0);
  objc_storeStrong((id *)&self->_httpResponseBody, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
