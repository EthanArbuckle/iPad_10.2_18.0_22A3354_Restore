@implementation MCCSecretAgentController

- (MCCSecretAgentController)init
{
  return -[MCCSecretAgentController initWithAgentXPCEndpoint:](self, "initWithAgentXPCEndpoint:", 0);
}

- (MCCSecretAgentController)initWithCallbackListener:(id)a3
{
  id v5;
  MCCSecretAgentController *v6;
  MCCSecretAgentController *v7;

  v5 = a3;
  v6 = -[MCCSecretAgentController initWithAgentXPCEndpoint:](self, "initWithAgentXPCEndpoint:", 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callbackListener, a3);
    -[NSXPCListener resume](v7->_callbackListener, "resume");
  }

  return v7;
}

- (MCCSecretAgentController)initWithAgentXPCEndpoint:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  MCCSecretAgentConnection *v6;
  MCCSecretAgentConnection *agentConnection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCCSecretAgentController;
  v5 = -[MCCSecretAgentController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[MCCSecretAgentConnection initWithListenerEndpoint:]([MCCSecretAgentConnection alloc], "initWithListenerEndpoint:", v4);
    agentConnection = v5->_agentConnection;
    v5->_agentConnection = v6;

  }
  return v5;
}

- (void)generateCertificateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke;
  v20[3] = &unk_251C89A50;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_1;
  v16[3] = &unk_251C89A78;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "generateCertificateWithContext:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_24B68B000, v4, OS_LOG_TYPE_DEFAULT, "Remote secret agent genenrateCertificate call with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listCertificatesWithCompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke;
  v17[3] = &unk_251C89AA0;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_3;
  v13[3] = &unk_251C89AC8;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "listCertificatesWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _MCCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_24B68B000, v7, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listCertificatesForEmail:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke;
  v20[3] = &unk_251C89AA0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_4;
  v16[3] = &unk_251C89AC8;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "listCertificatesForEmail:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _MCCLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_24B68B000, v7, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificatesForEmail call results %@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSigningAndEncryptingStatusForEmailAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke;
  v20[3] = &unk_251C89AF0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6;
  v16[3] = &unk_251C89B18;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "fetchSigningAndEncryptingStatusForEmailAddress:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6_cold_1(a2, (uint64_t)v5, v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchSigningAndEncrytionMessagesStatusForEmailAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke;
  v20[3] = &unk_251C89B40;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8;
  v16[3] = &unk_251C89B68;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "fetchSigningAndEncrytionMessagesStatusForEmailAddress:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MCCLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setEncryptIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MCCSecretAgentController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  MCCSecretAgentConnection *agentConnection;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  MCCSecretAgentController *v26;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v10 = self;
  v11 = MEMORY[0x24BDAC760];
  v26 = v10;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke;
  v22[3] = &unk_251C89A50;
  v24 = v25;
  v12 = v9;
  v23 = v12;
  v13 = (void *)MEMORY[0x24BD248D0](v22);
  agentConnection = v10->_agentConnection;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2;
  v20[3] = &unk_251C89A78;
  v15 = v13;
  v21 = v15;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9;
  v18[3] = &unk_251C89A78;
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "setEncryptIsEnabled:forEmailAddress:completion:", v6, v8, v18);

  _Block_object_dispose(v25, 8);
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _MCCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setSignIsEnabled:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MCCSecretAgentController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  MCCSecretAgentConnection *agentConnection;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  MCCSecretAgentController *v26;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v10 = self;
  v11 = MEMORY[0x24BDAC760];
  v26 = v10;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke;
  v22[3] = &unk_251C89A50;
  v24 = v25;
  v12 = v9;
  v23 = v12;
  v13 = (void *)MEMORY[0x24BD248D0](v22);
  agentConnection = v10->_agentConnection;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2;
  v20[3] = &unk_251C89A78;
  v15 = v13;
  v21 = v15;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10;
  v18[3] = &unk_251C89A78;
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "setSignIsEnabled:forEmailAddress:completion:", v6, v8, v18);

  _Block_object_dispose(v25, 8);
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _MCCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)setSigningAndEncrytingStatusTo:(BOOL)a3 forEmailAddress:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  MCCSecretAgentController *v10;
  uint64_t v11;
  id v12;
  void *v13;
  MCCSecretAgentConnection *agentConnection;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  MCCSecretAgentController *v26;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  v10 = self;
  v11 = MEMORY[0x24BDAC760];
  v26 = v10;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke;
  v22[3] = &unk_251C89A50;
  v24 = v25;
  v12 = v9;
  v23 = v12;
  v13 = (void *)MEMORY[0x24BD248D0](v22);
  agentConnection = v10->_agentConnection;
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2;
  v20[3] = &unk_251C89A78;
  v15 = v13;
  v21 = v15;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11;
  v18[3] = &unk_251C89A78;
  v17 = v15;
  v19 = v17;
  objc_msgSend(v16, "setSigningAndEncrytingStatusTo:forEmailAddress:completion:", v6, v8, v18);

  _Block_object_dispose(v25, 8);
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _MCCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)updateCertificateDefaultsForEmailAddress:(id)a3 certInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCCSecretAgentController *v11;
  uint64_t v12;
  id v13;
  void *v14;
  MCCSecretAgentConnection *agentConnection;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  MCCSecretAgentController *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v11 = self;
  v12 = MEMORY[0x24BDAC760];
  v27 = v11;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke;
  v23[3] = &unk_251C89A50;
  v25 = v26;
  v13 = v10;
  v24 = v13;
  v14 = (void *)MEMORY[0x24BD248D0](v23);
  agentConnection = v11->_agentConnection;
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2;
  v21[3] = &unk_251C89A78;
  v16 = v14;
  v22 = v16;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12;
  v19[3] = &unk_251C89A78;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "updateCertificateDefaultsForEmailAddress:certInfo:completion:", v8, v9, v19);

  _Block_object_dispose(v26, 8);
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _MCCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)refreshCertificateWithContext:(id)a3 certId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCCSecretAgentController *v11;
  uint64_t v12;
  id v13;
  void *v14;
  MCCSecretAgentConnection *agentConnection;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  _QWORD v26[5];
  MCCSecretAgentController *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v11 = self;
  v12 = MEMORY[0x24BDAC760];
  v27 = v11;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke;
  v23[3] = &unk_251C89AA0;
  v25 = v26;
  v13 = v10;
  v24 = v13;
  v14 = (void *)MEMORY[0x24BD248D0](v23);
  agentConnection = v11->_agentConnection;
  v21[0] = v12;
  v21[1] = 3221225472;
  v21[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2;
  v21[3] = &unk_251C89A78;
  v16 = v14;
  v22 = v16;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13;
  v19[3] = &unk_251C89AC8;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v17, "refreshCertificateWithContext:certId:completion:", v8, v9, v19);

  _Block_object_dispose(v26, 8);
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _MCCLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)predictCommerceEmailWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke;
  v20[3] = &unk_251C89B90;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15;
  v16[3] = &unk_251C89BB8;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "predictCommerceEmailWithContext:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _MCCLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)registerCategoryRulesCallback
{
  id v3;

  -[NSXPCListener endpoint](self->_callbackListener, "endpoint");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MCCSecretAgentController registerCategoryRulesCallbackListener:completion:](self, "registerCategoryRulesCallbackListener:completion:", v3, &__block_literal_global_0);

}

void __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    _MCCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke_cold_1();

  }
}

- (void)registerCategoryRulesCallbackListener:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke;
  v20[3] = &unk_251C89AF0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16;
  v16[3] = &unk_251C89B18;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "registerCategoryRulesCallbackListener:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)createWebRule:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke;
  v20[3] = &unk_251C89AF0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __53__MCCSecretAgentController_createWebRule_completion___block_invoke_17;
  v16[3] = &unk_251C89B18;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "createWebRule:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__MCCSecretAgentController_createWebRule_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__MCCSecretAgentController_createWebRule_completion___block_invoke_17_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)notifyWebRule:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[5];
  MCCSecretAgentController *v24;

  v6 = a3;
  v7 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v24 = v8;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke;
  v20[3] = &unk_251C89AF0;
  v22 = v23;
  v10 = v7;
  v21 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v20);
  agentConnection = v8->_agentConnection;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2;
  v18[3] = &unk_251C89A78;
  v13 = v11;
  v19 = v13;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_18;
  v16[3] = &unk_251C89B18;
  v15 = v13;
  v17 = v15;
  objc_msgSend(v14, "notifyWebRule:completion:", v6, v16);

  _Block_object_dispose(v23, 8);
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_18_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)sendPendingRulesWithCompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke;
  v17[3] = &unk_251C89AF0;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_19;
  v13[3] = &unk_251C89B18;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "sendPendingRulesWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_19_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)isModelReadyWithCompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke;
  v17[3] = &unk_251C89AF0;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_20;
  v13[3] = &unk_251C89B18;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "isModelReadyWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __55__MCCSecretAgentController_isModelReadyWithCompletion___block_invoke_20(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_24B68B000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)invokeModelDownloadWithCompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke;
  v17[3] = &unk_251C89AF0;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_21;
  v13[3] = &unk_251C89B18;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "invokeModelDownloadWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__MCCSecretAgentController_invokeModelDownloadWithCompletion___block_invoke_21(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_24B68B000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent listCertificates call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)syncToWeb:(id)a3
{
  MCCSecretAgentConnection *agentConnection;
  id v4;
  id v5;

  agentConnection = self->_agentConnection;
  v4 = a3;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_22);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncToWeb:", v4);

}

void __38__MCCSecretAgentController_syncToWeb___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _MCCLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__MCCSecretAgentController_syncToWeb___block_invoke_cold_1();

}

- (void)getIABCategoryID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  MCCSecretAgentConnection *agentConnection;
  id v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD v27[5];
  MCCSecretAgentController *v28;

  v6 = a3;
  v7 = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v28 = v8;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke;
  v24[3] = &unk_251C89C60;
  v26 = v27;
  v10 = v7;
  v25 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v24);
  v12 = dispatch_semaphore_create(0);
  agentConnection = v8->_agentConnection;
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2;
  v21[3] = &unk_251C89C88;
  v14 = v11;
  v23 = v14;
  v15 = v12;
  v22 = v15;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_24;
    v18[3] = &unk_251C89CB0;
    v20 = v14;
    v17 = v15;
    v19 = v17;
    objc_msgSend(v16, "getIABCategoryID:completion:", v6, v18);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  }
  _Block_object_dispose(v27, 8);

}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_24_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)isPersonalDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MCCSecretAgentController *v8;
  uint64_t v9;
  id v10;
  void *v11;
  MCCSecretAgentConnection *agentConnection;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  MCCSecretAgentController *v23;

  v6 = a3;
  v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy_;
  v22[4] = __Block_byref_object_dispose_;
  v8 = self;
  v9 = MEMORY[0x24BDAC760];
  v23 = v8;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke;
  v19[3] = &unk_251C89AF0;
  v21 = v22;
  v10 = v7;
  v20 = v10;
  v11 = (void *)MEMORY[0x24BD248D0](v19);
  agentConnection = v8->_agentConnection;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2;
  v17[3] = &unk_251C89A78;
  v13 = v11;
  v18 = v13;
  -[MCCSecretAgentConnection remoteObjectProxyWithErrorHandler:](agentConnection, "remoteObjectProxyWithErrorHandler:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_25;
    v15[3] = &unk_251C89B18;
    v16 = v13;
    objc_msgSend(v14, "isPersonalDomain:completion:", v6, v15);

  }
  _Block_object_dispose(v22, 8);

}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_25(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    _MCCLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109378;
      v7[1] = a2;
      v8 = 2114;
      v9 = v5;
      _os_log_impl(&dword_24B68B000, v6, OS_LOG_TYPE_DEFAULT, "Remote secret agent isPersonalDomain call results %d with error: %{public}@", (uint8_t *)v7, 0x12u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getBlackPearlVersionWithCompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke;
  v17[3] = &unk_251C89B90;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_26;
  v13[3] = &unk_251C89BB8;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "getBlackPearlVersionWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    _MCCLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_26_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)pingWithcompletion:(id)a3
{
  id v4;
  MCCSecretAgentController *v5;
  uint64_t v6;
  id v7;
  void *v8;
  MCCSecretAgentConnection *agentConnection;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  MCCSecretAgentController *v21;

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy_;
  v20[4] = __Block_byref_object_dispose_;
  v5 = self;
  v6 = MEMORY[0x24BDAC760];
  v21 = v5;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke;
  v17[3] = &unk_251C89AF0;
  v19 = v20;
  v7 = v4;
  v18 = v7;
  v8 = (void *)MEMORY[0x24BD248D0](v17);
  agentConnection = v5->_agentConnection;
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2;
  v15[3] = &unk_251C89A78;
  v10 = v8;
  v16 = v10;
  -[MCCSecretAgentConnection synchronousRemoteObjectProxyWithErrorHandler:](agentConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __47__MCCSecretAgentController_pingWithcompletion___block_invoke_27;
  v13[3] = &unk_251C89B18;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "pingWithcompletion:", v13);

  _Block_object_dispose(v20, 8);
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _MCCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    _MCCLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_24B68B000, v5, OS_LOG_TYPE_DEFAULT, "Remote secret agent ping gave error: %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackListener, 0);
  objc_storeStrong((id *)&self->_agentConnection, 0);
}

void __70__MCCSecretAgentController_generateCertificateWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to generate cert returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__MCCSecretAgentController_listCertificatesWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to list certificates returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __64__MCCSecretAgentController_listCertificatesForEmail_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to list certificates for Email returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to fetch SigningAndEncrypting Status returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __86__MCCSecretAgentController_fetchSigningAndEncryptingStatusForEmailAddress_completion___block_invoke_6_cold_1(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2114;
  v5 = a2;
  _os_log_error_impl(&dword_24B68B000, log, OS_LOG_TYPE_ERROR, "Remote secret agent fetchSigningAndEncryptingStatusForEmailAddress results %d with error: %{public}@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to fetch Sign and Encrypt Status returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __93__MCCSecretAgentController_fetchSigningAndEncrytionMessagesStatusForEmailAddress_completion___block_invoke_8_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_24B68B000, v1, OS_LOG_TYPE_ERROR, "Remote secret agent fetch Sign and Encrypt messages status call results %@ with error: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to set encryption status returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __75__MCCSecretAgentController_setEncryptIsEnabled_forEmailAddress_completion___block_invoke_9_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent setEncryptisEnabled call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to set signing status returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__MCCSecretAgentController_setSignIsEnabled_forEmailAddress_completion___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent setSignIsEnabled call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to set SigningAndEncrypting status returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __86__MCCSecretAgentController_setSigningAndEncrytingStatusTo_forEmailAddress_completion___block_invoke_11_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent setSigningAndEncrytingStatusTo call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to update user defaults with certificates returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __89__MCCSecretAgentController_updateCertificateDefaultsForEmailAddress_certInfo_completion___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent updateCertificateDefaults call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "RefreshCertificate Initiation of remote secret agent service to refresh certificate returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __76__MCCSecretAgentController_refreshCertificateWithContext_certId_completion___block_invoke_13_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "RefreshCertificate Remote secret agent refreshCertificate call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Predict commercial email: Initiation of remote secret agent service to predice commerce email returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __71__MCCSecretAgentController_predictCommerceEmailWithContext_completion___block_invoke_15_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent predict commerce call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __57__MCCSecretAgentController_registerCategoryRulesCallback__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent register for rules callback with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Failed to register rules callback with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __77__MCCSecretAgentController_registerCategoryRulesCallbackListener_completion___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote register-rules callback listener with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Failed to add web rule with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53__MCCSecretAgentController_createWebRule_completion___block_invoke_17_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote add web rule with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Failed to notify web rule with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53__MCCSecretAgentController_notifyWebRule_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote notify web rule with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Failed to send pending rules with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__MCCSecretAgentController_sendPendingRulesWithCompletion___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote send pending rules error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__MCCSecretAgentController_syncToWeb___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to sync recategorization rules returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Get IAB category domain: Initiation of remote secret agent service getIABCategoryID returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__MCCSecretAgentController_getIABCategoryID_completion___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent get IAB category call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __56__MCCSecretAgentController_isPersonalDomain_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Initiation of remote secret agent service to check is personal domain returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__MCCSecretAgentController_getBlackPearlVersionWithCompletion___block_invoke_26_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Remote secret agent get blackpearl version call with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __47__MCCSecretAgentController_pingWithcompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_24B68B000, v0, v1, "Tried to ping, returned an error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
