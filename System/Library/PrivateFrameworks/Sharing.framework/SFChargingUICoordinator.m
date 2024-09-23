@implementation SFChargingUICoordinator

- (void)activate
{
  NSObject *v3;
  _QWORD block[5];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFChargingUICoordinator_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __35__SFChargingUICoordinator_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  objc_super v8;
  uint8_t buf[16];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  charging_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Activate", buf, 2u);
  }

  if (self->_activateCalled)
  {
    charging_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Coordinator already activated";
LABEL_14:
      _os_log_impl(&dword_1A2830000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_15:

    return;
  }
  if (self->_invalidateCalled)
  {
    charging_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Coordinator activated after invalidate";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  self->_activateCalled = 1;
  if (IsAppleInternalBuild())
  {
    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
    self->_runningAsCarry = objc_msgSend(v5, "isEqual:", CFSTR("walkabout"));

  }
  else
  {
    self->_runningAsCarry = 1;
  }
  v8.receiver = self;
  v8.super_class = (Class)SFChargingUICoordinator;
  -[SFXPCClient onqueue_activate](&v8, sel_onqueue_activate);
}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFChargingUICoordinator_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __37__SFChargingUICoordinator_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  objc_super v7;
  uint8_t buf[16];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  charging_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Invalidate", buf, 2u);
  }

  if (self->_invalidateCalled)
  {
    charging_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Coordinator already invalidated";
LABEL_11:
      _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_12:

    return;
  }
  if (!self->_activateCalled)
  {
    charging_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Coordinator invalidated before activate";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  self->_invalidateCalled = 1;
  v7.receiver = self;
  v7.super_class = (Class)SFChargingUICoordinator;
  -[SFXPCClient onqueue_invalidate](&v7, sel_onqueue_invalidate);
}

- (void)requestToShowUIWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;

  v4 = a3;
  charging_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SFChargingUICoordinator requestToShowUIWithHandler:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SFChargingUICoordinator_requestToShowUIWithHandler___block_invoke;
  block[3] = &unk_1E482DCC0;
  v16 = v4;
  v14 = v4;
  dispatch_async(v13, block);

}

uint64_t __54__SFChargingUICoordinator_requestToShowUIWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestToStartAnimationAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SFChargingUICoordinator_requestToStartAnimationAtDate___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__SFChargingUICoordinator_requestToStartAnimationAtDate___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 34) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_requestToStartAnimationAtDate:", *(_QWORD *)(a1 + 40));
}

- (void)_requestToStartAnimationAtDate:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  charging_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to start animation at %@", buf, 0xCu);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SFChargingUICoordinator__requestToStartAnimationAtDate___block_invoke;
  v8[3] = &unk_1E482DFA0;
  v9 = v4;
  v7 = v4;
  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", v8);

}

uint64_t __58__SFChargingUICoordinator__requestToStartAnimationAtDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendAnimationDate:", *(_QWORD *)(a1 + 32));
}

- (void)requestToDismissUIHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34))
  {
    charging_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", 1.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_requestToStartAnimationAtDate:", v12);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_requestToDismissUIHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id uiUpdateHandler;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  v4 = a3;
  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->_uiUpdateHandler)
  {
    charging_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SFChargingUICoordinator _requestToDismissUIHandler:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    v6 = _Block_copy(v4);
    uiUpdateHandler = self->_uiUpdateHandler;
    self->_uiUpdateHandler = v6;

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke;
    v16[3] = &unk_1E482DFA0;
    v16[4] = self;
    -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", v16);
    -[SFChargingUICoordinator _timingRestartMinTimer](self, "_timingRestartMinTimer");
  }

}

uint64_t __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke_2;
  v3[3] = &unk_1E482DFF0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "triggerChargingUIWithDismissHandler:", v3);
}

void __54__SFChargingUICoordinator__requestToDismissUIHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  charging_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Ready to dismiss UI (error: %@)", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_dismissUI");

}

- (void)sendDismissUIWithReason:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SFChargingUICoordinator_sendDismissUIWithReason___block_invoke;
  v6[3] = &unk_1E482E018;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

uint64_t __51__SFChargingUICoordinator_sendDismissUIWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendDismissUIWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_sendDismissUIWithReason:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  charging_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Sending dismiss UI", buf, 2u);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__SFChargingUICoordinator__sendDismissUIWithReason___block_invoke;
  v7[3] = &__block_descriptor_40_e8_v16__0_8l;
  v7[4] = a3;
  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", v7);
}

uint64_t __52__SFChargingUICoordinator__sendDismissUIWithReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sendDismissUIWithReason:", *(_QWORD *)(a1 + 32));
}

- (void)_dismissUI
{
  NSObject *v3;
  NSObject *v4;
  id uiUpdateHandler;
  uint8_t v6[16];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_uiUpdateHandler && self->_uiUpdateMinTimeElapsed && self->_uiUpdateShouldDismiss)
  {
    charging_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "Asking client to dismiss UI", v6, 2u);
    }

    self->_uiUpdateMinTimeElapsed = 0;
    self->_uiUpdateShouldDismiss = 0;
    (*((void (**)(void))self->_uiUpdateHandler + 2))();
    uiUpdateHandler = self->_uiUpdateHandler;
    self->_uiUpdateHandler = 0;

    -[SFChargingUICoordinator _timingInvalidateMinTimer](self, "_timingInvalidateMinTimer");
  }
}

- (void)initialViewControllerDidAppear
{
  NSObject *v3;
  _QWORD block[5];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SFChargingUICoordinator_initialViewControllerDidAppear__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __57__SFChargingUICoordinator_initialViewControllerDidAppear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initialViewControllerDidAppear");
}

- (void)_initialViewControllerDidAppear
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  charging_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial view controller did appear", v5, 2u);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", &__block_literal_global_5);
}

uint64_t __58__SFChargingUICoordinator__initialViewControllerDidAppear__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "initialViewControllerDidAppear");
}

- (void)initialViewControllerDidDisappear
{
  NSObject *v3;
  _QWORD block[5];

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SFChargingUICoordinator_initialViewControllerDidDisappear__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__SFChargingUICoordinator_initialViewControllerDidDisappear__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initialViewControllerDidDisappear");
}

- (void)_initialViewControllerDidDisappear
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  charging_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Sending initial view controller did disappear", v5, 2u);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", &__block_literal_global_90);
}

uint64_t __61__SFChargingUICoordinator__initialViewControllerDidDisappear__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "initialViewControllerDidDisappear");
}

- (void)requestAnimationDateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  charging_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting animation date", buf, 2u);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SFChargingUICoordinator_requestAnimationDateWithCompletion___block_invoke;
  v8[3] = &unk_1E482E0A0;
  v9 = v4;
  v7 = v4;
  -[SFXPCClient onqueue_getRemoteObjectProxyOnQueue:](self, "onqueue_getRemoteObjectProxyOnQueue:", v8);

}

uint64_t __62__SFChargingUICoordinator_requestAnimationDateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requestAnimationDateWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)_timingRestartMinTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *uiUpdateTimer;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[8];

  charging_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Restarting UI minimum timer", buf, 2u);
  }

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!self->_uiUpdateTimer)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[SFXPCClient dispatchQueue](self, "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
    uiUpdateTimer = self->_uiUpdateTimer;
    self->_uiUpdateTimer = v6;

    v8 = self->_uiUpdateTimer;
    v9 = dispatch_time(0, 2147483647000000000);
    dispatch_source_set_timer(v8, v9, 0x1DCD64FFC4653600uLL, 0);
    v10 = self->_uiUpdateTimer;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__SFChargingUICoordinator__timingRestartMinTimer__block_invoke;
    v12[3] = &unk_1E482DC20;
    v12[4] = self;
    objc_copyWeak(&v13, (id *)buf);
    dispatch_source_set_event_handler(v10, v12);
    dispatch_resume((dispatch_object_t)self->_uiUpdateTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  v11 = dispatch_time(0, 1500000000);
  dispatch_source_set_timer((dispatch_source_t)self->_uiUpdateTimer, v11, 0x1DCD64FFC4653600uLL, 0);
}

void __49__SFChargingUICoordinator__timingRestartMinTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  charging_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Minimum timer complete", v4, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_dismissUI");

}

- (void)_timingInvalidateMinTimer
{
  NSObject *v3;
  NSObject *uiUpdateTimer;
  OS_dispatch_source *v5;

  -[SFXPCClient dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  uiUpdateTimer = self->_uiUpdateTimer;
  if (uiUpdateTimer)
  {
    dispatch_source_cancel(uiUpdateTimer);
    v5 = self->_uiUpdateTimer;
    self->_uiUpdateTimer = 0;

  }
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharingd.paireddevice");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB7A8);
}

- (id)remoteObjectInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB808);
}

- (BOOL)shouldEscapeXpcTryCatch
{
  return 1;
}

- (void)onqueue_connectionEstablished
{
  NSObject *v2;
  uint8_t v3[16];

  charging_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection established", v3, 2u);
  }

}

- (void)onqueue_connectionInterrupted
{
  NSObject *v2;
  uint8_t v3[16];

  charging_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection interrupted", v3, 2u);
  }

}

- (void)onqueue_connectionInvalidated
{
  NSObject *v2;
  uint8_t v3[16];

  charging_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Charging UI coordinator connection invalidated", v3, 2u);
  }

}

- (int64_t)defaultDuration
{
  return self->_defaultDuration;
}

- (void)setDefaultDuration:(int64_t)a3
{
  self->_defaultDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiUpdateTimer, 0);
  objc_storeStrong(&self->_uiUpdateHandler, 0);
  objc_storeStrong((id *)&self->_uiUpdateRequestDate, 0);
  objc_storeStrong((id *)&self->_uiUpdateMaxDate, 0);
}

- (void)requestToShowUIWithHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "requestToShowUIWithHandler not supported", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __53__SFChargingUICoordinator_requestToDismissUIHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "requestToDismissUIHandler calling requestToStartAnimationAtDate instead, calling handler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_requestToDismissUIHandler:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Request to dismiss UI in progress", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

@end
