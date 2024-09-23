@implementation _SBContinuitySessionServiceConnectionListener

- (_SBContinuitySessionServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5;
  _SBContinuitySessionServiceConnectionListener *v6;
  _SBContinuitySessionServiceConnectionListener *v7;
  uint64_t v8;
  NSMapTable *lock_connectionToClientMap;
  id v10;
  uint64_t v11;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v13;
  _SBContinuitySessionServiceConnectionListener *v14;
  uint64_t v15;
  BSServiceConnectionListener *connectionListener;
  _QWORD v18[4];
  _SBContinuitySessionServiceConnectionListener *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SBContinuitySessionServiceConnectionListener;
  v6 = -[_SBContinuitySessionServiceConnectionListener init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_connectionToClientMap = v7->_lock_connectionToClientMap;
    v7->_lock_connectionToClientMap = (NSMapTable *)v8;

    v10 = objc_alloc(MEMORY[0x1E0D22990]);
    v11 = objc_msgSend(v10, "initWithEntitlement:", *MEMORY[0x1E0DAC890]);
    serviceClientAuthenticator = v7->_serviceClientAuthenticator;
    v7->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v11;

    objc_storeStrong((id *)&v7->_connectionQueue, a3);
    v13 = (void *)MEMORY[0x1E0D23030];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70___SBContinuitySessionServiceConnectionListener_initWithServiceQueue___block_invoke;
    v18[3] = &unk_1E8E9EFA0;
    v14 = v7;
    v19 = v14;
    objc_msgSend(v13, "listenerWithConfigurator:", v18);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionListener = v14->_connectionListener;
    v14->_connectionListener = (BSServiceConnectionListener *)v15;

  }
  return v7;
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (id)_clientForConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[_SBContinuitySessionServiceConnectionListener _lock_clientForConnection:](self, "_lock_clientForConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_clientForConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[NSMapTable objectForKey:](self->_lock_connectionToClientMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeClientForConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_lock_connectionToClientMap, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)_sessionServiceClientWithConnectionContext:(id)a3
{
  id v5;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v13;

  v5 = a3;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v5, "remoteToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v7, &v13);
  v9 = v13;

  if (!v8)
  {
    SBLogContinuitySessionService();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:].cold.1(v5);
    goto LABEL_6;
  }
  -[_SBContinuitySessionServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceConnectionListener.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceClient"));
LABEL_6:

    v10 = 0;
  }

  return v10;
}

- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "_connectionQueue_handleLaunchEventOfType:payload:", v9, v6);

}

- (void)handleContinuityButtonEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "_connectionQueue_handleContinuityButtonEvent:", objc_msgSend(v6, "unsignedIntValue"));

}

- (void)setHostedInterfaceOrientation:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "_connectionQueue_setHostedInterfaceOrientation:", objc_msgSend(v6, "unsignedIntValue"));

}

- (void)didUpdateExternalBlockedReasons:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "_connectionQueue_handleUpdatedExternallyBlockedReasons:", v6);

}

- (void)noteHIDServicesConfigured
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_handleHIDServicesConfigured");
    v4 = v5;
  }

}

- (void)updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104___SBContinuitySessionServiceConnectionListener_updatedAppearanceSettings_transitionContext_completion___block_invoke;
  v16[3] = &unk_1E8EAE788;
  v17 = v10;
  v13 = v10;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v16);
  if (v12)
  {
    objc_msgSend(v12, "_connectionQueue_updatedAppearanceSettings:transitionContext:completion:", v8, v9, v14);
  }
  else
  {
    SBUIContinuitySessionErrorCreate();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v15);

  }
}

- (void)clientActivated
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_handleActivated");
    v4 = v5;
  }

}

- (void)didCaptureScreenshot
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didCaptureScreenshot");
    v4 = v5;
  }

}

- (void)didStartScreenRecording
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didStartScreenRecording");
    v4 = v5;
  }

}

- (void)didStopScreenRecording
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_didStopScreenRecording");
    v4 = v5;
  }

}

- (void)clientHasAdoptedScreenCaptureNotifications
{
  void *v3;
  void *v4;
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:](self, "_sessionServiceClientWithConnectionContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_connectionQueue_clientHasAdoptedScreenCaptureNotifications");
    v4 = v5;
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v9;
  char v10;
  id v11;
  void *v12;
  _SBContinuitySessionServiceClient *v13;
  void *v14;
  _SBContinuitySessionServiceClient *v15;
  _SBContinuitySessionServiceClient *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v7 = a4;
  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v7, "remoteToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v10 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v9, &v20);
  v11 = v20;

  if ((v10 & 1) == 0)
  {
    SBLogContinuitySessionService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_SBContinuitySessionServiceConnectionListener _sessionServiceClientWithConnectionContext:].cold.1(v7);
    goto LABEL_13;
  }
  if ((SBFIsOnenessAvailable() & 1) == 0)
  {
    SBLogContinuitySessionService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_SBContinuitySessionServiceConnectionListener listener:didReceiveConnection:withContext:].cold.2(v7);
    goto LABEL_13;
  }
  if (!+[SBContinuitySessionManager areContinuitySessionsAllowed](SBContinuitySessionManager, "areContinuitySessionsAllowed"))
  {
    SBLogContinuitySessionService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_SBContinuitySessionServiceConnectionListener listener:didReceiveConnection:withContext:].cold.1(v7);
LABEL_13:

    objc_msgSend(v7, "invalidate");
    goto LABEL_14;
  }
  -[_SBContinuitySessionServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceConnectionListener.m"), 219, CFSTR("Already tracking a client with this connection.. how???"));

  }
  v13 = [_SBContinuitySessionServiceClient alloc];
  objc_msgSend(v7, "remoteToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_SBContinuitySessionServiceClient initWithConnection:pid:](v13, "initWithConnection:pid:", v7, objc_msgSend(v14, "pid"));

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_lock_connectionToClientMap, "setObject:forKey:", v15, v7);
  os_unfair_lock_unlock(&self->_lock);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __91___SBContinuitySessionServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v19[3] = &unk_1E8EA1060;
  v19[4] = self;
  objc_msgSend(v7, "configureConnection:", v19);
  objc_msgSend(v7, "activate");
  v16 = v15;
  BSDispatchMain();

LABEL_14:
}

- (_SBContinuitySessionServiceConnectionListenerDelegate)delegate
{
  return (_SBContinuitySessionServiceConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_serviceClientAuthenticator, 0);
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
}

- (void)_sessionServiceClientWithConnectionContext:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "remoteToken");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pid");
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_0_7(&dword_1D0540000, v2, v3, "SBContinuitySessionService: Failed to authenticate client with pid %i - %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "remoteToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_12(v2, v3);
  OUTLINED_FUNCTION_2_16(&dword_1D0540000, v4, v5, "SBContinuitySessionService: Not allowing connection from client with pid %i - continuity sessions aren't allowed", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_5_10();
}

- (void)listener:(void *)a1 didReceiveConnection:withContext:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "remoteToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_12(v2, v3);
  OUTLINED_FUNCTION_2_16(&dword_1D0540000, v4, v5, "SBContinuitySessionService: Not allowing connection from client with pid %i - feature flag is disabled", v6, v7, v8, v9, 0);

  OUTLINED_FUNCTION_5_10();
}

@end
