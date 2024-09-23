@implementation DoAPAudioRelay

- (DoAPAudioRelay)initWithIdentifier:(id)a3 deviceType:(int64_t)a4 properties:(id)a5 codecType:(unsigned __int8)a6 hub:(id)a7
{
  id v13;
  id v14;
  id v15;
  DoAPAudioRelay *v16;
  DoAPAudioRelay *v17;
  objc_super v19;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)DoAPAudioRelay;
  v16 = -[DoAPAudioRelay init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeWeak((id *)&v17->_hub, v15);
    v17->_isStreaming = 0;
    objc_storeStrong((id *)&v17->_hidProperties, a5);
    v17->_codec = a6;
    v17->_deviceType = a4;
  }

  return v17;
}

- (BOOL)isHubConnected
{
  DoAPAudioRelay *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay hub](self, "hub"));
  LOBYTE(v2) = objc_msgSend(v3, "isXpcConnectedForDeviceType:", v2->_deviceType);

  return (char)v2;
}

- (void)sendAudioFrame:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v4 = a3;
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006D248(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = CFSTR("kMsgArgData");
  v15 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "AudioFrame", v13);

}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send invalidate to AVVC", v4, 2u);
  }
  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "Unpublish", 0);
}

- (void)cancelStream
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send cancelStream to AVVC", v4, 2u);
  }
  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "StreamDidCancel", 0);
}

- (void)publish
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[DoAPAudioRelay deviceType](self, "deviceType")));
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("kMsgDeviceType"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay hidProperties](self, "hidProperties"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay hidProperties](self, "hidProperties"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductID")));
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("kMsgPidNum"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay identifier](self, "identifier"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay identifier](self, "identifier"));
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("kMsgArgIdentifier"));

  }
  if (-[DoAPAudioRelay codec](self, "codec"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[DoAPAudioRelay codec](self, "codec")));
    objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("kMsgCodecType"));

  }
  v11 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description"));
    v14 = 138412290;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - Send publish to AVVC %@", (uint8_t *)&v14, 0xCu);

  }
  -[DoAPAudioRelay sendMsg:args:](self, "sendMsg:args:", "Publish", v3);

}

- (void)handleStartStream
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FAE8;
  v2[3] = &unk_1000ADA88;
  v2[4] = self;
  -[DoAPAudioRelay startStream:](self, "startStream:", v2);
}

- (void)handleStopStream
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002FC28;
  v2[3] = &unk_1000ADA88;
  v2[4] = self;
  -[DoAPAudioRelay stopStream:](self, "stopStream:", v2);
}

- (void)handleResetStream
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DoAPAudioRelay - handleResetStream", v4, 2u);
  }
  -[DoAPAudioRelay stopStream:](self, "stopStream:", &stru_1000ADAC8);
}

- (void)startStream:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[DoAPAudioRelay setIsStreaming:](self, "setIsStreaming:", 1);
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006D278(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay delegate](self, "delegate"));
  objc_msgSend(v13, "doapAudioWillStart:", v4);

}

- (void)stopStream:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[DoAPAudioRelay setIsStreaming:](self, "setIsStreaming:", 0);
  v5 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEBUG))
    sub_10006D2A8(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay delegate](self, "delegate"));
  objc_msgSend(v13, "doapAudioDidStop:", v4);

}

- (void)sendMsg:(const char *)a3 args:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay identifier](self, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v6, CFSTR("kMsgArgIdentifier")));

  if (v10)
    objc_msgSend(v7, "addEntriesFromDictionary:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DoAPAudioRelay hub](self, "hub"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  objc_msgSend(v8, "sendMsgIfCheckedIn:args:forClient:", v9, v7, -[DoAPAudioRelay deviceType](self, "deviceType"));

}

- (DoAPAudioRelaySource)delegate
{
  return (DoAPAudioRelaySource *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DoAPAudioRelayHub)hub
{
  return (DoAPAudioRelayHub *)objc_loadWeakRetained((id *)&self->_hub);
}

- (BOOL)isStreaming
{
  return self->_isStreaming;
}

- (void)setIsStreaming:(BOOL)a3
{
  self->_isStreaming = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)hidProperties
{
  return self->_hidProperties;
}

- (unsigned)codec
{
  return self->_codec;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidProperties, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_hub);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
