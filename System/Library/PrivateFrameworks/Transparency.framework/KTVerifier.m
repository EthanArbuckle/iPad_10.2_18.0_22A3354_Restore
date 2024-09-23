@implementation KTVerifier

- (KTVerifier)initWithApplication:(id)a3
{
  id v5;
  void *v6;
  KTVerifier *v7;
  KTVerifier *v8;
  TransparencyApplication *v9;
  TransparencyApplication *application;
  KTVerifier *v11;
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
    v14.super_class = (Class)KTVerifier;
    v7 = -[KTVerifier init](&v14, sel_init);
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
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_7);
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_21A250000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)unimplementedError:(id)a3
{
  return +[TransparencyError unimplementedError:](TransparencyError, "unimplementedError:", a3);
}

void __34__KTVerifier_initWithApplication___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

- (void)invokeXPCAsynchronousCallWithBlock:(id)a3 failureBlock:(id)a4
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
  v12[2] = __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke;
  v12[3] = &unk_24DC8F758;
  v13 = v6;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_10;
  v10[3] = &unk_24DC8EA78;
  v11 = v13;
  v8 = v13;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCAsynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_8_0);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __62__KTVerifier_invokeXPCAsynchronousCallWithBlock_failureBlock___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invokeXPCSynchronousCallWithBlock:(id)a3 failureBlock:(id)a4
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
  v12[2] = __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke;
  v12[3] = &unk_24DC8F758;
  v13 = v6;
  v14 = v5;
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_13;
  v10[3] = &unk_24DC8EA78;
  v11 = v13;
  v8 = v13;
  v9 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:errorHandler:](TransparencyXPCConnection, "invokeXPCSynchronousCallWithBlock:errorHandler:", v12, v10);

}

void __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_12_0);
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_21A250000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v10, 0xCu);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

void __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __61__KTVerifier_invokeXPCSynchronousCallWithBlock_failureBlock___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 error:(id *)a7
{
  return -[KTVerifier validatePeerUri:accountKey:loggableDatas:queryRequest:queryResponse:error:](self, "validatePeerUri:accountKey:loggableDatas:queryRequest:queryResponse:error:", a3, a4, a5, 0, a6, a7);
}

- (id)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD v50[5];
  NSString *v51;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__3;
  v50[4] = __Block_byref_object_dispose__3;
  v51 = 0;
  v51 = self->_applicationIdentifier;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__3;
  v48 = __Block_byref_object_dispose__3;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  v18 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke;
  v29[3] = &unk_24DC8F7C8;
  v19 = v13;
  v30 = v19;
  v35 = v50;
  v20 = v14;
  v31 = v20;
  v21 = v15;
  v32 = v21;
  v22 = v16;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  v36 = &v38;
  v37 = &v44;
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2_18;
  v28[3] = &unk_24DC8F078;
  v28[4] = &v38;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v29, v28);
  if (a8)
  {
    v24 = (void *)v39[5];
    if (v24)
      *a8 = objc_retainAutorelease(v24);
  }
  v25 = (id)v45[5];

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(v50, 8);
  return v25;
}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_14);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending synchronous validatePeerUri", buf, 2u);
  }
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_15;
  v11[3] = &unk_24DC8F7A0;
  v12 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v3, "validatePeerUri:application:accountKey:loggableDatas:queryRequest:queryResponse:promiseCompletionBlock:", v7, v6, v8, v9, v10, v5, v11);

}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = a4;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __88__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryRequest_queryResponse_error___block_invoke_2_18(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 error:(id *)a7
{
  return -[KTVerifier validateEnrollmentUri:accountKey:loggableData:queryRequest:insertResponse:error:](self, "validateEnrollmentUri:accountKey:loggableData:queryRequest:insertResponse:error:", a3, a4, a5, 0, a6, a7);
}

- (id)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 queryRequest:(id)a6 insertResponse:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[5];
  id v50;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__3;
  v49[4] = __Block_byref_object_dispose__3;
  v50 = 0;
  -[KTVerifier applicationIdentifier](self, "applicationIdentifier");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke;
  v28[3] = &unk_24DC8F7C8;
  v19 = v13;
  v29 = v19;
  v34 = v49;
  v20 = v14;
  v30 = v20;
  v21 = v15;
  v31 = v21;
  v22 = v16;
  v32 = v22;
  v23 = v17;
  v33 = v23;
  v35 = &v37;
  v36 = &v43;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2_21;
  v27[3] = &unk_24DC8F078;
  v27[4] = &v37;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v28, v27);
  if (a8)
    *a8 = objc_retainAutorelease((id)v38[5]);
  v24 = (id)v44[5];

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  return v24;
}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  __int128 v12;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_19);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending synchronous validateEnrollmentUri", buf, 2u);
  }
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_20;
  v11[3] = &unk_24DC8F7A0;
  v12 = *(_OWORD *)(a1 + 80);
  objc_msgSend(v3, "validateEnrollmentUri:application:accountKey:loggableData:queryRequest:queryResponse:promiseCompletionBlock:", v7, v6, v8, v9, v10, v5, v11);

}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_20(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = a3;
  v9 = a4;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a4);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __94__KTVerifier_validateEnrollmentUri_accountKey_loggableData_queryRequest_insertResponse_error___block_invoke_2_21(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)validatePeerUri:(id)a3 accountKey:(id)a4 loggableDatas:(id)a5 queryResponse:(id)a6 promiseCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[KTVerifier applicationIdentifier](self, "applicationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke;
  v28[3] = &unk_24DC8F810;
  v29 = v12;
  v30 = v17;
  v31 = v13;
  v32 = v14;
  v33 = v15;
  v34 = v16;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_23;
  v25[3] = &unk_24DC8EC60;
  v26 = v29;
  v27 = v34;
  v19 = v29;
  v20 = v34;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v28, v25);

}

void __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_22);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerUri", buf, 2u);
  }
  objc_msgSend(v3, "validatePeerUri:application:accountKey:loggableDatas:queryRequest:queryResponse:promiseCompletionBlock:", a1[4], a1[5], a1[6], a1[7], 0, a1[8], a1[9]);

}

void __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __92__KTVerifier_validatePeerUri_accountKey_loggableDatas_queryResponse_promiseCompletionBlock___block_invoke_23(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, a2);
}

- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke;
  v18[3] = &unk_24DC8F860;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2_27;
  v15[3] = &unk_24DC8EC60;
  v16 = v19;
  v17 = v21;
  v12 = v19;
  v13 = v21;
  v14 = v9;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v18, v15);

}

void __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_24);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerResult", buf, 2u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_25;
  v7[3] = &unk_24DC8F838;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "validatePeerResult:uuid:fetchNow:completionBlock:", v5, v6, 0, v7);

}

void __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "uri");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "succeed");
  v8 = objc_msgSend(v6, "optedIn");
  objc_msgSend(v6, "loggableDatas");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, uint64_t, uint64_t, void *, id))(v4 + 16))(v4, v10, v7, v8, v9, v5);
}

uint64_t __54__KTVerifier_validatePeerResult_uuid_completionBlock___block_invoke_2_27(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 0, a2);
}

- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 fetchNow:(BOOL)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  KTVerifier *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke;
  v21[3] = &unk_24DC8F888;
  v22 = v10;
  v23 = v11;
  v25 = a5;
  v24 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_29;
  v17[3] = &unk_24DC8F8B0;
  v19 = self;
  v20 = v24;
  v18 = v22;
  v14 = v22;
  v15 = v24;
  v16 = v11;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v21, v17);

}

void __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_28);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending validatePeerResult", v5, 2u);
  }
  objc_msgSend(v3, "validatePeerResult:uuid:fetchNow:completionBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __66__KTVerifier_getValidatePeerResult_uuid_fetchNow_completionBlock___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  KTVerifierResult *v5;
  uint64_t v6;
  KTVerifierResult *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  v5 = [KTVerifierResult alloc];
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[KTVerifierResult initWithUri:application:](v5, "initWithUri:application:", v6, v8);
  (*(void (**)(uint64_t, KTVerifierResult *, id))(v3 + 16))(v3, v7, v4);

}

- (void)getValidatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  -[KTVerifier getValidatePeerResult:uuid:fetchNow:completionBlock:](self, "getValidatePeerResult:uuid:fetchNow:completionBlock:", a3, a4, 0, a5);
}

- (void)validateSelfResult:(id)a3 uuid:(id)a4 syncedDatas:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a6;
  v11 = a3;
  NSStringFromSelector(a2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[KTVerifier unimplementedError:](self, "unimplementedError:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD, _QWORD, _QWORD, void *))a6 + 2))(v10, v11, 0, 0, 0, v12);

}

- (void)validateEnrollmentUri:(id)a3 accountKey:(id)a4 loggableData:(id)a5 insertResponse:(id)a6 promiseCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[KTVerifier applicationIdentifier](self, "applicationIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke;
  v28[3] = &unk_24DC8F810;
  v29 = v12;
  v30 = v17;
  v31 = v13;
  v32 = v14;
  v33 = v15;
  v34 = v16;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_32;
  v25[3] = &unk_24DC8EC60;
  v26 = v29;
  v27 = v34;
  v19 = v29;
  v20 = v34;
  v21 = v15;
  v22 = v14;
  v23 = v13;
  v24 = v17;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v28, v25);

}

void __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_31_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending validateEnrollmentUri", buf, 2u);
  }
  objc_msgSend(v3, "validateEnrollmentUri:application:accountKey:loggableData:queryRequest:queryResponse:promiseCompletionBlock:", a1[4], a1[5], a1[6], a1[7], 0, a1[8], a1[9]);

}

void __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __98__KTVerifier_validateEnrollmentUri_accountKey_loggableData_insertResponse_promiseCompletionBlock___block_invoke_32(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, a2);
}

- (void)validateEnrollmentResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke;
  v18[3] = &unk_24DC8F860;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_34;
  v15[3] = &unk_24DC8EC60;
  v16 = v19;
  v17 = v21;
  v12 = v19;
  v13 = v21;
  v14 = v9;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v18, v15);

}

void __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_33_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending validateEnrollmentResult", v5, 2u);
  }
  objc_msgSend(v3, "validateEnrollmentResult:uuid:completionBlock:", a1[4], a1[5], a1[6]);

}

void __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __60__KTVerifier_validateEnrollmentResult_uuid_completionBlock___block_invoke_34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 0, a2);
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryResponse:(id)a6 updateCompletionBlock:(id)a7
{
  -[KTVerifier convertToSelfRequest:serverDatas:syncedDatas:queryRequest:queryResponse:updateCompletionBlock:](self, "convertToSelfRequest:serverDatas:syncedDatas:queryRequest:queryResponse:updateCompletionBlock:", a3, a4, a5, 0, a6, a7);
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8
{
  -[KTVerifier convertToSelfRequest:serverDatas:syncedDatas:accountKey:queryRequest:queryResponse:updateCompletionBlock:](self, "convertToSelfRequest:serverDatas:syncedDatas:accountKey:queryRequest:queryResponse:updateCompletionBlock:", a3, a4, a5, a6, 0, a7, a8);
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 updateCompletionBlock:(id)a8
{
  -[KTVerifier convertToSelfRequest:serverDatas:syncedDatas:accountKey:queryRequest:queryResponse:updateCompletionBlock:](self, "convertToSelfRequest:serverDatas:syncedDatas:accountKey:queryRequest:queryResponse:updateCompletionBlock:", a3, a4, a5, 0, a6, a7, a8);
}

- (void)convertToSelfRequest:(id)a3 serverDatas:(id)a4 syncedDatas:(id)a5 accountKey:(id)a6 queryRequest:(id)a7 queryResponse:(id)a8 updateCompletionBlock:(id)a9
{
  id v12;
  id v13;
  void *v14;
  id v15;

  v12 = a9;
  v13 = a3;
  NSStringFromSelector(a2);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[KTVerifier unimplementedError:](self, "unimplementedError:", v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void *))a9 + 2))(v12, v13, v14);

}

- (void)forceValidateUUID:(id)a3 uri:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __42__KTVerifier_forceValidateUUID_uri_block___block_invoke;
  v17[3] = &unk_24DC8F860;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_36;
  v15[3] = &unk_24DC8EA78;
  v16 = v20;
  v12 = v20;
  v13 = v9;
  v14 = v8;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v17, v15);

}

void __42__KTVerifier_forceValidateUUID_uri_block___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_35);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending forceValidateUUID(%@)", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(v3, "forceValidateUUID:uri:block:", a1[4], a1[5], a1[6]);

}

void __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __42__KTVerifier_forceValidateUUID_uri_block___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceValidateUUID:(id)a3 uri:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke;
  v18[3] = &unk_24DC8F860;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_38;
  v15[3] = &unk_24DC8EC60;
  v16 = v20;
  v17 = v21;
  v12 = v20;
  v13 = v21;
  v14 = v8;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v18, v15);

}

void __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_37_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending forceValidateUUID(%@)", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(v3, "forceValidateUUID:uri:completionBlock:", a1[4], a1[5], a1[6]);

}

void __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __52__KTVerifier_forceValidateUUID_uri_completionBlock___block_invoke_38(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, 0, 0, a2);
}

- (void)resetRequestToPending:(id)a3 block:(id)a4
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
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__KTVerifier_resetRequestToPending_block___block_invoke;
  v13[3] = &unk_24DC8F8D8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __42__KTVerifier_resetRequestToPending_block___block_invoke_40;
  v11[3] = &unk_24DC8EA78;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v13, v11);

}

void __42__KTVerifier_resetRequestToPending_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_39);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending resetRequestToPending(%@)", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(v3, "resetRequestToPending:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __42__KTVerifier_resetRequestToPending_block___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __42__KTVerifier_resetRequestToPending_block___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearState:(id)a3
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
  v9[2] = __25__KTVerifier_clearState___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __25__KTVerifier_clearState___block_invoke_42;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __25__KTVerifier_clearState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_41);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending clearApplicationState(%{public}@)", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearApplicationState:completionBlock:", v8, *(_QWORD *)(a1 + 40));

}

void __25__KTVerifier_clearState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __25__KTVerifier_clearState___block_invoke_42(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceConfigUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__KTVerifier_forceConfigUpdate___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __32__KTVerifier_forceConfigUpdate___block_invoke_44;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __32__KTVerifier_forceConfigUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_43);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending forceConfigUpdate", v5, 2u);
  }
  objc_msgSend(v3, "forceConfigUpdate:", *(_QWORD *)(a1 + 32));

}

void __32__KTVerifier_forceConfigUpdate___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __32__KTVerifier_forceConfigUpdate___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configurationBagFetch:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__KTVerifier_configurationBagFetch___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __36__KTVerifier_configurationBagFetch___block_invoke_46;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __36__KTVerifier_configurationBagFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_45);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending configurationBagFetch", v5, 2u);
  }
  objc_msgSend(v3, "configurationBagFetch:", *(_QWORD *)(a1 + 32));

}

void __36__KTVerifier_configurationBagFetch___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __36__KTVerifier_configurationBagFetch___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceApplicationKeysFetch:(id)a3
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
  v9[2] = __40__KTVerifier_forceApplicationKeysFetch___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __40__KTVerifier_forceApplicationKeysFetch___block_invoke_48;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __40__KTVerifier_forceApplicationKeysFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_47);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending forceApplicationKeysFetch", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceApplicationKeysFetch:block:", v5, *(_QWORD *)(a1 + 40));

}

void __40__KTVerifier_forceApplicationKeysFetch___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __40__KTVerifier_forceApplicationKeysFetch___block_invoke_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceApplicationConfig:(id)a3
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
  v9[2] = __37__KTVerifier_forceApplicationConfig___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__KTVerifier_forceApplicationConfig___block_invoke_50;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __37__KTVerifier_forceApplicationConfig___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_49);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending forceApplicationConfig", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceApplicationConfig:block:", v5, *(_QWORD *)(a1 + 40));

}

void __37__KTVerifier_forceApplicationConfig___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __37__KTVerifier_forceApplicationConfig___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyApplicationState:(id)a3
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
  v9[2] = __35__KTVerifier_copyApplicationState___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __35__KTVerifier_copyApplicationState___block_invoke_52;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __35__KTVerifier_copyApplicationState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_51);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyApplicationState", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "copyApplicationState:block:", v5, *(_QWORD *)(a1 + 40));

}

void __35__KTVerifier_copyApplicationState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __35__KTVerifier_copyApplicationState___block_invoke_52(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyDataStoreStatistics:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__KTVerifier_copyDataStoreStatistics___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __38__KTVerifier_copyDataStoreStatistics___block_invoke_54;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __38__KTVerifier_copyDataStoreStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_53);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyDataStoreStatistics", v5, 2u);
  }
  objc_msgSend(v3, "copyDataStoreStatistics:", *(_QWORD *)(a1 + 32));

}

void __38__KTVerifier_copyDataStoreStatistics___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __38__KTVerifier_copyDataStoreStatistics___block_invoke_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyKeyStoreState:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __32__KTVerifier_copyKeyStoreState___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __32__KTVerifier_copyKeyStoreState___block_invoke_56;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __32__KTVerifier_copyKeyStoreState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_55);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyKeyStoreState", v5, 2u);
  }
  objc_msgSend(v3, "copyKeyStoreState:", *(_QWORD *)(a1 + 32));

}

void __32__KTVerifier_copyKeyStoreState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __32__KTVerifier_copyKeyStoreState___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyKeyStoreStateFromDisk:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_58;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_57);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyKeyStoreStateFromDisk", v5, 2u);
  }
  objc_msgSend(v3, "copyKeyStoreStateFromDisk:", *(_QWORD *)(a1 + 32));

}

void __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __40__KTVerifier_copyKeyStoreStateFromDisk___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceDutyCycle:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __29__KTVerifier_forceDutyCycle___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __29__KTVerifier_forceDutyCycle___block_invoke_60;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __29__KTVerifier_forceDutyCycle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_59);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending runDutyCycle", v5, 2u);
  }
  objc_msgSend(v3, "runDutyCycle:", *(_QWORD *)(a1 + 32));

}

void __29__KTVerifier_forceDutyCycle___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __29__KTVerifier_forceDutyCycle___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceCloudConfigUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2_63;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __37__KTVerifier_forceCloudConfigUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_61);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending updateCloudConfigurationStore", buf, 2u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__KTVerifier_forceCloudConfigUpdate___block_invoke_62;
  v5[3] = &unk_24DC8EA78;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "updateCloudConfigurationStore:", v5);

}

void __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __37__KTVerifier_forceCloudConfigUpdate___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__KTVerifier_forceCloudConfigUpdate___block_invoke_2_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyDeviceStatus:(id)a3 complete:(id)a4
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
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke;
  v13[3] = &unk_24DC8F8D8;
  v14 = v6;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2_67;
  v11[3] = &unk_24DC8EA78;
  v12 = v15;
  v9 = v15;
  v10 = v6;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v13, v11);

}

void __40__KTVerifier_copyDeviceStatus_complete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_64);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v5;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyDeviceStatus for %@", buf, 0xCu);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__KTVerifier_copyDeviceStatus_complete___block_invoke_65;
  v7[3] = &unk_24DC8F928;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "copyDeviceStatus:complete:", v6, v7);

}

void __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __40__KTVerifier_copyDeviceStatus_complete___block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __40__KTVerifier_copyDeviceStatus_complete___block_invoke_2_67(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyLogClientConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__KTVerifier_copyLogClientConfiguration___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __41__KTVerifier_copyLogClientConfiguration___block_invoke_69;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __41__KTVerifier_copyLogClientConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_68);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyLogClientConfiguration", v5, 2u);
  }
  objc_msgSend(v3, "copyLogClientConfiguration:", *(_QWORD *)(a1 + 32));

}

void __41__KTVerifier_copyLogClientConfiguration___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __41__KTVerifier_copyLogClientConfiguration___block_invoke_69(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearLogClientConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__KTVerifier_clearLogClientConfiguration___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __42__KTVerifier_clearLogClientConfiguration___block_invoke_71;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __42__KTVerifier_clearLogClientConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_70);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyLogClientConfiguration", v5, 2u);
  }
  objc_msgSend(v3, "clearLogClientConfiguration:", *(_QWORD *)(a1 + 32));

}

void __42__KTVerifier_clearLogClientConfiguration___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __42__KTVerifier_clearLogClientConfiguration___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearPublicKeyStoreState:(id)a3
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
  v9[2] = __39__KTVerifier_clearPublicKeyStoreState___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __39__KTVerifier_clearPublicKeyStoreState___block_invoke_73;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __39__KTVerifier_clearPublicKeyStoreState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_72);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending clearPublicKeyStoreState", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearPublicKeyStoreState:block:", v5, *(_QWORD *)(a1 + 40));

}

void __39__KTVerifier_clearPublicKeyStoreState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __39__KTVerifier_clearPublicKeyStoreState___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyDaemonState:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __30__KTVerifier_copyDaemonState___block_invoke;
  v9[3] = &unk_24DC8F900;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __30__KTVerifier_copyDaemonState___block_invoke_75;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __30__KTVerifier_copyDaemonState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_74);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyDaemonState", v5, 2u);
  }
  objc_msgSend(v3, "copyDaemonState:", *(_QWORD *)(a1 + 32));

}

void __30__KTVerifier_copyDaemonState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __30__KTVerifier_copyDaemonState___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)copyApplicationTranscript:(id)a3
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
  v9[2] = __40__KTVerifier_copyApplicationTranscript___block_invoke;
  v9[3] = &unk_24DC8F8D8;
  v9[4] = self;
  v10 = v4;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __40__KTVerifier_copyApplicationTranscript___block_invoke_77;
  v7[3] = &unk_24DC8EA78;
  v8 = v10;
  v6 = v10;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v9, v7);

}

void __40__KTVerifier_copyApplicationTranscript___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_76);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending copyApplicationTranscript", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "copyApplicationTranscript:block:", v5, *(_QWORD *)(a1 + 40));

}

void __40__KTVerifier_copyApplicationTranscript___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __40__KTVerifier_copyApplicationTranscript___block_invoke_77(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)ignoreFailure:(id)a3 uuid:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  v27 = 0;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke;
  v18[3] = &unk_24DC8F970;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  v21 = &v22;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2_80;
  v17[3] = &unk_24DC8F078;
  v17[4] = &v22;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v18, v17);
  v13 = v23;
  if (a5)
  {
    v14 = (void *)v23[5];
    if (v14)
    {
      *a5 = objc_retainAutorelease(v14);
      v13 = v23;
    }
  }
  v15 = v13[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_78);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = a1[5];
    *(_DWORD *)buf = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending synchronous ignoreFailure for %@, request id %@", buf, 0x16u);
  }
  v7 = a1[4];
  v8 = a1[5];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_79;
  v9[3] = &unk_24DC8F078;
  v9[4] = a1[6];
  objc_msgSend(v3, "ignoreFailure:uuid:completionBlock:", v7, v8, v9);

}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_79(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __39__KTVerifier_ignoreFailure_uuid_error___block_invoke_2_80(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void)batchQuery:(id)a3 userInitiated:(BOOL)a4 block:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  KTVerifier *v17;
  id v18;
  BOOL v19;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke;
  v15[3] = &unk_24DC8F888;
  v16 = v8;
  v17 = self;
  v19 = a4;
  v18 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2_84;
  v13[3] = &unk_24DC8EA78;
  v14 = v18;
  v11 = v18;
  v12 = v8;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v15, v13);

}

void __45__KTVerifier_batchQuery_userInitiated_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_81_0);
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A250000, v4, OS_LOG_TYPE_INFO, "Sending batchQuery", buf, 2u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_82;
  v8[3] = &unk_24DC8F998;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "fetchBatchQuery:application:userInitiated:completionHandler:", v5, v6, v7, v8);

}

void __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_82(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __45__KTVerifier_batchQuery_userInitiated_block___block_invoke_2_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)validatePeers:(id)a3 fetchNow:(BOOL)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  KTVerifier *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  KTVerifier *v19;
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke;
  v17[3] = &unk_24DC8F888;
  v18 = v8;
  v19 = self;
  v21 = a4;
  v20 = v9;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_88;
  v13[3] = &unk_24DC8F9C0;
  v14 = v18;
  v15 = self;
  v16 = v20;
  v11 = v20;
  v12 = v18;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v17, v13);

}

void __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_85);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending validatePeers for uris: %@", (uint8_t *)&v11, 0xCu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "validatePeers:application:fetchNow:completionBlock:", v9, v10, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __53__KTVerifier_validatePeers_fetchNow_completionBlock___block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  KTVerifierResult *v10;
  void *v11;
  KTVerifierResult *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [KTVerifierResult alloc];
        objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[KTVerifierResult initWithUri:application:failure:](v10, "initWithUri:application:failure:", v9, v11, v3);
        objc_msgSend(v4, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getCachedValidatePeerResults:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  KTVerifier *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  KTVerifier *v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke;
  v15[3] = &unk_24DC8F860;
  v16 = v6;
  v17 = self;
  v18 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_91;
  v11[3] = &unk_24DC8F9C0;
  v12 = v16;
  v13 = self;
  v14 = v18;
  v9 = v18;
  v10 = v16;
  -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v15, v11);

}

void __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_90);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending getCachedValidatePeerResults for uris: %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getCachedValidatePeerResults:application:completionBlock:", v8, v9, *(_QWORD *)(a1 + 48));

}

void __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __59__KTVerifier_getCachedValidatePeerResults_completionBlock___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  KTVerifierResult *v10;
  void *v11;
  KTVerifierResult *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = [KTVerifierResult alloc];
        objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[KTVerifierResult initWithUri:application:failure:](v10, "initWithUri:application:failure:", v9, v11, v3);
        objc_msgSend(v4, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)initiateQueryForUris:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  KTVerifier *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke;
    v11[3] = &unk_24DC8F860;
    v12 = v6;
    v13 = self;
    v14 = v7;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2_96;
    v9[3] = &unk_24DC8EA78;
    v10 = v14;
    -[KTVerifier invokeXPCAsynchronousCallWithBlock:failureBlock:](self, "invokeXPCAsynchronousCallWithBlock:failureBlock:", v11, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_92);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending initiateQueryForUris for %@", buf, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_95;
  v10[3] = &unk_24DC8EA78;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v3, "initiateQueryForUris:application:completionBlock:", v8, v9, v10);

}

void __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_95(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __51__KTVerifier_initiateQueryForUris_completionBlock___block_invoke_2_96(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)urisFromResults:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "uri", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)markFailureSeenForResults:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v7 = MEMORY[0x24BDAC760];
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke;
  v14[3] = &unk_24DC8F970;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v16 = &v17;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2_99;
  v13[3] = &unk_24DC8F078;
  v13[4] = &v17;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v14, v13);
  v9 = v18;
  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v18;
    }
  }
  v11 = v9[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_97);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "urisFromResults:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending synchronous markFailureSeenForUris for %@", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __46__KTVerifier_markFailureSeenForResults_error___block_invoke_98;
  v12[3] = &unk_24DC8F078;
  v12[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "markFailureSeenForResults:application:completionBlock:", v10, v11, v12);

}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke_98(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __46__KTVerifier_markFailureSeenForResults_error___block_invoke_2_99(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (BOOL)ignoreFailureForResults:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v7 = MEMORY[0x24BDAC760];
  v22 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke;
  v14[3] = &unk_24DC8F970;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v16 = &v17;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2_102;
  v13[3] = &unk_24DC8F078;
  v13[4] = &v17;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v14, v13);
  v9 = v18;
  if (a4)
  {
    v10 = (void *)v18[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v18;
    }
  }
  v11 = v9[5] == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_100_0);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "urisFromResults:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_21A250000, v7, OS_LOG_TYPE_INFO, "Sending synchronous ignoreFailureForResults for %@", buf, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__KTVerifier_ignoreFailureForResults_error___block_invoke_101;
  v12[3] = &unk_24DC8F078;
  v12[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "ignoreFailureForResults:application:completionBlock:", v10, v11, v12);

}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke_101(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __44__KTVerifier_ignoreFailureForResults_error___block_invoke_2_102(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

+ (id)getUIStatusPriority:(unint64_t)a3
{
  if (a3 > 0xD)
    return &unk_24DC9C490;
  else
    return (id)qword_24DC8FA40[a3];
}

- (unint64_t)getDisplayStatusForResults:(id)a3 isSelfOptedIn:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "uiStatus", (_QWORD)v19));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_121);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntValue");

    }
    else
    {
      if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
        dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_117);
      v17 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
      if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21A250000, v17, OS_LOG_TYPE_ERROR, "Attempting to get display status for results, but no results were provided. Service is therefore unavailable.", buf, 2u);
      }
      v16 = 0;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

void __55__KTVerifier_getDisplayStatusForResults_isSelfOptedIn___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

uint64_t __55__KTVerifier_getDisplayStatusForResults_isSelfOptedIn___block_invoke_119(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  +[KTVerifier getUIStatusPriority:](KTVerifier, "getUIStatusPriority:", objc_msgSend(a2, "unsignedIntValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "unsignedIntValue");

  +[KTVerifier getUIStatusPriority:](KTVerifier, "getUIStatusPriority:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (BOOL)clearPeerCache:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  KTVerifier *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __35__KTVerifier_clearPeerCache_error___block_invoke;
  v14[3] = &unk_24DC8F970;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v17 = &v18;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __35__KTVerifier_clearPeerCache_error___block_invoke_2_125;
  v13[3] = &unk_24DC8F078;
  v13[4] = &v18;
  -[KTVerifier invokeXPCSynchronousCallWithBlock:failureBlock:](self, "invokeXPCSynchronousCallWithBlock:failureBlock:", v14, v13);
  v9 = v19;
  if (a4)
  {
    v10 = (void *)v19[5];
    if (v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v9 = v19;
    }
  }
  v11 = v9[5] == 0;

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __35__KTVerifier_clearPeerCache_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_7 != -1)
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_7, &__block_literal_global_123);
  v4 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_21A250000, v6, OS_LOG_TYPE_INFO, "Sending synchronous clearPeerCache for %@", buf, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__KTVerifier_clearPeerCache_error___block_invoke_124;
  v10[3] = &unk_24DC8F078;
  v10[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "clearPeerCache:application:completionBlock:", v8, v9, v10);

}

void __35__KTVerifier_clearPeerCache_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "default");
  v1 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_7;
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_7 = (uint64_t)v0;

}

void __35__KTVerifier_clearPeerCache_error___block_invoke_124(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __35__KTVerifier_clearPeerCache_error___block_invoke_2_125(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (TransparencyApplication)application
{
  return (TransparencyApplication *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end
