@implementation DoAPSiriRemoteDevice

- (DoAPSiriRemoteDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4;
  id v7;
  DoAPSiriRemoteDevice *v8;
  DoAPSiriRemoteDevice *v9;
  NSMutableArray *v10;
  NSMutableArray *audioBuffer;
  dispatch_group_t v12;
  OS_dispatch_group *groupStart;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *doapAudioStart;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *queue;
  NSObject *v18;
  id v19;
  id v20;
  AFNotifyObserver *v21;
  AFNotifyObserver *notifyObserver;
  DoAPSiriRemoteDevice *v23;
  OS_dispatch_semaphore *v24;
  OS_dispatch_group *v25;
  objc_super v27;

  v4 = a4;
  v7 = a3;
  if (v4 == 1)
  {
    v27.receiver = self;
    v27.super_class = (Class)DoAPSiriRemoteDevice;
    v8 = -[DoAPDevice initWithCodecs:streamID:](&v27, "initWithCodecs:streamID:", v7, 1);
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
            dispatch_set_finalizer_f((dispatch_object_t)v9->_queue, (dispatch_function_t)j__objc_msgSend_notifyDidStop_1);
            v19 = objc_alloc((Class)AFNotifyObserver);
            v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", "com.apple.siri.client-state-changed");
            v21 = (AFNotifyObserver *)objc_msgSend(v19, "initWithName:options:queue:delegate:", v20, 1, &_dispatch_main_q, v9);
            notifyObserver = v9->_notifyObserver;
            v9->_notifyObserver = v21;

            v9->_siriState = 0;
            goto LABEL_11;
          }
          v24 = v9->_doapAudioStart;
          v9->_doapAudioStart = 0;

        }
        v25 = v9->_groupStart;
        v9->_groupStart = 0;

      }
      v9 = 0;
    }
LABEL_11:
    self = v9;
    v23 = self;
    goto LABEL_12;
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  AFNotifyObserver *notifyObserver;
  NSObject *queue;
  _QWORD block[5];
  objc_super v12;
  uint8_t buf[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stop DoAPSiriRemoteDevice - Destroy DoAPAudioRelay", buf, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
  dispatch_semaphore_signal(v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    objc_msgSend(v8, "invalidate");

    -[DoAPSiriRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", 0);
  }
  -[AFNotifyObserver invalidate](self->_notifyObserver, "invalidate");
  notifyObserver = self->_notifyObserver;
  self->_notifyObserver = 0;

  v12.receiver = self;
  v12.super_class = (Class)DoAPSiriRemoteDevice;
  -[DoAPDevice stop](&v12, "stop");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100054AE8;
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *groupStart;
  NSObject *queue;
  NSObject *v22;
  dispatch_queue_global_t global_queue;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[6];
  unsigned __int8 v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  uint8_t buf[4];
  int v38;
  _BYTE v39[128];

  v36.receiver = self;
  v36.super_class = (Class)DoAPSiriRemoteDevice;
  -[DoAPDevice start](&v36, "start");
  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Start DoAPSiriRemoteDevice - Create DoAPAudioRelay", buf, 2u);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice codecs](self, "codecs"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        if (v9)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "codec");
          if (v29 == 7)
          {
            if (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP"))
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v13, CFSTR("DoAP Siri")));

            }
            else
            {
              v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
              v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
            }

            v15 = (void *)objc_claimAutoreleasedReturnValue(+[DoAPAudioRelayHub instance](DoAPAudioRelayHub, "instance"));
            objc_msgSend(v9, "codec");
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relayWithIdentifier:deviceType:properties:codecType:", v14, 3, 0, v28));
            -[DoAPSiriRemoteDevice setDoapAudioRelay:](self, "setDoapAudioRelay:", v16);

            v17 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
            objc_msgSend(v17, "setDelegate:", self);

            v18 = (void *)qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              v19 = v18;
              objc_msgSend(v9, "codec");
              *(_DWORD *)buf = 67109120;
              v38 = v27;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Start DoAPSiriRemoteDevice - Send SelectCodec(%u) msg", buf, 8u);

            }
            groupStart = self->_groupStart;
            queue = self->_queue;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100054F64;
            block[3] = &unk_1000AD740;
            block[4] = self;
            block[5] = v9;
            dispatch_group_async(groupStart, queue, block);
            v22 = self->_groupStart;
            global_queue = dispatch_get_global_queue(21, 0);
            v24 = objc_claimAutoreleasedReturnValue(global_queue);
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100054FB0;
            v25[3] = &unk_1000AD230;
            v25[4] = self;
            dispatch_group_async(v22, v24, v25);

            return;
          }
        }
        else
        {
          v29 = 0;
          v30 = 0;
          v31 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000710F0();
}

- (int)selectCodec:(unsigned __int8)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DoAPSiriRemoteDevice;
  return -[DoAPDevice selectCodec:](&v4, "selectCodec:", a3);
}

- (int)startStreaming
{
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DoAPSiriRemoteDevice;
  v3 = -[DoAPDevice startStreaming](&v5, "startStreaming");
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_10007111C();
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
  v4.super_class = (Class)DoAPSiriRemoteDevice;
  return -[DoAPDevice stopStreaming:](&v4, "stopStreaming:", a3);
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DoAPSiriRemoteDevice;
  v4 = -[DoAPDevice eventIndicator:eventValue:](&v6, "eventIndicator:eventValue:", a3, a4);
  if (v4 && os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_100071180();
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
  DoAPSiriRemoteDevice *v7;
  void *v8;
  DoAPSiriRemoteDevice *obj;

  if (-[DoAPDevice state](self, "state") == 5)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
    dispatch_semaphore_signal(v3);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
    dispatch_semaphore_signal(v5);

    -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));

  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v7, "audioBuffer"));
    objc_msgSend(v8, "removeAllObjects");

    objc_sync_exit(v7);
  }
  obj = self;
  objc_sync_enter(obj);
  -[DoAPSiriRemoteDevice clearEvent](obj, "clearEvent");
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 2);
  objc_sync_exit(obj);

}

- (void)activateSiri:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  int64_t v23;
  __int16 v24;
  void *v25;

  v5 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    *(_DWORD *)buf = 134218243;
    v23 = a3;
    v24 = 2113;
    v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri - activateSiri: Event %tu for ID %{private}@", buf, 0x16u);

  }
  if ((unint64_t)(a3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 1, &off_1000B3798);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10005553C;
    v19[3] = &unk_1000AE208;
    v19[4] = self;
    v10 = objc_retainBlock(v19);
    if (a3 == 1)
    {
      v15 = -[DoAPDevice state](self, "state") != 5;
      v16 = mach_absolute_time();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
      v20[0] = AFSiriActivationUserInfoKey[0];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v15));
      v20[1] = AFSiriActivationUserInfoKey[9];
      v21[0] = v17;
      v21[1] = &__kCFBooleanFalse;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      AFSiriActivationBluetoothDeviceDoubleTap(v16, v14, v18, v10);

    }
    else
    {
      if (a3 != 2)
      {
LABEL_11:

        return;
      }
      v11 = mach_absolute_time();
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
      AFSiriActivationBluetoothDeviceVoice(v11, v14, &__NSDictionary0__struct, v10);
    }

    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_1000711E4();
}

- (void)cancelSiri
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Cancellation id \"%@\", buf, 0xCu);

  }
  v8 = mach_absolute_time();
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  v12 = AFSiriActivationUserInfoKey[9];
  v14[0] = AFSiriActivationUserInfoKey[0];
  v14[1] = v12;
  v15[0] = &__kCFBooleanFalse;
  v15[1] = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  AFSiriActivationBluetoothDeviceDoubleTap(v8, v11, v13, &stru_1000AE248);

}

- (void)handleStartStreaming
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DoAPSiriRemoteDevice received StartStreaming", v3, 2u);
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAPSiriRemoteDevice Received StopStreaming with error code%d", (uint8_t *)v7, 8u);
  }
  if (-[DoAPDevice state](self, "state") == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
    objc_msgSend(v6, "cancelStream");

  }
  -[DoAPSiriRemoteDevice clearState](self, "clearState");
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  DoAPSiriRemoteDevice *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  if (-[DoAPDevice state](self, "state") <= 6 && a3 && a4 >= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[DoAPSiriRemoteDevice setLastAudioDate:](self, "setLastAudioDate:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
    if (-[DoAPDevice state](self, "state") == 5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      v10 = objc_msgSend(v9, "isHubConnected");

      if (!v10)
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_10007136C();
        goto LABEL_15;
      }
      v11 = (DoAPSiriRemoteDevice *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioRelay](self, "doapAudioRelay"));
      -[DoAPSiriRemoteDevice sendAudioFrame:](v11, "sendAudioFrame:", v8);
    }
    else
    {
      if (!self->_vtEvent && !self->_vtSource)
      {
        v14 = -[DoAPDevice state](self, "state");
        v15 = qword_1000C9178;
        v16 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
        if (v14 == 2)
        {
          if (v16)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleAudioData: Audio received while DoAP is Active; calling stopStreaming",
              buf,
              2u);
          }
          -[DoAPSiriRemoteDevice stopStreaming:](self, "stopStreaming:", 6);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100055DC0;
          block[3] = &unk_1000AD230;
          block[4] = self;
          dispatch_async(queue, block);
        }
        else if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Audio data ignored", buf, 2u);
        }
        goto LABEL_15;
      }
      v11 = self;
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v11, "audioBuffer"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v11, "audioBuffer"));
        objc_msgSend(v13, "addObject:", v8);

      }
      objc_sync_exit(v11);
    }

LABEL_15:
  }
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  DoAPSiriRemoteDevice *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  float v11;
  NSObject *v12;
  double v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  DoAPSiriRemoteDevice *v18;
  void *v19;
  NSObject *v20;
  DoAPSiriRemoteDevice *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  _QWORD v43[2];

  switch(a3)
  {
    case 1u:
      v6 = self;
      objc_sync_enter(v6);
      if (-[DoAPDevice state](v6, "state") != 2 && -[DoAPDevice state](v6, "state") != 5)
        goto LABEL_51;
      v7 = *a4;
      if (v7 != 1)
        goto LABEL_40;
      if (-[DoAPDevice state](v6, "state") == 2)
      {
        v8 = qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v42) = 0;
          v9 = 2;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: SiriActivation by VoiceTrigger", (uint8_t *)&v42, 2u);
        }
        else
        {
          v9 = 2;
        }
      }
      else
      {
        v7 = *a4;
LABEL_40:
        v34 = (id)qword_1000C9178;
        v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
        if (v7 != 2)
        {
          if (v35)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](v6, "doapStateNameFor:", -[DoAPDevice state](v6, "state")));
            v42 = 67109378;
            LODWORD(v43[0]) = 1;
            WORD2(v43[0]) = 2114;
            *(_QWORD *)((char *)v43 + 6) = v37;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: Unhandled event type %d while %{public}@", (uint8_t *)&v42, 0x12u);

          }
          goto LABEL_51;
        }
        if (v35)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](v6, "doapStateNameFor:", -[DoAPDevice state](v6, "state")));
          v42 = 138543362;
          v43[0] = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "DoAPSiri - handleEventIndicator: SiriActivation by DoubleTap while %{public}@", (uint8_t *)&v42, 0xCu);

        }
        v9 = 1;
      }
      if (-[DoAPDevice state](v6, "state") == 2)
        -[DoAPDevice doapStateSet:](v6, "doapStateSet:", 3);
      v6->_vtEvent = 1;
      v6->_vtSource = *a4;
      -[DoAPSiriRemoteDevice activateSiri:](v6, "activateSiri:", v9);
LABEL_51:
      objc_sync_exit(v6);

      return;
    case 2u:
      v10 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received MyriadScore EventIndicator", (uint8_t *)&v42, 2u);
      }
      if (-[DoAPDevice state](self, "state") >= 2 && self->_vtEvent == 1 && self->_vtSource != 3)
      {
        v11 = *(float *)a4;
        v12 = qword_1000C9178;
        v13 = v11;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
        {
          v42 = 134217984;
          *(double *)v43 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Siri Myriad Score %f", (uint8_t *)&v42, 0xCu);
        }
        v38 = mach_absolute_time();
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifier"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "UUIDString"));
        AFSiriActivationHearstBoron(v38, v41, &stru_1000AE2A8, v13);

      }
      return;
    case 3u:
      v14 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received StreamingEnd EventIndicator", (uint8_t *)&v42, 2u);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

      if (v15)
      {
        v16 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
        dispatch_semaphore_signal(v16);

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));

      if (v17)
      {
        v18 = self;
        objc_sync_enter(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v18, "audioBuffer"));
        objc_msgSend(v19, "removeAllObjects");

        objc_sync_exit(v18);
      }
      if (-[DoAPDevice state](self, "state") == 5)
      {
        -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0);
        v20 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
        dispatch_semaphore_signal(v20);

      }
      v21 = self;
      objc_sync_enter(v21);
      -[DoAPSiriRemoteDevice clearEvent](v21, "clearEvent");
      -[DoAPDevice doapStateSet:](v21, "doapStateSet:", 2);
      objc_sync_exit(v21);

      return;
    case 5u:
      v22 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v42) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DoAPSiri - DoAP Received SiriCancel EventIndicator", (uint8_t *)&v42, 2u);
      }
      -[DoAPSiriRemoteDevice cancelSiri](self, "cancelSiri");
      return;
    case 6u:
      v23 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *a4;
        v42 = 67109120;
        LODWORD(v43[0]) = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Doap Received PTT/HTT Button Event (value = %d)", (uint8_t *)&v42, 8u);
      }
      if (-[DoAPDevice state](self, "state") == 2 && *a4 == 1)
      {
        self->_vtEvent = 6;
        self->_vtSource = 4;
        v25 = mach_absolute_time();
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "UUIDString"));
        AFSiriActivationBluetoothDeviceButtonPress(v25, v28, 0, &stru_1000AE2C8);

      }
      else if (-[DoAPDevice state](self, "state") == 2 && *a4 == 2)
      {
        v29 = mach_absolute_time();
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "UUIDString"));
        AFSiriActivationBluetoothDeviceButtonRelease(v29, v32, 0, &stru_1000AE2E8);

      }
      else
      {
        v33 = (void *)qword_1000C9178;
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_1000713FC(v33, self);
      }
      return;
    default:
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_100071398();
      return;
  }
}

- (void)doapAudioWillStart:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[DoAPDevice state](self, "state");
  v6 = qword_1000C9178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioWillStart", buf, 2u);
    }
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100056804;
    v8[3] = &unk_1000AD608;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_1000714EC();
  }

}

- (void)waitForSiriAudioToStop:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  double v8;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  dispatch_time_t v15;
  intptr_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  double v21;
  NSObject *queue;
  void *v23;
  NSObject *v24;
  void *v25;
  double v26;
  NSObject *v27;
  void *v28;
  DoAPSiriRemoteDevice *v29;
  void *v30;
  DoAPSiriRemoteDevice *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  DoAPSiriRemoteDevice *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  DoAPSiriRemoteDevice *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;
  uint8_t buf[4];
  double v46;

  v4 = a3;
  v5 = -[DoAPDevice state](self, "state");
  v6 = qword_1000C9178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri waitForSiriAudioToStop", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
    objc_msgSend(v7, "timeIntervalSinceNow");
    v9 = fabs(v8) < 0.5;

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        objc_msgSend(v11, "timeIntervalSinceNow");
        v13 = v12;

        v14 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStop](self, "doapAudioStop"));
        v15 = dispatch_time(0, 1000000 * vcvtpd_s64_f64((v13 + 0.5) * 1000.0));
        v16 = dispatch_semaphore_wait(v14, v15);

        v17 = qword_1000C9178;
        v18 = os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT);
        if (v16)
        {
          if (v18)
          {
            v19 = v17;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
            objc_msgSend(v20, "timeIntervalSinceNow");
            *(_DWORD *)buf = 134217984;
            v46 = fabs(v21) * 1000.0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Received Siri audio data %f ms ago.", buf, 0xCu);

          }
          queue = self->_queue;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100057350;
          v41[3] = &unk_1000AD608;
          v41[4] = self;
          v42 = v4;
          dispatch_async(queue, v41);

        }
        else
        {
          if (v18)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Received streamEnd event.", buf, 2u);
          }
          -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0);
          if (-[DoAPDevice state](self, "state") < 7)
          {
            (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
          }
          else
          {
            v37 = qword_1000C9178;
            if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriDevice is about to be stopped", buf, 2u);
            }
          }
          v38 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
          dispatch_semaphore_signal(v38);

          v39 = self;
          objc_sync_enter(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v39, "audioBuffer"));
          objc_msgSend(v40, "removeAllObjects");

          objc_sync_exit(v39);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
          sub_100071630();
        v43 = NSLocalizedDescriptionKey;
        v44 = CFSTR("No doapAudioStop semaphore");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSMachErrorDomain, -536870165, v32));

        (*((void (**)(id, void *))v4 + 2))(v4, v33);
        v34 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
        dispatch_semaphore_signal(v34);

        v35 = self;
        objc_sync_enter(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v35, "audioBuffer"));
        objc_msgSend(v36, "removeAllObjects");

        objc_sync_exit(v35);
      }
    }
    else
    {
      v23 = (void *)qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice lastAudioDate](self, "lastAudioDate"));
        objc_msgSend(v25, "timeIntervalSinceNow");
        *(_DWORD *)buf = 134217984;
        v46 = fabs(v26) * 1000.0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "DoAPSiri - Have not received audio data for %f ms. Stop Siri session.", buf, 0xCu);

      }
      -[DoAPSiriRemoteDevice setDoapAudioStop:](self, "setDoapAudioStop:", 0);
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
      v27 = objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice doapAudioStart](self, "doapAudioStart"));
      dispatch_semaphore_signal(v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](self, "audioBuffer"));
      if (v28)
      {
        v29 = self;
        objc_sync_enter(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPSiriRemoteDevice audioBuffer](v29, "audioBuffer"));
        objc_msgSend(v30, "removeAllObjects");

        objc_sync_exit(v29);
      }
      v31 = self;
      objc_sync_enter(v31);
      -[DoAPSiriRemoteDevice clearEvent](v31, "clearEvent");
      -[DoAPDevice doapStateSet:](v31, "doapStateSet:", 2);
      objc_sync_exit(v31);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_100071604();
  }

}

- (void)doapAudioDidStop:(id)a3
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = -[DoAPDevice state](self, "state");
  v6 = qword_1000C9178;
  if (v5 < 7)
  {
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DoAPSiri AudioDidStop", buf, 2u);
    }
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005745C;
    v8[3] = &unk_1000AD608;
    v8[4] = self;
    v9 = v4;
    dispatch_async(queue, v8);

  }
  else if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
  {
    sub_10007165C();
  }

}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  AFNotifyObserver *v8;
  AFNotifyObserver *v9;
  NSObject *v10;
  int siriState;
  _DWORD v12[2];
  __int16 v13;
  int v14;

  v8 = (AFNotifyObserver *)a3;
  v9 = v8;
  if (a4 != a5 && self->_notifyObserver == v8)
  {
    self->_siriState = a5;
    v10 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      siriState = self->_siriState;
      v12[0] = 67109376;
      v12[1] = a4;
      v13 = 1024;
      v14 = siriState;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "DoAPSiri - SiriState changed 0x%0X -> 0x%0X", (uint8_t *)v12, 0xEu);
    }
    -[DoAPSiriRemoteDevice eventIndicator:eventValue:](self, "eventIndicator:eventValue:", 4, self->_siriState);
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
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAudioDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (OS_dispatch_semaphore)doapAudioStart
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDoapAudioStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_semaphore)doapAudioStop
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDoapAudioStop:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableArray)audioBuffer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAudioBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
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
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_doapAudioRelay, 0);
  objc_storeStrong((id *)&self->_groupStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
