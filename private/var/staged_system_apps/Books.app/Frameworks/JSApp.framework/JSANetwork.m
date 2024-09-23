@implementation JSANetwork

+ (id)sharedInstance
{
  if (qword_B9F80 != -1)
    dispatch_once(&qword_B9F80, &stru_9E370);
  return (id)qword_B9F88;
}

+ (NSString)connectionTypeHeader
{
  return (NSString *)+[ICStoreURLRequest currentConnectionTypeHeader](ICStoreURLRequest, "currentConnectionTypeHeader");
}

- (BOOL)isReachable
{
  unsigned int v3;
  SCNetworkReachabilityFlags flags;

  v3 = -[JSANetwork isRunningOfflineCache](self, "isRunningOfflineCache");
  flags = 0;
  if (SCNetworkReachabilityGetFlags(-[JSANetwork reachabilityRef](self, "reachabilityRef"), &flags))
    v3 |= (flags & 2) >> 1;
  return v3;
}

- (BOOL)isRunningOfflineCache
{
  return +[JSAOfflineCache runFromCache](JSAOfflineCache, "runFromCache");
}

- (void)registerOnNetworkChange:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  __SCNetworkReachability *v8;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v10;

  v4 = a3;
  v5 = JSALog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v10.version) = 136446210;
    *(CFIndex *)((char *)&v10.version + 4) = (CFIndex)"-[JSANetwork registerOnNetworkChange:]";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSManagedValue managedValueWithValue:](JSManagedValue, "managedValueWithValue:", v4));
  -[JSANetwork setNetworkCallbackValue:](self, "setNetworkCallbackValue:", v7);

  if (-[JSANetwork reachabilityRef](self, "reachabilityRef"))
  {
    if (!-[JSANetwork hasReachabilityCallbackScheduled](self, "hasReachabilityCallbackScheduled"))
    {
      SCNetworkReachabilitySetCallback(-[JSANetwork reachabilityRef](self, "reachabilityRef", 0, self, 0, 0, 0), (SCNetworkReachabilityCallBack)sub_F0E4, &v10);
      v8 = -[JSANetwork reachabilityRef](self, "reachabilityRef");
      Current = CFRunLoopGetCurrent();
      -[JSANetwork setHasReachabilityCallbackScheduled:](self, "setHasReachabilityCallbackScheduled:", SCNetworkReachabilityScheduleWithRunLoop(v8, Current, kCFRunLoopDefaultMode) != 0);
    }
  }
}

- (void)unregisterOnNetworkChange
{
  __SCNetworkReachability *v3;
  __CFRunLoop *Current;

  -[JSANetwork setNetworkCallbackValue:](self, "setNetworkCallbackValue:", 0);
  if (-[JSANetwork reachabilityRef](self, "reachabilityRef"))
  {
    if (-[JSANetwork hasReachabilityCallbackScheduled](self, "hasReachabilityCallbackScheduled"))
    {
      v3 = -[JSANetwork reachabilityRef](self, "reachabilityRef");
      Current = CFRunLoopGetCurrent();
      -[JSANetwork setHasReachabilityCallbackScheduled:](self, "setHasReachabilityCallbackScheduled:", SCNetworkReachabilityUnscheduleFromRunLoop(v3, Current, kCFRunLoopDefaultMode) == 0);
    }
  }
}

- (__SCNetworkReachability)reachabilityRef
{
  __SCNetworkReachability *result;
  sockaddr address;

  result = self->_reachabilityRef;
  if (!result)
  {
    *(_QWORD *)&address.sa_data[6] = 0;
    *(_QWORD *)&address.sa_len = 528;
    result = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
    self->_reachabilityRef = result;
  }
  return result;
}

- (void)dealloc
{
  JSManagedValue *networkCallbackValue;
  __SCNetworkReachability *reachabilityRef;
  objc_super v5;

  -[JSANetwork unregisterOnNetworkChange](self, "unregisterOnNetworkChange");
  networkCallbackValue = self->_networkCallbackValue;
  self->_networkCallbackValue = 0;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v5.receiver = self;
  v5.super_class = (Class)JSANetwork;
  -[JSANetwork dealloc](&v5, "dealloc");
}

- (JSManagedValue)networkCallbackValue
{
  return self->_networkCallbackValue;
}

- (void)setNetworkCallbackValue:(id)a3
{
  objc_storeStrong((id *)&self->_networkCallbackValue, a3);
}

- (BOOL)hasReachabilityCallbackScheduled
{
  return self->_hasReachabilityCallbackScheduled;
}

- (void)setHasReachabilityCallbackScheduled:(BOOL)a3
{
  self->_hasReachabilityCallbackScheduled = a3;
}

- (void)setReachabilityRef:(__SCNetworkReachability *)a3
{
  self->_reachabilityRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCallbackValue, 0);
}

@end
