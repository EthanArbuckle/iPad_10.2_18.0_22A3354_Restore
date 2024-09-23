@implementation CDProviderViewService

- (CDProviderViewService)init
{
  CDProviderViewService *v2;
  CDProviderViewService *v3;
  uint64_t v4;
  OS_os_transaction *transaction;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CDProviderViewService;
  v2 = -[CDProviderViewService init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v4 = os_transaction_create("CompAuth/CDProviderViewService");
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v4;

  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)setActionHandler:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id actionHandler;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100010004;
    v9[3] = &unk_100030D70;
    v9[4] = self;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    actionHandler = self->_actionHandler;
    self->_actionHandler = v6;

    v8 = v10;
  }
  else
  {
    v8 = self->_actionHandler;
    self->_actionHandler = 0;
  }

}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[BSAtomicSignal signal](self->_activateCalledSignal, "signal");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000100CC;
  v7[3] = &unk_100030D98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001038C;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = cps_daemon_log();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "View service activated: %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;

  v4 = a3;
  v6 = cps_daemon_log(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "View service deactivated: %@", buf, 0xCu);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010878;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v13;
  _QWORD v14[5];
  _QWORD block[5];
  id v16;
  uint8_t buf[4];
  id v18;

  v6 = a3;
  v7 = a4;
  v9 = cps_daemon_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10001EAD0((uint64_t)v6, (uint64_t)v7, v11);

    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000109FC;
    block[3] = &unk_1000307C8;
    block[4] = self;
    v16 = v7;
    dispatch_async((dispatch_queue_t)dispatchQueue, block);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "View service invalidated: %@", buf, 0xCu);
    }

    v13 = self->_dispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100010A4C;
    v14[3] = &unk_1000307A0;
    v14[4] = self;
    dispatch_async((dispatch_queue_t)v13, v14);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCConnection *v5;
  void *v6;
  void *v7;
  NSXPCConnection *viewServiceConnection;
  id *v9;
  void *v10;

  v5 = (NSXPCConnection *)a4;
  -[NSXPCConnection setExportedObject:](v5, "setExportedObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CPSViewServiceInterface presenterInterface](CPSViewServiceInterface, "presenterInterface"));
  -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPSViewServiceInterface presentingInterface](CPSViewServiceInterface, "presentingInterface"));
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v7);

  -[NSXPCConnection resume](v5, "resume");
  viewServiceConnection = self->_viewServiceConnection;
  self->_viewServiceConnection = v5;

  v9 = sub_1000104E4((id *)&self->super.isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "establishConnection");

  return 1;
}

- (void)confirm
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010B58;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)deactivateWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010C24;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)webAuthenticationFinishedWithCallbackURL:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010CF0;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)webAuthenticationFailedWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010DBC;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)shareCompleted
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010E64;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)shareFailedWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010EE8;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)storeAuthenticationFinishedWithResult:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010FB4;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)storeAuthenticationFailedWithError:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011080;
  v7[3] = &unk_1000307C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)sharingData
{
  return self->_sharingData;
}

- (void)setSharingData:(id)a3
{
  objc_storeStrong((id *)&self->_sharingData, a3);
}

- (CPSSystemAuthenticationRequest)systemAuthenticationRequest
{
  return self->_systemAuthenticationRequest;
}

- (void)setSystemAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, a3);
}

- (CPSWebRequest)webAuthenticationRequest
{
  return self->_webAuthenticationRequest;
}

- (void)setWebAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_webAuthenticationRequest, a3);
}

- (NSArray)proxiedAppDomains
{
  return self->_proxiedAppDomains;
}

- (void)setProxiedAppDomains:(id)a3
{
  objc_storeStrong((id *)&self->_proxiedAppDomains, a3);
}

- (id)webAuthenticationCompletionHandler
{
  return self->_webAuthenticationCompletionHandler;
}

- (void)setWebAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CPSRestrictedAccessRequest)restrictedAccessRequest
{
  return self->_restrictedAccessRequest;
}

- (void)setRestrictedAccessRequest:(id)a3
{
  objc_storeStrong((id *)&self->_restrictedAccessRequest, a3);
}

- (CPSStoreAuthenticationRequest)storeAuthenticationRequest
{
  return self->_storeAuthenticationRequest;
}

- (void)setStoreAuthenticationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, a3);
}

- (id)storeAuthenticationCompletionHandler
{
  return self->_storeAuthenticationCompletionHandler;
}

- (void)setStoreAuthenticationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (CPSTVProviderRequest)tvProviderRequest
{
  return self->_tvProviderRequest;
}

- (void)setTvProviderRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tvProviderRequest, a3);
}

- (CPSDedicatedCameraRequest)dedicatedCameraRequest
{
  return self->_dedicatedCameraRequest;
}

- (void)setDedicatedCameraRequest:(id)a3
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dedicatedCameraRequest, 0);
  objc_storeStrong((id *)&self->_tvProviderRequest, 0);
  objc_storeStrong(&self->_storeAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_storeAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_restrictedAccessRequest, 0);
  objc_storeStrong(&self->_webAuthenticationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_proxiedAppDomains, 0);
  objc_storeStrong((id *)&self->_webAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_systemAuthenticationRequest, 0);
  objc_storeStrong((id *)&self->_sharingData, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_remoteDeviceName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_activateCalledSignal, 0);
  objc_storeStrong((id *)&self->_viewServiceHandle, 0);
  objc_storeStrong((id *)&self->_viewServiceConnection, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
