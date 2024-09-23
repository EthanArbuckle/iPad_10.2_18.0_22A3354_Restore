@implementation PKXPCService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceResumedListenerInvalidater, 0);
  objc_storeStrong((id *)&self->_backgroundListener, 0);
  objc_storeStrong((id *)&self->_foregroundListener, 0);
  objc_storeStrong((id *)&self->_foregroundActiveArbiter, 0);
  objc_storeStrong((id *)&self->_currentExportedProxy, 0);
  objc_storeStrong((id *)&self->_templateExportedProxy, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceResumedNotificationName, 0);
  objc_storeStrong((id *)&self->_className, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
}

uint64_t __47__PKXPCService__invalidateConnectionIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;

  v4 = (void (**)(_QWORD, _QWORD))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, a3);
  -[PKXPCService _connection]((os_unfair_lock_s *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v4)
    v4[2](v4, 0);

  return v6;
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7 options:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  objc_class *v19;
  void *v20;
  PKXPCService *v21;
  uint64_t v22;
  NSString *machServiceName;
  NSXPCInterface *v24;
  NSObject *v25;
  NSXPCInterface *remoteObjectInterface;
  NSXPCInterface *v27;
  NSXPCInterface *exportedObjectInterface;
  PKXPCForwarder *v29;
  PKXPCForwarder *templateExportedProxy;
  uint64_t v31;
  NSString *className;
  uint64_t v33;
  NSString *serviceResumedNotificationName;
  PKForegroundActiveArbiter *foregroundActiveArbiter;
  void *v36;
  uint64_t v37;
  NSObject *foregroundListener;
  uint64_t v39;
  NSObject *backgroundListener;
  NSString *v41;
  uint64_t v42;
  PKInvalidatable *serviceResumedListenerInvalidater;
  objc_super v45;
  id from[4];
  id v47;
  id location;
  _BYTE buf[24];
  void *v50;
  id v51[2];

  v51[1] = *(id *)MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v45.receiver = self;
    v45.super_class = (Class)PKXPCService;
    v21 = -[PKXPCService init](&v45, sel_init);
    if (v21)
    {
      v22 = objc_msgSend(v14, "copy");
      machServiceName = v21->_machServiceName;
      v21->_machServiceName = (NSString *)v22;

      if (v15)
      {
        v24 = (NSXPCInterface *)v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1DC580);
        v24 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
      }
      remoteObjectInterface = v21->_remoteObjectInterface;
      v21->_remoteObjectInterface = v24;

      if (v16)
      {
        v27 = (NSXPCInterface *)v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1DC580);
        v27 = (NSXPCInterface *)objc_claimAutoreleasedReturnValue();
      }
      exportedObjectInterface = v21->_exportedObjectInterface;
      v21->_exportedObjectInterface = v27;

      if (v17)
      {
        v29 = (PKXPCForwarder *)PKXPCForwarderCreate(v17);
        templateExportedProxy = v21->_templateExportedProxy;
        v21->_templateExportedProxy = v29;

      }
      v21->_options = a8;
      v31 = objc_msgSend(v20, "copy");
      className = v21->_className;
      v21->_className = (NSString *)v31;

      if (objc_msgSend(v18, "length"))
      {
        v33 = objc_msgSend(v18, "copy");
        serviceResumedNotificationName = v21->_serviceResumedNotificationName;
        v21->_serviceResumedNotificationName = (NSString *)v33;
      }
      else
      {
        serviceResumedNotificationName = v21->_serviceResumedNotificationName;
        v21->_serviceResumedNotificationName = 0;
      }

      v21->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v21->_foregroundActiveArbiter, (id)ForegroundActiveArbiter);
      foregroundActiveArbiter = v21->_foregroundActiveArbiter;
      if (!foregroundActiveArbiter
        || (v21->_suspendCallbacks = (-[PKForegroundActiveArbiter registerObserver:](foregroundActiveArbiter, "registerObserver:", v21) & 1) == 0, !v21->_foregroundActiveArbiter))
      {
        if (!v21->_foregroundListener || !v21->_backgroundListener)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, v21);
          if (!v21->_foregroundListener)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke;
            v50 = &unk_1E2AC3CB8;
            objc_copyWeak(v51, &location);
            objc_msgSend(v36, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationWillEnterForegroundNotification"), 0, 0, buf);
            v37 = objc_claimAutoreleasedReturnValue();
            foregroundListener = v21->_foregroundListener;
            v21->_foregroundListener = v37;

            objc_destroyWeak(v51);
          }
          if (!v21->_backgroundListener)
          {
            from[0] = (id)MEMORY[0x1E0C809B0];
            from[1] = (id)3221225472;
            from[2] = __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke_2;
            from[3] = &unk_1E2AC3CB8;
            objc_copyWeak(&v47, &location);
            objc_msgSend(v36, "addObserverForName:object:queue:usingBlock:", CFSTR("UIApplicationDidEnterBackgroundNotification"), 0, 0, from);
            v39 = objc_claimAutoreleasedReturnValue();
            backgroundListener = v21->_backgroundListener;
            v21->_backgroundListener = v39;

            objc_destroyWeak(&v47);
          }
          objc_destroyWeak(&location);

        }
      }
      if (!v21->_serviceResumedListenerInvalidater && v21->_serviceResumedNotificationName)
      {
        objc_initWeak(from, v21);
        v41 = v21->_serviceResumedNotificationName;
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __63__PKXPCService__registerForServiceListenerResumedNotifications__block_invoke;
        v50 = &unk_1E2AC76C8;
        objc_copyWeak(v51, from);
        PKNotifyCoalescedRegister(v41, buf);
        v42 = objc_claimAutoreleasedReturnValue();
        serviceResumedListenerInvalidater = v21->_serviceResumedListenerInvalidater;
        v21->_serviceResumedListenerInvalidater = (PKInvalidatable *)v42;

        objc_destroyWeak(v51);
        objc_destroyWeak(from);
      }
      if (!v21->_suspendCallbacks)
        -[PKXPCService _establishServiceConnection]((uint64_t)v21);
    }
  }
  else
  {
    PKLogFacilityTypeGetObject(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      _os_log_error_impl(&dword_18FC92000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Invalid mach service name %{public}@", buf, 0x16u);
    }

    v21 = 0;
  }

  return v21;
}

- (void)_establishServiceConnection
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  if (!*(_QWORD *)(a1 + 48))
    -[PKXPCService _createConnectionIfPossible:](a1, 1);
  os_unfair_lock_unlock(v2);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;

  v4 = (void (**)(_QWORD, _QWORD))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, a3);
  -[PKXPCService _connection]((os_unfair_lock_s *)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v4)
    v4[2](v4, 0);

  return v6;
}

- (uint64_t)_newWrappedErrorHandlerForHandler:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v3 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 24);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __50__PKXPCService__newWrappedErrorHandlerForHandler___block_invoke;
    v11 = &unk_1E2ABEB88;
    v12 = v4;
    v13 = v3;
    v5 = v4;
    v6 = _Block_copy(&v8);
    a1 = objc_msgSend(v6, "copy", v8, v9, v10, v11);

  }
  return a1;
}

- (id)_connection
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 10;
    os_unfair_lock_lock(a1 + 10);
    -[PKXPCService _createConnectionIfPossible:]((uint64_t)v1, 0);
    v1 = (id *)v1[6];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)_createConnectionIfPossible:(uint64_t)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id WeakRetained;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id location;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 48))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", *(_QWORD *)(a1 + 120), 0);
    v4 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v3;

    objc_msgSend(*(id *)(a1 + 48), "setRemoteObjectInterface:", *(_QWORD *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 48), "setExportedInterface:", *(_QWORD *)(a1 + 16));
    v5 = *(void **)(a1 + 56);
    if (v5)
    {
      PKXPCForwarderCopy(v5);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v7;

      objc_msgSend(*(id *)(a1 + 48), "setExportedObject:", *(_QWORD *)(a1 + 64));
    }
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 24);
    objc_initWeak(&location, (id)a1);
    v10 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke;
    v38[3] = &unk_1E2AC7678;
    v11 = v8;
    v39 = v11;
    objc_copyWeak(&v40, &location);
    v12 = (void *)objc_msgSend(v38, "copy");
    v13 = *(void **)(a1 + 48);
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke_3;
    v33[3] = &unk_1E2AC76A0;
    v14 = v9;
    v34 = v14;
    objc_copyWeak(&v37, &location);
    v15 = v11;
    v35 = v15;
    v16 = v12;
    v36 = v16;
    objc_msgSend(v13, "setInterruptionHandler:", v33);
    v17 = *(void **)(a1 + 48);
    v28[0] = v10;
    v28[1] = 3221225472;
    v28[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke_53;
    v28[3] = &unk_1E2AC76A0;
    v18 = v14;
    v29 = v18;
    objc_copyWeak(&v32, &location);
    v19 = v15;
    v30 = v19;
    v20 = v16;
    v31 = v20;
    objc_msgSend(v17, "setInvalidationHandler:", v28);
    if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "_xpcConnection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_non_launching();

    }
    PKLogFacilityTypeGetObject(4uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = *(_QWORD *)(a1 + 24);
      v24 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v43 = v23;
      v44 = 2048;
      v45 = a1;
      v46 = 2048;
      v47 = v24;
      _os_log_impl(&dword_18FC92000, v22, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection created and resumed.", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "resume");
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 48), "remoteObjectProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "serviceSuspended");
    }
    else
    {
      if (!a2)
      {
LABEL_13:
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
        objc_msgSend(WeakRetained, "remoteService:didEstablishConnection:", a1, *(_QWORD *)(a1 + 48));

        objc_destroyWeak(&v32);
        objc_destroyWeak(&v37);

        objc_destroyWeak(&v40);
        objc_destroyWeak(&location);

        return;
      }
      objc_msgSend(*(id *)(a1 + 48), "remoteObjectProxy");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "serviceResumed");
    }

    goto LABEL_13;
  }
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 serviceResumedNotificationName:(id)a7
{
  return -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:options:](self, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:options:", a3, a4, a5, a6, a7, 0);
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (PKXPCService)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6
{
  return -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:](self, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:serviceResumedNotificationName:", a3, a4, a5, a6, CFSTR("com.apple.passd.listener.resumed"));
}

- (void)setForceConnectionOnResume:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_forceConnectionOnResume = a3;
  os_unfair_lock_unlock(p_lock);
}

+ (void)setForegroundActiveArbiter:(id)a3
{
  objc_storeStrong((id *)&ForegroundActiveArbiter, a3);
}

void __44__PKXPCService__createConnectionIfPossible___block_invoke(uint64_t a1, int a2)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 10);
    if (*(_QWORD *)&v5[12]._os_unfair_lock_opaque == *(_QWORD *)(a1 + 32))
    {
      v6 = *(void **)&v5[16]._os_unfair_lock_opaque;
      if (v6)
      {
        PKXPCForwarderInvalidate(v6);
        v7 = *(void **)&v5[16]._os_unfair_lock_opaque;
        *(_QWORD *)&v5[16]._os_unfair_lock_opaque = 0;

      }
      if (a2)
      {
        v8 = *(id *)(a1 + 32);
        v9 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __44__PKXPCService__createConnectionIfPossible___block_invoke_2;
        v14[3] = &unk_1E2ABE120;
        v15 = v8;
        v10 = v8;
        objc_msgSend(v9, "addBarrierBlock:", v14);

        v11 = *(void **)&v5[12]._os_unfair_lock_opaque;
        *(_QWORD *)&v5[12]._os_unfair_lock_opaque = 0;

        v12 = objc_loadWeakRetained((id *)&v5[28]);
        objc_msgSend(v12, "remoteService:didInterruptConnection:", v5, *(_QWORD *)(a1 + 32));

      }
      else
      {
        v13 = *(void **)&v5[12]._os_unfair_lock_opaque;
        *(_QWORD *)&v5[12]._os_unfair_lock_opaque = 0;

      }
    }
    os_unfair_lock_unlock(v5 + 10);
  }

}

- (void)dealloc
{
  PKInvalidatable *serviceResumedListenerInvalidater;
  PKInvalidatable *v4;
  void *v5;
  void *v6;
  NSObject *foregroundListener;
  NSObject *backgroundListener;
  NSXPCConnection *connection;
  NSObject *v10;
  NSString *className;
  PKXPCForwarder *currentExportedProxy;
  PKXPCForwarder *v13;
  NSXPCConnection *v14;
  NSXPCConnection *v15;
  NSXPCConnection *v16;
  NSXPCConnection *v17;
  objc_super v18;
  _BYTE buf[24];
  NSXPCConnection *v20;
  NSXPCConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PKForegroundActiveArbiter unregisterObserver:](self->_foregroundActiveArbiter, "unregisterObserver:", self);
  serviceResumedListenerInvalidater = self->_serviceResumedListenerInvalidater;
  if (serviceResumedListenerInvalidater)
  {
    -[PKInvalidatable invalidate](serviceResumedListenerInvalidater, "invalidate");
    v4 = self->_serviceResumedListenerInvalidater;
    self->_serviceResumedListenerInvalidater = 0;

  }
  if (self->_foregroundListener || self->_backgroundListener)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (self->_foregroundListener)
    {
      objc_msgSend(v5, "removeObserver:");
      foregroundListener = self->_foregroundListener;
      self->_foregroundListener = 0;

    }
    if (self->_backgroundListener)
    {
      objc_msgSend(v6, "removeObserver:");
      backgroundListener = self->_backgroundListener;
      self->_backgroundListener = 0;

    }
  }
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      className = self->_className;
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = className;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      v20 = connection;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): Tearing down existing connection", buf, 0x20u);
    }

    currentExportedProxy = self->_currentExportedProxy;
    if (currentExportedProxy)
    {
      PKXPCForwarderInvalidate(currentExportedProxy);
      v13 = self->_currentExportedProxy;
      self->_currentExportedProxy = 0;

    }
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
    v14 = self->_connection;
    v15 = self->_connection;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __47__PKXPCService__invalidateConnectionIfPossible__block_invoke;
    v20 = (NSXPCConnection *)&unk_1E2ABE120;
    v21 = v14;
    v16 = v14;
    -[NSXPCConnection addBarrierBlock:](v15, "addBarrierBlock:", buf);
    v17 = self->_connection;
    self->_connection = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  v18.receiver = self;
  v18.super_class = (Class)PKXPCService;
  -[PKXPCService dealloc](&v18, sel_dealloc);
}

- (id)remoteObjectProxyWithFailureHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__PKXPCService_remoteObjectProxyWithFailureHandler___block_invoke;
    v8[3] = &unk_1E2ABD9C8;
    v9 = v4;
    -[PKXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKXPCService remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __50__PKXPCService__newWrappedErrorHandlerForHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PKLogFacilityTypeGetObject(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v3;
    _os_log_error_impl(&dword_18FC92000, v4, OS_LOG_TYPE_ERROR, "%{public}@ XPC Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (PKXPCService)init
{
  void *v3;
  PKXPCService *v4;

  PDXPCServiceInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKXPCService initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:](self, "initWithMachServiceName:remoteObjectInterface:exportedObjectInterface:exportedObject:", 0, v3, 0, 0);

  return v4;
}

- (id)remoteObjectProxy
{
  return -[PKXPCService remoteObjectProxyWithFailureHandler:](self, "remoteObjectProxyWithFailureHandler:", 0);
}

uint64_t __52__PKXPCService_remoteObjectProxyWithFailureHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)existingRemoteObjectProxy
{
  return -[PKXPCService existingRemoteObjectProxyWithErrorHandler:](self, "existingRemoteObjectProxyWithErrorHandler:", 0);
}

- (id)existingRemoteObjectProxyWithErrorHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSXPCConnection *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  v7 = (void (**)(_QWORD, _QWORD))-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, v5);

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v6, "remoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && !v8)
    v7[2](v7, 0);

  return v8;
}

- (id)existingSynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSXPCConnection *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = self->_connection;
  os_unfair_lock_unlock(p_lock);
  v7 = (void *)-[PKXPCService _newWrappedErrorHandlerForHandler:]((uint64_t)self, v5);

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v6, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection interrupted", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __44__PKXPCService__createConnectionIfPossible___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(4uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v3;
    v9 = 2048;
    v10 = WeakRetained;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p (%p): connection invalidated", (uint8_t *)&v7, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_sendResumed
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(_BYTE *)(a1 + 72))
    {
      *(_BYTE *)(a1 + 72) = 0;
      if (*(_BYTE *)(a1 + 73))
        -[PKXPCService _createConnectionIfPossible:](a1, 0);
      v3 = *(void **)(a1 + 48);
      if (v3)
      {
        objc_msgSend(v3, "remoteObjectProxy");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceResumed");

      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "remoteServiceDidResume:", a1);

    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)_sendSuspended
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (!*(_BYTE *)(a1 + 72))
    {
      *(_BYTE *)(a1 + 72) = 1;
      v3 = *(void **)(a1 + 48);
      if (v3)
      {
        objc_msgSend(v3, "remoteObjectProxy");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "serviceSuspended");

      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "remoteServiceDidSuspend:", a1);

    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  if (a4.var0)
    -[PKXPCService _sendResumed]((uint64_t)self);
  else
    -[PKXPCService _sendSuspended]((uint64_t)self);
}

void __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x19400CFE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    -[PKXPCService _sendResumed]((uint64_t)WeakRetained);

  objc_autoreleasePoolPop(v3);
}

void __61__PKXPCService__registerForApplicationLifeCycleNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x19400CFE8]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    -[PKXPCService _sendSuspended]((uint64_t)WeakRetained);

  objc_autoreleasePoolPop(v3);
}

void __63__PKXPCService__registerForServiceListenerResumedNotifications__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = WeakRetained[3];
      v4 = 138543618;
      v5 = v3;
      v6 = 2048;
      v7 = WeakRetained;
      _os_log_impl(&dword_18FC92000, v2, OS_LOG_TYPE_INFO, "%{public}@:%p: listener resumed notification received", (uint8_t *)&v4, 0x16u);
    }

    -[PKXPCService _establishServiceConnection]((uint64_t)WeakRetained);
  }

}

- (PKXPCServiceDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PKXPCServiceDelegate *)WeakRetained;
}

- (BOOL)isSuspended
{
  PKXPCService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_suspendCallbacks;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)connectionEstablished
{
  PKXPCService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_connection != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)forceConnectionOnResume
{
  PKXPCService *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_forceConnectionOnResume;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (unint64_t)options
{
  return self->_options;
}

@end
