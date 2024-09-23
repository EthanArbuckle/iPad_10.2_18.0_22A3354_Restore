@implementation OTPairingService

- (id)initAsInitiator:(BOOL)a3
{
  OTPairingService *v4;
  dispatch_queue_t v5;
  id v6;
  void *v7;
  void *v8;
  OTDeviceInformationActualAdapter *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)OTPairingService;
  v4 = -[OTPairingService init](&v11, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.security.otpaird", 0);
    -[OTPairingService setQueue:](v4, "setQueue:", v5);

    v4->_initiator = a3;
    v6 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.octagon"));
    -[OTPairingService setService:](v4, "setService:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService service](v4, "service"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService queue](v4, "queue"));
    objc_msgSend(v7, "addDelegate:queue:", v4, v8);

    -[OTPairingService setNotifyToken:](v4, "setNotifyToken:", 0xFFFFFFFFLL);
    v9 = objc_alloc_init(OTDeviceInformationActualAdapter);
    -[OTPairingService setDeviceInfo:](v4, "setDeviceInfo:", v9);

  }
  return v4;
}

- (NSString)pairedDeviceNotificationName
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devices"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isDefaultPairedDevice"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIDOverride"));
          v4 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ids-device-state-%@"), v8));

          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (void)initiatePairingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_not_V2(v5);

  if (-[OTPairingService initiator](self, "initiator"))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006A34;
    v9[3] = &unk_10000C428;
    v9[4] = self;
    v10 = v4;
    v7 = v4;
    dispatch_async(v6, v9);

  }
  else
  {
    v8 = _os_assert_log(0);
    _os_crash(v8);
    __break(1u);
  }
}

- (void)session:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  if (v10 == v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    objc_msgSend(v11, "didCompleteWithSuccess:error:", v6, v8);

    -[OTPairingService setSession:](self, "setSession:", 0);
    -[OTPairingService setSessionTimer:](self, "setSessionTimer:", 0);
    -[OTPairingService setUnlockTimer:](self, "setUnlockTimer:", 0);

  }
  else
  {
    v12 = _os_assert_log(0);
    _os_crash(v12);
    __break(1u);
  }
}

- (void)sendReplyToPacket
{
  NSObject *v3;
  void *v4;
  unsigned int v5;

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  v5 = objc_msgSend(v4, "acquireLockAssertion");

  if (v5)
  {
    -[OTPairingService stopWaitingForDeviceUnlock](self, "stopWaitingForDeviceUnlock");
    -[OTPairingService exchangePacketAndReply](self, "exchangePacketAndReply");
  }
  else
  {
    -[OTPairingService waitForDeviceUnlock](self, "waitForDeviceUnlock");
  }
}

- (void)deviceUnlockTimedOut
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "packet"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    objc_msgSend(v6, "setPacket:", 0);

    if (v17)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.otpaird"), 1, CFSTR("timed out waiting for companion unlock")));
      v8 = objc_alloc_init((Class)NSMutableDictionary);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_10000C9A0, CFSTR("m"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("session"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("error"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fromID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "outgoingResponseIdentifier"));
      -[OTPairingService _sendMessage:to:identifier:](self, "_sendMessage:to:identifier:", v8, v12, v13);
      -[OTPairingService scheduleGizmoPoke](self, "scheduleGizmoPoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.otpaird"), 1, CFSTR("timed out waiting for unlock")));
      -[OTPairingService session:didCompleteWithSuccess:error:](self, "session:didCompleteWithSuccess:error:", v14, 0, v15);

    }
    else
    {
      v16 = _os_assert_log(0);
      _os_crash(v16);
      __break(1u);
    }
  }
}

- (void)exchangePacketAndReply
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "packet"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  objc_msgSend(v6, "setPacket:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "channel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "packetData"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000065D4;
  v11[3] = &unk_10000C478;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "exchangePacket:complete:", v9, v11);

}

- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5
{
  -[OTPairingService _sendMessage:to:identifier:expectReply:](self, "_sendMessage:to:identifier:expectReply:", a3, a4, a5, 1);
}

- (void)_sendMessage:(id)a3 to:(id)a4 identifier:(id)a5 expectReply:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
  v15 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, IDSSendMessageOptionForceLocalDeliveryKey);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, IDSSendMessageOptionExpectsPeerResponseKey);

  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v10, IDSSendMessageOptionPeerResponseIdentifierKey);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService service](self, "service"));
  v23 = 0;
  v24 = 0;
  v18 = objc_msgSend(v17, "sendMessage:toDestinations:priority:options:identifier:error:", v12, v14, 200, v15, &v24, &v23);

  v19 = v24;
  v20 = v23;

  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "send message failed (%@): %@", buf, 0x16u);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.security.otpaird"), 3, CFSTR("IDS message send failure"), v20));
    -[OTPairingService session:didCompleteWithSuccess:error:](self, "session:didCompleteWithSuccess:error:", v21, 0, v22);

    goto LABEL_9;
  }
  if (v6)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    objc_msgSend(v21, "setSentMessageIdentifier:", v19);
LABEL_9:

  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  OTPairingPacketContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  const char *v24;
  unsigned int v25;
  _BOOL4 v26;
  void *v27;
  OTPairingSession *v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  id v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  id v39;
  __int16 v40;
  id v41;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 138412546;
    v39 = v11;
    v40 = 2112;
    v41 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS message from %@: %@", (uint8_t *)&v38, 0x16u);
  }
  v14 = -[OTPairingPacketContext initWithMessage:fromID:context:]([OTPairingPacketContext alloc], "initWithMessage:fromID:context:", v10, v11, v12);

  if (-[OTPairingPacketContext messageType](v14, "messageType") == 3)
    goto LABEL_22;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext sessionIdentifier](v14, "sessionIdentifier"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext sessionIdentifier](v14, "sessionIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
    v19 = objc_msgSend(v16, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sentMessageIdentifier"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext incomingResponseIdentifier](v14, "incomingResponseIdentifier"));
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v23 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v38) = 0;
          v24 = "ignoring message with unrecognized incomingResponseIdentifier";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v38, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
    }
    else
    {
      v25 = -[OTPairingService initiator](self, "initiator");
      v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v25)
      {
        if (v26)
        {
          LOWORD(v38) = 0;
          v24 = "unknown session identifier, dropping message";
          goto LABEL_14;
        }
        goto LABEL_22;
      }
      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext sessionIdentifier](v14, "sessionIdentifier"));
        v38 = 138412290;
        v39 = v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unknown session identifier %@, creating new session object", (uint8_t *)&v38, 0xCu);

      }
      v28 = [OTPairingSession alloc];
      v29 = -[OTPairingService initiator](self, "initiator");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService deviceInfo](self, "deviceInfo"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext sessionIdentifier](v14, "sessionIdentifier"));
      v32 = -[OTPairingSession initAsInitiator:deviceInfo:identifier:](v28, "initAsInitiator:deviceInfo:identifier:", v29, v30, v31);
      -[OTPairingService setSession:](self, "setSession:", v32);

    }
    v33 = -[OTPairingPacketContext messageType](v14, "messageType");
    if (v33 == 1)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      objc_msgSend(v37, "setPacket:", v14);

      -[OTPairingService sendReplyToPacket](self, "sendReplyToPacket");
    }
    else if (v33 == 2)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingPacketContext error](v14, "error"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.security.otpaird"), 4, CFSTR("companion error"), v35));
      -[OTPairingService session:didCompleteWithSuccess:error:](self, "session:didCompleteWithSuccess:error:", v34, 0, v36);

    }
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v38) = 0;
    v24 = "ignoring message with no session identifier (old build?)";
    goto LABEL_14;
  }
LABEL_22:

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;

  v11 = a5;
  v12 = a7;
  v13 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sentMessageIdentifier"));
  v16 = objc_msgSend(v15, "isEqualToString:", v11);

  if ((v16 & 1) != 0)
  {
    if (!a6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 138412546;
        v20 = v11;
        v21 = 2112;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unsuccessfully sent message (%@): %@", (uint8_t *)&v19, 0x16u);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService session](self, "session"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("com.apple.security.otpaird"), 3, CFSTR("IDS message failed to send"), v12));
      -[OTPairingService session:didCompleteWithSuccess:error:](self, "session:didCompleteWithSuccess:error:", v17, 0, v18);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412290;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ignoring didSendWithSuccess callback for unexpected identifier: %@", (uint8_t *)&v19, 0xCu);
  }

}

- (void)scheduleSessionTimeout
{
  NSObject *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD handler[5];

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OTPairingService initiator](self, "initiator"))
  {
    v4 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
    v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v4);
    -[OTPairingService setSessionTimer:](self, "setSessionTimer:", v5);

    v6 = objc_claimAutoreleasedReturnValue(-[OTPairingService sessionTimer](self, "sessionTimer"));
    v7 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);

    v8 = objc_claimAutoreleasedReturnValue(-[OTPairingService sessionTimer](self, "sessionTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100006530;
    handler[3] = &unk_10000C4A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    v9 = objc_claimAutoreleasedReturnValue(-[OTPairingService sessionTimer](self, "sessionTimer"));
    dispatch_activate(v9);

  }
  else
  {
    v10 = _os_assert_log(0);
    _os_crash(v10);
    __break(1u);
  }
}

- (void)waitForDeviceUnlock
{
  NSObject *v3;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  dispatch_source_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD handler[5];
  _QWORD block[5];
  int out_token;

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  out_token = -1431655766;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006438;
  block[3] = &unk_10000C4A0;
  block[4] = self;
  if (qword_1000117F8 != -1)
    dispatch_once(&qword_1000117F8, block);
  if (-[OTPairingService notifyToken](self, "notifyToken") == -1)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
    v5 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v4, &stru_10000C4E0);

    if (v5)
      _os_assumes_log(v5);
    else
      -[OTPairingService setNotifyToken:](self, "setNotifyToken:", out_token);
  }
  v6 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);
  -[OTPairingService setUnlockTimer:](self, "setUnlockTimer:", v7);

  v8 = objc_claimAutoreleasedReturnValue(-[OTPairingService unlockTimer](self, "unlockTimer"));
  v9 = dispatch_time(0, 120000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);

  v10 = objc_claimAutoreleasedReturnValue(-[OTPairingService unlockTimer](self, "unlockTimer"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000064E8;
  handler[3] = &unk_10000C4A0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  v11 = objc_claimAutoreleasedReturnValue(-[OTPairingService unlockTimer](self, "unlockTimer"));
  dispatch_activate(v11);

  if (!MKBGetDeviceLockState(0))
  {
    -[OTPairingService stopWaitingForDeviceUnlock](self, "stopWaitingForDeviceUnlock");
    v12 = dispatch_time(0, 5000000000);
    v13 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006510;
    v14[3] = &unk_10000C4A0;
    v14[4] = self;
    dispatch_after(v12, v13, v14);

  }
}

- (void)stopWaitingForDeviceUnlock
{
  NSObject *v3;
  uint32_t v4;
  void *v5;
  NSObject *v6;

  v3 = objc_claimAutoreleasedReturnValue(-[OTPairingService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[OTPairingService notifyToken](self, "notifyToken") != -1)
  {
    v4 = notify_cancel(-[OTPairingService notifyToken](self, "notifyToken"));
    if (v4)
      _os_assumes_log(v4);
    -[OTPairingService setNotifyToken:](self, "setNotifyToken:", 0xFFFFFFFFLL);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPairingService unlockTimer](self, "unlockTimer"));

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[OTPairingService unlockTimer](self, "unlockTimer"));
    dispatch_source_cancel(v6);

    -[OTPairingService setUnlockTimer:](self, "setUnlockTimer:", 0);
  }
}

- (void)scheduleGizmoPoke
{
  xpc_object_t v3;
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_DELAY, 0);
  xpc_dictionary_set_int64(v3, XPC_ACTIVITY_GRACE_PERIOD, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_REQUIRES_CLASS_A, 1);
  xpc_dictionary_set_BOOL(v3, XPC_ACTIVITY_COMMUNICATES_WITH_PAIRED_DEVICE, 1);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "scheduling XPC Activity to inform gizmo of companion unlock", buf, 2u);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000632C;
  handler[3] = &unk_10000C508;
  handler[4] = self;
  xpc_activity_register("com.apple.security.otpaird.poke", v3, handler);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)initiator
{
  return self->_initiator;
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_source)unlockTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnlockTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (OTDeviceInformationActualAdapter)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfo, a3);
}

- (OTPairingSession)session
{
  return (OTPairingSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_source)sessionTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSessionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_unlockTimer, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (id)sharedService
{
  if (qword_1000117E8 != -1)
    dispatch_once(&qword_1000117E8, &stru_10000C400);
  return (id)qword_1000117F0;
}

@end
