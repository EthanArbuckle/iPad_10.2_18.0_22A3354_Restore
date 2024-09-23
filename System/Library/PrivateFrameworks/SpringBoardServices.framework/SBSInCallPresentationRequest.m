@implementation SBSInCallPresentationRequest

+ (id)identifiersForRequestedPresentations
{
  BSDispatchQueueAssertMain();
  return (id)SBSInCallIdentifiersForRequestedPresentations;
}

+ (void)notePresentationEndForRequestWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend((id)SBSInCallIdentifiersForRequestedPresentations, "removeObject:", v3);

  if (!objc_msgSend((id)SBSInCallIdentifiersForRequestedPresentations, "count"))
  {
    v4 = (void *)SBSInCallIdentifiersForRequestedPresentations;
    SBSInCallIdentifiersForRequestedPresentations = 0;

  }
}

+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  dispatch_queue_t v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogInCallPresentation();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_18EB52000, v8, OS_LOG_TYPE_DEFAULT, "performPresentationWithConfiguration: %{public}@", buf, 0xCu);
  }

  v9 = (void *)SBSInCallIdentifiersForRequestedPresentations;
  if (!SBSInCallIdentifiersForRequestedPresentations)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)SBSInCallIdentifiersForRequestedPresentations;
    SBSInCallIdentifiersForRequestedPresentations = v10;

    v9 = (void *)SBSInCallIdentifiersForRequestedPresentations;
  }
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSInCallPresentationServiceInterfaceSpecification identifier](SBSInCallPresentationServiceInterfaceSpecification, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endpointForMachName:service:instance:", v14, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = dispatch_queue_create("com.apple.SpringBoardServices.SBSInCallPresentationRequest.connectionQueue", v18);

  v20 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke;
  v30[3] = &unk_1E288E980;
  v31 = v19;
  v32 = a1;
  v21 = v19;
  objc_msgSend(v17, "configureConnection:", v30);
  SBLogInCallPresentation();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_18EB52000, v22, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v17, "activate");
  v23 = v17;
  objc_msgSend(v23, "remoteTarget");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_11;
  v27[3] = &unk_1E288E4B0;
  v28 = v23;
  v29 = v7;
  v25 = v23;
  v26 = v7;
  objc_msgSend(v24, "presentWithConfiguration:completion:", v6, v27);

}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSInCallPresentationServiceInterfaceSpecification interface](SBSInCallPresentationServiceInterfaceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  +[SBSInCallPresentationServiceInterfaceSpecification serviceQuality](SBSInCallPresentationServiceInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_56);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_7_2);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_9_2);

}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v2, v3);

}

void __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2_12;
    v8 = &unk_1E288D2E8;
    v10 = v4;
    v9 = v3;
    BSDispatchMain();

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v5, v6, v7, v8);

}

uint64_t __80__SBSInCallPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
