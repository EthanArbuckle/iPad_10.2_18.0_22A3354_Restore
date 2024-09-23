@implementation PDURLSessionProxyServerService

- (PDURLSessionProxyServerService)init
{
  PDURLSessionProxyServerService *v2;
  uint64_t v3;
  NSMutableDictionary *sessions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PDURLSessionProxyServerService;
  v2 = -[PDURLSessionProxyService init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    sessions = v2->_sessions;
    v2->_sessions = (NSMutableDictionary *)v3;

    v2->_infraWiFiRetainCount = 0;
    v2->_btLinkAssertionRetainCount = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *infraWiFiTimer;
  NSObject *btLinkAssertionTimer;
  objc_super v5;

  infraWiFiTimer = self->_infraWiFiTimer;
  if (infraWiFiTimer)
    dispatch_source_cancel(infraWiFiTimer);
  btLinkAssertionTimer = self->_btLinkAssertionTimer;
  if (btLinkAssertionTimer)
    dispatch_source_cancel(btLinkAssertionTimer);
  v5.receiver = self;
  v5.super_class = (Class)PDURLSessionProxyServerService;
  -[PDURLSessionProxyServerService dealloc](&v5, "dealloc");
}

- (void)start
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100025D6C;
  v2[3] = &unk_1000B23A0;
  v2[4] = self;
  +[NSURLSession _obliterateAllBackgroundSessionsWithCompletionHandler:](NSURLSession, "_obliterateAllBackgroundSessionsWithCompletionHandler:", v2);
}

- (void)retainInfraWiFi
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100025CD8;
  v2[3] = &unk_1000B23A0;
  v2[4] = self;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v2);
}

- (void)releaseInfraWiFi
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100025B78;
  v2[3] = &unk_1000B23A0;
  v2[4] = self;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v2);
}

- (void)retainBTLinkAssertion
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000254B8;
  v2[3] = &unk_1000B23A0;
  v2[4] = self;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v2);
}

- (void)releaseBTLinkAssertion
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100025338;
  v2[3] = &unk_1000B23A0;
  v2[4] = self;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v2);
}

- (void)_onqueue_remoteDeviceStartedUp
{
  objc_super v3;

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sessions, "enumerateKeysAndObjectsUsingBlock:", &stru_1000B1090);
  -[NSMutableDictionary removeAllObjects](self->_sessions, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)PDURLSessionProxyServerService;
  -[PDURLSessionProxyService _onqueue_remoteDeviceStartedUp](&v3, "_onqueue_remoteDeviceStartedUp");
}

- (void)_onqueue_devicesConnected
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_sessions, "enumerateKeysAndObjectsUsingBlock:", &stru_1000B10B0);
}

- (int64_t)_onqueue_priorityForMessage:(id)a3 ofType:(unsigned __int16)a4 isReply:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  int64_t v12;
  objc_super v14;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_nsurlsessionproxy_sessionIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    v11 = objc_msgSend(v10, "messagePriorityForTaskWithIdentifier:isReply:", objc_msgSend(v8, "_nsurlsessionproxy_taskIdentifier"), v5);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PDURLSessionProxyServerService;
    v11 = -[PDURLSessionProxyService _onqueue_priorityForMessage:ofType:isReply:](&v14, "_onqueue_priorityForMessage:ofType:isReply:", v8, v6, v5);
  }
  v12 = (int64_t)v11;

  return v12;
}

- (id)_onqueue_sourceApplicationForMessage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_nsurlsessionproxy_sessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceApplicationBundleIdentifier"));
  else
    v7 = 0;

  return v7;
}

- (int64_t)_onqueue_IDSTimoutForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int64_t v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_nsurlsessionproxy_sessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v5));
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "IDSMessageTimeout");
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PDURLSessionProxyServerService;
    v8 = -[PDURLSessionProxyService _onqueue_IDSTimoutForMessage:](&v11, "_onqueue_IDSTimoutForMessage:", v4);
  }
  v9 = (int64_t)v8;

  return v9;
}

- (id)_onqueue_loggableDescriptionForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_nsurlsessionproxy_sessionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v5));
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageLoggableDescriptionForTaskWithIdentifier:", objc_msgSend(v4, "_nsurlsessionproxy_taskIdentifier")));
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PDURLSessionProxyServerService;
    v8 = -[PDURLSessionProxyService _onqueue_loggableDescriptionForMessage:](&v11, "_onqueue_loggableDescriptionForMessage:", v4);
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;

  return v9;
}

- (void)_onqueue_handleReceivedMessage:(id)a3 ofType:(unsigned __int16)a4 withReply:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  PDURLSessionProxyServer *v10;
  PDURLSessionProxyServer *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  PDURLSessionProxyServer *v21;
  void *v22;
  PDURLSessionProxyServer *v23;
  NSObject *v24;
  NSObject *v25;
  PDURLSessionProxySessionBecameInvalid *v26;
  PDURLSessionProxySessionMessage *v27;
  void *v28;
  void *v29;
  void *v30;
  void (**v31)(id, id);
  void *v32;
  uint8_t buf[4];
  _BYTE v34[18];

  v6 = a4;
  v8 = a3;
  v31 = (void (**)(id, id))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_nsurlsessionproxy_sessionIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_nsurlsessionproxy_sessionUUID"));
  if (v9)
  {
    v10 = (PDURLSessionProxyServer *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v9));
    v11 = v10;
    if ((_DWORD)v6 == 1 && v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyServer uuidString](v10, "uuidString"));
      v13 = objc_msgSend(v12, "isEqualToString:", v32);

      if (v13)
      {
        v14 = qword_1000C7120;
        if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v34 = v9;
          *(_WORD *)&v34[8] = 2112;
          *(_QWORD *)&v34[10] = v32;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "PDURLSessionProxyServerService received CreateSession message for identifier %@ with existing UUID %@. Ignoring message.", buf, 0x16u);
        }
LABEL_41:

        goto LABEL_42;
      }
    }
    else if ((_DWORD)v6 != 1)
    {
      v24 = qword_1000C7120;
      if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v34 = v6;
        *(_WORD *)&v34[4] = 2112;
        *(_QWORD *)&v34[6] = v9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received message of type %u for session %@", buf, 0x12u);
      }
      if (v11)
      {
        -[PDURLSessionProxyServer handleMessage:ofType:withReply:](v11, "handleMessage:ofType:withReply:", v8, v6, v31);
      }
      else
      {
        v25 = qword_1000C7120;
        if ((_DWORD)v6 == 8)
        {
          if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received Invalidate message for unknown session identifier %@, replying with BecameInvalid message", buf, 0xCu);
          }
          v26 = objc_opt_new(PDURLSessionProxySessionBecameInvalid);
          v27 = objc_opt_new(PDURLSessionProxySessionMessage);
          -[PDURLSessionProxySessionMessage setSessionIdentifier:](v27, "setSessionIdentifier:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_nsurlsessionproxy_sessionUUID"));
          -[PDURLSessionProxySessionMessage setUuidString:](v27, "setUuidString:", v28);

          -[PDURLSessionProxySessionBecameInvalid setSession:](v26, "setSession:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[PDURLSessionProxyServerService sharedService](PDURLSessionProxyServerService, "sharedService"));
          objc_msgSend(v29, "sendProtobufMessage:ofType:withReply:", v26, 1008, 0);

        }
        else if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v34 = v6;
          *(_WORD *)&v34[4] = 2112;
          *(_QWORD *)&v34[6] = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "NSURLSessionProxy message of type %u received for unknown session with identifier %@", buf, 0x12u);
        }
        v11 = 0;
      }
      goto LABEL_41;
    }
    v16 = v8;
    v17 = qword_1000C7120;
    if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v34 = v9;
      *(_WORD *)&v34[8] = 2112;
      *(_QWORD *)&v34[10] = v32;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDURLSessionProxyServerService received CreateSession message for identifier %@ with UUID %@", buf, 0x16u);
    }
    if (v11)
    {
      -[PDURLSessionProxyServer obliterate](v11, "obliterate");
      -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v9);
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "session"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_actualConfiguration"));
    v19 = objc_msgSend(v16, "supportsRedirects");
    v20 = v19;
    if (!objc_msgSend(v16, "hasDelegateImplementsWillSendRequest")
      || objc_msgSend(v16, "delegateImplementsWillSendRequest"))
    {
      v20 = v19 | 2;
    }
    if (!objc_msgSend(v16, "hasDelegateImplementsSessionAuthChallenge")
      || objc_msgSend(v16, "delegateImplementsSessionAuthChallenge"))
    {
      v20 |= 4uLL;
    }
    if (!objc_msgSend(v16, "hasDelegateImplementsTaskAuthChallenge")
      || objc_msgSend(v16, "delegateImplementsTaskAuthChallenge"))
    {
      v20 |= 8uLL;
    }
    if (!objc_msgSend(v16, "hasDelegateImplementsWillPerformRedirection")
      || objc_msgSend(v16, "delegateImplementsWillPerformRedirection"))
    {
      v20 |= 0x10uLL;
    }
    if (!objc_msgSend(v16, "hasDelegateImplementsDidReceiveResponse")
      || objc_msgSend(v16, "delegateImplementsDidReceiveResponse"))
    {
      v20 |= 0x20uLL;
    }
    v21 = [PDURLSessionProxyServer alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uuidString"));
    v23 = -[PDURLSessionProxyServer initWithConfiguration:uuidString:options:delegate:](v21, "initWithConfiguration:uuidString:options:delegate:", v18, v22, v20, self);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", v23, v9);
    v31[2](v31, v16);

    v11 = v23;
    goto LABEL_41;
  }
  v15 = qword_1000C7120;
  if (os_log_type_enabled((os_log_t)qword_1000C7120, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v34 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Received NSURLSessionProxy message of type %u without a session identifier", buf, 8u);
  }
LABEL_42:

}

- (void)_onqueue_handleFailedMessageSend:(id)a3 ofType:(unsigned __int16)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_nsurlsessionproxy_sessionIdentifier"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v6));
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "handleFailedMessageSend:ofType:", v9, v4);
  }
  else
  {
    v8 = 0;
  }

}

- (void)proxyServerBecameInvalid:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  PDURLSessionProxyServerService *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100025298;
  v5[3] = &unk_1000B23F0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[PDURLSessionProxyService withWorkQueue:](self, "withWorkQueue:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bluetoothCompanionLinkAssertion, 0);
  objc_storeStrong((id *)&self->_btLinkAssertionTimer, 0);
  objc_storeStrong((id *)&self->_infraWiFiTimer, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

+ (id)sharedService
{
  if (qword_1000C7050 != -1)
    dispatch_once(&qword_1000C7050, &stru_1000B1050);
  return (id)qword_1000C7048;
}

@end
