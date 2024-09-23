@implementation CDRequesterSession

- (CDRequesterSession)initWithClient:(id)a3 request:(id)a4
{
  id v7;
  id v8;
  CDRequesterSession *v9;
  uint64_t v10;
  OS_os_transaction *transaction;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CDRequesterSession;
  v9 = -[CDRequesterSession init](&v13, "init");
  if (v9)
  {
    v10 = os_transaction_create("companion authentication session");
    transaction = v9->_transaction;
    v9->_transaction = (OS_os_transaction *)v10;

    objc_storeStrong((id *)&v9->_dispatchQueue, &_dispatch_main_q);
    v9->_activateCalledAtomic = 0;
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong(&v9->_request, a4);
  }

  return v9;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)activateWithCompletionHandler:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100014EFC;
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
  block[2] = sub_10001507C;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidated
{
  RPCompanionLinkClient *rapportClient;
  SFService *sharingService;
  id deviceAcceptedNotificationHandler;
  id deviceStartedAuthenticationHandler;
  id sessionFinishedHandler;
  id sessionFailedHandler;
  CDIDSService *idsService;
  void (**invalidationHandler)(void);
  id v11;

  if (!self->_invalidateDone)
  {
    -[RPCompanionLinkClient invalidate](self->_rapportClient, "invalidate");
    rapportClient = self->_rapportClient;
    self->_rapportClient = 0;

    -[SFService invalidate](self->_sharingService, "invalidate");
    sharingService = self->_sharingService;
    self->_sharingService = 0;

    deviceAcceptedNotificationHandler = self->_deviceAcceptedNotificationHandler;
    self->_deviceAcceptedNotificationHandler = 0;

    deviceStartedAuthenticationHandler = self->_deviceStartedAuthenticationHandler;
    self->_deviceStartedAuthenticationHandler = 0;

    sessionFinishedHandler = self->_sessionFinishedHandler;
    self->_sessionFinishedHandler = 0;

    sessionFailedHandler = self->_sessionFailedHandler;
    self->_sessionFailedHandler = 0;

    sub_10001541C((id *)&self->super.isa);
    -[CDIDSService invalidate](self->_idsService, "invalidate");
    idsService = self->_idsService;
    self->_idsService = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      v11 = self->_invalidationHandler;
      self->_invalidationHandler = 0;

    }
    self->_invalidateDone = 1;
  }
}

- (void)_prepareForActivationWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)_configureRapportClient:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (unsigned)_deviceActionType
{
  return 34;
}

- (void)_notifyDeviceAcceptedNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (**deviceAcceptedNotificationHandler)(id, id);
  int v8;
  id v9;

  v4 = a3;
  v5 = cps_session_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device accepted notification: %@", (uint8_t *)&v8, 0xCu);
  }

  deviceAcceptedNotificationHandler = (void (**)(id, id))self->_deviceAcceptedNotificationHandler;
  if (deviceAcceptedNotificationHandler)
    deviceAcceptedNotificationHandler[2](deviceAcceptedNotificationHandler, v4);

}

- (void)_notifyDeviceStartedAuthentication:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (**deviceStartedAuthenticationHandler)(id, id);
  int v8;
  id v9;

  v4 = a3;
  v5 = cps_session_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device started server authentication: %@", (uint8_t *)&v8, 0xCu);
  }

  deviceStartedAuthenticationHandler = (void (**)(id, id))self->_deviceStartedAuthenticationHandler;
  if (deviceStartedAuthenticationHandler)
    deviceStartedAuthenticationHandler[2](deviceStartedAuthenticationHandler, v4);

}

- (void)_notifySessionFinished:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (**sessionFinishedHandler)(id, id);
  int v8;
  id v9;

  v4 = a3;
  v5 = cps_session_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Authentication session finished: %@", (uint8_t *)&v8, 0xCu);
  }

  sessionFinishedHandler = (void (**)(id, id))self->_sessionFinishedHandler;
  if (sessionFinishedHandler)
    sessionFinishedHandler[2](sessionFinishedHandler, v4);

}

- (void)_notifySessionFailed:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**sessionFailedHandler)(id, id);
  void *v14;

  v4 = a3;
  v5 = cps_session_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10001EE48((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);

  sessionFailedHandler = (void (**)(id, id))self->_sessionFailedHandler;
  if (sessionFailedHandler)
  {
    if (v4)
    {
      sessionFailedHandler[2](sessionFailedHandler, v4);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 100, 0));
      sessionFailedHandler[2](sessionFailedHandler, v14);

    }
  }

}

- (id)_responseForGetNotifInfoRequest:(id)a3
{
  return 0;
}

- (BOOL)_isSandboxPurchase
{
  return 0;
}

- (void)_stopAdvertisingNearbyAction
{
  SFService *sharingService;

  -[SFService invalidate](self->_sharingService, "invalidate");
  sharingService = self->_sharingService;
  self->_sharingService = 0;

}

- (BOOL)_requireOwnerDevice
{
  return 0;
}

- (unint64_t)_authFlags
{
  return 0;
}

- (id)_idsMessageRecipientUsernames
{
  return 0;
}

- (CDServiceClient)client
{
  return self->_client;
}

- (id)request
{
  return self->_request;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (id)deviceAcceptedNotificationHandler
{
  return self->_deviceAcceptedNotificationHandler;
}

- (void)setDeviceAcceptedNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceStartedAuthenticationHandler
{
  return self->_deviceStartedAuthenticationHandler;
}

- (void)setDeviceStartedAuthenticationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)sessionFinishedHandler
{
  return self->_sessionFinishedHandler;
}

- (void)setSessionFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)sessionFailedHandler
{
  return self->_sessionFailedHandler;
}

- (void)setSessionFailedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_sessionFailedHandler, 0);
  objc_storeStrong(&self->_sessionFinishedHandler, 0);
  objc_storeStrong(&self->_deviceStartedAuthenticationHandler, 0);
  objc_storeStrong(&self->_deviceAcceptedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_sharingService, 0);
  objc_storeStrong((id *)&self->_rapportClient, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
