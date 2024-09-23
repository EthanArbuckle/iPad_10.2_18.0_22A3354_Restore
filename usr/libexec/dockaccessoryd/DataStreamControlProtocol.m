@implementation DataStreamControlProtocol

- (DataStreamControlProtocol)initWithLogIdentifier:(id)a3
{
  id v4;
  DataStreamControlProtocol *v5;
  DataStreamControlProtocol *v6;
  NSNumber *pendingHelloMessageIdentifier;
  NSString *v8;
  NSString *logIdentifier;
  NSNumber *peerDataStreamProtocolVersion;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DataStreamControlProtocol;
  v5 = -[DataStreamControlProtocol init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    pendingHelloMessageIdentifier = v5->_pendingHelloMessageIdentifier;
    v5->_pendingHelloMessageIdentifier = 0;

    *(_WORD *)&v6->_helloMessageResponseReceived = 0;
    v8 = (NSString *)objc_msgSend(v4, "copy");
    logIdentifier = v6->_logIdentifier;
    v6->_logIdentifier = v8;

    peerDataStreamProtocolVersion = v6->_peerDataStreamProtocolVersion;
    v6->_peerDataStreamProtocolVersion = (NSNumber *)&off_100245838;

  }
  return v6;
}

- (BOOL)isActive
{
  return 1;
}

- (void)dataStreamDidOpen:(id)a3
{
  DataStreamControlProtocol *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = self;
  v5 = a3;
  v7 = sub_10007CCE4((uint64_t)v4, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_10007CD2C(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138543362;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@Sending hello control message", (uint8_t *)&v11, 0xCu);

  }
  -[DataStreamControlProtocol _sendHelloMessageOnDataStream:](v4, "_sendHelloMessageOnDataStream:", v5);

}

- (void)dataStream:(id)a3 didReceiveRequest:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DataStreamControlProtocol *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  unsigned int v20;
  DataStreamControlProtocol *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *peerDataStreamProtocolVersion;
  __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;
  const __CFString *v37;
  _UNKNOWN **v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "isEqual:", CFSTR("hello")))
  {
    v14 = self;
    v16 = sub_10007CCE4((uint64_t)v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v33 = 138543362;
      v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@Hello control message received", (uint8_t *)&v33, 0xCu);

    }
    objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v12, &__NSDictionary0__struct, 0, &stru_100238098);
  }
  else
  {
    v20 = objc_msgSend(v11, "isEqual:", CFSTR("version"));
    v21 = self;
    v23 = sub_10007CCE4((uint64_t)v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = v24;
    if (v20)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = sub_10007CD2C(v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v33 = 138543362;
        v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}@Version control message received", (uint8_t *)&v33, 0xCu);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("version")));

      if (v28)
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("version")));
        peerDataStreamProtocolVersion = v21->_peerDataStreamProtocolVersion;
        v21->_peerDataStreamProtocolVersion = (NSNumber *)v29;

      }
      v37 = CFSTR("version");
      v38 = &off_100245828;
      v21 = (DataStreamControlProtocol *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      objc_msgSend(v10, "sendResponseForRequestHeader:payload:status:completion:", v12, v21, 0, &stru_1002380B8);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v31 = sub_10007CD2C(v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = 138543618;
        v34 = v32;
        v35 = 2112;
        v36 = v11;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@Control Protocol received unexpected request '%@'", (uint8_t *)&v33, 0x16u);

      }
    }

  }
}

- (BOOL)isExpectedHelloControlMessage:(id)a3 header:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;

  v6 = a4;
  if (objc_msgSend(a3, "isEqual:", CFSTR("hello"))
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamControlProtocol pendingHelloMessageIdentifier](self, "pendingHelloMessageIdentifier")),
        v7,
        v7)
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"))),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DataStreamControlProtocol pendingHelloMessageIdentifier](self, "pendingHelloMessageIdentifier")),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status")));
    v12 = objc_msgSend(v11, "isEqual:", &off_1002457F8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)dataStream:(id)a3 didReceiveResponse:(id)a4 header:(id)a5 payload:(id)a6
{
  id v10;
  id v11;
  id v12;
  DataStreamControlProtocol *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  DataStreamControlProtocol *v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  _BOOL4 v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSNumber *peerDataStreamProtocolVersion;
  __CFString *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[DataStreamControlProtocol isExpectedHelloControlMessage:header:](self, "isExpectedHelloControlMessage:header:", v11, a5))
  {
    v13 = self;
    v15 = sub_10007CCE4((uint64_t)v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = sub_10007CD2C(v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v33 = 138543362;
      v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%{public}@Hello control message reply received", (uint8_t *)&v33, 0xCu);

    }
    if (!-[DataStreamControlProtocol helloMessageResponseReceived](v13, "helloMessageResponseReceived"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("capability-version")));

      if (v19)
        -[DataStreamControlProtocol _sendVersionRequestOnDataStream:](v13, "_sendVersionRequestOnDataStream:", v10);
      else
        v13->_controlHandshakeComplete = 1;
    }
    -[DataStreamControlProtocol setHelloMessageResponseReceived:](v13, "setHelloMessageResponseReceived:", 1);
    -[DataStreamControlProtocol setPendingHelloMessageIdentifier:](v13, "setPendingHelloMessageIdentifier:", 0);
  }
  else
  {
    v20 = objc_msgSend(v11, "isEqual:", CFSTR("version"));
    v21 = self;
    v23 = sub_10007CCE4((uint64_t)v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v25)
      {
        v26 = sub_10007CD2C(v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        v33 = 138543618;
        v34 = v27;
        v35 = 2112;
        v36 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@Received Peer Request Version Response %@", (uint8_t *)&v33, 0x16u);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("version")));

      if (v28)
      {
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("version")));
        peerDataStreamProtocolVersion = v21->_peerDataStreamProtocolVersion;
        v21->_peerDataStreamProtocolVersion = (NSNumber *)v29;

      }
      v21->_controlHandshakeComplete = 1;
    }
    else
    {
      if (v25)
      {
        v31 = sub_10007CD2C(v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = 138543362;
        v34 = v32;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@Expected hello reply or Version but got something else", (uint8_t *)&v33, 0xCu);

      }
    }
  }

}

- (void)_sendHelloMessageOnDataStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  v5 = sub_1000125E4();
  v6 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", v5);
  -[DataStreamControlProtocol setPendingHelloMessageIdentifier:](self, "setPendingHelloMessageIdentifier:", v6);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000820D0;
  v7[3] = &unk_100237150;
  v7[4] = self;
  objc_msgSend(v4, "sendRequestForProtocol:topic:identifier:payload:completion:", CFSTR("control"), CFSTR("hello"), v5, &__NSDictionary0__struct, v7);

}

- (void)_sendVersionRequestOnDataStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  const __CFString *v8;
  _UNKNOWN **v9;

  v4 = a3;
  v5 = sub_1000125E4();
  v8 = CFSTR("version");
  v9 = &off_100245828;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000822D4;
  v7[3] = &unk_100237150;
  v7[4] = self;
  objc_msgSend(v4, "sendRequestForProtocol:topic:identifier:payload:completion:", CFSTR("control"), CFSTR("version"), v5, v6, v7);

}

- (BOOL)helloMessageResponseReceived
{
  return self->_helloMessageResponseReceived;
}

- (void)setHelloMessageResponseReceived:(BOOL)a3
{
  self->_helloMessageResponseReceived = a3;
}

- (NSNumber)peerDataStreamProtocolVersion
{
  return self->_peerDataStreamProtocolVersion;
}

- (void)setPeerDataStreamProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)pendingHelloMessageIdentifier
{
  return self->_pendingHelloMessageIdentifier;
}

- (void)setPendingHelloMessageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, a3);
}

- (BOOL)controlHandshakeComplete
{
  return self->_controlHandshakeComplete;
}

- (void)setControlHandshakeComplete:(BOOL)a3
{
  self->_controlHandshakeComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingHelloMessageIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDataStreamProtocolVersion, 0);
}

@end
