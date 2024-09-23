@implementation SignalMonitor

+ (id)sharedInstance
{
  if (qword_10001BEA8 != -1)
    dispatch_once(&qword_10001BEA8, &stru_100014758);
  return (id)qword_10001BEA0;
}

- (SignalMonitor)init
{
  SignalMonitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  os_log_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SignalMonitor;
  v2 = -[SignalMonitor init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.powerexperieced.signalmonitor", v4);
    -[SignalMonitor setQueue:](v2, "setQueue:", v5);

    v6 = os_log_create("com.apple.powerexperienced", "signalMonitor");
    v7 = (void *)qword_10001BEB0;
    qword_10001BEB0 = (uint64_t)v6;

  }
  return v2;
}

- (void)initializeMonitors
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[SignalMonitor initNFCHandling](self, "initNFCHandling");
  -[SignalMonitor initAudioHandling](self, "initAudioHandling");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  v4 = +[CameraMonitor monitorWithQueue:](CameraMonitor, "monitorWithQueue:", v3);

  v5 = qword_10001BEB0;
  if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initialized signal monitors", v6, 2u);
  }
}

- (void)handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SignalMonitor *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009D18;
  v7[3] = &unk_100014520;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)initAudioHandling
{
  if (notify_register_check("com.apple.coreaudio.IORunning", &dword_10001BEB8))
  {
    if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR))
      sub_10000D2B0();
  }
}

- (void)handleAudioSession
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v14;

  v3 = objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  state64 = 0;
  if (!notify_get_state(dword_10001BEB8, &state64))
  {
    if (state64)
    {
      -[SignalMonitor setAudioActive:](self, "setAudioActive:", 1);
      v4 = qword_10001BEB0;
      if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = state64;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Audio playback started current_state %llu. Creating a resource hint", buf, 0xCu);
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));

      if (!v5)
      {
        v11 = objc_msgSend(objc_alloc((Class)ResourceHint), "initWithResourceType:andState:", 5, 1);
        -[SignalMonitor setAudioResourceHint:](self, "setAudioResourceHint:", v11);

        return;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));
      v7 = v6;
      v8 = 1;
    }
    else
    {
      -[SignalMonitor setAudioActive:](self, "setAudioActive:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));

      if (!v9)
        return;
      v10 = qword_10001BEB0;
      if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Audio playback stopped. Dropping a resource hint", buf, 2u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor audioResourceHint](self, "audioResourceHint"));
      v7 = v6;
      v8 = 0;
    }
    objc_msgSend(v6, "updateState:", v8);

    return;
  }
  if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR))
    sub_10000D2DC();
}

- (void)initNFCHandling
{
  if (notify_register_check("com.apple.request.hipuncap", &dword_10001BEBC))
  {
    if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR))
      sub_10000D308();
  }
}

- (void)handleNFCSession
{
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t state64;

  v3 = objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  state64 = 0;
  if (!notify_get_state(dword_10001BEBC, &state64))
  {
    if (state64 && !-[SignalMonitor nfcActive](self, "nfcActive"))
    {
      -[SignalMonitor setNfcActive:](self, "setNfcActive:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignalMonitor nfcResourceHint](self, "nfcResourceHint"));

      if (v4)
      {
        v5 = (id)objc_claimAutoreleasedReturnValue(-[SignalMonitor nfcResourceHint](self, "nfcResourceHint"));
        objc_msgSend(v5, "updateState:", 1);
      }
      else
      {
        v6 = qword_10001BEB0;
        if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NFC session started. Creating a resource hint", buf, 2u);
        }
        v5 = objc_msgSend(objc_alloc((Class)ResourceHint), "initWithResourceType:andState:", 4, 1);
        -[SignalMonitor setNfcResourceHint:](self, "setNfcResourceHint:", v5);
      }

      v7 = dispatch_time(0, 5000000000);
      v8 = objc_claimAutoreleasedReturnValue(-[SignalMonitor queue](self, "queue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A1C4;
      block[3] = &unk_1000145C0;
      block[4] = self;
      dispatch_after(v7, v8, block);

    }
    else if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR))
    {
      sub_10000D334();
    }
  }
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)audioActive
{
  return self->_audioActive;
}

- (void)setAudioActive:(BOOL)a3
{
  self->_audioActive = a3;
}

- (BOOL)nfcActive
{
  return self->_nfcActive;
}

- (void)setNfcActive:(BOOL)a3
{
  self->_nfcActive = a3;
}

- (ResourceHint)audioResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAudioResourceHint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (ResourceHint)nfcResourceHint
{
  return (ResourceHint *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNfcResourceHint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (OS_os_transaction)nfcTransaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNfcTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nfcTransaction, 0);
  objc_storeStrong((id *)&self->_nfcResourceHint, 0);
  objc_storeStrong((id *)&self->_audioResourceHint, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
