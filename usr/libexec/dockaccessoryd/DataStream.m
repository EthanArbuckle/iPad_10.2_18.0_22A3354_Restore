@implementation DataStream

+ (id)logCategory
{
  if (qword_100271648 != -1)
    dispatch_once(&qword_100271648, &stru_100236B20);
  return (id)qword_100271650;
}

- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  DataStream *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 0, 10.0);
  v15 = objc_msgSend(objc_alloc((Class)HMFTimer), "initWithTimeInterval:options:", 0, 10.0);
  v16 = -[DataStream initWithTransport:sessionEncryption:workQueue:logIdentifier:connectionTimer:helloMessageResponseTimer:](self, "initWithTransport:sessionEncryption:workQueue:logIdentifier:connectionTimer:helloMessageResponseTimer:", v13, v12, v11, v10, v14, v15);

  return v16;
}

- (DataStream)initWithTransport:(id)a3 sessionEncryption:(id)a4 workQueue:(id)a5 logIdentifier:(id)a6 connectionTimer:(id)a7 helloMessageResponseTimer:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  DataStream *v19;
  DataStream *v20;
  NSString *v21;
  NSString *logIdentifier;
  uint64_t v23;
  NSMapTable *protocols;
  DataStreamControlProtocol *v25;
  DataStreamControlProtocol *controlProtocol;
  NSMutableSet *v27;
  NSMutableSet *pendingRequests;
  NSMutableArray *v29;
  NSMutableArray *pendingEvents;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)DataStream;
  v19 = -[DataStream init](&v34, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_transport, a3);
    objc_storeStrong((id *)&v20->_sessionEncryption, a4);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    v21 = (NSString *)objc_msgSend(v16, "copy", v32, v33);
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = v21;

    objc_storeStrong((id *)&v20->_connectionTimer, a7);
    objc_storeStrong((id *)&v20->_helloMessageResponseTimer, a8);
    v23 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    protocols = v20->_protocols;
    v20->_protocols = (NSMapTable *)v23;

    v25 = -[DataStreamControlProtocol initWithLogIdentifier:]([DataStreamControlProtocol alloc], "initWithLogIdentifier:", v16);
    controlProtocol = v20->_controlProtocol;
    v20->_controlProtocol = v25;

    v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = v27;

    v29 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingEvents = v20->_pendingEvents;
    v20->_pendingEvents = v29;

  }
  return v20;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  DataStream *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  if (self->_active != v3)
  {
    self->_active = v3;
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = HMFBooleanToString(self->_active);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@DataStream changes active to %@", (uint8_t *)&v15, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream delegate](v6, "delegate"));
    objc_msgSend(v14, "dataStreamDidUpdateActiveStatus:", v6);

  }
}

- (void)connect
{
  DataStream *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream connecting", (uint8_t *)&v9, 0xCu);

  }
  -[DataStream startConnectionTimer](v2, "startConnectionTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream transport](v2, "transport"));
  objc_msgSend(v8, "connect");

}

- (void)invalidate
{
  DataStream *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream invalidated", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream transport](v2, "transport"));
  objc_msgSend(v8, "invalidate");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v2, "protocols", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectEnumerator"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "dataStreamInitiatedClose:", v2);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)close
{
  DataStream *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;

  v2 = self;
  v4 = sub_10007CCE4((uint64_t)v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = sub_10007CD2C(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@DataStream closing", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream transport](v2, "transport"));
  objc_msgSend(v8, "close");

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v2, "protocols", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectEnumerator"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "dataStreamInitiatedClose:", v2);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)addProtocol:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](self, "protocols"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

  -[DataStream _evaluateActiveStatusChange](self, "_evaluateActiveStatusChange");
}

- (id)protocolWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](self, "protocols"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  return v7;
}

- (id)createRequestIdentifier
{
  unint64_t v3;

  v3 = -[DataStream nextRequestIdentifier](self, "nextRequestIdentifier");
  -[DataStream setNextRequestIdentifier:](self, "setNextRequestIdentifier:", (char *)-[DataStream nextRequestIdentifier](self, "nextRequestIdentifier") + 1);
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v3);
}

- (void)_sendMessageWithHeader:(id)a3 payload:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  DataStream *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  __CFString *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream sessionEncryption](self, "sessionEncryption"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream sessionEncryption](self, "sessionEncryption"));
    v27 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder encryptEncryptedOPACKHeader:payload:sessionEncryption:error:](DataStreamMessageCoder, "encryptEncryptedOPACKHeader:payload:sessionEncryption:error:", v8, v9, v12, &v27));
    v14 = v27;

  }
  else
  {
    v26 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder buildUnencryptedOPACKHeader:payload:error:](DataStreamMessageCoder, "buildUnencryptedOPACKHeader:payload:error:", v8, v9, &v26));
    v14 = v26;
  }
  v15 = self;
  v17 = sub_10007CCE4((uint64_t)v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v14)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = sub_10007CD2C(v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2112;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@DataStream encoding message failed (%@)", buf, 0x16u);

    }
    v10[2](v10, v14);
  }
  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v22 = sub_10007CD2C(v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](v15, "pendingRequests"));
      *(_DWORD *)buf = 138543874;
      v29 = v23;
      v30 = 2112;
      v31 = v8;
      v32 = 2112;
      v33 = v24;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}@DataStream Sending Message: %@ --> %@", buf, 0x20u);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream transport](v15, "transport"));
    objc_msgSend(v25, "sendRawFrame:completion:", v13, v10);

  }
}

- (void)sendEventForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, DataStreamPendingEvent *);
  void *v13;
  unsigned __int8 v14;
  DataStreamPendingEvent *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, DataStreamPendingEvent *))a6;
  if (-[DataStream firstMessageReceived](self, "firstMessageReceived"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](self, "controlProtocol"));
    v14 = objc_msgSend(v13, "helloMessageResponseReceived");

    if ((v14 & 1) != 0)
    {
      v15 = (DataStreamPendingEvent *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder eventHeaderForProtocol:topic:](DataStreamMessageCoder, "eventHeaderForProtocol:topic:", v17, v10));
      -[DataStream _sendMessageWithHeader:payload:completion:](self, "_sendMessageWithHeader:payload:completion:", v15, v11, v12);
    }
    else
    {
      v15 = (DataStreamPendingEvent *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 22, 0));
      v12[2](v12, v15);
    }
  }
  else
  {
    v15 = -[DataStreamPendingEvent initWithProtocol:topic:payload:completion:]([DataStreamPendingEvent alloc], "initWithProtocol:topic:payload:completion:", v17, v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingEvents](self, "pendingEvents"));
    objc_msgSend(v16, "addObject:", v15);

  }
}

- (void)sendResponseForRequestHeader:(id)a3 payload:(id)a4 status:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder responseHeaderForRequestHeader:status:](DataStreamMessageCoder, "responseHeaderForRequestHeader:status:", a3, v6));
  -[DataStream _sendMessageWithHeader:payload:completion:](self, "_sendMessageWithHeader:payload:completion:", v12, v11, v10);

}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 identifier:(unint64_t)a5 payload:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v17 = (id)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder requestHeaderForProtocol:topic:identifier:](DataStreamMessageCoder, "requestHeaderForProtocol:topic:identifier:", v15, v14, v16));

  -[DataStream _sendMessageWithHeader:payload:completion:](self, "_sendMessageWithHeader:payload:completion:", v17, v13, v12);
}

- (void)sendRequestForProtocol:(id)a3 topic:(id)a4 payload:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  DataStreamPendingRequest *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  DataStream *v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream createRequestIdentifier](self, "createRequestIdentifier"));
  if (-[DataStream firstMessageReceived](self, "firstMessageReceived"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](self, "controlProtocol"));
    v16 = objc_msgSend(v15, "helloMessageResponseReceived");

    if ((v16 & 1) == 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 22, 0));
      (*((void (**)(id, void *, _QWORD, _QWORD))v13 + 2))(v13, v19, 0, 0);

      goto LABEL_7;
    }
    v17 = (DataStreamPendingRequest *)objc_claimAutoreleasedReturnValue(+[DataStreamMessageCoder requestHeaderForProtocol:topic:identifier:](DataStreamMessageCoder, "requestHeaderForProtocol:topic:identifier:", v10, v11, v14));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100013BB0;
    v20[3] = &unk_100236B48;
    v26 = v13;
    v21 = v14;
    v22 = v10;
    v23 = v11;
    v24 = v12;
    v25 = self;
    -[DataStream _sendMessageWithHeader:payload:completion:](self, "_sendMessageWithHeader:payload:completion:", v17, v24, v20);

  }
  else
  {
    v17 = -[DataStreamPendingRequest initWithIdentifier:protocol:topic:payload:callback:]([DataStreamPendingRequest alloc], "initWithIdentifier:protocol:topic:payload:callback:", v14, v10, v11, v12, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests"));
    objc_msgSend(v18, "addObject:", v17);

  }
LABEL_7:

}

- (void)protocolDidUpdateActiveStatus:(id)a3
{
  -[DataStream _evaluateActiveStatusChange](self, "_evaluateActiveStatusChange", a3);
}

- (void)_evaluateActiveStatusChange
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v3);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](self, "protocols", 0));
  v5 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](self, "protocols"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));
        v11 = objc_msgSend(v10, "isActive");

        if ((v11 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = (uint64_t)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  -[DataStream setActive:](self, "setActive:", v5);
}

- (void)setTrafficClass:(unint64_t)a3
{
  DataStream *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  unint64_t v14;

  v4 = self;
  v6 = sub_10007CCE4((uint64_t)v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = sub_10007CD2C(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138543618;
    v12 = v9;
    v13 = 2048;
    v14 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@Setting traffic class %lu on transport", (uint8_t *)&v11, 0x16u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream transport](v4, "transport"));
  objc_msgSend(v10, "setTrafficClass:", a3);

}

- (void)_failPendingMessagesWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v9), "callback"));
        ((void (**)(_QWORD, id, _QWORD, _QWORD))v10)[2](v10, v4, 0, 0);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests"));
  objc_msgSend(v11, "removeAllObjects");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingEvents](self, "pendingEvents", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "completion"));
        ((void (**)(_QWORD, id))v17)[2](v17, v4);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingEvents](self, "pendingEvents"));
  objc_msgSend(v18, "removeAllObjects");

}

- (void)transport:(id)a3 didFailWithError:(id)a4
{
  id v5;
  void *v6;
  DataStream *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream delegate](self, "delegate"));
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = sub_10007CD2C(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2112;
      v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@Data stream failure (%@)", buf, 0x16u);

    }
    objc_msgSend(v6, "dataStream:didFailWithError:", v7, v5);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_10007CD2C(v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Data stream failure (%@); but no delegate",
        buf,
        0x16u);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v7, "protocols", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectEnumerator"));

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v21);
        if (v22)
          objc_msgSend(v22, "dataStream:didFailWithError:", v7, v5);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v19);
  }

  -[DataStream _failPendingMessagesWithError:](v7, "_failPendingMessagesWithError:", v5);
}

- (void)transportDidClose:(id)a3
{
  void *v4;
  DataStream *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream delegate](self, "delegate", a3));
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v9)
    {
      v10 = sub_10007CD2C(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed", buf, 0xCu);

    }
    objc_msgSend(v4, "dataStreamDidClose:", v5);
  }
  else
  {
    if (v9)
    {
      v12 = sub_10007CD2C(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream closed (but no delegate!)", buf, 0xCu);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v5, "protocols", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectEnumerator"));

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v19), "dataStreamDidClose:", v5);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), 39, 0));
  -[DataStream _failPendingMessagesWithError:](v5, "_failPendingMessagesWithError:", v20);

}

- (void)transportDidOpen:(id)a3
{
  void *v4;
  DataStream *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;

  -[DataStream setConnectionTimer:](self, "setConnectionTimer:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream delegate](self, "delegate"));
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v9)
    {
      v10 = sub_10007CD2C(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN!", buf, 0xCu);

    }
    objc_msgSend(v4, "dataStreamDidOpen:", v5);
  }
  else
  {
    if (v9)
    {
      v12 = sub_10007CD2C(v5);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Data stream OPEN (but no delegate!)", buf, 0xCu);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](v5, "controlProtocol"));
  objc_msgSend(v14, "dataStreamDidOpen:", v5);

  -[DataStream startHelloMessageResponseTimer](v5, "startHelloMessageResponseTimer");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v5, "protocols", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectEnumerator"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v20);
        if (v21)
          objc_msgSend(v21, "dataStreamDidOpen:", v5);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

}

- (BOOL)handleFirstMessageReceivedOnDataStream:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  DataStream *v8;
  uint64_t v9;
  uint64_t v10;
  DataStream *v11;
  DataStream *v12;
  DataStream *v13;
  uint64_t v14;
  uint64_t v15;
  DataStream *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  DataStream *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  __CFString *v28;
  DataStream *v29;
  int v31;
  DataStream *v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  DataStream *v36;

  v6 = a3;
  v7 = a4;
  v8 = (DataStream *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("protocol")));
  v10 = objc_opt_class(NSString, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    v11 = v8;
  else
    v11 = 0;
  v12 = v11;
  if ((-[DataStream isEqualToString:](v12, "isEqualToString:", CFSTR("control")) & 1) == 0)
  {
    v13 = self;
    v22 = sub_10007CCE4((uint64_t)v13, v21);
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v20 = 0;
      goto LABEL_17;
    }
    v23 = sub_10007CD2C(v13);
    v24 = (DataStream *)objc_claimAutoreleasedReturnValue(v23);
    v31 = 138543874;
    v32 = v24;
    v33 = 2112;
    v34 = CFSTR("control");
    v35 = 2112;
    v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@Expected protocol name: %@ received: %@", (uint8_t *)&v31, 0x20u);
LABEL_15:

    goto LABEL_16;
  }
  v13 = (DataStream *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("response")));
  v15 = objc_opt_class(NSString, v14);
  if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    v16 = v13;
  else
    v16 = 0;
  v17 = v16;
  if (!v17)
  {
    v24 = self;
    v26 = sub_10007CCE4((uint64_t)v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = sub_10007CD2C(v24);
      v29 = (DataStream *)objc_claimAutoreleasedReturnValue(v28);
      v31 = 138543874;
      v32 = v29;
      v33 = 2112;
      v34 = CFSTR("response");
      v35 = 2112;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected %@ key value: %@", (uint8_t *)&v31, 0x20u);

    }
    goto LABEL_15;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](self, "controlProtocol"));
  objc_msgSend(v18, "dataStream:didReceiveResponse:header:payload:", self, v13, v6, v7);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](self, "controlProtocol"));
  v20 = objc_msgSend(v19, "helloMessageResponseReceived");

LABEL_17:
  return v20;
}

- (void)_handlePendingRequests
{
  void *v3;
  id v4;
  DataStream *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests"));
  v4 = objc_msgSend(v3, "copy");

  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    *(_DWORD *)buf = 138543618;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending requests [%@]", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](v5, "pendingRequests"));
  objc_msgSend(v12, "removeAllObjects");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "protocol", (_QWORD)v23));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topic"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "payload"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "callback"));
        -[DataStream sendRequestForProtocol:topic:payload:completion:](v5, "sendRequestForProtocol:topic:payload:completion:", v19, v20, v21, v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

}

- (void)_handlePendingEvents
{
  void *v3;
  id v4;
  DataStream *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingEvents](self, "pendingEvents"));
  v4 = objc_msgSend(v3, "copy");

  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count")));
    *(_DWORD *)buf = 138543618;
    v29 = v10;
    v30 = 2112;
    v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Sending out all pending events [%@]", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingEvents](v5, "pendingEvents"));
  objc_msgSend(v12, "removeAllObjects");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "protocol", (_QWORD)v23));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topic"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "payload"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "completion"));
        -[DataStream sendEventForProtocol:topic:payload:completion:](v5, "sendEventForProtocol:topic:payload:completion:", v19, v20, v21, v22);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

}

- (void)transport:(id)a3 didReceiveRawFrame:(id)a4
{
  id v5;
  void *v6;
  DataStream *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  int v17;
  DataStream *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  DataStream *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  DataStream *v38;
  uint64_t v39;
  id v40;
  __CFString *v41;
  DataStream *v42;
  uint64_t v43;
  id v44;
  __CFString *v45;
  DataStream *v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  __CFString *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  DataStream *v57;
  uint64_t v58;
  id v59;
  NSObject *v60;
  __CFString *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  DataStream *v73;
  DataStream *v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  __CFString *v78;
  NSObject *v79;
  const char *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  DataStream *v89;
  uint64_t v90;
  id v91;
  __CFString *v92;
  NSObject *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  id v98;
  __CFString *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  uint8_t buf[4];
  NSObject *v107;
  __int16 v108;
  id v109;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream delegate](self, "delegate"));
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = sub_10007CD2C(v7);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      *(_DWORD *)buf = 138543362;
      v107 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}@Data stream received frame", buf, 0xCu);

    }
    objc_msgSend(v6, "dataStreamDidReceiveRawFrame:", v7);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14 = sub_10007CD2C(v7);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      *(_DWORD *)buf = 138543362;
      v107 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Data stream received frame; but no delegate",
        buf,
        0xCu);

    }
  }
  if (objc_msgSend(v5, "length"))
  {
    v16 = objc_retainAutorelease(v5);
    v17 = *(unsigned __int8 *)objc_msgSend(v16, "bytes");
    switch(v17)
    {
      case 0:
      case 2:
        v18 = v7;
        v20 = sub_10007CCE4((uint64_t)v18, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        v22 = sub_10007CD2C(v18);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138543618;
        v107 = v23;
        v108 = 1024;
        LODWORD(v109) = v17;
        v24 = "%{public}@Data stream failed due to unrecognized frame type 0x%02x";
        v25 = v21;
        v26 = 18;
        goto LABEL_23;
      case 1:
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream sessionEncryption](v7, "sessionEncryption"));

        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream sessionEncryption](v7, "sessionEncryption"));
          v104 = 0;
          v105 = 0;
          v103 = 0;
          v35 = +[DataStreamMessageCoder decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:", v16, v34, &v105, &v104, &v103);
          v27 = (DataStream *)v105;
          v30 = v104;
          v36 = v103;

          if (!v36)
            goto LABEL_31;
          goto LABEL_26;
        }
        v42 = v7;
        v44 = sub_10007CCE4((uint64_t)v42, v43);
        v21 = objc_claimAutoreleasedReturnValue(v44);
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        v45 = sub_10007CD2C(v42);
        v23 = objc_claimAutoreleasedReturnValue(v45);
        *(_DWORD *)buf = 138543362;
        v107 = v23;
        v24 = "%{public}@Data stream failed due to receiving unencrypted frame";
        goto LABEL_22;
      case 3:
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream sessionEncryption](v7, "sessionEncryption"));

        if (v37)
        {
          v38 = v7;
          v40 = sub_10007CCE4((uint64_t)v38, v39);
          v21 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v41 = sub_10007CD2C(v38);
            v23 = objc_claimAutoreleasedReturnValue(v41);
            *(_DWORD *)buf = 138543362;
            v107 = v23;
            v24 = "%{public}@Data stream failed due to receiving encrypted frame";
LABEL_22:
            v25 = v21;
            v26 = 12;
LABEL_23:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);

          }
LABEL_24:

LABEL_25:
          v27 = 0;
          v30 = 0;
          v36 = 0;
          goto LABEL_26;
        }
        v101 = 0;
        v102 = 0;
        v100 = 0;
        v35 = +[DataStreamMessageCoder unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:](DataStreamMessageCoder, "unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:", v16, &v102, &v101, &v100);
        v27 = (DataStream *)v102;
        v30 = v101;
        v36 = v100;
        if (v36)
          goto LABEL_26;
LABEL_31:
        if ((v35 & 1) == 0)
        {
LABEL_26:
          v46 = v7;
          v48 = sub_10007CCE4((uint64_t)v46, v47);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = sub_10007CD2C(v46);
            v51 = objc_claimAutoreleasedReturnValue(v50);
            *(_DWORD *)buf = 138543618;
            v107 = v51;
            v108 = 2112;
            v109 = v36;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (%@)", buf, 0x16u);

          }
          break;
        }
        if (-[DataStream firstMessageReceived](v7, "firstMessageReceived"))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("response")));
          v54 = objc_opt_class(NSString, v53);
          if ((objc_opt_isKindOfClass(v52, v54) & 1) != 0)
            v55 = v52;
          else
            v55 = 0;
          v56 = v55;

          if (v56)
          {
            -[DataStream fulfillPendingRequestWithResponseHeader:payload:](v7, "fulfillPendingRequestWithResponseHeader:payload:", v27, v30);
LABEL_73:

            break;
          }
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("protocol")));
          v66 = objc_opt_class(NSString, v65);
          if ((objc_opt_isKindOfClass(v64, v66) & 1) != 0)
            v67 = v64;
          else
            v67 = 0;
          v68 = v67;

          if (v68)
          {
            if (objc_msgSend(v68, "isEqual:", CFSTR("control")))
            {
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("event")));
              v70 = objc_opt_class(NSString, v69);
              if ((objc_opt_isKindOfClass(v52, v70) & 1) != 0)
                v71 = v52;
              else
                v71 = 0;
              v72 = v71;

              if (v72)
              {
                v73 = (DataStream *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](v7, "controlProtocol"));
                v74 = v73;
LABEL_62:
                -[DataStream dataStream:didReceiveEvent:header:payload:](v73, "dataStream:didReceiveEvent:header:payload:", v7, v72, v27, v30);
LABEL_72:

                goto LABEL_73;
              }
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("request")));
              v86 = objc_opt_class(NSString, v85);
              if ((objc_opt_isKindOfClass(v52, v86) & 1) != 0)
                v87 = v52;
              else
                v87 = 0;
              v88 = v87;

              if (v88)
              {
                v89 = (DataStream *)objc_claimAutoreleasedReturnValue(-[DataStream controlProtocol](v7, "controlProtocol"));
                v74 = v89;
LABEL_79:
                -[DataStream dataStream:didReceiveRequest:header:payload:](v89, "dataStream:didReceiveRequest:header:payload:", v7, v88, v27, v30);
                goto LABEL_72;
              }
            }
            else
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream protocols](v7, "protocols"));
              v74 = (DataStream *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "objectForKey:", v68));

              if (!v74)
              {
                v77 = v7;
                v91 = sub_10007CCE4((uint64_t)v77, v90);
                v79 = objc_claimAutoreleasedReturnValue(v91);
                if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                {
                  v92 = sub_10007CD2C(v77);
                  v93 = objc_claimAutoreleasedReturnValue(v92);
                  *(_DWORD *)buf = 138543618;
                  v107 = v93;
                  v108 = 2112;
                  v109 = v68;
                  _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "%{public}@DataStream dropping incoming message (no protocol named %@)", buf, 0x16u);

                }
                goto LABEL_70;
              }
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("event")));
              v83 = objc_opt_class(NSString, v82);
              if ((objc_opt_isKindOfClass(v52, v83) & 1) != 0)
                v84 = v52;
              else
                v84 = 0;
              v72 = v84;

              if (v72)
              {
                v73 = v74;
                goto LABEL_62;
              }
              v52 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", CFSTR("request")));
              v95 = objc_opt_class(NSString, v94);
              if ((objc_opt_isKindOfClass(v52, v95) & 1) != 0)
                v96 = v52;
              else
                v96 = 0;
              v88 = v96;

              if (v88)
              {
                v89 = v74;
                goto LABEL_79;
              }

            }
            v74 = v7;
            v98 = sub_10007CCE4((uint64_t)v74, v97);
            v77 = objc_claimAutoreleasedReturnValue(v98);
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              goto LABEL_71;
            v99 = sub_10007CD2C(v74);
            v79 = objc_claimAutoreleasedReturnValue(v99);
            *(_DWORD *)buf = 138543362;
            v107 = v79;
            v80 = "%{public}@Message received but no protocol accepted it; dropped!";
          }
          else
          {
            v74 = v7;
            v76 = sub_10007CCE4((uint64_t)v74, v75);
            v77 = objc_claimAutoreleasedReturnValue(v76);
            if (!os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
            {
LABEL_71:

              v52 = 0;
              goto LABEL_72;
            }
            v78 = sub_10007CD2C(v74);
            v79 = objc_claimAutoreleasedReturnValue(v78);
            *(_DWORD *)buf = 138543362;
            v107 = v79;
            v80 = "%{public}@DataStream dropping incoming message (header missing protocol)";
          }
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, v80, buf, 0xCu);
LABEL_70:

          goto LABEL_71;
        }
        if (!-[DataStream handleFirstMessageReceivedOnDataStream:payload:](v7, "handleFirstMessageReceivedOnDataStream:payload:", v27, v30))
        {
          v57 = v7;
          v59 = sub_10007CCE4((uint64_t)v57, v58);
          v60 = objc_claimAutoreleasedReturnValue(v59);
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            v61 = sub_10007CD2C(v57);
            v62 = objc_claimAutoreleasedReturnValue(v61);
            *(_DWORD *)buf = 138543362;
            v107 = v62;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected first message on the data stream", buf, 0xCu);

          }
          -[DataStream close](v57, "close");
        }
        -[DataStream setFirstMessageReceived:](v7, "setFirstMessageReceived:", 1);
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream helloMessageResponseTimer](v7, "helloMessageResponseTimer"));
        objc_msgSend(v63, "suspend");

        -[DataStream setHelloMessageResponseTimer:](v7, "setHelloMessageResponseTimer:", 0);
        -[DataStream _handlePendingRequests](v7, "_handlePendingRequests");
        -[DataStream _handlePendingEvents](v7, "_handlePendingEvents");
        break;
      default:
        goto LABEL_25;
    }
  }
  else
  {
    v27 = v7;
    v29 = sub_10007CCE4((uint64_t)v27, v28);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = sub_10007CD2C(v27);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138543362;
      v107 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@DataStream dropping truncated frame of zero-length", buf, 0xCu);

    }
  }

}

- (void)fulfillPendingRequestWithResponseHeader:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  DataStream *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v16;
  uint64_t v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
      if ((objc_msgSend(v13, "matchesResponseHeader:", v6) & 1) != 0)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v13;

    if (!v14)
      goto LABEL_12;
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[DataStream callback](v14, "callback"));
    ((void (**)(_QWORD, _QWORD, id, id))v15)[2](v15, 0, v6, v7);

    v16 = objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](self, "pendingRequests"));
    -[NSObject removeObject:](v16, "removeObject:", v14);
  }
  else
  {
LABEL_9:

LABEL_12:
    v14 = self;
    v18 = sub_10007CCE4((uint64_t)v14, v17);
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = sub_10007CD2C(v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream pendingRequests](v14, "pendingRequests"));
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@No pending request found for response with header: %@. Pending %@", buf, 0x20u);

    }
  }

}

- (void)startConnectionTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream connectionTimer](self, "connectionTimer"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream connectionTimer](self, "connectionTimer"));
  objc_msgSend(v5, "setDelegateQueue:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataStream connectionTimer](self, "connectionTimer"));
  objc_msgSend(v6, "resume");

}

- (void)startHelloMessageResponseTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream helloMessageResponseTimer](self, "helloMessageResponseTimer"));
  objc_msgSend(v3, "setDelegate:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataStream helloMessageResponseTimer](self, "helloMessageResponseTimer"));
  objc_msgSend(v5, "setDelegateQueue:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataStream helloMessageResponseTimer](self, "helloMessageResponseTimer"));
  objc_msgSend(v6, "resume");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  DataStream *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  const char *v14;
  DataStream *v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  int v19;
  void *v20;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[DataStream workQueue](self, "workQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataStream connectionTimer](self, "connectionTimer"));
  if (v6 == v4)
  {
    v15 = self;
    v17 = sub_10007CCE4((uint64_t)v15, v16);
    v11 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v18 = sub_10007CD2C(v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v19 = 138543362;
      v20 = v13;
      v14 = "%{public}@Data stream failed to connect in time; closing!";
      goto LABEL_7;
    }
LABEL_8:

    -[DataStream close](self, "close");
    goto LABEL_9;
  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[DataStream helloMessageResponseTimer](self, "helloMessageResponseTimer"));

  if (v7 == v4)
  {
    v8 = self;
    v10 = sub_10007CCE4((uint64_t)v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = sub_10007CD2C(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v19 = 138543362;
      v20 = v13;
      v14 = "%{public}@Data stream failed to receive first message in time; closing!";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v19, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (DataStreamDelegate)delegate
{
  return (DataStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (DataStreamTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (HAPSecuritySessionEncryption)sessionEncryption
{
  return self->_sessionEncryption;
}

- (void)setSessionEncryption:(id)a3
{
  objc_storeStrong((id *)&self->_sessionEncryption, a3);
}

- (NSMapTable)protocols
{
  return self->_protocols;
}

- (void)setProtocols:(id)a3
{
  objc_storeStrong((id *)&self->_protocols, a3);
}

- (DataStreamControlProtocol)controlProtocol
{
  return self->_controlProtocol;
}

- (void)setControlProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_controlProtocol, a3);
}

- (BOOL)firstMessageReceived
{
  return self->_firstMessageReceived;
}

- (void)setFirstMessageReceived:(BOOL)a3
{
  self->_firstMessageReceived = a3;
}

- (HMFTimer)connectionTimer
{
  return self->_connectionTimer;
}

- (void)setConnectionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionTimer, a3);
}

- (HMFTimer)helloMessageResponseTimer
{
  return self->_helloMessageResponseTimer;
}

- (void)setHelloMessageResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)nextRequestIdentifier
{
  return self->_nextRequestIdentifier;
}

- (void)setNextRequestIdentifier:(unint64_t)a3
{
  self->_nextRequestIdentifier = a3;
}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (NSMutableArray)pendingEvents
{
  return self->_pendingEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_helloMessageResponseTimer, 0);
  objc_storeStrong((id *)&self->_connectionTimer, 0);
  objc_storeStrong((id *)&self->_controlProtocol, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_sessionEncryption, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
