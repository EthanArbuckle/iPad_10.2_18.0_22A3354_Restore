@implementation GenericSiriRemoteListener

+ (id)instance
{
  if (qword_1000C9040 != -1)
    dispatch_once(&qword_1000C9040, &stru_1000AD570);
  return (id)qword_1000C9038;
}

- (void)dealloc
{
  HIDManager *hidManager;
  OS_dispatch_queue *eventQueue;
  objc_super v5;

  hidManager = self->_hidManager;
  if (hidManager)
  {
    -[HIDManager cancel](hidManager, "cancel");
    -[HIDManager close](self->_hidManager, "close");
  }
  eventQueue = self->_eventQueue;
  self->_eventQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)GenericSiriRemoteListener;
  -[GenericSiriRemoteListener dealloc](&v5, "dealloc");
}

- (void)setUpHidHandlers
{
  HIDManager *hidManager;
  HIDManager *v4;
  _QWORD v5[5];
  _QWORD v6[5];

  -[HIDManager setInputElementMatching:](self->_hidManager, "setInputElementMatching:", &off_1000B3C30);
  hidManager = self->_hidManager;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018B54;
  v6[3] = &unk_1000AD598;
  v6[4] = self;
  -[HIDManager setInputElementHandler:](hidManager, "setInputElementHandler:", v6);
  -[HIDManager setDeviceMatching:](self->_hidManager, "setDeviceMatching:", &off_1000B3C80);
  v4 = self->_hidManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018B98;
  v5[3] = &unk_1000AD5C0;
  v5[4] = self;
  -[HIDManager setDeviceNotificationHandler:](v4, "setDeviceNotificationHandler:", v5);
  -[HIDManager setDispatchQueue:](self->_hidManager, "setDispatchQueue:", self->_eventQueue);
  -[HIDManager open](self->_hidManager, "open");
  -[HIDManager activate](self->_hidManager, "activate");
}

- (id)allocHIDQueue
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  uint64_t v5;
  NSString *v6;
  id v7;
  dispatch_queue_t v8;

  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.%@"), objc_opt_class(self, v5));
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v6));
  v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), v4);

  return v8;
}

- (GenericSiriRemoteListener)init
{
  GenericSiriRemoteListener *v2;
  NSMutableArray *v3;
  NSMutableArray *audioBuffer;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *doapAudioStart;
  HIDManager *v7;
  HIDManager *hidManager;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *eventQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GenericSiriRemoteListener;
  v2 = -[GenericSiriRemoteListener init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    audioBuffer = v2->_audioBuffer;
    v2->_audioBuffer = v3;

    v5 = dispatch_semaphore_create(1);
    doapAudioStart = v2->_doapAudioStart;
    v2->_doapAudioStart = (OS_dispatch_semaphore *)v5;

    v7 = (HIDManager *)objc_alloc_init((Class)HIDManager);
    hidManager = v2->_hidManager;
    v2->_hidManager = v7;

    v9 = -[GenericSiriRemoteListener allocHIDQueue](v2, "allocHIDQueue");
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = v9;

  }
  return v2;
}

- (void)handleAudioData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  GenericSiriRemoteListener *v16;
  uint64_t v17;
  void *v18;
  GenericSiriRemoteListener *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD v34[4];
  GenericSiriRemoteListener *v35;
  uint64_t v36;

  v4 = a3;
  v5 = (uint64_t)objc_msgSend(v4, "length");
  v36 = 0;
  if (v5 <= 3)
  {
    v6 = v5;
    v7 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006B2D8(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_22;
  }
  objc_msgSend(v4, "getBytes:range:", &v36, 4, 1);
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
    goto LABEL_22;
  if (v4 && v36)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[GenericSiriRemoteListener setLastAudioDate:](self, "setLastAudioDate:", v15);

    v16 = (GenericSiriRemoteListener *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v4));
    if (objc_opt_class(SLGLog, v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001914C;
      v34[3] = &unk_1000AD280;
      v35 = v16;
      objc_msgSend(v18, "logBlock:", v34);

    }
    v19 = self;
    objc_sync_enter(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v19, "audioBuffer"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v19, "audioBuffer"));
      objc_msgSend(v21, "addObject:", v16);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioRelay](v19, "doapAudioRelay"));
      objc_msgSend(v21, "sendAudioFrame:", v16);
    }

    objc_sync_exit(v19);
LABEL_21:

    goto LABEL_22;
  }
  if (!v36)
  {
    if (objc_opt_class(SLGLog, v14))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SLGLog sharedInstance](SLGLog, "sharedInstance"));
      objc_msgSend(v30, "logBlock:", &stru_1000AD5E0);

    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));

    if (v31)
    {
      v32 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));
      dispatch_semaphore_signal(v32);

    }
    v16 = self;
    objc_sync_enter(v16);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener audioBuffer](v16, "audioBuffer"));
    objc_msgSend(v33, "removeAllObjects");

    objc_sync_exit(v16);
    goto LABEL_21;
  }
  v22 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006B340(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_22:

}

- (void)doapAudioWillStart:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *eventQueue;
  _QWORD block[5];
  void (**v10)(id, void *);
  NSErrorUserInfoKey v11;
  void *v12;

  v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GenericSiriRemote stopped (disconnected)")));
    v11 = NSLocalizedDescriptionKey;
    v12 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    v4[2](v4, v7);
  }
  else
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019358;
    block[3] = &unk_1000AD608;
    block[4] = self;
    v10 = v4;
    dispatch_async(eventQueue, block);

  }
}

- (void)waitForSiriAudioToStop:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  double v23;
  NSObject *eventQueue;
  void *v25;
  NSObject *v26;
  void *v27;
  double v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  GenericSiriRemoteListener *v40;
  id v41;
  NSObject *v42;
  GenericSiriRemoteListener *v43;
  id v44;
  _QWORD v45[5];
  void (**v46)(id, void *);
  NSErrorUserInfoKey v47;
  const __CFString *v48;
  uint8_t buf[4];
  double v50;
  NSErrorUserInfoKey v51;
  void *v52;

  v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GenericSiriRemote stopped (disconnected)")));
    v51 = NSLocalizedDescriptionKey;
    v52 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    v4[2](v4, v7);
    v8 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

    goto LABEL_18;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
  objc_msgSend(v9, "timeIntervalSinceNow");
  v11 = fabs(v10);

  if (v11 >= 0.105)
  {
    v25 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
      objc_msgSend(v27, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      v50 = fabs(v28) * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);

    }
    goto LABEL_17;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
    objc_msgSend(v13, "timeIntervalSinceNow");
    v15 = v14;

    v16 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStop](self, "doapAudioStop"));
    v17 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v15 + 0.105) * 1000.0));
    v18 = dispatch_semaphore_wait(v16, v17);

    v19 = qword_1000C9178;
    v20 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener lastAudioDate](self, "lastAudioDate"));
        objc_msgSend(v22, "timeIntervalSinceNow");
        *(_DWORD *)buf = 134217984;
        v50 = fabs(v23) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Received Siri audio data %f ms ago.", buf, 0xCu);

      }
      eventQueue = self->_eventQueue;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100019C9C;
      v45[3] = &unk_1000AD608;
      v45[4] = self;
      v46 = v4;
      dispatch_async(eventQueue, v45);

      goto LABEL_18;
    }
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received empty audio input report. Stop Siri session.", buf, 2u);
    }
LABEL_17:
    -[GenericSiriRemoteListener setDoapAudioStop:](self, "setDoapAudioStop:", 0);
    v4[2](v4, 0);
    v42 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v42);

    v43 = self;
    objc_sync_enter(v43);
    v44 = objc_alloc_init((Class)NSMutableArray);
    -[GenericSiriRemoteListener setAudioBuffer:](v43, "setAudioBuffer:", v44);

    objc_sync_exit(v43);
    goto LABEL_18;
  }
  v29 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006B3E0(v29, v30, v31, v32, v33, v34, v35, v36);
  v47 = NSLocalizedDescriptionKey;
  v48 = CFSTR("No doapAudioStop semaphore");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870165, v37));

  v4[2](v4, v38);
  v39 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v39);

  v40 = self;
  objc_sync_enter(v40);
  v41 = objc_alloc_init((Class)NSMutableArray);
  -[GenericSiriRemoteListener setAudioBuffer:](v40, "setAudioBuffer:", v41);

  objc_sync_exit(v40);
LABEL_18:

}

- (void)doapAudioDidStop:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *eventQueue;
  _QWORD block[5];
  void (**v11)(id, void *);
  NSErrorUserInfoKey v12;
  void *v13;

  v4 = (void (**)(id, void *))a3;
  if (-[GenericSiriRemoteListener state](self, "state") == 4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("GenericSiriRemote stopped (disconnected)")));
    v12 = NSLocalizedDescriptionKey;
    v13 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870185, v6));

    v4[2](v4, v7);
    v8 = objc_claimAutoreleasedReturnValue(-[GenericSiriRemoteListener doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v8);

  }
  else
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019E2C;
    block[3] = &unk_1000AD608;
    block[4] = self;
    v11 = v4;
    dispatch_async(eventQueue, block);

  }
}

- (HIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(id)a3
{
  objc_storeStrong((id *)&self->_hidManager, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
  objc_storeStrong((id *)&self->_doapAudioRelay, a3);
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDoapAudioStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDoapAudioStop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAudioBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastAudioDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_hidManager, 0);
}

@end
