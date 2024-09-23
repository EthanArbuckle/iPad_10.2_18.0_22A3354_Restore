@implementation TransparencyLogSession

- (TransparencyLogSession)initWithWorkloop:(id)a3 sessionDelegate:(id)a4
{
  id v6;
  id v7;
  TransparencyLogSession *v8;
  TransparencyLogSession *v9;
  dispatch_workloop_t v10;
  TransparencyAuthentication *v11;
  void *v12;
  TransparencyAuthentication *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TransparencyLogSession;
  v8 = -[TransparencyLogSession init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyLogSession setCallbackWorkloop:](v8, "setCallbackWorkloop:", v6);
    v10 = dispatch_workloop_create("com.apple.transparencyd.networking");
    -[TransparencyLogSession setNetworkingWorkloop:](v9, "setNetworkingWorkloop:", v10);

    -[TransparencyLogSession setDelegate:](v9, "setDelegate:", v7);
    v11 = [TransparencyAuthentication alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession networkingWorkloop](v9, "networkingWorkloop"));
    v13 = -[TransparencyAuthentication initWithWorkloop:](v11, "initWithWorkloop:", v12);
    -[TransparencyLogSession setAuth:](v9, "setAuth:", v13);

  }
  return v9;
}

+ (BOOL)enablePinning
{
  if (qword_1002A7BF0 != -1)
    dispatch_once(&qword_1002A7BF0, &stru_10024C9C8);
  return (byte_1002A7BE8 & 1) == 0;
}

- (id)createAuthenticatedBackgroundSession:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.transparencyd")));
  objc_msgSend(v8, "setDiscretionary:", 1);
  if (+[TransparencyLogSession enablePinning](TransparencyLogSession, "enablePinning"))
    objc_msgSend(v8, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleIDSService);
  v18 = off_1002A42B8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings deviceUserAgent](TransparencySettings, "deviceUserAgent"));
  v19 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
  v11 = objc_msgSend(v10, "mutableCopy");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, off_1002A42D8);

  v13 = objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, off_1002A42E0);

  objc_msgSend(v8, "setHTTPAdditionalHeaders:", v11);
  objc_msgSend(v8, "setTimeoutIntervalForResource:", (double)kTransparencyMaxmimumDownloadRecordLifetime);
  objc_msgSend(v8, "setHTTPCookieStorage:", 0);
  objc_msgSend(v8, "setURLCache:", 0);
  objc_msgSend(v8, "set_alternativeServicesStorage:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession auth](self, "auth"));
  LOBYTE(v13) = objc_msgSend(v14, "isSupported");

  if ((v13 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount createAuthkitSession](TransparencyAccount, "createAuthkitSession"));
    objc_msgSend(v8, "set_appleIDContext:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v8, v6, v7));

  return v16;
}

- (id)createAuthenticatedForegroundSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v3, "setDiscretionary:", 0);
  if (+[TransparencyLogSession enablePinning](TransparencyLogSession, "enablePinning"))
    objc_msgSend(v3, "set_tlsTrustPinningPolicyName:", kSecPolicyNameAppleIDSService);
  v17 = off_1002A42B8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings deviceUserAgent](TransparencySettings, "deviceUserAgent"));
  v18 = v4;
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  v6 = objc_msgSend((id)v5, "mutableCopy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings automatedDeviceGroup](TransparencySettings, "automatedDeviceGroup"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, off_1002A42D8);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencySettings transparencyVersionStr](TransparencySettings, "transparencyVersionStr"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, off_1002A42E0);

  objc_msgSend(v3, "setHTTPAdditionalHeaders:", v6);
  objc_msgSend(v3, "setHTTPCookieStorage:", 0);
  objc_msgSend(v3, "setURLCache:", 0);
  objc_msgSend(v3, "set_alternativeServicesStorage:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession auth](self, "auth"));
  LOBYTE(v5) = objc_msgSend(v9, "isSupported");

  if ((v5 & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount createAuthkitSession](TransparencyAccount, "createAuthkitSession"));
    objc_msgSend(v3, "set_appleIDContext:", v10);

  }
  v11 = objc_alloc_init((Class)NSOperationQueue);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession backgroundSession](self, "backgroundSession"));

  if (v12)
    v13 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSession networkingWorkloop](self, "networkingWorkloop"));
  else
    v13 = objc_claimAutoreleasedReturnValue(-[TransparencyLogSession callbackWorkloop](self, "callbackWorkloop"));
  v14 = (void *)v13;
  objc_msgSend(v11, "setUnderlyingQueue:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, 0, v11));
  return v15;
}

+ (id)createErrorFromURLResonse:(id)a3 data:(id)a4 allowEmptyData:(BOOL)a5 error:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint8_t buf[4];
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (objc_msgSend(v9, "requiresAuthorization"))
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorNetwork, -174, v11, CFSTR("HTTP request requires authorization code (401)")));
    if (qword_1002A7BF8 != -1)
      dispatch_once(&qword_1002A7BF8, &stru_10024C9E8);
    v13 = qword_1002A7C00;
    if (os_log_type_enabled((os_log_t)qword_1002A7C00, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "HTTP request requires authorization code (401)";
LABEL_6:
      v15 = v13;
      v16 = 2;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    }
  }
  else if ((objc_msgSend(v9, "successful") & 1) != 0)
  {
    if (v11)
    {
      v12 = v11;
    }
    else
    {
      if (a5 || v10 && objc_msgSend(v10, "length"))
      {
        v12 = 0;
        goto LABEL_17;
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorNetwork, -145, 0, CFSTR("HTTP response contains nil or empty data")));
      if (qword_1002A7BF8 != -1)
        dispatch_once(&qword_1002A7BF8, &stru_10024CA28);
      v13 = qword_1002A7C00;
      if (os_log_type_enabled((os_log_t)qword_1002A7C00, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v14 = "HTTP response contains nil or empty data";
        goto LABEL_6;
      }
    }
  }
  else
  {
    v12 = v11;
    if (!v12)
      v12 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorNetwork, objc_msgSend(v9, "responseCode"), CFSTR("Unsuccessful HTTP response code: %llu"), objc_msgSend(v9, "responseCode")));
    if (qword_1002A7BF8 != -1)
      dispatch_once(&qword_1002A7BF8, &stru_10024CA08);
    v17 = qword_1002A7C00;
    if (os_log_type_enabled((os_log_t)qword_1002A7C00, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      v14 = "Unsuccessful HTTP response: %@";
      v15 = v17;
      v16 = 12;
      goto LABEL_16;
    }
  }
LABEL_17:

  return v12;
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 useReversePush:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  TransparencyLogSession *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *, uint64_t);
  void *v26;
  TransparencyLogSession *v27;
  id v28;
  _QWORD *v29;
  BOOL v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession foregroundSession](v12, "foregroundSession"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession createAuthenticatedForegroundSession](v12, "createAuthenticatedForegroundSession"));
    -[TransparencyLogSession setForegroundSession:](v12, "setForegroundSession:", v14);

  }
  objc_sync_exit(v12);

  -[TransparencyLogSession setFetchCount:](v12, "setFetchCount:", (char *)-[TransparencyLogSession fetchCount](v12, "fetchCount") + 1);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_1001A2AE0;
  v31[4] = sub_1001A2AF0;
  v32 = 0;
  v32 = (id)os_transaction_create("com.apple.transparencyd.fetch");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogSession foregroundSession](v12, "foregroundSession"));
  v23 = _NSConcreteStackBlock;
  v24 = 3221225472;
  v25 = sub_1001A2AF8;
  v26 = &unk_10024CA78;
  v30 = a4;
  v27 = v12;
  v16 = v11;
  v28 = v16;
  v29 = v31;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataTaskWithRequest:completionHandler:", v10, &v23));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_requestId", v23, v24, v25, v26, v27));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
  objc_msgSend(v17, "setTaskDescription:", v19);

  if (v7)
    objc_msgSend(v17, "set_APSRelayTopic:", CFSTR("com.apple.private.alloy.kt.webtunnel"));
  objc_msgSend(v17, "resume");
  if (qword_1002A7BF8 != -1)
    dispatch_once(&qword_1002A7BF8, &stru_10024CA98);
  v20 = (id)qword_1002A7C00;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kt_requestId"));
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting fetch for fetchId %{public}@", buf, 0xCu);

  }
  _Block_object_dispose(v31, 8);

  return 1;
}

- (BOOL)fetch:(id)a3 allowEmptyData:(BOOL)a4 completionHandler:(id)a5
{
  return -[TransparencyLogSession fetch:allowEmptyData:useReversePush:completionHandler:](self, "fetch:allowEmptyData:useReversePush:completionHandler:", a3, a4, 0, a5);
}

+ (void)dispatchToQueue:(id)a3 block:(id)a4
{
  NSObject *v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1001A2AE0;
  v15 = sub_1001A2AF0;
  v16 = 0;
  v16 = (id)os_transaction_create("com.apple.transparencyd.networking");
  if (+[TransparencySettings getBool:](TransparencySettings, "getBool:", kTransparencyFlagSwitchAsyncToSync))
  {
    v6[2](v6);
    v7 = (void *)v12[5];
    v12[5] = 0;
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001A2E1C;
    v8[3] = &unk_10023F2D8;
    v9 = v6;
    v10 = &v11;
    dispatch_async(v5, v8);
    v7 = v9;
  }

  _Block_object_dispose(&v11, 8);
}

- (unint64_t)fetchCount
{
  return self->_fetchCount;
}

- (void)setFetchCount:(unint64_t)a3
{
  self->_fetchCount = a3;
}

- (TransparencyLogSessionDelegate)delegate
{
  return (TransparencyLogSessionDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyAuthentication)auth
{
  return (TransparencyAuthentication *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuth:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLSession)backgroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBackgroundSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSURLSession)foregroundSession
{
  return (NSURLSession *)objc_getProperty(self, a2, 40, 1);
}

- (void)setForegroundSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_workloop)callbackWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCallbackWorkloop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_workloop)networkingWorkloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkingWorkloop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkingWorkloop, 0);
  objc_storeStrong((id *)&self->_callbackWorkloop, 0);
  objc_storeStrong((id *)&self->_foregroundSession, 0);
  objc_storeStrong((id *)&self->_backgroundSession, 0);
  objc_storeStrong((id *)&self->_auth, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
