@implementation NSPCaptiveWiFiHandler

+ (id)sharedHandler
{
  if (qword_100112F58 != -1)
    dispatch_once(&qword_100112F58, &stru_1000F71A8);
  return (id)qword_100112F50;
}

- (BOOL)evaluate:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSPCaptiveWiFiHandler *v9;
  BOOL v10;
  id v11;
  id v12;
  void *v13;
  NSOperationQueue *v14;
  NSOperationQueue *operationQueue;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSURLSession *urlSession;
  id v21;
  id completionHandler;
  void *v23;
  void *v24;
  NSURLSession *v25;
  uint64_t v26;
  NSURLSessionDataTask *dataTask;
  _QWORD v29[5];
  id v30;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v9)
  {

    goto LABEL_5;
  }
  if (!v9->_isRunning)
  {
    v11 = v7;
    v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
    v14 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v14;

    v17 = NPGetInternalQueue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSOperationQueue setUnderlyingQueue:](v9->_operationQueue, "setUnderlyingQueue:", v18);

    v19 = objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", v13, 0, v9->_operationQueue));
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v19;

    -[NSURLSession setSessionDescription:](v9->_urlSession, "setSessionDescription:", CFSTR("PrivacyProxyCaptiveProbe"));
    v21 = objc_retainBlock(v12);

    completionHandler = v9->_completionHandler;
    v9->_completionHandler = v21;

    objc_storeStrong((id *)&v9->_interfaceName, a3);
    v9->_isRunning = 1;

    objc_initWeak(&location, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("http://netcts.cdn-apple.com")));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSMutableURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", v23, 4, 10.0));
    objc_msgSend(v24, "setBoundInterfaceIdentifier:", v9->_interfaceName);
    v25 = v9->_urlSession;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000AE5DC;
    v29[3] = &unk_1000F71D0;
    objc_copyWeak(&v30, &location);
    v29[4] = v9;
    v26 = objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:completionHandler:](v25, "dataTaskWithRequest:completionHandler:", v24, v29));
    dataTask = v9->_dataTask;
    v9->_dataTask = (NSURLSessionDataTask *)v26;

    -[NSURLSessionDataTask resume](v9->_dataTask, "resume");
    -[NSURLSession finishTasksAndInvalidate](v9->_urlSession, "finishTasksAndInvalidate");
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
LABEL_5:
    v10 = 1;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:
  objc_sync_exit(v9);

  return v10;
}

- (void)abort
{
  sub_1000AE4AC(self);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
