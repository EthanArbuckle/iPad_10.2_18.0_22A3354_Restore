@implementation _SBExternalDisplayServiceConnectionListener

- (_SBExternalDisplayServiceConnectionListener)initWithServiceQueue:(id)a3
{
  id v5;
  _SBExternalDisplayServiceConnectionListener *v6;
  _SBExternalDisplayServiceConnectionListener *v7;
  uint64_t v8;
  NSMapTable *lock_connectionToClientMap;
  uint64_t v10;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v12;
  _SBExternalDisplayServiceConnectionListener *v13;
  uint64_t v14;
  BSServiceConnectionListener *connectionListener;
  _QWORD v17[4];
  _SBExternalDisplayServiceConnectionListener *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SBExternalDisplayServiceConnectionListener;
  v6 = -[_SBExternalDisplayServiceConnectionListener init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    lock_connectionToClientMap = v7->_lock_connectionToClientMap;
    v7->_lock_connectionToClientMap = (NSMapTable *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.externaldisplay.displayArrangements"));
    serviceClientAuthenticator = v7->_serviceClientAuthenticator;
    v7->_serviceClientAuthenticator = (FBServiceClientAuthenticator *)v10;

    objc_storeStrong((id *)&v7->_serviceQueue, a3);
    v12 = (void *)MEMORY[0x1E0D23030];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68___SBExternalDisplayServiceConnectionListener_initWithServiceQueue___block_invoke;
    v17[3] = &unk_1E8E9EFA0;
    v13 = v7;
    v18 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    connectionListener = v13->_connectionListener;
    v13->_connectionListener = (BSServiceConnectionListener *)v14;

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

- (void)notifyObserversExternalDisplayDidUpdateProperties:(id)a3 requestingClient:(id)a4
{
  id v6;
  id v7;
  NSObject *serviceQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidUpdateProperties_requestingClient___block_invoke;
  block[3] = &unk_1E8E9E270;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(serviceQueue, block);

}

- (void)notifyObserversExternalDisplayDidConnect:(id)a3
{
  id v4;
  NSObject *serviceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayDidConnect___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serviceQueue, v7);

}

- (void)notifyObserversExternalDisplayWillDisconnect:(id)a3
{
  id v4;
  NSObject *serviceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serviceQueue = self->_serviceQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __92___SBExternalDisplayServiceConnectionListener_notifyObserversExternalDisplayWillDisconnect___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serviceQueue, v7);

}

- (id)_clientForConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_lock_connectionToClientMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_createClientForConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _SBExternalDisplayServiceClient *v8;
  void *v9;
  _SBExternalDisplayServiceClient *v10;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[connection remoteProcess]"));

  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_connectionToClientMap, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 156, CFSTR("Already tracking connection: %@"), v5);

  }
  v8 = [_SBExternalDisplayServiceClient alloc];
  objc_msgSend(v5, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_SBExternalDisplayServiceClient initWithConnection:remoteProcess:](v8, "initWithConnection:remoteProcess:", v5, v9);

  -[NSMapTable setObject:forKey:](self->_lock_connectionToClientMap, "setObject:forKey:", v10, v5);
  os_unfair_lock_unlock(&self->_lock);

  return v10;
}

- (void)_removeClientForConnection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_lock_connectionToClientMap, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)getConnectedDisplayInfoWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBExternalDisplayServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v8)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    goto LABEL_3;
  }
  if (!WeakRetained)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "client:getConnectedDisplayInfoWithCompletion:", v6, v11);

}

- (void)setDisplayArrangement:(id)a3 forDisplay:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBExternalDisplayServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    goto LABEL_3;
  }
  if (!WeakRetained)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "client:setDisplayArrangement:forDisplay:", v9, v14, v7);

}

- (void)setDisplayMirroringEnabled:(id)a3 forDisplay:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBExternalDisplayServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    goto LABEL_3;
  }
  if (!WeakRetained)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v11, "client:setDisplayMirroringEnabled:forDisplay:", v9, v14, v7);

}

- (void)setDisplayModeSettings:(id)a3 forDisplay:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serviceQueue);
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBExternalDisplayServiceConnectionListener _clientForConnection:](self, "_clientForConnection:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = WeakRetained;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v17)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    goto LABEL_3;
  }
  if (!WeakRetained)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v17, "client:setDisplayModeSettings:forDisplay:options:completionHandler:", v15, v20, v11, v12, v13);

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  NSObject *v8;
  FBServiceClientAuthenticator *serviceClientAuthenticator;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogDisplayControlling();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "SBExternalDisplayService: Received Connection: %{public}@", buf, 0xCu);
  }

  serviceClientAuthenticator = self->_serviceClientAuthenticator;
  objc_msgSend(v7, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v12 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](serviceClientAuthenticator, "authenticateAuditToken:error:", v11, &v19);
  v13 = v19;

  if ((v12 & 1) == 0)
  {
    SBLogDisplayControlling();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:].cold.3((uint64_t)v13, (uint64_t)v7, v16);
    goto LABEL_14;
  }
  if ((SBFIsChamoisExternalDisplayControllerAvailable() & 1) == 0)
  {
    SBLogDisplayControlling();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:].cold.2(v16);
LABEL_14:

    objc_msgSend(v7, "invalidate");
    goto LABEL_15;
  }
  -[_SBExternalDisplayServiceConnectionListener _createClientForConnection:](self, "_createClientForConnection:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 223, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89___SBExternalDisplayServiceConnectionListener_listener_didReceiveConnection_withContext___block_invoke;
  v18[3] = &unk_1E8EA1060;
  v18[4] = self;
  objc_msgSend(v7, "configureConnection:", v18);
  SBLogDisplayControlling();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[_SBExternalDisplayServiceConnectionListener listener:didReceiveConnection:withContext:].cold.1((uint64_t)v14, v15);

  objc_msgSend(v7, "activate");
LABEL_15:

}

- (void)_handleDisconnectForServiceConnection:(id)a3
{
  NSObject *serviceQueue;
  id v5;

  serviceQueue = self->_serviceQueue;
  v5 = a3;
  dispatch_assert_queue_V2(serviceQueue);
  -[_SBExternalDisplayServiceConnectionListener _removeClientForConnection:](self, "_removeClientForConnection:", v5);

}

- (_SBExternalDisplayServiceConnectionListenerDelegate)delegate
{
  return (_SBExternalDisplayServiceConnectionListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_lock_connectionToClientMap, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "SBExternalDisplayService: connecting client %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)listener:(os_log_t)log didReceiveConnection:withContext:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBExternalDisplayService: Service unavailable. Invalidating connection.", v1, 2u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "SBExternalDisplayService: Connection did not pass entitlement validation: %{public}@\n %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
