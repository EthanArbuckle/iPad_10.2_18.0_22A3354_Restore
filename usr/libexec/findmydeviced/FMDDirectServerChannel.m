@implementation FMDDirectServerChannel

- (FMDDirectServerChannel)init
{
  FMDDirectServerChannel *v2;
  NSOperationQueue *v3;
  NSOperationQueue *queue;
  uint64_t v5;
  NSURLSessionConfiguration *sessionConfig;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  FMDURLSession *session;
  uint64_t v13;
  NSMutableDictionary *requests;
  NSRecursiveLock *v15;
  NSRecursiveLock *requestModifierLock;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FMDDirectServerChannel;
  v2 = -[FMDDirectServerChannel init](&v18, "init");
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
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel cookieStorage](v2, "cookieStorage"));
    -[NSURLSessionConfiguration setHTTPCookieStorage:](v2->_sessionConfig, "setHTTPCookieStorage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

    v10 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v9);
    -[NSURLSessionConfiguration set_appleIDContext:](v2->_sessionConfig, "set_appleIDContext:", v10);
    v11 = objc_claimAutoreleasedReturnValue(+[FMDURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMDURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", v2->_sessionConfig, v2, v2->_queue));
    session = v2->_session;
    v2->_session = (FMDURLSession *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v13;

    v15 = objc_opt_new(NSRecursiveLock);
    requestModifierLock = v2->_requestModifierLock;
    v2->_requestModifierLock = v15;

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
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel session](self, "session"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100058814;
  v24[3] = &unk_1002C3028;
  v25 = v12;
  v26 = v14;
  v24[4] = self;
  v18 = v12;
  v19 = v14;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataTaskWithRequest:completionHandler:", v16, v24));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v21, "lock");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requests](self, "requests"));
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v18);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v4, "lock");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requests](self, "requests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requests](self, "requests"));
    objc_msgSend(v7, "removeObjectForKey:", v9);

    objc_msgSend(v6, "cancel");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
  objc_msgSend(v3, "lock");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requests](self, "requests"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[FMDDirectServerChannel setRequests:](self, "setRequests:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDDirectServerChannel requestModifierLock](self, "requestModifierLock"));
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

- (NSHTTPCookieStorage)cookieStorage
{
  NSHTTPCookieStorage *cookieStorage;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  size_t v11;
  CFURLRef v12;
  const void *v13;
  CFRunLoopRef Main;
  id v15;

  cookieStorage = self->_cookieStorage;
  if (!cookieStorage)
  {
    v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.findmydeviced")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("cookies")));

    v9 = objc_retainAutorelease(v8);
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = strlen(v10);
    v12 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v10, v11, 1u);
    v13 = (const void *)CFHTTPCookieStorageCreateFromFile(kCFAllocatorDefault, v12, 0);
    Main = CFRunLoopGetMain();
    CFHTTPCookieStorageScheduleWithRunLoop(v13, Main, kCFRunLoopCommonModes);
    v15 = objc_msgSend(objc_alloc((Class)NSHTTPCookieStorage), "_initWithCFHTTPCookieStorage:", v13);
    -[FMDDirectServerChannel setCookieStorage:](self, "setCookieStorage:", v15);

    if (v12)
      CFRelease(v12);
    if (v13)
      CFRelease(v13);

    cookieStorage = self->_cookieStorage;
  }
  return cookieStorage;
}

- (BOOL)supportsRequestType:(unint64_t)a3
{
  return a3 & 1;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  const void *AppleFMiPService;
  __SecTrust *v25;
  OSStatus v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint8_t v41[16];
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  _BYTE buf[24];
  const __CFString *v47;
  NSObject *v48;

  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
  if (objc_msgSend(v9, "isInternalBuild"))
    v10 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("DisableCertPinning"), kFMDNotBackedUpPrefDomain);
  else
    v10 = 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "host"));

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("gateway.icloud.com")))
  {
    v13 = +[FMPreferencesUtil BOOLForKey:inDomain:](FMPreferencesUtil, "BOOLForKey:inDomain:", CFSTR("EnableCertPinningForFindkit"), kFMDNotBackedUpPrefDomain);
    v14 = sub_1000530AC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cert pinning for Findkit enabled = %d", buf, 8u);
    }

    if ((v13 & 1) == 0)
      goto LABEL_8;
  }
  else if (v10)
  {
LABEL_8:
    v8[2](v8, 1, 0);
    goto LABEL_32;
  }
  v16 = sub_1000031B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Detecting authentication method", buf, 2u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "authenticationMethod"));
  v20 = objc_msgSend(v19, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if (v20)
  {
    v21 = sub_1000031B8();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Setting server trust policy", buf, 2u);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "host"));
    AppleFMiPService = (const void *)SecPolicyCreateAppleFMiPService(v23, 0);

    if (AppleFMiPService)
    {
      v25 = (__SecTrust *)objc_msgSend(v18, "serverTrust");
      v26 = SecTrustSetPolicies(v25, AppleFMiPService);
      CFRelease(AppleFMiPService);
      if (v26)
      {
        v27 = sub_1000031B8();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Error setting the trust policies : %ld", buf, 0xCu);
        }

        v44 = CFSTR("FMDUnerlyingErrorKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecTrustSetPolicies"), v26, 0));
        v45 = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDDirectServerChannelPinningErrorDomain"), 0, v30));

        v32 = 0;
        v33 = 2;
      }
      else
      {
        *(_QWORD *)buf = 0;
        if (SecTrustEvaluateWithError(v25, (CFErrorRef *)buf))
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v25));
          v36 = sub_1000031B8();
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v41 = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "FMDDirectServerChannel Pinning success - presenting fmip trust as credential.", v41, 2u);
          }
          v33 = 0;
          v31 = 0;
        }
        else
        {
          v38 = sub_1000031B8();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            sub_1002297FC(v39);

          v47 = CFSTR("FMDUnerlyingErrorKey");
          v37 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecTrustEvaluate"), 1, 0));
          v48 = v37;
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDDirectServerChannelPinningErrorDomain"), 1, v40));

          v32 = 0;
          v33 = 2;
        }

      }
    }
    else
    {
      v42 = CFSTR("FMDUnerlyingErrorKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("SecPolicyCreateAppleFMiPService"), 0, 0));
      v43 = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v33 = 2;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FMDDirectServerChannelPinningErrorDomain"), 2, v35));

      v32 = 0;
    }
    -[FMDDirectServerChannel _logRequestError:](self, "_logRequestError:", v31);

  }
  else
  {
    v32 = 0;
    v33 = 1;
  }
  ((void (**)(id, uint64_t, void *))v8)[2](v8, v33, v32);

LABEL_32:
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

    v6 = -[FMDEventLoggerEventError initWithEventName:]([FMDEventLoggerEventDataPeekError alloc], "initWithEventName:", CFSTR("FMDDirectServerChannelRequestError"));
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
