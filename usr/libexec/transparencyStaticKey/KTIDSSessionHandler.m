@implementation KTIDSSessionHandler

- (KTIDSSessionHandler)initWithTransport:(id)a3 peerName:(id)a4
{
  KTIDSSessionHandler *v6;
  id v7;
  KTIDSSessionHandler *v8;
  KTIDSSessionHandler *v9;
  id v10;
  id v11;
  KTIDSSessionHandler *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  os_log_t v17;
  dispatch_queue_t v18;
  objc_super v20;

  v6 = (KTIDSSessionHandler *)a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)KTIDSSessionHandler;
  v8 = -[KTIDSSessionHandler init](&v20, "init");
  if (v8)
  {
    v9 = v6;
    if (v6
      || (v10 = objc_alloc((Class)IDSService),
          v11 = objc_msgSend(v10, "initWithService:", off_100089868),
          -[KTIDSSessionHandler setService:](v8, "setService:", v11),
          v11,
          v12 = (KTIDSSessionHandler *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler service](v8, "service")),
          v12,
          v9 = v8,
          v12))
    {
      -[KTIDSSessionHandler setTransport:](v8, "setTransport:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[KTIDSSessionHandler setSessionIDLookup:](v8, "setSessionIDLookup:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      -[KTIDSSessionHandler setIdsHandleLookup:](v8, "setIdsHandleLookup:", v14);

      if (v7)
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("KTIDSSessionHandler-%{mask.hash}@"), v7));
      else
        v15 = CFSTR("KTIDSSessionHandler");
      v16 = objc_retainAutorelease(v15);
      v17 = os_log_create("com.apple.Transparency", (const char *)-[__CFString UTF8String](v16, "UTF8String"));
      -[KTIDSSessionHandler setOslog:](v8, "setOslog:", v17);

      v18 = dispatch_queue_create("KTIDSSessionHandler", 0);
      -[KTIDSSessionHandler setQueue:](v8, "setQueue:", v18);

      -[KTIDSSessionHandler setupTransport](v8, "setupTransport");
      v12 = v8;

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setupTransport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v3, "setMessagedAction:forIncomingRequestsOfType:", "ktAnnounce:service:account:fromID:context:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v4, "setMessagedAction:forIncomingRequestsOfType:", "ktCommit:service:account:fromID:context:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v5, "setMessagedAction:forIncomingRequestsOfType:", "ktSetupB:service:account:fromID:context:", 4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v6, "setMessagedAction:forIncomingRequestsOfType:", "ktRevealA:service:account:fromID:context:", 5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v7, "setMessagedAction:forIncomingRequestsOfType:", "ktConfirm:service:account:fromID:context:", 6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v8, "setMessagedAction:forIncomingRequestsOfType:", "ktTeardown:service:account:fromID:context:", 3);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  objc_msgSend(v9, "setMessagedAction:forIncomingRequestsOfType:", "ktSelected:service:account:fromID:context:", 2);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  objc_msgSend(v11, "startMessageDelegate:onQueue:", self, v10);

}

- (void)setMessagedAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;

  v4 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler service](self, "service"));
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", a3, v4);

}

- (void)startMessageDelegate:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler service](self, "service"));
  objc_msgSend(v8, "addDelegate:withDelegateProperties:queue:", v7, 0, v6);

}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 fromHandle:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;

  v8 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = v13;
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, IDSSendMessageOptionFromIDKey);
  v15 = objc_msgSend(objc_alloc((Class)IDSProtobuf), "initWithProtobufData:type:isResponse:", v12, v8, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler service](self, "service"));
  v22 = 0;
  v17 = objc_msgSend(v16, "sendProtobuf:toDestinations:priority:options:identifier:error:", v15, v10, 300, v14, 0, &v22);
  v18 = v22;

  if ((v17 & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "componentsJoinedByString:", CFSTR(",")));

    v21 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110658;
      v24 = v8;
      v25 = 2160;
      v26 = 1752392040;
      v27 = 2112;
      v28 = v20;
      v29 = 2160;
      v30 = 1752392040;
      v31 = 2112;
      v32 = v11;
      v33 = 2160;
      v34 = 1752392040;
      v35 = 2112;
      v36 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%d send sendProtobuf to %{mask.hash}@ from %{mask.hash}@ failed with: %{mask.hash}@", buf, 0x44u);
    }

  }
}

- (id)mapMailbox:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "mapMailbox"));
  else
    return 0;
}

- (id)findSessionByHandle:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100007C98;
  v16 = sub_100007CA8;
  v17 = 0;
  v5 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007CB0;
  block[3] = &unk_100070AC0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)findSessionByID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = objc_retainAutorelease(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithHexString:](NSData, "kt_dataWithHexString:", objc_msgSend(v4, "UTF8String")));
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_100007C98;
    v17 = sub_100007CA8;
    v18 = 0;
    v6 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007E9C;
    block[3] = &unk_100070AC0;
    v12 = &v13;
    block[4] = self;
    v11 = v5;
    dispatch_sync(v6, block);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10004FD68(v8);

    v7 = 0;
  }

  return v7;
}

- (id)listSessions
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007FD0;
  v9[3] = &unk_100070AE8;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(v4, v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

- (BOOL)deleteSessionByID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[5];
  id v14;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v17;
  char v18;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting sessionID: [%{public}@]", (uint8_t *)&buf, 0xCu);
  }

  v6 = objc_retainAutorelease(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData kt_dataWithHexString:](NSData, "kt_dataWithHexString:", objc_msgSend(v6, "UTF8String")));
  if (v7)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v17 = 0x2020000000;
    v18 = 0;
    v8 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000082E0;
    block[3] = &unk_100070B10;
    block[4] = self;
    v14 = v7;
    p_buf = &buf;
    dispatch_sync(v8, block);

    v9 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10004FDF8((uint64_t)v6, v10, v11);

    v9 = 0;
  }

  return v9;
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 mailbox:(id)a5 fromID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
  if (v14)
  {
    if (!v12)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peer"));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "peer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastUsedAddressOfMe"));
    -[KTIDSSessionHandler sendMessage:data:toID:sourceID:](self, "sendMessage:data:toID:sourceID:", v8, v10, v12, v17);

  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10004FEEC(v8, v18);

  }
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 toID:(id)a5 sourceID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _DWORD v18[2];
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)IDSCopyBestGuessIDForID(v11);
  if (v13)
  {
    if (v12)
      v14 = IDSCopyBestGuessIDForID(v12);
    else
      v14 = 0;
    v15 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18[0] = 67110658;
      v18[1] = v8;
      v19 = 2160;
      v20 = 1752392040;
      v21 = 2112;
      v22 = v13;
      v23 = 2160;
      v24 = 1752392040;
      v25 = 2112;
      v26 = v14;
      v27 = 2160;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "sending message %d to: %{mask.hash}@ from: %{mask.hash}@[%{mask.hash}@]", (uint8_t *)v18, 0x44u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler transport](self, "transport"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
    objc_msgSend(v16, "sendMessage:data:targets:fromHandle:", v8, v10, v17, v14);

  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10004FF60(v8, (uint64_t)v11, v14);
  }

}

- (id)setupMailbox:(id)a3 publicInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  KTIDSSessionHandler *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_100007C98;
  v22 = sub_100007CA8;
  v23 = 0;
  v8 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000087AC;
  v13[3] = &unk_100070B38;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)resetSession:(id)a3
{
  id v4;

  v4 = a3;
  -[KTIDSSessionHandler removeSessionIDLookup:](self, "removeSessionIDLookup:", v4);
  objc_msgSend(v4, "reset");

}

- (BOOL)startSession:(id)a3
{
  objc_msgSend(a3, "startSession");
  return 1;
}

- (BOOL)validateAnnounce:(id)a3 updateSession:(id)a4
{
  return 1;
}

- (void)tearDown:(id)a3 toID:(id)a4 fromID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SASTeardown *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = objc_alloc_init(SASTeardown);
  -[SASTeardown setSessionId:](v12, "setSessionId:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v12, "data"));
  -[KTIDSSessionHandler sendMessage:data:toID:sourceID:](self, "sendMessage:data:toID:sourceID:", 3, v11, v9, v8);

}

- (void)ktAnnounce:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  SKMailbox *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  NSObject *v20;
  SKMailbox *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  id v30;

  v9 = a6;
  v10 = a3;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)IDSCopyAddressDestinationForDestination(v9);
  -[KTIDSSessionHandler dumpState:](self, "dumpState:", CFSTR("SASAnnounce"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v14 = (SKMailbox *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

  if (v14)
  {
    v15 = objc_claimAutoreleasedReturnValue(-[SKMailbox destinationIDSID](v14, "destinationIDSID"));
    if (v15
      && (v16 = (void *)v15,
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox destinationIDSID](v14, "destinationIDSID")),
          v18 = objc_msgSend(v17, "isEqual:", v9),
          v17,
          v16,
          (v18 & 1) == 0))
    {
      -[KTIDSSessionHandler resetSession:](self, "resetSession:", v14);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox destinationIDSID](v14, "destinationIDSID"));

      if (v19)
        goto LABEL_11;
    }
    -[SKMailbox setDestinationIDSID:](v14, "setDestinationIDSID:", v9);
  }
  else
  {
    v20 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 141558274;
      v28 = 1752392040;
      v29 = 2112;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "ktAnnounce: new session: %{mask.hash}@", (uint8_t *)&v27, 0x16u);
    }

    v21 = [SKMailbox alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    v14 = -[SKMailbox initWithLogging:publicInfo:peerIDSID:session:](v21, "initWithLogging:publicInfo:peerIDSID:session:", v22, 0, v12, self);

    -[SKMailbox setDestinationIDSID:](v14, "setDestinationIDSID:", v9);
    v23 = objc_msgSend(objc_alloc((Class)KTStaticKeyPeer), "initWithPeer:", v12);
    -[SKMailbox setPeer:](v14, "setPeer:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v14, v12);

  }
LABEL_11:
  v25 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 141558274;
    v28 = 1752392040;
    v29 = 2112;
    v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktAnnounce: %{mask.hash}@", (uint8_t *)&v27, 0x16u);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
  -[SKMailbox recvAnnounce:](v14, "recvAnnounce:", v26);

}

- (void)ktSelected:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  SASSelected *v14;
  void *v15;
  SASSelected *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;

  v10 = a6;
  v11 = a7;
  v12 = a3;
  v13 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v13);

  v14 = [SASSelected alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));

  v16 = -[TransparencyGPBMessage initWithData:error:](v14, "initWithData:error:", v15, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SASSelected sessionId](v16, "sessionId"));
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    v19 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SASSelected sessionId](v16, "sessionId"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "kt_hexString"));
      v29 = 141558530;
      v30 = 1752392040;
      v31 = 2112;
      v32 = v10;
      v33 = 2114;
      v34 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ktSelected: session: %{mask.hash}@ - %{public}@", (uint8_t *)&v29, 0x20u);

    }
    v22 = (void *)IDSCopyAddressDestinationForDestination(v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", v22));

    if (v24)
    {
      objc_msgSend(v24, "recvSelected:", v16);
    }
    else
    {
      v25 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toID"));
        v29 = 141558786;
        v30 = 1752392040;
        v31 = 2112;
        v32 = v10;
        v33 = 2160;
        v34 = 1752392040;
        v35 = 2112;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktSelected: teardown %{mask.hash}@ %{mask.hash}@", (uint8_t *)&v29, 0x2Au);

      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SASSelected sessionId](v16, "sessionId"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "toID"));
      -[KTIDSSessionHandler tearDown:toID:fromID:](self, "tearDown:toID:fromID:", v27, v10, v28);

    }
  }

}

- (void)ktCommit:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v9 = a3;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)IDSCopyAddressDestinationForDestination(v10);
  -[KTIDSSessionHandler dumpState:](self, "dumpState:", CFSTR("ktCommit"));
  v13 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 141558274;
    v18 = 1752392040;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktCommit: %{mask.hash}@", (uint8_t *)&v17, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v15, "recvCommit:", v16);
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 141558274;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ktCommit: mb not found for %{mask.hash}@", (uint8_t *)&v17, 0x16u);
    }
  }

}

- (void)ktSetupB:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;

  v9 = a3;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)IDSCopyAddressDestinationForDestination(v10);
  -[KTIDSSessionHandler dumpState:](self, "dumpState:", CFSTR("ktSetupB"));
  v13 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 141558274;
    v18 = 1752392040;
    v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktSetupB: %{mask.hash}@", (uint8_t *)&v17, 0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));

  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v15, "recvReplyB:", v16);
  }
  else
  {
    v16 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 141558274;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "mb not found for %{mask.hash}@", (uint8_t *)&v17, 0x16u);
    }
  }

}

- (void)ktRevealA:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;

  v9 = a3;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v25 = 138543362;
    v26 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ktRevealA %{public}@", (uint8_t *)&v25, 0xCu);
  }

  -[KTIDSSessionHandler dumpState:](self, "dumpState:", CFSTR("ktRevealA"));
  v13 = (void *)IDSCopyAddressDestinationForDestination(v10);
  v14 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 141558274;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ktRevealA: %{mask.hash}@", (uint8_t *)&v25, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v13));

  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v16, "recvDiscloseA:", v17);
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10004FFF8(v17, v18, v19, v20, v21, v22, v23, v24);
  }

}

- (void)ktConfirm:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  id v28;

  v9 = a3;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = (void *)IDSCopyAddressDestinationForDestination(v10);
  v13 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 141558274;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ktConfirm %{mask.hash}@", (uint8_t *)&v25, 0x16u);
  }

  -[KTIDSSessionHandler dumpState:](self, "dumpState:", CFSTR("ktConfirm"));
  v14 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 141558274;
    v26 = 1752392040;
    v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "ktConfirm: %{mask.hash}@", (uint8_t *)&v25, 0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v12));

  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v16, "recvConfirm:", v17);
  }
  else
  {
    v17 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10004FFF8(v17, v18, v19, v20, v21, v22, v23, v24);
  }

}

- (void)ktTeardown:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  SASTeardown *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;

  v9 = a3;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  v12 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    v28 = 1752392040;
    v29 = 2112;
    v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ktTeardown %{mask.hash}@", buf, 0x16u);
  }

  v13 = (void *)IDSCopyAddressDestinationForDestination(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

  if (v15)
  {
    v16 = [SASTeardown alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    v18 = -[TransparencyGPBMessage initWithData:error:](v16, "initWithData:error:", v17, 0);

    if (!v18
      || (v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sessionId](v18, "sessionId")),
          v19,
          !v19))
    {
      v22 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100050088();
      goto LABEL_18;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "peerSessionID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sessionId](v18, "sessionId"));
    if (objc_msgSend(v20, "isEqual:", v21))
    {

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localSessionID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sessionId](v18, "sessionId"));
      v26 = objc_msgSend(v23, "isEqual:", v24);

      if (!v26)
      {
        v22 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_1000500E8(v18, v15, v22);
        goto LABEL_18;
      }
    }
    v25 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "ktTeardown: session match, tearing down", buf, 2u);
    }

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "data"));
    objc_msgSend(v15, "recvTeardown:", v22);
LABEL_18:

    goto LABEL_19;
  }
  v18 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    sub_100050028();
LABEL_19:

}

+ (int64_t)compareLocalSessionID:(id)a3 remoteSessionID:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    v8 = objc_msgSend(v5, "length");
    if (v8 <= objc_msgSend(v6, "length"))
    {
      v9 = objc_msgSend(v5, "length");
      if (v9 >= objc_msgSend(v6, "length"))
      {
        v10 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
        v11 = objc_retainAutorelease(v6);
        v7 = memcmp(v10, objc_msgSend(v11, "bytes"), (size_t)objc_msgSend(v11, "length")) >> 31;
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = 1;
    }
  }

  return v7;
}

- (void)addMailbox:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler sessionIDLookup](self, "sessionIDLookup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handleID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerHandles", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)removeAddressLookup:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if ((objc_msgSend(v4, "deletedHandles") & 1) == 0)
  {
    objc_msgSend(v4, "setDeletedHandles:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerHandles", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)removeSessionIDLookup:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler sessionIDLookup](self, "sessionIDLookup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handleID"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v5);
}

- (void)removeMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "negotiatedSessionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localSessionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "removing session %{public}@, local-session %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[KTIDSSessionHandler removeAddressLookup:](self, "removeAddressLookup:", v4);
  -[KTIDSSessionHandler removeSessionIDLookup:](self, "removeSessionIDLookup:", v4);
  objc_msgSend(v4, "sendTeardown");

}

- (void)dumpState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler oslog](self, "oslog"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "session handler-lookup state: %{public}@", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler idsHandleLookup](self, "idsHandleLookup"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A54C;
  v7[3] = &unk_100070B60;
  v7[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)negotiatedSessionID:(id)a3 forMailbox:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[KTIDSSessionHandler sessionIDLookup](self, "sessionIDLookup"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (KTIDSSessionTransport)transport
{
  return (KTIDSSessionTransport *)objc_loadWeakRetained((id *)&self->_transport);
}

- (void)setTransport:(id)a3
{
  objc_storeWeak((id *)&self->_transport, a3);
}

- (OS_os_log)oslog
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOslog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)sessionIDLookup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionIDLookup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)idsHandleLookup
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsHandleLookup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsHandleLookup, 0);
  objc_storeStrong((id *)&self->_sessionIDLookup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_oslog, 0);
  objc_destroyWeak((id *)&self->_transport);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
