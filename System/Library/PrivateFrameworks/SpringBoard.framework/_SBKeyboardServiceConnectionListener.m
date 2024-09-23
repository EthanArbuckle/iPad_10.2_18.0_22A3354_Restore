@implementation _SBKeyboardServiceConnectionListener

- (_SBKeyboardServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5;
  _SBKeyboardServiceConnectionListener *v6;
  uint64_t v7;
  NSMapTable *connectionContextToClientMap;
  id v9;
  uint64_t v10;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v12;
  _SBKeyboardServiceConnectionListener *v13;
  uint64_t v14;
  BSServiceConnectionListener *connectionListener;
  _QWORD v17[4];
  _SBKeyboardServiceConnectionListener *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SBKeyboardServiceConnectionListener;
  v6 = -[_SBKeyboardServiceConnectionListener init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    connectionContextToClientMap = v6->_connectionContextToClientMap;
    v6->_connectionContextToClientMap = (NSMapTable *)v7;

    v9 = objc_alloc(MEMORY[0x1E0D22990]);
    v10 = objc_msgSend(v9, "initWithEntitlement:", *MEMORY[0x1E0DAB788]);
    serviceClientAuthenticator = v6->_serviceClientAuthenticator;
    v6->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    objc_storeStrong((id *)&v6->_serviceQueue, a3);
    v12 = (void *)MEMORY[0x1E0D23030];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61___SBKeyboardServiceConnectionListener_initWithServiceQueue___block_invoke;
    v17[3] = &unk_1E8E9EFA0;
    v13 = v6;
    v18 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;

  }
  return v6;
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (id)_clientForConnectionContext:(id)a3
{
  id v4;
  _SBKeyboardServiceClient *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_connectionContextToClientMap, "objectForKey:", v4);
  v5 = (_SBKeyboardServiceClient *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[_SBKeyboardServiceClient initWithConnectionContext:]([_SBKeyboardServiceClient alloc], "initWithConnectionContext:", v4);
    -[NSMapTable setObject:forKey:](self->_connectionContextToClientMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)_removeClientForConnectionContext:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_connectionContextToClientMap, "removeObjectForKey:", a3);
}

- (void)requestKeyboardFocusForSceneIdentity:(id)a3 pid:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id WeakRetained;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "remoteToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v17 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v16, &v23);
  v18 = v23;

  if (v17)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    objc_msgSend(WeakRetained, "client:requestKeyboardFocusForSceneIdentity:pid:completion:", v13, v9, v10, v11);

  }
  else
  {
    SBLogKeyboardFocus();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:].cold.1();

    v11[2](v11, MEMORY[0x1E0C9AAA0], v18);
  }

}

- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 pid:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v12;
  int v13;
  id v14;
  NSObject *WeakRetained;
  void *v16;
  void *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v10, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v12, &v18);
  v14 = v18;

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    -[NSObject client:removeKeyboardFocusFromSceneIdentity:pid:](WeakRetained, "client:removeKeyboardFocusFromSceneIdentity:pid:", v10, v7, v8);
  }
  else
  {
    SBLogKeyboardFocus();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:].cold.1();
  }

}

- (void)deferAdditionalEnvironments:(id)a3 whenSceneHasKeyboardFocus:(id)a4 pid:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v15;
  int v16;
  id v17;
  NSObject *WeakRetained;
  void *v19;
  void *v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v13, "auditToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v16 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v15, &v21);
  v17 = v21;

  if (v16)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    -[NSObject client:deferAdditionalEnvironments:whenSceneHasKeyboardFocus:pid:](WeakRetained, "client:deferAdditionalEnvironments:whenSceneHasKeyboardFocus:pid:", v13, v9, v10, v11);
  }
  else
  {
    SBLogKeyboardFocus();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:].cold.1();
  }

}

- (void)stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:(id)a3 pid:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v12;
  int v13;
  id v14;
  NSObject *WeakRetained;
  void *v16;
  void *v17;
  id v18;

  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v10, "auditToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v12, &v18);
  v14 = v18;

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    -[NSObject client:stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:pid:](WeakRetained, "client:stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:pid:", v10, v7, v8);
  }
  else
  {
    SBLogKeyboardFocus();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:].cold.1();
  }

}

- (void)setExternalSceneIdentities:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v9;
  int v10;
  id v11;
  NSObject *WeakRetained;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v7, "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v9, &v15);
  v11 = v15;

  if (v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    }
    -[NSObject client:setExternalSceneIdentities:](WeakRetained, "client:setExternalSceneIdentities:", v7, v5);
  }
  else
  {
    SBLogKeyboardFocus();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      -[_SBKeyboardServiceConnectionListener requestKeyboardFocusForSceneIdentity:pid:completion:].cold.1();
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  void *v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  _QWORD v13[5];

  v7 = (void *)MEMORY[0x1E0D23010];
  v8 = a4;
  objc_msgSend(v7, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82___SBKeyboardServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v13[3] = &unk_1E8EA1060;
  v13[4] = self;
  objc_msgSend(v8, "configureConnection:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientDidConnect:", v12);

  objc_msgSend(v8, "activate");
}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBKeyboardServiceConnectionListener _clientForConnectionContext:](self, "_clientForConnectionContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBKeyboardServiceConnectionListener.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  -[_SBKeyboardServiceConnectionListener _removeClientForConnectionContext:](self, "_removeClientForConnectionContext:", v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "clientDidDisconnect:", v6);

}

- (_SBKeyboardServiceConnectionListenerDelegate)delegate
{
  return (_SBKeyboardServiceConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_connectionContextToClientMap, 0);
}

- (void)requestKeyboardFocusForSceneIdentity:pid:completion:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_4_5(v0, v1);
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_7(&dword_1D0540000, v2, v3, "SBKeyboardFocusService: Failed to authenticate client with pid %i -  %{public}@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

@end
