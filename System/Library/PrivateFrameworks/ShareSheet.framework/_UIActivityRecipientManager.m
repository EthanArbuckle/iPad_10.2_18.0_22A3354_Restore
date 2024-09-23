@implementation _UIActivityRecipientManager

+ (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19E419000, "Sharing/_UIActivityRecipientManager/requestMessagesRecipientInfoForSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke;
    v13[3] = &unk_1E4003450;
    v9 = v6;
    v14 = v9;
    +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:](_UIActivityRecipientManager, "createRemoteDataProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke_2;
      v11[3] = &unk_1E40038E8;
      v12 = v9;
      objc_msgSend(v10, "requestMessagesRecipientInfoForSessionID:completionHandler:", v5, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, 0);
    }

    os_activity_scope_leave(&state);
  }

}

+ (void)requestMailRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
  +[_UIActivityRecipientManager requestRecipientsForSessionID:completionHandler:](_UIActivityRecipientManager, "requestRecipientsForSessionID:completionHandler:", a3, a4);
}

+ (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19E419000, "Sharing/_UIActivityRecipientManager/requestRecipientsForSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke;
    v13[3] = &unk_1E4003450;
    v9 = v6;
    v14 = v9;
    +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:](_UIActivityRecipientManager, "createRemoteDataProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke_4;
      v11[3] = &unk_1E4003910;
      v12 = v9;
      objc_msgSend(v10, "requestRecipientsForSessionID:completionHandler:", v5, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

    os_activity_scope_leave(&state);
  }

}

+ (void)requestRecipientsV2ForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19E419000, "Sharing/_UIActivityRecipientManager/requestRecipientsV2ForSessionID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v7, &state);
    v8 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke;
    v13[3] = &unk_1E4003450;
    v9 = v6;
    v14 = v9;
    +[_UIActivityRecipientManager createRemoteDataProxyWithErrorHandler:](_UIActivityRecipientManager, "createRemoteDataProxyWithErrorHandler:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke_7;
      v11[3] = &unk_1E4003910;
      v12 = v9;
      objc_msgSend(v10, "requestRecipientsForSessionID:completionHandler:", v5, v11);

    }
    else
    {
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    }

    os_activity_scope_leave(&state);
  }

}

+ (id)createRemoteDataProxyWithErrorHandler:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3B38];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.sharing.sharesheetrecipients"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE576F68);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_requestMessagesRecipientInfoForSessionID_completionHandler_, 0, 1);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_requestRecipientsForSessionID_completionHandler_, 0, 1);

  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend(v5, "resume");
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
