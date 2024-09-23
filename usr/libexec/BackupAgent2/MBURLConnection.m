@implementation MBURLConnection

+ (id)sendSyncRequest:(id)a3 properties:(id)a4 connection:(id *)a5 response:(id *)a6 error:(id *)a7
{
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  uint64_t v38;

  v12 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3052000000;
  v36 = sub_10000647C;
  v37 = sub_10000648C;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3052000000;
  v30 = sub_10000647C;
  v31 = sub_10000648C;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = sub_10000647C;
  v25 = sub_10000648C;
  v26 = 0;
  v13 = objc_autoreleasePoolPush();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006498;
  v20[3] = &unk_1000D92A8;
  v20[6] = &v27;
  v20[7] = &v21;
  v20[4] = v12;
  v20[5] = &v33;
  v14 = +[MBURLConnection sendAsyncRequest:properties:block:](MBURLConnection, "sendAsyncRequest:properties:block:", a3, a4, v20);
  if (a5)
    *a5 = v14;
  MBSemaphoreWaitForever(v12);
  if (a5)
    *a5 = 0;
  objc_autoreleasePoolPop(v13);
  v15 = (id)v34[5];
  v16 = (id)v28[5];
  v17 = (id)v22[5];
  dispatch_release(v12);
  if (a6)
    *a6 = (id)v34[5];
  if (a7)
    *a7 = (id)v22[5];
  v18 = (void *)v28[5];
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  return v18;
}

+ (id)sendAsyncRequest:(id)a3 properties:(id)a4 block:(id)a5
{
  void *v6;
  _QWORD v8[7];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  MBURLConnection *v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = sub_10000647C;
  v19 = sub_10000648C;
  v20 = 0;
  v20 = +[MBURLConnection connectionWithRequest:properties:](MBURLConnection, "connectionWithRequest:properties:", a3, a4);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_10000647C;
  v14[4] = sub_10000648C;
  v14[5] = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = sub_10000647C;
  v12[4] = sub_10000648C;
  v13 = 0;
  v13 = objc_alloc_init((Class)NSMutableData);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006708;
  v11[3] = &unk_1000D92D0;
  v11[4] = v14;
  objc_msgSend((id)v16[5], "setResponseReceived:", v11);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006734;
  v10[3] = &unk_1000D92F8;
  v10[5] = v12;
  v10[6] = &v15;
  v10[4] = a5;
  objc_msgSend((id)v16[5], "setDataReceived:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006850;
  v9[3] = &unk_1000D9320;
  v9[5] = v14;
  v9[6] = v12;
  v9[4] = a5;
  objc_msgSend((id)v16[5], "setFailure:", v9);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000068BC;
  v8[3] = &unk_1000D9348;
  v8[4] = a5;
  v8[5] = v14;
  v8[6] = v12;
  objc_msgSend((id)v16[5], "setFinishedLoading:", v8);
  objc_msgSend((id)v16[5], "start");
  v6 = (void *)v16[5];
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

+ (id)connectionWithRequest:(id)a3 properties:(id)a4
{
  return -[MBURLConnection initWithRequest:properties:]([MBURLConnection alloc], "initWithRequest:properties:", a3, a4);
}

- (MBURLConnection)initWithRequest:(id)a3 properties:(id)a4
{
  MBURLConnection *v6;
  objc_class *v7;
  const char *Name;
  NSObject *v9;
  NSOperationQueue *v10;
  NSURLConnection *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MBURLConnection;
  v6 = -[MBURLConnection init](&v13, "init");
  if (v6)
  {
    v6->_request = (MBURLRequest *)a3;
    v7 = (objc_class *)objc_opt_class(v6);
    Name = class_getName(v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6->_queue = (OS_dispatch_queue *)dispatch_queue_create(Name, v9);
    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v10, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setUnderlyingQueue:](v10, "setUnderlyingQueue:", v6->_queue);
    v6->_operationQueue = v10;
    v11 = (NSURLConnection *)objc_msgSend(objc_alloc((Class)NSURLConnection), "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", objc_msgSend(a3, "NSURLRequest"), v6, 1, 0, 0, a4);
    v6->_connection = v11;
    -[NSURLConnection setDelegateQueue:](v11, "setDelegateQueue:", v10);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_queue);
  v3.receiver = self;
  v3.super_class = (Class)MBURLConnection;
  -[MBURLConnection dealloc](&v3, "dealloc");
}

- (void)start
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  NSUInteger v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  MBURLConnection *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  NSUInteger v21;

  v3 = -[NSURL path](-[MBURLRequest URL](self->_request, "URL"), "path");
  v4 = -[NSURL query](-[MBURLRequest URL](self->_request, "URL"), "query");
  if (v4)
  {
    v4 = -[NSString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR("?%@"), v4);
    v3 = v4;
  }
  v6 = MBGetDefaultLog(v4, v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((_DWORD)v7)
  {
    v9 = -[MBURLRequest method](self->_request, "method");
    v10 = -[NSData length](-[MBURLRequest data](self->_request, "data"), "length");
    *(_DWORD *)buf = 138413058;
    v15 = self;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v3;
    v20 = 2048;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: starting: %@ %@ (%lu)", buf, 0x2Au);
    v7 = _MBLog(CFSTR("INFO"), "%@: starting: %@ %@ (%lu)", self, -[MBURLRequest method](self->_request, "method"), v3, -[NSData length](-[MBURLRequest data](self->_request, "data"), "length"));
  }
  v11 = MBGetDefaultLog(v7, v8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = MBStringWithDictionary(-[MBURLRequest headers](self->_request, "headers"));
    *(_DWORD *)buf = 138412290;
    v15 = (MBURLConnection *)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    v13 = MBStringWithDictionary(-[MBURLRequest headers](self->_request, "headers"));
    _MBLog(CFSTR("DEBUG"), "%@", v13);
  }
  -[NSURLConnection start](self->_connection, "start");
}

- (void)cancel
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  MBURLConnection *v7;

  v3 = MBGetDefaultLog(self, a2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: canceling", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "%@: canceling", self);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006D80;
  block[3] = &unk_1000D9260;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  MBURLConnection *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  NSString *v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v6 = objc_opt_class(NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(a4, v6) & 1) != 0)
  {
    v7 = objc_msgSend(a4, "statusCode");
    v9 = MBGetDefaultLog(v7, v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if ((_DWORD)v10)
    {
      *(_DWORD *)buf = 138412802;
      v16 = self;
      v17 = 2048;
      v18 = v7;
      v19 = 2112;
      v20 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v7);
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: response received: %ld (%@)", buf, 0x20u);
      v10 = _MBLog(CFSTR("INFO"), "%@: response received: %ld (%@)", self, v7, +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v7));
    }
    v12 = MBGetDefaultLog(v10, v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = MBStringWithDictionary(objc_msgSend(a4, "allHeaderFields"));
      *(_DWORD *)buf = 138412290;
      v16 = (MBURLConnection *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      v14 = MBStringWithDictionary(objc_msgSend(a4, "allHeaderFields"));
      _MBLog(CFSTR("DEBUG"), "%@", v14);
    }
    (*((void (**)(void))self->_responseReceived + 2))();
  }
  else
  {
    (*((void (**)(id, _QWORD))self->_responseReceived + 2))(self->_responseReceived, 0);
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  MBURLConnection *v10;
  __int16 v11;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = MBGetDefaultLog(v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2048;
    v12 = objc_msgSend(a4, "length");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: data received (%lu bytes)", buf, 0x16u);
    _MBLog(CFSTR("INFO"), "%@: data received (%lu bytes)", self, objc_msgSend(a4, "length"));
  }
  (*((void (**)(void))self->_dataReceived + 2))();
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  MBURLConnection *v10;
  __int16 v11;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_done)
    sub_100087540();
  v8 = MBGetDefaultLog(v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    v11 = 2112;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: failure: %@", buf, 0x16u);
    _MBLog(CFSTR("ERROR"), "%@: failure: %@", self, a4);
  }
  self->_done = 1;
  (*((void (**)(void))self->_failure + 2))();
}

- (void)connectionDidFinishLoading:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  MBURLConnection *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_done)
    sub_100087568();
  v6 = MBGetDefaultLog(v4, v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: finished loading", buf, 0xCu);
    _MBLog(CFSTR("INFO"), "%@: finished loading", self);
  }
  self->_done = 1;
  (*((void (**)(void))self->_finishedLoading + 2))();
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const char *v8;

  v5 = objc_msgSend(objc_msgSend(a4, "protectionSpace", a3), "authenticationMethod");
  v6 = objc_msgSend(a4, "sender");
  if ((objc_opt_respondsToSelector(v6, "performDefaultHandlingForAuthenticationChallenge:") & 1) != 0)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("NSURLAuthenticationMethodXMobileMeAuthToken")))
    {
      if ((uint64_t)objc_msgSend(a4, "previousFailureCount") < 1)
      {
        objc_msgSend(v6, "useCredential:forAuthenticationChallenge:", objc_msgSend(a4, "proposedCredential"), a4);
        return;
      }
    }
    else if ((objc_msgSend(v5, "isEqualToString:", NSURLAuthenticationMethodServerTrust) & 1) != 0
           || objc_msgSend(v5, "isEqualToString:", NSURLAuthenticationMethodClientCertificate))
    {
      v7 = v6;
      v8 = "performDefaultHandlingForAuthenticationChallenge:";
LABEL_10:
      objc_msgSend(v7, "performSelector:withObject:", v8, a4);
      return;
    }
    v8 = "cancelAuthenticationChallenge:";
    v7 = v6;
    goto LABEL_10;
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(self), self);
}

- (id)responseReceived
{
  return self->_responseReceived;
}

- (void)setResponseReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)dataReceived
{
  return self->_dataReceived;
}

- (void)setDataReceived:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)failure
{
  return self->_failure;
}

- (void)setFailure:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)finishedLoading
{
  return self->_finishedLoading;
}

- (void)setFinishedLoading:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
