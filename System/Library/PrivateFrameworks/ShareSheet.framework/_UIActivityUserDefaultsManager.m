@implementation _UIActivityUserDefaultsManager

+ (void)requestFavoritesForActivityCategory:(int64_t)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v5 = a4;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19E419000, "Sharing/_UIActivityUserDefaultsManager/requestFavoritesForActivityCategory", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    if (requestFavoritesForActivityCategory_completionHandler__onceToken != -1)
      dispatch_once(&requestFavoritesForActivityCategory_completionHandler__onceToken, &__block_literal_global_33);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sharing.sharesheetuserdefaults"), 0);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE576EA8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v8);

    objc_msgSend(v7, "_setQueue:", requestFavoritesForActivityCategory_completionHandler__xpc_queue);
    objc_msgSend(v7, "resume");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __88___UIActivityUserDefaultsManager_requestFavoritesForActivityCategory_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4003450;
    v9 = v5;
    v13 = v9;
    objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "requestFavoritesForActivityCategory:completionHandler:", a3, v9);
    else
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

    os_activity_scope_leave(&state);
  }

}

@end
