@implementation CDRequesterDaemon

- (CDRequesterDaemon)init
{
  CDRequesterDaemon *v2;
  CDRequesterDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDRequesterDaemon;
  v2 = -[CDRequesterDaemon init](&v5, "init");
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
  uint64_t v3;
  NSObject *v4;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = cps_daemon_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "activate called", buf, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004704;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = cps_daemon_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "invalidate called", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000047BC;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[CDRequesterDaemon _startServiceListener](self, "_startServiceListener");
}

- (void)_invalidated
{
  CDServiceListener *serviceListener;
  CDRequesterSession *currentSession;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    -[CDServiceListener invalidate](self->_serviceListener, "invalidate");
    serviceListener = self->_serviceListener;
    self->_serviceListener = 0;

    -[CDRequesterSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0;

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

- (id)_authenticationSessionWithClient:(id)a3 request:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  __objc2_class **v10;
  uint64_t v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_self(CPSStorePurchaseRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = off_100030238;
  }
  else
  {
    v11 = objc_opt_self(CPSSystemAuthenticationRequest);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_opt_isKindOfClass(v6, v12);

    if ((v13 & 1) != 0)
    {
      v10 = off_100030240;
    }
    else
    {
      v14 = objc_opt_self(CPSSharingRequest);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_opt_isKindOfClass(v6, v15);

      if ((v16 & 1) != 0)
      {
        v10 = off_100030228;
      }
      else
      {
        v17 = objc_opt_class(CPSRestrictedAccessRequest);
        if ((objc_opt_isKindOfClass(v6, v17) & 1) != 0)
        {
          v10 = off_100030220;
        }
        else
        {
          v18 = objc_opt_class(CPSStoreAuthenticationRequest);
          if ((objc_opt_isKindOfClass(v6, v18) & 1) != 0)
          {
            v10 = off_100030230;
          }
          else
          {
            v19 = objc_opt_class(CPSTVProviderRequest);
            if ((objc_opt_isKindOfClass(v6, v19) & 1) != 0)
            {
              v10 = &off_100030248;
            }
            else
            {
              v20 = objc_opt_class(CPSLearnMoreRequest);
              if ((objc_opt_isKindOfClass(v6, v20) & 1) == 0)
              {
                v21 = 0;
                goto LABEL_16;
              }
              v10 = off_100030218;
            }
          }
        }
      }
    }
  }
  v21 = objc_msgSend(objc_alloc(*v10), "initWithClient:request:", v5, v6);
LABEL_16:

  return v21;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CDRequesterDaemon *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004AEC;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
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
  CDRequesterSession *v16;
  CDRequesterSession *currentSession;
  CDRequesterSession *v18;
  CDRequesterSession *v19;
  id v20;
  CDRequesterSession *v21;
  id v22;
  CDRequesterSession *v23;
  id v24;
  CDRequesterSession *v25;
  CDRequesterSession *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  NSErrorUserInfoKey v40;
  void *v41;

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
    v16 = (CDRequesterSession *)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon _authenticationSessionWithClient:request:](self, "_authenticationSessionWithClient:request:", v12, v13));
    currentSession = self->_currentSession;
    self->_currentSession = v16;

    v18 = self->_currentSession;
    if (v18)
    {
      -[CDRequesterSession setDispatchQueue:](v18, "setDispatchQueue:", self->_dispatchQueue);
      v19 = self->_currentSession;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100004EE8;
      v38[3] = &unk_1000307F0;
      v20 = v11;
      v39 = v20;
      -[CDRequesterSession setDeviceAcceptedNotificationHandler:](v19, "setDeviceAcceptedNotificationHandler:", v38);
      v21 = self->_currentSession;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100004EF4;
      v36[3] = &unk_1000307F0;
      v22 = v20;
      v37 = v22;
      -[CDRequesterSession setDeviceStartedAuthenticationHandler:](v21, "setDeviceStartedAuthenticationHandler:", v36);
      v23 = self->_currentSession;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100004F00;
      v34[3] = &unk_100030818;
      v24 = v22;
      v35 = v24;
      -[CDRequesterSession setSessionFinishedHandler:](v23, "setSessionFinishedHandler:", v34);
      v25 = self->_currentSession;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100004F0C;
      v32[3] = &unk_100030840;
      v33 = v24;
      -[CDRequesterSession setSessionFailedHandler:](v25, "setSessionFailedHandler:", v32);
      v26 = self->_currentSession;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100004F18;
      v31[3] = &unk_1000307A0;
      v31[4] = self;
      -[CDRequesterSession setInvalidationHandler:](v26, "setInvalidationHandler:", v31);
      objc_storeStrong((id *)&self->_currentSessionConnection, a3);
      -[CDRequesterSession activateWithCompletionHandler:](self->_currentSession, "activateWithCompletionHandler:", v14);

    }
    else
    {
      v27 = CPSErrorDomain;
      v40 = NSDebugDescriptionErrorKey;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid authentication request: %@"), v13));
      v41 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v27, 101, v29));
      v14[2](v14, v30);

    }
  }

}

- (void)serviceConnection:(id)a3 fetchDaemonStatusWithCompletionHandler:(id)a4
{
  OS_dispatch_queue *dispatchQueue;
  void (**v6)(id, id, _QWORD);
  id v7;

  dispatchQueue = self->_dispatchQueue;
  v6 = (void (**)(id, id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CDRequesterDaemon descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0));
  v6[2](v6, v7, 0);

}

- (void)serviceListener:(id)a3 willAcceptConnection:(id)a4
{
  OS_dispatch_queue *dispatchQueue;
  id v6;

  dispatchQueue = self->_dispatchQueue;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)serviceListener:(id)a3 connectionInvalidated:(id)a4
{
  OS_dispatch_queue *dispatchQueue;
  CDServiceConnection *v6;
  CDServiceConnection *currentSessionConnection;
  CDRequesterSession *currentSession;
  CDServiceConnection *v9;

  dispatchQueue = self->_dispatchQueue;
  v6 = (CDServiceConnection *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  currentSessionConnection = self->_currentSessionConnection;

  if (currentSessionConnection == v6)
  {
    -[CDRequesterSession invalidate](self->_currentSession, "invalidate");
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    v9 = self->_currentSessionConnection;
    self->_currentSessionConnection = 0;

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSessionConnection, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
