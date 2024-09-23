@implementation ACFHTTPMethodInvocation

+ (id)invocation
{
  return objc_alloc_init((Class)a1);
}

+ (id)invocationWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithMethod:url:timeout:delegate:invokeImmediately:", a3, a4, a6, a7, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodInvocation;
  -[ACFHTTPMethodInvocation dealloc](&v3, sel_dealloc);
}

- (ACFHTTPMethodInvocation)init
{
  ACFHTTPMethodInvocation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethodInvocation;
  v2 = -[ACFHTTPMethodInvocation init](&v4, sel_init);
  if (v2)
    v2->_internal = objc_alloc_init(ACFHTTPMethodInvocationInternal);
  return v2;
}

- (ACFHTTPMethodInvocation)initWithMethod:(id)a3 url:(id)a4 timeout:(double)a5 delegate:(id)a6 invokeImmediately:(BOOL)a7
{
  _BOOL4 v7;
  ACFHTTPMethodInvocation *v12;
  uint64_t v13;
  objc_super v15;

  v7 = a7;
  v15.receiver = self;
  v15.super_class = (Class)ACFHTTPMethodInvocation;
  v12 = -[ACFHTTPMethodInvocation init](&v15, sel_init);
  if (v12)
  {
    v12->_method = (ACFHTTPMethod *)a3;
    v12->_url = (NSURL *)a4;
    v12->_timeout = a5;
    v12->_delegate = a6;
    v12->_internal = objc_alloc_init(ACFHTTPMethodInvocationInternal);
    if (v7)
    {
      v13 = objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      -[ACFHTTPMethodInvocation scheduleInRunLoop:forMode:](v12, "scheduleInRunLoop:forMode:", v13, *MEMORY[0x24BDBCA90]);
      -[ACFHTTPMethodInvocation invoke](v12, "invoke");
    }
  }
  return v12;
}

- (void)invoke
{
  id v3;
  NSURL *v4;
  id v5;
  id v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[NSRecursiveLock lock](-[ACFHTTPMethodInvocationInternal invocationGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "invocationGuard"), "lock");
  if (!-[ACFHTTPMethodInvocationInternal connection](-[ACFHTTPMethodInvocation internal](self, "internal"), "connection"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD16B0]);
    v4 = -[ACFHTTPMethodInvocation url](self, "url");
    -[ACFHTTPMethodInvocation timeout](self, "timeout");
    v5 = (id)objc_msgSend(v3, "initWithURL:cachePolicy:timeoutInterval:", v4, 1);
    objc_msgSend(v5, "setHTTPMethod:", -[ACFHTTPMethod name](-[ACFHTTPMethodInvocation method](self, "method"), "name"));
    objc_msgSend(v5, "setAllHTTPHeaderFields:", -[ACFHTTPMethod headerFields](-[ACFHTTPMethodInvocation method](self, "method"), "headerFields"));
    objc_msgSend(v5, "setHTTPBody:", -[ACFHTTPMethod body](-[ACFHTTPMethodInvocation method](self, "method"), "body"));
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1810]), "initWithRequest:delegate:startImmediately:", v5, self, 0);
    if (v6)
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 157, 0, "Begins to load the data for the URL request %@", v5);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = -[ACFHTTPMethodInvocationInternal runLoops](-[ACFHTTPMethodInvocation internal](self, "internal"), "runLoops");
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v7);
            v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            v12 = -[NSMutableDictionary objectForKey:](-[ACFHTTPMethodInvocationInternal runLoops](-[ACFHTTPMethodInvocation internal](self, "internal"), "runLoops"), "objectForKey:", v11);
            if (v12)
              objc_msgSend(v6, "scheduleInRunLoop:forMode:", v12, v11);
          }
          v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
      -[ACFHTTPMethodInvocationInternal setConnection:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setConnection:", v6);
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"), 65540, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create NSURLConnection instance with request %@"), v5), CFSTR("NSDebugDescription")));
      if (v13)
        goto LABEL_20;
    }
  }
  -[ACFHTTPMethodInvocationInternal setIsFinished:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setIsFinished:", 0);
  -[ACFHTTPMethodInvocationInternal setReceivedDataAccumulator:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setReceivedDataAccumulator:", 0);
  -[ACFHTTPMethodInvocation setIsWaitingForResponse:](self, "setIsWaitingForResponse:", 1);
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation invoke]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 177, 0, "Method invocation is waiting for respone");
  -[NSURLConnection start](-[ACFHTTPMethodInvocationInternal connection](-[ACFHTTPMethodInvocation internal](self, "internal"), "connection"), "start");
  v13 = 0;
LABEL_20:
  -[NSRecursiveLock unlock](-[ACFHTTPMethodInvocationInternal invocationGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "invocationGuard"), "unlock");
  if (v13)
    -[ACFHTTPMethodInvocation connection:didFailWithError:](self, "connection:didFailWithError:", 0, v13);
}

- (void)cancel
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation cancel]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 196, 0, "Method invoсation canceled. It is not waiting for response now");
  -[ACFHTTPMethodInvocation setIsWaitingForResponse:](self, "setIsWaitingForResponse:", 0);
  -[NSRecursiveLock lock](-[ACFHTTPMethodInvocationInternal invocationGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "invocationGuard"), "lock");
  -[NSURLConnection cancel](-[ACFHTTPMethodInvocationInternal connection](-[ACFHTTPMethodInvocation internal](self, "internal"), "connection"), "cancel");
  -[ACFHTTPMethodInvocationInternal setReceivedDataAccumulator:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setReceivedDataAccumulator:", 0);
  -[NSRecursiveLock unlock](-[ACFHTTPMethodInvocationInternal invocationGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "invocationGuard"), "unlock");
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  -[NSRecursiveLock lock](-[ACFHTTPMethodInvocationInternal schedulingGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "schedulingGuard"), "lock");
  -[NSMutableDictionary setObject:forKey:](-[ACFHTTPMethodInvocationInternal runLoops](-[ACFHTTPMethodInvocation internal](self, "internal"), "runLoops"), "setObject:forKey:", a3, a4);
  -[NSURLConnection scheduleInRunLoop:forMode:](-[ACFHTTPMethodInvocationInternal connection](-[ACFHTTPMethodInvocation internal](self, "internal"), "connection"), "scheduleInRunLoop:forMode:", a3, a4);
  -[NSRecursiveLock unlock](-[ACFHTTPMethodInvocationInternal schedulingGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "schedulingGuard"), "unlock");
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
  -[NSRecursiveLock lock](-[ACFHTTPMethodInvocationInternal schedulingGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "schedulingGuard"), "lock");
  -[NSMutableDictionary removeObjectForKey:](-[ACFHTTPMethodInvocationInternal runLoops](-[ACFHTTPMethodInvocation internal](self, "internal"), "runLoops"), "removeObjectForKey:", a4);
  -[NSURLConnection unscheduleFromRunLoop:forMode:](-[ACFHTTPMethodInvocationInternal connection](-[ACFHTTPMethodInvocation internal](self, "internal"), "connection"), "unscheduleFromRunLoop:forMode:", a3, a4);
  -[NSRecursiveLock unlock](-[ACFHTTPMethodInvocationInternal schedulingGuard](-[ACFHTTPMethodInvocation internal](self, "internal"), "schedulingGuard"), "unlock");
}

- (ACFHTTPMethod)method
{
  return (ACFHTTPMethod *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isWaitingForResponse
{
  return self->_isWaitingForResponse;
}

- (void)setIsWaitingForResponse:(BOOL)a3
{
  self->_isWaitingForResponse = a3;
}

- (ACFHTTPMethodInvocationDelegate)delegate
{
  return (ACFHTTPMethodInvocationDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (ACFHTTPMethodInvocationInternal)internal
{
  return (ACFHTTPMethodInvocationInternal *)objc_getProperty(self, a2, 40, 1);
}

+ (id)invokeHTTPMethodSynchronously:(id)a3 withURL:(id)a4 timeout:(double)a5 result:(id *)a6
{
  const __CFString *v11;
  ACFHTTPMethodSynchronousInvocationHelper *v12;
  void *v13;
  void *v14;
  void *v15;
  CFTimeInterval v16;
  CFRunLoopRunResult v17;
  char v18;
  NSError *v19;
  void *v21;

  v21 = (void *)objc_opt_new();
  v11 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.ist.ds.appleconnect.HTTPMethodSynchronousInvocationRunLoopMode.%p"), pthread_self());
  v12 = objc_alloc_init(ACFHTTPMethodSynchronousInvocationHelper);
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMethod:url:timeout:delegate:invokeImmediately:", a3, a4, v12, 0, a5);
  if (!v13)
  {
    v19 = (NSError *)(id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"), 65540, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create ACFHTTPMethodInvocation instance.")), CFSTR("NSDebugDescription")));
    v13 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v13, "scheduleInRunLoop:forMode:", objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop"), v11);
  objc_msgSend(v13, "invoke");
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a5 + 3.0);
  while ((objc_msgSend((id)objc_msgSend(v13, "internal"), "isFinished") & 1) == 0)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v14, "timeIntervalSinceNow");
    v17 = CFRunLoopRunInMode(v11, v16, 1u);
    switch(v17)
    {
      case kCFRunLoopRunFinished:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 284, 0, "The running run loop was finished (the running run loop mode has no sources or timers to process).");
        break;
      case kCFRunLoopRunStopped:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 288, 0, "The running run loop was finished (CFRunLoopStop was called on the run loop).");
        break;
      case kCFRunLoopRunTimedOut:
        if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
          ACFLog(7, (uint64_t)"+[ACFHTTPMethodInvocation(ACFHTTPMethodSynchronousInvocation) invokeHTTPMethodSynchronously:withURL:timeout:result:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 292, 0, "The running run loop was finished (the specified time interval for running the run loop has passed).");
        break;
      default:
        v18 = 0;
        goto LABEL_18;
    }
    v18 = 1;
LABEL_18:
    objc_msgSend(v15, "drain");
    if ((v18 & 1) != 0)
      break;
  }
  objc_msgSend(v13, "unscheduleFromRunLoop:forMode:", objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop"), v11);
  v19 = -[ACFHTTPMethodSynchronousInvocationHelper error](v12, "error");
  if (a6)
    *a6 = -[ACFHTTPMethodSynchronousInvocationHelper result](v12, "result");
LABEL_22:
  objc_msgSend(v13, "setDelegate:", 0);

  objc_msgSend(v21, "drain");
  if (a6)
    *a6 = *a6;
  return v19;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didReceiveResponse:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 346, 0, "Connection did receive response: %@", a4);
  -[ACFHTTPMethodInvocationInternal setReceivedDataAccumulator:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setReceivedDataAccumulator:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(a4, "statusCode");
    if (v7 != 200)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = objc_msgSend(MEMORY[0x24BDD15B8], "localizedStringForStatusCode:", v7);
      -[ACFHTTPMethodInvocation connection:didFailWithError:](self, "connection:didFailWithError:", a3, objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"), 65540, objc_msgSend(v9, "dictionaryWithObject:forKey:", v10, *MEMORY[0x24BDD0FC8])));
    }
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didReceiveData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 368, 0, "Connection did receive data.");
  if (-[ACFHTTPMethodInvocationInternal receivedDataAccumulator](-[ACFHTTPMethodInvocation internal](self, "internal", a3), "receivedDataAccumulator"))
  {
    -[NSMutableData appendData:](-[ACFHTTPMethodInvocationInternal receivedDataAccumulator](-[ACFHTTPMethodInvocation internal](self, "internal"), "receivedDataAccumulator"), "appendData:", a4);
  }
  else
  {
    -[ACFHTTPMethodInvocationInternal setReceivedDataAccumulator:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setReceivedDataAccumulator:", objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a4));
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  ACFHTTPMethodInvocationDelegate *v4;

  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connectionDidFinishLoading:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 381, 0, "Connection did finish loading.");
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connectionDidFinishLoading:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 382, 0, "Connection did finish loading. Method invoсation is not waiting for response now");
  }
  -[ACFHTTPMethodInvocationInternal setIsFinished:](-[ACFHTTPMethodInvocation internal](self, "internal", a3), "setIsFinished:", 1);
  -[ACFHTTPMethodInvocation setIsWaitingForResponse:](self, "setIsWaitingForResponse:", 0);
  v4 = -[ACFHTTPMethodInvocation delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACFHTTPMethodInvocationDelegate httpMethodInvocation:didFinishWithResult:](v4, "httpMethodInvocation:didFinishWithResult:", self, -[ACFHTTPMethodInvocationInternal receivedDataAccumulator](-[ACFHTTPMethodInvocation internal](self, "internal"), "receivedDataAccumulator"));
  -[ACFHTTPMethodInvocationInternal setReceivedDataAccumulator:](-[ACFHTTPMethodInvocation internal](self, "internal"), "setReceivedDataAccumulator:", 0);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  void *v6;
  ACFHTTPMethodInvocationDelegate *v7;

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 396, 0, "Connection did fail. Method invoсation is not waiting for response now");
  -[ACFHTTPMethodInvocationInternal setIsFinished:](-[ACFHTTPMethodInvocation internal](self, "internal", a3), "setIsFinished:", 1);
  -[ACFHTTPMethodInvocation setIsWaitingForResponse:](self, "setIsWaitingForResponse:", 0);
  v6 = (void *)objc_msgSend(a4, "domain");
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD1128]) && objc_msgSend(a4, "code") == 22)
    a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"), 65539, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x24BDD1398], 0));
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACFHTTPMethodInvocation(NSURLConnectionDelegate) connection:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPMethodInvocation.m", 403, 0, "Connection did fail with error: %@", a4);
  v7 = -[ACFHTTPMethodInvocation delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ACFHTTPMethodInvocationDelegate httpMethodInvocation:didFailWithError:](v7, "httpMethodInvocation:didFailWithError:", self, a4);
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  return 0;
}

@end
