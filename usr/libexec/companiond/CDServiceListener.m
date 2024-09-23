@implementation CDServiceListener

- (CDServiceListener)init
{
  CDServiceListener *v2;
  CDServiceListener *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CDServiceListener;
  v2 = -[CDServiceListener init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
    v3->_languageNotificationToken = -1;
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  v3 = cps_service_listener_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10001ED44(v4, v5, v6, v7, v8, v9, v10, v11);

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001457C;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  v3 = cps_service_listener_log(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10001ED78(v4, v5, v6, v7, v8, v9, v10, v11);

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014618;
  block[3] = &unk_1000307A0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSXPCListener *v7;
  NSXPCListener *listener;
  uint8_t v9[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = cps_service_listener_log(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "activated", v9, 2u);
  }

  -[CDServiceListener _languageNotificationEnsureStarted](self, "_languageNotificationEnsureStarted");
  v7 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.companiond.xpc"));
  listener = self->_listener;
  self->_listener = v7;

  -[NSXPCListener _setQueue:](self->_listener, "_setQueue:", self->_dispatchQueue);
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSXPCListener *listener;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    v5 = cps_service_listener_log(v3, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "invalidated", v8, 2u);
    }

    -[CDServiceListener _languageNotificationEnsureStopped](self, "_languageNotificationEnsureStopped");
    -[NSXPCListener invalidate](self->_listener, "invalidate");
    listener = self->_listener;
    self->_listener = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    self->_invalidateDone = 1;
  }
}

- (void)_connectionInvalidated:(id)a3
{
  OS_dispatch_queue *dispatchQueue;
  id v5;
  id WeakRetained;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serviceListener:connectionInvalidated:", self, v5);

}

- (void)_languageNotificationEnsureStarted
{
  if (self->_languageNotificationToken == -1)
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &self->_languageNotificationToken, (dispatch_queue_t)self->_dispatchQueue, &stru_100030F50);
}

- (void)_languageNotificationEnsureStopped
{
  int languageNotificationToken;

  languageNotificationToken = self->_languageNotificationToken;
  if (languageNotificationToken != -1)
  {
    notify_cancel(languageNotificationToken);
    self->_languageNotificationToken = -1;
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  CDServiceListener *v10;

  v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014960;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceListener descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3));
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CDServiceListener succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "build"));

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  OS_dispatch_queue *dispatchQueue;
  id v6;
  CDServiceConnection *v7;
  void *v8;
  void *v9;
  CDServiceConnection *v10;
  id WeakRetained;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  CDServiceListener *v17;
  CDServiceConnection *v18;

  dispatchQueue = self->_dispatchQueue;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  v7 = -[CDServiceConnection initWithConnection:]([CDServiceConnection alloc], "initWithConnection:", v6);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPSAuthenticationServiceInterface daemonInterface](CPSAuthenticationServiceInterface, "daemonInterface"));
  objc_msgSend(v6, "setExportedInterface:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPSAuthenticationServiceInterface clientInterface](CPSAuthenticationServiceInterface, "clientInterface"));
  objc_msgSend(v6, "setRemoteObjectInterface:", v9);

  objc_msgSend(v6, "setExportedObject:", v7);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100014B48;
  v16 = &unk_1000307C8;
  v17 = self;
  v18 = v7;
  v10 = v7;
  objc_msgSend(v6, "setInvalidationHandler:", &v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "serviceListener:willAcceptConnection:", self, v10, v13, v14, v15, v16, v17);

  objc_msgSend(v6, "resume");
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (CDServiceListenerDelegate)delegate
{
  return (CDServiceListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
