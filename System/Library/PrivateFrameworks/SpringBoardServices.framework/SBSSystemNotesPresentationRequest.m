@implementation SBSSystemNotesPresentationRequest

+ (void)performPresentationWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke;
  v10[3] = &unk_1E288E9A8;
  v11 = v6;
  v12 = v7;
  v13 = a1;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "prepareForXPCCall:", v10);

}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  dispatch_queue_t v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      SBLogSystemNotes();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSystemNotesPresentationServiceInterfaceSpecification identifier](SBSSystemNotesPresentationServiceInterfaceSpecification, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointForMachName:service:instance:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.SpringBoardServices.SBSSystemNotesPresentationRequest.connectionQueue", v10);

    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_3;
    v24[3] = &unk_1E288E980;
    v13 = *(_QWORD *)(a1 + 48);
    v25 = v11;
    v26 = v13;
    v14 = v11;
    objc_msgSend(v9, "configureConnection:", v24);
    SBLogSystemNotes();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v9;
      _os_log_impl(&dword_18EB52000, v15, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v9, "activate");
    v16 = v9;
    objc_msgSend(v16, "remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_10;
    v21[3] = &unk_1E288E4B0;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v22 = v16;
    v23 = v19;
    v20 = v16;
    objc_msgSend(v17, "presentWithConfiguration:completion:", v18, v21);

  }
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSSystemNotesPresentationServiceInterfaceSpecification interface](SBSSystemNotesPresentationServiceInterfaceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  +[SBSSystemNotesPresentationServiceInterfaceSpecification serviceQuality](SBSSystemNotesPresentationServiceInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_28);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_6_1);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_8_0);

}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
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

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_5(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogSystemNotes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v2, v3);

}

uint64_t __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_10(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __85__SBSSystemNotesPresentationRequest_performPresentationWithConfiguration_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "Failed to prepare SBSSystemNotesPresentationConfiguration for XPC call. config: %{public}@; error: %{public}@",
    (uint8_t *)&v4,
    0x16u);
}

@end
