@implementation WifiScannerBackend

- (BOOL)sensorPresent
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_wifiDevices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v4)
        objc_enumerationMutation(v2);
      if (WiFiDeviceClientGetPower(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5)))
        break;
      if (v3 == (id)++v5)
      {
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v3)
          goto LABEL_3;
        break;
      }
    }
  }

  return 1;
}

- (void)stopListeningCachedScans
{
  NSObject *q;
  WifiScannerBackend *v3;
  _QWORD block[4];
  WifiScannerBackend *v5;

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_10001291C;
  block[3] = &unk_1004041D8;
  v5 = self;
  v3 = v5;
  dispatch_async(q, block);

}

- (void)startListeningCachedScans
{
  NSObject *q;
  WifiScannerBackend *v3;
  _QWORD block[4];
  WifiScannerBackend *v5;

  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000127E8;
  block[3] = &unk_1004041A8;
  v5 = self;
  v3 = v5;
  dispatch_async(q, block);

}

- (void).cxx_destruct
{
  list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *p_pendingScans;
  _QWORD **prev;
  list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *next;
  _QWORD *v6;
  __end_ **begin;
  __end_cap_ **var0;
  __end_ **v9;
  void *v10;
  id *value;
  list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *v12;

  objc_storeStrong((id *)&self->_scannerThread, 0);
  objc_storeStrong((id *)&self->_retryingScan, 0);
  p_pendingScans = &self->_pendingScans;
  if (self->_pendingScans.__size_alloc_.__value_)
  {
    prev = (_QWORD **)p_pendingScans->__end_.__prev_;
    next = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)self->_pendingScans.__end_.__next_;
    v6 = next->__end_.__prev_;
    v6[1] = *((_QWORD *)p_pendingScans->__end_.__prev_ + 1);
    *prev[1] = v6;
    self->_pendingScans.__size_alloc_.__value_ = 0;
    if (next != p_pendingScans)
    {
      do
      {
        v12 = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)next->__end_.__next_;
        value = (id *)next->__size_alloc_.__value_;
        next->__size_alloc_.__value_ = 0;
        if (value)
        {
          sub_100049E84(value);
          operator delete();
        }
        operator delete(next);
        next = v12;
      }
      while (v12 != p_pendingScans);
    }
  }
  objc_storeStrong((id *)&self->_wifiThreadShutdown, 0);
  begin = self->_supportedChannelsPerDevice.__begin_;
  if (begin)
  {
    var0 = self->_supportedChannelsPerDevice.var0;
    v9 = self->_supportedChannelsPerDevice.__begin_;
    if (var0 != begin)
    {
      do
      {
        v10 = *--var0;

      }
      while (var0 != begin);
      v9 = self->_supportedChannelsPerDevice.__begin_;
    }
    self->_supportedChannelsPerDevice.var0 = begin;
    operator delete(v9);
  }
  objc_storeStrong((id *)&self->_wifiDevices, 0);
  objc_storeStrong((id *)&self->_q, 0);
}

- (BOOL)onQueueAllocManagerWithRunLoop:(__CFRunLoop *)a3
{
  NSArray *v5;
  NSArray *wifiDevices;
  NSArray *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id *var0;
  __end_cap_ **v14;
  _BOOL4 v15;
  NSObject *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];

  -[WifiScannerBackend onQueueTeardown](self, "onQueueTeardown");
  self->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate(kCFAllocatorDefault, 0);
  v5 = (NSArray *)WiFiManagerClientCopyDevices();
  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = v5;

  v7 = self->_wifiDevices;
  if (!v7 || !-[NSArray count](v7, "count"))
  {
    if (qword_100417ED8 == -1)
    {
      v16 = qword_100417EE0;
      v15 = os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR);
      if (!v15)
        return v15;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v16 = qword_100417EE0;
      v15 = os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR);
      if (!v15)
        return v15;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Platform doesn't contain any wifi devices", buf, 2u);
    LOBYTE(v15) = 0;
    return v15;
  }
  sub_1000BDC34((uint64_t)&self->_supportedChannelsPerDevice, -[NSArray count](self->_wifiDevices, "count"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_wifiDevices;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        v12 = +[WifiScannerBackend copySupportedChannelDicts:](WifiScannerBackend, "copySupportedChannelDicts:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11));
        v18 = v12;
        var0 = (id *)self->_supportedChannelsPerDevice.var0;
        if (var0 >= self->_supportedChannelsPerDevice.var1.__value_)
        {
          v14 = (__end_cap_ **)sub_1002EC9A0(&self->_supportedChannelsPerDevice.__begin_, (uint64_t *)&v18);
        }
        else
        {
          v18 = 0;
          *var0 = v12;
          v14 = (__end_cap_ **)(var0 + 1);
        }
        self->_supportedChannelsPerDevice.var0 = v14;

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v9);
  }

  -[WifiScannerBackend onQueueRegisterCallbacks](self, "onQueueRegisterCallbacks");
  WiFiManagerClientScheduleWithRunLoop(self->_wifiManager, a3, kCFRunLoopDefaultMode);
  WiFiManagerClientSetType(self->_wifiManager, 0);
  self->_wifiThreadRunLoop = a3;
  LOBYTE(v15) = 1;
  return v15;
}

- (void)onQueueNotifyWifiError:(int)a3 withSettings:(id)a4 forScanInitiated:(duration<long)long
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  WifiScannedSettings *v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint8_t buf[4];
  int v17;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (qword_100417ED8 == -1)
  {
    v9 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404290);
  v9 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_DWORD *)buf = 67109120;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "WARNING: WiFi scan failed with error %d", buf, 8u);
  }
LABEL_4:
  if (v8)
  {
    v14 = CFSTR("scan parameters");
    v15 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.pipeline.wifi"), (int)v6, v10));
  v12 = -[WifiScannedSettings initWithSettings:cached:at:initiatedAt:]([WifiScannedSettings alloc], "initWithSettings:cached:at:initiatedAt:", v8, 0, sub_10005F0F0(), a5.__rep_);
  -[WifiScannedSettings setWifiError:](v12, "setWifiError:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseWifiScannerBackend delegate](self, "delegate"));
  objc_msgSend(v13, "wifiScanFailed:withSettings:", v11, v12);

}

- (void)onQueueRegisterCallbacks
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  id v16;
  _BYTE v17[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_wifiDevices;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v6);
        if (qword_100417ED8 == -1)
        {
          v8 = (id)qword_100417EE0;
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            goto LABEL_9;
LABEL_8:
          v9 = objc_msgSend(objc_retainAutorelease((id)WiFiDeviceClientGetInterfaceName(v7)), "UTF8String");
          *(_DWORD *)buf = 134217984;
          v16 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Registering callbacks for device %p", buf, 0xCu);
          goto LABEL_9;
        }
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v8 = (id)qword_100417EE0;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          goto LABEL_8;
LABEL_9:

        WiFiDeviceClientRegisterPowerCallback(v7, nullsub_215, self);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      v4 = v10;
    }
    while (v10);
  }

  WiFiManagerClientRegisterServerRestartCallback(self->_wifiManager, sub_1002EB64C, self);
  WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiManager, sub_1002EB7B8, self);
}

- (WifiScannerBackend)init
{
  WifiScannerBackend *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *q;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *wifiThreadShutdown;
  NSObject *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *retryingScan;
  WifiScannerThread *v10;
  WifiScannerThread *scannerThread;
  WifiScannerBackend *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  self->_initialized = 0;
  v16.receiver = self;
  v16.super_class = (Class)WifiScannerBackend;
  v2 = -[BaseWifiScannerBackend init](&v16, "init");
  if (!v2)
    goto LABEL_11;
  if (!MobileWiFiContainsRadio())
  {
    if (qword_100417ED8 == -1)
    {
      v13 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        v12 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v13 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
    }
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Platform doesn't contain radio", v15, 2u);
    goto LABEL_11;
  }
  v2->_isInternalBuild = MGGetBoolAnswer(CFSTR("InternalBuild"));
  v3 = dispatch_queue_create("com.apple.wifi.scanner.ios", 0);
  q = v2->_q;
  v2->_q = (OS_dispatch_queue *)v3;

  if (!v2->_q)
    goto LABEL_11;
  v5 = dispatch_semaphore_create(0);
  wifiThreadShutdown = v2->_wifiThreadShutdown;
  v2->_wifiThreadShutdown = (OS_dispatch_semaphore *)v5;

  if (!v2->_wifiThreadShutdown)
    goto LABEL_11;
  v7 = dispatch_semaphore_create(0);
  if (v7
    && (v8 = dispatch_semaphore_create(0),
        retryingScan = v2->_retryingScan,
        v2->_retryingScan = (OS_dispatch_semaphore *)v8,
        retryingScan,
        v2->_retryingScan))
  {
    v10 = -[WifiScannerThread initWithBackend:]([WifiScannerThread alloc], "initWithBackend:", v2);
    scannerThread = v2->_scannerThread;
    v2->_scannerThread = v10;

    +[NSThread detachNewThreadSelector:toTarget:withObject:](NSThread, "detachNewThreadSelector:toTarget:withObject:", "runWifiThread:", v2->_scannerThread, v7);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v2->_initialized = 1;
    v12 = v2;
  }
  else
  {
    v12 = 0;
  }

LABEL_12:
  return v12;
}

- (void)onQueueTeardown
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSArray *wifiDevices;
  __CFRunLoopSource *v12;
  NSObject *v13;
  NSObject *v14;
  __WiFiManagerClient *wifiManager;
  __CFRunLoop *wifiThreadRunLoop;
  WifiScannerThread *v17;
  WifiScannerThread *v18;
  _QWORD block[4];
  WifiScannerThread *v21;
  __WiFiManagerClient *v22;
  __CFRunLoop *v23;
  __CFRunLoopSource *v24;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CFRunLoopSourceContext buf;
  _BYTE v31[128];

  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v2 = self->_wifiDevices;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v5);
        if (qword_100417ED8 == -1)
        {
          v7 = (id)qword_100417EE0;
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            goto LABEL_9;
LABEL_8:
          v8 = objc_msgSend(objc_retainAutorelease((id)WiFiDeviceClientGetInterfaceName(v6)), "UTF8String");
          LODWORD(buf.version) = 136315138;
          *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Tearing down exiting device %s", (uint8_t *)&buf, 0xCu);
          goto LABEL_9;
        }
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v7 = (id)qword_100417EE0;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_8;
LABEL_9:

        WiFiDeviceClientScanCancel(v6);
        if (qword_100417ED8 == -1)
        {
          v9 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            goto LABEL_12;
LABEL_11:
          LOWORD(buf.version) = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Unregistering per-device callbacks", (uint8_t *)&buf, 2u);
          goto LABEL_12;
        }
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v9 = qword_100417EE0;
        if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_11;
LABEL_12:
        WiFiDeviceClientRegisterPowerCallback(v6, 0, 0);
        WiFiDeviceClientRegisterScanUpdateCallback(v6, 0, 1, 0);
        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      v3 = v10;
    }
    while (v10);
  }

  wifiDevices = self->_wifiDevices;
  self->_wifiDevices = 0;

  if (self->_wifiManager)
  {
    memset(&buf, 0, sizeof(buf));
    v12 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &buf);
    CFRunLoopAddSource(self->_wifiThreadRunLoop, v12, kCFRunLoopDefaultMode);
    if (qword_100417ED8 == -1)
    {
      v13 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v13 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:
        WiFiManagerClientRegisterServerRestartCallback(self->_wifiManager, 0, 0);
        WiFiManagerClientRegisterDeviceAttachmentCallback(self->_wifiManager, 0, 0);
        WiFiManagerClientUnscheduleFromRunLoop(self->_wifiManager, self->_wifiThreadRunLoop, kCFRunLoopDefaultMode);
        if (qword_100417ED8 == -1)
        {
          v14 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
          {
LABEL_26:
            wifiManager = self->_wifiManager;
            self->_wifiManager = 0;
            wifiThreadRunLoop = self->_wifiThreadRunLoop;
            self->_wifiThreadRunLoop = 0;
            v17 = self->_scannerThread;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100015570;
            block[3] = &unk_100404188;
            v22 = wifiManager;
            v18 = v17;
            v21 = v18;
            v23 = wifiThreadRunLoop;
            v24 = v12;
            CFRunLoopPerformBlock(wifiThreadRunLoop, kCFRunLoopCommonModes, block);
            CFRunLoopWakeUp(wifiThreadRunLoop);

            return;
          }
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404290);
          v14 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
            goto LABEL_26;
        }
        *(_WORD *)v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Releasing the WiFi manager", v25, 2u);
        goto LABEL_26;
      }
    }
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Tearing down existing manager", v25, 2u);
    goto LABEL_23;
  }
}

- (void)invalidate
{
  __objc2_class *v2;
  WifiScannerBackend *v3;
  NSObject *q;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  _QWORD block[4];
  WifiScannerBackend *v11;
  char *v12;
  char v13;
  uint8_t buf[16];

  v3 = self;
  if (self->_initialized)
  {
    atomic_store(1u, (unsigned __int8 *)&self->_shutdownRequested);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_retryingScan);
    if (v3->_wifiThreadRunLoop)
    {
      v13 = 0;
      q = v3->_q;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3321888768;
      block[2] = sub_10000E294;
      block[3] = &unk_100404150;
      v11 = v3;
      v12 = &v13;
      v3 = v11;
      dispatch_sync(q, block);

      v2 = &OBJC_METACLASS___CLPrefetchFloorRequest;
      if (!v13)
      {
        if (qword_100417ED8 == -1)
        {
          v6 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            goto LABEL_20;
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404290);
          v6 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            goto LABEL_20;
        }
        *(_WORD *)buf = 0;
        v7 = "wifiThreadRunLoop already deallocated. Shutdown is complete.";
        goto LABEL_19;
      }
      if (qword_100417ED8 == -1)
      {
        v5 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        {
LABEL_7:
          dispatch_semaphore_wait((dispatch_semaphore_t)v3->_wifiThreadShutdown, 0xFFFFFFFFFFFFFFFFLL);
          if (v2[95].isa != (__objc2_class *)-1)
          {
            dispatch_once(&qword_100417ED8, &stru_100404290);
            v6 = qword_100417EE0;
            if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
              goto LABEL_20;
            goto LABEL_9;
          }
          v6 = qword_100417EE0;
          if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          {
LABEL_9:
            *(_WORD *)buf = 0;
            v7 = "wifiThreadShutdown done. [IOSWifiScannerBackend invalidate] completed successfully.";
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
          }
LABEL_20:

          return;
        }
LABEL_6:
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Wait for the wifi thread runloop to terminate...", buf, 2u);
        goto LABEL_7;
      }
LABEL_22:
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v5 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      goto LABEL_6;
    }
    if (qword_100417ED8 == -1)
    {
      v8 = qword_100417EE0;
      if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      {
LABEL_14:
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Wi-Fi thread already shut-down", buf, 2u);
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v8 = qword_100417EE0;
      if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_14;
    }
  }
  else if (self->_wifiThreadRunLoop)
  {
    sub_1003448BC();
    goto LABEL_22;
  }
}

- (void)onQueueInitiateScan:(id)a3 initiated:(id)a4
{
  id v6;
  void (**v7)(id, NSUInteger);
  os_activity_t v8;
  NSObject *v9;
  NSUInteger v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  id *v14;
  id *v15;
  size_t v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  WifiScannerBackend *v19;
  NSObject *v20;
  id v21;
  WifiScannerBackend *v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  id *v26;
  id *v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, unint64_t);
  void *v31;
  WifiScannerBackend *v32;
  NSObject *v33;
  id v34;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v37;

  v6 = a3;
  v7 = (void (**)(id, NSUInteger))a4;
  v8 = _os_activity_create((void *)&_mh_execute_header, "Wifi Scan", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  if (qword_100417ED8 == -1)
  {
    v9 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404290);
  v9 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initiating a scan with settings: %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  buf = 0uLL;
  v37 = 0;
  v10 = -[NSArray count](self->_wifiDevices, "count");
  v11 = (_QWORD *)*((_QWORD *)&buf + 1);
  v12 = (uint64_t)(*((_QWORD *)&buf + 1) - buf) >> 3;
  if (v10 <= v12)
  {
    if (v10 < v12)
    {
      v13 = buf + 8 * v10;
      while (v11 != (_QWORD *)v13)
      {
        v15 = (id *)*--v11;
        v14 = v15;
        *v11 = 0;
        if (v15)
        {
          sub_100049E84(v14);
          operator delete();
        }
      }
      *((_QWORD *)&buf + 1) = v13;
    }
  }
  else
  {
    sub_10003672C(&buf, v10 - v12);
  }
  v16 = -[NSArray count](self->_wifiDevices, "count");
  global_queue = dispatch_get_global_queue(0, 0);
  v18 = objc_claimAutoreleasedReturnValue(global_queue);
  v28 = _NSConcreteStackBlock;
  v29 = 3321888768;
  v30 = sub_10002229C;
  v31 = &unk_100404238;
  v19 = self;
  v20 = v8;
  v21 = v6;
  v22 = v19;
  v32 = v22;
  v33 = v20;
  v34 = v21;
  p_buf = &buf;
  dispatch_apply(v16, v18, &v28);

  sub_1002ECB3C((uint64_t)&v22->_pendingScans, (uint64_t *)&v22->_pendingScans, (uint64_t *)buf, *((uint64_t **)&buf + 1));
  atomic_store(v22->_pendingScans.__size_alloc_.__value_, &v22->_pendingScanCount.__a_.__a_value);
  v7[2](v7, -[NSArray count](self->_wifiDevices, "count", v28, v29, v30, v31));

  v23 = (_QWORD *)buf;
  if ((_QWORD)buf)
  {
    v24 = (_QWORD *)*((_QWORD *)&buf + 1);
    v25 = (void *)buf;
    if (*((_QWORD *)&buf + 1) != (_QWORD)buf)
    {
      do
      {
        v27 = (id *)*--v24;
        v26 = v27;
        *v24 = 0;
        if (v27)
        {
          sub_100049E84(v26);
          operator delete();
        }
      }
      while (v24 != v23);
      v25 = (void *)buf;
    }
    *((_QWORD *)&buf + 1) = v23;
    operator delete(v25);
  }

}

- (void)scanAsync:(id)a3 initiated:(id)a4
{
  id v6;
  NSObject *q;
  WifiScannerBackend *v8;
  id v9;
  id v10;
  id v11;
  WifiScannerBackend *v12;
  _QWORD block[4];
  WifiScannerBackend *v14;
  id v15;
  id v16;

  v6 = a3;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100035FCC;
  block[3] = &unk_100404208;
  v8 = self;
  v9 = v6;
  v10 = objc_retainBlock(a4);
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  v16 = objc_retainBlock(v10);
  dispatch_async(q, block);

}

- (void)onQueueHandleScanFor:(__WiFiDeviceClient *)a3 withResults:(id)a4 forScan:(void *)a5 withSettings:(id)a6 withRequest:(id)a7 withError:(int)a8
{
  uint64_t v8;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char isKindOfClass;
  objc_class *v18;
  NSString *v19;
  id v20;
  uint64_t v21;
  char v22;
  objc_class *v23;
  NSString *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  void *v37;
  NSNumber *v38;
  void *v39;
  unsigned int v40;
  NSObject *v41;
  void *v42;
  id v43;
  double v44;
  id v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v49;
  void *v50;
  WifiScannedSettings *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v64;
  uint64_t v66;
  const std::string::value_type *v68;
  void *v69[2];
  void *__p[2];
  char v71;
  std::string buf;
  std::string v73;

  v8 = *(_QWORD *)&a8;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v15)
  {
    sub_1000D5048(&buf, "");
    sub_100174738((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_1000F2AE4((uint64_t)__p);
  }
  if (!v14)
  {
    sub_1000D5048(&buf, "");
    sub_100174738((uint64_t)&buf, 0, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    sub_1000F2AE4((uint64_t)__p);
  }
  v16 = objc_opt_class(NSDictionary);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);
  v18 = (objc_class *)objc_opt_class(v15);
  v19 = NSStringFromClass(v18);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v19));
  v68 = (const std::string::value_type *)objc_msgSend(v20, "UTF8String");
  if ((isKindOfClass & 1) == 0)
  {
    sub_1000D5048(__p, "");
    sub_1002ECDE4("We expect that request is of type NSDictionary, but it's not. Memory smasher? Got ", &buf);
    sub_1002CF860(&v68, &v73);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 2);
    if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v73.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_66:
        if ((v71 & 0x80000000) == 0)
          goto LABEL_67;
LABEL_74:
        operator delete(__p[0]);
LABEL_67:
        sub_1000F2AE4((uint64_t)v69);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_66;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v71 & 0x80000000) == 0)
      goto LABEL_67;
    goto LABEL_74;
  }

  v21 = objc_opt_class(WifiScannerSettings);
  v22 = objc_opt_isKindOfClass(v14, v21);
  v23 = (objc_class *)objc_opt_class(v14);
  v24 = NSStringFromClass(v23);
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v24));
  v68 = (const std::string::value_type *)objc_msgSend(v25, "UTF8String");
  if ((v22 & 1) == 0)
  {
    sub_1000D5048(__p, "");
    sub_1002ECE30("We expect that scanSettings is of type WifiScannerSettings, but it's not. Memory smasher? Got ", &buf);
    sub_1002CF860(&v68, &v73);
    sub_100174738((uint64_t)__p, (uint64_t)&buf, 2);
    if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v73.__r_.__value_.__l.__data_);
      if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_70:
        if ((v71 & 0x80000000) == 0)
          goto LABEL_71;
LABEL_77:
        operator delete(__p[0]);
LABEL_71:
        sub_1000F2AE4((uint64_t)v69);
      }
    }
    else if ((SHIBYTE(buf.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_70;
    }
    operator delete(buf.__r_.__value_.__l.__data_);
    if ((v71 & 0x80000000) == 0)
      goto LABEL_71;
    goto LABEL_77;
  }

  if ((_DWORD)v8)
  {
    if (a5)
    {
      if (objc_msgSend(v14, "lowPriorityScan"))
      {
        if (qword_100417ED8 != -1)
        {
          dispatch_once(&qword_100417ED8, &stru_100404290);
          v60 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          goto LABEL_11;
        }
        v60 = qword_100417EE0;
        if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        {
LABEL_11:
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
          v26 = "WARNING: An error occurred during a WiFi scan (error code %d)";
          v27 = v60;
          v28 = OS_LOG_TYPE_INFO;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, v27, v28, v26, (uint8_t *)&buf, 8u);
        }
LABEL_24:
        v36 = sub_10005F0F0();
        -[WifiScannerBackend onQueueNotifyWifiError:withSettings:forScanInitiated:](self, "onQueueNotifyWifiError:withSettings:forScanInitiated:", v8, v14, v36 - std::chrono::steady_clock::now().__d_.__rep_ + *((_QWORD *)a5 + 7));
        -[WifiScannerBackend onQueueDeleteCompletedScan:](self, "onQueueDeleteCompletedScan:", a5);
        goto LABEL_57;
      }
      if (qword_100417ED8 == -1)
      {
        v62 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v62 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
      v26 = "An error occurred during a WiFi scan (error code %d)";
      v27 = v62;
      v28 = OS_LOG_TYPE_ERROR;
      goto LABEL_23;
    }
    if (objc_msgSend(v14, "lowPriorityScan"))
    {
      if (qword_100417ED8 == -1)
      {
        v64 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_57;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v64 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_57;
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
      v33 = "WARNING: An error occurred during a WiFi scan (error code %d)";
      v34 = v64;
      v35 = OS_LOG_TYPE_INFO;
LABEL_33:
      _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, (uint8_t *)&buf, 8u);
      goto LABEL_57;
    }
    if (qword_100417ED8 == -1)
    {
      v66 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v66 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
    }
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = v8;
    v33 = "An error occurred during a WiFi scan (error code %d)";
    v34 = v66;
    v35 = OS_LOG_TYPE_ERROR;
    goto LABEL_33;
  }
  if (a5)
  {
    v29 = sub_10005F0F0();
    rep = std::chrono::steady_clock::now().__d_.__rep_;
    v31 = *((_QWORD *)a5 + 7);
    -[WifiScannerBackend onQueueDeleteCompletedScan:](self, "onQueueDeleteCompletedScan:", a5);
    v32 = v29 - rep + v31;
  }
  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", qword_10041A2F8));
    v38 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = objc_msgSend(v37, "isEqualToNumber:", v39);

    if (v40)
    {
      if (qword_100417ED8 == -1)
      {
        v41 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
          goto LABEL_57;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v41 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
          goto LABEL_57;
      }
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Dropping cached scan results because it's for a scan we initiated", (uint8_t *)&buf, 2u);
      goto LABEL_57;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", qword_10041A300));
    v43 = v42;
    if (v42)
    {
      objc_msgSend(v42, "timeIntervalSinceNow");
      v32 = (uint64_t)(v44 * -1000000000.0);
    }
    else
    {
      v45 = objc_msgSend(v14, "dwell");
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "channels"));
      v47 = objc_msgSend(v46, "count");

      v43 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSinceNow:", (double)(unint64_t)((_QWORD)v47 * (_QWORD)v45) / -1000.0);
      v32 = 0;
    }
    if (qword_100417ED8 != -1)
      dispatch_once(&qword_100417ED8, &stru_100404290);
    v48 = (id)qword_100417EE0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "description")));
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)objc_msgSend(v49, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Got scan request at %s", (uint8_t *)&buf, 0xCu);

    }
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[WifiScannerCommonDarwin networkResultsToScanResults:](WifiScannerCommonDarwin, "networkResultsToScanResults:", v13));
  v51 = -[WifiScannedSettings initWithSettings:cached:at:initiatedAt:]([WifiScannedSettings alloc], "initWithSettings:cached:at:initiatedAt:", v14, a5 == 0, sub_10005F0F0(), v32);
  if (!a5)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SCAN_RSSI_THRESHOLD")));
    v53 = v52;
    if (v52)
      -[WifiScannedSettings setScanRssiThreshold:](v51, "setScanRssiThreshold:", ((_QWORD)objc_msgSend(v52, "intValue") << 32) | 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SCAN_MERGE")));
    v55 = v54;
    if (v54)
    {
      if (objc_msgSend(v54, "BOOLValue"))
        v56 = 257;
      else
        v56 = 1;
      -[WifiScannedSettings setMerged:](v51, "setMerged:", v56);
    }
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SSID_STR")));
    if (v57)
      -[WifiScannedSettings setTargettedSsid:](v51, "setTargettedSsid:", 1);

  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[BaseWifiScannerBackend delegate](self, "delegate"));
  v59 = v58;
  if (a5)
    objc_msgSend(v58, "wifiScanResult:withSettings:", v50, v51);
  else
    objc_msgSend(v58, "wifiCachedScanResult:withSettings:", v50, v51);

LABEL_57:
}

- (void)onQueueDeleteCompletedScan:(void *)a3
{
  NSObject *v5;
  list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *p_pendingScans;
  WifiScannerBackend *next;
  NSObject *v8;
  NSObject *v9;
  Class isa;
  id *log;
  int v12;
  void *v13;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404290);
    v5 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing pending scan %p", (uint8_t *)&v12, 0xCu);
  }
LABEL_4:
  p_pendingScans = &self->_pendingScans;
  next = (WifiScannerBackend *)self->_pendingScans.__end_.__next_;
  if (next == (WifiScannerBackend *)&self->_pendingScans)
    goto LABEL_7;
  while (next->super._log != a3)
  {
    next = (WifiScannerBackend *)next->super._delegate;
    if (next == (WifiScannerBackend *)p_pendingScans)
      goto LABEL_7;
  }
  if (next == (WifiScannerBackend *)p_pendingScans)
  {
LABEL_7:
    if (qword_100417ED8 == -1)
    {
      v8 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        return;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v8 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        return;
    }
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Completed scan %p but don't have it in the pending list", (uint8_t *)&v12, 0xCu);
    return;
  }
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404290);
    v9 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    goto LABEL_13;
  }
  v9 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_13:
    v12 = 134217984;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Erasing pending scan %p from the list", (uint8_t *)&v12, 0xCu);
  }
LABEL_14:
  isa = next->super.super.isa;
  *((_QWORD *)isa + 1) = next->super._delegate;
  *(_QWORD *)next->super._delegate = isa;
  --self->_pendingScans.__size_alloc_.__value_;
  log = (id *)next->super._log;
  next->super._log = 0;
  if (log)
  {
    sub_100049E84(log);
    operator delete();
  }
  operator delete(next);
  atomic_store(self->_pendingScans.__size_alloc_.__value_, &self->_pendingScanCount.__a_.__a_value);
}

- (unique_ptr<ScanInformation,)initiateScanOnDevice:(__WiFiDeviceClient *)a3 withSettings:(id)a4 deviceNumber:(unint64_t)a5
{
  id v8;
  __end_ *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  _QWORD v13[4];
  __end_ *v14;
  int buf;
  uint8_t buf_4[8];

  v8 = a4;
  v12 = a5;
  v9 = self->_supportedChannelsPerDevice.__begin_[a5];
  if (v9)
  {
LABEL_8:
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100056A6C;
    v13[3] = &unk_100404270;
    v14 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseWifiScannerBackend log](self, "log", v14));
    objc_claimAutoreleasedReturnValue(+[WifiScannerCommonDarwin scanSettingsToDictionary:usingSupportedChannels:logTo:](WifiScannerCommonDarwin, "scanSettingsToDictionary:usingSupportedChannels:logTo:", v8, v13, v11));

    operator new();
  }
  v9 = +[WifiScannerBackend copySupportedChannelDicts:](WifiScannerBackend, "copySupportedChannelDicts:", a3);
  if (v9)
  {
    objc_storeStrong((id *)&self->_supportedChannelsPerDevice.__begin_[v12], v9);
    goto LABEL_8;
  }
  if (qword_100417ED8 == -1)
  {
    v10 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100404290);
    v10 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
  }
  buf = 134217984;
  *(_QWORD *)buf_4 = v12;
  _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to get supported channels dictionaries for device %zu", (uint8_t *)&buf, 0xCu);
  goto LABEL_7;
}

- (OS_dispatch_semaphore)wifiThreadShutdown
{
  return self->_wifiThreadShutdown;
}

- (__CFRunLoop)wifiThreadRunLoop
{
  return self->_wifiThreadRunLoop;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 11) = (char *)self + 88;
  *((_QWORD *)self + 12) = (char *)self + 88;
  *((_QWORD *)self + 13) = 0;
  return self;
}

+ (id)copySupportedChannelDicts:(__WiFiDeviceClient *)a3
{
  return (id)WiFiDeviceClientCopyProperty(a3, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 27));
}

- (void)onQueueHandlerServerRestart
{
  NSObject *v3;
  list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *i;
  uint8_t v5[16];

  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404290);
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wifi daemon restarted", v5, 2u);
  }
LABEL_4:
  for (i = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)self->_pendingScans.__end_.__next_;
        i != &self->_pendingScans;
        i = (list<std::unique_ptr<ScanInformation>, std::allocator<std::unique_ptr<ScanInformation>>> *)i->__end_.__next_)
  {
    sub_1002EBA1C(i->__size_alloc_.__value_, 54);
  }
  atomic_store(0, &self->_pendingScanCount.__a_.__a_value);
}

- (void)onQueueHandleDeviceAttached:(__WiFiDeviceClient *)a3
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      return;
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100404290);
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      return;
  }
  *(_WORD *)v4 = 0;
  _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "device attachment unimplemented", v4, 2u);
}

- (void)onQueueScanTimedOut:(void *)a3 withReason:(int)a4 errorCode:(int)a5 forScanInitiated:(duration<long)long
{
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = *(_QWORD *)&a5;
  if (a4 == 1)
  {
    if (qword_100417ED8 == -1)
    {
      v15 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      {
LABEL_10:
        WiFiDeviceClientScanCancel(*((_QWORD *)a3 + 1));
        goto LABEL_15;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v15 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
    }
    LODWORD(v17) = 67109120;
    HIDWORD(v17) = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Scan timed out with error code %d - cancelling", (uint8_t *)&v17, 8u);
    goto LABEL_10;
  }
  if (!a4)
  {
    if (a5 != 82)
    {
      if (qword_100417ED8 == -1)
      {
        v16 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_15;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v16 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_15;
      }
      LODWORD(v17) = 67109120;
      HIDWORD(v17) = v7;
      v11 = "Fake timeout for scan invalidation elapsed.  Scan had failed to schedule with %d";
      v12 = v16;
      v13 = OS_LOG_TYPE_INFO;
      v14 = 8;
      goto LABEL_14;
    }
    if (qword_100417ED8 != -1)
    {
      dispatch_once(&qword_100417ED8, &stru_100404290);
      v10 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
        goto LABEL_15;
      goto LABEL_6;
    }
    v10 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
    {
LABEL_6:
      LOWORD(v17) = 0;
      v11 = "WiFi is powered off.";
      v12 = v10;
      v13 = OS_LOG_TYPE_DEBUG;
      v14 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, (uint8_t *)&v17, v14);
    }
  }
LABEL_15:
  -[WifiScannerBackend onQueueNotifyWifiError:withSettings:forScanInitiated:](self, "onQueueNotifyWifiError:withSettings:forScanInitiated:", v7, *((_QWORD *)a3 + 3), a6.__rep_, v17);
  -[WifiScannerBackend onQueueDeleteCompletedScan:](self, "onQueueDeleteCompletedScan:", a3);
}

- (void)setWifiThreadRunLoop:(__CFRunLoop *)a3
{
  self->_wifiThreadRunLoop = a3;
}

- (void)setWifiThreadShutdown:(id)a3
{
  objc_storeStrong((id *)&self->_wifiThreadShutdown, a3);
}

@end
