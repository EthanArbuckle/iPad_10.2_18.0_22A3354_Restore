@implementation CRSetupLauncher

- (void)launchCarPlaySetupWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id buf[2];

  v6 = a3;
  v7 = a4;
  v8 = CarPairingLogging(-[CRSetupLauncher setCurrentErrorHandler:](self, "setCurrentErrorHandler:", v7));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "requesting prox card transaction", (uint8_t *)buf, 2u);
  }

  v10 = objc_alloc_init((Class)SFClient);
  -[CRSetupLauncher setSharingClient:](self, "setSharingClient:", v10);

  objc_initWeak(buf, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupLauncher sharingClient](self, "sharingClient"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001502C;
  v14[3] = &unk_1000B5568;
  objc_copyWeak(&v17, buf);
  v12 = v6;
  v15 = v12;
  v13 = v7;
  v16 = v13;
  objc_msgSend(v11, "startProxCardTransactionWithOptions:completion:", 0, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);

}

- (void)_launchRemoteAlertWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint8_t v16[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupLauncher remoteAlert](self, "remoteAlert"));
  v9 = objc_msgSend(v8, "isValid");

  if (v9)
  {
    v11 = CarPairingLogging(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not showing CarPlaySetup - alert is still valid.", v16, 2u);
    }

    if (v7)
      v7[2](v7, 0);
  }
  else
  {
    v13 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.CarPlaySetupApp"), CFSTR("CARSetupContainerViewController"));
    v14 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
    objc_msgSend(v14, "setUserInfo:", v6);
    v15 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v13, v14);
    objc_msgSend(v15, "registerObserver:", self);
    objc_msgSend(v15, "activateWithContext:", 0);
    -[CRSetupLauncher setRemoteAlert:](self, "setRemoteAlert:", v15);

  }
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000B5588);
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000153E8;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015508;
  block[3] = &unk_1000B55B0;
  objc_copyWeak(&v9, &location);
  v8 = v5;
  v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = CarPairingLogging(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100069A3C(v5);

  -[CRSetupLauncher setCurrentErrorHandler:](self, "setCurrentErrorHandler:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupLauncher remoteAlert](self, "remoteAlert"));
  objc_msgSend(v6, "unregisterObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupLauncher remoteAlert](self, "remoteAlert"));
  objc_msgSend(v7, "invalidate");

  -[CRSetupLauncher setRemoteAlert:](self, "setRemoteAlert:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRSetupLauncher sharingClient](self, "sharingClient"));
  objc_msgSend(v8, "invalidate");

  -[CRSetupLauncher setSharingClient:](self, "setSharingClient:", 0);
}

- (SBSRemoteAlertHandle)remoteAlert
{
  return self->_remoteAlert;
}

- (void)setRemoteAlert:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAlert, a3);
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
  objc_storeStrong((id *)&self->_sharingClient, a3);
}

- (id)currentErrorHandler
{
  return self->_currentErrorHandler;
}

- (void)setCurrentErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentErrorHandler, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_remoteAlert, 0);
}

@end
