@implementation SBSUniversalControlService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_46);
  return (id)sharedInstance_service_2;
}

void __44__SBSUniversalControlService_sharedInstance__block_invoke()
{
  _QWORD *v0;
  void *v1;

  v0 = -[SBSUniversalControlService _init]([SBSUniversalControlService alloc]);
  v1 = (void *)sharedInstance_service_2;
  sharedInstance_service_2 = (uint64_t)v0;

}

- (_QWORD)_init
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  id v15;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  if (!a1)
    return 0;
  v24.receiver = a1;
  v24.super_class = (Class)SBSUniversalControlService;
  v1 = objc_msgSendSuper2(&v24, sel_init);
  if (v1)
  {
    objc_initWeak(&location, v1);
    v2 = (void *)MEMORY[0x1E0D01718];
    v3 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__SBSUniversalControlService__init__block_invoke;
    v21[3] = &unk_1E288D8F0;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v2, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("DisableDeviceKeyboardFocus"), v21);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v1[3];
    v1[3] = v4;

    v6 = (void *)v1[3];
    SBLogKeyboardFocus();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLog:", v7);

    v8 = (void *)MEMORY[0x1E0D01718];
    v18[0] = v3;
    v18[1] = 3221225472;
    v18[2] = __35__SBSUniversalControlService__init__block_invoke_2;
    v18[3] = &unk_1E288FD98;
    objc_copyWeak(&v20, &location);
    v1 = v1;
    v19 = v1;
    objc_msgSend(v8, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("ScreenEdgeOwnership"), v18);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v1[4];
    v1[4] = v9;

    v11 = (void *)v1[4];
    SBLogKeyboardFocus();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLog:", v12);

    v13 = dispatch_queue_create("com.apple.springboard.universal-control-client-queue", 0);
    v14 = (void *)v1[2];
    v1[2] = v13;

    objc_copyWeak(&v17, &location);
    v15 = (id)BSLogAddStateCaptureBlockWithTitle();
    -[SBSUniversalControlService _connectToServer]((uint64_t)v1);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v1;
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot +new SBSUniversalControlService -- use +sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("SBSUniversalControlService.m");
    v17 = 1024;
    v18 = 51;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18EB52000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (SBSUniversalControlService)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  SBSUniversalControlService *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  SBSUniversalControlService *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -init SBSUniversalControlService -- use +sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("SBSUniversalControlService.m");
    v17 = 1024;
    v18 = 56;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18EB52000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (SBSUniversalControlService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __35__SBSUniversalControlService__init__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isActive"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKeyboardFocusDisabled:reason:", v6, CFSTR("wants it"));

  }
}

void __35__SBSUniversalControlService__init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    -[SBSUniversalControlService _ownedRectEdgeMaskAsNumber](*(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[5], "remoteTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setScreenEdgesOwned:reason:", v2, CFSTR("wants it"));

  }
}

- (id)_ownedRectEdgeMaskAsNumber
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bs_reduce:block:", &unk_1E28BFE88, &__block_literal_global_28);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __35__SBSUniversalControlService__init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_connectToServer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSUniversalControlInterfaceSpecification identifier](SBSUniversalControlInterfaceSpecification, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endpointForMachName:service:instance:", v3, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v6;

    v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__SBSUniversalControlService__connectToServer__block_invoke;
    v11[3] = &unk_1E288CF30;
    v11[4] = a1;
    objc_msgSend(v8, "configureConnection:", v11);
    SBLogKeyboardFocus();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "activate");
  }
}

- (NSString)description
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  objc_msgSend(v3, "appendProem:block:", self, &__block_literal_global_21_0);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_disableKeyboardFocusAssertion, CFSTR("disableKeyboardFocusAssertion"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_screenEdgeOwnershipAssertion, CFSTR("screenEdgeOwnershipAssertion"));
  objc_msgSend(v3, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)disableKeyboardFocusOnCurrentDeviceForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_disableKeyboardFocusAssertion, "acquireForReason:", a3);
}

- (id)acquireScreenEdgeOwnershipForPointerEvents:(unint64_t)a3 forReason:(id)a4
{
  BSCompoundAssertion *screenEdgeOwnershipAssertion;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  screenEdgeOwnershipAssertion = self->_screenEdgeOwnershipAssertion;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](screenEdgeOwnershipAssertion, "acquireForReason:withContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __56__SBSUniversalControlService__ownedRectEdgeMaskAsNumber__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  int v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  LODWORD(a2) = objc_msgSend(a2, "unsignedIntValue");
  v6 = objc_msgSend(v5, "unsignedIntValue");

  return objc_msgSend(v4, "numberWithUnsignedInt:", v6 | a2);
}

void __46__SBSUniversalControlService__connectToServer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  +[SBSUniversalControlInterfaceSpecification serviceQuality](SBSUniversalControlInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[SBSUniversalControlInterfaceSpecification interface](SBSUniversalControlInterfaceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_33_0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__SBSUniversalControlService__connectToServer__block_invoke_34;
  v6[3] = &unk_1E288ED60;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v6);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_36);

}

void __46__SBSUniversalControlService__connectToServer__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogKeyboardFocus();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __46__SBSUniversalControlService__connectToServer__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogKeyboardFocus();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "activate");
  objc_msgSend(v3, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardFocusDisabled:reason:", v6, CFSTR("wants it"));

  -[SBSUniversalControlService _ownedRectEdgeMaskAsNumber](*(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScreenEdgesOwned:reason:", v7, CFSTR("wants it"));

}

void __46__SBSUniversalControlService__connectToServer__block_invoke_35(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogKeyboardFocus();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)setDisableKeyboardFocusAssertion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (uint64_t)screenEdgeOwnershipAssertion
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (void)setScreenEdgeOwnershipAssertion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (uint64_t)serverConnection
{
  if (result)
    return *(_QWORD *)(result + 40);
  return result;
}

- (void)setServerConnection:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_screenEdgeOwnershipAssertion, 0);
  objc_storeStrong((id *)&self->_disableKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
