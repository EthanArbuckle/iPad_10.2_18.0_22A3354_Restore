@implementation SFDiagnostics

- (SFDiagnostics)init
{
  SFDiagnostics *v2;
  SFDiagnostics *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDiagnostics;
  v2 = -[SFDiagnostics init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  id interruptionHandler;
  id invalidationHandler;
  SFDiagnostics *v6;
  SEL v7;
  objc_super v8;

  if (self->_xpcCnx)
  {
    v6 = (SFDiagnostics *)FatalErrorF();
    -[SFDiagnostics invalidate](v6, v7);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v8.receiver = self;
    v8.super_class = (Class)SFDiagnostics;
    -[SFDiagnostics dealloc](&v8, sel_dealloc);
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SFDiagnostics_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFDiagnostics_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFDiagnostics <= 30
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    else
    {
      -[SFDiagnostics _invalidated](self, "_invalidated");
    }
  }
}

- (void)bluetoothUserInteraction
{
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/bluetoothUserInteraction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFDiagnostics_bluetoothUserInteraction__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  os_activity_scope_leave(&state);

}

void __41__SFDiagnostics_bluetoothUserInteraction__block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bluetoothUserInteraction");

}

- (void)diagnosticBLEModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticBLEModeWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnosticBLEModeWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __49__SFDiagnostics_diagnosticBLEModeWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)diagnosticControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticControl", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFDiagnostics_diagnosticControl_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __46__SFDiagnostics_diagnosticControl_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SFDiagnostics_diagnosticControl_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticControl:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __46__SFDiagnostics_diagnosticControl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)diagnosticMock:(id)a3 device:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticMock", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "diagnosticMock:device:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __50__SFDiagnostics_diagnosticMock_device_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)diagnosticMockStart:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticMockStart", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SFDiagnostics_diagnosticMockStart___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __37__SFDiagnostics_diagnosticMockStart___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__SFDiagnostics_diagnosticMockStart___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnosticMockStart:", *(_QWORD *)(a1 + 40));

}

uint64_t __37__SFDiagnostics_diagnosticMockStart___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)diagnosticMockStop:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticMockStop", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SFDiagnostics_diagnosticMockStop___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFDiagnostics_diagnosticMockStop___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SFDiagnostics_diagnosticMockStop___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diagnosticMockStop:", *(_QWORD *)(a1 + 40));

}

uint64_t __36__SFDiagnostics_diagnosticMockStop___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)logControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFDiagnostics_logControl_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __39__SFDiagnostics_logControl_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logControl:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_logControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticLogControl", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SFDiagnostics _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__SFDiagnostics__logControl_completion___block_invoke;
  v16[3] = &unk_1E482E490;
  v11 = v7;
  v17 = v11;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __40__SFDiagnostics__logControl_completion___block_invoke_2;
  v14[3] = &unk_1E4833900;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "diagnosticLogControl:completion:", v6, v14);

  os_activity_scope_leave(&state);
}

void __40__SFDiagnostics__logControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __40__SFDiagnostics__logControl_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      NSPrintF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    v4 = v7;
  }

}

- (void)show:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFDiagnostics_show_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __33__SFDiagnostics_show_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_show:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_show:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticShow", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SFDiagnostics _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __34__SFDiagnostics__show_completion___block_invoke;
  v16[3] = &unk_1E482E490;
  v11 = v7;
  v17 = v11;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __34__SFDiagnostics__show_completion___block_invoke_2;
  v14[3] = &unk_1E4833900;
  v13 = v11;
  v15 = v13;
  objc_msgSend(v12, "diagnosticShow:completion:", v6, v14);

  os_activity_scope_leave(&state);
}

void __34__SFDiagnostics__show_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __34__SFDiagnostics__show_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      NSPrintF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    v4 = v7;
  }

}

- (void)unlockTestClientWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticUnlockTestClientWithDevice", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SFDiagnostics_unlockTestClientWithDevice___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFDiagnostics_unlockTestClientWithDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticUnlockTestClientWithDevice:", *(_QWORD *)(a1 + 40));

}

- (void)unlockTestServer
{
  NSObject *v3;
  NSObject *dispatchQueue;
  _QWORD block[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/diagnosticUnlockTestServer", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFDiagnostics_unlockTestServer__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  os_activity_scope_leave(&state);

}

void __33__SFDiagnostics_unlockTestServer__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticUnlockTestServer");

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __34__SFDiagnostics__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __34__SFDiagnostics__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E482DF78;
    v7[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBF28);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFDiagnostics <= 10
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __34__SFDiagnostics__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __34__SFDiagnostics__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);
  NSObject *v4;
  void *v5;
  os_activity_scope_state_s v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDiagnostics <= 50 && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    LogPrintF();
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  if (self->_btUser)
  {
    v4 = _os_activity_create(&dword_1A2830000, "Sharing/SFDiagnostics/bluetoothUserInteraction", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bluetoothUserInteraction");

    os_activity_scope_leave(&v6);
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDiagnostics <= 50
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFDiagnostics <= 10
      && (gLogCategory_SFDiagnostics != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
