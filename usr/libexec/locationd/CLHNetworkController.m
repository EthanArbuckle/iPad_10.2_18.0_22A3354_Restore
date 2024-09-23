@implementation CLHNetworkController

- (CLHNetworkController)initWithQueue:(id)a3
{
  CLHNetworkController *v4;
  CLHNetworkController *v5;
  NSOperationQueue *v6;
  NSDateFormatter *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLHNetworkController;
  v4 = -[CLHNetworkController init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5->_operationQueue = v6;
    -[NSOperationQueue setUnderlyingQueue:](v6, "setUnderlyingQueue:", a3);
    -[NSOperationQueue setName:](v5->_operationQueue, "setName:", CFSTR("CLHNetworkControllerQueue"));
    v5->_session = 0;
    v5->_activeTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5->_dateFormatter = v7;
    -[NSDateFormatter setDateFormat:](v7, "setDateFormat:", CFSTR("EEE',' dd MMM yyyy HH':'mm':'ss zzz"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHNetworkController;
  -[CLHNetworkController dealloc](&v3, "dealloc");
}

- (void)submitRequest:(id)a3
{
  NSObject *v5;
  unsigned int v6;
  NSURLSession *session;
  NSURLSession *v8;
  NSURLSession *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSURLSessionDataTask *v12;
  NSObject *v13;
  NSURLSession *v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  NSURLSessionDataTask *v22;

  dispatch_assert_queue_V2(-[NSOperationQueue underlyingQueue](self->_operationQueue, "underlyingQueue"));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v5 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSMutableArray count](self->_activeTasks, "count");
    v15 = 68289539;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = a3;
    v21 = 1026;
    LODWORD(v22) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network NetworkController received request\", \"request\":%{private, location:escape_only}@, \"activeTasks\":%{public}d}", (uint8_t *)&v15, 0x22u);
  }
  session = self->_session;
  if (!session)
  {
    v8 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"), self, self->_operationQueue);
    self->_session = v8;
    v9 = v8;
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021ABD30);
    v10 = qword_1022A0208;
    v11 = os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG);
    session = self->_session;
    if (v11)
    {
      v15 = 68289282;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2114;
      v20 = session;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Created NSURLSession\", \"session\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      session = self->_session;
    }
  }
  v12 = -[NSURLSession dataTaskWithRequest:](session, "dataTaskWithRequest:", objc_msgSend(a3, "URLRequest"));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v13 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v14 = self->_session;
    v15 = 68289538;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2114;
    v20 = v14;
    v21 = 2114;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Created DataTask\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
  }
  -[NSMutableArray addObject:](self->_activeTasks, "addObject:", v12);
  -[NSURLSessionDataTask resume](v12, "resume");
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  NSObject *v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;

  dispatch_assert_queue_V2(-[NSOperationQueue underlyingQueue](self->_operationQueue, "underlyingQueue", a3, a4, a5, a6, a7));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v9 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289538;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2114;
    v14 = a3;
    v15 = 2114;
    v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task didSendBodyData\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x26u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  dispatch_assert_queue_V2(-[NSOperationQueue underlyingQueue](self->_operationQueue, "underlyingQueue"));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v9 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 68289794;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2114;
    v18 = a3;
    v19 = 2114;
    v20 = a4;
    v21 = 2114;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task did complete with error\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x30u);
  }
  if ((-[NSMutableArray containsObject:](self->_activeTasks, "containsObject:", a4) & 1) != 0)
  {
    -[NSMutableArray removeObject:](self->_activeTasks, "removeObject:", a4);
    if (!-[NSMutableArray count](self->_activeTasks, "count"))
    {
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021ABD30);
      v10 = qword_1022A0208;
      if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
      {
        v13 = 68289282;
        v14 = 0;
        v15 = 2082;
        v16 = "";
        v17 = 2114;
        v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Invalidating NSURLSession\", \"session\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
      }
      -[NSURLSession finishTasksAndInvalidate](self->_session, "finishTasksAndInvalidate");

      self->_session = 0;
    }
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021ABD30);
    v11 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_FAULT))
    {
      v13 = 68289538;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2114;
      v18 = a3;
      v19 = 2114;
      v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#network unknown task reported to didCompleteWithError:\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x26u);
      if (qword_1022A0200 != -1)
        dispatch_once(&qword_1022A0200, &stru_1021ABD30);
    }
    v12 = qword_1022A0208;
    if (os_signpost_enabled((os_log_t)qword_1022A0208))
    {
      v13 = 68289538;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      v17 = 2114;
      v18 = a3;
      v19 = 2114;
      v20 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#network unknown task reported to didCompleteWithError:", "{\"msg%{public}.0s\":\"#network unknown task reported to didCompleteWithError:\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x26u);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  NSObject *v11;
  NSDate *v12;
  NSDate *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  double v17;
  NSObject *v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v11 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
  {
    v19 = 68289538;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = a3;
    v25 = 2114;
    v26 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network task didReceiveResponse\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v19, 0x26u);
  }
  v12 = -[NSDateFormatter dateFromString:](self->_dateFormatter, "dateFromString:", objc_msgSend(objc_msgSend(a5, "allHeaderFields"), "objectForKey:", CFSTR("Date")));
  if (v12)
  {
    v13 = v12;
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021ABD30);
    v14 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEBUG))
    {
      v15 = objc_msgSend(a4, "taskIdentifier");
      v19 = 68289283;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      v23 = 2049;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"injecting data to CoreTime\", \"taskIdentifier\":%{private}lu}", (uint8_t *)&v19, 0x1Cu);
    }
    v16 = type metadata for ;
    -[NSDate timeIntervalSinceReferenceDate](v13, "timeIntervalSinceReferenceDate");
    TMSetSourceTime(v16, v17, 15.0);
  }
  else
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021ABD30);
    v18 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 68289026;
      v20 = 0;
      v21 = 2082;
      v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning NSHTTPURLResponse contains date in an obsolete format. Ignoring.\"}", (uint8_t *)&v19, 0x12u);
    }
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  dispatch_assert_queue_V2(-[NSOperationQueue underlyingQueue](self->_operationQueue, "underlyingQueue"));
  if (qword_1022A0200 != -1)
    dispatch_once(&qword_1022A0200, &stru_1021ABD30);
  v8 = qword_1022A0208;
  if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289794;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2114;
    v13 = a3;
    v14 = 2114;
    v15 = a4;
    v16 = 2114;
    v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task didReceiveData\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}", (uint8_t *)v9, 0x30u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  +[CLCertificatePinningHelper URLSession:didReceiveChallenge:completionHandler:](CLCertificatePinningHelper, "URLSession:didReceiveChallenge:completionHandler:", a3, a4, a5);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CLHEndpointSelector)endpointSelector
{
  return self->_endpointSelector;
}

- (void)setEndpointSelector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (CLHNetworkControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
