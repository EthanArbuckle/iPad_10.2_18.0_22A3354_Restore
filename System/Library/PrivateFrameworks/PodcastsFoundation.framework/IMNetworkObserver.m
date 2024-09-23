@implementation IMNetworkObserver

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__IMNetworkObserver_sharedInstance__block_invoke;
  block[3] = &unk_1E54D0FA0;
  block[4] = a1;
  if (sharedInstance_sOnce != -1)
    dispatch_once(&sharedInstance_sOnce, block);
  return (id)sharedInstance_sObserver;
}

- (NSString)connectionTypeHeader
{
  void *v3;
  int64_t v4;
  id v5;
  id v6;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = -[IMNetworkObserver networkType](self, "networkType");
  v5 = -[IMNetworkObserver stringForNetworkType:](self, "stringForNetworkType:", v4);
  if (v5)
  {
    objc_msgSend(v3, "appendString:", v5);
    if (-[IMNetworkObserver networkTypeIsCellularType:](self, "networkTypeIsCellularType:", v4))
    {
      v6 = -[IMNetworkObserver operatorName](self, "operatorName");
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v3, "appendFormat:", CFSTR("/%@"), v6);
    }
  }
  return (NSString *)v3;
}

- (id)stringForNetworkType:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 1:
      result = CFSTR("2G");
      break;
    case 2:
      result = CFSTR("3G");
      break;
    case 3:
      result = CFSTR("4G");
      break;
    case 4:
      result = CFSTR("5G");
      break;
    case 5:
      result = CFSTR("6G");
      break;
    case 6:
      result = CFSTR("7G");
      break;
    case 7:
      result = CFSTR("8G");
      break;
    case 8:
      result = CFSTR("9G");
      break;
    default:
      if (a3 == 1000)
        result = CFSTR("WiFi");
      else
        result = 0;
      break;
  }
  return result;
}

- (int64_t)networkType
{
  os_unfair_lock_s *p_lock;
  int64_t networkType;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  networkType = self->_networkType;
  os_unfair_lock_unlock(p_lock);
  return networkType;
}

- (BOOL)networkTypeIsCellularType:(int64_t)a3
{
  BOOL result;

  result = 0;
  if (a3 <= 1999)
  {
    if (!a3 || a3 == 1000)
      return result;
    return 1;
  }
  if (a3 != 2000 && a3 != 3000)
    return 1;
  return result;
}

void __56__IMNetworkObserver__applicationForegroundNotification___block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(a1 + 32), "_reloadDataStatusIndicator");
  objc_msgSend(*(id *)(a1 + 32), "_reloadNetworkType");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)_reloadDataStatusIndicator
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__IMNetworkObserver__reloadDataStatusIndicator__block_invoke;
  v2[3] = &unk_1E54D10A8;
  v2[4] = self;
  -[IMNetworkObserver _copyConnectionDataStatus:](self, "_copyConnectionDataStatus:", v2);
}

- (void)_copyConnectionDataStatus:(id)a3
{
  _CTServerConnectionCopyDataStatus();
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

void __47__IMNetworkObserver__reloadDataStatusIndicator__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  }
}

- (void)beginObserving
{
  os_unfair_lock_s *p_lock;
  __CTServerConnection *v4;
  __SCNetworkReachability *v5;
  uint64_t v6;
  BOOL v7;
  SCNetworkReachabilityContext context;
  uint64_t v9;
  IMNetworkObserver *v10;
  __int128 v11;
  uint64_t v12;
  sockaddr address;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_observing)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v9 = 0;
    v11 = 0u;
    v12 = 0;
    v10 = self;
    v4 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->_telephonyServer = v4;
    if (v4)
    {
      _CTServerConnectionSetTargetQueue();
      _CTServerConnectionRegisterForNotification();
      _CTServerConnectionRegisterForNotification();
    }
    address = (sockaddr)xmmword_1A9404010;
    v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    self->_reachability = v5;
    if (v5)
    {
      context.version = 0;
      context.info = self;
      context.retain = 0;
      context.release = 0;
      context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x1E0C98350];
      SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback, &context);
      SCNetworkReachabilitySetDispatchQueue(self->_reachability, (dispatch_queue_t)self->_dispatchQueue);
    }
    v6 = -[IMNetworkObserver _currentNetworkReachabilityFlags](self, "_currentNetworkReachabilityFlags");
    self->_networkReachabilityFlags = v6;
    self->_networkType = -[IMNetworkObserver _networkTypeForReachabilityFlags:](self, "_networkTypeForReachabilityFlags:", v6);
    if (self->_telephonyServer)
      v7 = 1;
    else
      v7 = self->_reachability != 0;
    self->_observing = v7;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_reloadNetworkType
{
  -[IMNetworkObserver _reloadNetworkTypeWithReachabilityFlags:](self, "_reloadNetworkTypeWithReachabilityFlags:", -[IMNetworkObserver _currentNetworkReachabilityFlags](self, "_currentNetworkReachabilityFlags"));
}

- (unsigned)_currentNetworkReachabilityFlags
{
  __SCNetworkReachability *reachability;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilityGetFlags(reachability, &flags);
    LODWORD(reachability) = flags;
  }
  return reachability;
}

- (void)_reloadNetworkTypeWithReachabilityFlags:(unsigned int)a3
{
  int64_t v5;
  int64_t v6;
  unsigned int networkReachabilityFlags;
  NSObject *notificationQueue;
  _QWORD block[7];
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  BOOL v14;

  v5 = -[IMNetworkObserver _networkTypeForReachabilityFlags:](self, "_networkTypeForReachabilityFlags:");
  v6 = -[IMNetworkObserver _setNetworkType:](self, "_setNetworkType:", v5);
  networkReachabilityFlags = self->_networkReachabilityFlags;
  self->_networkReachabilityFlags = a3;
  if (v6 != v5 || networkReachabilityFlags != a3)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__IMNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke;
    block[3] = &unk_1E54D10D0;
    v13 = v6 != v5;
    block[4] = self;
    block[5] = v6;
    block[6] = v5;
    v14 = networkReachabilityFlags != a3;
    v11 = networkReachabilityFlags;
    v12 = a3;
    dispatch_async(notificationQueue, block);
  }
}

- (int64_t)_networkTypeForReachabilityFlags:(unsigned int)a3
{
  if ((a3 & 2) == 0)
    return 0;
  if ((a3 & 0x40000) != 0)
    return -[IMNetworkObserver _networkTypeFromDataIndicator:](self, "_networkTypeFromDataIndicator:", -[IMNetworkObserver _dataStatusIndicator](self, "_dataStatusIndicator"));
  return 1000;
}

- (int64_t)_setNetworkType:(int64_t)a3
{
  int64_t networkType;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  networkType = self->_networkType;
  if (networkType != a3)
  {
    self->_networkType = a3;
    v5 = +[IMNetworkObserver _networkObserverLogConfig](IMNetworkObserver, "_networkObserverLogConfig");
    if (!v5)
      v5 = (id)objc_msgSend(MEMORY[0x1E0CFDAF0], "sharedConfig");
    v6 = objc_msgSend(v5, "OSLogObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      v8 = -[IMNetworkObserver stringForNetworkType:](self, "stringForNetworkType:", self->_networkType);
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_DEFAULT, "%@: Set network type \"%@\", (uint8_t *)&v10, 0x16u);
    }
  }
  return networkType;
}

id __35__IMNetworkObserver_sharedInstance__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sObserver = (uint64_t)result;
  return result;
}

- (IMNetworkObserver)init
{
  IMNetworkObserver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IMNetworkObserver;
  v2 = -[IMNetworkObserver init](&v4, sel_init);
  if (v2)
  {
    v2->_dispatchQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstore.IMNetworkObserver", 0);
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunesstore.IMNetworkObserver.notifications", 0);
    v2->_observing = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__applicationForegroundNotification_, CFSTR("MTApplicationWillEnterForegroundNotification"), 0);
  }
  return v2;
}

- (void)_applicationForegroundNotification:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__IMNetworkObserver__applicationForegroundNotification___block_invoke;
  block[3] = &unk_1E54D0FA0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)isObserving
{
  IMNetworkObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_observing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)endObserving
{
  os_unfair_lock_s *p_lock;
  __SCNetworkReachability *reachability;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetDispatchQueue(reachability, 0);
    CFRelease(self->_reachability);
    self->_reachability = 0;
  }
  if (self->_telephonyServer)
  {
    _CTServerConnectionUnregisterForNotification();
    _CTServerConnectionUnregisterForNotification();
    CFRelease(self->_telephonyServer);
    self->_telephonyServer = 0;
  }
  self->_observing = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *dispatchQueue;
  NSObject *notificationQueue;
  objc_super v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("MTApplicationWillEnterForegroundNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CA71B8], 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0CA71C0], 0);
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
    dispatch_release(notificationQueue);

  -[IMNetworkObserver endObserving](self, "endObserving");
  os_unfair_lock_unlock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)IMNetworkObserver;
  -[IMNetworkObserver dealloc](&v7, sel_dealloc);
}

- (unsigned)networkReachabilityFlags
{
  IMNetworkObserver *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_networkReachabilityFlags;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

+ (BOOL)isLikelyToReachRemoteServerWithReachabilityFlags:(unsigned int)a3
{
  return (a3 & 6) == 2;
}

- (id)dataStatusIndicator
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[IMNetworkObserver _dataStatusIndicator](self, "_dataStatusIndicator");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)operatorName
{
  os_unfair_lock_s *p_lock;
  NSString *operatorName;
  NSString **p_operatorName;
  NSString *v6;
  unint64_t v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_operatorName = &self->_operatorName;
  operatorName = self->_operatorName;
  if (!operatorName)
  {
    if (self->_telephonyServer)
    {
      v8 = _CTServerConnectionCopyOperatorName();
      operatorName = *p_operatorName;
      if (HIDWORD(v8) && operatorName)
      {

        operatorName = 0;
        *p_operatorName = 0;
      }
    }
    else
    {
      operatorName = 0;
    }
  }
  v6 = operatorName;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)reloadNetworkType
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[IMNetworkObserver _reloadNetworkType](self, "_reloadNetworkType");
  os_unfair_lock_unlock(p_lock);
}

- (void)setNetworkType:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  int64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[IMNetworkObserver _setNetworkType:](self, "_setNetworkType:", a3);
  os_unfair_lock_unlock(p_lock);
  if (v6 != a3)
    -[IMNetworkObserver _postTypeChangedNotificationFromValue:toValue:](self, "_postTypeChangedNotificationFromValue:toValue:", v6, a3);
}

- (void)_handleTelephonyNotificationWithName:(__CFString *)a3 userInfo:(__CFDictionary *)a4
{
  os_unfair_lock_s *p_lock;
  NSObject *notificationQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E0CA7688], 0))
  {
    if (CFStringCompare(a3, (CFStringRef)*MEMORY[0x1E0CA76A8], 0) == kCFCompareEqualTo)
    {

      self->_operatorName = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E0CA76A0]);
      notificationQueue = self->_notificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__IMNetworkObserver__handleTelephonyNotificationWithName_userInfo___block_invoke;
      block[3] = &unk_1E54D0FA0;
      block[4] = self;
      dispatch_async(notificationQueue, block);
    }
  }
  else
  {

    self->_dataStatusIndicator = (NSString *)(id)CFDictionaryGetValue(a4, (const void *)*MEMORY[0x1E0CA7620]);
    -[IMNetworkObserver _reloadNetworkType](self, "_reloadNetworkType");
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __67__IMNetworkObserver__handleTelephonyNotificationWithName_userInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("IMNetworkObserverOperatorNameChangedNotification"), *(_QWORD *)(a1 + 32));
}

- (id)_dataStatusIndicator
{
  id result;
  _QWORD v4[5];

  result = self->_dataStatusIndicator;
  if (!result)
  {
    if (self->_telephonyServer)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __41__IMNetworkObserver__dataStatusIndicator__block_invoke;
      v4[3] = &unk_1E54D10A8;
      v4[4] = self;
      -[IMNetworkObserver _copyConnectionDataStatus:](self, "_copyConnectionDataStatus:", v4);
      return self->_dataStatusIndicator;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __41__IMNetworkObserver__dataStatusIndicator__block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = a2;
  return result;
}

- (int64_t)_networkTypeFromDataIndicator:(id)a3
{
  uint64_t v4;
  _QWORD v6[25];

  v4 = 0;
  v6[24] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0CA7628];
  v6[1] = 1;
  v6[2] = *MEMORY[0x1E0CA7630];
  v6[3] = 1;
  v6[4] = *MEMORY[0x1E0CA7638];
  v6[5] = 2;
  v6[6] = *MEMORY[0x1E0CA7640];
  v6[7] = 2;
  v6[8] = *MEMORY[0x1E0CA7648];
  v6[9] = 2;
  v6[10] = *MEMORY[0x1E0CA7680];
  v6[11] = 3;
  v6[12] = *MEMORY[0x1E0CA7650];
  v6[13] = 3;
  v6[14] = *MEMORY[0x1E0CA7658];
  v6[15] = 4;
  v6[16] = *MEMORY[0x1E0CA7660];
  v6[17] = 5;
  v6[18] = *MEMORY[0x1E0CA7668];
  v6[19] = 6;
  v6[20] = *MEMORY[0x1E0CA7670];
  v6[21] = 7;
  v6[22] = *MEMORY[0x1E0CA7678];
  v6[23] = 8;
  while (!objc_msgSend(a3, "isEqualToString:", v6[v4]))
  {
    v4 += 2;
    if (v4 == 24)
      return 0;
  }
  return v6[v4 + 1];
}

- (void)_postReachabilityFlagsChangedNotificationFromValue:(unsigned int)a3 toValue:(unsigned int)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = *MEMORY[0x1E0CB2CC8];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x1E0CB2CB8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IMNetworkReachabilityFlagsChangedNotification"), self, v11);

}

- (void)_postTypeChangedNotificationFromValue:(int64_t)a3 toValue:(int64_t)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = *MEMORY[0x1E0CB2CC8];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v11 = (id)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, v9, v10, *MEMORY[0x1E0CB2CB8], 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IMNetworkTypeChangedNotification"), self, v11);

}

uint64_t __61__IMNetworkObserver__reloadNetworkTypeWithReachabilityFlags___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 64))
    result = objc_msgSend(*(id *)(result + 32), "_postTypeChangedNotificationFromValue:toValue:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  if (*(_BYTE *)(v1 + 65))
    return objc_msgSend(*(id *)(v1 + 32), "_postReachabilityFlagsChangedNotificationFromValue:toValue:", *(unsigned int *)(v1 + 56), *(unsigned int *)(v1 + 60));
  return result;
}

+ (id)_networkObserverLogConfig
{
  if (_networkObserverLogConfig_onceToken != -1)
    dispatch_once(&_networkObserverLogConfig_onceToken, &__block_literal_global_2);
  return (id)_networkObserverLogConfig_logConfig;
}

void __46__IMNetworkObserver__networkObserverLogConfig__block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CFDBB0]);
  objc_msgSend(v0, "setSubsystem:", CFSTR("com.apple.Podcasts"));
  objc_msgSend(v0, "setCategory:", CFSTR("Network Observer"));
  _networkObserverLogConfig_logConfig = objc_msgSend(v0, "copy");

}

@end
