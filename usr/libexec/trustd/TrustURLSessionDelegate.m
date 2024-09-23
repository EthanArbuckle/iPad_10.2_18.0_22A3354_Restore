@implementation TrustURLSessionDelegate

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  const void *v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  unsigned int v24;
  const void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  char *v31;
  const void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  const void *v39;
  NSObject *v40;
  BOOL v42;
  _QWORD handler[4];
  id v44;
  NSObject *v45;
  TrustURLSessionDelegate *v46;
  id v47;
  uint8_t buf[4];
  NSObject *v49;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "numTasks");
  v9 = (unint64_t)v8 > 2;
  if ((unint64_t)v8 >= 3)
  {
    v10 = sub_100011628("http");
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = objc_opt_class(self);
      v12 = v49;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Too many fetch %@ requests for this cert", buf, 0xCu);

    }
    goto LABEL_21;
  }
  v13 = (char *)objc_msgSend(v7, "URIix");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIs"));
  v15 = (char *)objc_msgSend(v14, "count");

  if (v13 >= v15)
  {
    v9 = 1;
    goto LABEL_22;
  }
  v42 = v9;
  while (1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v13));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "host"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate timeoutEntryForServer:](self, "timeoutEntryForServer:", v18));

    if (v19)
    {
      if ((unint64_t)objc_msgSend(v19, "timeoutCounter") >= 2)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastAttemptDate"));
        objc_msgSend(v20, "timeIntervalSinceNow");
        v22 = v21;

        if (v22 >= -60.0)
        {
          v32 = sub_100011628("http");
          v26 = objc_claimAutoreleasedReturnValue(v32);
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "host"));
          *(_DWORD *)buf = 138412290;
          v49 = v27;
          v28 = v26;
          v29 = "skipping host due to too many recent timeouts: %@";
          goto LABEL_12;
        }
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scheme"));
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("http"));

    if (v24)
      break;
    v25 = sub_100011628("http");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scheme"));
      *(_DWORD *)buf = 138412290;
      v49 = v27;
      v28 = v26;
      v29 = "skipping unsupported scheme %@";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);

    }
LABEL_13:

    ++v13;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URIs"));
    v31 = (char *)objc_msgSend(v30, "count");

    if (v13 >= v31)
    {
      v9 = 1;
      goto LABEL_22;
    }
  }
  objc_msgSend(v7, "setURIix:", v13 + 1);
  objc_msgSend(v7, "setNumTasks:", (char *)objc_msgSend(v7, "numTasks") + 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate createNextRequest:context:](self, "createNextRequest:context:", v17, v7));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataTaskWithRequest:", v33));

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "originalRequest"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "taskId"));
  v37 = objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate createTimerForTask:](self, "createTimerForTask:", v36));

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100054374;
  handler[3] = &unk_100079468;
  v38 = v34;
  v44 = v38;
  v11 = v17;
  v45 = v11;
  v46 = self;
  v47 = v6;
  dispatch_source_set_event_handler(v37, handler);
  dispatch_resume(v37);
  objc_msgSend(v38, "resume");
  v39 = sub_100011628("http");
  v40 = objc_claimAutoreleasedReturnValue(v39);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "request for uri: %@", buf, 0xCu);
  }

  v9 = v42;
LABEL_21:

LABEL_22:
  return v9;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (id)timeoutEntryForServer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (id)createTimerForTask:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  double v7;
  uint64_t v8;
  CFIndex AppIntegerValue;
  uint64_t v10;
  const void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v19;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate queue](self, "queue"));
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

  v7 = 3.0;
  if (SecIsInternalRelease(v8))
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("DefaultHTTPTimeout"), CFSTR("com.apple.security"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v10 = AppIntegerValue;
      v11 = sub_100011628("http");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Retrieved DefaultHTTPTimeout setting for %ld seconds", buf, 0xCu);
      }

      v7 = (double)v10;
    }
  }
  v13 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_source_set_timer(v6, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _timerMap](self, "_timerMap"));
  objc_sync_enter(v14);
  -[TrustURLSessionDelegate cancelTimer:](self, "cancelTimer:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _timerMap](self, "_timerMap"));
  objc_msgSend(v15, "setObject:forKey:", v6, v4);

  objc_sync_exit(v14);
  return v6;
}

- (id)createNextRequest:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", a3, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ocsp-uat.corp.apple.com"));

  if (v9)
  {
    objc_msgSend(v7, "setScheme:", CFSTR("https"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ocsp.apple.com"));

    if (v11)
    {
      objc_msgSend(v7, "setScheme:", CFSTR("https"));
      objc_msgSend(v7, "setHost:", CFSTR("ocsp2.apple.com"));
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate addTask:](self, "addTask:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
  objc_msgSend(v14, "addValue:forHTTPHeaderField:", v15, CFSTR("X-Apple-Request-UUID"));

  v16 = objc_msgSend(v6, "attribution");
  objc_msgSend(v14, "setAttribution:", v16);

  return v14;
}

- (void)cancelTimer:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _timerMap](self, "_timerMap"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _timerMap](self, "_timerMap"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v8));

  if (v6)
  {
    dispatch_source_cancel(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _timerMap](self, "_timerMap"));
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  objc_sync_exit(v4);

}

- (id)addTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  objc_msgSend(v7, "setObject:forKey:", v4, v5);

  objc_sync_exit(v6);
  return v5;
}

- (NSMutableDictionary)_timerMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)_taskContextMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)_serverMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  __SecTrust *v13;
  uint64_t v14;
  const void *v15;
  NSObject *v16;
  CFErrorRef v17;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v20;

  v7 = a5;
  v8 = (void (**)(id, uint64_t, _QWORD))a6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "authenticationMethod"));
  v11 = objc_msgSend(v10, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

  if (!v11)
  {
    v8[2](v8, 1, 0);
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "protectionSpace"));
  v13 = (__SecTrust *)objc_msgSend(v12, "serverTrust");

  if (!SecTrustSetNetworkFetchAllowed(v13, 0))
  {
    error = 0;
    if (SecTrustEvaluateWithError(v13, &error))
    {
      v14 = 1;
      goto LABEL_4;
    }
    v15 = sub_100011628("SecError");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = error;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to connect to server: %@", buf, 0xCu);
    }

    v17 = error;
    if (error)
    {
      error = 0;
      CFRelease(v17);
    }
  }
  v14 = 2;
LABEL_4:
  v8[2](v8, v14, 0);
LABEL_6:

}

- (TrustURLSessionDelegate)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id v11;
  objc_super v12;

  v3 = objc_opt_class(self);
  if (v3 == objc_opt_class(TrustURLSessionDelegate))
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AbstractClassException"), CFSTR("This is an abstract class. To use it, please subclass."), 0)));
    objc_exception_throw(v11);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[TrustURLSessionDelegate set_taskContextMap:](self, "set_taskContextMap:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[TrustURLSessionDelegate set_serverMap:](self, "set_serverMap:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  -[TrustURLSessionDelegate set_timerMap:](self, "set_timerMap:", v6);

  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = dispatch_queue_create("com.apple.trustd.TrustURLSessionDelegate", v8);
  -[TrustURLSessionDelegate setQueue:](self, "setQueue:", v9);

  v12.receiver = self;
  v12.super_class = (Class)TrustURLSessionDelegate;
  return -[TrustURLSessionDelegate init](&v12, "init");
}

- (id)contextForTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (void)removeTask:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _taskContextMap](self, "_taskContextMap"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)removeServer:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  v6 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ocsp2.apple.com")))
  {

    v6 = CFSTR("ocsp.apple.com");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)addServer:(id)a3
{
  TimeoutEntry *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_alloc_init(TimeoutEntry);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  objc_sync_exit(v5);
}

- (void)incrementCountForServer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v9 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("ocsp2.apple.com")))
  {

    v9 = CFSTR("ocsp.apple.com");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v9));

  if (v6)
  {
    objc_msgSend(v6, "setTimeoutCounter:", (char *)objc_msgSend(v6, "timeoutCounter") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "setLastAttemptDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate _serverMap](self, "_serverMap"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v9);

  }
  else
  {
    -[TrustURLSessionDelegate addServer:](self, "addServer:", v9);
  }

  objc_sync_exit(v4);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const void *v15;
  int v16;
  void *v17;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "originalRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskId"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v9));
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "response"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
      objc_msgSend(v11, "setResponse:", v13);

    }
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "response"));
    -[NSObject appendData:](v14, "appendData:", v7);
  }
  else
  {
    v15 = sub_100011628("http");
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to find task for taskId: %@", (uint8_t *)&v16, 0xCu);
    }
  }

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  void *v20;
  void *v21;
  __CFString *v22;
  CFIndex Length;
  const __CFCharacterSet *Predefined;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  CFIndex v27;
  int v28;
  CFStringRef v29;
  char v30;
  char v31;
  CFIndex v32;
  CFIndex v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  CFIndex v37;
  UniChar v38;
  int64_t v39;
  uint64_t v40;
  CFIndex v41;
  int64_t v42;
  CFIndex v43;
  int v44;
  int IsCharacterMember;
  int64_t v46;
  CFIndex v47;
  BOOL v48;
  CFIndex v49;
  int v50;
  CFIndex v51;
  CFIndex v52;
  UniChar *v53;
  CFIndex v54;
  UniChar v55;
  UniChar CharacterAtIndex;
  int64_t v57;
  CFIndex v58;
  BOOL v59;
  __CFString *v60;
  double v61;
  double v62;
  const void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  TrustURLSessionDelegate *v75;
  CFStringRef v76;
  int v77;
  const __CFString *v78;
  CFRange result;
  UniChar buffer[8];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CFStringRef theString;
  UniChar *v89;
  const char *v90;
  uint64_t v91;
  CFIndex v92;
  int64_t v93;
  int64_t v94;
  CFRange v95;
  CFRange v96;
  CFRange v97;
  CFRange v98;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(self);
  if (v11 == objc_opt_class(TrustURLSessionDelegate))
  {
    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("AbstractClassException"), CFSTR("This is an abstract class. To use it, please subclass and override didCompleteWithError."), 0)));
    objc_exception_throw(v69);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskId"));

  -[TrustURLSessionDelegate cancelTimer:](self, "cancelTimer:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v13));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setMaxAge:", 86400.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "response"));
    v75 = self;
    if (!objc_msgSend(v16, "length"))
    {

      goto LABEL_94;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
    v18 = objc_opt_class(NSHTTPURLResponse);
    isKindOfClass = objc_opt_isKindOfClass(v17, v18);

    if ((isKindOfClass & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "response"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allHeaderFields"));
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("cache-control")));

      if (!v22)
      {
        v60 = 0;
        goto LABEL_93;
      }
      v70 = v15;
      v71 = v13;
      v72 = v10;
      v73 = v9;
      v74 = v8;
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      *(_OWORD *)buffer = 0u;
      v81 = 0u;
      Length = CFStringGetLength(v22);
      Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
      theString = v22;
      v91 = 0;
      v92 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v22);
      CStringPtr = 0;
      v89 = (UniChar *)CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v22, 0x600u);
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v93 = 0;
      v94 = 0;
      v90 = CStringPtr;
      v76 = v22;
      while (1)
      {
        result.location = 0xAAAAAAAAAAAAAAAALL;
        result.length = 0xAAAAAAAAAAAAAAAALL;
        if (v27 >= Length)
          break;
        v77 = v28;
        v78 = v29;
        v30 = 0;
        v31 = 0;
        v32 = -v27;
        v33 = v27 + 64;
        v34 = -1;
        v35 = v27;
        do
        {
          if ((unint64_t)v35 >= 4)
            v36 = 4;
          else
            v36 = v35;
          if (v35 < 0 || (v37 = v92, v92 <= v35))
          {
            v38 = 0;
          }
          else
          {
            if (v89)
            {
              v38 = v89[v35 + v91];
            }
            else if (v90)
            {
              v38 = v90[v91 + v35];
            }
            else
            {
              if (v94 <= v35 || (v39 = v93, v93 > v35))
              {
                v40 = v36 + v32;
                v41 = v33 - v36;
                v42 = v35 - v36;
                v43 = v42 + 64;
                if (v42 + 64 >= v92)
                  v43 = v92;
                v93 = v42;
                v94 = v43;
                if (v92 >= v41)
                  v37 = v41;
                v95.length = v37 + v40;
                v95.location = v42 + v91;
                CFStringGetCharacters(theString, v95, buffer);
                v39 = v93;
              }
              v38 = buffer[v35 - v39];
            }
            if (!(v31 & 1 | (v38 != 44)))
              goto LABEL_40;
          }
          v44 = v38;
          IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, v38);
          if ((v30 & 1) != 0)
            v46 = v35;
          else
            v46 = v34;
          if ((v30 & 1) != 0)
            v47 = v27;
          else
            v47 = v35;
          if (!IsCharacterMember)
          {
            v31 ^= v44 == 34;
            v30 = 1;
            v34 = v46;
            v27 = v47;
          }
          ++v35;
          --v32;
          ++v33;
        }
        while (Length != v35);
        v35 = Length;
LABEL_40:
        v48 = __CFADD__(v34, 1);
        v49 = v34 + 1;
        v22 = (__CFString *)v76;
        v29 = v78;
        v28 = v77;
        if (v48)
          goto LABEL_43;
LABEL_44:
        if (v35 == Length)
          v50 = 1;
        else
          v50 = v28;
        if (!v29)
        {
          v97.length = v49 - v27;
          v97.location = v27;
          if (CFStringFindWithOptions(v22, CFSTR("max-age"), v97, 9uLL, &result))
          {
            v51 = result.length + result.location;
            if (result.length + result.location < v49)
            {
              v29 = 0;
              while (1)
              {
                if (v51 < 0 || (v52 = v92, v92 <= v51))
                {
                  v55 = 0;
LABEL_57:
                  if (!CFCharacterSetIsCharacterMember(Predefined, v55))
                    goto LABEL_77;
                  goto LABEL_58;
                }
                v53 = v89;
                if (v89)
                  break;
                if (!v90)
                {
                  if (v94 <= v51 || (v57 = v93, v93 > v51))
                  {
                    v58 = v51 - 4;
                    if ((unint64_t)v51 < 4)
                      v58 = 0;
                    if (v58 + 64 < v92)
                      v52 = v58 + 64;
                    v93 = v58;
                    v94 = v52;
                    v96.location = v91 + v58;
                    v96.length = v52 - v58;
                    CFStringGetCharacters(theString, v96, buffer);
                    v57 = v93;
                  }
                  v54 = v51 - v57;
                  v53 = buffer;
                  goto LABEL_55;
                }
                v55 = v90[v91 + v51];
LABEL_62:
                if (v55 != 61)
                  goto LABEL_57;
                while (++v51 < v49)
                {
                  CharacterAtIndex = CFStringGetCharacterAtIndex(v22, v51);
                  if (!CFCharacterSetIsCharacterMember(Predefined, CharacterAtIndex))
                  {
                    if (v29)
                      CFRelease(v29);
                    v98.length = v49 - v51;
                    v98.location = v51;
                    v29 = CFStringCreateWithSubstring(kCFAllocatorDefault, v22, v98);
                    break;
                  }
                }
LABEL_58:
                if (++v51 >= v49)
                  goto LABEL_77;
              }
              v54 = v91 + v51;
LABEL_55:
              v55 = v53[v54];
              goto LABEL_62;
            }
          }
          v29 = 0;
        }
LABEL_77:
        if (v29)
          v59 = (v50 & 1) == 0;
        else
          v59 = 0;
        if (v59)
          v28 = 1;
        else
          v28 = v50;
        v27 = v35 + 1;
        if ((v28 & 1) != 0)
        {
          v60 = (__CFString *)v29;
          v8 = v74;
          v13 = v71;
          v10 = v72;
          if (v60)
          {
            -[__CFString doubleValue](v60, "doubleValue");
            v9 = v73;
            v15 = v70;
            if (v61 >= 3600.0)
            {
              -[__CFString doubleValue](v60, "doubleValue");
              if (v62 <= 604800.0)
              {
                -[__CFString doubleValue](v60, "doubleValue");
                objc_msgSend(v70, "setMaxAge:");
              }
            }
          }
          else
          {
            v9 = v73;
            v15 = v70;
          }
LABEL_93:

          goto LABEL_94;
        }
      }
      v35 = v27;
LABEL_43:
      v49 = v35;
      goto LABEL_44;
    }
LABEL_94:
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest", v70));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "URL"));
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "host"));

    if (v10 && v64)
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      if ((objc_msgSend(v67, "isEqualToString:", NSURLErrorDomain) & 1) != 0)
      {
        v68 = objc_msgSend(v10, "code");

        if (v68 == (id)-1001)
        {
          -[TrustURLSessionDelegate incrementCountForServer:](v75, "incrementCountForServer:", v64);
          goto LABEL_103;
        }
      }
      else
      {

      }
    }
    else if (!v64)
    {
      goto LABEL_103;
    }
    -[TrustURLSessionDelegate removeServer:](v75, "removeServer:", v64);
    goto LABEL_103;
  }
  v63 = sub_100011628("http");
  v64 = objc_claimAutoreleasedReturnValue(v63);
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 138412290;
    *(_QWORD *)&buffer[2] = v13;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "failed to find task for taskId: %@", (uint8_t *)buffer, 0xCu);
  }
LABEL_103:

}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v8;
  void (**v9)(id, _QWORD);
  const void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v8 = a4;
  v9 = (void (**)(id, _QWORD))a7;
  v10 = sub_100011628("http");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URL"));
    v14 = 138412290;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "failed redirection for %@", (uint8_t *)&v14, 0xCu);

  }
  v9[2](v9, 0);

}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)set_taskContextMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)set_serverMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)set_timerMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timerMap, 0);
  objc_storeStrong((id *)&self->__serverMap, 0);
  objc_storeStrong((id *)&self->__taskContextMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
