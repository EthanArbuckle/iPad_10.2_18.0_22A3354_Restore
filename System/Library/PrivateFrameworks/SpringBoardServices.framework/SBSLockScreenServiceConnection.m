@implementation SBSLockScreenServiceConnection

- (SBSLockScreenServiceConnection)init
{
  SBSLockScreenServiceConnection *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BSServiceConnection *connection;
  BSServiceConnection *v9;
  _QWORD v11[4];
  SBSLockScreenServiceConnection *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSLockScreenServiceConnection;
  v2 = -[SBSLockScreenServiceConnection init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSLockScreenServiceSpecification identifier](SBSLockScreenServiceSpecification, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      connection = v2->_connection;
      v2->_connection = (BSServiceConnection *)v7;

      v9 = v2->_connection;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __38__SBSLockScreenServiceConnection_init__block_invoke;
      v11[3] = &unk_1E288CF30;
      v12 = v2;
      -[BSServiceConnection configureConnection:](v9, "configureConnection:", v11);
      -[BSServiceConnection activate](v2->_connection, "activate");

    }
  }
  return v2;
}

void __38__SBSLockScreenServiceConnection_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  +[SBSLockScreenServiceSpecification interface](SBSLockScreenServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __38__SBSLockScreenServiceConnection_init__block_invoke_2;
  v9 = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", &v6);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_4, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __38__SBSLockScreenServiceConnection_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_INFO, "SBSLockScreenService: interrupted - resyncing state", v11, 2u);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    objc_msgSend(v3, "activate");
    objc_msgSend(v3, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)&v6[6]._os_unfair_lock_opaque, "count") != 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreventPasscodeLock:", v8);

    objc_msgSend(v3, "remoteTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)&v6[8]._os_unfair_lock_opaque, "count") != 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreventSpuriousScreenUndim:", v10);

    os_unfair_lock_unlock(v6 + 4);
  }

}

void __38__SBSLockScreenServiceConnection_init__block_invoke_5()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18EB52000, v0, OS_LOG_TYPE_INFO, "SBSLockScreenService: invalidated remotely", v1, 2u);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSLockScreenServiceConnection;
  -[SBSLockScreenServiceConnection dealloc](&v3, sel_dealloc);
}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[4];
  NSObject *v9;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke;
    v8[3] = &unk_1E288D2C0;
    v9 = v4;
    objc_msgSend(v5, "launchEmergencyDialerWithCompletion:", v8);
    v6 = v9;
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBSLockScreenServiceConnection launchEmergencyDialerWithCompletion:].cold.1();

  if (v4)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v4);
    goto LABEL_7;
  }
LABEL_8:

}

void __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke_cold_1();

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, v5);

  }
}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke;
    v14[3] = &unk_1E288D2C0;
    v9 = &v15;
    v15 = v7;
    objc_msgSend(v8, "requestPasscodeUnlockUIWithOptions:withCompletion:", v6, v14);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBSLockScreenServiceConnection requestPasscodeUnlockUIWithOptions:withCompletion:].cold.1();

  if (v7)
  {
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_12;
    v12[3] = &unk_1E288D310;
    v9 = &v13;
    v13 = v7;
    dispatch_async(v11, v12);

    goto LABEL_7;
  }
LABEL_8:

}

void __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_cold_1();

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_10;
    v7[3] = &unk_1E288D2E8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke;
    v14[3] = &unk_1E288D2C0;
    v9 = &v15;
    v15 = v7;
    objc_msgSend(v8, "requestPasscodeCheckUIWithOptions:withCompletion:", v6, v14);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBSLockScreenServiceConnection requestPasscodeCheckUIWithOptions:withCompletion:].cold.1();

  if (v7)
  {
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_14;
    v12[3] = &unk_1E288D310;
    v9 = &v13;
    v13 = v7;
    dispatch_async(v11, v12);

    goto LABEL_7;
  }
LABEL_8:

}

void __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_cold_1();

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_13;
    v7[3] = &unk_1E288D2E8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)preventPasscodeLockWithReason:(id)a3
{
  id v5;
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSCountedSet *lock_preventPasscodeLockReasons;
  void *v11;
  void *v12;
  NSCountedSet *v13;
  NSCountedSet *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __64__SBSLockScreenServiceConnection_preventPasscodeLockWithReason___block_invoke;
  v19[3] = &unk_1E288D338;
  v19[4] = self;
  v19[5] = a2;
  v7 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springboard.lockscreen.preventPasscodeLock"), v5, v19);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  lock_preventPasscodeLockReasons = self->_lock_preventPasscodeLockReasons;
  if (lock_preventPasscodeLockReasons)
  {
    objc_msgSend(v7, "reason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](lock_preventPasscodeLockReasons, "addObject:", v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3550];
    objc_msgSend(v7, "reason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v11);
    v13 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v14 = self->_lock_preventPasscodeLockReasons;
    self->_lock_preventPasscodeLockReasons = v13;

  }
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "reason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_18EB52000, v15, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: creating new preventPasscodeLock assertion (%@)", buf, 0xCu);

  }
  objc_msgSend(v9, "setPreventPasscodeLock:", MEMORY[0x1E0C9AAB0]);
  os_unfair_lock_unlock(p_lock);

  return v7;
}

void __64__SBSLockScreenServiceConnection_preventPasscodeLockWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBSLockScreenService.m"), 133, CFSTR("invalid internal state : assertion isn't appropriately tracked : %@"), v3);

  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v3, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: preventPasscodeLock assertion invalidated (%@)", buf, 0xCu);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 24);
    *(_QWORD *)(v11 + 24) = 0;

    objc_msgSend(v4, "setPreventPasscodeLock:", MEMORY[0x1E0C9AAA0]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

- (id)preventSpuriousScreenUndimWithReason:(id)a3
{
  id v5;
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  NSCountedSet *lock_preventSpuriousScreenUndimReasons;
  void *v11;
  void *v12;
  NSCountedSet *v13;
  NSCountedSet *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSLockScreenService.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __71__SBSLockScreenServiceConnection_preventSpuriousScreenUndimWithReason___block_invoke;
  v19[3] = &unk_1E288D338;
  v19[4] = self;
  v19[5] = a2;
  v7 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("com.apple.springboard.lockscreen.preventSpuriousScreenUndim"), v5, v19);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  lock_preventSpuriousScreenUndimReasons = self->_lock_preventSpuriousScreenUndimReasons;
  if (lock_preventSpuriousScreenUndimReasons)
  {
    objc_msgSend(v7, "reason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](lock_preventSpuriousScreenUndimReasons, "addObject:", v11);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3550];
    objc_msgSend(v7, "reason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v11);
    v13 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    v14 = self->_lock_preventSpuriousScreenUndimReasons;
    self->_lock_preventSpuriousScreenUndimReasons = v13;

  }
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "reason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v16;
    _os_log_impl(&dword_18EB52000, v15, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: creating new preventSpuriousScreenUndim assertion (%@)", buf, 0xCu);

  }
  objc_msgSend(v9, "setPreventSpuriousScreenUndim:", MEMORY[0x1E0C9AAB0]);
  os_unfair_lock_unlock(p_lock);

  return v7;
}

void __71__SBSLockScreenServiceConnection_preventSpuriousScreenUndimWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBSLockScreenService.m"), 163, CFSTR("invalid internal state : assertion isn't appropriately tracked : %@"), v3);

  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "reason");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v10;
    _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_DEFAULT, "SBSLockScreenService: preventSpuriousScreenUndim assertion invalidated (%@)", buf, 0xCu);

  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = 0;

    objc_msgSend(v4, "setPreventSpuriousScreenUndim:", MEMORY[0x1E0C9AAA0]);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)lockDeviceAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v6 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke;
    v13[3] = &unk_1E288D2C0;
    v9 = &v14;
    v14 = v6;
    objc_msgSend(v7, "lockDeviceAnimated:withCompletion:", v8, v13);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[SBSLockScreenServiceConnection lockDeviceAnimated:withCompletion:].cold.1();

  if (v6)
  {
    dispatch_get_global_queue(25, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_31;
    v11[3] = &unk_1E288D310;
    v9 = &v12;
    v12 = v6;
    dispatch_async(v8, v11);
    goto LABEL_7;
  }
LABEL_8:

}

void __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_cold_1();

  }
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_30;
    v7[3] = &unk_1E288D2E8;
    v9 = v5;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

uint64_t __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_preventSpuriousScreenUndimReasons, 0);
  objc_storeStrong((id *)&self->_lock_preventPasscodeLockReasons, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)launchEmergencyDialerWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSLockScreenService: failed request to launch emergency dialer (no remoteTarget)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __70__SBSLockScreenServiceConnection_launchEmergencyDialerWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18EB52000, v0, v1, "SBSLockScreenService: error from request to launch emergency dialer : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPasscodeUnlockUIWithOptions:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSLockScreenService: failed request for unlock (no remoteTarget)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__SBSLockScreenServiceConnection_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18EB52000, v0, v1, "SBSLockScreenService: error from request for unlock : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPasscodeCheckUIWithOptions:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSLockScreenService: failed request for check (no remoteTarget)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__SBSLockScreenServiceConnection_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18EB52000, v0, v1, "SBSLockScreenService: error from request for check : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)lockDeviceAnimated:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSLockScreenService: failed request for lock (no remoteTarget)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__SBSLockScreenServiceConnection_lockDeviceAnimated_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18EB52000, v0, v1, "SBSLockScreenService: error from request for lock : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
