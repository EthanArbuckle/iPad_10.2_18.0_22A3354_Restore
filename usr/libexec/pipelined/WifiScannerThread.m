@implementation WifiScannerThread

- (void)dealloc
{
  std::mutex *v3;
  objc_super v4;
  id v5;

  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  if (*((_BYTE *)self + 16))
  {
    std::mutex::unlock(v3);
    v4.receiver = self;
    v4.super_class = (Class)WifiScannerThread;
    -[WifiScannerThread dealloc](&v4, "dealloc");
  }
  else
  {
    sub_100344664();

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/common/wifiscanning/sensor/backend/IOSWifiScannerBackend.mm", 553, "-[WifiScannerThread dealloc]");
    __break(1u);
  }
}

- (WifiScannerThread)initWithBackend:(id)a3
{
  id v5;
  id v6;
  WifiScannerThread *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WifiScannerThread;
  v6 = -[WifiScannerThread init](&v9, "init");
  v7 = (WifiScannerThread *)v6;
  if (v6)
  {
    *((_BYTE *)v6 + 16) = 0;
    objc_storeStrong((id *)v6 + 1, a3);
  }

  return v7;
}

- (void)runWifiThread:(id)a3
{
  NSObject *v4;
  __CFRunLoop *Current;
  void *v6;
  NSObject *v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[4];
  NSObject *v18;
  os_activity_scope_state_s state;
  _BYTE buf[12];
  __int16 v21;
  uint64_t v22;

  v4 = a3;
  Current = CFRunLoopGetCurrent();
  v6 = objc_autoreleasePoolPush();
  v7 = _os_activity_create((void *)&_mh_execute_header, "Wifi Framework", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DETACHED);
  os_activity_scope_enter(v7, &state);
  v8 = objc_msgSend(*((id *)self + 1), "onQueueAllocManagerWithRunLoop:", Current);
  if (qword_100417ED8 != -1)
    dispatch_once(&qword_100417ED8, &stru_100404290);
  v9 = (id)qword_100417EE0;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*((id *)self + 1), "wifiThreadRunLoop");
    v11 = *((_QWORD *)self + 1);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v10;
    v21 = 2048;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Created runloop %p on %p", buf, 0x16u);
  }

  if ((v8 & 1) == 0)
  {
    if (qword_100417ED8 != -1)
      goto LABEL_21;
    v12 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failure, wifi manager failed to initialize", buf, 2u);
      goto LABEL_9;
    }
  }
  while (1)
  {
LABEL_9:
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)self + 1), "wifiThreadShutdown"));
    v14 = (void *)*((_QWORD *)self + 1);
    *((_QWORD *)self + 1) = 0;

    os_activity_scope_leave(&state);
    objc_autoreleasePoolPop(v6);
    if (v8)
    {
      if (qword_100417ED8 == -1)
      {
        v15 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_13;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404290);
        v15 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        {
LABEL_13:
          v7 = kCFRunLoopCommonModes;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000B948;
          block[3] = &unk_1003EE788;
          v18 = v4;
          CFRunLoopPerformBlock(Current, kCFRunLoopCommonModes, block);
          if (qword_100417ED8 == -1)
          {
            v16 = qword_100417EE0;
            if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
            {
LABEL_16:
              CFRunLoopRun();

              goto LABEL_18;
            }
          }
          else
          {
            dispatch_once(&qword_100417ED8, &stru_100404290);
            v16 = qword_100417EE0;
            if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
              goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Starting WiFi runloop", buf, 2u);
          goto LABEL_16;
        }
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Scheduling block onto runloop to unblock init", buf, 2u);
      goto LABEL_13;
    }
    dispatch_semaphore_signal(v4);
    -[WifiScannerThread setStopExpected](self, "setStopExpected");
LABEL_18:
    dispatch_semaphore_signal(v13);
    Current = (__CFRunLoop *)((char *)self + 24);
    std::mutex::lock((std::mutex *)((char *)self + 24));
    if (*((_BYTE *)self + 16))
      break;
    sub_100344790();

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/common/wifiscanning/sensor/backend/IOSWifiScannerBackend.mm", 606, "-[WifiScannerThread runWifiThread:]");
    __break(1u);
LABEL_21:
    dispatch_once(&qword_100417ED8, &stru_100404290);
    v12 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
  }
  std::mutex::unlock((std::mutex *)((char *)self + 24));

}

- (void)setStopExpected
{
  std::mutex *v3;

  v3 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  *((_BYTE *)self + 16) = 1;
  std::mutex::unlock(v3);
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 24));
  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_QWORD *)self + 10) = 0;
  return self;
}

- (WifiScannerThread)init
{
  -[WifiScannerThread doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

@end
