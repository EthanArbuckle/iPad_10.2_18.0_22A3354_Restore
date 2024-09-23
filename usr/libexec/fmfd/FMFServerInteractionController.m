@implementation FMFServerInteractionController

- (id)sessionConfiguration:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));

  v6 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v7, "setURLCache:", 0);
  objc_msgSend(v7, "setHTTPCookieStorage:", 0);
  objc_msgSend(v7, "setHTTPCookieAcceptPolicy:", 1);
  objc_msgSend(v7, "setURLCredentialStorage:", 0);
  objc_msgSend(v7, "setRequestCachePolicy:", 1);
  objc_msgSend(v7, "set_appleIDContext:", v6);
  if (v3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSystemInfo sharedInstance](FMFSystemInfo, "sharedInstance"));
    v9 = objc_msgSend(v8, "isFMFAppRemoved");

    if ((v9 & 1) == 0)
      objc_msgSend(v7, "set_sourceApplicationBundleIdentifier:", CFSTR("com.apple.findmy"));
  }

  return v7;
}

- (void)sendCommand:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  objc_super v9;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[FMFServerInteractionController preflightValidateCommand:](self, "preflightValidateCommand:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));

  if (v8)
  {
    v7[2](v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)FMFServerInteractionController;
    -[FMFServerInteractionController sendCommand:completionBlock:](&v9, "sendCommand:completionBlock:", v6, v7);
  }

}

- (void)processResponseForCommand:(id)a3 callback:(id)a4
{
  id v6;
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
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v8, "beginTransaction:", CFSTR("fmfCommandResponseTransactionIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  -[FMFServerInteractionController setLastSuccessfulResponseTimestamp:](self, "setLastSuccessfulResponseTimestamp:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  objc_msgSend(v10, "resetRefreshTimer");

  if (objc_msgSend(v6, "wasRedirected"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "redirectedHostname"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account"));
    objc_msgSend(v13, "setFmfAppHostName:", v11);

  }
  v14 = objc_autoreleasePoolPush();
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsonResponseDictionary"));
  objc_msgSend(v6, "processCommandResponse:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v16, "digestCommand:", v6);

  objc_autoreleasePoolPop(v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMFHeartbeatManager sharedInstance](FMFHeartbeatManager, "sharedInstance"));
  objc_msgSend(v17, "updateHeartbeat");

  if (objc_msgSend(v6, "wasSuccessful"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v18, "setAccountStateAuthorizedDueTo401");

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    objc_msgSend(v19, "exit5XXGracePeriod");

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v20, "setRetryAfterRenewCount:", 0);

  }
  v22.receiver = self;
  v22.super_class = (Class)FMFServerInteractionController;
  -[FMFServerInteractionController processResponseForCommand:callback:](&v22, "processResponseForCommand:callback:", v6, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v21, "endTransaction:", CFSTR("fmfCommandResponseTransactionIdentifier"));

}

- (void)preflightValidateCommand:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FMFServerInteractionController *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSURLSession *v12;
  NSURLSession *session;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned int v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;

  v4 = a3;
  v5 = objc_opt_class(FMFHideLocationCommand);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(FMFInitCommand), (objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    || (v7 = objc_opt_class(FMFRefreshCommand), (objc_opt_isKindOfClass(v4, v7) & 1) != 0))
  {
    v8 = self;
    v9 = 0;
  }
  else
  {
    v8 = self;
    v9 = 1;
  }
  v10 = objc_claimAutoreleasedReturnValue(-[FMFServerInteractionController sessionConfiguration:](v8, "sessionConfiguration:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerInteractionController queue](self, "queue"));
  v12 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v10, self, v11));
  session = self->_session;
  self->_session = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
  LOBYTE(v10) = objc_msgSend(v14, "hasFirstUnlocked");

  if ((v10 & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1010, 0));
    objc_msgSend(v4, "setError:", v26);

    v27 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100063BC8();
    goto LABEL_25;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));

  if (!v15)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1000, 0));
    objc_msgSend(v4, "setError:", v28);

    v29 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_1000639C8();
    goto LABEL_25;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "password"));

  v17 = objc_msgSend(v4, "isUserAction");
  v18 = v17;
  if (!v16)
  {
    v30 = sub_100011D0C();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100063A88();

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    objc_msgSend(v32, "updateAccountCredentials:", v18);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1001, 0));
    objc_msgSend(v4, "setError:", v33);

    v34 = sub_100011D0C();
    v25 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100063A28();
    goto LABEL_25;
  }
  if ((v17 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[FMFAccountManager sharedInstance](FMFAccountManager, "sharedInstance"));
    v20 = objc_msgSend(v19, "isAccountAuthorized");

    if ((v20 & 1) == 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1003, 0));
      objc_msgSend(v4, "setError:", v35);

      v36 = sub_100011D0C();
      v25 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100063B68();
      goto LABEL_25;
    }
  }
  if ((objc_msgSend(v4, "isUserAction") & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
    v22 = objc_msgSend(v21, "isIn5XXGracePeriod");

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", FMFErrorDomain, 1006, 0));
      objc_msgSend(v4, "setError:", v23);

      v24 = sub_100011D0C();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100063B08();
LABEL_25:

    }
  }

}

- (void)setLastSuccessfulResponseTimestamp:(double)a3
{
  self->_lastSuccessfulResponseTimestamp = a3;
}

- (id)session
{
  NSURLSession *session;
  void *v4;
  void *v5;
  NSURLSession *v6;
  NSURLSession *v7;
  id v8;
  NSObject *v9;
  NSURLSession *v10;
  int v12;
  NSURLSession *v13;

  session = self->_session;
  if (!session)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerInteractionController sessionConfiguration:](self, "sessionConfiguration:", 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFServerInteractionController queue](self, "queue"));
    v6 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v4, self, v5));
    v7 = self->_session;
    self->_session = v6;

    v8 = sub_100011D0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_session;
      v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Where is my session: %@", (uint8_t *)&v12, 0xCu);
    }

    session = self->_session;
  }
  return session;
}

- (double)lastSuccessfulResponseTimestamp
{
  return self->_lastSuccessfulResponseTimestamp;
}

- (void)dealloc
{
  NSURLSession *session;
  NSURLSession *v4;
  id v5;
  NSObject *v6;
  objc_super v7;
  uint8_t buf[4];
  FMFServerInteractionController *v9;

  session = self->_session;
  if (session)
  {
    -[NSURLSession invalidateAndCancel](session, "invalidateAndCancel");
    v4 = self->_session;
    self->_session = 0;

  }
  v5 = sub_100011D0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "FMFServerInteractionController dealloc: %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)FMFServerInteractionController;
  -[FMFServerInteractionController dealloc](&v7, "dealloc");
}

- (FMFServerInteractionController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMFServerInteractionController;
  return -[FMFServerInteractionController init](&v3, "init");
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSHTTPCookieStorage)cookieStorage
{
  return self->_cookieStorage;
}

- (void)setCookieStorage:(id)a3
{
  objc_storeStrong((id *)&self->_cookieStorage, a3);
}

- (OpaqueCFHTTPCookieStorage)cookieStorageRef
{
  return self->_cookieStorageRef;
}

- (void)setCookieStorageRef:(OpaqueCFHTTPCookieStorage *)a3
{
  self->_cookieStorageRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cookieStorage, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
