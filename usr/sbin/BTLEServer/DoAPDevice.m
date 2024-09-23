@implementation DoAPDevice

+ (id)doapDeviceWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  int v4;
  uint64_t v5;
  id v6;
  objc_class *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  if (v4 == 1 && (v7 = (objc_class *)objc_opt_class(DoAPSiriRemoteDevice, v5)) != 0)
    v8 = objc_msgSend([v7 alloc], "initWithCodecs:streamID:", v6, 1);
  else
    v8 = 0;

  return v8;
}

- (void)start
{
  DoAPDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 1);
  objc_sync_exit(obj);

}

- (void)stop
{
  DoAPDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  -[DoAPDevice doapStateSet:](obj, "doapStateSet:", 7);
  objc_sync_exit(obj);

}

- (void)handleStartStreaming
{
  -[DoAPDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)handleStopStreaming:(unsigned __int8)a3
{
  -[DoAPDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)handleAudioData:(char *)a3 dataLength:(int64_t)a4
{
  -[DoAPDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (void)handleEventIndicator:(unsigned __int8)a3 eventValue:(char *)a4
{
  -[DoAPDevice doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
}

- (DoAPDevice)init
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[DoAPDevice init]"));
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Calling %@ is not allowed"), v3);

  return 0;
}

- (DoAPDevice)initWithCodecs:(id)a3 streamID:(unsigned __int16)a4
{
  DoAPDevice *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DoAPDevice;
  result = -[DoAPDevice init](&v6, "init", a3);
  if (result)
  {
    result->_state = 0;
    result->_streamID = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DoAPDevice;
  -[DoAPDevice dealloc](&v2, "dealloc");
}

- (void)notifyDidStart
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060520;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)notifyDidStop
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100060600;
  block[3] = &unk_1000AD230;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (int)selectCodec:(unsigned __int8)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  _BYTE v10[4];
  uint8_t buf[16];

  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAP Send selectCodec", buf, 2u);
  }
  v10[0] = 1;
  v10[1] = -[DoAPDevice streamID](self, "streamID");
  v10[2] = -[DoAPDevice streamID](self, "streamID") >> 8;
  v10[3] = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v10, 4, 0));
  if (-[DoAPDevice state](self, "state"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    objc_msgSend(v7, "selectCodec:", v6);

    v8 = 0;
  }
  else
  {
    v8 = -536870195;
  }

  return v8;
}

- (int)startStreaming
{
  NSObject *v3;
  void *v4;
  void *v5;
  DoAPDevice *v6;
  int v7;
  _BYTE v9[2];
  uint8_t buf[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAP Send startStreaming", buf, 2u);
  }
  v9[0] = -[DoAPDevice streamID](self, "streamID");
  v9[1] = -[DoAPDevice streamID](self, "streamID") >> 8;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v9, 2, 0));
  if (-[DoAPDevice state](self, "state") == 2 || -[DoAPDevice state](self, "state") == 3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    objc_msgSend(v5, "startStreaming:", v4);

    v6 = self;
    objc_sync_enter(v6);
    -[DoAPDevice doapStateSet:](v6, "doapStateSet:", 5);
    objc_sync_exit(v6);

    -[DoAPDevice setHighPriorityLink:burstTime:](v6, "setHighPriorityLink:burstTime:", 1, &off_1000B3828);
    v7 = 0;
  }
  else
  {
    v7 = -536870195;
  }

  return v7;
}

- (int)stopStreaming:(unsigned __int8)a3
{
  int v3;
  NSObject *v5;
  void *v6;
  void *v7;
  DoAPDevice *v8;
  int v9;
  uint64_t v11;

  v3 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v11) = 67109120;
    HIDWORD(v11) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DoAP Send stopStreaming %d", (uint8_t *)&v11, 8u);
  }
  LOBYTE(v11) = -[DoAPDevice streamID](self, "streamID");
  BYTE1(v11) = -[DoAPDevice streamID](self, "streamID", v11) >> 8;
  BYTE2(v11) = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v11, 3, 0));
  if (-[DoAPDevice state](self, "state") < 2)
  {
    v9 = -536870198;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
    objc_msgSend(v7, "stopStreaming:", v6);

    v8 = self;
    objc_sync_enter(v8);
    -[DoAPDevice doapStateSet:](v8, "doapStateSet:", 6);
    objc_sync_exit(v8);

    v9 = 0;
  }

  return v9;
}

- (int)eventIndicator:(unsigned __int8)a3 eventValue:(unsigned __int8)a4
{
  int v4;
  int v5;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  __int16 v15;
  int v16;

  v4 = a4;
  v5 = a3;
  v7 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v14) = 67109376;
    HIDWORD(v14) = v5;
    v15 = 1024;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAP Send eventIndicator(%u) value(%u)", (uint8_t *)&v14, 0xEu);
  }
  LOBYTE(v14) = -[DoAPDevice streamID](self, "streamID");
  BYTE1(v14) = -[DoAPDevice streamID](self, "streamID", v14) >> 8;
  BYTE2(v14) = v5;
  BYTE3(v14) = 1;
  BYTE4(v14) = v4;
  if (-[DoAPDevice streamID](self, "streamID") != 1)
  {
    if (-[DoAPDevice streamID](self, "streamID") == 2
      && (_os_feature_enabled_impl("BluetoothFeatures", "MultiClientDoAP") & 1) == 0)
    {
      v11 = qword_1000C9178;
      if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
        sub_10007213C(v11);
    }
    return 0;
  }
  v8 = -536870198;
  if (v5 == 4)
  {
    if (-[DoAPDevice state](self, "state") >= 2 && -[DoAPDevice state](self, "state") <= 6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v14, 5, 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
      objc_msgSend(v10, "eventIndicator:", v9);

      return 0;
    }
  }
  else
  {
    v12 = qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
      sub_1000720C8(v5, v12);
  }
  return v8;
}

- (void)setHighPriorityLink:(BOOL)a3 burstTime:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DoAPDevice service](self, "service"));
  objc_msgSend(v7, "setHighPriorityLink:burstTime:", v4, v6);

}

- (id)allocQueue
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

- (id)doapStateNameFor:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u)
    return CFSTR("Initialized");
  else
    return *(&off_1000AE560 + (char)(a3 - 1));
}

- (void)doapStateSet:(unsigned __int8)a3
{
  uint64_t v3;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;

  v3 = a3;
  if (-[DoAPDevice state](self, "state") >= 3)
  {
    v5 = -[DoAPDevice state](self, "state");
    if ((_DWORD)v3 == 2 && v5 <= 6)
      -[DoAPDevice setHighPriorityLink:burstTime:](self, "setHighPriorityLink:burstTime:", 0, 0);
  }
  v6 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice peripheral](self, "peripheral"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](self, "doapStateNameFor:", -[DoAPDevice state](self, "state")));
    v12 = -[DoAPDevice state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPDevice doapStateNameFor:](self, "doapStateNameFor:", v3));
    v14 = 138478851;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 1024;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    v22 = 1024;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DoAP state change for ID %{private}@: %{public}@ (%d) -> %{public}@ (%d)", (uint8_t *)&v14, 0x2Cu);

  }
  -[DoAPDevice setState:](self, "setState:", v3);
}

- (DoAPServiceProtocol)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (unsigned)state
{
  return self->_state;
}

- (void)setState:(unsigned __int8)a3
{
  self->_state = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
