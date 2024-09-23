@implementation FMDCadmiumServerChannel

- (FMDCadmiumServerChannel)init
{
  FMDCadmiumServerChannel *v2;
  NSOperationQueue *v3;
  NSOperationQueue *queue;
  uint64_t v5;
  NSURLSessionConfiguration *sessionConfig;
  void *v7;
  uint64_t v8;
  FMDURLSession *session;
  uint64_t v10;
  NSMutableDictionary *requests;
  NSRecursiveLock *v12;
  NSRecursiveLock *requestModifierLock;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)FMDCadmiumServerChannel;
  v2 = -[FMDCadmiumServerChannel init](&v15, "init");
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
    sessionConfig = v2->_sessionConfig;
    v2->_sessionConfig = (NSURLSessionConfiguration *)v5;

    -[NSURLSessionConfiguration setURLCache:](v2->_sessionConfig, "setURLCache:", 0);
    -[NSURLSessionConfiguration setRequestCachePolicy:](v2->_sessionConfig, "setRequestCachePolicy:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel cookieStorage](v2, "cookieStorage"));
    -[NSURLSessionConfiguration setHTTPCookieStorage:](v2->_sessionConfig, "setHTTPCookieStorage:", v7);

    v8 = objc_claimAutoreleasedReturnValue(+[FMDURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMDURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", v2->_sessionConfig, v2, v2->_queue));
    session = v2->_session;
    v2->_session = (FMDURLSession *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v10;

    v12 = objc_opt_new(NSRecursiveLock);
    requestModifierLock = v2->_requestModifierLock;
    v2->_requestModifierLock = v12;

  }
  return v2;
}

- (BOOL)isActive
{
  return 1;
}

- (void)sendRequestWithId:(id)a3 toURL:(id)a4 withHeaders:(id)a5 body:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", a4, 1, 120.0));
  objc_msgSend(v16, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v16, "setAllHTTPHeaderFields:", v15);

  if (v13)
    objc_msgSend(v16, "setHTTPBody:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel session](self, "session"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004498C;
  v24[3] = &unk_1002C3028;
  v25 = v12;
  v26 = v14;
  v24[4] = self;
  v18 = v12;
  v19 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v16, v24));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v21, "lock");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requests](self, "requests"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v18);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v23, "unlock");

  objc_msgSend(v20, "resume");
}

- (void)cancelRequestWithId:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v4, "lock");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requests](self, "requests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requests](self, "requests"));
    objc_msgSend(v7, "removeObjectForKey:", v9);

    objc_msgSend(v6, "cancel");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v8, "unlock");

}

- (void)cancelAllRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requests](self, "requests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[FMDCadmiumServerChannel setRequests:](self, "setRequests:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCadmiumServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v6, "unlock");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), (_QWORD)v14));
        v13 = v12;
        if (v12)
          objc_msgSend(v12, "cancel");

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return (a3 >> 1) & 1;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  void *v20;
  const void *AppleFMiPService;
  __SecTrust *v22;
  OSStatus v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  uint8_t v38[16];
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  _BYTE buf[24];
  const __CFString *v44;
  NSObject *v45;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v9, "isInternalBuild"))
    v10 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableCertPinning"), kFMDNotBackedUpPrefDomain);
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "host"));

  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("gateway.icloud.com")) & 1) != 0 || v10)
  {
    v8[2](v8, 1, 0);
  }
  else
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Detecting authentication method", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "authenticationMethod"));
    v17 = objc_msgSend(v16, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

    if (v17)
    {
      v18 = sub_1000031B8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Setting server trust policy", buf, 2u);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "host"));
      AppleFMiPService = (const void *)SecPolicyCreateAppleFMiPService(v20, 0);

      if (AppleFMiPService)
      {
        v22 = (__SecTrust *)objc_msgSend(v15, "serverTrust");
        v23 = SecTrustSetPolicies(v22, AppleFMiPService);
        CFRelease(AppleFMiPService);
        if (v23)
        {
          v24 = sub_1000031B8();
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error setting the trust policies : %ld", buf, 0xCu);
          }

          v41 = CFSTR("FMDUnerlyingErrorKey");
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecTrustSetPolicies"), v23, 0));
          v42 = v26;
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDCadmiumServerChannelPinningErrorDomain"), 0, v27));

          v29 = 0;
          v30 = 2;
        }
        else
        {
          *(_QWORD *)buf = 0;
          if (SecTrustEvaluateWithError(v22, (CFErrorRef *)buf))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v22));
            v33 = sub_1000031B8();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v38 = 0;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "FMDCadmiumServerChannel Pinning success - presenting fmip trust as credential.", v38, 2u);
            }
            v28 = 0;
            v30 = 0;
          }
          else
          {
            v35 = sub_1000031B8();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              sub_100228BE0(v36);

            v44 = CFSTR("FMDUnerlyingErrorKey");
            v34 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecTrustEvaluate"), 1, 0));
            v45 = v34;
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDCadmiumServerChannelPinningErrorDomain"), 1, v37));

            v29 = 0;
            v30 = 2;
          }

        }
      }
      else
      {
        v39 = CFSTR("FMDUnerlyingErrorKey");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecPolicyCreateAppleFMiPService"), 0, 0));
        v40 = v31;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
        v30 = 2;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDCadmiumServerChannelPinningErrorDomain"), 2, v32));

        v29 = 0;
      }
      -[FMDCadmiumServerChannel _logRequestError:](self, "_logRequestError:", v28);

    }
    else
    {
      v29 = 0;
      v30 = 1;
    }
    ((void (**)(id, uint64_t, void *))v8)[2](v8, v30, v29);

  }
}

- (void)_logRequestError:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  FMDEventLoggerEventDataPeekError *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;

  v3 = a3;
  if (v3)
  {
    v4 = sub_1000031B8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Network error occured %@", (uint8_t *)&v11, 0xCu);
    }

    v6 = -[FMDEventLoggerEventError initWithEventName:]([FMDEventLoggerEventDataPeekError alloc], "initWithEventName:", CFSTR("FMDCadmiumServerChannelRequestFailedEventName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FMDUnerlyingErrorKey")));

    if (v8)
      v9 = v8;
    else
      v9 = v3;
    -[FMDEventLoggerEventDataPeekError setError:](v6, "setError:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLogger sharedLogger](FMDEventLogger, "sharedLogger"));
    objc_msgSend(v10, "logEvent:", v6);

  }
}

- (FMDURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURLSessionConfiguration)sessionConfig
{
  return self->_sessionConfig;
}

- (void)setSessionConfig:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfig, a3);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
  objc_storeStrong((id *)&self->_requestModifierLock, a3);
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void)setCookieStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cookieStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionConfig, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
