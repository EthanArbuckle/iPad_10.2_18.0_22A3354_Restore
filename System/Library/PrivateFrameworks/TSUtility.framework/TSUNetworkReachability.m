@implementation TSUNetworkReachability

- (TSUNetworkReachability)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNetworkReachability init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 47, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSUNetworkReachability init]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (TSUNetworkReachability)initWithReachabilityRef:(__SCNetworkReachability *)a3
{
  TSUNetworkReachability *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUNetworkReachability;
  v4 = -[TSUNetworkReachability init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_reachabilityRef = a3;
  }
  return v4;
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)TSUNetworkReachability;
  -[TSUNetworkReachability dealloc](&v4, sel_dealloc);
}

+ (id)networkReachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v3;
  SCNetworkReachabilityRef v4;
  TSUNetworkReachability *v5;

  v3 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v3)
  {
    v4 = v3;
    v5 = -[TSUNetworkReachability initWithReachabilityRef:]([TSUNetworkReachability alloc], "initWithReachabilityRef:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)networkReachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v3;
  SCNetworkReachabilityRef v4;
  TSUNetworkReachability *v5;

  v3 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], (const sockaddr *)a3);
  if (v3)
  {
    v4 = v3;
    v5 = -[TSUNetworkReachability initWithReachabilityRef:]([TSUNetworkReachability alloc], "initWithReachabilityRef:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)networkReachabilityForDocumentResources
{
  return (id)objc_msgSend(a1, "networkReachabilityWithHostName:", CFSTR("configuration.apple.com"));
}

+ (id)networkReachabilityForInternetConnection
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[1] = 0;
  v3[0] = 528;
  objc_msgSend(a1, "networkReachabilityWithAddress:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)networkReachabilityForLocalWiFi
{
  _BYTE *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  objc_msgSend(a1, "networkReachabilityWithAddress:", v4);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v2[16] = 1;
  return v2;
}

+ (int64_t)networkReachabilityStatusForDocumentResources
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "networkReachabilityForDocumentResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
}

+ (int64_t)networkReachabilityStatusForInternetConnection
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "networkReachabilityForInternetConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
}

+ (int64_t)networkReachabilityStatusForLocalWiFi
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "networkReachabilityForLocalWiFi");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
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
  __SCNetworkReachability *reachabilityRef;
  void *v4;
  void *v5;
  void *v6;
  SCNetworkReachabilityFlags flags;

  reachabilityRef = self->_reachabilityRef;
  if (!reachabilityRef)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNetworkReachability connectionRequired]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 193, CFSTR("connectionRequired called with NULL _reachabilityRef"));

    reachabilityRef = self->_reachabilityRef;
  }
  flags = 0;
  return SCNetworkReachabilityGetFlags(reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)status
{
  __SCNetworkReachability *reachabilityRef;
  void *v4;
  void *v5;
  void *v6;
  SCNetworkReachabilityFlags flags;

  reachabilityRef = self->_reachabilityRef;
  if (!reachabilityRef)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUNetworkReachability status]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 205, CFSTR("currentNetworkStatus called with NULL _reachabilityRef"));

    reachabilityRef = self->_reachabilityRef;
  }
  flags = 0;
  if (!SCNetworkReachabilityGetFlags(reachabilityRef, &flags))
    return 0;
  if (self->_localWiFi)
    return -[TSUNetworkReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
  return -[TSUNetworkReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
}

@end
