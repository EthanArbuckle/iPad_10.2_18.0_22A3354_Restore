@implementation SBSSystemNotesPresentationClientToServerProxy

- (void)invalidate
{
  BSServiceConnection *connection;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

}

- (void)activateConfiguration:(id)a3
{
  id v5;
  SBSSystemNotesPresentationConfiguration *requestedConfiguration;
  _QWORD v7[5];

  objc_storeStrong((id *)&self->_requestedConfiguration, a3);
  v5 = a3;
  requestedConfiguration = self->_requestedConfiguration;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke;
  v7[3] = &unk_1E288D3A8;
  v7[4] = self;
  -[SBSSystemNotesPresentationConfiguration prepareForXPCCall:](requestedConfiguration, "prepareForXPCCall:", v7);

}

void __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *WeakRetained;

  v3 = a2;
  if (v3)
  {
    SBLogSystemNotes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke_cold_1(a1, (uint64_t)v3, v4);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(WeakRetained, "configuration:didInvalidateWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_setupAndActivateConnection");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteTarget");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activateConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }

}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationClientToServerProxy.m"), 49, CFSTR("deprecated method that should be called via SBSSystemNotesPresentationRequest"));

}

- (void)_setupAndActivateConnection
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *connectionQueue;
  BSServiceConnection *v11;
  BSServiceConnection *connection;
  BSServiceConnection *v13;
  NSObject *v14;
  BSServiceConnection *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  BSServiceConnection *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_requestedConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationClientToServerProxy.m"), 55, CFSTR("expected to have a _requestedConfiguration by activation"));

  }
  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationClientToServerProxy.m"), 56, CFSTR("_activateConnection called but we already have a connection: %@"), self->_connection);

  }
  if (self->_connectionQueue)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesPresentationClientToServerProxy.m"), 57, CFSTR("_activateConnection called but we already have a connection queue: %@"), self->_connectionQueue);

  }
  v4 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSSystemNotesPresentationServiceInterfaceSpecification identifier](SBSSystemNotesPresentationServiceInterfaceSpecification, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SpringBoardServices.SBSSystemNotesPresentationRequest.connectionQueue", v8);
  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = v9;

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
  v11 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  self->_connection = v11;

  v13 = self->_connection;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke;
  v19[3] = &unk_1E288CF30;
  v19[4] = self;
  -[BSServiceConnection configureConnection:](v13, "configureConnection:", v19);
  SBLogSystemNotes();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_connection;
    *(_DWORD *)buf = 138543362;
    v21 = v15;
    _os_log_impl(&dword_18EB52000, v14, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  -[BSServiceConnection activate](self->_connection, "activate");
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = a2;
  +[SBSSystemNotesPresentationServiceInterfaceSpecification interface](SBSSystemNotesPresentationServiceInterfaceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSSystemNotesPresentationServiceInterfaceSpecification serviceQuality](SBSSystemNotesPresentationServiceInterfaceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(v3, "setInterfaceTarget:", WeakRetained);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_7);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15;
  v7[3] = &unk_1E288CF08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogSystemNotes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  _QWORD *v6;
  id v7;

  v3 = a2;
  SBLogSystemNotes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)WeakRetained + 4);
    objc_msgSend(v7, "configuration:didInvalidateWithError:", v6[3], 0);

  }
}

- (SBSSystemNotesPresentationServerToClientInterface)delegate
{
  return (SBSSystemNotesPresentationServerToClientInterface *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestedConfiguration, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __71__SBSSystemNotesPresentationClientToServerProxy_activateConfiguration___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "Failed to prepare SBSSystemNotesPresentationConfiguration for XPC call. request: %{public}@; error: %{public}@",
    (uint8_t *)&v4,
    0x16u);
}

void __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "Received invalidation for connection: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
