@implementation NewWifiScanner

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NewWifiScanner *v6;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: dealloc", buf, 0xCu);
  }
LABEL_4:
  -[NewWifiScanner onQueueInvalidate](self, "onQueueInvalidate");
  -[WifiScannerBackendProtocol invalidate](self->_platform, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)NewWifiScanner;
  -[NewWifiScanner dealloc](&v4, "dealloc");
}

- (BOOL)sensorPresent
{
  NSObject *wifiScanQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  wifiScanQueue = self->_wifiScanQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BDADC;
  v5[3] = &unk_100404910;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(wifiScanQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)onQueueStopScanning
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  int v6;
  NewWifiScanner *v7;

  if (!-[NewWifiScanner scanning](self, "scanning"))
  {
    if (qword_100417ED8 == -1)
    {
      v4 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        return;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v4 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        return;
    }
    LOWORD(v6) = 0;
    v5 = "WARNING: Already not scanning";
    goto LABEL_13;
  }
  if (!self->_scansInProgress)
    -[MonotonicTimerProtocol pause](self->_scanTimer, "pause");
  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    goto LABEL_6;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_6:
    v6 = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "wifi scanner %p: stop scanning", (uint8_t *)&v6, 0xCu);
  }
LABEL_7:
  -[MonotonicTimerProtocol setDelay:](self->_scanTimer, "setDelay:", 0x7FFFFFFFFFFFFFFFLL);
  -[NewWifiScanner setScanning:](self, "setScanning:", 0);
  if (qword_100417ED8 == -1)
  {
    v4 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      return;
    goto LABEL_9;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v4 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    LOWORD(v6) = 0;
    v5 = "scan timer stopped";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v6, 2u);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scanSettings, 0);
  objc_storeStrong((id *)&self->_scanTimer, 0);
  objc_storeStrong((id *)&self->_wifiScanQueue, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

- (NewWifiScanner)initWithDelegate:(id)a3
{
  id v4;
  WifiScannerBackend *v5;
  NewWifiScanner *v6;

  v4 = a3;
  v5 = objc_alloc_init(WifiScannerBackend);
  v6 = -[NewWifiScanner initWithPlatform:andTimer:andDelegate:](self, "initWithPlatform:andTimer:andDelegate:", v5, 0, v4);

  return v6;
}

- (void)onQueueStartScanning
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v8;
  int v10;
  NewWifiScanner *v11;

  if (!-[NewWifiScanner scanning](self, "scanning"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner delegate](self, "delegate"));
    if (!v4)
    {
      if (qword_100417ED8 == -1)
      {
        v8 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404988);
        v8 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_18;
      }
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "No delegate - cannot start scanning", (uint8_t *)&v10, 2u);
      goto LABEL_18;
    }
    if (qword_100417ED8 == -1)
    {
      v6 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_10;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v6 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        -[NewWifiScanner setScanning:](self, "setScanning:", 1);
        objc_msgSend(v4, "updateWifiSettingsForNextScan:", self->_scanSettings);
        if (qword_100417ED8 == -1)
        {
          v5 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          {
LABEL_13:
            -[NewWifiScanner onQueueScanAfter:](self, "onQueueScanAfter:", 0);
LABEL_18:

            return;
          }
        }
        else
        {
          dispatch_once(&qword_100417ED8, &stru_100404988);
          v5 = qword_100417EE0;
          if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            goto LABEL_13;
        }
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "starting scan timer", (uint8_t *)&v10, 2u);
        goto LABEL_13;
      }
    }
    v10 = 134217984;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "wifi scanner %p: start scanning", (uint8_t *)&v10, 0xCu);
    goto LABEL_10;
  }
  if (qword_100417ED8 == -1)
  {
    v3 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
    {
LABEL_4:
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "WARNING: Already scanning", (uint8_t *)&v10, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v3 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
  }
}

- (void)wifiScanFailed:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *wifiScanQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  NewWifiScanner *v14;

  v6 = a3;
  v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018140;
  block[3] = &unk_100404968;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  dispatch_sync(wifiScanQueue, block);

}

- (void)stopListeningCachedScans
{
  OS_dispatch_queue *wifiScanQueue;
  NSObject *v3;
  std::promise<void> *v4;
  NewWifiScanner *v5;
  _QWORD block[6];
  std::future<void> v7;
  std::promise<void> v8;

  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  v3 = wifiScanQueue;
  v4 = std::promise<void>::promise(&v8);
  std::promise<void>::get_future(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006380;
  block[3] = &unk_1003FC648;
  block[4] = &v5;
  block[5] = &v8;
  dispatch_sync(v3, block);
  std::future<void>::get(&v7);
  std::future<void>::~future(&v7);
  std::promise<void>::~promise(&v8);

}

- (void)startListeningCachedScans
{
  OS_dispatch_queue *wifiScanQueue;
  NSObject *v3;
  std::promise<void> *v4;
  NewWifiScanner *v5;
  _QWORD block[6];
  std::future<void> v7;
  std::promise<void> v8;

  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  v3 = wifiScanQueue;
  v4 = std::promise<void>::promise(&v8);
  std::promise<void>::get_future(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006298;
  block[3] = &unk_1003FC648;
  block[4] = &v5;
  block[5] = &v8;
  dispatch_sync(v3, block);
  std::future<void>::get(&v7);
  std::future<void>::~future(&v7);
  std::promise<void>::~promise(&v8);

}

- (NewWifiScanner)initWithPlatform:(id)a3 andTimer:(id)a4 andDelegate:(id)a5
{
  id v9;
  DispatchMonotonicTimer *v10;
  id v11;
  NewWifiScanner *v12;
  NewWifiScanner *v13;
  NewWifiScanner *v14;
  WifiScannerSettings *v15;
  WifiScannerSettings *scanSettings;
  dispatch_queue_t v17;
  OS_dispatch_queue *wifiScanQueue;
  _QWORD *v19;
  id *p_scanTimer;
  const __CFString *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  objc_super v26;
  void *__p;
  id location[2];
  char v29;

  v9 = a3;
  v10 = (DispatchMonotonicTimer *)a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)NewWifiScanner;
  v12 = -[NewWifiScanner init](&v26, "init");
  v13 = v12;
  v14 = v12;
  if (!v12)
    goto LABEL_10;
  if (!v11)
  {
    v22 = CFSTR("delegate for scanner is nil");
    goto LABEL_16;
  }
  if (!v9)
  {
    v22 = CFSTR("scanning backend is nil");
LABEL_16:
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v22, 0));
    objc_exception_throw(v23);
  }
  objc_storeWeak((id *)&v12->_delegate, v11);
  v15 = objc_alloc_init(WifiScannerSettings);
  scanSettings = v14->_scanSettings;
  v14->_scanSettings = v15;

  if (v14->_scanSettings
    && (v17 = dispatch_queue_create("com.apple.wifiscanner", 0),
        wifiScanQueue = v14->_wifiScanQueue,
        v14->_wifiScanQueue = (OS_dispatch_queue *)v17,
        wifiScanQueue,
        v14->_wifiScanQueue))
  {
    objc_storeStrong((id *)&v13->_platform, a3);
    -[WifiScannerBackendProtocol setDelegate:](v14->_platform, "setDelegate:", v14);
    objc_initWeak(location, v14);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001B2D4;
    v24[3] = &unk_1004048E8;
    objc_copyWeak(&v25, location);
    v19 = objc_retainBlock(v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
    if (!v10)
    {
      v10 = -[DispatchMonotonicTimer initWithName:]([DispatchMonotonicTimer alloc], "initWithName:", CFSTR("com.apple.wifiscanner.timer"));
      if (!v10)
      {
        sub_1000D5048(location, "");
        sub_100174738((uint64_t)location, 0, 0);
        if (v29 < 0)
          operator delete(location[0]);
        sub_1000F2AE4((uint64_t)&__p);
      }
    }
    p_scanTimer = (id *)&v13->_scanTimer;
    objc_storeStrong(p_scanTimer, v10);
    -[MonotonicTimerProtocol setEventHandler:onQueue:](v14->_scanTimer, "setEventHandler:onQueue:", v19, v14->_wifiScanQueue);
    objc_msgSend(*p_scanTimer, "setDelay:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(*p_scanTimer, "setInterval:", 0x7FFFFFFFFFFFFFFFLL);
    v14->_scansInProgress = 0;
    v13 = v14;

  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
}

- (void)invalidate
{
  NSObject *v3;
  OS_dispatch_queue *wifiScanQueue;
  NewWifiScanner *v5;
  NSObject *v6;
  NewWifiScanner *v7;
  std::future<void> v8;
  std::promise<void> v9;
  __int128 buf;
  void (*v11)(uint64_t);
  void *v12;
  id *v13;
  std::promise<void> *v14;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: invalidate everything", (uint8_t *)&buf, 0xCu);
  }
LABEL_4:
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_wifiScanQueue);
  wifiScanQueue = self->_wifiScanQueue;
  v5 = self;
  v7 = v5;
  v6 = wifiScanQueue;
  std::promise<void>::promise(&v9);
  std::promise<void>::get_future(&v9);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v11 = sub_100037078;
  v12 = &unk_1003FC648;
  v13 = (id *)&v7;
  v14 = &v9;
  dispatch_sync(v6, &buf);
  std::future<void>::get(&v8);
  std::future<void>::~future(&v8);
  std::promise<void>::~promise(&v9);

  -[WifiScannerBackendProtocol invalidate](v5->_platform, "invalidate");
}

- (void)onQueueInvalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NewWifiScanner *v9;

  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v3 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    v8 = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "wifi scanner %p: invalidate timer", (uint8_t *)&v8, 0xCu);
  }
LABEL_4:
  if (self->_scansInProgress > 0 || !-[NewWifiScanner scanning](self, "scanning"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner scanTimer](self, "scanTimer"));
    objc_msgSend(v4, "setDelay:", 0x7FFFFFFFFFFFFFFFLL);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner scanTimer](self, "scanTimer"));
    objc_msgSend(v5, "setInterval:", 0x7FFFFFFFFFFFFFFFLL);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner scanTimer](self, "scanTimer"));
    objc_msgSend(v6, "resume");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner scanTimer](self, "scanTimer"));
  objc_msgSend(v7, "invalidate");

  -[NewWifiScanner setScanTimer:](self, "setScanTimer:", 0);
}

- (MonotonicTimerProtocol)scanTimer
{
  return self->_scanTimer;
}

- (void)setScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_scanTimer, a3);
}

- (void)onQueueScanAfter:(duration<long)long
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  int v8;
  int64_t v9;

  if (!-[NewWifiScanner scanning](self, "scanning"))
  {
    if (qword_100417ED8 == -1)
    {
      v5 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        return;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v5 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        return;
    }
    LOWORD(v8) = 0;
    v6 = "attempt to scan while stopped";
    goto LABEL_9;
  }
  if (self->_scansInProgress < 1)
  {
    if (qword_100417ED8 == -1)
    {
      v7 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      {
LABEL_13:
        -[MonotonicTimerProtocol setDelay:](self->_scanTimer, "setDelay:", a3.__rep_);
        -[MonotonicTimerProtocol resume](self->_scanTimer, "resume");
        return;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v7 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    v8 = 134217984;
    v9 = a3.__rep_ / 1000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Starting scan timer to run in %lldms", (uint8_t *)&v8, 0xCu);
    goto LABEL_13;
  }
  if (qword_100417ED8 == -1)
  {
    v5 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      LOWORD(v8) = 0;
      v6 = "not scheduling new scan while scan still in progress; next will schedule when previous one returns or fails";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v5 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
  }
}

- (void)onQueueHandleScanTimer
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  WifiScannerBackendProtocol *platform;
  WifiScannerSettings *scanSettings;
  NewWifiScanner *v11;
  id v12;
  id *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, int);
  void *v17;
  id *v18;
  id v19;
  uint8_t buf[4];
  NewWifiScanner *v21;

  if (-[NewWifiScanner scanning](self, "scanning"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[NewWifiScanner delegate](self, "delegate"));
    v4 = (void *)v3;
    if (v3)
    {
      if ((objc_opt_respondsToSelector(v3, "wifiScanInitiating") & 1) != 0)
        objc_msgSend(v4, "wifiScanInitiating");
      if (qword_100417ED8 == -1)
      {
        v5 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
          goto LABEL_8;
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100404988);
        v5 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        {
LABEL_8:
          if (!self->_scansInProgress)
          {
            platform = self->_platform;
            scanSettings = self->_scanSettings;
            v14 = _NSConcreteStackBlock;
            v15 = 3321888768;
            v16 = sub_10003659C;
            v17 = &unk_100404930;
            v11 = self;
            v12 = v4;
            v13 = v11;
            v18 = v13;
            v19 = v12;
            -[WifiScannerBackendProtocol scanAsync:initiated:](platform, "scanAsync:initiated:", scanSettings, &v14);

            ++self->_scansInProgress;
            objc_msgSend(v13[3], "pause", v14, v15, v16, v17);

            goto LABEL_20;
          }
          if (qword_100417ED8 == -1)
          {
            v6 = qword_100417EE0;
            if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
            {
LABEL_20:

              return;
            }
          }
          else
          {
            dispatch_once(&qword_100417ED8, &stru_100404988);
            v6 = qword_100417EE0;
            if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
              goto LABEL_20;
          }
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "scan already in progress, ignoring scan timer firing", buf, 2u);
          goto LABEL_20;
        }
      }
      *(_DWORD *)buf = 134217984;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "scan timer tick - %p requesting scan & pausing timer", buf, 0xCu);
      goto LABEL_8;
    }
    if (qword_100417ED8 == -1)
    {
      v8 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      {
LABEL_18:
        -[NewWifiScanner onQueueStopScanning](self, "onQueueStopScanning");
        goto LABEL_20;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v8 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "delegate disappeared while running - stopping scanning", buf, 2u);
    goto LABEL_18;
  }
  if (qword_100417ED8 == -1)
  {
    v7 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      return;
LABEL_14:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ignoring scan tick - scanning stopped", buf, 2u);
    return;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v7 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
    goto LABEL_14;
}

- (BOOL)scanning
{
  return self->_scanning;
}

- (void)wifiScanResult:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *wifiScanQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013360;
  block[3] = &unk_100404968;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(wifiScanQueue, block);

}

- (void)onQueueHandleScanFailed:(id)a3 forSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  NSObject *v23;
  int v26;
  _QWORD v27[2];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "cachedScan") & 1) != 0)
  {
    if (qword_100417ED8 == -1)
    {
      v19 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_6:

        goto LABEL_12;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v19 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    v26 = 67109120;
    LODWORD(v27[0]) = objc_msgSend(v6, "code");
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "cached scan failed with %d", (uint8_t *)&v26, 8u);
    goto LABEL_6;
  }
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v21 = (id)qword_100417EE0;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    goto LABEL_10;
  }
  v21 = (id)qword_100417EE0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
LABEL_10:
    v26 = 67109120;
    LODWORD(v27[0]) = objc_msgSend(v6, "code");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "our scan failed with %d", (uint8_t *)&v26, 8u);
  }
LABEL_11:

  --self->_scansInProgress;
LABEL_12:
  if (!-[NewWifiScanner scanning](self, "scanning"))
  {
    if (qword_100417ED8 == -1)
    {
      v9 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v9 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v26 = 138412290;
    v27[0] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "got an error: %@, but not scanning anymore", (uint8_t *)&v26, 0xCu);

    goto LABEL_38;
  }
  if (objc_msgSend(v6, "code") != (id)82)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "settings"));
    v12 = objc_msgSend(v11, "lowPriorityScan");

    if (v12)
    {
      if (qword_100417ED8 != -1)
      {
        dispatch_once(&qword_100417ED8, &stru_100404988);
        v23 = (id)qword_100417EE0;
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_30;
        goto LABEL_24;
      }
      v23 = (id)qword_100417EE0;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
LABEL_24:
        v13 = objc_msgSend(v6, "code");
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
        v26 = 67109378;
        LODWORD(v27[0]) = v13;
        WORD2(v27[0]) = 2112;
        *(_QWORD *)((char *)v27 + 6) = v14;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "WARNING: got an error (%d) initiating a scan: %@", (uint8_t *)&v26, 0x12u);

      }
LABEL_30:

      goto LABEL_31;
    }
    if (qword_100417ED8 == -1)
    {
      v23 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v23 = (id)qword_100417EE0;
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
    }
    v15 = objc_msgSend(v6, "code");
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v26 = 67109378;
    LODWORD(v27[0]) = v15;
    WORD2(v27[0]) = 2112;
    *(_QWORD *)((char *)v27 + 6) = v16;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "got an error (%d) initiating a scan: %@", (uint8_t *)&v26, 0x12u);

    goto LABEL_30;
  }
  if (qword_100417ED8 == -1)
  {
    v8 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_31;
    goto LABEL_16;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v8 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_16:
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "scan failed because wifi is powered off", (uint8_t *)&v26, 2u);
  }
LABEL_31:
  v17 = objc_claimAutoreleasedReturnValue(-[NewWifiScanner delegate](self, "delegate"));
  v9 = v17;
  if (!v17)
  {
    if (qword_100417ED8 == -1)
    {
      v18 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      {
LABEL_37:
        -[NewWifiScanner onQueueStopScanning](self, "onQueueStopScanning");
        goto LABEL_38;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v18 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_37;
    }
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "WARNING: got scan failure but delegate is nil - stopping", (uint8_t *)&v26, 2u);
    goto LABEL_37;
  }
  -[NSObject wifiScanFailed:](v17, "wifiScanFailed:", v7);
  if ((objc_msgSend(v7, "cachedScan") & 1) == 0)
    -[NewWifiScanner onQueueScheduleScanFromSettingsWithFailure:](self, "onQueueScheduleScanFromSettingsWithFailure:", 1);
LABEL_38:

}

- (void)onQueueHandleScan:(id)a3 forSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v15;
  NSObject *v17;
  int v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "cachedScan") & 1) == 0)
  {
    if (qword_100417ED8 == -1)
    {
      v15 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:
        --self->_scansInProgress;
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v15 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
        goto LABEL_10;
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Got completed scan from backend", (uint8_t *)&v19, 2u);
    goto LABEL_10;
  }
  if (qword_100417ED8 == -1)
  {
    v13 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_11;
    goto LABEL_5;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v13 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Got cached scan from backend", (uint8_t *)&v19, 2u);
  }
LABEL_11:
  if (v6)
    goto LABEL_16;
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v8 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    goto LABEL_14;
  }
  v8 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
  {
LABEL_14:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "unexpected nil result from scanning platform", (uint8_t *)&v19, 2u);
  }
LABEL_15:
  v6 = &__NSArray0__struct;
LABEL_16:
  if (-[NewWifiScanner scanning](self, "scanning"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner delegate](self, "delegate"));
    if (v9)
    {
      if (qword_100417ED8 != -1)
        dispatch_once(&qword_100417ED8, &stru_100404988);
      v10 = (id)qword_100417EE0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v6, "count");
        v19 = 134217984;
        v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "notifying delegate of %zu scan results", (uint8_t *)&v19, 0xCu);
      }

      objc_msgSend(v9, "wifiScanData:forSettings:", v6, v7);
      if ((objc_msgSend(v7, "cachedScan") & 1) == 0)
        -[NewWifiScanner onQueueScheduleScanFromSettingsWithFailure:](self, "onQueueScheduleScanFromSettingsWithFailure:", 0);
      goto LABEL_32;
    }
    if (qword_100417ED8 == -1)
    {
      v17 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      {
LABEL_31:
        -[NewWifiScanner onQueueStopScanning](self, "onQueueStopScanning");
LABEL_32:

        goto LABEL_33;
      }
    }
    else
    {
      dispatch_once(&qword_100417ED8, &stru_100404988);
      v17 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
        goto LABEL_31;
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "WARNING: got scan but delegate is nil - stopping", (uint8_t *)&v19, 2u);
    goto LABEL_31;
  }
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v12 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_33;
    goto LABEL_26;
  }
  v12 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_26:
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "got a scan result but no longer scanning", (uint8_t *)&v19, 2u);
  }
LABEL_33:

}

- (void)onQueueScheduleScanFromSettingsWithFailure:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  id v7;
  duration<long long, std::ratio<1, 1000>> v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  duration<long long, std::ratio<1, 1000>> v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  double v19;

  v3 = a3;
  if (qword_100417ED8 == -1)
  {
    v5 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417ED8, &stru_100404988);
  v5 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "scheduling next scan", (uint8_t *)&v18, 2u);
  }
LABEL_4:
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WifiScannerSettings channels](self->_scanSettings, "channels"));
    v7 = objc_msgSend(v6, "count");
    v8.__rep_ = (int64_t)-[WifiScannerSettings dwell](self->_scanSettings, "dwell");

    v9 = 1000000 * (_QWORD)v7 * v8.__rep_;
  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NewWifiScanner delegate](self, "delegate"));
  objc_msgSend(v10, "updateWifiSettingsForNextScan:", self->_scanSettings);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[WifiScannerSettings channels](self->_scanSettings, "channels"));
  v12 = objc_msgSend(v11, "count");
  v13.__rep_ = (int64_t)-[WifiScannerSettings dwell](self->_scanSettings, "dwell");
  -[WifiScannerSettings dutyCycle](self->_scanSettings, "dutyCycle");
  v15 = sub_100055AEC(v13.__rep_ * (_QWORD)v12, v14);

  v16 = v15 + v9;
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_100404988);
    v17 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    goto LABEL_9;
  }
  v17 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    v18 = 134217984;
    v19 = (double)v16 / 1000000.0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "scheduling another scan in %lf ms", (uint8_t *)&v18, 0xCu);
  }
LABEL_10:
  -[NewWifiScanner onQueueScanAfter:](self, "onQueueScanAfter:", v16);

}

- (WifiScannerDelegateProtocol)delegate
{
  return (WifiScannerDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)stopScanning
{
  NSObject *wifiScanQueue;
  _QWORD block[5];

  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDB10;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_sync(wifiScanQueue, block);
}

- (void)startScanning
{
  NSObject *wifiScanQueue;
  _QWORD block[5];

  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BDAAC;
  block[3] = &unk_1003EE788;
  block[4] = self;
  dispatch_sync(wifiScanQueue, block);
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

+ (duration<long)expectedScanDuration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "dwell");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "channels"));
  v6 = 1000000 * (_QWORD)v4 * (_QWORD)objc_msgSend(v5, "count");

  return (duration<long long, std::ratio<1, 1000000000>>)v6;
}

- (void)wifiCachedScanResult:(id)a3 withSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *wifiScanQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  wifiScanQueue = self->_wifiScanQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F0794;
  block[3] = &unk_100404968;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(wifiScanQueue, block);

}

- (OS_dispatch_queue)wifiScanQueue
{
  return self->_wifiScanQueue;
}

- (void)setWifiScanQueue:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanQueue, a3);
}

@end
