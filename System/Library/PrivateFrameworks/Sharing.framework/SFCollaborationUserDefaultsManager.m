@implementation SFCollaborationUserDefaultsManager

+ (void)requestCollaborativeModeForContentIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFCollaborationUserDefaultsManager/requestCollaborativeModeForContentIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v8, &state);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E482E490;
    v9 = v7;
    v13 = v9;
    objc_msgSend(a1, "_createRemoteDataProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "requestCollaborativeModeForContentIdentifier:completionHandler:", v6, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

    os_activity_scope_leave(&state);
  }

}

void __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)saveCollaborativeMode:(id)a3 forContentIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  os_activity_scope_state_s v11;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFCollaborationUserDefaultsManager/saveCollaborativeMode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v8, &v11);
  objc_msgSend(a1, "_createRemoteDataProxyWithErrorHandler:", &__block_literal_global_9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "saveCollaborativeMode:forContentIdentifier:", v6, v7);

  os_activity_scope_leave(&v11);
}

void __81__SFCollaborationUserDefaultsManager_saveCollaborativeMode_forContentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

+ (id)_createRemoteDataProxyWithErrorHandler:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.sharing.collaborationuserdefaults"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB928);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __101__SFCollaborationUserDefaultsManager_requestCollaborativeModeForContentIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "Share Sheet User Defaults: Error getting synchronous remote object proxy %@", a5, a6, a7, a8, 2u);
}

@end
