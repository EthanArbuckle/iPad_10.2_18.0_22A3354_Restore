@implementation CAAPIHandler

- (CAAPIHandler)initWithURLString:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CAAPIHandler *v11;
  void *v12;
  CAAPIHandler *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CAAPIHandler;
  v11 = -[CAAPIHandler init](&v20, "init");
  if (!v11)
  {
LABEL_4:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v8));
  -[CAAPIHandler setApiURL:](v11, "setApiURL:", v12);

  v13 = (CAAPIHandler *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](v11, "apiURL"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](v11, "apiURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scheme"));
    v16 = objc_msgSend(v15, "compare:options:", CFSTR("https"), 1);

    if (!v16)
    {
      v17 = objc_alloc_init((Class)NSOperationQueue);
      -[CAAPIHandler setOpQueue:](v11, "setOpQueue:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler opQueue](v11, "opQueue"));
      objc_msgSend(v18, "setUnderlyingQueue:", v9);

      -[CAAPIHandler setResponseHandler:](v11, "setResponseHandler:", v10);
      v13 = v11;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v13;
}

- (void)cancel
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CAAPIHandler dataTask](self, "dataTask"));
  objc_msgSend(v2, "cancel");

}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler responseHandler](self, "responseHandler"));

  if (v6)
  {
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CAAPIHandler responseHandler](self, "responseHandler"));
    ((void (**)(_QWORD, uint64_t, id))v7)[2](v7, v4, v8);

  }
  -[CAAPIHandler cancel](self, "cancel");

}

- (void)fetchAPI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  id v17;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  objc_msgSend(v3, "setHTTPCookieStorage:", 0);
  objc_msgSend(v3, "setURLCache:", 0);
  objc_msgSend(v3, "setURLCredentialStorage:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler opQueue](self, "opQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v3, 0, v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](self, "apiURL"));
  if (-[CAAPIHandler timeoutSeconds](self, "timeoutSeconds"))
    v7 = (double)-[CAAPIHandler timeoutSeconds](self, "timeoutSeconds");
  else
    v7 = 60.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v6, 4, v7));

  objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("application/captive+json"), CFSTR("Accept"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler userAgent](self, "userAgent"));
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v9, CFSTR("User-Agent"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler interfaceName](self, "interfaceName"));
  objc_msgSend(v8, "setBoundInterfaceIdentifier:", v10);

  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10000B1B0;
  v16 = &unk_100010A40;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v8, &v13));
  -[CAAPIHandler setDataTask:](self, "setDataTask:", v11, v13, v14, v15, v16);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler dataTask](self, "dataTask"));
  objc_msgSend(v12, "resume");

  objc_msgSend(v5, "finishTasksAndInvalidate");
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (NSURL)apiURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApiURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOpQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDataTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setResponseHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_apiURL, 0);
}

@end
