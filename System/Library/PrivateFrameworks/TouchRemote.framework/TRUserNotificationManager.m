@implementation TRUserNotificationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance___sharedInstance_0;
}

void __43__TRUserNotificationManager_sharedInstance__block_invoke()
{
  TRUserNotificationManager *v0;
  void *v1;

  v0 = objc_alloc_init(TRUserNotificationManager);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (void)dealloc
{
  objc_super v3;

  -[TRUserNotificationManager cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)TRUserNotificationManager;
  -[TRUserNotificationManager dealloc](&v3, sel_dealloc);
}

- (void)_showUserNotificationWithDictionary:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _TRUserNotification *, _QWORD);
  NSObject *v10;
  _TRUserNotification *v11;
  void *v12;
  unsigned int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _TRUserNotification *, _QWORD))a5;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_20A2BF000, v10, OS_LOG_TYPE_DEFAULT, "[TRUserNotificationManager] Showing user notification: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  v13 = 0;
  v11 = -[_TRUserNotification initWithDictionary:options:error:]([_TRUserNotification alloc], "initWithDictionary:options:error:", v8, a4, &v13);
  if (v11)
  {
    -[TRUserNotificationManager setActiveUserNotification:](self, "setActiveUserNotification:", v11);
    -[TRUserNotificationManager activeUserNotification](self, "activeUserNotification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "show");

    if (v9)
      v9[2](v9, v11, 0);
    -[TRUserNotificationManager setActiveUserNotification:](self, "setActiveUserNotification:", 0);
  }
  else if (v9)
  {
    v9[2](v9, 0, v13);
  }

}

- (void)requestPermissionToInitiateSetupWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("INITIATE_SETUP_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INITIATE_SETUP_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INITIATE_SETUP_CONTINUE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__TRUserNotificationManager_requestPermissionToInitiateSetupWithCompletion___block_invoke;
  v15[3] = &unk_24C2E5B58;
  v16 = v14;
  v12 = v14;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v11, 0, v15);

}

uint64_t __76__TRUserNotificationManager_requestPermissionToInitiateSetupWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "didAccept"));
}

- (void)requestAuthenticationWithAccountID:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  __CFString *v25;
  id v26;
  void *v27;
  id v28;
  __CFString *v29;
  void *v30;
  _QWORD v31[5];
  __CFString *v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v29 = (__CFString *)a3;
  v8 = a4;
  v28 = a5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  v30 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v10, v11, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("APPLE_ID"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v18;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDBD720]);

  if (v29)
    v22 = v29;
  else
    v22 = &stru_24C2E6A98;
  v35[0] = v22;
  v35[1] = &stru_24C2E6A98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, *MEMORY[0x24BDBD728]);

  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24C2F2A68, *MEMORY[0x24BDBD708]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24C2F2A80, *MEMORY[0x24BEB0EB8]);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24C2F2A98, *MEMORY[0x24BEB0EC0]);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke;
  v31[3] = &unk_24C2E5BA8;
  v31[4] = self;
  v32 = v29;
  v33 = v30;
  v34 = v28;
  v24 = v30;
  v25 = v29;
  v26 = v28;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v16, 0x20000, v31);

}

void __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  objc_msgSend(v3, "textFieldValueAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFieldValueAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void *, char *))(v6 + 16))(v6, objc_msgSend(v3, "didAccept"), v4, v5, &v13);
    if (v13)
    {
      v7 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke_2;
      block[3] = &unk_24C2E5B80;
      v8 = *(void **)(a1 + 40);
      block[4] = *(_QWORD *)(a1 + 32);
      v10 = v8;
      v11 = *(id *)(a1 + 48);
      v12 = *(id *)(a1 + 56);
      dispatch_after(v7, MEMORY[0x24BDAC9B8], block);

    }
  }

}

uint64_t __83__TRUserNotificationManager_requestAuthenticationWithAccountID_message_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestAuthenticationWithAccountID:message:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)requestAppleIDAuthenticationWithAccountID:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  _QWORD v26[5];
  __CFString *v27;
  id v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v24 = (__CFString *)a3;
  v25 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("AUTH_APPLE_ID_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTH_APPLE_ID_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v22, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("APPLE_ID"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDBD720]);

  if (v24)
    v18 = v24;
  else
    v18 = &stru_24C2E6A98;
  v29[0] = v18;
  v29[1] = &stru_24C2E6A98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDBD728]);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24C2F2AB0, *MEMORY[0x24BDBD708]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24C2F2AC8, *MEMORY[0x24BEB0EB8]);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24C2F2AE0, *MEMORY[0x24BEB0EC0]);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke;
  v26[3] = &unk_24C2E5BF8;
  v27 = v24;
  v28 = v25;
  v26[4] = self;
  v20 = v24;
  v21 = v25;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v12, 0x20000, v26);

}

void __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend(v3, "textFieldValueAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFieldValueAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void *, char *))(v6 + 16))(v6, objc_msgSend(v3, "didAccept"), v4, v5, &v12);
    if (v12)
    {
      v7 = dispatch_time(0, 500000000);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke_2;
      v9[3] = &unk_24C2E5BD0;
      v8 = *(void **)(a1 + 40);
      v9[4] = *(_QWORD *)(a1 + 32);
      v10 = v8;
      v11 = *(id *)(a1 + 48);
      dispatch_after(v7, MEMORY[0x24BDAC9B8], v9);

    }
  }

}

uint64_t __82__TRUserNotificationManager_requestAppleIDAuthenticationWithAccountID_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "requestAppleIDAuthenticationWithAccountID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)presentAuthenticationFailureWithMessage:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v18 = a4;
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_DEFAULT_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_RETRY_BUTTON"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v8, v9, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {

  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __80__TRUserNotificationManager_presentAuthenticationFailureWithMessage_completion___block_invoke;
  v19[3] = &unk_24C2E5B58;
  v20 = v18;
  v15 = v18;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v14, 0, v19);

}

uint64_t __80__TRUserNotificationManager_presentAuthenticationFailureWithMessage_completion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "didAccept"));
  return result;
}

- (void)requestPermissionForDiagnosticSubmissionWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DIAGNOSTIC_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DIAGNOSTIC_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_THANKS_BUTTON"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v4, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __84__TRUserNotificationManager_requestPermissionForDiagnosticSubmissionWithCompletion___block_invoke;
  v15[3] = &unk_24C2E5B58;
  v16 = v14;
  v12 = v14;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v11, 0, v15);

}

uint64_t __84__TRUserNotificationManager_requestPermissionForDiagnosticSubmissionWithCompletion___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, objc_msgSend(a2, "didAccept"));
  return result;
}

- (void)presentErrorWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_TRUserNotification userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:](_TRUserNotification, "userNotificationDictionaryWithTitle:message:defaultButtonTitle:alternateButtonTitle:", v11, v10, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__TRUserNotificationManager_presentErrorWithTitle_message_completion___block_invoke;
  v16[3] = &unk_24C2E5B58;
  v17 = v8;
  v15 = v8;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v14, 0, v16);

}

uint64_t __70__TRUserNotificationManager_presentErrorWithTitle_message_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentWiFiNetworkConnectionError:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v15 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_WIFI_MESSAGE_DHCP"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((MGGetBoolAnswer() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("CONNECT_TO_WLAN_MESSAGE_DHCP");
LABEL_6:
      objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24C2E6A98, CFSTR("TouchRemote"));
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_WIFI_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (MGGetBoolAnswer())
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = CFSTR("CONNECT_TO_WLAN_MESSAGE");
      goto LABEL_6;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_WIFI_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRUserNotificationManager presentErrorWithTitle:message:completion:](self, "presentErrorWithTitle:message:completion:", v14, v8, v15);

}

- (void)cancel
{
  id v2;

  -[TRUserNotificationManager activeUserNotification](self, "activeUserNotification");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)requestLegacyAuthenticationWithAccountID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  __CFString *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v29 = (__CFString *)a3;
  v28 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v8, *MEMORY[0x24BDBD6D8]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v13, *MEMORY[0x24BDBD6E0]);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APPLE_ID"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v18, *MEMORY[0x24BDBD720]);

  if (v29)
    v19 = v29;
  else
    v19 = &stru_24C2E6A98;
  v34[0] = v19;
  v34[1] = &stru_24C2E6A98;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v20, *MEMORY[0x24BDBD728]);

  objc_msgSend(v6, "setObject:forKey:", &unk_24C2F2AF8, *MEMORY[0x24BDBD708]);
  objc_msgSend(v6, "setObject:forKey:", &unk_24C2F2B10, *MEMORY[0x24BEB0EB8]);
  objc_msgSend(v6, "setObject:forKey:", &unk_24C2F2B28, *MEMORY[0x24BEB0EC0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v22, *MEMORY[0x24BDBD6F0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v24, *MEMORY[0x24BDBD6F8]);

  objc_msgSend(v6, "setObject:forKey:", &unk_24C2F2928, *MEMORY[0x24BEB0E30]);
  v25 = *MEMORY[0x24BDBD270];
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDBD6E8]);
  objc_msgSend(v6, "setObject:forKey:", v25, *MEMORY[0x24BEB0E58]);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v6;
      _os_log_impl(&dword_20A2BF000, v26, OS_LOG_TYPE_DEFAULT, "Showing user notification: %@", buf, 0xCu);
    }

  }
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __81__TRUserNotificationManager_requestLegacyAuthenticationWithAccountID_completion___block_invoke;
  v30[3] = &unk_24C2E5B58;
  v31 = v28;
  v27 = v28;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v6, 0x20000, v30);

}

void __81__TRUserNotificationManager_requestLegacyAuthenticationWithAccountID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "textFieldValueAtIndex:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFieldValueAtIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_msgSend(v3, "didAccept");

  (*(void (**)(uint64_t, uint64_t, id, void *))(v5 + 16))(v5, v6, v7, v4);
}

- (void)presentLegacyAuthenticationFailedDialogWithMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_TITLE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x24BDBD6D8]);

  if (v6)
  {
    v11 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_DEFAULT_MESSAGE"), &stru_24C2E6A98, CFSTR("TouchRemote"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setObject:forKey:", v11, *MEMORY[0x24BDBD6E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v14, *MEMORY[0x24BDBD6F0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AUTH_FAILED_RETRY_BUTTON"), &stru_24C2E6A98, CFSTR("TouchRemote"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v16, *MEMORY[0x24BDBD6F8]);

  objc_msgSend(v8, "setObject:forKey:", &unk_24C2F2928, *MEMORY[0x24BEB0E30]);
  v17 = *MEMORY[0x24BDBD270];
  objc_msgSend(v8, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDBD6E8]);
  objc_msgSend(v8, "setObject:forKey:", v17, *MEMORY[0x24BEB0E58]);
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_20A2BF000, v18, OS_LOG_TYPE_DEFAULT, "[TRUserNotificationManager] Showing user notification: %@", buf, 0xCu);
    }

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __91__TRUserNotificationManager_presentLegacyAuthenticationFailedDialogWithMessage_completion___block_invoke;
  v20[3] = &unk_24C2E5B58;
  v21 = v7;
  v19 = v7;
  -[TRUserNotificationManager _showUserNotificationWithDictionary:options:completion:](self, "_showUserNotificationWithDictionary:options:completion:", v8, 0, v20);

}

uint64_t __91__TRUserNotificationManager_presentLegacyAuthenticationFailedDialogWithMessage_completion___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "didAccept"));
}

- (_TRUserNotification)activeUserNotification
{
  return self->_activeUserNotification;
}

- (void)setActiveUserNotification:(id)a3
{
  objc_storeStrong((id *)&self->_activeUserNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserNotification, 0);
}

@end
