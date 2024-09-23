@implementation SBSCaptureButtonRestrictionService

- (SBSCaptureButtonRestrictionService)init
{
  SBSCaptureButtonRestrictionService *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BSCompoundAssertion *inhibitActionAssertion;
  BSCompoundAssertion *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *connectionQueue;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BSServiceConnection *connection;
  BSServiceConnection *v22;
  SBSCaptureButtonRestrictionService *result;
  void *v24;
  _QWORD v25[4];
  SBSCaptureButtonRestrictionService *v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SBSCaptureButtonRestrictionService;
  v3 = -[SBSCaptureButtonRestrictionService init](&v30, sel_init);
  if (!v3)
    return v3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (!v6)
  {
    v3->_isValid = 1;
    objc_initWeak(&location, v3);
    v7 = (void *)MEMORY[0x1E0D01718];
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __42__SBSCaptureButtonRestrictionService_init__block_invoke;
    v27[3] = &unk_1E288D8F0;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v7, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("CaptureButtonInhibitAction"), v27);
    v9 = objc_claimAutoreleasedReturnValue();
    inhibitActionAssertion = v3->_inhibitActionAssertion;
    v3->_inhibitActionAssertion = (BSCompoundAssertion *)v9;

    v11 = v3->_inhibitActionAssertion;
    SBLogCameraCaptureRestriction();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v11, "setLog:", v12);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSCaptureButtonRestrictionServiceSpecification identifier](SBSCaptureButtonRestrictionServiceSpecification, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endpointForMachName:service:instance:", v17, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v20;

    v22 = v3->_connection;
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __42__SBSCaptureButtonRestrictionService_init__block_invoke_2;
    v25[3] = &unk_1E288CF30;
    v26 = v3;
    -[BSServiceConnection configureConnection:](v22, "configureConnection:", v25);
    -[BSServiceConnection activate](v3->_connection, "activate");

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Within SpringBoard, use SBCaptureButtonRestrictionCoordinator IPI directly."));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[SBSCaptureButtonRestrictionService init].cold.1(a2, (uint64_t)v3, (uint64_t)v24);
  objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
  result = (SBSCaptureButtonRestrictionService *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained[1], "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "isActive");

  objc_msgSend(v5, "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureButtonActionInhibited:", v7);

}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSCaptureButtonRestrictionServiceSpecification interface](SBSCaptureButtonRestrictionServiceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  +[SBSCaptureButtonRestrictionServiceSpecification serviceQuality](SBSCaptureButtonRestrictionServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_10);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_17);

}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  SBLogCameraCaptureRestriction();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __42__SBSCaptureButtonRestrictionService_init__block_invoke_3_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_16(uint64_t a1, void *a2)
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
  SBLogCameraCaptureRestriction();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__SBSCaptureButtonRestrictionService_init__block_invoke_16_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  objc_msgSend(v2, "activate");
}

- (void)invalidate
{
  BSServiceConnection *connection;
  BSCompoundAssertion *inhibitActionAssertion;

  if (self->_isValid)
  {
    -[BSServiceConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

    -[BSCompoundAssertion invalidate](self->_inhibitActionAssertion, "invalidate");
    inhibitActionAssertion = self->_inhibitActionAssertion;
    self->_inhibitActionAssertion = 0;

    self->_isValid = 0;
  }
}

- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if (a3)
  {
    SBLogCameraCaptureRestriction();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSCaptureButtonRestrictionService acquireCaptureButtonSuppressionAssertionWithOptions:reason:].cold.1(a3, v7);

  }
  -[BSCompoundAssertion acquireForReason:](self->_inhibitActionAssertion, "acquireForReason:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inhibitActionAssertion, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)init
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSCaptureButtonRestrictionService.m");
  v16 = 1024;
  v17 = 45;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_18EB52000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSCaptureButtonRestrictionService connection invalidated remotely; Restriction service terminated. (Do you have the"
    " required entitlement?)",
    a5,
    a6,
    a7,
    a8,
    0);
}

void __42__SBSCaptureButtonRestrictionService_init__block_invoke_16_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18EB52000, a1, a3, "SBSCaptureButtonRestrictionService connection interrupted. Reactivating connection.", a5, a6, a7, a8, 0);
}

- (void)acquireCaptureButtonSuppressionAssertionWithOptions:(uint64_t)a1 reason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSBSCaptureButtonSuppressionOptions(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;

}

@end
