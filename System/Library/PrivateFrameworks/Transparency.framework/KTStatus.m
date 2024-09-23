@implementation KTStatus

- (KTStatus)initWithApplication:(id)a3
{
  id v5;
  void *v6;
  KTStatus *v7;
  KTStatus *v8;
  TransparencyApplication *v9;
  TransparencyApplication *application;
  KTStatus *v11;
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
    v14.super_class = (Class)KTStatus;
    v7 = -[KTStatus init](&v14, sel_init);
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
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_4);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

void __32__KTStatus_initWithApplication___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)getCurrentStatus:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__KTStatus_getCurrentStatus___block_invoke;
  v6[3] = &unk_24DC8EFE0;
  v7 = v4;
  v5 = v4;
  -[KTStatus getStatus:](self, "getStatus:", v6);

}

void __29__KTStatus_getCurrentStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  v7 = objc_msgSend(v6, "optInState");
  objc_msgSend(v6, "recentFailedEventIds");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, v7, v8, v5);
}

- (id)status:(id *)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __19__KTStatus_status___block_invoke;
  v9[3] = &unk_24DC8F030;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &v16;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __19__KTStatus_status___block_invoke_3;
  v8[3] = &unk_24DC8F078;
  v8[4] = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v9, v8);
  if (!v17[5] && v11[5])
  {
    +[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", CFSTR("TransparencyErrorInterface"), -386, CFSTR("status failed without status and no error"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v6;
}

void __19__KTStatus_status___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  int8x16_t v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __19__KTStatus_status___block_invoke_2;
    v9[3] = &unk_24DC8F008;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    objc_msgSend(v5, "getStatus:completionBlock:", v8, v9);

  }
}

void __19__KTStatus_status___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __19__KTStatus_status___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_206_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __19__KTStatus_status___block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)getStatus:(id)a3
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
  v9[2] = __22__KTStatus_getStatus___block_invoke;
  v9[3] = &unk_24DC8EC18;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __22__KTStatus_getStatus___block_invoke_214;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v9, v7);

}

void __22__KTStatus_getStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_211);
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_21A250000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_213);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous get KT status for %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getStatus:completionBlock:", v12, *(_QWORD *)(a1 + 40));

  }
}

void __22__KTStatus_getStatus___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __22__KTStatus_getStatus___block_invoke_212()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __22__KTStatus_getStatus___block_invoke_214(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_216);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __22__KTStatus_getStatus___block_invoke_2_215()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)getSelfStatus:(id)a3
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
  v9[2] = __26__KTStatus_getSelfStatus___block_invoke;
  v9[3] = &unk_24DC8EC18;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __26__KTStatus_getSelfStatus___block_invoke_220;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v9, v7);

}

void __26__KTStatus_getSelfStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_217);
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_impl(&dword_21A250000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_219);
    v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v8;
      objc_msgSend(v9, "applicationIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous get KT status for %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getSelfStatus:completionBlock:", v12, *(_QWORD *)(a1 + 40));

  }
}

void __26__KTStatus_getSelfStatus___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __26__KTStatus_getSelfStatus___block_invoke_218()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __26__KTStatus_getSelfStatus___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_222);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __26__KTStatus_getSelfStatus___block_invoke_2_221()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)errorForFailedEvent:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2_228;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_223);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v7;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_225);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous error lookup for %@", buf, 0xCu);
    }
    v14 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_226;
    v12[3] = &unk_24DC8EDE0;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "errorsForFailedEvents:completionBlock:", v10, v12);

  }
}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_224()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_226(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v7);
  }
  else if (v10)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v8 + 16))(v8, a2, 0);
  }

}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_229);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown errorForFailedEvent error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_233;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_230);
    v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_232);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous error lookup for %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(v5, "errorsForFailedEvents:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_231()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_233(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_235);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown errorForFailedEvent error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_2_234()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)ignoreFailedEvent:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_239;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_236);
    v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v7;
      _os_log_impl(&dword_21A250000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_238);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous ignore error for %@", buf, 0xCu);
    }
    v12 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ignoreFailedEvents:completionBlock:", v10, *(_QWORD *)(a1 + 40));

  }
}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_237()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_239(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_241);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_2_240()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)ignoreFailedEvents:(id)a3 completionBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke;
  v12[3] = &unk_24DC8EC18;
  v13 = v5;
  v14 = v6;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_245;
  v10[3] = &unk_24DC8EA78;
  v11 = v14;
  v8 = v14;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_242);
    v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_21A250000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_244);
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      v9 = *(void **)(a1 + 32);
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_21A250000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous ignore error for %@", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(v5, "ignoreFailedEvents:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_243()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_245(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_247);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_2_246()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

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
