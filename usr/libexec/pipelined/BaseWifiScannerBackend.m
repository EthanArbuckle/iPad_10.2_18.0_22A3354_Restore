@implementation BaseWifiScannerBackend

- (BaseWifiScannerBackend)init
{
  BaseWifiScannerBackend *v2;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  unint64_t v7;
  objc_super v9;
  uint8_t buf[4];
  unint64_t v11;

  v9.receiver = self;
  v9.super_class = (Class)BaseWifiScannerBackend;
  v2 = -[BaseWifiScannerBackend init](&v9, "init");
  if (byte_100417F28)
  {
    if (atomic_load((unint64_t *)&unk_10041A330))
    {
      if (qword_100417ED8 == -1)
      {
        v4 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
        goto LABEL_5;
      }
      dispatch_once(&qword_100417ED8, &stru_1004049D0);
      v4 = qword_100417EE0;
      if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_FAULT))
      {
LABEL_5:
        v5 = atomic_load((unint64_t *)&unk_10041A330);
        *(_DWORD *)buf = 134217984;
        v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "@BaseWifiScannerBackend, init, abort_if_wifi_backend_live, gHasScannerBackend, %lu, possible leak?", buf, 0xCu);
      }
    }
  }
LABEL_6:
  atomic_store((unint64_t)v2, (unint64_t *)&unk_10041A330);
  if (qword_100417ED8 != -1)
  {
    dispatch_once(&qword_100417ED8, &stru_1004049D0);
    v6 = qword_100417EE0;
    if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
      return v2;
    goto LABEL_8;
  }
  v6 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT))
  {
LABEL_8:
    v7 = atomic_load((unint64_t *)&unk_10041A330);
    *(_DWORD *)buf = 134217984;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "@BaseWifiScannerBackend, init, gHasScannerBackend, %lu", buf, 0xCu);
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v6;
  unint64_t v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;

  -[BaseWifiScannerBackend invalidate](self, "invalidate");
  if (qword_100417ED8 != -1)
    dispatch_once(&qword_100417ED8, &stru_1004049D0);
  v3 = qword_100417EE0;
  if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_INFO))
  {
    v4 = atomic_load((unint64_t *)&unk_10041A330);
    *(_DWORD *)buf = 134217984;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@BaseWifiScannerBackend, dealloc, releasing backend, gHasScannerBackend, %lu", buf, 0xCu);
  }
  atomic_store(0, (unint64_t *)&unk_10041A330);
  if (atomic_load((unint64_t *)&unk_10041A330))
  {
    if (qword_100417ED8 != -1)
    {
      dispatch_once(&qword_100417ED8, &stru_1004049D0);
      v6 = qword_100417EE0;
      if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        goto LABEL_9;
      goto LABEL_8;
    }
    v6 = qword_100417EE0;
    if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
    {
LABEL_8:
      v7 = atomic_load((unint64_t *)&unk_10041A330);
      *(_DWORD *)buf = 134217984;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "@BaseWifiScannerBackend, dealloc, failed to release backend, gHasScannerBackend, %lu", buf, 0xCu);
    }
  }
LABEL_9:
  v8.receiver = self;
  v8.super_class = (Class)BaseWifiScannerBackend;
  -[BaseWifiScannerBackend dealloc](&v8, "dealloc");
}

- (WifiScannerBackendDelegateProtocol)delegate
{
  return (WifiScannerBackendDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (LoggerProtocol)log
{
  return self->_log;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)sensorPresent
{
  -[BaseWifiScannerBackend doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)stopListeningCachedScans
{
  -[BaseWifiScannerBackend doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)startListeningCachedScans
{
  -[BaseWifiScannerBackend doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)scanAsync:(id)a3 initiated:(id)a4
{
  -[BaseWifiScannerBackend doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)invalidate
{
  -[BaseWifiScannerBackend doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

@end
