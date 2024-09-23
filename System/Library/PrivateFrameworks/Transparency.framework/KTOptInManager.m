@implementation KTOptInManager

+ (void)getOptInState:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  KTOptInState *v7;
  void *v8;
  KTOptInState *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  KTOptInState *v13;
  id v14;
  _QWORD v15[4];
  KTOptInState *v16;
  id v17;
  _QWORD v18[4];
  KTOptInState *v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = [KTOptInState alloc];
  objc_msgSend(v5, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[KTOptInState initWithApplication:](v7, "initWithApplication:", v8);

  -[KTOptInState setState:](v9, "setState:", 2);
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __43__KTOptInManager_getOptInState_completion___block_invoke;
  v18[3] = &unk_24DC8EBC8;
  v21 = v6;
  v19 = v9;
  v20 = v5;
  v11 = v5;
  v12 = objc_msgSend(v11, "sync");
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __43__KTOptInManager_getOptInState_completion___block_invoke_172;
  v15[3] = &unk_24DC8EC60;
  v16 = v19;
  v17 = v21;
  v13 = v19;
  v14 = v21;
  +[TransparencyXPCConnection invokeXPCWithBlock:synchronous:errorHandler:](TransparencyXPCConnection, "invokeXPCWithBlock:synchronous:errorHandler:", v18, v12, v15);

}

void __43__KTOptInManager_getOptInState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_3);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCWithBlock error: %@", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "getKTOptInState:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __43__KTOptInManager_getOptInState_completion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __43__KTOptInManager_getOptInState_completion___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_174);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "getOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __43__KTOptInManager_getOptInState_completion___block_invoke_2_173()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

+ (id)notificationKeyForApplication:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IDS")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Transparency.KT.IDS.OptInStateChanged");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MP")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Transparency.KT.MP.OptInStateChanged");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FT")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.Transparency.KT.FT.OptInStateChanged");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CK")))
  {
    v4 = CFSTR("com.apple.Transparency.KT.CK.OptInStateChanged");
  }
  else
  {
    v4 = 0;
  }

  return (id)v4;
}

- (KTOptInManager)initWithApplication:(id)a3
{
  id v5;
  void *v6;
  KTOptInManager *v7;
  KTOptInManager *v8;
  TransparencyApplication *v9;
  TransparencyApplication *application;
  KTOptInManager *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[TransparencyApplication applicationValueForIdentifier:](TransparencyApplication, "applicationValueForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)KTOptInManager;
    v7 = -[KTOptInManager init](&v14, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
      v9 = -[TransparencyApplication initWithIdentifier:]([TransparencyApplication alloc], "initWithIdentifier:", v8->_applicationIdentifier);
      application = v8->_application;
      v8->_application = v9;

    }
    self = v8;
    v11 = self;
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_177);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

void __38__KTOptInManager_initWithApplication___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (BOOL)getOptInState
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__KTOptInManager_getOptInState__block_invoke;
  v4[3] = &unk_24DC8EAC8;
  v4[4] = self;
  v4[5] = &v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v4, &__block_literal_global_188);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __31__KTOptInManager_getOptInState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  KTOptInStateRequest *v12;
  void *v13;
  KTOptInStateRequest *v14;
  NSObject *v15;
  _QWORD v16[4];
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_179);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_181);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state fetch for %{public}@", buf, 0xCu);

    }
    v12 = [KTOptInStateRequest alloc];
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[KTOptInStateRequest initWithApplication:](v12, "initWithApplication:", v13);

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __31__KTOptInManager_getOptInState__block_invoke_183;
    v16[3] = &unk_24DC8ECE8;
    v17 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "getKTOptInState:completion:", v14, v16);

  }
}

void __31__KTOptInManager_getOptInState__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __31__KTOptInManager_getOptInState__block_invoke_180()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __31__KTOptInManager_getOptInState__block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_185);
    v7 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "applicationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "opt-in state fetch for %{public}@ failed: %@", (uint8_t *)&v11, 0x16u);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v5, "state") == 1;
  }

}

void __31__KTOptInManager_getOptInState__block_invoke_2_184()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __31__KTOptInManager_getOptInState__block_invoke_187(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_190);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "Unknown getOptInState error: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __31__KTOptInManager_getOptInState__block_invoke_2_189()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke;
  v11[3] = &unk_24DC8EDB8;
  v11[4] = self;
  v12 = v6;
  v13 = a3;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2_195;
  v9[3] = &unk_24DC8EA78;
  v10 = v12;
  v8 = v12;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v11, v9);

}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  KTOptInStateRequest *v12;
  void *v13;
  KTOptInStateRequest *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_191);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_193);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous opt-in state fetch for %{public}@", buf, 0xCu);

    }
    v12 = [KTOptInStateRequest alloc];
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[KTOptInStateRequest initWithApplication:](v12, "initWithApplication:", v13);

    -[KTOptInStateRequest setFetchCloudKit:](v14, "setFetchCloudKit:", *(unsigned __int8 *)(a1 + 48));
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke_194;
    v16[3] = &unk_24DC8ED90;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v5, "getKTOptInState:completion:", v14, v16);

  }
}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke_192()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "state") == 1;
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "smtTimestamp");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, _BOOL8, id, id))(v8 + 16))(v8, v7, v9, v5);
}

uint64_t __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2_195(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getOptInStateWithSync:(id)a3
{
  -[KTOptInManager getOptInState:completionBlock:](self, "getOptInState:completionBlock:", 1, a3);
}

- (void)setOptInState:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__KTOptInManager_setOptInState_completionBlock___block_invoke;
  v8[3] = &unk_24DC8EDE0;
  v9 = v6;
  v7 = v6;
  -[KTOptInManager setOptInState:detailedCompletionBlock:](self, "setOptInState:detailedCompletionBlock:", v4, v8);

}

uint64_t __48__KTOptInManager_setOptInState_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)waitForIDSRegistration:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__KTOptInManager_waitForIDSRegistration___block_invoke;
  v8[3] = &unk_24DC8EE28;
  v9 = v3;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __41__KTOptInManager_waitForIDSRegistration___block_invoke_198;
  v6[3] = &unk_24DC8EA78;
  v7 = v9;
  v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v8, v6);

}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_197);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "waitForIDSRegistration:", *(_QWORD *)(a1 + 32));
  }

}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke_198(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_200);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown checkIDSRegistration error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke_2_199()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void)setOptInState:(BOOL)a3 detailedCompletionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatch_get_global_queue(33, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke;
  block[3] = &unk_24DC8EED0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2;
  v7[3] = &unk_24DC8EDB8;
  v3 = *(id *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_204;
  v5[3] = &unk_24DC8EA78;
  v6 = v4;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, v5);

}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_201);
    v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_21A250000, v14, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v15, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = *(unsigned __int8 *)(a1 + 48);
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_203);
    v9 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      objc_msgSend(v10, "applicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v12;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state set for %{public}@", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeOptInState:application:completionBlock:", v8, v13, *(_QWORD *)(a1 + 40));

  }
}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_202()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_204(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_206);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown setKTOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2_205()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (void)changeOptInState:(unint64_t)a3 detailedCompletionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  dispatch_get_global_queue(33, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke;
  block[3] = &unk_24DC8EF60;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2;
  v7[3] = &unk_24DC8EF18;
  v3 = *(id *)(a1 + 40);
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_210;
  v5[3] = &unk_24DC8EA78;
  v6 = v4;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, v5);

}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_207);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v16, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_209);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v16 = 138543618;
      v17 = v11;
      v18 = 1024;
      v19 = v12;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state set for %{public}@: %d", (uint8_t *)&v16, 0x12u);

    }
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeOptInState:application:completionBlock:", v13, v14, *(_QWORD *)(a1 + 40));

  }
}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_208()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_210(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_212);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown changeOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2_211()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)v0;

}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (TransparencyApplication)application
{
  return (TransparencyApplication *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
