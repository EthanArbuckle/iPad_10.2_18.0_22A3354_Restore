@implementation KTAccountKey

- (KTAccountKey)initWithApplication:(id)a3
{
  id v5;
  void *v6;
  KTAccountKey *v7;
  KTAccountKey *v8;
  TransparencyApplication *v9;
  TransparencyApplication *application;
  KTAccountKey *v11;
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
    v14.super_class = (Class)KTAccountKey;
    v7 = -[KTAccountKey init](&v14, sel_init);
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
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_1);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

void __36__KTAccountKey_initWithApplication___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

+ (id)accountPublicKey:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__KTAccountKey_accountPublicKey___block_invoke;
  v7[3] = &unk_24DC8EAC8;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v7, &__block_literal_global_7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __33__KTAccountKey_accountPublicKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __33__KTAccountKey_accountPublicKey___block_invoke_2;
  v4[3] = &unk_24DC8EAA0;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(a2, "accountKey:complete:", v2, v4);
}

void __33__KTAccountKey_accountPublicKey___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __33__KTAccountKey_accountPublicKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_8);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __33__KTAccountKey_accountPublicKey___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

+ (id)accountPublicID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "accountPublicKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSData)accountPublicKeyInfo
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[KTAccountKey _accountPublicKeyInfo](self, "_accountPublicKeyInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  -[KTAccountKey _accountPublicKeyInfo](self, "_accountPublicKeyInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTAccountKey _accountPublicKeyInfo](self, "_accountPublicKeyInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v3);

    return (NSData *)v5;
  }
  else
  {
    objc_sync_exit(v3);

    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__0;
    v13 = __Block_byref_object_dispose__0;
    v14 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __36__KTAccountKey_accountPublicKeyInfo__block_invoke;
    v8[3] = &unk_24DC8EAC8;
    v8[4] = self;
    v8[5] = &v9;
    +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v8, &__block_literal_global_18_0);
    v7 = (id)v10[5];
    _Block_object_dispose(&v9, 8);

    return (NSData *)v7;
  }
}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  __int128 v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_10);
    v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_12);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending synchronous signData for public key", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__KTAccountKey_accountPublicKeyInfo__block_invoke_13;
    v11[3] = &unk_24DC8EB30;
    v12 = *(_OWORD *)(a1 + 32);
    objc_msgSend(v5, "signData:application:completionBlock:", 0, v9, v11);

  }
}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_11()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "_accountPublicKeyInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v10);
    objc_sync_exit(v14);

  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_15);
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_21A250000, v15, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v16, 0xCu);
    }
  }

}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2_14()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_20);
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_21A250000, v3, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2_19()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (KTAccountPublicID)accountPublicID
{
  void *v2;
  void *v3;

  -[KTAccountKey accountPublicKeyInfo](self, "accountPublicKeyInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:](KTAccountPublicID, "ktAccountPublicIDWithPublicKeyInfo:error:", v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (KTAccountPublicID *)v3;
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41__KTAccountKey_signData_completionBlock___block_invoke;
  v8[3] = &unk_24DC8EB58;
  v9 = v6;
  v7 = v6;
  -[KTAccountKey signDataCIP:completionBlock:](self, "signDataCIP:completionBlock:", a3, v8);

}

uint64_t __41__KTAccountKey_signData_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)signDataCIP:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  KTAccountKey *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke;
  v13[3] = &unk_24DC8EBC8;
  v15 = self;
  v16 = v7;
  v14 = v6;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2_25;
  v11[3] = &unk_24DC8EA78;
  v12 = v16;
  v9 = v16;
  v10 = v6;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v13, v11);

}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_21);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_23);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous signData", buf, 2u);
    }
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_24;
    v13[3] = &unk_24DC8EBA0;
    v11 = *(void **)(a1 + 48);
    v13[4] = *(_QWORD *)(a1 + 40);
    v14 = v11;
    objc_msgSend(v5, "signData:application:completionBlock:", v9, v10, v13);

  }
}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_22()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "_accountPublicKeyInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v12);
  objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v13);
  objc_sync_exit(v12);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2_25(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_26);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)rollKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __24__KTAccountKey_rollKey___block_invoke;
  v9[3] = &unk_24DC8EC18;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __24__KTAccountKey_rollKey___block_invoke_35;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v9, v7);

}

void __24__KTAccountKey_rollKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_27_0);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_29);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous rollKey", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __24__KTAccountKey_rollKey___block_invoke_30;
    v12[3] = &unk_24DC8EBF0;
    v10 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v10;
    objc_msgSend(v5, "rollKeyForApplication:completionBlock:", v9, v12);

  }
}

void __24__KTAccountKey_rollKey___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __24__KTAccountKey_rollKey___block_invoke_28()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __24__KTAccountKey_rollKey___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accountPublicKeyInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v5);
    objc_sync_exit(v7);

    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_32);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_DEFAULT, "Successfully rolled account key for %{public}@", (uint8_t *)&v16, 0xCu);

    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_34_0);
    v12 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "applicationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_21A250000, v14, OS_LOG_TYPE_ERROR, "Failed to roll account key for %{public}@: %@", (uint8_t *)&v16, 0x16u);

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __24__KTAccountKey_rollKey___block_invoke_2_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __24__KTAccountKey_rollKey___block_invoke_33()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __24__KTAccountKey_rollKey___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_37);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown rollKeyForApplication error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __24__KTAccountKey_rollKey___block_invoke_2_36()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

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

- (NSData)_accountPublicKeyInfo
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_accountPublicKeyInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accountPublicKeyInfo, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
