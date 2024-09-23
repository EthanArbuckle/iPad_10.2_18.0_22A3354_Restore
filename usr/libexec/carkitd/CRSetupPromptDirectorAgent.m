@implementation CRSetupPromptDirectorAgent

- (void)performWithPromptPresenter:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100035C00;
  v10[3] = &unk_1000B6400;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  -[CRSetupPromptDirectorAgent _checkLockScreenStatusWithReply:](self, "_checkLockScreenStatusWithReply:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)_mainQueue_performWithPromptPresenter:(id)a3 isUILocked:(BOOL)a4 errorHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  CRSetupLauncher *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v6
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent lockscreenAlert](self, "lockscreenAlert")),
        v10,
        !v10))
  {
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100035EB0;
    v21[3] = &unk_1000B6428;
    objc_copyWeak(&v24, &location);
    v22 = v8;
    v23 = v9;
    -[CRSetupPromptDirectorAgent _mainQueue_presentLockscreenAlertWithCompletion:](self, "_mainQueue_presentLockscreenAlertWithCompletion:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent currentPresenterSession](self, "currentPresenterSession"));

    if (!v11)
    {
      -[CRSetupPromptDirectorAgent _mainQueue_setupBlockedSessionQueue](self, "_mainQueue_setupBlockedSessionQueue");
      v12 = objc_alloc_init(CRSetupLauncher);
      -[CRSetupPromptDirectorAgent setSetupLauncher:](self, "setSetupLauncher:", v12);

      objc_initWeak(&location, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent setupLauncher](self, "setupLauncher"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100035EEC;
      v18[3] = &unk_1000B6450;
      objc_copyWeak(&v20, &location);
      v19 = v9;
      objc_msgSend(v13, "launchCarPlaySetupWithUserInfo:errorHandler:", 0, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v14 = objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent sessionQueue](self, "sessionQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035F94;
    block[3] = &unk_1000B6478;
    block[4] = self;
    v16 = v9;
    v17 = v8;
    dispatch_async(v14, block);

  }
}

- (void)dismissPromptPresenter
{
  -[CRSetupPromptDirectorAgent _mainQueue_dismissLockscreenAlert](self, "_mainQueue_dismissLockscreenAlert");
  -[CRSetupPromptDirectorAgent setSetupLauncher:](self, "setSetupLauncher:", 0);
  -[CRSetupPromptDirectorAgent setCurrentPresenterSession:](self, "setCurrentPresenterSession:", 0);
}

- (void)setCurrentPresenterSession:(id)a3
{
  CRSetupPromptPresenterSession *v4;
  CRSetupPromptPresenterSession *currentPresenterSession;
  CRSetupPromptPresenterSession *v6;
  CRSetupPromptPresenterSession *v7;

  v4 = (CRSetupPromptPresenterSession *)a3;
  currentPresenterSession = self->_currentPresenterSession;
  if (currentPresenterSession)
  {
    -[CRSetupPromptPresenterSession invalidate](currentPresenterSession, "invalidate");
    v6 = self->_currentPresenterSession;
    self->_currentPresenterSession = 0;

  }
  v7 = self->_currentPresenterSession;
  self->_currentPresenterSession = v4;

}

- (void)setSetupLauncher:(id)a3
{
  CRSetupLauncher *v4;
  CRSetupLauncher *setupLauncher;
  CRSetupLauncher *v6;
  CRSetupLauncher *v7;

  v4 = (CRSetupLauncher *)a3;
  setupLauncher = self->_setupLauncher;
  if (setupLauncher)
  {
    -[CRSetupLauncher invalidate](setupLauncher, "invalidate");
    v6 = self->_setupLauncher;
    self->_setupLauncher = 0;

  }
  v7 = self->_setupLauncher;
  self->_setupLauncher = v4;

}

- (void)_checkLockScreenStatusWithReply:(id)a3
{
  id v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a3;
  global_queue = dispatch_get_global_queue(2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000361F4;
  block[3] = &unk_1000B5628;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

- (void)_mainQueue_setupBlockedSessionQueue
{
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  dispatch_semaphore_t v10;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.carkit.setupPromptPresenterSession", v4);

  -[CRSetupPromptDirectorAgent setSessionQueue:](self, "setSessionQueue:", v5);
  v6 = dispatch_semaphore_create(0);
  -[CRSetupPromptDirectorAgent setWaitingOnSession:](self, "setWaitingOnSession:", v6);
  v7 = objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent sessionQueue](self, "sessionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003642C;
  block[3] = &unk_1000B51B8;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_mainQueue_unblockSessionQueue
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_10006CCF8();

  v6 = objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent waitingOnSession](self, "waitingOnSession"));
  dispatch_semaphore_signal(v6);

}

- (void)_mainQueue_presentLockscreenAlertWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  CRSetupLockscreenAlert *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id buf[2];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v6 = CarPairingLogging(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CarPlay Setup presenting lockscreen alert", (uint8_t *)buf, 2u);
  }

  v8 = objc_alloc_init(CRSetupLockscreenAlert);
  -[CRSetupPromptDirectorAgent setLockscreenAlert:](self, "setLockscreenAlert:", v8);
  objc_initWeak(buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100036624;
  v10[3] = &unk_1000B64A0;
  objc_copyWeak(&v12, buf);
  v9 = v4;
  v11 = v9;
  -[CRAlert presentAlertWithCompletion:](v8, "presentAlertWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(buf);

}

- (void)_mainQueue_dismissLockscreenAlert
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent lockscreenAlert](self, "lockscreenAlert"));

  if (v3)
  {
    v5 = CarPairingLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CarPlay Setup dismissing lockscreen alert", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupPromptDirectorAgent lockscreenAlert](self, "lockscreenAlert"));
    objc_msgSend(v7, "dismissAlert");

    -[CRSetupPromptDirectorAgent setLockscreenAlert:](self, "setLockscreenAlert:", 0);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  CRSetupPromptDirectorAgent *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id location;
  _QWORD block[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.carkit.setupPromptDirector.service"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.private.carkit.setupPromptDirector")));
    v11 = objc_msgSend(v10, "BOOLValue");

    if ((v11 & 1) != 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRSetupPromptDirectorService));
      objc_msgSend(v7, "setExportedInterface:", v13);
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = sub_100036B2C;
      v37 = sub_100036B3C;
      v38 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100036B44;
      block[3] = &unk_1000B5B08;
      v32 = &v33;
      block[4] = self;
      v14 = v7;
      v31 = v14;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
      objc_msgSend(v14, "setExportedObject:", v34[5]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CRSetupPromptPresenterService));
      objc_msgSend(v14, "setRemoteObjectInterface:", v15);
      objc_initWeak(&location, v14);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100036BB4;
      v27[3] = &unk_1000B55B0;
      objc_copyWeak(&v28, &location);
      v27[4] = self;
      objc_msgSend(v14, "setInterruptionHandler:", v27);
      v21 = _NSConcreteStackBlock;
      v22 = 3221225472;
      v23 = sub_100036CBC;
      v24 = &unk_1000B55B0;
      objc_copyWeak(&v26, &location);
      v25 = self;
      v16 = CarPairingLogging(objc_msgSend(v14, "setInvalidationHandler:", &v21));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "processIdentifier", v21, v22, v23, v24)));
        *(_DWORD *)buf = 138412290;
        v40 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Receiving setup prompt service connection from %@", buf, 0xCu);

      }
      objc_msgSend(v14, "resume");
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      v19 = CarPairingLogging(v12);
      v13 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10006CD24(v7, v13);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CRSetupLauncher)setupLauncher
{
  return self->_setupLauncher;
}

- (CRSetupPromptPresenterSession)currentPresenterSession
{
  return self->_currentPresenterSession;
}

- (OS_dispatch_queue)sessionQueue
{
  return self->_sessionQueue;
}

- (void)setSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_sessionQueue, a3);
}

- (OS_dispatch_semaphore)waitingOnSession
{
  return self->_waitingOnSession;
}

- (void)setWaitingOnSession:(id)a3
{
  objc_storeStrong((id *)&self->_waitingOnSession, a3);
}

- (CRSetupLockscreenAlert)lockscreenAlert
{
  return self->_lockscreenAlert;
}

- (void)setLockscreenAlert:(id)a3
{
  objc_storeStrong((id *)&self->_lockscreenAlert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenAlert, 0);
  objc_storeStrong((id *)&self->_waitingOnSession, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_currentPresenterSession, 0);
  objc_storeStrong((id *)&self->_setupLauncher, 0);
}

@end
