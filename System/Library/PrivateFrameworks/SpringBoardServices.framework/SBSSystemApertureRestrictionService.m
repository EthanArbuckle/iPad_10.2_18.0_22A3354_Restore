@implementation SBSSystemApertureRestrictionService

- (SBSSystemApertureRestrictionService)init
{
  SBSSystemApertureRestrictionService *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *connectionQueue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BSServiceConnection *connection;
  BSServiceConnection *v16;
  void *v18;
  _QWORD v19[4];
  SBSSystemApertureRestrictionService *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBSSystemApertureRestrictionService;
  v3 = -[SBSSystemApertureRestrictionService init](&v21, sel_init);
  if (v3)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard"));

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SBSSystemApertureRestrictionService.m"), 41, CFSTR("Within SpringBoard, use SBSystemApertureController API directly."));

    }
    v3->_isValid = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v8;

    v10 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSystemApertureRestrictionServiceSpecification identifier](SBSSystemApertureRestrictionServiceSpecification, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endpointForMachName:service:instance:", v11, v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v14;

    v16 = v3->_connection;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __43__SBSSystemApertureRestrictionService_init__block_invoke;
    v19[3] = &unk_1E288CF30;
    v20 = v3;
    -[BSServiceConnection configureConnection:](v16, "configureConnection:", v19);
    -[BSServiceConnection activate](v3->_connection, "activate");

  }
  return v3;
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSSystemApertureRestrictionServiceSpecification interface](SBSSystemApertureRestrictionServiceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  +[SBSSystemApertureRestrictionServiceSpecification serviceQuality](SBSSystemApertureRestrictionServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_9);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_12);

}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SBLogSystemApertureHosting();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __43__SBSSystemApertureRestrictionService_init__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  SBLogSystemApertureHosting();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __43__SBSSystemApertureRestrictionService_init__block_invoke_11_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(v2, "activate");
}

- (void)invalidate
{
  BSServiceConnection *connection;
  id WeakRetained;
  id v5;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_restrictToInertAssertion);
  objc_msgSend(WeakRetained, "invalidate");

  v5 = objc_loadWeakRetained((id *)&self->_completeSuppressionAssertion);
  objc_msgSend(v5, "invalidate");

  self->_isValid = 0;
}

- (id)acquireRestrictSystemApertureLayoutToInertAssertionWithReason:(id)a3
{
  id v5;
  BSInvalidatable **p_restrictToInertAssertion;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureRestrictionService.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  if (!self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureRestrictionService.m"), 79, CFSTR("Attempted to use restriction service after invalidation."));

  }
  p_restrictToInertAssertion = &self->_restrictToInertAssertion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_restrictToInertAssertion);
  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireRestrictSystemApertureLayoutToInertAssertionIdentifierWithReason:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0D01868]);
      objc_msgSend(v9, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke;
      v15[3] = &unk_1E288D440;
      objc_copyWeak(&v16, &location);
      WeakRetained = (id)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v11, v5, v15);

      objc_storeWeak((id *)p_restrictToInertAssertion, WeakRetained);
      objc_destroyWeak(&v16);
    }
    else
    {
      WeakRetained = 0;
    }

    objc_destroyWeak(&location);
  }

  return WeakRetained;
}

void __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __101__SBSSystemApertureRestrictionService_acquireRestrictSystemApertureLayoutToInertAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 3;
    v8 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 3);
    v5 = *(id *)(a1 + 32);

    WeakRetained = v8;
    if (v4 == v5)
    {
      objc_msgSend(v8[1], "remoteTarget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateRestrictSystemApertureLayoutToInertAssertionWithIdentifier:", v7);

      objc_storeWeak(v3, 0);
      WeakRetained = v8;
    }
  }

}

- (id)acquireSystemApertureCompleteSuppressionAssertionWithReason:(id)a3
{
  id v5;
  BSInvalidatable **p_completeSuppressionAssertion;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureRestrictionService.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  if (!self->_isValid)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemApertureRestrictionService.m"), 103, CFSTR("Attempted to use restriction service after invalidation."));

  }
  p_completeSuppressionAssertion = &self->_completeSuppressionAssertion;
  WeakRetained = objc_loadWeakRetained((id *)&self->_completeSuppressionAssertion);
  if (!WeakRetained)
  {
    objc_initWeak(&location, self);
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireSystemApertureCompleteSuppressionAssertionIdentifierWithReason:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0D01868]);
      objc_msgSend(v9, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke;
      v15[3] = &unk_1E288D440;
      objc_copyWeak(&v16, &location);
      WeakRetained = (id)objc_msgSend(v10, "initWithIdentifier:forReason:invalidationBlock:", v11, v5, v15);

      objc_storeWeak((id *)p_completeSuppressionAssertion, WeakRetained);
      objc_destroyWeak(&v16);
    }
    else
    {
      WeakRetained = 0;
    }

    objc_destroyWeak(&location);
  }

  return WeakRetained;
}

void __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __99__SBSSystemApertureRestrictionService_acquireSystemApertureCompleteSuppressionAssertionWithReason___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 4;
    v8 = WeakRetained;
    v4 = objc_loadWeakRetained(WeakRetained + 4);
    v5 = *(id *)(a1 + 32);

    WeakRetained = v8;
    if (v4 == v5)
    {
      objc_msgSend(v8[1], "remoteTarget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "invalidateSystemApertureCompleteSuppressionAssertionWithIdentifier:", v7);

      objc_storeWeak(v3, 0);
      WeakRetained = v8;
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_completeSuppressionAssertion);
  objc_destroyWeak((id *)&self->_restrictToInertAssertion);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSSystemApertureRestrictionService connection invalidated remotely; Restriction service terminated. (Do you have th"
    "e required entitlement?)",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __43__SBSSystemApertureRestrictionService_init__block_invoke_11_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSSystemApertureRestrictionService connection interrupted. Reactivating connection.", a5, a6, a7, a8, 0);
}

@end
