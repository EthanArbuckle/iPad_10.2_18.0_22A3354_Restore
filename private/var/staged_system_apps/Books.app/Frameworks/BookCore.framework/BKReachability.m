@implementation BKReachability

- (BOOL)startNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_131DF8, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;

  reachabilityRef = self->reachabilityRef;
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

  -[BKReachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)BKReachability;
  -[BKReachability dealloc](&v4, "dealloc");
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 2) = v5;
      *((_BYTE *)v4 + 8) = 0;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return v4;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const sockaddr *)a3);
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 2) = v5;
      *((_BYTE *)v4 + 8) = 0;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return v4;
}

+ (id)reachabilityForInternetConnection
{
  _QWORD v3[2];

  v3[1] = 0;
  v3[0] = 528;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v3));
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

- (int)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int)networkStatusForFlags:(unsigned int)a3
{
  int v3;

  v3 = ((a3 >> 2) & 1) == 0;
  if ((a3 & 0x10) == 0 && (a3 & 0x28) != 0)
    v3 = 1;
  if ((a3 & 0x40000) != 0)
    v3 = 2;
  if ((a3 & 2) != 0)
    return v3;
  else
    return 0;
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int)currentReachabilityStatus
{
  int result;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  result = SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags);
  if (result)
  {
    if (self->localWiFiRef)
      return -[BKReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
    else
      return -[BKReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
  }
  return result;
}

+ (void)_updateIsOffline
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
  byte_30A690 = objc_msgSend(v2, "currentReachabilityStatus") == 0;

}

+ (BOOL)isOffline
{
  return byte_30A690;
}

+ (id)sharedReachabilityForInternetConnection
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_132234;
  block[3] = &unk_28B8C8;
  block[4] = a1;
  if (qword_311360 != -1)
    dispatch_once(&qword_311360, block);
  return (id)qword_311358;
}

@end
