@implementation DoAPSoundSensorRemoteDevice

- (DoAPSoundSensorRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4;
  id v7;
  DoAPSoundSensorRemoteDevice *v8;
  DoAPSoundSensorRemoteDevice *v9;
  NSMutableArray *v10;
  NSMutableArray *audioBuffer;
  dispatch_group_t v12;
  OS_dispatch_group *groupStart;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *doapAudioStart;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *queue;
  NSObject *v18;
  DoAPSoundSensorRemoteDevice *v19;
  OS_dispatch_semaphore *v20;
  OS_dispatch_group *v21;
  objc_super v23;

  v4 = a4;
  v7 = a3;
  if (v4 == 2)
  {
    v23.receiver = self;
    v23.super_class = (Class)DoAPSoundSensorRemoteDevice;
    v8 = -[DoAPDevice initWithCodecs:streamID:](&v23, "initWithCodecs:streamID:", v7, 2);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_codecs, a3);
      v9->_vtEvent = 0;
      v9->_vtSource = 0;
      v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      audioBuffer = v9->_audioBuffer;
      v9->_audioBuffer = v10;

      v12 = dispatch_group_create();
      groupStart = v9->_groupStart;
      v9->_groupStart = (OS_dispatch_group *)v12;

      if (v9->_groupStart)
      {
        v14 = dispatch_semaphore_create(1);
        doapAudioStart = v9->_doapAudioStart;
        v9->_doapAudioStart = (OS_dispatch_semaphore *)v14;

        if (v9->_doapAudioStart)
        {
          v16 = -[DoAPDevice allocQueue](v9, "allocQueue");
          queue = v9->_queue;
          v9->_queue = v16;

          v18 = v9->_queue;
          if (v18)
          {
            dispatch_set_context(v18, v9);
            dispatch_set_finalizer_f((dispatch_object_t)v9->_queue, (dispatch_function_t)j__objc_msgSend_notifyDidStop_0);
            goto LABEL_11;
          }
          v20 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0;

        }
        v21 = v9->_groupStart;
        v9->_groupStart = 0;

      }
      v9 = 0;
    }
LABEL_11:
    self = v9;
    v19 = self;
    goto LABEL_12;
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  objc_super v11;
  uint8_t buf[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop DoAPSoundSensorRemoteDevice - Destroy DoAPAudioRelay", buf, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    objc_msgSend(v8, "invalidate");

    -[DoAPSoundSensorRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", 0);
  }
  v11.receiver = self;
  v11.super_class = (Class)DoAPSoundSensorRemoteDevice;
  -[DoAPDevice stop](&v11, "stop");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000472DC;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v27;
  NSObject *groupStart;
  NSObject *queue;
  NSObject *v30;
  dispatch_queue_global_t global_queue;
  NSObject *v32;
  _QWORD v33[5];
  _QWORD block[6];
  unsigned __int8 v35;
  unsigned __int8 v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  uint8_t buf[4];
  int v46;
  _BYTE v47[128];

  v44.receiver = self;
  v44.super_class = (Class)DoAPSoundSensorRemoteDevice;
  -[DoAPDevice start](&v44, "start");
  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start DoAPSoundSensorRemoteDevice - Create DoAPAudioRelay", buf, 2u);
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice codecs](self, "codecs"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i), "codec");
          if (v37 == 7)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "UUIDString"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v20, CFSTR("DoAP Sound Sensor")));

            v22 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](DoAPAudioRelayHub, "instance"));
            objc_msgSend(v9, "codec");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "relayWithIdentifier:deviceType:properties:codecType:", v21, 4, 0, v36));
            -[DoAPSoundSensorRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", v23);

            v24 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
            objc_msgSend(v24, "setDelegate:", self);

            v25 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v27 = v25;
              objc_msgSend(v9, "codec");
              *(_DWORD *)buf = 67109120;
              v46 = v35;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Start DoAPSoundSensorRemoteDevice - Send SelectCodec(%u) msg", buf, 8u);

            }
            groupStart = self->_groupStart;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100047714;
            block[3] = &unk_1000AD740;
            block[4] = self;
            block[5] = v9;
            dispatch_group_async(groupStart, queue, block);
            v30 = self->_groupStart;
            global_queue = dispatch_get_global_queue(21, 0);
            v32 = objc_claimAutoreleasedReturnValue(global_queue);
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_100047760;
            v33[3] = &unk_1000AD230;
            v33[4] = self;
            dispatch_group_async(v30, v32, v33);

            return;
          }
        }
        else
        {
          v37 = 0;
          v38 = 0;
          v39 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006F61C(v10, v11, v12, v13, v14, v15, v16, v17);
}

- (int)selectCodec:(unsigned __int8)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return -[DoAPDevice selectCodec:](&v4, "selectCodec:", a3);
}

- (int)startStreaming
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DoAPSoundSensorRemoteDevice;
  v3 = -[DoAPDevice startStreaming](&v12, "startStreaming");
  if ((_DWORD)v3)
  {
    v4 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006F64C(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  else
  {
    self->_vtEvent = 1;
    self->_vtSource = 3;
  }
  return v3;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DoAPSoundSensorRemoteDevice;
  return -[DoAPDevice stopStreaming:](&v4, "stopStreaming:", a3);
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DoAPSoundSensorRemoteDevice;
  v4 = -[DoAPDevice eventIndicator:eventValue:](&v13, "eventIndicator:eventValue:", a3, a4);
  if ((_DWORD)v4)
  {
    v5 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10006F6B0(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v4;
}

- (void)clearEvent
{
  self->_vtEvent = 0;
  self->_vtSource = 0;
}

- (void)clearState
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  DoAPSoundSensorRemoteDevice *v7;
  void *v8;
  DoAPSoundSensorRemoteDevice *obj;

  if (-[DoAPDevice state](self, "state") == 5)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v3);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v5);

    -[DoAPSoundSensorRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](self, "audioBuffer"));

  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v7, "audioBuffer"));
    objc_msgSend(v8, "removeAllObjects");

    objc_sync_exit(v7);
  }
  obj = self;
  objc_sync_enter(obj);
  -[DoAPSoundSensorRemoteDevice clearEvent](obj, "clearEvent");
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 2);
  objc_sync_exit(obj);

}

- (void)activateSoundSensorClient
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = 138477827;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - activateSoundSensorClient: ** TBD ** for ID %{private}@", (uint8_t *)&v8, 0xCu);

  }
  -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 1, &off_1000B36A8);
}

- (void)cancelSoundSensorClient
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    v8 = 138412290;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - cancelSoundSensorClient - id \"%@\", (uint8_t *)&v8, 0xCu);

  }
}

- (void)handleStartStreaming
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensorRemoteDevice received StartStreaming", v3, 2u);
  }
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensorRemoteDevice Received StopStreaming with error code%d", (uint8_t *)v7, 8u);
  }
  if (-[DoAPDevice state](self, "state") == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    objc_msgSend(v6, "cancelStream");

  }
  -[DoAPSoundSensorRemoteDevice clearState](self, "clearState");
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  DoAPSoundSensorRemoteDevice *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[DoAPDevice state](self, "state") <= 6 && a3 && a4 >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[DoAPSoundSensorRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
    if (-[DoAPDevice state](self, "state") == 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      v10 = objc_msgSend(v9, "isHubConnected");

      if (!v10)
      {
        v14 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10006F714(v14, v15, v16, v17, v18, v19, v20, v21);
        goto LABEL_15;
      }
      v11 = (DoAPSoundSensorRemoteDevice *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      -[DoAPSoundSensorRemoteDevice sendAudioFrame:](v11, "sendAudioFrame:", v8);
    }
    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        v22 = -[DoAPDevice state](self, "state");
        v23 = qword_1000C9178;
        v24 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
        if (v22 == 2)
        {
          if (v24)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }
          -[DoAPSoundSensorRemoteDevice stopStreaming:](self, "stopStreaming:", 6);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100047FD0;
          block[3] = &unk_1000AD230;
          block[4] = self;
          dispatch_async(queue, block);
        }
        else if (v24)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DoAPSoundSensor - Audio data ignored", buf, 2u);
        }
        goto LABEL_15;
      }
      v11 = self;
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v11, "audioBuffer"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSoundSensorRemoteDevice audioBuffer](v11, "audioBuffer"));
        objc_msgSend(v13, "addObject:", v8);

      }
      objc_sync_exit(v11);
    }

LABEL_15:
  }
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((a3 - 3) >= 3 && a3 != 1)
  {
    v5 = a3;
    if (a3 == 2)
    {
      v6 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006F7A8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    else
    {
      v14 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10006F744(v5, v14, v15, v16, v17, v18, v19, v20);
    }
  }
}

- (DoAPAudioRelay)doapAudioRelay
{
  return self->_doapAudioRelay;
}

- (void)setDoapAudioRelay:(id)a3
{
  objc_storeStrong((id *)&self->_doapAudioRelay, a3);
}

- (NSDate)lastAudioDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastAudioDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDoapAudioStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDoapAudioStop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAudioBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)codecs
{
  return self->_codecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codecs, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_doapAudioStop, 0);
  objc_storeStrong((id *)&self->_doapAudioStart, 0);
  objc_storeStrong((id *)&self->_lastAudioDate, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
