@implementation ICReachability

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;
  _QWORD *v6;

  v4 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((_BYTE *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;
  _QWORD *v6;

  v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const sockaddr *)a3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((_BYTE *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityForInternetConnection
{
  _QWORD v3[2];

  v3[1] = 0;
  v3[0] = 528;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v3));
}

+ (id)sharedReachabilityForInternetConnection
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1008528C8;
  if (!qword_1008528C8)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[ICReachability reachabilityForInternetConnection](ICReachability, "reachabilityForInternetConnection"));
    v4 = (void *)qword_1008528C8;
    qword_1008528C8 = v3;

    v2 = (void *)qword_1008528C8;
  }
  return v2;
}

+ (id)reachabilityForLocalWiFi
{
  _BYTE *v2;
  _QWORD v4[2];

  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v4));
  if (v2)
    v2[8] = 1;
  return v2;
}

- (BOOL)startNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)sub_100093A64, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  -[ICReachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)ICReachability;
  -[ICReachability dealloc](&v4, "dealloc");
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v4;

  if ((a3 & 2) == 0)
    return 0;
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    LODWORD(v4) = 0;
  if ((a3 & 4) != 0)
    v4 = v4;
  else
    v4 = 1;
  if ((a3 & 0x40000) != 0)
    return 2;
  else
    return v4;
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags))
    return 0;
  if (self->_alwaysReturnLocalWiFiStatus)
    return -[ICReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
  return -[ICReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
}

@end
