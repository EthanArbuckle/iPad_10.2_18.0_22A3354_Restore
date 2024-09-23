@implementation ACFHTTPTransport

- (void)dealloc
{
  objc_super v3;

  -[ACFHTTPTransport cancelAllInvocations](self, "cancelAllInvocations");
  -[ACFHTTPTransport setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[ACFHTTPTransport setRetryCheckBlock:](self, "setRetryCheckBlock:", 0);
  -[ACFHTTPTransport setRequestURLTemplate:](self, "setRequestURLTemplate:", 0);
  -[ACFHTTPTransport setHttpMethod:](self, "setHttpMethod:", 0);
  -[ACFHTTPTransport setHttpHeader:](self, "setHttpHeader:", 0);
  -[ACFHTTPTransport setHttpGETParameters:](self, "setHttpGETParameters:", 0);
  -[ACFHTTPTransport setHttpPOSTBody:](self, "setHttpPOSTBody:", 0);
  -[ACFHTTPTransport setServerHosts:](self, "setServerHosts:", 0);
  -[ACFHTTPTransport setServerAttemptsDelays:](self, "setServerAttemptsDelays:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPTransport;
  -[ACFHTTPTransport dealloc](&v3, sel_dealloc);
}

- (NSMutableArray)queuedServerInvocations
{
  NSMutableArray *result;

  result = self->_queuedServerInvocations;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->_queuedServerInvocations)
      self->_queuedServerInvocations = (NSMutableArray *)objc_opt_new();
    objc_sync_exit(self);
    return self->_queuedServerInvocations;
  }
  return result;
}

- (void)addToQueuedServerInvocations:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray addObject:](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "addObject:", a3);
  objc_sync_exit(self);
}

- (void)removeFromQueuedServerInvocations:(id)a3
{
  objc_sync_enter(self);
  -[NSMutableArray removeObject:](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "removeObject:", a3);
  objc_sync_exit(self);
}

- (NSMutableArray)inProgressServerInvocations
{
  NSMutableArray *result;

  result = self->_inProgressServerInvocations;
  if (!result)
  {
    objc_sync_enter(self);
    if (!self->_inProgressServerInvocations)
      self->_inProgressServerInvocations = (NSMutableArray *)objc_opt_new();
    objc_sync_exit(self);
    return self->_inProgressServerInvocations;
  }
  return result;
}

- (void)scheduleInvocation:(id)a3
{
  _QWORD v5[5];

  objc_sync_enter(self);
  if ((-[NSMutableArray containsObject:](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "containsObject:", a3) & 1) != 0)
  {
    objc_sync_exit(self);
  }
  else
  {
    -[NSMutableArray addObject:](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "addObject:", a3);
    objc_sync_exit(self);
    -[ACFHTTPTransport setTryCounter:](self, "setTryCounter:", -[ACFHTTPTransport tryCounter](self, "tryCounter") + 1);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __39__ACFHTTPTransport_scheduleInvocation___block_invoke;
    v5[3] = &unk_24FCE4FA8;
    v5[4] = a3;
    dispatch_async_on_main_thread((uint64_t)v5);
  }
}

uint64_t __39__ACFHTTPTransport_scheduleInvocation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  objc_msgSend(v2, "scheduleInRunLoop:forMode:", v3, *MEMORY[0x24BDBCA90]);
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (void)unscheduleInvocation:(id)a3
{
  uint64_t v5;

  objc_sync_enter(self);
  if (-[NSMutableArray containsObject:](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "containsObject:", a3))
  {
    -[NSMutableArray removeObject:](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "removeObject:", a3);
    objc_sync_exit(self);
    v5 = objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    objc_msgSend(a3, "unscheduleFromRunLoop:forMode:", v5, *MEMORY[0x24BDBCA90]);
    objc_msgSend(a3, "setDelegate:", 0);
  }
  else
  {
    objc_sync_exit(self);
  }
}

- (BOOL)hasFinishedServerInvocations
{
  return !-[NSMutableArray count](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "count")&& -[NSMutableArray count](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "count") == 0;
}

- (void)invocation:(id)a3 didFinishWithError:(id)a4 response:(id)a5
{
  uint64_t (**v9)(id, id, id);
  unsigned int (**v10)(id, id, id);

  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 165, 0, "Received response from url %@", objc_msgSend(a3, "url"));
  -[ACFHTTPTransport unscheduleInvocation:](self, "unscheduleInvocation:", a3);
  if (-[ACFHTTPTransport hasFinishedServerInvocations](self, "hasFinishedServerInvocations"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 201, 0, "Tried all servers. Return response or error");
LABEL_21:
    -[ACFHTTPTransport didEnd](self, "didEnd");
    v10 = -[ACFHTTPTransport completionBlock](self, "completionBlock");
    if (v10[2](v10, a5, a4))
      -[ACFHTTPTransport setCompletionBlock:](self, "setCompletionBlock:", 0);
    else
      -[ACFHTTPTransport performRequest](self, "performRequest");
    return;
  }
  v9 = -[ACFHTTPTransport retryCheckBlock](self, "retryCheckBlock");
  if ((v9[2](v9, a5, a4) & 1) == 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 176, 0, "Response is valid. Cancel requests to other servers");
    -[ACFHTTPTransport cancelAllInvocations](self, "cancelAllInvocations");
    goto LABEL_21;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 181, 0, "Connection error or bad server response. Wait for response from other servers");
  if (-[NSMutableArray count](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "count")|| !-[NSMutableArray count](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "count"))
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 195, 0, "Invocations already scheduled. Wait for response");
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
      ACFLog(6, (uint64_t)"-[ACFHTTPTransport invocation:didFinishWithError:response:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 189, 0, "No running invocations. Schedule the first one from invocation queue");
    -[ACFHTTPTransport scheduleNextQueuedRequest](self, "scheduleNextQueuedRequest");
  }
}

- (void)cancelAllInvocations
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  -[NSTimer invalidate](-[ACFHTTPTransport failoverTimer](self, "failoverTimer"), "invalidate");
  -[ACFHTTPTransport setFailoverTimer:](self, "setFailoverTimer:", 0);
  v3 = -[NSMutableArray firstObject](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "firstObject");
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v4, "cancel");
      -[ACFHTTPTransport unscheduleInvocation:](self, "unscheduleInvocation:", v4);
      v4 = (void *)-[NSMutableArray firstObject](-[ACFHTTPTransport inProgressServerInvocations](self, "inProgressServerInvocations"), "firstObject");
    }
    while (v4);
  }
  -[ACFHTTPTransport setInProgressServerInvocations:](self, "setInProgressServerInvocations:", 0);
  v5 = -[NSMutableArray firstObject](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "firstObject");
  if (v5)
  {
    v6 = v5;
    do
    {
      -[ACFHTTPTransport removeFromQueuedServerInvocations:](self, "removeFromQueuedServerInvocations:", v6);
      v6 = -[NSMutableArray firstObject](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "firstObject");
    }
    while (v6);
  }
  -[ACFHTTPTransport setQueuedServerInvocations:](self, "setQueuedServerInvocations:", 0);
}

- (id)requestString:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (2)
    {
      v10 = 0;
      v11 = -v7;
      v15 = v7 + v6;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (v11 != v10)
          objc_msgSend(v4, "appendString:", CFSTR("&"));
        v13 = objc_autorelease((id)CFURLCreateStringByAddingPercentEscapes(v9, (CFStringRef)objc_msgSend(a3, "valueForKey:", v12), 0, CFSTR(":/?!$&'()*+,;=#[] "),
                                     1u));
        if (!v13)
          return 0;
        objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@"), v12, v13);
        ++v10;
      }
      while (v6 != v10);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v7 = v15;
      if (v6)
        continue;
      break;
    }
  }
  return v4;
}

- (id)urlWithRequest:(id)a3 address:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;

  v6 = -[ACFHTTPTransport requestString:](self, "requestString:");
  v7 = objc_msgSend(v6, "length");
  v8 = a4;
  if (v7)
    v8 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@?%@"), a4, v6);
  v9 = (void *)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
  if (v9)
    v10 = 1;
  else
    v10 = ACFLog == 0;
  if (!v10 && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACFHTTPTransport urlWithRequest:address:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 285, 0, "Failed to create url with address: %@, parameters: %@", a4, a3);
  return v9;
}

- (void)performRequestWithCompletionBlock:(id)a3
{
  if (-[NSArray count](-[ACFHTTPTransport serverHosts](self, "serverHosts"), "count"))
  {
    -[ACFHTTPTransport setCompletionBlock:](self, "setCompletionBlock:", a3);
    -[ACFHTTPTransport performRequest](self, "performRequest");
  }
  else if (a3)
  {
    (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ist.ds.appleconnect.errordomain.HTTPMethodInvocation"), 65537, 0));
  }
}

- (void)performRequest
{
  double v3;
  double v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  float v12;
  float v13;
  ACFHTTPMethodInvocation *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ACFHTTPTransport timeout](self, "timeout");
  if (v3 >= 1.0)
    v4 = v3;
  else
    v4 = 60.0;
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 314, 0, "method = %@", -[ACFHTTPTransport httpMethod](self, "httpMethod"));
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 315, 0, "header = %@", -[ACFHTTPTransport httpHeader](self, "httpHeader"));
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 316, 0, "body = %@", -[ACFHTTPTransport httpPOSTBody](self, "httpPOSTBody"));
    }
  }
  -[ACFHTTPTransport setTryCounter:](self, "setTryCounter:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[ACFHTTPTransport serverHosts](self, "serverHosts");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_15:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v5);
      v11 = -[ACFHTTPTransport urlWithRequest:address:](self, "urlWithRequest:address:", -[ACFHTTPTransport httpGETParameters](self, "httpGETParameters"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", -[ACFHTTPTransport requestURLTemplate](self, "requestURLTemplate"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10)));
      objc_msgSend(-[NSArray objectAtIndex:](-[ACFHTTPTransport serverAttemptsDelays](self, "serverAttemptsDelays"), "objectAtIndex:", v8 + v10), "floatValue");
      v13 = v12;
      v4 = v4 - v12;
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
        ACFLog(7, (uint64_t)"-[ACFHTTPTransport performRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 332, 0, "Timeout attempt %d after %f", v8 + v10, v4);
      if (v4 <= 0.0)
        break;
      v14 = +[ACFHTTPMethodInvocation invocationWithMethod:url:timeout:delegate:invokeImmediately:](ACFHTTPMethodInvocation, "invocationWithMethod:url:timeout:delegate:invokeImmediately:", +[ACFHTTPMethod methodWithName:headerFields:body:](ACFHTTPMethod, "methodWithName:headerFields:body:", -[ACFHTTPTransport httpMethod](self, "httpMethod"), -[ACFHTTPTransport httpHeader](self, "httpHeader"), -[ACFHTTPTransport httpPOSTBody](self, "httpPOSTBody")), v11, self, 0, v4);
      if (v13 == 0.0)
        -[ACFHTTPTransport scheduleInvocation:](self, "scheduleInvocation:", v14);
      else
        -[ACFHTTPTransport addToQueuedServerInvocations:](self, "addToQueuedServerInvocations:", v14);
      if (v7 == ++v10)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 += v10;
        if (v7)
          goto LABEL_15;
        break;
      }
    }
  }
  -[ACFHTTPTransport scheduleTimerForNextAttempt](self, "scheduleTimerForNextAttempt");
  -[ACFHTTPTransport didStart](self, "didStart");
}

- (void)scheduleTimerForNextAttempt
{
  float v3;
  float v4;
  double v5;
  uint64_t v6;

  -[NSTimer invalidate](-[ACFHTTPTransport failoverTimer](self, "failoverTimer"), "invalidate");
  if (!-[NSMutableArray count](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "count"))
  {
    v6 = 0;
    goto LABEL_8;
  }
  objc_msgSend(-[NSArray objectAtIndex:](-[ACFHTTPTransport serverAttemptsDelays](self, "serverAttemptsDelays"), "objectAtIndex:", -[ACFHTTPTransport tryCounter](self, "tryCounter")), "floatValue");
  v4 = v3;
  v5 = v3;
  if (ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x80) != 0)
      ACFLog(7, (uint64_t)"-[ACFHTTPTransport scheduleTimerForNextAttempt]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 369, 0, "Schedule next timer to fire after %f", v5);
  }
  if (v4 > 0.0)
  {
    v6 = objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_scheduleNextQueuedRequest, 0, 0, v5);
LABEL_8:
    -[ACFHTTPTransport setFailoverTimer:](self, "setFailoverTimer:", v6);
  }
}

- (void)scheduleNextQueuedRequest
{
  uint64_t v3;
  uint64_t v4;

  -[NSTimer invalidate](-[ACFHTTPTransport failoverTimer](self, "failoverTimer"), "invalidate");
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0)
    ACFLog(6, (uint64_t)"-[ACFHTTPTransport scheduleNextQueuedRequest]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 388, 0, "Schedule next invocation from queue");
  v3 = -[NSMutableArray firstObject](-[ACFHTTPTransport queuedServerInvocations](self, "queuedServerInvocations"), "firstObject");
  if (v3)
  {
    v4 = v3;
    -[ACFHTTPTransport scheduleInvocation:](self, "scheduleInvocation:", v3);
    -[ACFHTTPTransport removeFromQueuedServerInvocations:](self, "removeFromQueuedServerInvocations:", v4);
  }
  -[ACFHTTPTransport scheduleTimerForNextAttempt](self, "scheduleTimerForNextAttempt");
}

- (void)cancelRequest
{
  id v3;

  -[ACFHTTPTransport setIsCanceled:](self, "setIsCanceled:", 1);
  -[ACFHTTPTransport cancelAllInvocations](self, "cancelAllInvocations");
  -[ACFHTTPTransport didEnd](self, "didEnd");
  v3 = -[ACFHTTPTransport completionBlock](self, "completionBlock");
  -[ACFHTTPTransport setCompletionBlock:](self, "setCompletionBlock:", 0);
}

- (void)httpMethodInvocation:(id)a3 didFinishWithResult:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    ACFLog(7, (uint64_t)"-[ACFHTTPTransport httpMethodInvocation:didFinishWithResult:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 415, 0, "method invocation did finish with result = %@", a4);
  -[ACFHTTPTransport invocation:didFinishWithError:response:](self, "invocation:didFinishWithError:response:", a3, 0, a4);
}

- (void)httpMethodInvocation:(id)a3 didFailWithError:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    ACFLog(3, (uint64_t)"-[ACFHTTPTransport httpMethodInvocation:didFailWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFHTTPTransport.m", 422, 0, "HTTP transport did fail with error = %@", a4);
  -[ACFHTTPTransport invocation:didFinishWithError:response:](self, "invocation:didFinishWithError:response:", a3, a4, 0);
}

- (NSString)requestURLTemplate
{
  return self->_requestURLTemplate;
}

- (void)setRequestURLTemplate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (void)setHttpMethod:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSDictionary)httpHeader
{
  return self->_httpHeader;
}

- (void)setHttpHeader:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSDictionary)httpGETParameters
{
  return self->_httpGETParameters;
}

- (void)setHttpGETParameters:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)httpPOSTBody
{
  return self->_httpPOSTBody;
}

- (void)setHttpPOSTBody:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  self->_isCanceled = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setInProgressServerInvocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (void)setQueuedServerInvocations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (NSArray)serverHosts
{
  return self->_serverHosts;
}

- (void)setServerHosts:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)serverAttemptsDelays
{
  return self->_serverAttemptsDelays;
}

- (void)setServerAttemptsDelays:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (id)retryCheckBlock
{
  return self->_retryCheckBlock;
}

- (void)setRetryCheckBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSTimer)failoverTimer
{
  return self->_failoverTimer;
}

- (void)setFailoverTimer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (unint64_t)tryCounter
{
  return self->_tryCounter;
}

- (void)setTryCounter:(unint64_t)a3
{
  self->_tryCounter = a3;
}

@end
