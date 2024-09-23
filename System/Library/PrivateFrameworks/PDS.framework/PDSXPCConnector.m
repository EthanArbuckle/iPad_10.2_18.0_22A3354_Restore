@implementation PDSXPCConnector

- (BOOL)validateConnectionWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[PDSXPCConnector _lockedRemoteObject](self, "_lockedRemoteObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDSXPCConnector connectionError](self, "connectionError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v7);
  if (v8)
    v9 = 1;
  else
    v9 = v6 == 0;
  v10 = !v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  _QWORD v8[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__PDSXPCConnector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_24CFD0410;
  v8[4] = self;
  -[PDSXPCConnector _genericSyncProxyWithErrorHandler:localStorage:remoteBlock:](self, "_genericSyncProxyWithErrorHandler:localStorage:remoteBlock:", v5, &self->_syncRemoteObject, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_genericSyncProxyWithErrorHandler:(id)a3 localStorage:(id *)a4 remoteBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  v10 = *a4;
  if (!*a4)
  {
    v20 = 0;
    -[PDSXPCConnector _genericProxyWithError:remoteBlock:](self, "_genericProxyWithError:remoteBlock:", &v20, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v13 = v12;
    if (v11)
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __78__PDSXPCConnector__genericSyncProxyWithErrorHandler_localStorage_remoteBlock___block_invoke;
      v18[3] = &unk_24CFD04A0;
      v19 = v8;
      objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *a4;
      *a4 = v14;

    }
    else if (v8 && v12)
    {
      (*((void (**)(id, id))v8 + 2))(v8, v12);
    }

    v10 = *a4;
  }
  v16 = v10;

  return v16;
}

- (id)_genericProxyWithError:(id *)a3 remoteBlock:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void (**)(_QWORD))a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[PDSXPCConnector connectionError](self, "connectionError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (a3)
    {
      -[PDSXPCConnector connectionError](self, "connectionError");
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v9)
    {
      v10 = v9;
    }
    else if (a3)
    {
      -[PDSXPCConnector connectionError](self, "connectionError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

- (NSError)connectionError
{
  return self->_connectionError;
}

- (id)_lockedRemoteObject
{
  PDSRemote *remoteObject;
  PDSRemote *v4;
  PDSRemote *v5;
  _QWORD v7[5];

  os_unfair_lock_assert_owner(&self->_lock);
  remoteObject = self->_remoteObject;
  if (!remoteObject)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__PDSXPCConnector__lockedRemoteObject__block_invoke;
    v7[3] = &unk_24CFD0438;
    v7[4] = self;
    -[PDSXPCConnector _lockedPerformConnectWithBlock:](self, "_lockedPerformConnectWithBlock:", v7);
    v4 = (PDSRemote *)objc_claimAutoreleasedReturnValue();
    v5 = self->_remoteObject;
    self->_remoteObject = v4;

    remoteObject = self->_remoteObject;
  }
  return remoteObject;
}

- (PDSXPCConnector)initWithClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PDSXPCConnector *v7;

  v4 = a3;
  +[PDSXPCAdapter defaultInterfaceVendor](PDSXPCAdapter, "defaultInterfaceVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDSXPCAdapter defaultConnectionVendor](PDSXPCAdapter, "defaultConnectionVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PDSXPCConnector initWithClientID:interfaceVendor:connectionVendor:](self, "initWithClientID:interfaceVendor:connectionVendor:", v4, v5, v6);

  return v7;
}

- (PDSXPCConnector)initWithClientID:(id)a3 interfaceVendor:(id)a4 connectionVendor:(id)a5
{
  id v10;
  id v11;
  id v12;
  PDSXPCConnector *v13;
  PDSXPCConnector *v14;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCConnector.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceVendor"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCConnector.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clientID"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSXPCConnector.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connectionVendor"));

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PDSXPCConnector;
  v13 = -[PDSXPCConnector init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_clientID, a3);
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->_interfaceVendor, a4);
    objc_storeStrong((id *)&v14->_connectionVendor, a5);
  }

  return v14;
}

uint64_t __64__PDSXPCConnector_synchronousRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockedRemoteObject");
}

- (id)remoteObjectProxyWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  _QWORD v8[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__PDSXPCConnector_remoteObjectProxyWithError___block_invoke;
  v8[3] = &unk_24CFD0410;
  v8[4] = self;
  -[PDSXPCConnector _genericProxyWithError:remoteBlock:](self, "_genericProxyWithError:remoteBlock:", a3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __46__PDSXPCConnector_remoteObjectProxyWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockedRemoteObject");
}

- (id)synchronousInternalRemoteObjectProxyWithErrorHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  _QWORD v8[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__PDSXPCConnector_synchronousInternalRemoteObjectProxyWithErrorHandler___block_invoke;
  v8[3] = &unk_24CFD0410;
  v8[4] = self;
  -[PDSXPCConnector _genericSyncProxyWithErrorHandler:localStorage:remoteBlock:](self, "_genericSyncProxyWithErrorHandler:localStorage:remoteBlock:", v5, &self->_syncInternalRemoteObject, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __72__PDSXPCConnector_synchronousInternalRemoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockedRemoteInternalObject");
}

- (id)internalRemoteObjectProxyWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  _QWORD v8[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__PDSXPCConnector_internalRemoteObjectProxyWithError___block_invoke;
  v8[3] = &unk_24CFD0410;
  v8[4] = self;
  -[PDSXPCConnector _genericProxyWithError:remoteBlock:](self, "_genericProxyWithError:remoteBlock:", a3, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

uint64_t __54__PDSXPCConnector_internalRemoteObjectProxyWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lockedRemoteInternalObject");
}

uint64_t __38__PDSXPCConnector__lockedRemoteObject__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "connectWithClientID:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), a3);
}

- (id)_lockedRemoteInternalObject
{
  PDSRemoteInternal *internalRemoteObject;
  PDSRemoteInternal *v4;
  PDSRemoteInternal *v5;

  os_unfair_lock_assert_owner(&self->_lock);
  internalRemoteObject = self->_internalRemoteObject;
  if (!internalRemoteObject)
  {
    -[PDSXPCConnector _lockedPerformConnectWithBlock:](self, "_lockedPerformConnectWithBlock:", &__block_literal_global_0);
    v4 = (PDSRemoteInternal *)objc_claimAutoreleasedReturnValue();
    v5 = self->_internalRemoteObject;
    self->_internalRemoteObject = v4;

    internalRemoteObject = self->_internalRemoteObject;
  }
  return internalRemoteObject;
}

uint64_t __46__PDSXPCConnector__lockedRemoteInternalObject__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "connectInternalWithCompletion:");
}

uint64_t __78__PDSXPCConnector__genericSyncProxyWithErrorHandler_localStorage_remoteBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_lockedPerformConnectWithBlock:(id)a3
{
  void (**v4)(id, PDSXPCHandshake *, _QWORD *);
  id v5;
  PDSXPCHandshake *v6;
  void *v7;
  PDSXPCHandshake *v8;
  PDSXPCHandshake *handshakeProxy;
  PDSXPCHandshake *v10;
  PDSXPCHandshake *v11;
  NSObject *v12;
  uint64_t v13;
  PDSXPCHandshake *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, PDSXPCHandshake *, _QWORD *))a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_connectionError)
  {
    v5 = 0;
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy_;
    v28 = __Block_byref_object_dispose_;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v6 = self->_handshakeProxy;
    if (!self->_handshakeProxy)
    {
      -[PDSXPCConnector _lockedXPCConnection](self, "_lockedXPCConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke;
      v17[3] = &unk_24CFD04C8;
      v17[4] = &v24;
      objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
      v8 = (PDSXPCHandshake *)objc_claimAutoreleasedReturnValue();
      handshakeProxy = self->_handshakeProxy;
      self->_handshakeProxy = v8;

      v10 = self->_handshakeProxy;
      if (v25[5])
      {
        v11 = self->_handshakeProxy;
        self->_handshakeProxy = 0;

      }
      pds_defaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v25[5];
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_213471000, v12, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection acquired handshake proxy {selfPointer: %p, XPCError: %@}", buf, 0x16u);
      }

      v6 = v10;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    if (v6)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke_13;
      v16[3] = &unk_24CFD04F0;
      v16[4] = &v18;
      v16[5] = buf;
      v4[2](v4, v6, v16);
    }
    if (v25[5] || v19[5])
    {
      -[PDSXPCConnector setConnectionError:](self, "setConnectionError:");
      v14 = self->_handshakeProxy;
      self->_handshakeProxy = 0;

    }
    v5 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);

  }
  return v5;
}

void __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PDSXPCConnector__lockedPerformConnectWithBlock___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_lockedXPCConnection
{
  PDSXPCConnection *XPCConnection;
  PDSXPCConnection **p_XPCConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  os_unfair_lock_assert_owner(&self->_lock);
  p_XPCConnection = &self->_XPCConnection;
  XPCConnection = self->_XPCConnection;
  if (!XPCConnection)
  {
    -[PDSXPCConnectionVendor connectionForMachService:](self->_connectionVendor, "connectionForMachService:", CFSTR("com.apple.identityservicesd.pds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    +[PDSXPCInterface handShakeInterfaceFromVendor:](PDSXPCInterface, "handShakeInterfaceFromVendor:", self->_interfaceVendor);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__PDSXPCConnector__lockedXPCConnection__block_invoke;
    v11[3] = &unk_24CFD0518;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "setInterruptionHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __39__PDSXPCConnector__lockedXPCConnection__block_invoke_17;
    v9[3] = &unk_24CFD0518;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v5, "setInvalidationHandler:", v9);
    objc_storeStrong((id *)p_XPCConnection, v5);
    objc_msgSend(v5, "resume");
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

    XPCConnection = *p_XPCConnection;
  }
  return XPCConnection;
}

void __39__PDSXPCConnector__lockedXPCConnection__block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pds_defaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = WeakRetained;
      _os_log_impl(&dword_213471000, v2, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection interrupted {selfPointer: %p}", (uint8_t *)&v6, 0xCu);
    }

    if (os_unfair_lock_trylock(WeakRetained + 2))
    {
      v3 = *(void **)&WeakRetained[10]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[10]._os_unfair_lock_opaque = 0;

      v4 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[12]._os_unfair_lock_opaque = 0;

      v5 = *(void **)&WeakRetained[8]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[8]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
  }

}

void __39__PDSXPCConnector__lockedXPCConnection__block_invoke_17(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  os_unfair_lock_s *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pds_defaultLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = WeakRetained;
      _os_log_impl(&dword_213471000, v2, OS_LOG_TYPE_DEFAULT, "PDSXPCConnection interrupted {selfPointer: %p}", (uint8_t *)&v9, 0xCu);
    }

    if (os_unfair_lock_trylock(WeakRetained + 2))
    {
      v3 = *(void **)&WeakRetained[10]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[10]._os_unfair_lock_opaque = 0;

      v4 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[12]._os_unfair_lock_opaque = 0;

      v5 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", PDSXPCErrorDomain, -300, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)&WeakRetained[18]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[18]._os_unfair_lock_opaque = v6;

      v8 = *(void **)&WeakRetained[6]._os_unfair_lock_opaque;
      *(_QWORD *)&WeakRetained[6]._os_unfair_lock_opaque = 0;

      os_unfair_lock_unlock(WeakRetained + 2);
    }
  }

}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_storeStrong((id *)&self->_clientID, a3);
}

- (PDSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)setXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_XPCConnection, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (PDSXPCHandshake)handshakeProxy
{
  return self->_handshakeProxy;
}

- (void)setHandshakeProxy:(id)a3
{
  objc_storeStrong((id *)&self->_handshakeProxy, a3);
}

- (PDSRemote)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (PDSRemote)syncRemoteObject
{
  return self->_syncRemoteObject;
}

- (void)setSyncRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_syncRemoteObject, a3);
}

- (PDSRemoteInternal)internalRemoteObject
{
  return self->_internalRemoteObject;
}

- (void)setInternalRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_internalRemoteObject, a3);
}

- (PDSRemoteInternal)syncInternalRemoteObject
{
  return self->_syncInternalRemoteObject;
}

- (void)setSyncInternalRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_syncInternalRemoteObject, a3);
}

- (void)setConnectionError:(id)a3
{
  objc_storeStrong((id *)&self->_connectionError, a3);
}

- (PDSXPCInterfaceVendor)interfaceVendor
{
  return self->_interfaceVendor;
}

- (void)setInterfaceVendor:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceVendor, a3);
}

- (PDSXPCConnectionVendor)connectionVendor
{
  return self->_connectionVendor;
}

- (void)setConnectionVendor:(id)a3
{
  objc_storeStrong((id *)&self->_connectionVendor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionVendor, 0);
  objc_storeStrong((id *)&self->_interfaceVendor, 0);
  objc_storeStrong((id *)&self->_connectionError, 0);
  objc_storeStrong((id *)&self->_syncInternalRemoteObject, 0);
  objc_storeStrong((id *)&self->_internalRemoteObject, 0);
  objc_storeStrong((id *)&self->_syncRemoteObject, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_handshakeProxy, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
