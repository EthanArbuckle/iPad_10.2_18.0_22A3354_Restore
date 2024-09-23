@implementation FMDRequest

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100227274((uint64_t)self, v4);

  -[FMDRequest deinitializeRequest](self, "deinitializeRequest");
  v5.receiver = self;
  v5.super_class = (Class)FMDRequest;
  -[FMDRequest dealloc](&v5, "dealloc");
}

- (void)deinitializeRequest
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  FMDRequest *v11;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = (id)objc_opt_class(self, v5);
    v10 = 2048;
    v11 = self;
    v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) deinitializing...", (uint8_t *)&v8, 0x16u);

  }
  -[FMDRequest setCompletionHandler:](self, "setCompletionHandler:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest retryHelper](self, "retryHelper"));
  objc_msgSend(v7, "deinitializeHelper");

  -[FMDRequest setRetryHelper:](self, "setRetryHelper:", 0);
}

- (FMDRequest)initWithAccount:(id)a3
{
  id v4;
  FMDRequest *v5;
  uint64_t v6;
  NSString *authId;
  uint64_t v8;
  NSString *authToken;
  uint64_t v10;
  NSString *apsEnv;
  uint64_t v12;
  NSUUID *requestId;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FMDRequest;
  v5 = -[FMDRequest init](&v15, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authId"));
    authId = v5->_authId;
    v5->_authId = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "authToken"));
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "apsEnvironment"));
    apsEnv = v5->_apsEnv;
    v5->_apsEnv = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    requestId = v5->_requestId;
    v5->_requestId = (NSUUID *)v12;

    -[FMDRequest setWillRetry:](v5, "setWillRetry:", 1);
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(self, a2), self);
}

- (NSURL)requestUrl
{
  return 0;
}

- (NSString)urlTemplateType
{
  return (NSString *)&stru_1002CD590;
}

- (NSMutableDictionary)requestBody
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t (**v6)(void);
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t (**v14)(void);
  uint64_t v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest decorator](self, "decorator"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest decorator](self, "decorator"));
    v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serverContextGenerator"));
    v7 = v6[2]();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("serverContext"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest decorator](self, "decorator"));
    v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceContextGenerator"));
    v11 = v10[2]();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest decorator](self, "decorator"));
    v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deviceInfoGenerator"));
    v15 = v14[2]();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    objc_msgSend(v3, "fm_safelyMapKey:toObject:", CFSTR("deviceInfo"), v16);
  }
  return (NSMutableDictionary *)v3;
}

- (BOOL)showAuthFailedMessage
{
  return 1;
}

- (unint64_t)type
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
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authId](self, "authId"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authId](self, "authId"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v5, CFSTR("X-Apple-PrsId"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest apsEnv](self, "apsEnv"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest apsEnv](self, "apsEnv"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("X-Apple-PushEnv"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMDProtectedContextManager sharedManager](FMDProtectedContextManager, "sharedManager"));
  v19 = 0;
  v20 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextForKey:contextUUID:error:", CFSTR("serverContextHeaderContext"), &v20, &v19));
  v10 = v20;
  v11 = v19;

  if (v11)
  {
    v12 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100227318((uint64_t)v11, v13);

  }
  -[NSMutableDictionary fm_safelyMapKey:toObject:](v3, "fm_safelyMapKey:toObject:", CFSTR("X-Apple-Ctx"), v9);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("6.0"), CFSTR("X-Apple-Find-API-Ver"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServerConfig sharedInstance](FMDServerConfig, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userAgent"));

  if (v15)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("User-Agent"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("application/json"), CFSTR("Content-Type"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authHeaderValue](self, "authHeaderValue"));
  if (v16)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("Authorization"));
  if (+[FMDPreferencesMgr userTestApplication](FMDPreferencesMgr, "userTestApplication"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("true"), CFSTR("X-Apple-Test-Application"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", CFSTR("1.0"), CFSTR("X-Apple-Realm-Support"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[FMDPreferencesMgr httpRequestHeaders](FMDPreferencesMgr, "httpRequestHeaders"));
  if (v17)
    -[NSMutableDictionary addEntriesFromDictionary:](v3, "addEntriesFromDictionary:", v17);

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
  if (-[FMDRequest completed](self, "completed"))
    return 0;
  else
    return !-[FMDRequest cancelled](self, "cancelled");
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
  int64_t *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  int64_t v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest httpResponseError](self, "httpResponseError"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest httpResponseError](self, "httpResponseError"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
    v6 = objc_msgSend(NSURLErrorDomain, "isEqualToString:", v5);

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest httpResponseError](self, "httpResponseError"));
      v8 = objc_msgSend(v7, "code");

      if ((unint64_t)v8 + 1019 >= 0x13)
        v9 = &qword_100253760;
      else
        v9 = off_1002C2438[(_QWORD)v8 + 1019];
      return *v9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest httpResponseError](self, "httpResponseError"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    v12 = objc_msgSend(NSPOSIXErrorDomain, "isEqualToString:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest httpResponseError](self, "httpResponseError"));
      v14 = objc_msgSend(v13, "code");

      if (v14 == (id)22)
      {
        v9 = &qword_100253770;
        return *v9;
      }
    }
  }
  v15 = -[FMDRequest httpResponseStatus](self, "httpResponseStatus");
  if (v15 == 401)
  {
    v9 = &qword_100253768;
  }
  else if (v15 == 330)
  {
    v9 = &qword_100253780;
  }
  else
  {
    v9 = &qword_100253760;
    if (-[FMDRequest httpResponseStatus](self, "httpResponseStatus") >= 200
      && -[FMDRequest httpResponseStatus](self, "httpResponseStatus") <= 299)
    {
      v9 = &qword_100253750;
    }
  }
  return *v9;
}

- (NSString)authHeaderValue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authId](self, "authId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequest authToken](self, "authToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v3, v4));

  v6 = sub_1000031B8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_10022738C((uint64_t)v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  v9 = v8;
  if (v8 && objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedString"));
    if (v10)
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Basic %@"), v10));
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return (NSString *)v11;
}

- (NSUUID)requestId
{
  return self->_requestId;
}

- (NSData)requestBodyData
{
  return self->_requestBodyData;
}

- (NSString)authId
{
  return self->_authId;
}

- (NSString)authToken
{
  return self->_authToken;
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

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
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

- (NSURL)fileLocation
{
  return self->_fileLocation;
}

- (void)setFileLocation:(id)a3
{
  objc_storeStrong((id *)&self->_fileLocation, a3);
}

- (FMDRequestDecorator)decorator
{
  return self->_decorator;
}

- (void)setDecorator:(id)a3
{
  objc_storeStrong((id *)&self->_decorator, a3);
}

- (FMDRequestRetryHelper)retryHelper
{
  return self->_retryHelper;
}

- (void)setRetryHelper:(id)a3
{
  objc_storeStrong((id *)&self->_retryHelper, a3);
}

- (id)willSendHandler
{
  return self->_willSendHandler;
}

- (void)setWillSendHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDictionary)alertFromServerResponse
{
  return self->_alertFromServerResponse;
}

- (void)setAlertFromServerResponse:(id)a3
{
  objc_storeStrong((id *)&self->_alertFromServerResponse, a3);
}

- (NSString)apsEnv
{
  return self->_apsEnv;
}

- (void)setApsEnv:(id)a3
{
  objc_storeStrong((id *)&self->_apsEnv, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsEnv, 0);
  objc_storeStrong((id *)&self->_alertFromServerResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_willSendHandler, 0);
  objc_storeStrong((id *)&self->_retryHelper, 0);
  objc_storeStrong((id *)&self->_decorator, 0);
  objc_storeStrong((id *)&self->_fileLocation, 0);
  objc_storeStrong((id *)&self->_httpResponseError, 0);
  objc_storeStrong((id *)&self->_httpResponseBody, 0);
  objc_storeStrong((id *)&self->_httpResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authId, 0);
  objc_storeStrong((id *)&self->_requestBodyData, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
