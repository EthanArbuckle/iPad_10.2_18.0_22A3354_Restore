@implementation SWCDownloader

- (SWCDownloader)init
{
  SWCDownloader *v2;
  void *v3;
  NSOperationQueue *v4;
  NSOperationQueue *queue;
  id v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  uint64_t v10;
  NSMapTable *allTaskStates;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SWCDownloader;
  v2 = -[SWCDownloader init](&v13, "init");
  if (v2)
  {
    v3 = objc_autoreleasePoolPush();
    v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    queue = v2->_queue;
    v2->_queue = v4;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("SWC download queue"));
    -[NSOperationQueue setName:](v2->_queue, "setName:", v6);

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("SWC download queue (U)", v8);

    if (v9)
      -[NSOperationQueue setUnderlyingQueue:](v2->_queue, "setUnderlyingQueue:", v9);

    v10 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    allTaskStates = v2->_allTaskStates;
    v2->_allTaskStates = (NSMapTable *)v10;

    objc_autoreleasePoolPop(v3);
  }
  return v2;
}

- (void)receiveSIGTERMSignal
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create("com.apple.swc.dl.SIGTERM");
  v4 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002A4C;
  v6[3] = &unk_1000307C0;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[SWCDownloader downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:](self, "downloadAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:", v10, v8, objc_msgSend(v10, "modeOfOperation") != 0, v9);

}

- (void)downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  id v6;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v6 = objc_retainBlock(v13);
    v16 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  }
  else
  {
    v15 = 0;
  }
  -[SWCDownloader _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:](self, "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:", v11, v12, v8, 0, v15);
  if (v14)
  {

  }
}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[SWCDownloader updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:](self, "updateAASAFileForDomain:applicationIdentifier:downloadRoute:completionHandler:", v10, v8, objc_msgSend(v10, "modeOfOperation") != 0, v9);

}

- (void)updateAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 completionHandler:(id)a6
{
  id v6;
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v6 = objc_retainBlock(v13);
    v16 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  }
  else
  {
    v15 = 0;
  }
  -[SWCDownloader _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:](self, "_downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:", v11, v12, v8, 1, v15);
  if (v14)
  {

  }
}

- (void)enumerateActiveAASAFileDownloadsWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002EA8;
  block[3] = &unk_100030810;
  block[4] = self;
  v7 = v4;
  v9 = v7;
  dispatch_sync(v6, block);

  objc_autoreleasePoolPop(v5);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, void *);
  NSObject *v12;
  NSMapTable *allTaskStates;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t, void *))a6;
  v12 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskDescription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v14));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "protectionSpace"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "authenticationMethod"));
    v18 = objc_msgSend(v17, "isEqualToString:", NSURLAuthenticationMethodServerTrust);

    if (!v18)
    {
      v25 = 0;
      v27 = 1;
LABEL_28:

      goto LABEL_29;
    }
    v19 = objc_msgSend(v16, "serverTrust");
    if (!v19)
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v28 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v16;
        v42 = 2112;
        v43 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to get server trust from %@ for task %@", buf, 0x16u);
      }
      v29 = objc_alloc((Class)NSError);
      v38[0] = CFSTR("Line");
      v38[1] = CFSTR("Function");
      v39[0] = &off_100032738;
      v24 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:task:didReceiveChallenge:completionHandler:]"));
      v39[1] = v24;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
      v31 = objc_msgSend(v29, "initWithDomain:code:userInfo:", _SWCErrorDomain, 101, v30);
      -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:](self, "_invokeCompletionHandlerForState:JSONObject:error:", v15, 0, v31);

      goto LABEL_26;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    v21 = objc_msgSend(v20, "modeOfOperation");

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](SWCSecurityGuard, "sharedSecurityGuard"));
    v37 = 0;
    v23 = objc_msgSend(v22, "verifyTrust:allowInstalledRootCertificates:error:", v19, v21 & 1, &v37);
    v24 = v37;

    if (v23)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", v19));
      if (v25)
      {
        if (qword_1000371B0 != -1)
          dispatch_once(&qword_1000371B0, &stru_100030918);
        v26 = qword_1000371A8;
        if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v10;
          v42 = 2112;
          v43 = v15;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully got credential for challenge %@ for task %@", buf, 0x16u);
        }
        v27 = 0;
        goto LABEL_27;
      }
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v36 = qword_1000371A8;
      if (!os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 138412546;
      v41 = v19;
      v42 = 2112;
      v43 = v15;
      v33 = "Failed to get credential from server trust %@ for task %@";
      v34 = v36;
      v35 = 22;
    }
    else
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v32 = qword_1000371A8;
      if (!os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_DWORD *)buf = 138412802;
      v41 = v19;
      v42 = 2112;
      v43 = v15;
      v44 = 2114;
      v45 = v24;
      v33 = "Failed to verify server trust %@ for task %@: %{public}@";
      v34 = v32;
      v35 = 32;
    }
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
LABEL_25:
    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:](self, "_invokeCompletionHandlerForState:JSONObject:error:", v15, 0, v24);
LABEL_26:
    v25 = 0;
    v27 = 2;
LABEL_27:

    goto LABEL_28;
  }
  v25 = 0;
  v27 = 2;
LABEL_29:

  v11[2](v11, v27, v25);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  NSObject *v13;
  NSMapTable *allTaskStates;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;

  v10 = a4;
  v11 = a6;
  v12 = (void (**)(id, _QWORD))a7;
  v13 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v13);

  allTaskStates = self->_allTaskStates;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "taskDescription"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v15));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scheme"));

    if (v18 && !objc_msgSend(v18, "caseInsensitiveCompare:", CFSTR("https")))
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v19 = (id)qword_1000371A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originalRequest"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "URL"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
        v27 = 138412802;
        v28 = v25;
        v29 = 2112;
        v30 = v26;
        v31 = 2112;
        v32 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Allowing redirect '%@' -> '%@' for task %@", (uint8_t *)&v27, 0x20u);

      }
      v20 = v11;
    }
    else
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v19 = (id)qword_1000371A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "originalRequest"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URL"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
        v27 = 138412802;
        v28 = v22;
        v29 = 2112;
        v30 = v23;
        v31 = 2112;
        v32 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Denying redirect '%@' -> '%@' for task %@ because the new URL has a bad scheme", (uint8_t *)&v27, 0x20u);

      }
      v20 = 0;
    }

    ((void (**)(id, id))v12)[2](v12, v20);
  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  NSObject *v12;
  NSMapTable *allTaskStates;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  unsigned int v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  const char *v40;
  char *v41;
  NSObject *v42;
  char *v43;
  objc_class *v44;
  NSString *v45;
  char *v46;
  char *v47;
  __CFString *v48;
  char *v49;
  char *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  char *v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint8_t buf[4];
  char *v59;
  __int16 v60;
  char *v61;
  __int16 v62;
  char *v63;
  __int16 v64;
  const __CFString *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[4];
  _QWORD v69[4];

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v12 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v12);

  allTaskStates = self->_allTaskStates;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskDescription"));
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v14));

  if (v15)
  {
    if (qword_1000371B0 != -1)
      dispatch_once(&qword_1000371B0, &stru_100030918);
    v16 = (id)qword_1000371A8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v41 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
      *(_DWORD *)buf = 138412546;
      v59 = v41;
      v60 = 2112;
      v61 = (char *)v15;
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Received URL '%@' response start for task %@", buf, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString buffer](v15, "buffer"));
    objc_msgSend(v17, "setLength:", 0);

    v18 = objc_opt_class(NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v10, v18) & 1) == 0)
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v19 = (id)qword_1000371A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v43 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
        v44 = (objc_class *)objc_opt_class(v10);
        v45 = NSStringFromClass(v44);
        v46 = (char *)objc_claimAutoreleasedReturnValue(v45);
        *(_DWORD *)buf = 138412802;
        v59 = v43;
        v60 = 2112;
        v61 = (char *)v15;
        v62 = 2114;
        v63 = v46;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Request for '%@' for task %@ denied because it is not an HTTP response (%{public}@)", buf, 0x20u);

      }
      v23 = 0;
      goto LABEL_51;
    }
    v19 = v10;
    v55 = (char *)-[NSObject statusCode](v19, "statusCode");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject valueForHTTPHeaderField:](v19, "valueForHTTPHeaderField:", CFSTR("Apple-Failure-Reason")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForHTTPHeaderField:](v19, "valueForHTTPHeaderField:", CFSTR("Apple-Failure-Details")));
    if (objc_msgSend(v21, "length"))
    {
      if (-[__CFString length](v20, "length"))
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v20, "stringByAppendingFormat:", CFSTR(" -- %@"), v21));
      else
        v22 = v21;
      v24 = v22;

    }
    else
    {
      v24 = v20;
    }

    v25 = v24;
    if (!-[__CFString length](v24, "length"))
    {

      v25 = CFSTR("unknown");
    }
    v26 = -[__CFString downloadRoute](v15, "downloadRoute");
    v27 = (unint64_t)(v55 - 400);
    if (v26)
    {
      if (v27 <= 0x63)
      {
        v28 = objc_alloc((Class)NSError);
        v56[0] = CFSTR("Line");
        v56[1] = CFSTR("Function");
        v57[0] = &off_100032768;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v57[1] = v29;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
        v31 = (__CFString *)v25;
        v32 = objc_msgSend(v28, "initWithDomain:code:userInfo:", CFSTR("HTTP"), v55, v30);
        -[__CFString setCancellationError:](v15, "setCancellationError:", v32);

        if (qword_1000371B0 != -1)
          dispatch_once(&qword_1000371B0, &stru_100030918);
        v33 = (id)qword_1000371A8;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v47 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v19, "URL"));
          v48 = sub_1000027F4((uint64_t)-[__CFString downloadRoute](v15, "downloadRoute"));
          v49 = (char *)objc_claimAutoreleasedReturnValue(v48);
          *(_DWORD *)buf = 138413058;
          v59 = v47;
          v60 = 2048;
          v61 = v55;
          v62 = 2114;
          v63 = v49;
          v64 = 2112;
          v65 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Request for '%@' denied due to HTTP status %lli on route %{public}@ for task %@", buf, 0x2Au);

        }
LABEL_49:
        v23 = 0;
        goto LABEL_50;
      }
      v31 = (__CFString *)v25;
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v39 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v59 = v55;
        v60 = 2112;
        v61 = (char *)v15;
        v40 = "Proceeding with response (status: %lli) for task %@";
LABEL_43:
        _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, v40, buf, 0x16u);
      }
    }
    else
    {
      if (v27 < 0xC8)
      {
        v54 = objc_alloc((Class)NSError);
        v69[0] = &off_100032750;
        v68[0] = CFSTR("Line");
        v68[1] = CFSTR("Function");
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v69[1] = v53;
        v69[2] = v25;
        v68[2] = NSDebugDescriptionErrorKey;
        v68[3] = NSUnderlyingErrorKey;
        v34 = objc_alloc((Class)NSError);
        v66[1] = CFSTR("Function");
        v67[0] = &off_100032750;
        v66[0] = CFSTR("Line");
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveResponse:completionHandler:]"));
        v67[1] = v52;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
        v35 = objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("HTTP"), v55);
        v69[3] = v35;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
        v31 = (__CFString *)v25;
        v37 = objc_msgSend(v54, "initWithDomain:code:userInfo:", _SWCErrorDomain, 7, v36);
        -[__CFString setCancellationError:](v15, "setCancellationError:", v37);

        if (qword_1000371B0 != -1)
          dispatch_once(&qword_1000371B0, &stru_100030918);
        v38 = (id)qword_1000371A8;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v50 = (char *)objc_claimAutoreleasedReturnValue(-[NSObject URL](v19, "URL"));
          *(_DWORD *)buf = 138413058;
          v59 = v50;
          v60 = 2112;
          v61 = (char *)v15;
          v62 = 2048;
          v63 = v55;
          v64 = 2114;
          v65 = v25;
          _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Request for '%@' for task %@ denied because the CDN told us to stop with HTTP status %lli: %{public}@", buf, 0x2Au);

        }
        goto LABEL_49;
      }
      v31 = (__CFString *)v25;
      if ((unint64_t)(v55 - 200) >= 0x64)
      {
        if (qword_1000371B0 != -1)
          dispatch_once(&qword_1000371B0, &stru_100030918);
        v42 = qword_1000371A8;
        if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v59 = v55;
          v60 = 2112;
          v61 = (char *)v15;
          _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "CDN sent an unexpected HTTP status %lli (ignoring) for task %@", buf, 0x16u);
        }
        goto LABEL_49;
      }
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v39 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218242;
        v59 = v55;
        v60 = 2112;
        v61 = (char *)v15;
        v40 = "Proceeding: CDN gave HTTP status %lli for task %@";
        goto LABEL_43;
      }
    }
    v23 = 1;
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  v23 = 0;
LABEL_52:

  v11[2](v11, v23);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7;
  NSObject *v8;
  NSMapTable *allTaskStates;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v7 = a5;
  v8 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v8);

  allTaskStates = self->_allTaskStates;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "taskDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v10));

  if (v11)
  {
    if (v7)
      -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:](self, "_invokeCompletionHandlerForState:JSONObject:error:", v11, 0, v7);
    else
      -[SWCDownloader _processDownloadedDataForState:](self, "_processDownloadedDataForState:", v11);
  }

}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSMapTable *allTaskStates;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint8_t buf[4];
  void *v28;

  v7 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v9);

  allTaskStates = self->_allTaskStates;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](allTaskStates, "objectForKey:", v11));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buffer"));
    objc_msgSend(v13, "appendData:", v8);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "buffer"));
    v15 = objc_msgSend(v14, "length");

    if ((unint64_t)v15 > 0x20000)
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v16 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Data for task %@ exceeded maximum length", buf, 0xCu);
      }
      v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Data exceeded maximum length of %zu bytes."), 0x20000);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "task"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "response"));

      if (v19 && (uint64_t)objc_msgSend(v19, "expectedContentLength") >= 1)
      {
        v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Data exceeded maximum length of %zu bytes (server said it would be %lld bytes.)"), 0x20000, objc_msgSend(v19, "expectedContentLength"));

        v17 = v20;
      }

      v21 = objc_alloc((Class)NSError);
      v26[0] = &off_100032780;
      v25[0] = CFSTR("Line");
      v25[1] = CFSTR("Function");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader URLSession:dataTask:didReceiveData:]"));
      v25[2] = NSDebugDescriptionErrorKey;
      v26[1] = v22;
      v26[2] = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
      v24 = objc_msgSend(v21, "initWithDomain:code:userInfo:", NSURLErrorDomain, -1103, v23);
      objc_msgSend(v12, "cancelTaskWithError:", v24);

    }
  }

}

- (SWCDownloaderDelegate)delegate
{
  return (SWCDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allTaskStates, 0);
  for (i = 40; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (unsigned)_sessionIDForTaskState:(id)a3
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "downloadRoute");
  v5 = objc_msgSend(v3, "isDiscretionary");
  v6 = v4 == 0;

  if (v5)
    return v6 | 2;
  else
    return v6;
}

- (id)_sessionForTaskState:(id)a3
{
  void *v5;
  unsigned int v6;
  NSURLSession **sessions;
  NSURLSession *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURLSession *v13;
  NSURLSession *v14;

  v5 = objc_autoreleasePoolPush();
  v6 = -[SWCDownloader _sessionIDForTaskState:](self, "_sessionIDForTaskState:", a3);
  sessions = self->_sessions;
  v8 = self->_sessions[v6];
  if (!v8)
  {
    v9 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    objc_msgSend(v10, "setHTTPCookieAcceptPolicy:", 1);
    objc_msgSend(v10, "setHTTPCookieStorage:", 0);
    objc_msgSend(v10, "setHTTPShouldSetCookies:", 0);
    objc_msgSend(v10, "setRequestCachePolicy:", 1);
    objc_msgSend(v10, "setURLCredentialStorage:", 0);
    objc_msgSend(v10, "setURLCache:", 0);
    objc_msgSend(v10, "setAllowsCellularAccess:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
    objc_msgSend(v10, "set_performsEVCertCheck:", objc_msgSend(v11, "verifyExtendedValidation"));

    if ((v9 & 1) != 0)
      objc_msgSend(v10, "setWaitsForConnectivity:", 1);
    if ((v9 & 2) != 0)
      objc_msgSend(v10, "setDiscretionary:", 1);
    v12 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v10, self, self->_queue));
    v13 = sessions[v9];
    sessions[v9] = (NSURLSession *)v12;

    v8 = sessions[v9];
  }
  v14 = v8;
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (unint64_t)_maximumActiveTaskCountForSessionID:(unsigned __int8)a3
{
  if (a3 > 3u)
    return 1;
  else
    return qword_100028578[(char)a3];
}

- (id)_taskStateForDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100005410;
  v19 = sub_100005420;
  v20 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v7);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005428;
  v11[3] = &unk_100030838;
  v14 = a4;
  v8 = v6;
  v12 = v8;
  v13 = &v15;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_downloadAASAFileForDomain:(id)a3 applicationIdentifier:(id)a4 downloadRoute:(unsigned __int8)a5 discretionary:(BOOL)a6 completionHandlers:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  SEL v30;
  unsigned __int8 v31;
  BOOL v32;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = objc_alloc((Class)NSString);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "redactedDescription"));
  v18 = objc_retainAutorelease(objc_msgSend(v16, "initWithFormat:", CFSTR("com.apple.swc.dl.begin-%@"), v17));
  v19 = (void *)os_transaction_create(objc_msgSend(v18, "UTF8String"));

  v20 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000568C;
  block[3] = &unk_100030860;
  block[4] = self;
  v26 = v13;
  v31 = a5;
  v32 = a6;
  v27 = v15;
  v28 = v14;
  v29 = v19;
  v30 = a2;
  v21 = v19;
  v22 = v14;
  v23 = v15;
  v24 = v13;
  dispatch_async(v20, block);

}

- (id)_URLRequestWithDomain:(id)a3 downloadRoute:(unsigned __int8)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  uint64_t v26;

  v4 = a4;
  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v7, "setScheme:", CFSTR("https"));
  if (v4)
  {
    if (v4 == 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
      objc_msgSend(v7, "setHost:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "port"));
      objc_msgSend(v7, "setPort:", v9);

      objc_msgSend(v7, "setPath:", CFSTR("/.well-known/apple-app-site-association"));
    }
    else
    {
      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v16 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        v26 = v4;
        _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unknown download route %llu: this is a bug in SWC.", buf, 0xCu);
      }
    }
    v14 = 0;
  }
  else
  {
    objc_msgSend(v7, "setHost:", CFSTR("app-site-association.cdn-apple.com"));
    v10 = objc_msgSend(CFSTR("/a/v1/"), "mutableCopy");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
    objc_msgSend(v10, "appendString:", v11);

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "port"));
    v13 = (void *)v12;
    if (v12)
      objc_msgSend(v10, "appendFormat:", CFSTR(":%@"), v12);

    objc_msgSend(v7, "setPath:", v10);
    v14 = objc_alloc_init((Class)NSMutableDictionary);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "host"));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Apple-Proxied-Domain-Name"));

  }
  v17 = objc_alloc((Class)NSMutableURLRequest);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v19 = objc_msgSend(v17, "initWithURL:", v18);

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100006144;
  v23[3] = &unk_100030888;
  v20 = v19;
  v24 = v20;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (v4)
    _CFURLRequestSetAllowedProtocolTypes(objc_msgSend(objc_retainAutorelease(v20), "_CFURLRequest"), 1);
  objc_msgSend(v20, "setCachePolicy:", 1);
  objc_msgSend(v20, "setHTTPShouldHandleCookies:", 0);
  v21 = objc_msgSend(v20, "copy");

  objc_autoreleasePoolPop(v6);
  return v21;
}

- (void)_enumerateTaskStatesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, unsigned __int8 *);
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];

  v4 = (void (**)(id, uint64_t, unsigned __int8 *))a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v5);

  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_allTaskStates, "objectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = objc_autoreleasePoolPush();
      v4[2](v4, v10, &v16);
      LODWORD(v10) = v16;
      objc_autoreleasePoolPop(v11);
      if ((_DWORD)v10)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_resumePendingTasks
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[6];
  _QWORD v18[10];
  int v19;
  _BYTE v20[128];

  v3 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = objc_autoreleasePoolPush();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x5812000000;
  v18[3] = sub_100006548;
  v18[4] = sub_1000065B8;
  memset(&v18[5], 0, 40);
  v19 = 1065353216;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000065C0;
  v17[3] = &unk_1000308B0;
  v17[4] = self;
  v17[5] = v18;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v17);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100006650;
  v14[3] = &unk_1000308D8;
  v14[4] = self;
  v16 = v18;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v15 = v5;
  -[SWCDownloader _enumerateTaskStatesUsingBlock:](self, "_enumerateTaskStatesUsingBlock:", v14);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "resumeTask", (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v20, 16);
    }
    while (v7);
  }

  _Block_object_dispose(v18, 8);
  sub_100007244((uint64_t)&v18[6]);
  objc_autoreleasePoolPop(v4);
}

- (id)_replaceTaskState:(id)a3
{
  id v5;
  NSObject *v6;
  SWCDownloadTaskState *v7;
  void *v8;
  SWCDownloadTaskState *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMapTable *allTaskStates;
  void *v15;
  void *v16;
  NSMapTable *v17;
  void *v18;
  void *v20;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v6);

  v7 = [SWCDownloadTaskState alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v9 = -[SWCDownloadTaskState initWithDownloader:domain:downloadRoute:](v7, "initWithDownloader:domain:downloadRoute:", self, v8, objc_msgSend(v5, "downloadRoute"));

  if (!v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCDownloader.mm"), 709, CFSTR("Failed to create download state object"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState completionHandlers](v9, "completionHandlers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionHandlers"));
  objc_msgSend(v10, "setArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "completionHandlers"));
  objc_msgSend(v12, "removeAllObjects");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cancellationError"));
  -[SWCDownloadTaskState setCancellationError:](v9, "setCancellationError:", v13);

  allTaskStates = self->_allTaskStates;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "task"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "taskDescription"));
  -[NSMapTable removeObjectForKey:](allTaskStates, "removeObjectForKey:", v16);

  v17 = self->_allTaskStates;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](v9, "taskDescription"));
  -[NSMapTable setObject:forKey:](v17, "setObject:forKey:", v9, v18);

  objc_msgSend(v5, "cancelTaskWithError:", 0);
  return v9;
}

- (void)_processDownloadedDataForState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  int __buf;
  void *v25;
  __int16 v26;
  id v27;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  if (qword_1000371B0 != -1)
    dispatch_once(&qword_1000371B0, &stru_100030918);
  v6 = (id)qword_1000371A8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v21 = sub_1000027F4((uint64_t)objc_msgSend(v4, "downloadRoute"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    __buf = 138412546;
    v25 = v20;
    v26 = 2114;
    v27 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Downloaded data for domain %@ (route? %{public}@)", (uint8_t *)&__buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buffer"));
  v9 = objc_alloc((Class)NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "redactedDescription"));
  v11 = objc_retainAutorelease(objc_msgSend(v9, "initWithFormat:", CFSTR("com.apple.swc.aasa.read-%@"), v10));
  v12 = (void *)os_transaction_create(objc_msgSend(v11, "UTF8String"));

  if (v8)
  {
    if (_SWCDiagnosticStorage[2]
      && (v13 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs")),
          v14 = objc_msgSend(v13, "isAppleInternal"),
          v13,
          v14))
    {
      arc4random_buf(&__buf, 0x80uLL);
      v15 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", (char *)objc_msgSend(v8, "length") + 128);
      objc_msgSend(v15, "appendBytes:length:", &__buf, 128);
      objc_msgSend(v15, "appendData:", v8);

    }
    else
    {
      v15 = v8;
    }
  }
  else
  {
    v15 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SWCSecurityGuard sharedSecurityGuard](SWCSecurityGuard, "sharedSecurityGuard"));
  v23 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "JSONObjectWithSignedJSONData:error:", v15, &v23));
  v18 = v23;

  if (v17)
  {
    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:](self, "_invokeCompletionHandlerForState:JSONObject:error:", v4, v17, 0);
  }
  else
  {
    if (qword_1000371B0 != -1)
      dispatch_once(&qword_1000371B0, &stru_100030918);
    v19 = qword_1000371A8;
    if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_ERROR))
    {
      __buf = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error securing JSON file for %@: %@", (uint8_t *)&__buf, 0x16u);
    }
    -[SWCDownloader _invokeCompletionHandlerForState:JSONObject:error:](self, "_invokeCompletionHandlerForState:JSONObject:error:", v4, 0, v18);
  }

  objc_autoreleasePoolPop(v5);
}

- (void)_invokeCompletionHandlerForState:(id)a3 JSONObject:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *j;
  NSMapTable *allTaskStates;
  void *v29;
  void *v30;
  uint64_t v31;
  NSURLSession **sessions;
  NSURLSession *v33;
  void *context;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[NSOperationQueue underlyingQueue](self->_queue, "underlyingQueue"));
  dispatch_assert_queue_V2(v11);

  context = objc_autoreleasePoolPush();
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloader delegate](self, "delegate"));
  v12 = objc_msgSend(v8, "downloadRoute");
  if (v9)
  {
    if (v35
      && (objc_opt_respondsToSelector(v35, "downloader:didDownloadAASAFileContainingJSONObject:fromDomain:downloadRoute:") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      objc_msgSend(v35, "downloader:didDownloadAASAFileContainingJSONObject:fromDomain:downloadRoute:", self, v9, v13, v12);

    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandlers"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v14);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      }
      while (v15);
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cancellationError"));
    if (objc_msgSend(v10, "code") == (id)-999)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
      v19 = objc_msgSend(v18, "isEqual:", NSURLErrorDomain);
      v20 = v14 ? v19 : 0;

      if (v20 == 1)
      {
        if (qword_1000371B0 != -1)
          dispatch_once(&qword_1000371B0, &stru_100030918);
        v21 = qword_1000371A8;
        if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v14;
          v47 = 2112;
          v48 = v10;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Substituting cancellation error %@ for error %@", buf, 0x16u);
        }
        v22 = v14;

        v10 = v22;
      }
    }
    if (v35 && (objc_opt_respondsToSelector(v35, "downloader:failedToDownloadAASAFileFromDomain:error:") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
      objc_msgSend(v35, "downloader:failedToDownloadAASAFileFromDomain:error:", self, v23, v10);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionHandlers"));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v24);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j) + 16))();
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v25);
    }

  }
  allTaskStates = self->_allTaskStates;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "task"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "taskDescription"));
  -[NSMapTable removeObjectForKey:](allTaskStates, "removeObjectForKey:", v30);

  if (-[NSMapTable count](self->_allTaskStates, "count"))
  {
    -[SWCDownloader _resumePendingTasks](self, "_resumePendingTasks");
  }
  else
  {
    v31 = 0;
    sessions = self->_sessions;
    do
    {
      -[NSURLSession finishTasksAndInvalidate](sessions[v31], "finishTasksAndInvalidate");
      v33 = sessions[v31];
      sessions[v31] = 0;

      ++v31;
    }
    while (v31 != 4);
  }

  objc_autoreleasePoolPop(context);
}

@end
