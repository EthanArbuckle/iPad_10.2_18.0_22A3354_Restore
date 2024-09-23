@implementation SWCDownloadTaskState

- (SWCDownloadTaskState)initWithDownloader:(id)a3 domain:(id)a4 downloadRoute:(unsigned __int8)a5
{
  id v8;
  id v9;
  SWCDownloadTaskState *v10;
  SWCDownloadTaskState *v11;
  NSString *v12;
  NSString *taskDescription;
  NSMutableArray *v14;
  NSMutableArray *completionHandlers;
  NSMutableData *v16;
  NSMutableData *buffer;
  objc_super v19;
  char v20[40];
  uuid_t out;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SWCDownloadTaskState;
  v10 = -[SWCDownloadTaskState init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_downloader, v8);
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    memset(v20, 0, 37);
    uuid_unparse(out, v20);
    v12 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("AASA-%s"), v20);
    taskDescription = v11->_taskDescription;
    v11->_taskDescription = v12;

    objc_storeStrong((id *)&v11->_domain, a4);
    v11->_downloadRoute = a5;
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v14;

    v16 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    buffer = v11->_buffer;
    v11->_buffer = v16;

  }
  return v11;
}

- (void)receiveSIGTERMSignal
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)resumeTask
{
  NSURLSessionDataTask **p_task;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *dateScheduled;
  id v15;
  void *v16;
  id v17;
  OS_os_transaction *v18;
  OS_os_transaction *transaction;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  SWCDownloadTaskState *v25;

  p_task = &self->_task;
  if (!self->_task)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState downloader](self, "downloader"));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_sessionForTaskState:", self));
      if (!v8)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCDownloader.mm"), 385, CFSTR("Failed to get/create URL session"));

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState domain](self, "domain"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_URLRequestWithDomain:downloadRoute:", v9, -[SWCDownloadTaskState downloadRoute](self, "downloadRoute")));

      if (!v10)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCDownloader.mm"), 387, CFSTR("Failed to create URL request"));

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataTaskWithRequest:", v10));
      if (!v11)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCDownloader.mm"), 389, CFSTR("Failed to get data task from URL session"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](self, "taskDescription"));
      objc_msgSend(v11, "setTaskDescription:", v12);

      objc_storeStrong((id *)p_task, v11);
      v13 = (NSDate *)objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)time(0));
      dateScheduled = self->_dateScheduled;
      self->_dateScheduled = v13;

      v15 = objc_alloc((Class)NSString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain redactedDescription](self->_domain, "redactedDescription"));
      v17 = objc_retainAutorelease(objc_msgSend(v15, "initWithFormat:", CFSTR("com.apple.swc.aasa.dl-%@"), v16));
      v18 = (OS_os_transaction *)os_transaction_create(objc_msgSend(v17, "UTF8String"));
      transaction = self->_transaction;
      self->_transaction = v18;

      if (qword_1000371B0 != -1)
        dispatch_once(&qword_1000371B0, &stru_100030918);
      v20 = qword_1000371A8;
      if (os_log_type_enabled((os_log_t)qword_1000371A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Beginning data task %@", buf, 0xCu);
      }
      objc_msgSend(v11, "resume");

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (void)cancelTaskWithError:(id)a3
{
  OS_os_transaction *transaction;
  id v6;

  objc_storeStrong((id *)&self->_cancellationError, a3);
  v6 = a3;
  transaction = self->_transaction;
  self->_transaction = 0;

  -[NSURLSessionDataTask cancel](self->_task, "cancel");
}

- (id)description
{
  id v3;
  void *v4;
  _SWCDomain *domain;
  NSUInteger v6;
  __CFString *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDataTask taskDescription](self->_task, "taskDescription"));
  domain = self->_domain;
  v6 = -[NSMutableData length](self->_buffer, "length");
  v7 = sub_1000027F4(self->_downloadRoute);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { domain: %@, bytes: %llu, route: %@ }"), v4, domain, v6, v8);

  return v9;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState description](self, "description"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  __CFString *v7;
  void *v8;
  id v9;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDataTask taskDescription](self->_task, "taskDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain redactedDescription](self->_domain, "redactedDescription"));
  v6 = -[NSMutableData length](self->_buffer, "length");
  v7 = sub_1000027F4(self->_downloadRoute);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ { domain: %@, bytes: %llu, route: %@ }"), v4, v5, v6, v8);

  return v9;
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_loadWeakRetained((id *)&self->_downloader);
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 32, 1);
}

- (NSError)cancellationError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCancellationError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)dateScheduled
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (unsigned)downloadRoute
{
  return self->_downloadRoute;
}

- (void)setDownloadRoute:(unsigned __int8)a3
{
  self->_downloadRoute = a3;
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dateScheduled, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_cancellationError, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_downloader);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
