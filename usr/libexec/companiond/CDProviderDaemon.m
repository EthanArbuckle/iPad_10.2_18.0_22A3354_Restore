@implementation CDProviderDaemon

- (CDProviderDaemon)init
{
  CDProviderDaemon *v2;
  CDProviderDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDProviderDaemon;
  v2 = -[CDProviderDaemon init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void)activate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D590;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D5FC;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CDProviderDaemon _startServiceListener](self, "_startServiceListener");
  -[CDProviderDaemon _startDeviceDiscovery](self, "_startDeviceDiscovery");
  -[CDProviderDaemon _startIDSService](self, "_startIDSService");
}

- (void)_invalidated
{
  CDServiceListener *serviceListener;
  CDProviderSession *currentSession;
  CDServiceConnection *currentSessionConnection;
  CDDeviceDiscovery *deviceDiscovery;
  CDIDSService *idsService;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    -[CDServiceListener invalidate](self->_serviceListener, "invalidate");
    serviceListener = self->_serviceListener;
    self->_serviceListener = 0;

    -[CDProviderSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    currentSessionConnection = self->_currentSessionConnection;
    self->_currentSessionConnection = 0;

    -[CDDeviceDiscovery invalidate](self->_deviceDiscovery, "invalidate");
    deviceDiscovery = self->_deviceDiscovery;
    self->_deviceDiscovery = 0;

    -[CDIDSService invalidate](self->_idsService, "invalidate");
    idsService = self->_idsService;
    self->_idsService = 0;

    self->_invalidateDone = 1;
  }
}

- (void)_startServiceListener
{
  CDServiceListener *v3;
  CDServiceListener *serviceListener;

  v3 = objc_alloc_init(CDServiceListener);
  serviceListener = self->_serviceListener;
  self->_serviceListener = v3;

  -[CDServiceListener setDispatchQueue:](self->_serviceListener, "setDispatchQueue:", self->_dispatchQueue);
  -[CDServiceListener setDelegate:](self->_serviceListener, "setDelegate:", self);
  -[CDServiceListener activate](self->_serviceListener, "activate");
}

- (void)_foundDeviceWithIdentifier:(id)a3 discoveryType:(int64_t)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  CDProviderSession *v9;
  CDProviderSession *currentSession;
  CDProviderSession *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  __CFString *v16;

  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("?");
    if (a4 == 2)
      v7 = CFSTR("LegacyAppSignIn");
    if (a4 == 1)
      v7 = CFSTR("CompanionAuthentication");
    v8 = v7;
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FoundDevice, device=%@, type=%@", buf, 0x16u);

  }
  if (!self->_currentSession)
  {
    v9 = -[CDProviderSession initWithDeviceIdentifier:discoveryType:]([CDProviderSession alloc], "initWithDeviceIdentifier:discoveryType:", v6, a4);
    currentSession = self->_currentSession;
    self->_currentSession = v9;

    -[CDProviderSession setDispatchQueue:](self->_currentSession, "setDispatchQueue:", self->_dispatchQueue);
    v11 = self->_currentSession;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001D88C;
    v12[3] = &unk_1000307A0;
    v12[4] = self;
    -[CDProviderSession setInvalidationHandler:](v11, "setInvalidationHandler:", v12);
    -[CDProviderSession activate](self->_currentSession, "activate");
  }

}

- (void)_startDeviceDiscovery
{
  CDDeviceDiscovery *v3;
  CDDeviceDiscovery *deviceDiscovery;
  CDDeviceDiscovery *v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(CDDeviceDiscovery);
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = v3;

  -[CDDeviceDiscovery setDispatchQueue:](self->_deviceDiscovery, "setDispatchQueue:", self->_dispatchQueue);
  v5 = self->_deviceDiscovery;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001D928;
  v6[3] = &unk_100030DE0;
  v6[4] = self;
  -[CDDeviceDiscovery setDeviceFoundHandler:](v5, "setDeviceFoundHandler:", v6);
  -[CDDeviceDiscovery activate](self->_deviceDiscovery, "activate");
}

- (void)_startIDSService
{
  CDIDSService *v3;
  CDIDSService *idsService;
  CDIDSService *v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(CDIDSService);
  idsService = self->_idsService;
  self->_idsService = v3;

  -[CDIDSService setDispatchQueue:](self->_idsService, "setDispatchQueue:", self->_dispatchQueue);
  v5 = self->_idsService;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001D9C4;
  v6[3] = &unk_1000311C0;
  v6[4] = self;
  -[CDIDSService setMessageReceivedHandler:](v5, "setMessageReceivedHandler:", v6);
  -[CDIDSService activate](self->_idsService, "activate");
}

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  CDProviderSession *v8;

  v4 = a4;
  v5 = objc_opt_self(CPSDedicatedCameraRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
    v8 = -[CDProviderSession initWithLocalAuthenticationRequest:]([CDProviderSession alloc], "initWithLocalAuthenticationRequest:", v4);
  else
    v8 = 0;

  return v8;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CDProviderDaemon *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001DB24;
  v8[3] = &unk_1000307C8;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self));
  v9 = v5;
  v10 = self;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "build"));

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (void)serviceConnection:(id)a3 serviceClient:(id)a4 startAuthenticationSessionWithRequest:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  CDProviderSession *v16;
  CDProviderSession *currentSession;
  CDProviderSession *v18;
  id v19;
  CDProviderSession *v20;
  CDProviderSession *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  NSErrorUserInfoKey v31;
  void *v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_currentSession)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CPSErrorDomain, 102, 0));
    v14[2](v14, v15);

  }
  else
  {
    v16 = (CDProviderSession *)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon _authenticationSessionWithClient:request:](self, "_authenticationSessionWithClient:request:", v12, v13));
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10001DEC0;
      v29[3] = &unk_100030818;
      v19 = v11;
      v30 = v19;
      -[CDProviderSession setSessionFinishedHandler:](v18, "setSessionFinishedHandler:", v29);
      v20 = self->_currentSession;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10001DECC;
      v27[3] = &unk_100030840;
      v28 = v19;
      -[CDProviderSession setSessionFailedHandler:](v20, "setSessionFailedHandler:", v27);
      v21 = self->_currentSession;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001DED8;
      v26[3] = &unk_1000307A0;
      v26[4] = self;
      -[CDProviderSession setInvalidationHandler:](v21, "setInvalidationHandler:", v26);
      -[CDProviderSession setDispatchQueue:](self->_currentSession, "setDispatchQueue:", self->_dispatchQueue);
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      -[CDProviderSession activate](self->_currentSession, "activate");

    }
    else
    {
      v22 = CPSErrorDomain;
      v31 = NSDebugDescriptionErrorKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid authentication request: %@"), v13));
      v32 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, 101, v24));
      v14[2](v14, v25);

    }
  }

}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CDProviderDaemon descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0));
  (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v7, 0);

}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
  objc_msgSend(a4, "setDelegate:", self);
}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
  -[CDProviderSession invalidate](self->_currentSession, "invalidate", a3, a4);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentSessionConnection, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end
