@implementation SBSFocusModesHomeScreenSettingsService

+ (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "activateConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke;
  v11[3] = &unk_1E2890058;
  v12 = v7;
  v13 = v5;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "homeScreenSnapshotsWithRequest:completion:", v6, v11);

}

void __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v10 = v7;
    v8 = v5;
    v9 = v6;
    BSDispatchMain();

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __84__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsWithRequest_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "activateConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke;
  v11[3] = &unk_1E2890058;
  v12 = v7;
  v13 = v5;
  v9 = v7;
  v10 = v5;
  objc_msgSend(v8, "homeScreenSnapshotsForSuggestedPagesWithRequest:completion:", v6, v11);

}

void __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v10 = v7;
    v8 = v5;
    v9 = v6;
    BSDispatchMain();

  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

uint64_t __101__SBSFocusModesHomeScreenSettingsService_homeScreenSnapshotsForSuggestedPagesWithRequest_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "activateConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFocusModeHomeScreenSettingsWithRequest:", v3);

  objc_msgSend(v5, "invalidate");
}

+ (void)addSuggestedHomeScreenPageWithRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "activateConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSuggestedHomeScreenPageWithRequest:", v3);

  objc_msgSend(v5, "invalidate");
}

+ (id)activateConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  dispatch_queue_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification identifier](SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointForMachName:service:instance:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.springboard.focus-modes-home-screen-settings-service.connectionQueue", v8);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke;
  v16 = &unk_1E288E980;
  v17 = v9;
  v18 = a1;
  v10 = v9;
  objc_msgSend(v7, "configureConnection:", &v13);
  SBLogFocusModes();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_18EB52000, v11, OS_LOG_TYPE_DEFAULT, "Activating Connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v7, "activate", v13, v14, v15, v16);
  return v7;
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification interface](SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification, "interface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterface:", v3);

  +[SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification serviceQuality](SBSFocusModesHomeScreenSettingsServiceInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  objc_msgSend(v5, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setTargetQueue:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setActivationHandler:", &__block_literal_global_54);
  objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_7_1);
  objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_9_1);

}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogFocusModes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogFocusModes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_DEFAULT, "Received interruption for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __60__SBSFocusModesHomeScreenSettingsService_activateConnection__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogFocusModes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__SBSSystemNotesPresentationClientToServerProxy__setupAndActivateConnection__block_invoke_15_cold_1((uint64_t)v2, v3);

}

@end
