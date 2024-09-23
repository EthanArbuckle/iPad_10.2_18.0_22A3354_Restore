@implementation SDAutoUnlockPairingSession

- (SDAutoUnlockPairingSession)init
{
  SDAutoUnlockPairingSession *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *sessionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDAutoUnlockPairingSession;
  v2 = -[SDAutoUnlockPairingSession init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.sharingd.auto-unlock.pairing-session-queue", 0);
    sessionQueue = v2->_sessionQueue;
    v2->_sessionQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (SDAutoUnlockPairingSession)initWithDevice:(id)a3 sessionID:(id)a4
{
  id v7;
  id v8;
  SDAutoUnlockPairingSession *v9;
  SDAutoUnlockPairingSession *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = -[SDAutoUnlockPairingSession init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceID, a3);
    objc_storeStrong((id *)&v10->_sessionID, a4);
    if (v10->_sessionID)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10->_sessionID, "UUIDString"));
      objc_msgSend(v11, "addClient:forIdentifer:", v10, v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](SDUnlockIDSController, "sharedController"));
    objc_msgSend(v13, "addDelegate:", v10);

  }
  return v10;
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Invalidating %@", (uint8_t *)&v14, 0xCu);

  }
  -[SDAutoUnlockPairingSession invalidateResponseTimer](self, "invalidateResponseTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
    objc_msgSend(v10, "removeClientForIdentifier:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](SDUnlockIDSController, "sharedController"));
  objc_msgSend(v13, "removeDelegate:", self);

}

- (SDUnlockTransport)transport
{
  void *v2;

  if (-[SDAutoUnlockPairingSession useAttestedProtocol](self, "useAttestedProtocol"))
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnlockIDSController sharedController](SDUnlockIDSController, "sharedController"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  return (SDUnlockTransport *)v2;
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4
{
  return -[SDAutoUnlockPairingSession wrapPayload:withType:useProxy:senderID:](self, "wrapPayload:withType:useProxy:senderID:", a3, a4, 0, 0);
}

- (id)wrapPayload:(id)a3 withType:(unsigned __int16)a4 useProxy:(BOOL)a5 senderID:(id)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  SDAutoUnlockSessionWrapper *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v11 = a3;
  v12 = objc_opt_new(SDAutoUnlockSessionWrapper);
  -[SDAutoUnlockSessionWrapper setVersion:](v12, "setVersion:", 1);
  -[SDAutoUnlockSessionWrapper setPayload:](v12, "setPayload:", v11);

  -[SDAutoUnlockSessionWrapper setMessageType:](v12, "setMessageType:", v7);
  if (v6)
    -[SDAutoUnlockSessionWrapper setUseProxy:](v12, "setUseProxy:", 1);
  if (v10)
  {
    v13 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession dataFromUUID:](self, "dataFromUUID:", v13));
    -[SDAutoUnlockSessionWrapper setSenderID:](v12, "setSenderID:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession dataFromUUID:](self, "dataFromUUID:", v16));
    -[SDAutoUnlockSessionWrapper setSessionID:](v12, "setSessionID:", v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockSessionWrapper data](v12, "data"));

  return v18;
}

- (id)dataFromUUID:(id)a3
{
  id v3;
  _QWORD v5[2];

  v3 = a3;
  if (a3)
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v5);
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v5, 16));
  }
  return v3;
}

- (void)restartResponseTimer:(unint64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];

  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restarting response timer", buf, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  if (!v7)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v8 = &_dispatch_main_q;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001C920;
    v13[3] = &unk_1007145D0;
    objc_copyWeak(&v14, (id *)buf);
    v9 = sub_10019AAD8(0, &_dispatch_main_q, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[SDAutoUnlockPairingSession setResponseTimer:](self, "setResponseTimer:", v10);

    v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
    dispatch_resume(v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  v12 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  sub_10019AB78(v12, a3);

}

- (void)invalidateResponseTimer
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "invalidateResponseTimer", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession responseTimer](self, "responseTimer"));
    dispatch_source_cancel(v6);

    -[SDAutoUnlockPairingSession setResponseTimer:](self, "setResponseTimer:", 0);
  }
}

- (void)handleTimerFired
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  NSErrorUserInfoKey v9;
  const __CFString *v10;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response timer fired", v8, 2u);
  }

  v5 = SFAutoUnlockErrorDomain;
  v9 = NSLocalizedDescriptionKey;
  v10 = CFSTR("Request failure");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, 103, v6));
  -[SDAutoUnlockPairingSession notifyDelegateWithError:](self, "notifyDelegateWithError:", v7);

}

- (void)idsController:(id)a3 didReceiveProtoData:(id)a4 forType:(unsigned __int16)a5 deviceID:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SDAutoUnlockPairingSession *v17;
  unsigned __int16 v18;

  v9 = a4;
  v10 = a6;
  v11 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionQueue](self, "sessionQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001CBD4;
  v14[3] = &unk_1007145F8;
  v18 = a5;
  v15 = v10;
  v16 = v9;
  v17 = self;
  v12 = v9;
  v13 = v10;
  dispatch_async(v11, v14);

}

- (SDAutoUnlockSessionDelegate)delegate
{
  return (SDAutoUnlockSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)pairingAKSSession
{
  return self->_pairingAKSSession;
}

- (void)setPairingAKSSession:(int64_t)a3
{
  self->_pairingAKSSession = a3;
}

- (BOOL)useAttestedProtocol
{
  return self->_useAttestedProtocol;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionQueue, a3);
}

- (SDAutoUnlockAKSSession)aksSession
{
  return self->_aksSession;
}

- (void)setAksSession:(id)a3
{
  objc_storeStrong((id *)&self->_aksSession, a3);
}

- (OS_dispatch_source)responseTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_aksSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
