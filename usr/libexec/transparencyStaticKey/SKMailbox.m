@implementation SKMailbox

- (SKMailbox)initWithLogging:(id)a3 publicInfo:(id)a4 peerIDSID:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SKMailbox *v14;
  void *v15;
  void *v16;
  dispatch_queue_t v17;
  dispatch_queue_t v18;
  KTStateMachine *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  KTStateMachine *v29;
  KTNearFutureScheduler *v30;
  KTNearFutureScheduler *v31;
  void *v32;
  SKMailbox *v33;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)SKMailbox;
  v14 = -[SKMailbox init](&v39, "init");
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKMailbox generateSessionID](SKMailbox, "generateSessionID"));
    -[SKMailbox setHandleID:](v14, "setHandleID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SKMailbox generateSessionID](SKMailbox, "generateSessionID"));
    -[SKMailbox setLocalSessionID:](v14, "setLocalSessionID:", v16);

    -[SKMailbox setMyPublicInfo:](v14, "setMyPublicInfo:", v11);
    -[SKMailbox setPeerIDSID:](v14, "setPeerIDSID:", v12);
    v35 = v10;
    -[SKMailbox setLog:](v14, "setLog:", v10);
    -[SKMailbox setSession:](v14, "setSession:", v13);
    -[SKMailbox setPeerIDMismatchCounter:](v14, "setPeerIDMismatchCounter:", 0);
    -[SKMailbox setBeforeRatelimit:](v14, "setBeforeRatelimit:", 10);
    v17 = dispatch_queue_create("updateQueue", 0);
    -[SKMailbox setUpdateQueue:](v14, "setUpdateQueue:", v17);

    v18 = dispatch_queue_create("KTStaticKeyMailbox", 0);
    -[SKMailbox setStateMachineQueue:](v14, "setStateMachineQueue:", v18);

    v19 = [KTStateMachine alloc];
    v21 = objc_msgSend((id)objc_opt_class(v14, v20), "allSMStates");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v24 = objc_msgSend((id)objc_opt_class(v14, v23), "allSMFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = off_10008A510;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](v14, "stateMachineQueue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyIDSConfigBag sharedInstance](TransparencyIDSConfigBag, "sharedInstance"));
    v29 = -[KTStateMachine initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:](v19, "initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:", CFSTR("KTStateMachine"), v22, v25, v26, v27, v14, 0, 0, v28);
    -[SKMailbox setStateMachine:](v14, "setStateMachine:", v29);

    location = 0;
    objc_initWeak(&location, v14);
    v30 = [KTNearFutureScheduler alloc];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100023B14;
    v36[3] = &unk_100070710;
    objc_copyWeak(&v37, &location);
    v31 = -[KTNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:](v30, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("recvRatelimit"), 10000000, 5000000000, 0, 0, v36);
    -[SKMailbox setRecvRatelimit:](v14, "setRecvRatelimit:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachine](v14, "stateMachine"));
    objc_msgSend(v32, "startOperation");

    v33 = v14;
    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
    v10 = v35;
  }

  return v14;
}

+ (id)generateSessionID
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 16));
  if (!v2
    || (v3 = v2,
        v4 = objc_msgSend(v2, "length"),
        v5 = objc_retainAutorelease(v3),
        SecRandomCopyBytes(0, (size_t)v4, objc_msgSend(v5, "mutableBytes"))))
  {
    abort();
  }
  return v5;
}

- (void)haltStateMachine
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "haltOperation");

}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dealloc: %{public}@", buf, 0xCu);

  }
  -[SKMailbox stopTransaction](self, "stopTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox session](self, "session"));
  objc_msgSend(v6, "teardownMailbox:", self);

  v7.receiver = self;
  v7.super_class = (Class)SKMailbox;
  -[SKMailbox dealloc](&v7, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v6 = objc_opt_class(SKMailbox, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localSessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (void)setPeer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerStorage](self, "peerStorage"));

  if (!v4)
    -[SKMailbox setPeerStorage:](self, "setPeerStorage:", v5);

}

- (void)setSourceIDSID:(id)a3
{
  -[SKMailbox setSourceIDS:](self, "setSourceIDS:", a3);
}

- (NSSet)peerHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peer](self, "peer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "peer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peer](self, "peer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "otherNamesForPeer"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peer](self, "peer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "otherNamesForPeer"));
    objc_msgSend(v5, "unionSet:", v9);

  }
  return (NSSet *)v5;
}

- (void)startSession
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachine](self, "stateMachine"));
  objc_msgSend(v2, "handleFlag:", off_10008A4C8);

}

- (void)updateTransaction
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox handleID](self, "handleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox transaction](self, "transaction"));
    v7 = CFSTR("yes");
    if (!v6)
      v7 = CFSTR("no");
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updateTransaction: %{public}@ exists: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox transaction](self, "transaction"));

  if (!v8)
  {
    v9 = (void *)os_transaction_create("KTStaticKeyMailbox");
    -[SKMailbox setTransaction:](self, "setTransaction:", v9);

  }
}

- (void)stopTransaction
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox handleID](self, "handleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
    v6 = 138543362;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopTransaction: %{public}@", (uint8_t *)&v6, 0xCu);

  }
  -[SKMailbox setTransaction:](self, "setTransaction:", 0);
}

- (void)updateTimer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 600.0));
  -[SKMailbox setExpire:](self, "setExpire:", v3);

}

- (void)updateState
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000241E8;
  block[3] = &unk_100070A78;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)onQueueUpdateState
{
  NSObject *v3;
  SKMailbox *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox stateUpdate](v4, "stateUpdate"));
  objc_sync_exit(v4);

  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SKMailbox updateQueue](v4, "updateQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000242D0;
    v7[3] = &unk_100071840;
    v7[4] = v4;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

- (id)mapMailbox
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000243F4;
  v11 = sub_100024404;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002440C;
  v6[3] = &unk_100070A50;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onQueueMapMailbox
{
  void *v3;
  void *v4;
  id v5;
  SKMailbox *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD *v19;
  unsigned int v20;
  void *v21;
  NSObject *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachine](self, "stateMachine"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));

  v5 = objc_alloc_init((Class)KTIDSSession);
  v6 = self;
  objc_sync_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox handleID](v6, "handleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  objc_msgSend(v5, "setSessionID:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerPublicInfo](v6, "peerPublicInfo"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerPublicInfo](v6, "peerPublicInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v10, 0));
    objc_msgSend(v5, "setPeerAccountIdentity:", v11);

  }
  objc_sync_exit(v6);

  if ((objc_msgSend(v4, "isEqual:", off_10008A510) & 1) != 0
    || objc_msgSend(v4, "isEqual:", off_10008A518))
  {
    v12 = &kTransparencyStaticKeyStateInit;
LABEL_6:
    objc_msgSend(v5, "setState:", *v12);
    v13 = v5;
    v14 = 1;
LABEL_13:
    objc_msgSend(v13, "setPeerDisconnected:", v14);
    goto LABEL_14;
  }
  if (objc_msgSend(v4, "isEqual:", off_10008A520)
    || objc_msgSend(v4, "isEqual:", off_10008A528)
    || objc_msgSend(v4, "isEqual:", off_10008A538)
    || objc_msgSend(v4, "isEqual:", off_10008A540)
    || objc_msgSend(v4, "isEqual:", off_10008A548))
  {
LABEL_12:
    objc_msgSend(v5, "setState:", kTransparencyStaticKeyStateNegotiating);
    v13 = v5;
    v14 = 0;
    goto LABEL_13;
  }
  if ((objc_msgSend(v4, "isEqual:", off_10008A550) & 1) == 0
    && !objc_msgSend(v4, "isEqual:", off_10008A558))
  {
    if (objc_msgSend(v4, "isEqual:", off_10008A560))
    {
      v12 = &kTransparencyStaticKeyStateCodeError;
      goto LABEL_6;
    }
    if (!objc_msgSend(v4, "isEqual:", off_10008A568)
      && !objc_msgSend(v4, "isEqual:", off_10008A570))
    {
      v22 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](v6, "log"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100050204();

      v12 = &kTransparencyStaticKeyStateNegotiating;
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  objc_msgSend(v5, "setPeerDisconnected:", objc_msgSend(v4, "isEqual:", off_10008A558));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](v6, "sas"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shortAuthenticationString"));
  objc_msgSend(v5, "setSasCode:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sasCode"));
  if (v18)
  {
    v19 = &kTransparencyStaticKeyStateCodeAvailable;
  }
  else
  {
    v20 = objc_msgSend(v5, "peerDisconnected");
    v19 = &kTransparencyStaticKeyStateCodeError;
    if (v20)
      v19 = &kTransparencyStaticKeyStateNegotiating;
  }
  objc_msgSend(v5, "setState:", *v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox expire](v6, "expire"));
  objc_msgSend(v5, "setSessionExpire:", v21);

LABEL_14:
  return v5;
}

+ (id)allSMFlags
{
  if (qword_10008ABB8 != -1)
    dispatch_once(&qword_10008ABB8, &stru_100071860);
  return (id)qword_10008ABC0;
}

+ (id)allSMStates
{
  if (qword_10008ABC8 != -1)
    dispatch_once(&qword_10008ABC8, &stru_100071880);
  return (id)qword_10008ABD0;
}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = a4;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SKMailbox destinationIDSID](self, "destinationIDSID"));
  if (!v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peer](self, "peer"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peer"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox session](self, "session"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sourceIDS](self, "sourceIDS"));
  objc_msgSend(v8, "sendMessage:data:toID:sourceID:", v4, v6, v10, v9);

}

- (void)sendMessage:(unsigned __int16)a3 data:(id)a4 targets:(id)a5 sourceID:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[SKMailbox session](self, "session"));
  objc_msgSend(v13, "sendMessage:data:toID:sourceID:", v8, v12, v11, v10);

}

- (void)recvAnnounce:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024BF0;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (int64_t)sentTime
{
  void *v2;
  double v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = (uint64_t)(v3 * 1000.0);

  return v4;
}

- (void)sendAnnounce
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SASAnnounce *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  unint64_t v17;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox handleID](self, "handleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
    v12 = 138543874;
    v13 = v5;
    v14 = 2114;
    v15 = v7;
    v16 = 2048;
    v17 = -[SKMailbox sentAnnounce](self, "sentAnnounce");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "send announce %{public}@ peer: %{public}@ count: %lu", (uint8_t *)&v12, 0x20u);

  }
  -[SKMailbox setSentAnnounce:](self, "setSentAnnounce:", (char *)-[SKMailbox sentAnnounce](self, "sentAnnounce") + 1);
  v8 = objc_alloc_init(SASAnnounce);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
  -[SASAnnounce setSessionId:](v8, "setSessionId:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
  -[SASAnnounce setPeerSessionId:](v8, "setPeerSessionId:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v8, "data"));
  -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 0, v11);

}

- (void)recvCommit:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024FAC;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)sendCommitA
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SASCommit *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    _os_assumes_log(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v6 = objc_msgSend(v5, "initiator");

  if ((v6 & 1) == 0)
    _os_assumes_log(0);
  v12 = objc_alloc_init(SASCommit);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  -[SASCommit setSessionId:](v12, "setSessionId:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox myPublicInfo](self, "myPublicInfo"));
  -[SASCommit setPublicInfo:](v12, "setPublicInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "undisclosedInitiatorRandom"));
  -[SASCommit setACommitRandom:](v12, "setACommitRandom:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v12, "data"));
  -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 1, v11);

}

- (void)recvReplyB:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000251B8;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)sendSetupB
{
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SASSetupB *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    _os_assumes_log(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v6 = objc_msgSend(v5, "initiator");

  if (v6)
    _os_assumes_log(0);
  v13 = objc_alloc_init(SASSetupB);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  -[SASSetupB setSessionId:](v13, "setSessionId:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox myPublicInfo](self, "myPublicInfo"));
  -[SASSetupB setPublicInfo:](v13, "setPublicInfo:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selfRandom"));
  -[SASSetupB setBRandom:](v13, "setBRandom:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
  -[SASSetupB setPeerSessionId:](v13, "setPeerSessionId:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v13, "data"));
  -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 4, v12);

}

- (void)recvDiscloseA:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000253E4;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (BOOL)sendRevealA
{
  void *v3;
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  SASReveal *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    _os_assumes_log(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v6 = objc_msgSend(v5, "initiator");

  if ((v6 & 1) == 0)
    _os_assumes_log(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sas](self, "sas"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selfRandom"));

  if (v8)
  {
    v9 = objc_alloc_init(SASReveal);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
    -[SASReveal setSessionId:](v9, "setSessionId:", v10);

    -[SASReveal setARandom:](v9, "setARandom:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
    -[SASReveal setPeerSessionId:](v9, "setPeerSessionId:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v9, "data"));
    -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 5, v12);

  }
  return v8 != 0;
}

- (void)recvConfirm:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000255F8;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)sendSelected
{
  void *v3;
  void *v4;
  SASSelected *v5;

  v5 = objc_alloc_init(SASSelected);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  -[SASSelected setSessionId:](v5, "setSessionId:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v5, "data"));
  -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 2, v4);

}

- (void)recvSelected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025758;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)sendConfirm
{
  NSObject *v3;
  void *v4;
  id v5;
  SASConfirm *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100050264(self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    _os_assumes_log(0);
  v6 = objc_alloc_init(SASConfirm);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  -[SASConfirm setSessionId:](v6, "setSessionId:", v7);

  -[SASConfirm setSentTime:](v6, "setSentTime:", -[SKMailbox sentTime](self, "sentTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
  -[SASConfirm setPeerSessionId:](v6, "setPeerSessionId:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v6, "data"));
  -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 6, v9);

}

- (void)sendTearDown:(id)a3 idsHandle:(id)a4 because:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SASTeardown *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
    v16 = 138544130;
    v17 = v15;
    v18 = 2160;
    v19 = 1752392040;
    v20 = 2112;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "sending teardown of session %{public}@ to peer %{mask.hash}@ because %{public}@", (uint8_t *)&v16, 0x2Au);

  }
  if (v8 && v9)
  {
    v12 = objc_alloc_init(SASTeardown);
    -[SASTeardown setSessionId:](v12, "setSessionId:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v12, "data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox sourceIDS](self, "sourceIDS"));
    -[SKMailbox sendMessage:data:targets:sourceID:](self, "sendMessage:data:targets:sourceID:", 3, v13, v9, v14);

  }
}

- (void)recvTeardown:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025AD4;
  block[3] = &unk_100070AE8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)sendTeardown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SASTeardown *v8;

  if (!-[SKMailbox sentTeardown](self, "sentTeardown"))
  {
    -[SKMailbox setSentTeardown:](self, "setSentTeardown:", 1);
    v8 = objc_alloc_init(SASTeardown);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
      -[SASTeardown setSessionId:](v8, "setSessionId:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v8, "data"));
      -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 3, v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    -[SASTeardown setSessionId:](v8, "setSessionId:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyGPBMessage data](v8, "data"));
    -[SKMailbox sendMessage:data:](self, "sendMessage:data:", 3, v7);

  }
}

- (BOOL)validateAnnounce:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  id v11;
  id v13;

  if (a3)
  {
    v13 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASAnnounce, "parseFromData:error:", a3, &v13));
    v5 = v13;
    v6 = v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 0;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionId"));
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        -[SKMailbox setPeerAnnounce:](self, "setPeerAnnounce:", v4);
        v9 = 1;
LABEL_16:

        goto LABEL_17;
      }
      v8 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000503A8();
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100050348();
    }

    v9 = 0;
    goto LABEL_16;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005031C();
  v9 = 0;
LABEL_17:

  return v9;
}

- (BOOL)announceMismatch
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  BOOL v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox gotAnnounceData](self, "gotAnnounceData"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox gotAnnounceData](self, "gotAnnounceData"));
    v17 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASAnnounce, "parseFromData:error:", v4, &v17));
    v6 = v17;

    if (v5)
      v7 = v6 == 0;
    else
      v7 = 0;
    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionId"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerSessionId"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if ((v15 & 1) != 0)
        {
          v9 = 0;
LABEL_19:

          goto LABEL_20;
        }
        v8 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_100050460(self, v5);
      }
      else
      {
        v8 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_100050518(self, v5);
      }
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100050400();
    }

    v9 = 1;
    goto LABEL_19;
  }
  v6 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000503D4();
  v9 = 1;
LABEL_20:

  return v9;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  const __CFString *v20;
  void ***v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  SKMailbox *v44;
  uint64_t v45;
  void **v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  SKMailbox *v51;
  void **v52;
  uint64_t v53;
  void (*v54)(uint64_t, void *);
  void *v55;
  SKMailbox *v56;
  void **v57;
  uint64_t v58;
  void (*v59)(uint64_t, void *);
  void *v60;
  SKMailbox *v61;
  void **v62;
  uint64_t v63;
  void (*v64)(uint64_t, void *);
  void *v65;
  SKMailbox *v66;
  void **v67;
  uint64_t v68;
  void (*v69)(uint64_t, void *);
  void *v70;
  SKMailbox *v71;
  void **v72;
  uint64_t v73;
  void (*v74)(uint64_t, void *);
  void *v75;
  SKMailbox *v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  void *v80;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dumpFlags"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 138543618;
    v78 = v8;
    v79 = 2114;
    v80 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "in state %{public}@ with flags: %{public}@", buf, 0x16u);

  }
  if (objc_msgSend(v8, "isEqual:", off_10008A510))
  {
    if (objc_msgSend(v9, "_onqueueContains:", off_10008A4C8))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4C8);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox myPublicInfo](self, "myPublicInfo"));

      if (v14)
      {
        -[SKMailbox sendAnnounce](self, "sendAnnounce");
        -[SKMailbox onQueueUpdateState](self, "onQueueUpdateState");
        v15 = off_10008A520;
        v16 = CFSTR("send-announce");
      }
      else
      {
        v27 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1000505D0();

        v15 = off_10008A560;
        v16 = CFSTR("announce-missing-my-peer-info");
      }
      goto LABEL_32;
    }
    if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
    {
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
      v15 = off_10008A518;
      v16 = CFSTR("got-announce");
LABEL_32:
      v26 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v16, v15));
      goto LABEL_87;
    }
    v22 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dumpFlags"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", CFSTR(",")));
      *(_DWORD *)buf = 138543362;
      v78 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SMStateInitial waiting for start: %{public}@", buf, 0xCu);

    }
    goto LABEL_21;
  }
  if (!objc_msgSend(v8, "isEqual:", off_10008A518))
  {
    if (objc_msgSend(v8, "isEqual:", off_10008A520))
    {
      if (!objc_msgSend(v9, "_onqueueContains:", off_10008A508))
      {
        if (!objc_msgSend(v9, "_onqueueContains:", off_10008A500))
        {
          if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
          {
            objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox gotAnnounceData](self, "gotAnnounceData"));
            v29 = -[SKMailbox validateAnnounce:](self, "validateAnnounce:", v28);

            if ((v29 & 1) == 0)
            {
              v15 = off_10008A560;
              v16 = CFSTR("no valid error");
              goto LABEL_32;
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerAnnounce](self, "peerAnnounce"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "sessionId"));
            v33 = objc_msgSend(v30, "isEqual:", v32);

            v34 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerAnnounce](self, "peerAnnounce"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sessionId"));
            -[SKMailbox setPeerSessionID:](self, "setPeerSessionID:", v35);

            v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerAnnounce](self, "peerAnnounce"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "peerSessionId"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
            v39 = objc_msgSend(v37, "isEqual:", v38);

            if ((v39 & 1) != 0)
            {
              if ((v33 & 1) == 0)
                -[SKMailbox sendAnnounce](self, "sendAnnounce");
              v15 = off_10008A528;
              v16 = CFSTR("decide AB");
              goto LABEL_32;
            }
            if (-[SKMailbox sentAnnounce](self, "sentAnnounce") >= 0xB)
            {
              v15 = off_10008A568;
              v16 = CFSTR("announce-sent-too-many-announce");
              goto LABEL_32;
            }
            -[SKMailbox sendAnnounce](self, "sendAnnounce");
          }
          else if (objc_msgSend(v9, "_onqueueContains:", off_10008A4F8))
          {
            objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4F8);
            v15 = off_10008A560;
            v16 = CFSTR("wait-announce-teardown");
            goto LABEL_32;
          }
          goto LABEL_21;
        }
        v17 = CFSTR("wait-req-start-over");
        goto LABEL_85;
      }
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A508);
      goto LABEL_15;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A528))
    {
      v18 = off_10008A538;
      v19 = off_10008A560;
      v67 = _NSConcreteStackBlock;
      v68 = 3221225472;
      v69 = sub_100026D00;
      v70 = &unk_1000718A8;
      v71 = self;
      v20 = CFSTR("decide-ab");
      v21 = &v67;
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A530))
    {
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
      {
        if (-[SKMailbox announceMismatch](self, "announceMismatch"))
        {
          v17 = CFSTR("waitA-start-over");
          goto LABEL_81;
        }
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
      {
        v17 = CFSTR("waitA-req-start-over");
        goto LABEL_85;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", off_10008A4D8))
        goto LABEL_21;
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D8);
      v18 = off_10008A540;
      v19 = off_10008A568;
      v62 = _NSConcreteStackBlock;
      v63 = 3221225472;
      v64 = sub_10002728C;
      v65 = &unk_1000718A8;
      v66 = self;
      v20 = CFSTR("commit-a");
      v21 = &v62;
LABEL_24:
      v26 = objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:](KTStateTransitionOperation, "named:intending:errorState:withBlockTakingSelf:", v20, v18, v19, v21, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58,
                v59,
                v60,
                v61,
                v62,
                v63,
                v64,
                v65,
                v66,
                v67,
                v68,
                v69,
                v70,
                v71,
                v72,
                v73,
                v74,
                v75,
                v76));
LABEL_87:
      v25 = (void *)v26;
      goto LABEL_88;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A538))
    {
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
      {
        if (-[SKMailbox announceMismatch](self, "announceMismatch"))
        {
          v17 = CFSTR("replyB-start-over");
          goto LABEL_81;
        }
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
      {
        v17 = CFSTR("replyB-req-start-over");
        goto LABEL_85;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", off_10008A4E0))
        goto LABEL_21;
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4E0);
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A508);
      v18 = off_10008A548;
      v19 = off_10008A560;
      v57 = _NSConcreteStackBlock;
      v58 = 3221225472;
      v59 = sub_100027538;
      v60 = &unk_1000718A8;
      v61 = self;
      v20 = CFSTR("reply-b");
      v21 = &v57;
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A540))
    {
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A508))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A508);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox gotSelected](self, "gotSelected"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "sessionId"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
        v43 = objc_msgSend(v41, "isEqual:", v42);

        if ((v43 & 1) == 0)
        {
LABEL_15:
          v17 = CFSTR("wait-select-confirm");
          goto LABEL_85;
        }
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
      {
        if (-[SKMailbox announceMismatch](self, "announceMismatch"))
        {
          v17 = CFSTR("discloseA-start-over");
          goto LABEL_81;
        }
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
      {
        v17 = CFSTR("discloseA-req-start-over");
        goto LABEL_85;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", off_10008A4E8))
        goto LABEL_21;
      objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4E8);
      v18 = off_10008A548;
      v19 = off_10008A560;
      v52 = _NSConcreteStackBlock;
      v53 = 3221225472;
      v54 = sub_100027784;
      v55 = &unk_1000718A8;
      v56 = self;
      v20 = CFSTR("disclose-a");
      v21 = &v52;
      goto LABEL_24;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A548))
    {
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4F0))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4F0);
        v18 = off_10008A550;
        v19 = off_10008A560;
        v47 = _NSConcreteStackBlock;
        v48 = 3221225472;
        v49 = sub_1000279DC;
        v50 = &unk_1000718A8;
        v51 = self;
        v20 = CFSTR("Confirm");
        v21 = &v47;
        goto LABEL_24;
      }
      if (!objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
      {
        if (!objc_msgSend(v9, "_onqueueContains:", off_10008A500))
          goto LABEL_21;
        v17 = CFSTR("confirm-req-start-over");
        goto LABEL_85;
      }
      v17 = CFSTR("confirm-start-over");
LABEL_81:
      v44 = self;
      v45 = 0;
LABEL_86:
      v26 = objc_claimAutoreleasedReturnValue(-[SKMailbox onQueueStartOver:clearAnnounce:flags:](v44, "onQueueStartOver:clearAnnounce:flags:", v17, v45, v9));
      goto LABEL_87;
    }
    if (objc_msgSend(v8, "isEqual:", off_10008A550))
    {
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
      {
        if (-[SKMailbox announceMismatch](self, "announceMismatch"))
        {
          v17 = CFSTR("finish-start-over");
          goto LABEL_81;
        }
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A4F8))
      {
        objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4F8);
        v15 = off_10008A558;
        v16 = CFSTR("finish-teardown");
        goto LABEL_32;
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
      {
        v17 = CFSTR("finish-req-start-over");
        goto LABEL_85;
      }
    }
    else
    {
      if (objc_msgSend(v8, "isEqual:", off_10008A558))
      {
        -[SKMailbox onQueueUpdateState](self, "onQueueUpdateState");
        if (!objc_msgSend(v9, "_onqueueContains:", off_10008A4D0))
        {
          if (!objc_msgSend(v9, "_onqueueContains:", off_10008A500))
            goto LABEL_21;
          v17 = CFSTR("disconnected-start-over");
          goto LABEL_85;
        }
        v17 = CFSTR("disconnected-start-over");
        goto LABEL_81;
      }
      if (!objc_msgSend(v8, "isEqual:", off_10008A560))
      {
        if ((objc_msgSend(v8, "isEqual:", off_10008A568) & 1) != 0)
          goto LABEL_21;
        if (!objc_msgSend(v8, "isEqual:", off_10008A570))
          abort();
        v17 = CFSTR("peer-reset-start-over");
        goto LABEL_85;
      }
      if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
      {
        v17 = CFSTR("error-start-over");
        goto LABEL_85;
      }
      -[SKMailbox sendTeardown](self, "sendTeardown");
      -[SKMailbox stopTransaction](self, "stopTransaction");
    }
    -[SKMailbox onQueueUpdateState](self, "onQueueUpdateState");
    goto LABEL_21;
  }
  objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4D0);
  if (objc_msgSend(v9, "_onqueueContains:", off_10008A500))
  {
    v17 = CFSTR("got-req-start-over");
LABEL_85:
    v44 = self;
    v45 = 1;
    goto LABEL_86;
  }
  if (objc_msgSend(v9, "_onqueueContains:", off_10008A4C8))
  {
    objc_msgSend(v9, "_onqueueRemoveFlag:", off_10008A4C8);
    v18 = off_10008A528;
    v19 = off_10008A560;
    v72 = _NSConcreteStackBlock;
    v73 = 3221225472;
    v74 = sub_100026B14;
    v75 = &unk_1000718A8;
    v76 = self;
    v20 = CFSTR("got-announce-send");
    v21 = &v72;
    goto LABEL_24;
  }
  if (objc_msgSend(v9, "_onqueueContains:", off_10008A4F8))
  {
    v15 = off_10008A560;
    v16 = CFSTR("got-announce-teardown");
    goto LABEL_32;
  }
LABEL_21:
  v25 = 0;
LABEL_88:

  return v25;
}

- (void)reset
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "reset", v4, 2u);
  }

  -[SKMailbox setPeerSessionID:](self, "setPeerSessionID:", 0);
  -[SKMailbox setNegotiatedSessionID:](self, "setNegotiatedSessionID:", 0);
  -[SKMailbox setPeerAnnounce:](self, "setPeerAnnounce:", 0);
  -[SKMailbox setSas:](self, "setSas:", 0);
  -[SKMailbox setSentTeardown:](self, "setSentTeardown:", 0);
  -[SKMailbox setSentAnnounce:](self, "setSentAnnounce:", 0);
}

- (void)restart
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: restarting session", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox stateMachine](self, "stateMachine"));
  objc_msgSend(v6, "handleFlag:", off_10008A500);

}

- (id)onQueueStartOver:(id)a3 clearAnnounce:(BOOL)a4 flags:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "kt_hexString"));
    v15 = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: starting over session", (uint8_t *)&v15, 0xCu);

  }
  -[SKMailbox reset](self, "reset");
  if (v5)
  {
    objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A4D0);
    objc_msgSend(v8, "_onqueueSetFlag:", off_10008A4C8);
  }
  else
  {
    objc_msgSend(v8, "_onqueueSetFlag:", off_10008A4C8);
    if ((objc_msgSend(v8, "_onqueueContains:", off_10008A4D0) & 1) == 0)
      _os_assumes_log(0);
  }
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A4E0);
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A4E8);
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A4F0);
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A4F8);
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A500);
  objc_msgSend(v8, "_onqueueRemoveFlag:", off_10008A508);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionOperation named:entering:](KTStateTransitionOperation, "named:entering:", v9, off_10008A510));

  return v13;
}

- (BOOL)matchSession:(id)a3 op:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v9 = v8 == 0;

  if (!v8)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: sessionID not known yet", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
  v11 = (uint64_t)objc_msgSend(v6, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox negotiatedSessionID](self, "negotiatedSessionID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_hexString"));
      *(_DWORD *)buf = 138543874;
      v20 = v7;
      v21 = 2112;
      v22 = v11;
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@: negotiated sessionID mismatch (sessionID: %@ neg: %@)", buf, 0x20u);

    }
    v12 = objc_claimAutoreleasedReturnValue(-[SKMailbox destinationIDSID](self, "destinationIDSID"));
    v14 = v12;
    if (!v12)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[SKMailbox peer](self, "peer"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11, "peer"));
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-mismatch-sessionId"), v7));
    -[SKMailbox sendTearDown:idsHandle:because:](self, "sendTearDown:idsHandle:because:", v6, v14, v15);

    if (!v12)
    {

    }
LABEL_12:

    goto LABEL_13;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (id)matchPeerSessionID:(id)a3 op:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  unsigned __int8 v10;
  __CFString *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  unsigned int v26;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_4;
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox localSessionID](self, "localSessionID"));
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
LABEL_4:
      v8 = 0;
      goto LABEL_10;
    }
    v8 = off_10008A570;
    -[SKMailbox setPeerIDMismatchCounter:](self, "setPeerIDMismatchCounter:", -[SKMailbox peerIDMismatchCounter](self, "peerIDMismatchCounter") + 1);
    if (-[SKMailbox peerIDMismatchCounter](self, "peerIDMismatchCounter") >= 3)
    {
      v11 = off_10008A568;

      v8 = v11;
    }
    v12 = objc_claimAutoreleasedReturnValue(-[SKMailbox log](self, "log"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kt_hexString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKMailbox peerSessionID](self, "peerSessionID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "kt_hexString"));
      v17 = 138544386;
      v18 = v7;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      v23 = 2114;
      v24 = v8;
      v25 = 1024;
      v26 = -[SKMailbox peerIDMismatchCounter](self, "peerIDMismatchCounter");
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: peerSessionID mismatch (peer: %{public}@ announce: %{public}@) next state: %{public}@ (try %u)", (uint8_t *)&v17, 0x30u);

    }
  }
LABEL_10:

  return v8;
}

- (NSData)handleID
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandleID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)localSessionID
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSData)peerSessionID
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPeerSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSData)negotiatedSessionID
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNegotiatedSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)stateUpdate
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setStateUpdate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSData)myPublicInfo
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMyPublicInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSData)peerPublicInfo
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeerPublicInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)deletedHandles
{
  return self->_deletedHandles;
}

- (void)setDeletedHandles:(BOOL)a3
{
  self->_deletedHandles = a3;
}

- (KTVaudenaySAS)sas
{
  return (KTVaudenaySAS *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateMachine:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)destinationIDSID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDestinationIDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (KTNearFutureScheduler)recvRatelimit
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecvRatelimit:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDate)expire
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setExpire:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSData)aCommitRandom
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (void)setACommitRandom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)gotAnnounceFromID
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGotAnnounceFromID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSData)gotAnnounceData
{
  return (NSData *)objc_getProperty(self, a2, 136, 1);
}

- (void)setGotAnnounceData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (SASSelected)gotSelected
{
  return (SASSelected *)objc_getProperty(self, a2, 144, 1);
}

- (void)setGotSelected:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSData)gotCommitData
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setGotCommitData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSData)gotReplyBData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setGotReplyBData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSData)gotRevealData
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (void)setGotRevealData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSData)gotConfirmData
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setGotConfirmData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSData)gotTeardown
{
  return (NSData *)objc_getProperty(self, a2, 184, 1);
}

- (void)setGotTeardown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (unint64_t)sentAnnounce
{
  return self->_sentAnnounce;
}

- (void)setSentAnnounce:(unint64_t)a3
{
  self->_sentAnnounce = a3;
}

- (BOOL)sentConfirmMatch
{
  return self->_sentConfirmMatch;
}

- (void)setSentConfirmMatch:(BOOL)a3
{
  self->_sentConfirmMatch = a3;
}

- (BOOL)sentTeardown
{
  return self->_sentTeardown;
}

- (void)setSentTeardown:(BOOL)a3
{
  self->_sentTeardown = a3;
}

- (int)beforeRatelimit
{
  return self->_beforeRatelimit;
}

- (void)setBeforeRatelimit:(int)a3
{
  self->_beforeRatelimit = a3;
}

- (NSString)peerIDSID
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPeerIDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (SASAnnounce)peerAnnounce
{
  return (SASAnnounce *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPeerAnnounce:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)sourceIDS
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSourceIDS:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 224, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (SKSessionProtocol)session
{
  return (SKSessionProtocol *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (unsigned)peerIDMismatchCounter
{
  return self->_peerIDMismatchCounter;
}

- (void)setPeerIDMismatchCounter:(unsigned int)a3
{
  self->_peerIDMismatchCounter = a3;
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStateMachineQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (OS_dispatch_queue)updateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setUpdateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (KTStaticKeyPeer)peerStorage
{
  return (KTStaticKeyPeer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setPeerStorage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerStorage, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_stateMachineQueue, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sourceIDS, 0);
  objc_storeStrong((id *)&self->_peerAnnounce, 0);
  objc_storeStrong((id *)&self->_peerIDSID, 0);
  objc_storeStrong((id *)&self->_gotTeardown, 0);
  objc_storeStrong((id *)&self->_gotConfirmData, 0);
  objc_storeStrong((id *)&self->_gotRevealData, 0);
  objc_storeStrong((id *)&self->_gotReplyBData, 0);
  objc_storeStrong((id *)&self->_gotCommitData, 0);
  objc_storeStrong((id *)&self->_gotSelected, 0);
  objc_storeStrong((id *)&self->_gotAnnounceData, 0);
  objc_storeStrong((id *)&self->_gotAnnounceFromID, 0);
  objc_storeStrong((id *)&self->_aCommitRandom, 0);
  objc_storeStrong((id *)&self->_expire, 0);
  objc_storeStrong((id *)&self->_recvRatelimit, 0);
  objc_storeStrong((id *)&self->_destinationIDSID, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_sas, 0);
  objc_storeStrong((id *)&self->_peerPublicInfo, 0);
  objc_storeStrong((id *)&self->_myPublicInfo, 0);
  objc_storeStrong(&self->_stateUpdate, 0);
  objc_storeStrong((id *)&self->_negotiatedSessionID, 0);
  objc_storeStrong((id *)&self->_peerSessionID, 0);
  objc_storeStrong((id *)&self->_localSessionID, 0);
  objc_storeStrong((id *)&self->_handleID, 0);
}

@end
