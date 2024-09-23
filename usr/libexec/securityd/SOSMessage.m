@implementation SOSMessage

- (SOSMessage)initWithAccount:(id)a3 andName:(id)a4
{
  id v7;
  id v8;
  SOSMessage *v9;
  uint64_t (**v10)(id, id, _QWORD);
  uint64_t v11;
  __OpaqueSOSEngine *v12;
  NSString *v13;
  NSString *circleName;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SOSMessage;
  v9 = -[SOSMessage init](&v16, "init");
  if (v9)
  {
    v10 = (uint64_t (**)(id, id, _QWORD))objc_msgSend(v7, "factory");
    if (v10 && (v11 = v10[1](v10, v8, 0)) != 0)
    {
      v12 = *(__OpaqueSOSEngine **)v11;
      (*(void (**)(uint64_t, _QWORD))(v11 + 72))(v11, 0);
      if (v12)
        CFRetain(v12);
    }
    else
    {
      v12 = 0;
    }
    v9->_engine = v12;
    objc_storeStrong((id *)&v9->_account, a3);
    v13 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v8);
    circleName = v9->_circleName;
    v9->_circleName = v13;

  }
  return v9;
}

- (void)dealloc
{
  __OpaqueSOSEngine *engine;
  objc_super v4;

  engine = self->_engine;
  if (engine)
  {
    self->_engine = 0;
    CFRelease(engine);
  }
  v4.receiver = self;
  v4.super_class = (Class)SOSMessage;
  -[SOSMessage dealloc](&v4, "dealloc");
}

- (void)SOSTransportMessageGetEngine
{
  void *v3;
  uint64_t (**v4)(id, void *, _QWORD);
  void *v5;
  uint64_t v6;
  const void *v7;

  if (!-[SOSMessage engine](self, "engine"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage account](self, "account"));
    v4 = (uint64_t (**)(id, void *, _QWORD))objc_msgSend(v3, "factory");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));
    if (v4 && (v6 = v4[1](v4, v5, 0)) != 0)
    {
      v7 = *(const void **)v6;
      (*(void (**)(uint64_t, _QWORD))(v6 + 72))(v6, 0);

      if (v7)
        CFRetain(v7);
    }
    else
    {

      v7 = 0;
    }
    -[SOSMessage setEngine:](self, "setEngine:", v7);
  }
  return -[SOSMessage engine](self, "engine");
}

- (__CFString)SOSTransportMessageGetCircleName
{
  __CFString *v2;

  v2 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SOSMessage circleName](self, "circleName"));

  return v2;
}

- (int64_t)SOSTransportMessageGetTransportType
{
  return 0;
}

- (BOOL)SOSTransportMessageSendMessages:(id)a3 pm:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageFlushChanges:(id)a3 err:(__CFError *)a4
{
  return 1;
}

- (BOOL)SOSTransportMessageSyncWithPeers:(id)a3 p:(__CFSet *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageCleanupAfterPeerMessages:(id)a3 peers:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return 1;
}

- (BOOL)SOSTransportMessageSendMessage:(id)a3 id:(__CFString *)a4 messageToSend:(__CFData *)a5 err:(__CFError *)a6
{
  id v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  CFDictionaryRef v18;
  BOOL v19;

  v10 = a3;
  v18 = sub_10012E96C(kCFAllocatorDefault, v11, v12, v13, v14, v15, v16, v17, (uint64_t)a4, (uint64_t)a5);
  v19 = -[SOSMessage SOSTransportMessageSendMessages:pm:err:](self, "SOSTransportMessageSendMessages:pm:err:", v10, v18, a6);

  if (v18)
    CFRelease(v18);
  return v19;
}

- (__CFDictionary)SOSTransportMessageHandlePeerMessageReturnsHandledCopy:(id)a3 peerMessages:(__CFDictionary *)a4 err:(__CFError *)a5
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

- (void)SOSTransportMessageCalculateNextTimer:(id)a3 rtt:(int)a4 peerid:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  signed int v14;
  unsigned int v15;
  uint64_t v16;
  id v17;
  const void *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  int v23;

  v7 = a3;
  v8 = a5;
  v9 = sub_1001CA91C(v7, (uint64_t)CFSTR("PeerNegotiationTimeouts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v11 = 2 * a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));
  v13 = v12;
  if (!v12 || (v14 = objc_msgSend(v12, "intValue"), a4 > 1800) || v14 < v11)
  {
    if (v11 <= 60)
      v15 = 60;
    else
      v15 = 2 * a4;
    if (v15 >= 0xE10)
      v16 = 3600;
    else
      v16 = v15;
    v17 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v16);
    objc_msgSend(v10, "setObject:forKey:", v17, v8);
    v18 = sub_10000EF14("otrtimer");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = v8;
      v22 = 1024;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "peerID: %@ New OTR RTT: %d", (uint8_t *)&v20, 0x12u);
    }

    sub_1001E6A88(v7, (uint64_t)CFSTR("PeerNegotiationTimeouts"), (uint64_t)v10, 0);
  }

}

- (void)SOSTransportMessageUpdateRTTs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SOSMessage SOSTransportMessageGetAccount](self, "SOSTransportMessageGetAccount"));
  v6 = sub_1001CA91C(v5, (uint64_t)CFSTR("kSOSAccountPeerLastSentTimestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v10, "timeIntervalSinceDate:", v9);
      v12 = v11;
      v13 = sub_10000EF14("otrtimer");
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v22 = v4;
        v23 = 2112;
        v24 = v10;
        v25 = 2112;
        v26 = v9;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "peerID: %@ current date: %@, stored date: %@", buf, 0x20u);
      }

      v15 = sub_10000EF14("otrtimer");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v22) = (int)v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "rtt: %d", buf, 8u);
      }

      -[SOSMessage SOSTransportMessageCalculateNextTimer:rtt:peerid:](self, "SOSTransportMessageCalculateNextTimer:rtt:peerid:", v5, (int)v12, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (int)v12, SecCoreAnalyticsValue));
      v20 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
      +[SecCoreAnalytics sendEvent:event:](SecCoreAnalytics, "sendEvent:event:", CFSTR("com.apple.security.sos.messagertt"), v18);

      objc_msgSend(v8, "removeObjectForKey:", v4);
      sub_1001E6A88(v5, (uint64_t)CFSTR("kSOSAccountPeerLastSentTimestamp"), (uint64_t)v8, 0);

    }
  }

}

- (BOOL)SOSTransportMessageHandlePeerMessage:(id)a3 id:(__CFString *)a4 cm:(__CFData *)a5 err:(__CFError *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  const void *v16;
  NSObject *v17;
  BOOL v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t *v32;
  __CFString *v33;
  __CFData *v34;
  __CFError **v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v10 = a3;
  -[SOSMessage SOSTransportMessageUpdateRTTs:](self, "SOSTransportMessageUpdateRTTs:", a4);
  v11 = objc_msgSend(v10, "engine");
  sub_10003268C(v11 != 0, (CFTypeRef *)a6, CFSTR("Missing engine"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "SOSTransportMessageGetAccount"));
    v13 = objc_msgSend(v10, "engine");
    v14 = v12;
    v15 = v14;
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 1;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    if (v14 && objc_msgSend(v14, "accountIsChanging"))
    {
      v16 = sub_10000EF14("engine");
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SOSEngineHandleCodedMessage called before signing in to new account", (uint8_t *)v29, 2u);
      }
      v18 = 1;
    }
    else
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1001FD560;
      v29[3] = &unk_1002ECC30;
      v33 = a4;
      v34 = a5;
      v35 = a6;
      v30 = v15;
      v31 = &v41;
      v36 = v13;
      v32 = &v37;
      v19 = sub_1000FC2C0((uint64_t)v13, (uint64_t)a4, (uint64_t)a6, v29);
      if (*((_BYTE *)v42 + 24))
        v27 = v19;
      else
        v27 = 0;
      *((_BYTE *)v42 + 24) = v27;
      if (*((_BYTE *)v38 + 24))
      {
        sub_100133374();
        v27 = *((unsigned __int8 *)v42 + 24);
      }
      if (v27)
      {
        sub_10020D45C((uint64_t)a4, v20, v21, v22, v23, v24, v25, v26);
        v18 = *((_BYTE *)v42 + 24) != 0;
      }
      else
      {
        v18 = 0;
      }
      v17 = v30;
    }

    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)SOSTransportMessageUpdateLastMessageSentTimetstamp:(id)a3 peer:(__OpaqueSOSPeer *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = sub_1001CA91C(v9, (uint64_t)CFSTR("kSOSAccountPeerLastSentTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", *((_QWORD *)a4 + 2)));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v6, "setObject:forKey:", v8, *((_QWORD *)a4 + 2));

    sub_1001E6A88(v9, (uint64_t)CFSTR("kSOSAccountPeerLastSentTimestamp"), (uint64_t)v6, 0);
  }

}

- (BOOL)SOSTransportMessageSendMessageIfNeeded:(id)a3 circleName:(__CFString *)a4 pID:(__CFString *)a5 err:(__CFError *)a6
{
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  char v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  __CFString *v21;
  __CFError **v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "account"));
  v10 = sub_1001DF090(v9, 2);
  v11 = objc_msgSend(v8, "engine");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001FC3DC;
  v17[3] = &unk_1002ECC58;
  v20 = &v24;
  v12 = v8;
  v18 = v12;
  v21 = a5;
  v22 = a6;
  v23 = v10;
  v13 = v9;
  v19 = v13;
  v14 = sub_1000FC2C0((uint64_t)v11, (uint64_t)a5, (uint64_t)a6, v17);
  if (*((_BYTE *)v25 + 24))
    v15 = v14;
  else
    v15 = 0;
  *((_BYTE *)v25 + 24) = v15;

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (__OpaqueSOSEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(__OpaqueSOSEngine *)a3
{
  self->_engine = a3;
}

- (SOSAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSString)circleName
{
  return self->_circleName;
}

- (void)setCircleName:(id)a3
{
  objc_storeStrong((id *)&self->_circleName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleName, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
