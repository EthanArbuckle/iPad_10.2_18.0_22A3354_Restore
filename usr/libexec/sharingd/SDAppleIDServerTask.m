@implementation SDAppleIDServerTask

- (SDAppleIDServerTask)initWithType:(int64_t)a3 appleID:(id)a4 info:(id)a5
{
  id v9;
  id v10;
  SDAppleIDServerTask *v11;
  SDAppleIDServerTask *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OS_dispatch_queue *dispatchQueue;
  void *v18;
  id v19;
  uint64_t v20;
  NSURLSession *session;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SDAppleIDServerTask;
  v11 = -[SDAppleIDServerTask init](&v23, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appleID, a4);
    v15 = SFMainQueue(v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v16;

    objc_storeStrong((id *)&v12->_taskInfo, a5);
    v12->_type = a3;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    objc_msgSend(v18, "setTimeoutIntervalForResource:", 3600.0);
    objc_msgSend(v18, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleAIDCService);
    v19 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", CFSTR("com.apple.coreservices.appleidauthagent"));
    objc_msgSend(v18, "setWaitsForConnectivity:", 1);
    objc_msgSend(v18, "set_appleIDContext:", v19);
    v20 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](NSURLSession, "sessionWithConfiguration:", v18));
    session = v12->_session;
    v12->_session = (NSURLSession *)v20;

  }
  return v12;
}

- (id)description
{
  id v3;

  v3 = 0;
  NSAppendPrintF(&v3, "-- SDAppleIDServerTask --\n");
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FBBB0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_callResponseHandlerWithInfo:(id)a3 errorInfo:(id)a4 error:(int)a5
{
  id v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask responseHandler](self, "responseHandler"));

  if (v9)
  {
    if (a5)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SFAppleIDErrorDomain, a5, v8));
    else
      v10 = 0;
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask responseHandler](self, "responseHandler"));
    ((void (**)(_QWORD, id, void *))v11)[2](v11, v12, v10);

    -[SDAppleIDServerTask setResponseHandler:](self, "setResponseHandler:", 0);
  }

}

- (void)_callResponseHandlerWithInfo:(id)a3 error:(int)a4
{
  -[SDAppleIDServerTask _callResponseHandlerWithInfo:errorInfo:error:](self, "_callResponseHandlerWithInfo:errorInfo:error:", a3, 0, *(_QWORD *)&a4);
}

- (BOOL)_isTaskInfoValid
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  BOOL v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
  v4 = objc_msgSend(v3, "count");

  switch(-[SDAppleIDServerTask type](self, "type"))
  {
    case 0:
      if (v4 != (id)1)
        goto LABEL_40;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v6 = v5;
      v7 = CFSTR("csr");
      goto LABEL_9;
    case 1:
      if (v4 != (id)1)
        goto LABEL_40;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v6 = v5;
      v7 = CFSTR("certificateToken");
LABEL_9:
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

      if (!v8)
        goto LABEL_43;
      v10 = objc_opt_class(NSString, v9);
      isKindOfClass = objc_opt_isKindOfClass(v8, v10);
      goto LABEL_42;
    case 2:
      if (v4 != (id)2)
        goto LABEL_40;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("serialNumber")));

      if (!v8)
        goto LABEL_43;
      v14 = objc_opt_class(NSString, v13);
      if ((objc_opt_isKindOfClass(v8, v14) & 1) == 0)
        goto LABEL_43;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("clientAidvrId")));

      if (!v16)
        goto LABEL_40;
      v18 = objc_opt_class(NSString, v17);
      isKindOfClass = objc_opt_isKindOfClass(v16, v18);
      goto LABEL_37;
    case 3:
      if (v4 != (id)1)
        goto LABEL_40;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v20)
        goto LABEL_26;
      v22 = v20;
      v23 = *(_QWORD *)v37;
      break;
    default:
      if (dword_1007B1DE8 <= 60
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
      {
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _isTaskInfoValid]", 60, "### Unhandled type %d\n", -[SDAppleIDServerTask type](self, "type"));
      }
      goto LABEL_40;
  }
  while (2)
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(_QWORD *)v37 != v23)
        objc_enumerationMutation(v19);
      v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
      v26 = objc_opt_class(NSString, v21);
      if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0
        || !objc_msgSend(&off_10074FBB0, "containsObject:", v25))
      {

LABEL_40:
        isKindOfClass = 0;
        goto LABEL_41;
      }
    }
    v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v22)
      continue;
    break;
  }
LABEL_26:

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("emails")));

  isKindOfClass = v8 != 0;
  if (v8)
  {
    v29 = objc_opt_class(NSArray, v28);
    if ((objc_opt_isKindOfClass(v8, v29) & 1) == 0 || objc_msgSend(v8, "count") != (id)1)
    {
LABEL_43:
      isKindOfClass = 0;
      goto LABEL_42;
    }
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("phones")));

  if (!v16)
  {
LABEL_41:
    v8 = 0;
    goto LABEL_42;
  }
  v32 = objc_opt_class(NSArray, v31);
  if ((objc_opt_isKindOfClass(v16, v32) & 1) != 0)
  {
    v33 = objc_msgSend(v16, "count");
    if (v8)
      v34 = 1;
    else
      v34 = v33 == (id)1;
    isKindOfClass = v34;
  }
  else
  {
    isKindOfClass = 0;
  }
LABEL_37:
  v8 = v16;
LABEL_42:

  return isKindOfClass & 1;
}

- (void)_urlWithCompletion:(id)a3
{
  id v4;
  int64_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_1007B1DE8 <= 30
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _urlWithCompletion:]", 30, "Getting a url from AuthKit url bag...");
    }
    v5 = -[SDAppleIDServerTask type](self, "type");
    global_queue = dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FC1D4;
    block[3] = &unk_100717988;
    v10 = v5;
    block[4] = self;
    v9 = v4;
    dispatch_async(v7, block);

  }
  else if (dword_1007B1DE8 <= 90
         && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
  {
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _urlWithCompletion:]", 90, "Failed to get url with error %#m\n", 4294960591);
  }

}

- (void)_handleURLIsAvailable:(id)a3 error:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, id, uint64_t);
  id v10;
  void *v11;
  id v12;
  SDAppleIDMutableURLRequest *v13;
  SDAppleIDMutableURLRequest *v14;
  SDAppleIDMutableURLRequest *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, id, uint64_t))a5;
  v10 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (v10 && !(_DWORD)v6)
  {
    v14 = (SDAppleIDMutableURLRequest *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

    if (v14)
    {
      v15 = [SDAppleIDMutableURLRequest alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));
      v14 = -[SDAppleIDMutableURLRequest initWithURL:gsToken:](v15, "initWithURL:gsToken:", v10, v16);

      if (v14)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));

        if (!v11)
        {
LABEL_8:
          v13 = v14;
          v12 = 0;
          v6 = 0;
          v14 = v13;
          goto LABEL_9;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
        v19 = 0;
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v17, 0, &v19));
        v12 = v19;

        if (!v12)
        {
          -[SDAppleIDMutableURLRequest setHTTPBody:](v14, "setHTTPBody:", v11);
          goto LABEL_8;
        }
        if (dword_1007B1DE8 <= 90
          && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription"));
          LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleURLIsAvailable:error:completion:]", 90, "JSON Serialization of the URL Request body failed with error %@", v18);

        }
        v6 = NSErrorToOSStatus(v12);
        v13 = 0;
      }
      else
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v6 = 4294960534;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v6 = 4294960587;
    }
  }
LABEL_9:
  if (v9)
    v9[2](v9, v13, v6);

}

- (void)_urlRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000FC770;
      v7[3] = &unk_1007179B0;
      v7[4] = self;
      v8 = v4;
      -[SDAppleIDServerTask _urlWithCompletion:](self, "_urlWithCompletion:", v7);

      goto LABEL_4;
    }
    v6 = 4294960587;
  }
  else
  {
    v6 = 4294960591;
  }
  if (dword_1007B1DE8 <= 90 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _urlRequestWithCompletion:]", 90, "Failed to create NSURLRequest with error %#m\n", v6);
  if (v4)
    (*((void (**)(id, _QWORD, uint64_t))v4 + 2))(v4, 0, v6);
LABEL_4:

}

- (void)_activate
{
  uint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activated)
  {
    if (self->_invalidated)
    {
      if (dword_1007B1DE8 <= 60
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
      {
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _activate]", 60, "### Object invalidated\n");
      }
      v3 = 4294960573;
    }
    else
    {
      if (dword_1007B1DE8 <= 30
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
      {
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _activate]", 30, "Activate\n");
      }
      if (-[SDAppleIDServerTask _isTaskInfoValid](self, "_isTaskInfoValid"))
      {
        -[SDAppleIDServerTask _sendRequest](self, "_sendRequest");
        self->_activated = 1;
        return;
      }
      v3 = 4294960591;
    }
    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](self, "_callResponseHandlerWithInfo:error:", 0, v3);
    return;
  }
  if (dword_1007B1DE8 <= 60 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _activate]", 60, "### Already activated\n");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000FC93C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleURLRequestIsAvailable
{
  void *v3;
  NSURLSession *session;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));

  if (v3)
  {
    session = self->_session;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000FCB14;
    v11[3] = &unk_1007179D8;
    v11[4] = self;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:completionHandler:](session, "dataTaskWithRequest:completionHandler:", v5, v11));

    objc_msgSend(v3, "resume");
    if (dword_1007B1DE8 <= 30)
    {
      if (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30))
      {
        v6 = -[SDAppleIDServerTask type](self, "type");
        if (v6 > 3)
          v7 = CFSTR("?");
        else
          v7 = *(&off_100717A48 + v6);
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleURLRequestIsAvailable]", 30, "Sending %@ server task\n", v7);
      }
      if (dword_1007B1DE8 <= 10
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 10)))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask urlRequest](self, "urlRequest"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allHTTPHeaderFields"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask taskInfo](self, "taskInfo"));
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleURLRequestIsAvailable]", 10, "HTTP Headers: %@\nBody: %@", v9, v10);

      }
    }
  }
  else
  {
    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](self, "_callResponseHandlerWithInfo:error:", 0, 4294960587);
  }

}

- (void)_handleGSTokenIsAvailable
{
  void *v3;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask gsToken](self, "gsToken"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1000FCCBC;
    v4[3] = &unk_100717A00;
    v4[4] = self;
    -[SDAppleIDServerTask _urlRequestWithCompletion:](self, "_urlRequestWithCompletion:", v4);
  }
  else
  {
    -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](self, "_callResponseHandlerWithInfo:error:", 0, 4294960587);
  }
}

- (void)_handleServerError:(int64_t)a3 withStatusCode:(int64_t)a4 nextSuggestedAttemptDelay:(int64_t)a5
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a4 == 401)
  {
    v9 = 201215;
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]", 60, "### Status code %d, server error code %d. User authentication required to proceed\n");
    }
  }
  else if (a4 == 200)
  {
    v9 = 201215;
    if (a3 > -20210)
    {
      if (a3 == -1)
      {
        v9 = 201221;
        goto LABEL_25;
      }
      if (a3 == -20209)
        goto LABEL_5;
    }
    else
    {
      if ((unint64_t)(a3 + 22412) < 4)
      {
LABEL_5:
        if (dword_1007B1DE8 <= 60
          && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
        {
          LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]", 60, "### Server error %d: status code %d expected, but %d received\n");
        }
        goto LABEL_25;
      }
      if (a3 == -22413)
      {
        if (dword_1007B1DE8 <= 60
          && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
        {
          LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]", 60, "### Server error %d means server bug. Report to server folks\n", -22413);
        }
        v9 = 201217;
        goto LABEL_25;
      }
    }
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]", 60, "### Unhandled server error: %d\n", a3);
    }
    v9 = 201200;
  }
  else
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:]", 60, "### Unhandled server response status code: %d. Server error code: %d\n", a4, a3);
    }
    v9 = 4294960584;
  }
LABEL_25:
  if (a5)
  {
    v11 = SFAppleIDErrorUserInfoRetryDelaySecondsKey;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a5));
    v12 = v10;
    a5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  }
  -[SDAppleIDServerTask _callResponseHandlerWithInfo:errorInfo:error:](self, "_callResponseHandlerWithInfo:errorInfo:error:", 0, a5, v9);

}

- (void)_invalidate
{
  unint64_t type;
  const __CFString *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _invalidate]", 60, "### Object invalidated\n");
    }
  }
  else
  {
    if (dword_1007B1DE8 <= 30
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
    {
      type = self->_type;
      if (type > 3)
        v4 = CFSTR("?");
      else
        v4 = *(&off_100717A48 + type);
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _invalidate]", 30, "Invalidate %@ server task\n", v4);
    }
    if (self->_activated)
      -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](self, "_callResponseHandlerWithInfo:error:", 0, 4294960573);
    self->_invalidated = 1;
  }
}

- (void)_handleTaskResponse:(id)a3 withData:(id)a4 error:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  SDAppleIDServerTask *v10;
  id v11;
  unint64_t v12;
  const __CFString *v13;
  id v14;
  SDAppleIDURLResponse *v15;
  SDAppleIDURLResponse *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t Int64;
  id v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  SDAppleIDServerTask *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  unint64_t v34;
  const __CFString *v35;
  int v36;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  int v43;
  const __CFString *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  unsigned int v49;
  _QWORD v50[4];
  _QWORD v51[4];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v49 = v5;
  if ((_DWORD)v5)
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      v34 = -[SDAppleIDServerTask type](self, "type");
      if (v34 > 3)
        v35 = CFSTR("?");
      else
        v35 = *(&off_100717A48 + v34);
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 90, "### %@ server task failed with error %#m\n", v35, v5);
    }
    v25 = 0;
    v16 = 0;
    v32 = 0;
    v23 = 0;
    v33 = 0;
    v48 = 0;
    goto LABEL_25;
  }
  if (!v8)
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 60, "### No response object\n");
    }
    goto LABEL_57;
  }
  if (dword_1007B1DE8 <= 30 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
  {
    v12 = -[SDAppleIDServerTask type](self, "type");
    if (v12 > 3)
      v13 = CFSTR("?");
    else
      v13 = *(&off_100717A48 + v12);
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 30, "Received %@ server task response with status %ld\n", v13, objc_msgSend(v8, "statusCode"));
    v10 = self;
  }
  if (!v11)
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 60, "### No data object\n");
    }
LABEL_57:
    v25 = 0;
    v16 = 0;
    v32 = 0;
    v23 = 0;
    v33 = 0;
    v48 = 0;
    v5 = 4294960534;
    v49 = -6762;
    goto LABEL_25;
  }
  v14 = v11;
  v48 = v8;
  v15 = -[SDAppleIDURLResponse initWithHTTPUTLResponse:data:]([SDAppleIDURLResponse alloc], "initWithHTTPUTLResponse:data:", v48, v14);
  v16 = v15;
  v46 = v11;
  v47 = v8;
  v45 = v14;
  if (v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDURLResponse responseInfo](v15, "responseInfo"));

    if (v17)
    {
      if (dword_1007B1DE8 <= 10
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 10)))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDURLResponse responseInfo](v16, "responseInfo"));
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 10, "Response info: %@\n", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDURLResponse responseInfo](v16, "responseInfo"));
      Int64 = CFDictionaryGetInt64(v19, CFSTR("responseCode"), 0);

      v21 = -[SDAppleIDURLResponse statusCode](v16, "statusCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDURLResponse responseInfo](v16, "responseInfo"));
      if (v21 != (id)200 || Int64)
      {
        TypeID = CFStringGetTypeID();
        TypedValue = CFDictionaryGetTypedValue(v22, CFSTR("responseMessage"), TypeID, 0);
        v39 = objc_claimAutoreleasedReturnValue(TypedValue);

        if (v39)
          v40 = (const __CFString *)v39;
        else
          v40 = &stru_10072FE60;
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDURLResponse responseInfo](v16, "responseInfo"));
        v42 = CFDictionaryGetInt64(v41, CFSTR("nextSuggestedAttemptDelay"), 0);

        if (dword_1007B1DE8 <= 90
          && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
        {
          LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 90, "### Response status code: %d, error %d (%@), suggested retry delay: %d\n", -[SDAppleIDURLResponse statusCode](v16, "statusCode"), Int64, v40, v42 / 1000);
        }
        v44 = v40;
        -[SDAppleIDServerTask _handleServerError:withStatusCode:nextSuggestedAttemptDelay:](v10, "_handleServerError:withStatusCode:nextSuggestedAttemptDelay:", Int64, -[SDAppleIDURLResponse statusCode](v16, "statusCode"), v42 / 1000);
        v23 = 0;
        v24 = 0;
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseServerResponse:error:](v10, "_parseServerResponse:error:", v22, &v49));

        Int64 = 0;
        if (v23)
        {
          v44 = 0;
        }
        else
        {
          v44 = 0;
          v43 = v49;
          if (!v49)
            v43 = 201217;
          v49 = v43;
        }
        v24 = 1;
      }
      goto LABEL_23;
    }
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _handleTaskResponse:withData:error:]", 60, "### No response JSON. Response status code %d, response %@\n", objc_msgSend(v48, "statusCode"), v48);
    }
    v23 = 0;
    v44 = 0;
    v36 = -6712;
  }
  else
  {
    v23 = 0;
    v44 = 0;
    v36 = -6762;
  }
  v49 = v36;
  v24 = 1;
  Int64 = -1;
LABEL_23:
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](AKURLBag, "sharedBag"));
  v50[0] = CFSTR("httpStatusCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v48, "statusCode")));
  v51[0] = v26;
  v50[1] = CFSTR("errorCode");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", Int64));
  v51[1] = v27;
  v50[2] = CFSTR("type");
  v28 = v10;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10->_type));
  v51[2] = v29;
  v50[3] = CFSTR("idmsEnv");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "IDMSEnvironment")));
  v51[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 4));
  SFMetricsLog(CFSTR("com.apple.sharing.AIAServerTaskResponse"), v31);

  if (!v24)
  {
    v11 = v46;
    v8 = v47;
    v33 = (__CFString *)v44;
    v32 = v45;
    goto LABEL_27;
  }
  v5 = v49;
  v11 = v46;
  v8 = v47;
  v10 = v28;
  v33 = (__CFString *)v44;
  v32 = v45;
LABEL_25:
  -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](v10, "_callResponseHandlerWithInfo:error:", v23, v5);
LABEL_27:

}

- (id)_parseCreateCertificateResponse:(id)a3 error:(int *)a4
{
  id v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CFTypeID v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t NSNumber;
  void *v18;
  void *v19;
  void *v20;
  _UNKNOWN **v21;
  void *v22;
  int v23;
  _QWORD v25[3];
  _QWORD v26[3];

  v5 = a3;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("altDsId"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (!v8)
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]", 90, "### No altDSID\n");
    }
    goto LABEL_32;
  }
  v9 = CFDictionaryGetTypeID();
  v10 = CFDictionaryGetTypedValue(v5, CFSTR("certificate"), v9, 0);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (!v11)
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]", 90, "### No certificate info\n");
    }
LABEL_32:
    v12 = 0;
    goto LABEL_33;
  }
  v12 = (void *)v11;
  v13 = CFStringGetTypeID();
  v14 = CFDictionaryGetTypedValue(v12, CFSTR("certificateToken"), v13, 0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (!v15)
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]", 90, "### No certificate token \n");
    }
LABEL_33:
    v16 = 0;
    v19 = 0;
    v20 = 0;
    v22 = 0;
    v23 = 201240;
    if (!a4)
      goto LABEL_19;
    goto LABEL_18;
  }
  v16 = (void *)v15;
  NSNumber = NSDictionaryGetNSNumber(v5, CFSTR("delay"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v19 = v18;
  if (v18)
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)objc_msgSend(v18, "integerValue") / 1000));
  else
    v20 = 0;
  if (dword_1007B1DE8 <= 30 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseCreateCertificateResponse:error:]", 30, "Received Create Certificate response: altDSID=%@, certToken=%@, suggestedDelay=%@\n", v8, v16, v20);
  if (!v20 || ((unint64_t)objc_msgSend(v20, "integerValue") & 0x8000000000000000) != 0)
  {
    v21 = &off_10074B7F0;
  }
  else
  {
    if ((uint64_t)objc_msgSend(v20, "integerValue") < 601)
      goto LABEL_17;
    v21 = &off_10074B808;
  }

  v20 = v21;
LABEL_17:
  v25[0] = CFSTR("AltDSID");
  v25[1] = CFSTR("CertificateToken");
  v26[0] = v8;
  v26[1] = v16;
  v25[2] = CFSTR("Delay");
  v26[2] = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v23 = 0;
  if (a4)
LABEL_18:
    *a4 = v23;
LABEL_19:

  return v22;
}

- (id)_parseFetchCertificateResponse:(id)a3 error:(int *)a4
{
  id v4;
  void *v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v8;
  CFTypeID v9;
  uint64_t v10;
  void *v11;
  CFTypeID v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CFTypeID v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double Double;
  void *v25;
  id v26;
  CFTypeID v27;
  uint64_t v28;
  CFTypeID v29;
  uint64_t v30;
  uint64_t NSNumber;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  CFTypeID v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v43;
  void *v44;
  void *v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (!v5)
  {
    v46 = 0;
    v18 = 0;
    v11 = 0;
    v17 = 0;
    v16 = 0;
    v43 = 0;
    v44 = 0;
    v33 = 0;
    v35 = 0;
    v40 = 0;
    v15 = 0;
    v41 = -6728;
    goto LABEL_80;
  }
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("altDsId"), TypeID, 0);
  v8 = objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("AltDSID"));
  }
  else if (dword_1007B1DE8 <= 60
         && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
  {
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 60, "### No altDSID\n");
  }
  v9 = CFDictionaryGetTypeID();
  v10 = CFDictionaryGetTypedValue(v4, CFSTR("certificate"), v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v46 = (void *)v8;
  if (!v11)
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 90, "### No certificate info\n");
    }
    v15 = 0;
    v43 = 0;
    v44 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    goto LABEL_64;
  }
  v12 = CFStringGetTypeID();
  v13 = CFDictionaryGetTypedValue(v11, CFSTR("certificateToken"), v12, 0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v44 = (void *)v14;
  if (v14)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("CertificateToken"));
  }
  else if (dword_1007B1DE8 <= 60
         && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
  {
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 60, "### No certificate token\n");
  }
  v19 = CFStringGetTypeID();
  v20 = CFDictionaryGetTypedValue(v11, CFSTR("status"), v19, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lowercaseString"));
  if ((objc_msgSend(v21, "isEqualToString:", CFSTR("issued")) & 1) != 0)
  {
    v22 = 1;
  }
  else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("pending")) & 1) != 0)
  {
    v22 = 2;
  }
  else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("failed")) & 1) != 0)
  {
    v22 = 3;
  }
  else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("revoked")) & 1) != 0)
  {
    v22 = 4;
  }
  else if (objc_msgSend(v21, "isEqualToString:", CFSTR("expired")))
  {
    v22 = 5;
  }
  else
  {
    v22 = 0;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v22));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("CertificateStatus"));

  Double = CFDictionaryGetDouble(v11, CFSTR("expiryDate"), 0);
  if (Double <= 0.0)
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 60, "### No certificate expiration date. Will set to 6 months from now.\n");
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", 15552000.0));
    v15 = 0;
LABEL_41:

    v18 = v26;
    if (v26)
      goto LABEL_34;
    goto LABEL_42;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", Double / 1000.0));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dateByAddingTimeInterval:", 155520000.0));

  if (objc_msgSend(v15, "compare:", v18) == (id)-1)
  {
    v26 = v15;
    v15 = v26;
    goto LABEL_41;
  }
  if (v18)
  {
LABEL_34:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("CertificateExpirationDate"));
    goto LABEL_46;
  }
LABEL_42:
  if (dword_1007B1DE8 <= 90 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 90, "### Failed to create expiration date\n");
LABEL_46:
  v27 = CFStringGetTypeID();
  v28 = CFDictionaryGetTypedValue(v11, CFSTR("certificate"), v27, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v28);
  if (v17)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("CertificatePEM"));
  }
  else if (dword_1007B1DE8 <= 90
         && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
  {
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 90, "### No certificate PEM\n");
  }
  v29 = CFStringGetTypeID();
  v30 = CFDictionaryGetTypedValue(v11, CFSTR("serialNumber"), v29, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (v16)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("CertificateSerialNumber"));
  }
  else if (dword_1007B1DE8 <= 90
         && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
  {
    LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 90, "### No certificate serial number\n");
  }
  if (v22 != 2)
  {
LABEL_64:
    v33 = 0;
    v35 = 0;
    goto LABEL_73;
  }
  NSNumber = NSDictionaryGetNSNumber(v4, CFSTR("delay"), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue(NSNumber);
  v33 = v32;
  if (!v32)
  {
    if (dword_1007B1DE8 <= 60
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 60, "### Certificate status is pending, but delay not provided.\n");
    }
    v35 = 0;
    goto LABEL_70;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)objc_msgSend(v32, "integerValue") / 1000));
  v35 = v34;
  if (!v34 || ((unint64_t)objc_msgSend(v34, "integerValue") & 0x8000000000000000) != 0)
  {
LABEL_70:
    v36 = &off_10074B7F0;
    goto LABEL_71;
  }
  if ((uint64_t)objc_msgSend(v35, "integerValue") >= 601)
  {
    v36 = &off_10074B808;
LABEL_71:

    v35 = v36;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("Delay"));
LABEL_73:
  v37 = CFStringGetTypeID();
  v38 = CFDictionaryGetTypedValue(v4, CFSTR("intermediateCaCertificate"), v37, 0);
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (v39)
  {
    v40 = (void *)v39;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("IntermediateCertificate"));
    v41 = 0;
  }
  else
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFetchCertificateResponse:error:]", 90, "### No intermediate certificate PEM\n", v43, v44);
    }
    v41 = 0;
    v40 = 0;
  }
LABEL_80:
  if (a4)
    *a4 = v41;

  return v5;
}

- (id)_parseFindPersonResponse:(id)a3 error:(int *)a4
{
  id v4;
  void *v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFTypeID v12;
  uint64_t v13;
  void *v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  CFTypeID v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  CFTypeID v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  int *v34;
  void *v35;

  v34 = a4;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v35 = v4;
  if (!v5)
  {
    v14 = 0;
    v17 = 0;
    v21 = 0;
    v27 = 0;
    v30 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_67;
  }
  TypeID = CFArrayGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v4, CFSTR("matches"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    v9 = v8;
    if (objc_msgSend(v8, "count"))
    {
      if (objc_msgSend(v9, "count") == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        if (v11)
        {
          v12 = CFStringGetTypeID();
          v13 = CFDictionaryGetTypedValue(v10, CFSTR("certCn"), v12, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (v14)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("AccountIdentifier"));
          }
          else if (dword_1007B1DE8 <= 60
                 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "Account identifier not in match info dictionary returned by server\n", v34, v4);
          }
          v15 = CFStringGetTypeID();
          v16 = CFDictionaryGetTypedValue(v10, CFSTR("altDsId"), v15, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v17)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("AltDSID"));
          }
          else if (dword_1007B1DE8 <= 60
                 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "AltDSID not in match info dictionary returned by server\n", v34);
          }
          v18 = CFStringGetTypeID();
          v19 = CFDictionaryGetTypedValue(v10, CFSTR("certStatus"), v18, 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (v20)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lowercaseString"));
            if ((objc_msgSend(v22, "isEqualToString:", CFSTR("issued")) & 1) != 0)
            {
              v23 = 1;
            }
            else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("pending")) & 1) != 0)
            {
              v23 = 2;
            }
            else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("failed")) & 1) != 0)
            {
              v23 = 3;
            }
            else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("revoked")) & 1) != 0)
            {
              v23 = 4;
            }
            else if (objc_msgSend(v22, "isEqualToString:", CFSTR("expired")))
            {
              v23 = 5;
            }
            else
            {
              v23 = 0;
            }

            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("CertificateStatus"));

          }
          else if (dword_1007B1DE8 <= 60
                 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "Certificate status not in match info dictionary returned by server\n", v34);
          }
          v25 = CFStringGetTypeID();
          v26 = CFDictionaryGetTypedValue(v10, CFSTR("matched"), v25, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
          if (v27)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("Matched"));
          }
          else if (dword_1007B1DE8 <= 60
                 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "Matched criterion not in match info dictionary returned by server\n", v34);
          }
          v28 = CFStringGetTypeID();
          v29 = CFDictionaryGetTypedValue(v10, CFSTR("value"), v28, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if (v30)
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("MatchedValue"));
          }
          else if (dword_1007B1DE8 <= 60
                 && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "Matched value not in match info dictionary returned by server\n", v34);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingTimeInterval:", 2592000.0, v34));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("ValidUntil"));

          if (dword_1007B1DE8 <= 60
            && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
          {
            LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "### No matches array\n");
          }
          v32 = 0;
          goto LABEL_53;
        }
        v14 = 0;
        v17 = 0;
        v21 = 0;
        v27 = 0;
        v30 = 0;
LABEL_67:
        v32 = -6728;
        goto LABEL_53;
      }
      if (dword_1007B1DE8 <= 60
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 60)))
      {
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 60, "### Matches array has more than 1 object\n", v34, v4);
      }
      v14 = 0;
      v17 = 0;
      v21 = 0;
      v27 = 0;
      v30 = 0;
      v10 = 0;
      v11 = 0;
      v32 = 201241;
    }
    else
    {
      v32 = 201223;
      if (dword_1007B1DE8 <= 90
        && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
      {
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 90, "### No matches found\n", v34, v4);
      }
      v14 = 0;
      v17 = 0;
      v21 = 0;
      v27 = 0;
      v30 = 0;
      v10 = 0;
      v11 = 0;
    }
  }
  else
  {
    if (dword_1007B1DE8 <= 90
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 90)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseFindPersonResponse:error:]", 90, "### No matches array\n", v34, v4);
    }
    v14 = 0;
    v17 = 0;
    v21 = 0;
    v27 = 0;
    v30 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v32 = 201240;
  }
LABEL_53:
  if (v34)
    *v34 = v32;

  return v11;
}

- (id)_parseGetMyInfoResponse:(id)a3 error:(int *)a4
{
  id v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  CFTypeID v9;
  uint64_t v10;
  double Double;
  uint64_t v12;
  CFTypeID v13;
  uint64_t v14;
  CFTypeID v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  CFTypeID v24;
  uint64_t v25;
  CFTypeID v26;
  uint64_t v27;
  double v28;
  CFTypeID v29;
  uint64_t v30;
  CFTypeID v31;
  uint64_t v32;
  CFTypeID v33;
  uint64_t v34;
  void *v35;
  CFTypeID v36;
  uint64_t v37;
  uint64_t NSNumber;
  uint64_t v39;
  double v40;
  double v42;
  void *v43;
  void *v44;
  _UNKNOWN **v45;
  id v46;
  void *v47;
  void *v48;
  int *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;

  v5 = a3;
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, CFSTR("certificate"), TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  if (v8)
  {
    v9 = CFStringGetTypeID();
    v10 = CFDictionaryGetTypedValue(v8, CFSTR("certificateToken"), v9, 0);
    v59 = objc_claimAutoreleasedReturnValue(v10);
    Double = CFDictionaryGetDouble(v8, CFSTR("expiryDate"), 0);
    v12 = 0;
    if (Double > 0.0)
      v12 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", Double / 1000.0));
    v13 = CFStringGetTypeID();
    v14 = CFDictionaryGetTypedValue(v8, CFSTR("serialNumber"), v13, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v15 = CFStringGetTypeID();
    v16 = CFDictionaryGetTypedValue(v8, CFSTR("status"), v15, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lowercaseString"));
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("issued")) & 1) != 0)
    {
      v19 = 1;
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("pending")) & 1) != 0)
    {
      v19 = 2;
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("failed")) & 1) != 0)
    {
      v19 = 3;
    }
    else if ((objc_msgSend(v18, "isEqualToString:", CFSTR("revoked")) & 1) != 0)
    {
      v19 = 4;
    }
    else
    {
      v20 = objc_msgSend(v18, "isEqualToString:", CFSTR("expired"));
      v19 = 5;
      if (!v20)
        v19 = 0;
    }
    v55 = v19;

    v57 = v17;
    if (dword_1007B1DE8 <= 30
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]", 30, "Received Get My Info Certificate Info: token=%@, expirationDate=%@, serial number=%@, status=%@\n", v59, v12, v60, v17);
    }
  }
  else
  {
    v12 = 0;
    v59 = 0;
    v60 = 0;
    v57 = 0;
    v55 = 0;
  }
  v21 = CFStringGetTypeID();
  v22 = CFDictionaryGetTypedValue(v5, CFSTR("altDsId"), v21, 0);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = CFStringGetTypeID();
  v25 = CFDictionaryGetTypedValue(v5, CFSTR("firstName"), v24, 0);
  v65 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v26 = CFStringGetTypeID();
  v27 = CFDictionaryGetTypedValue(v5, CFSTR("lastName"), v26, 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v28 = CFDictionaryGetDouble(v5, CFSTR("msUntilNextCheck"), 0);
  v29 = CFArrayGetTypeID();
  v30 = CFDictionaryGetTypedValue(v5, CFSTR("validatedEmails"), v29, 0);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v31 = CFArrayGetTypeID();
  v32 = CFDictionaryGetTypedValue(v5, CFSTR("validatedPhones"), v31, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v33 = CFStringGetTypeID();
  v34 = CFDictionaryGetTypedValue(v5, CFSTR("aidvr"), v33, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = CFStringGetTypeID();
  v37 = CFDictionaryGetTypedValue(v5, CFSTR("serverAidvrId"), v36, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v37);
  NSNumber = NSDictionaryGetNSNumber(v5, CFSTR("version"), 0);
  v39 = objc_claimAutoreleasedReturnValue(NSNumber);
  if (dword_1007B1DE8 <= 30)
  {
    if (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 30))
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]", 30, "Received Get My Info response: AltDSID=%@, Firstname=%{mask}, LastName=%{mask}, Emails=%~@, Phones=%~@, Validation Record: identifier=%@,version=%@, msUntilNextCheck=%d\n", v23, v65, v64, v63, v62, v61, v39, (int)v28);
    if (dword_1007B1DE8 <= 10
      && (dword_1007B1DE8 != -1 || _LogCategory_Initialize(&dword_1007B1DE8, 10)))
    {
      LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseGetMyInfoResponse:error:]", 10, "Validation Record Data (base64)=%@\n", v35);
    }
  }
  v56 = (void *)v23;
  v40 = v28 / 1000.0;
  if (v28 / 1000.0 > 7776000.0 || v40 == 0.0)
    v42 = 2592000.0;
  else
    v42 = v28 / 1000.0;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", v40));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "dateByAddingTimeInterval:", v42));
  if (v39)
    v45 = (_UNKNOWN **)v39;
  else
    v45 = &off_10074B820;
  if (v35)
    v46 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v35, 1);
  else
    v46 = 0;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v48 = v47;
  v58 = (void *)v12;
  if (!v47)
  {
    v53 = -6728;
    v52 = (void *)v59;
    if (!a4)
      goto LABEL_42;
    goto LABEL_41;
  }
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v12, CFSTR("CertificateExpirationDate"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v60, CFSTR("CertificateSerialNumber"));
  v49 = a4;
  v50 = v8;
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v55));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v51, CFSTR("CertificateStatus"));

  v8 = v50;
  a4 = v49;
  v52 = (void *)v59;
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v59, CFSTR("CertificateToken"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v65, CFSTR("FirstName"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v64, CFSTR("LastName"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v63, CFSTR("ValidatedEmails"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v62, CFSTR("ValidatedPhones"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v46, CFSTR("ValidationRecordData"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v61, CFSTR("ValidationRecordDataID"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v44, CFSTR("ValidationRecordNextCheckDate"));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v45, CFSTR("Version"));
  v53 = 0;
  if (a4)
LABEL_41:
    *a4 = v53;
LABEL_42:

  return v48;
}

- (id)_parseServerResponse:(id)a3 error:(int *)a4
{
  id v6;
  int64_t type;
  uint64_t v8;
  void *v9;
  int v11;

  v6 = a3;
  v11 = 0;
  type = self->_type;
  switch(type)
  {
    case 0:
      v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseCreateCertificateResponse:error:](self, "_parseCreateCertificateResponse:error:", v6, &v11));
      goto LABEL_9;
    case 1:
      v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseFetchCertificateResponse:error:](self, "_parseFetchCertificateResponse:error:", v6, &v11));
      goto LABEL_9;
    case 2:
      v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseGetMyInfoResponse:error:](self, "_parseGetMyInfoResponse:error:", v6, &v11));
      goto LABEL_9;
    case 3:
      v8 = objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask _parseFindPersonResponse:error:](self, "_parseFindPersonResponse:error:", v6, &v11));
LABEL_9:
      v9 = (void *)v8;
      if (a4)
        goto LABEL_10;
      goto LABEL_11;
    default:
      if (dword_1007B1DE8 > 90)
        goto LABEL_13;
      if (dword_1007B1DE8 != -1)
        goto LABEL_5;
      if (_LogCategory_Initialize(&dword_1007B1DE8, 90))
      {
        type = self->_type;
LABEL_5:
        LogPrintF(&dword_1007B1DE8, "-[SDAppleIDServerTask _parseServerResponse:error:]", 90, "### Unhandled type %d\n", type);
      }
LABEL_13:
      v9 = 0;
      v11 = -6756;
      if (a4)
LABEL_10:
        *a4 = v11;
LABEL_11:

      return v9;
  }
}

- (void)_sendRequest
{
  void *v3;
  OS_dispatch_queue *dispatchQueue;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAppleIDServerTask appleID](self, "appleID"));
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000FF258;
  v5[3] = &unk_100717A28;
  v5[4] = self;
  sub_100209224(v3, dispatchQueue, v5);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)gsToken
{
  return self->_gsToken;
}

- (void)setGsToken:(id)a3
{
  objc_storeStrong((id *)&self->_gsToken, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSDictionary)taskInfo
{
  return self->_taskInfo;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
  objc_storeStrong((id *)&self->_urlRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gsToken, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
