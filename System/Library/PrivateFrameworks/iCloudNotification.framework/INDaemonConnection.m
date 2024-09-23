@implementation INDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (INDaemonConnection)init
{
  INDaemonConnection *v2;
  uint64_t v3;
  NSXPCConnection *connection;
  void *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INDaemonConnection;
  v2 = -[INDaemonConnection init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ind.xpc"), 0);
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    +[INDaemonInterface XPCInterface](INDaemonInterface, "XPCInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection setInterruptionHandler:](v2->_connection, "setInterruptionHandler:", &__block_literal_global);
    -[NSXPCConnection setInvalidationHandler:](v2->_connection, "setInvalidationHandler:", &__block_literal_global_6);
    _INLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[INDaemonConnection init].cold.1();

    -[NSXPCConnection resume](v2->_connection, "resume");
  }
  return v2;
}

- (void)iCloudServerOfferForAccount:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *connection;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  INDaemonConnection *v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = self;
  connection = v25->_connection;
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke;
  v21[3] = &unk_24DA63260;
  v13 = v10;
  v22 = v13;
  v23 = v24;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection diagnosticReport].cold.1();

  objc_msgSend(v8, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke_21;
  v18[3] = &unk_24DA632B0;
  v17 = v13;
  v19 = v17;
  v20 = v24;
  objc_msgSend(v14, "iCloudServerOfferForAccountWithID:options:completion:", v16, v9, v18);

  _Block_object_dispose(v24, 8);
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_219044000, v0, v1, "Closing connection to ind...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  id v6;
  INDaemonConnection *v7;
  NSObject *v8;
  NSXPCConnection *connection;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  INDaemonConnection *v22;
  uint8_t buf[4];
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v7 = self;
  v22 = v7;
  _INLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = a3;
    _os_log_impl(&dword_219044000, v8, OS_LOG_TYPE_DEFAULT, "Received notification of device storage level %ld", buf, 0xCu);
  }

  connection = v7->_connection;
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke;
  v18[3] = &unk_24DA63260;
  v11 = v6;
  v19 = v11;
  v20 = v21;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection diagnosticReport].cold.1();

  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_29;
  v15[3] = &unk_24DA63288;
  v14 = v11;
  v16 = v14;
  v17 = v21;
  objc_msgSend(v12, "notifyDeviceStorageLevel:completion:", a3, v15);

  _Block_object_dispose(v21, 8);
}

void __26__INDaemonConnection_init__block_invoke()
{
  NSObject *v0;

  _INLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__INDaemonConnection_init__block_invoke_cold_1();

}

void __26__INDaemonConnection_init__block_invoke_5()
{
  NSObject *v0;

  _INLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __26__INDaemonConnection_init__block_invoke_5_cold_1();

}

- (BOOL)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  BOOL v26;
  _QWORD v28[4];
  id v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  const __CFString *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v9 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke;
  v30[3] = &unk_24DA63198;
  v30[4] = &v37;
  v30[5] = &v31;
  v10 = (void *)MEMORY[0x219A28940](v30);
  connection = self->_connection;
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke_2;
  v28[3] = &unk_24DA631C0;
  v12 = v10;
  v29 = v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection registerAccount:foriCloudNotificationsWithReason:error:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(v8, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerAccountWithID:foriCloudNotificationsWithReason:completion:", v22, a4, v12);

  if (a5)
    *a5 = objc_retainAutorelease((id)v32[5]);
  _INLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v38 + 24))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v25 = v32[5];
    *(_DWORD *)buf = 138412546;
    v42 = v24;
    v43 = 2112;
    v44 = v25;
    _os_log_impl(&dword_219044000, v23, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", buf, 0x16u);
  }

  v26 = *((_BYTE *)v38 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  return v26;
}

void __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __77__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerAccount:(id)a3 foriCloudNotificationsWithReason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSXPCConnection *connection;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;

  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke;
  v27[3] = &unk_24DA631E8;
  v10 = v8;
  v27[4] = self;
  v28 = v10;
  v11 = a3;
  v12 = (void *)MEMORY[0x219A28940](v27);
  connection = self->_connection;
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke_15;
  v25[3] = &unk_24DA631C0;
  v26 = v12;
  v14 = v12;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection registerAccount:foriCloudNotificationsWithReason:completion:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

  objc_msgSend(v11, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "registerAccountWithID:foriCloudNotificationsWithReason:completion:", v24, a4, v14);
}

void __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_219044000, v6, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

uint64_t __82__INDaemonConnection_registerAccount_foriCloudNotificationsWithReason_completion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)unregisterAccount:(id)a3 fromiCloudNotificationsWithError:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  NSXPCConnection *connection;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const __CFString *v22;
  uint64_t v23;
  BOOL v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v7 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke;
  v28[3] = &unk_24DA63198;
  v28[4] = &v35;
  v28[5] = &v29;
  v8 = (void *)MEMORY[0x219A28940](v28);
  connection = self->_connection;
  v26[0] = v7;
  v26[1] = 3221225472;
  v26[2] = __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke_2;
  v26[3] = &unk_24DA631C0;
  v10 = v8;
  v27 = v10;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection unregisterAccount:fromiCloudNotificationsWithError:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  objc_msgSend(v6, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unregisterAccountWithID:fromiCloudNotificationsWithCompletion:", v20, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v30[5]);
  _INLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (*((_BYTE *)v36 + 24))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v23 = v30[5];
    *(_DWORD *)buf = 138412546;
    v40 = v22;
    v41 = 2112;
    v42 = v23;
    _os_log_impl(&dword_219044000, v21, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", buf, 0x16u);
  }

  v24 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v24;
}

void __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

uint64_t __73__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterAccount:(id)a3 fromiCloudNotificationsWithCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  NSXPCConnection *connection;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke;
  v25[3] = &unk_24DA631E8;
  v8 = v6;
  v25[4] = self;
  v26 = v8;
  v9 = a3;
  v10 = (void *)MEMORY[0x219A28940](v25);
  connection = self->_connection;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke_16;
  v23[3] = &unk_24DA631C0;
  v24 = v10;
  v12 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection unregisterAccount:fromiCloudNotificationsWithCompletion:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(v9, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "unregisterAccountWithID:fromiCloudNotificationsWithCompletion:", v22, v12);
}

void __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_219044000, v6, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

uint64_t __78__INDaemonConnection_unregisterAccount_fromiCloudNotificationsWithCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)teardownOffersForAccount:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  connection = self->_connection;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __62__INDaemonConnection_teardownOffersForAccount_withCompletion___block_invoke;
  v19[3] = &unk_24DA631C0;
  v20 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection teardownOffersForAccount:withCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v10, "teardownOffersForAccount:withCompletion:", v9, v8);
}

uint64_t __62__INDaemonConnection_teardownOffersForAccount_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)clearAllRegistrationDigestsWithError:(id *)a3
{
  INDaemonConnection *v4;
  uint64_t v5;
  void *v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  _QWORD v25[7];
  _QWORD v26[5];
  INDaemonConnection *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v4 = self;
  v27 = v4;
  v5 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke;
  v25[3] = &unk_24DA63210;
  v25[4] = &v34;
  v25[5] = &v28;
  v25[6] = v26;
  v6 = (void *)MEMORY[0x219A28940](v25);
  connection = v4->_connection;
  v20 = v5;
  v21 = 3221225472;
  v22 = __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_17;
  v23 = &unk_24DA631C0;
  v8 = v6;
  v24 = v8;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection clearAllRegistrationDigestsWithError:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  objc_msgSend(v9, "clearAllRegistrationDigestsWithCompletion:", v8, v20, v21, v22, v23);
  if (a3)
    *a3 = objc_retainAutorelease((id)v29[5]);
  v18 = *((_BYTE *)v35 + 24);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v18;
}

void __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (v5)
  {
    _INLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_cold_1();

  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(a1[6] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

uint64_t __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)diagnosticReport
{
  INDaemonConnection *v2;
  uint64_t v3;
  void *v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[6];
  _QWORD v14[5];
  INDaemonConnection *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  v2 = self;
  v15 = v2;
  v3 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __38__INDaemonConnection_diagnosticReport__block_invoke;
  v13[3] = &unk_24DA63238;
  v13[4] = &v16;
  v13[5] = v14;
  v4 = (void *)MEMORY[0x219A28940](v13);
  connection = v2->_connection;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __38__INDaemonConnection_diagnosticReport__block_invoke_19;
  v11[3] = &unk_24DA631C0;
  v6 = v4;
  v12 = v6;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection diagnosticReport].cold.1();

  objc_msgSend(v7, "diagnosticReportWithCompletion:", v6);
  v9 = (id)v17[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __38__INDaemonConnection_diagnosticReport__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _INLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __38__INDaemonConnection_diagnosticReport__block_invoke_cold_1();

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;
  v10 = v5;

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

uint64_t __38__INDaemonConnection_diagnosticReport__block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateOfferForAccount:(id)a3 offerId:(id)a4 buttonId:(id)a5 info:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  INDaemonConnection *v17;
  NSObject *v18;
  NSXPCConnection *connection;
  uint64_t v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  INDaemonConnection *v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v17 = self;
  v33 = v17;
  _INLogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection updateOfferForAccount:offerId:buttonId:info:completion:].cold.2();

  connection = v17->_connection;
  v20 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke;
  v29[3] = &unk_24DA63260;
  v21 = v16;
  v30 = v21;
  v31 = v32;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection diagnosticReport].cold.1();

  objc_msgSend(v12, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v26[1] = 3221225472;
  v26[2] = __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_20;
  v26[3] = &unk_24DA63288;
  v25 = v21;
  v27 = v25;
  v28 = v32;
  objc_msgSend(v22, "updateOfferForAccountWithID:offerId:buttonId:info:completion:", v24, v13, v14, v15, v26);

  _Block_object_dispose(v32, 8);
}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_20_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __69__INDaemonConnection_iCloudServerOfferForAccount_options_completion___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _INLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_219044000, v7, OS_LOG_TYPE_DEFAULT, "iCloud offer: %@ error: %@", (uint8_t *)&v10, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  INDaemonConnection *v8;
  NSObject *v9;
  NSXPCConnection *connection;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  INDaemonConnection *v22;

  v6 = a3;
  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v8 = self;
  v22 = v8;
  _INLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection presentHiddenFreshmintWithContext:completion:].cold.1();

  connection = v8->_connection;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke;
  v18[3] = &unk_24DA63260;
  v12 = v7;
  v19 = v12;
  v20 = v21;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_23;
  v15[3] = &unk_24DA63288;
  v14 = v12;
  v16 = v14;
  v17 = v21;
  objc_msgSend(v13, "presentHiddenFreshmintWithContext:completion:", v6, v15);

  _Block_object_dispose(v21, 8);
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_23_cold_1();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  INDaemonConnection *v22;

  v6 = a3;
  v7 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  v22 = self;
  connection = v22->_connection;
  v9 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke;
  v17[3] = &unk_24DA632D8;
  v10 = v7;
  v19 = v10;
  v11 = v6;
  v18 = v11;
  v20 = v21;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke_24;
  v14[3] = &unk_24DA63300;
  v13 = v10;
  v15 = v13;
  v16 = v21;
  objc_msgSend(v12, "commonHeadersForRequest:withCompletion:", v11, v14);

  _Block_object_dispose(v21, 8);
}

void __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "allHTTPHeaderFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __61__INDaemonConnection_commonHeadersForRequest_withCompletion___block_invoke_24(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  INDaemonConnection *v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy_;
  v10[4] = __Block_byref_object_dispose_;
  v11 = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v11->_connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke_27;
  v7[3] = &unk_24DA63368;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  objc_msgSend(v5, "renewCredentialsWithCompletion:", v7);

  _Block_object_dispose(v10, 8);
}

void __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _INLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1();

}

void __53__INDaemonConnection_renewCredentialsWithCompletion___block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v3, 0, a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_29(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_29_cold_1(a2, (uint64_t)v5, v6);

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)remoteFreshmintFlowCompletedWithSuccess:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSXPCConnection *connection;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  INDaemonConnection *v17;

  v4 = a3;
  v6 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = self;
  connection = v17->_connection;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke;
  v13 = &unk_24DA63260;
  v8 = v6;
  v14 = v8;
  v15 = v16;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteFreshmintFlowCompletedWithSuccess:error:", v4, 0, v10, v11, v12, v13);
  (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);

  _Block_object_dispose(v16, 8);
}

void __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)appLaunchLinkDidPresentForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  INDaemonConnection *v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v18 = self;
  connection = v18->_connection;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __76__INDaemonConnection_appLaunchLinkDidPresentForBundleIdentifier_completion___block_invoke;
  v14 = &unk_24DA63260;
  v9 = v7;
  v15 = v9;
  v16 = v17;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appLaunchLinkDidPresentForBundleIdentifier:", v6, v11, v12, v13, v14);
  (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);

  _Block_object_dispose(v17, 8);
}

void __76__INDaemonConnection_appLaunchLinkDidPresentForBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (void)getCacheDataForLink:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  INDaemonConnection *v18;

  v6 = a3;
  v7 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  v18 = self;
  connection = v18->_connection;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __53__INDaemonConnection_getCacheDataForLink_completion___block_invoke;
  v14 = &unk_24DA63260;
  v9 = v7;
  v15 = v9;
  v16 = v17;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", &v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getCacheDataForLink:completion:", v6, v9, v11, v12, v13, v14);

  _Block_object_dispose(v17, 8);
}

void __53__INDaemonConnection_getCacheDataForLink_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__INDaemonConnection_daemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24DA63390;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __45__INDaemonConnection_daemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (id)synchronousDaemonWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__INDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke;
  v9[3] = &unk_24DA63390;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __56__INDaemonConnection_synchronousDaemonWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)displayDelayedOfferWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *connection;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  INDaemonConnection *v20;

  v6 = a3;
  v7 = a4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = self;
  connection = v20->_connection;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke;
  v16[3] = &unk_24DA63260;
  v10 = v7;
  v17 = v10;
  v18 = v19;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_30;
  v13[3] = &unk_24DA63260;
  v12 = v10;
  v14 = v12;
  v15 = v19;
  objc_msgSend(v11, "displayDelayedOfferWithContext:completion:", v6, v13);

  _Block_object_dispose(v19, 8);
}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _INLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSXPCConnection *connection;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;

  v6 = a4;
  v7 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke;
  v23[3] = &unk_24DA631E8;
  v8 = v6;
  v23[4] = self;
  v24 = v8;
  v9 = (void *)MEMORY[0x219A28940](v23);
  connection = self->_connection;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke_31;
  v21[3] = &unk_24DA631C0;
  v22 = v9;
  v11 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  objc_msgSend(v12, "registerDeviceForLoggedOutiCloudNotificationsWithReason:completion:", a3, v11);
}

void __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_219044000, v6, OS_LOG_TYPE_DEFAULT, "Registration result (%@) with error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

uint64_t __89__INDaemonConnection_registerDeviceForLoggedOutiCloudNotificationsWithReason_completion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSXPCConnection *connection;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke;
  v21[3] = &unk_24DA631E8;
  v6 = v4;
  v21[4] = self;
  v22 = v6;
  v7 = (void *)MEMORY[0x219A28940](v21);
  connection = self->_connection;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke_32;
  v19[3] = &unk_24DA631C0;
  v20 = v7;
  v9 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _INLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[INDaemonConnection unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  objc_msgSend(v10, "unregisterDeviceFromLoggedOutiCloudNotificationsWithReason:completion:", 9, v9);
}

void __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _INLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if ((_DWORD)a2)
      v7 = CFSTR("YES");
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_219044000, v6, OS_LOG_TYPE_DEFAULT, "Unregistration success: %@. Error: %@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);

}

uint64_t __85__INDaemonConnection_unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_219044000, v0, v1, "Resuming connection to ind...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __26__INDaemonConnection_init__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_219044000, v0, v1, "Connection to ind interrupted!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __26__INDaemonConnection_init__block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_219044000, v0, v1, "Connection to ind invalidated!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)registerAccount:(uint64_t)a3 foriCloudNotificationsWithReason:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending sync registration message to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)registerAccount:(uint64_t)a3 foriCloudNotificationsWithReason:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending async registration message asynchronously to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterAccount:(uint64_t)a3 fromiCloudNotificationsWithError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending sync unregistration message to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterAccount:(uint64_t)a3 fromiCloudNotificationsWithCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending async unregistration message asynchronously to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)teardownOffersForAccount:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending offers teardown message asynchronously to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)clearAllRegistrationDigestsWithError:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending clear all registration digests message to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__INDaemonConnection_clearAllRegistrationDigestsWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_219044000, v0, v1, "Failed to clear registration cache with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)diagnosticReport
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_219044000, v0, v1, "Sending message to daemon.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __38__INDaemonConnection_diagnosticReport__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_219044000, v0, v1, "Failed to fetch diagnostic report with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)updateOfferForAccount:offerId:buttonId:info:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_219044000, v1, OS_LOG_TYPE_DEBUG, "Updating offer with Id: %@, buttonId: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __77__INDaemonConnection_updateOfferForAccount_offerId_buttonId_info_completion___block_invoke_20_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_219044000, v0, v1, "Updated offer with success: %d, error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)presentHiddenFreshmintWithContext:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_219044000, v0, v1, "Received presentHiddenFreshmintWithContext %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_219044000, v0, v1, "Creating daemon failed with proxy error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__INDaemonConnection_presentHiddenFreshmintWithContext_completion___block_invoke_23_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_219044000, v0, v1, "Presented Hidden Freshmint with success: %d, error: %@");
  OUTLINED_FUNCTION_2();
}

void __58__INDaemonConnection_notifyDeviceStorageLevel_completion___block_invoke_29_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a1 & 1;
  LOWORD(v4) = 2114;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_5(&dword_219044000, a2, a3, "Device storage level change processed with success: %d, error: %{public}@", v3, (_QWORD)v4, HIWORD(a2));
  OUTLINED_FUNCTION_2();
}

void __73__INDaemonConnection_remoteFreshmintFlowCompletedWithSuccess_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_219044000, v0, v1, "Failed to connect to ind with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__INDaemonConnection_displayDelayedOfferWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_219044000, v0, v1, "Failed to create daemon with proxy error [%@].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)registerDeviceForLoggedOutiCloudNotificationsWithReason:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending logged-out push registration message asynchronously to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_219044000, a1, a3, "Sending logged-out push unregistration message asynchronously to daemon. %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
