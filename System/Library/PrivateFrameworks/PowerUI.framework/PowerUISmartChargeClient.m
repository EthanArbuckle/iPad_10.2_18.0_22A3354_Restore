@implementation PowerUISmartChargeClient

+ (id)remoteInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E02070);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_statusWithHandler_, 0, 1);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_powerLogStatusWithHandler_, 0, 1);

  return v2;
}

- (PowerUISmartChargeClient)initWithClientName:(id)a3
{
  id v5;
  PowerUISmartChargeClient *v6;
  PowerUISmartChargeClient *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  NSXPCConnection *connection;
  NSXPCConnection *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PowerUISmartChargeClient;
  v6 = -[PowerUISmartChargeClient init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    v8 = os_log_create("com.apple.powerui.smartcharging", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerui.smartChargeManager"), 4096);
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v10;

    v12 = v7->_connection;
    objc_msgSend((id)objc_opt_class(), "remoteInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v12, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection resume](v7->_connection, "resume");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PowerUISmartChargeClient;
  -[PowerUISmartChargeClient dealloc](&v3, sel_dealloc);
}

- (BOOL)isOBCSupported
{
  PowerUISmartChargeClient *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2;
  v5[3] = &unk_24D3FBFC0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "isOBCSupportedWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)isOBCSupportedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isOBCSupportedWithHandler:", v4);

}

- (unint64_t)isSmartChargingCurrentlyEnabled:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke_2;
  v9[3] = &unk_24D3FBFE8;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "isSmartChargingCurrentlyEnabledWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __60__PowerUISmartChargeClient_isSmartChargingCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isSmartChargingCurrentlyEnabledWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isSmartChargingCurrentlyEnabledWithHandler:", v4);

}

- (BOOL)setState:(unint64_t)a3 error:(id *)a4
{
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  NSString *clientName;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  _QWORD v18[7];
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  dispatch_semaphore_t v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  v35 = dispatch_semaphore_create(0);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__PowerUISmartChargeClient_setState_error___block_invoke;
  v19[3] = &unk_24D3FC010;
  v19[4] = &v24;
  v19[5] = &v20;
  v19[6] = &v30;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __43__PowerUISmartChargeClient_setState_error___block_invoke_2;
  v18[3] = &unk_24D3FC038;
  v18[4] = &v24;
  v18[5] = &v20;
  v18[6] = &v30;
  objc_msgSend(v9, "client:setState:withHandler:", clientName, a3, v18);

  v11 = v31[5];
  v12 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    -[PowerUISmartChargeClient log](self, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[PowerUISmartChargeClient setState:error:].cold.1(v13);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PowerUISmartChargingErrorDomain"), 5, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v25[5];
    v25[5] = v14;

    *((_BYTE *)v21 + 24) = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v25[5]);
  v16 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v16;
}

void __43__PowerUISmartChargeClient_setState_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

void __43__PowerUISmartChargeClient_setState_error___block_invoke_2(_QWORD *a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));

}

- (BOOL)disableSmartCharging:(id *)a3
{
  return -[PowerUISmartChargeClient setState:error:](self, "setState:error:", 0, a3);
}

- (void)disableSmartChargingWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setState:withHandler:", self->_clientName, 0, v5);

}

- (BOOL)temporarilyDisableSmartCharging:(id *)a3
{
  return -[PowerUISmartChargeClient setState:error:](self, "setState:error:", 3, a3);
}

- (void)temporarilyDisableSmartChargingWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setState:withHandler:", self->_clientName, 3, v5);

}

- (BOOL)enableSmartCharging:(id *)a3
{
  return -[PowerUISmartChargeClient setState:error:](self, "setState:error:", 1, a3);
}

- (void)enableSmartChargingWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setState:withHandler:", self->_clientName, 1, v5);

}

- (BOOL)temporarilyEnableCharging:(id *)a3
{
  return -[PowerUISmartChargeClient setState:error:](self, "setState:error:", 2, a3);
}

- (void)temporarilyEnableChargingWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setState:withHandler:", self->_clientName, 2, v5);

}

- (id)status
{
  NSXPCConnection *connection;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = (id)MEMORY[0x24BDBD1B8];
  connection = self->_connection;
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__PowerUISmartChargeClient_status__block_invoke;
  v8[3] = &unk_24D3FC060;
  v8[4] = self;
  v8[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __34__PowerUISmartChargeClient_status__block_invoke_128;
  v7[3] = &unk_24D3FC088;
  v7[4] = &v9;
  objc_msgSend(v4, "statusWithHandler:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __34__PowerUISmartChargeClient_status__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v7, 0x20u);

  }
}

void __34__PowerUISmartChargeClient_status__block_invoke_128(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)powerLogStatus
{
  NSXPCConnection *connection;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = (id)MEMORY[0x24BDBD1B8];
  connection = self->_connection;
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__PowerUISmartChargeClient_powerLogStatus__block_invoke;
  v8[3] = &unk_24D3FC060;
  v8[4] = self;
  v8[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __42__PowerUISmartChargeClient_powerLogStatus__block_invoke_130;
  v7[3] = &unk_24D3FC088;
  v7[4] = &v9;
  objc_msgSend(v4, "powerLogStatusWithHandler:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __42__PowerUISmartChargeClient_powerLogStatus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Client %@ received error (%@): %@", (uint8_t *)&v7, 0x20u);

  }
}

void __42__PowerUISmartChargeClient_powerLogStatus__block_invoke_130(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)fullChargeDeadline:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  connection = self->_connection;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke;
  v13[3] = &unk_24D3FC0B0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_131;
  v12[3] = &unk_24D3FC0D8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v6, "fullChargeDeadlineWithHandler:", v12);

  v7 = (void *)v15[5];
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v10;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v8;
}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);

}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_131(uint64_t a1, void *a2, void *a3)
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

- (void)fullChargeDeadlineWithHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__PowerUISmartChargeClient_fullChargeDeadlineWithHandler___block_invoke;
  v8[3] = &unk_24D3FC100;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullChargeDeadlineWithHandler:", v6);

}

uint64_t __58__PowerUISmartChargeClient_fullChargeDeadlineWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)smartChargingUIState:(unint64_t *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  NSXPCConnection *connection;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v17[10];
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 100;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  connection = self->_connection;
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke;
  v18[3] = &unk_24D3FC0B0;
  v18[4] = self;
  v18[5] = &v19;
  v18[6] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133;
  v17[3] = &unk_24D3FC128;
  v17[6] = &v29;
  v17[7] = &v25;
  v17[4] = self;
  v17[5] = &v33;
  v17[8] = &v19;
  v17[9] = a2;
  objc_msgSend(v13, "smartChargingUIStateWithHandler:", v17);

  *a3 = v34[3];
  if (a4)
    *a4 = v30[3];
  if (a5)
    *a5 = *((_BYTE *)v26 + 24);
  v14 = (void *)v20[5];
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return v14 == 0;
}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);

}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133(_QWORD *a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v9 = a5;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133_cold_1((uint64_t)a1, v10);
  }
  v11 = *(_QWORD *)(a1[8] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

}

- (BOOL)isOBCEngaged:(BOOL *)a3 isMaxChargeLimited:(BOOL *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  NSXPCConnection *connection;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  _QWORD v22[10];
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke;
  v23[3] = &unk_24D3FC0B0;
  v23[4] = self;
  v23[5] = &v32;
  v23[6] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke_135;
  v22[3] = &unk_24D3FC150;
  v22[6] = &v28;
  v22[7] = &v24;
  v22[4] = self;
  v22[5] = &v38;
  v22[8] = &v32;
  v22[9] = a2;
  objc_msgSend(v12, "legacy_isOBCEngagedWithHandler:", v22);

  -[PowerUISmartChargeClient log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[PowerUISmartChargeClient clientName](self, "clientName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *((unsigned __int8 *)v39 + 24);
    v16 = *((unsigned __int8 *)v29 + 24);
    v17 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 138413058;
    v43 = v14;
    v44 = 1024;
    v45 = v15;
    v46 = 1024;
    v47 = v16;
    v48 = 1024;
    v49 = v17;
    _os_log_impl(&dword_215A71000, v13, OS_LOG_TYPE_INFO, "Client %@ requested engagement state: %d - %d - %d", buf, 0x1Eu);

  }
  if (a3)
    *a3 = *((_BYTE *)v39 + 24);
  if (a4)
    *a4 = *((_BYTE *)v29 + 24);
  if (a5)
    *a5 = *((_BYTE *)v25 + 24);
  v18 = (void *)v33[5];
  if (a6 && v18)
    *a6 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v18 == 0;
}

void __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);

}

void __94__PowerUISmartChargeClient_isOBCEngaged_isMaxChargeLimited_chargingOverrideAllowed_withError___block_invoke_135(_QWORD *a1, char a2, char a3, char a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v9 = a5;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133_cold_1((uint64_t)a1, v10);
  }
  v11 = *(_QWORD *)(a1[8] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

}

- (BOOL)isOBCEngagedAsDesktopDevice:(BOOL *)a3 chargingOverrideAllowed:(BOOL *)a4 withError:(id *)a5
{
  BOOL v6;

  v6 = 0;
  -[PowerUISmartChargeClient isOBCEngaged:isMaxChargeLimited:chargingOverrideAllowed:withError:](self, "isOBCEngaged:isMaxChargeLimited:chargingOverrideAllowed:withError:", &v6, a3, a4, a5);
  return v6;
}

- (void)isOBCEngagedAsDesktopDeviceWithHandler:(id)a3
{
  id v5;
  NSXPCConnection *connection;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__PowerUISmartChargeClient_isOBCEngagedAsDesktopDeviceWithHandler___block_invoke;
  v9[3] = &unk_24D3FC178;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v7 = v5;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isOBCEngagedAsDesktopDeviceWithHandler:", v7);

}

void __67__PowerUISmartChargeClient_isOBCEngagedAsDesktopDeviceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)isOBCEngaged:(id *)a3
{
  BOOL v4;

  v4 = 0;
  -[PowerUISmartChargeClient isOBCEngaged:isMaxChargeLimited:chargingOverrideAllowed:withError:](self, "isOBCEngaged:isMaxChargeLimited:chargingOverrideAllowed:withError:", &v4, 0, 0, a3);
  return v4;
}

- (void)legacy_client_isOBCEngagedWithHandler:(id)a3
{
  id v5;
  NSXPCConnection *connection;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;

  v5 = a3;
  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke;
  v13[3] = &unk_24D3FC178;
  v13[4] = self;
  v15 = a2;
  v8 = v5;
  v14 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke_137;
  v11[3] = &unk_24D3FC1A0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "legacy_isOBCEngagedWithHandler:", v11);

}

void __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __66__PowerUISmartChargeClient_legacy_client_isOBCEngagedWithHandler___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setMCLLimit:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v5;
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  NSString *clientName;
  char v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke;
  v14[3] = &unk_24D3FC1C8;
  v14[4] = &v19;
  v14[5] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke_2;
  v13[3] = &unk_24D3FC1F0;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend(v9, "client:setMCLLimit:withHandler:", clientName, v5, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __46__PowerUISmartChargeClient_setMCLLimit_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)setMCLLimit:(unsigned __int8)a3 withHandler:(id)a4
{
  uint64_t v4;
  NSXPCConnection *connection;
  id v7;
  id v8;

  v4 = a3;
  connection = self->_connection;
  v7 = a4;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "client:setMCLLimit:withHandler:", self->_clientName, v4, v7);

}

- (unsigned)getMCLLimitWithError:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v6;
  void *v7;
  NSString *clientName;
  unsigned __int8 v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke;
  v12[3] = &unk_24D3FC1C8;
  v12[4] = &v17;
  v12[5] = &v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke_2;
  v11[3] = &unk_24D3FC218;
  v11[4] = &v17;
  v11[5] = &v13;
  objc_msgSend(v7, "client:getMCLLimitWithHandler:", clientName, v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __49__PowerUISmartChargeClient_getMCLLimitWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)getMCLLimitWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:getMCLLimitWithHandler:", self->_clientName, v5);

}

- (BOOL)disableMCL:(id *)a3
{
  return -[PowerUISmartChargeClient setMCLLimit:error:](self, "setMCLLimit:error:", 100, a3);
}

- (void)disableMCLWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setMCLLimit:withHandler:", self->_clientName, 100, v5);

}

- (BOOL)enableMCL:(id *)a3
{
  return -[PowerUISmartChargeClient setMCLLimit:error:](self, "setMCLLimit:error:", 80, a3);
}

- (void)enableMCLWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setMCLLimit:withHandler:", self->_clientName, 80, v5);

}

- (BOOL)temporarilyDisableMCL:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v6;
  void *v7;
  NSString *clientName;
  char v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke;
  v12[3] = &unk_24D3FC1C8;
  v12[4] = &v17;
  v12[5] = &v13;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke_2;
  v11[3] = &unk_24D3FC1F0;
  v11[4] = &v17;
  v11[5] = &v13;
  objc_msgSend(v7, "tmpDisableMCLViaClient:withHandler:", clientName, v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v9;
}

void __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __50__PowerUISmartChargeClient_temporarilyDisableMCL___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)temporarilyDisableMCLWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tmpDisableMCLViaClient:withHandler:", self->_clientName, v5);

}

- (unint64_t)isMCLCurrentlyEnabled:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke_2;
  v9[3] = &unk_24D3FBFE8;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "isMCLCurrentlyEnabledWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PowerUISmartChargeClient_isMCLCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isMCLCurrentlyEnabledWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isMCLCurrentlyEnabledWithHandler:", v4);

}

- (BOOL)isMCLSupported
{
  PowerUISmartChargeClient *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_139);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2;
  v5[3] = &unk_24D3FBFC0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "isMCLSupportedWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)isMCLSupportedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isMCLSupportedWithHandler:", v4);

}

- (unint64_t)currentRecommendedChargeLimitWithError:(id *)a3
{
  void *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_140);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2;
  v7[3] = &unk_24D3FC280;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "currentRecommendedChargeLimitWithHandler:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2_cold_1();

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)currentRecommendedChargeLimitWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentRecommendedChargeLimitWithHandler:", v4);

}

- (BOOL)isDEoCSupported
{
  PowerUISmartChargeClient *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_141);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2;
  v5[3] = &unk_24D3FBFC0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "isDEoCSupportedWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (void)isDEoCSupportedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isDEoCSupportedWithHandler:", v4);

}

- (BOOL)setDEoCState:(unint64_t)a3 error:(id *)a4
{
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  NSString *clientName;
  char v11;
  _QWORD v13[6];
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke;
  v14[3] = &unk_24D3FC1C8;
  v14[4] = &v19;
  v14[5] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke_2;
  v13[3] = &unk_24D3FC1F0;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend(v9, "client:setDEoCState:withHandler:", clientName, a3, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __47__PowerUISmartChargeClient_setDEoCState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (unint64_t)isDEoCCurrentlyEnabled:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke_2;
  v9[3] = &unk_24D3FBFE8;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "isDEoCCurrentlyEnabledWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__PowerUISmartChargeClient_isDEoCCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isDEoCCurrentlyEnabledWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isDEoCCurrentlyEnabledWithHandler:", v4);

}

- (BOOL)disableDEoC:(id *)a3
{
  return -[PowerUISmartChargeClient setDEoCState:error:](self, "setDEoCState:error:", 0, a3);
}

- (void)disableDEoCWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setDEoCState:withHandler:", self->_clientName, 0, v5);

}

- (BOOL)enableDEoC:(id *)a3
{
  return -[PowerUISmartChargeClient setDEoCState:error:](self, "setDEoCState:error:", 1, a3);
}

- (void)enableDEoCWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setDEoCState:withHandler:", self->_clientName, 1, v5);

}

- (unint64_t)currentChargeLimit:(id *)a3
{
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  unint64_t v8;
  _QWORD v10[7];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke;
  v11[3] = &unk_24D3FBA68;
  v11[4] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2;
  v10[3] = &unk_24D3FC2C8;
  v10[4] = self;
  v10[5] = &v16;
  v10[6] = &v12;
  objc_msgSend(v7, "currentChargeLimitWithHandler:", v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  objc_msgSend(*(id *)(a1 + 32), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v9;
      v12 = 2048;
      v13 = a2;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_INFO, "Client %@ requested DEoC limit: %lu", (uint8_t *)&v10, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }

}

- (id)getDEoCPredictions:(id *)a3
{
  uint64_t v5;
  NSXPCConnection *connection;
  void *v7;
  id v8;
  _QWORD v10[7];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke;
  v11[3] = &unk_24D3FBA68;
  v11[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2;
  v10[3] = &unk_24D3FC2F0;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  objc_msgSend(v7, "getDEoCPredictionsWithHandler:", v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

- (BOOL)isOBCEngaged:(BOOL *)a3 chargeLimit:(unint64_t *)a4 chargingOverrideAllowed:(BOOL *)a5 withError:(id *)a6
{
  NSXPCConnection *connection;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v17[10];
  _QWORD v18[7];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 100;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  connection = self->_connection;
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke;
  v18[3] = &unk_24D3FC0B0;
  v18[4] = self;
  v18[5] = &v27;
  v18[6] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke_143;
  v17[3] = &unk_24D3FC318;
  v17[6] = &v23;
  v17[7] = &v19;
  v17[4] = self;
  v17[5] = &v33;
  v17[8] = &v27;
  v17[9] = a2;
  objc_msgSend(v13, "isOBCEngagedOrChargeLimitedWithHandler:", v17);

  if (a3)
    *a3 = *((_BYTE *)v34 + 24);
  if (a4)
    *a4 = v24[3];
  if (a5)
    *a5 = *((_BYTE *)v20 + 24);
  v14 = (void *)v28[5];
  if (a6 && v14)
    *a6 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v14 == 0;
}

void __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);

}

void __87__PowerUISmartChargeClient_isOBCEngaged_chargeLimit_chargingOverrideAllowed_withError___block_invoke_143(_QWORD *a1, char a2, uint64_t a3, char a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;

  v9 = a5;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = a4;
  if (v9)
  {
    v10 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133_cold_1((uint64_t)a1, v10);
  }
  v11 = *(_QWORD *)(a1[8] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;

}

- (void)isOBCEngagedOrChargeLimitedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isOBCEngagedOrChargeLimitedWithHandler:", v4);

}

- (BOOL)setCECState:(unint64_t)a3 error:(id *)a4
{
  NSXPCConnection *connection;
  uint64_t v8;
  void *v9;
  NSString *clientName;
  NSObject *v11;
  int v12;
  BOOL v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __46__PowerUISmartChargeClient_setCECState_error___block_invoke;
  v16[3] = &unk_24D3FC1C8;
  v16[4] = &v21;
  v16[5] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __46__PowerUISmartChargeClient_setCECState_error___block_invoke_2;
  v15[3] = &unk_24D3FC1F0;
  v15[4] = &v21;
  v15[5] = &v17;
  objc_msgSend(v9, "client:setCECState:withHandler:", clientName, a3, v15);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  -[PowerUISmartChargeClient log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *((unsigned __int8 *)v18 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v12;
    _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Returning %d", buf, 8u);
  }

  v13 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

void __46__PowerUISmartChargeClient_setCECState_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __46__PowerUISmartChargeClient_setCECState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)isCECSupported
{
  PowerUISmartChargeClient *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_145);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__PowerUISmartChargeClient_isCECSupported__block_invoke_2;
  v5[3] = &unk_24D3FBFC0;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "isCECSupportedWithHandler:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __42__PowerUISmartChargeClient_isCECSupported__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1();

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }

}

- (unint64_t)isCECCurrentlyEnabled:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke_2;
  v9[3] = &unk_24D3FBFE8;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "isCECCurrentlyEnabledWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PowerUISmartChargeClient_isCECCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isCECCurrentlyEnabledWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isCECCurrentlyEnabledWithHandler:", v4);

}

- (void)isCECSupportedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isCECSupportedWithHandler:", v4);

}

- (BOOL)disableCEC:(id *)a3
{
  return -[PowerUISmartChargeClient setCECState:error:](self, "setCECState:error:", 0, a3);
}

- (void)disableCECWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setCECState:withHandler:", self->_clientName, 0, v5);

}

- (BOOL)temporarilyDisableCEC:(id *)a3
{
  return -[PowerUISmartChargeClient setCECState:error:](self, "setCECState:error:", 3, a3);
}

- (void)temporarilyDisableCECWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setCECState:withHandler:", self->_clientName, 3, v5);

}

- (BOOL)enableCEC:(id *)a3
{
  return -[PowerUISmartChargeClient setCECState:error:](self, "setCECState:error:", 1, a3);
}

- (void)enableCECWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setCECState:withHandler:", self->_clientName, 1, v5);

}

- (id)cecFullChargeDeadline:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  connection = self->_connection;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke;
  v13[3] = &unk_24D3FC0B0;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke_146;
  v12[3] = &unk_24D3FC0D8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v6, "cecFullChargeDeadlineWithHandler:", v12);

  v7 = (void *)v15[5];
  if (v7)
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }
  else
  {
    v9 = (void *)v21[5];
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v10;
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v8;
}

void __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(a1, v5);

}

void __50__PowerUISmartChargeClient_cecFullChargeDeadline___block_invoke_146(uint64_t a1, void *a2, void *a3)
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

- (void)cecFullChargeDeadlineWithHandler:(id)a3
{
  id v4;
  NSXPCConnection *connection;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__PowerUISmartChargeClient_cecFullChargeDeadlineWithHandler___block_invoke;
  v8[3] = &unk_24D3FC100;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cecFullChargeDeadlineWithHandler:", v6);

}

uint64_t __61__PowerUISmartChargeClient_cecFullChargeDeadlineWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)setMCMState:(unint64_t)a3 error:(id *)a4
{
  NSObject *log;
  NSXPCConnection *connection;
  uint64_t v9;
  void *v10;
  NSString *clientName;
  char v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    -[PowerUISmartChargeClient setMCMState:error:].cold.1(log, a3);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__3;
  v24 = __Block_byref_object_dispose__3;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  connection = self->_connection;
  v9 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__PowerUISmartChargeClient_setMCMState_error___block_invoke;
  v15[3] = &unk_24D3FC1C8;
  v15[4] = &v20;
  v15[5] = &v16;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __46__PowerUISmartChargeClient_setMCMState_error___block_invoke_2;
  v14[3] = &unk_24D3FC1F0;
  v14[4] = &v20;
  v14[5] = &v16;
  objc_msgSend(v10, "client:setMCMState:withHandler:", clientName, a3, v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v12 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __46__PowerUISmartChargeClient_setMCMState_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __46__PowerUISmartChargeClient_setMCMState_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)shouldMCMBeDisplayed:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  char v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke_2;
  v9[3] = &unk_24D3FC1F0;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "shouldMCMBeDisplayedWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __49__PowerUISmartChargeClient_shouldMCMBeDisplayed___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)shouldMCMBeDisplayedWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldMCMBeDisplayedWithHandler:", v4);

}

- (unint64_t)isMCMCurrentlyEnabled:(id *)a3
{
  uint64_t v4;
  NSXPCConnection *connection;
  void *v6;
  unint64_t v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v4 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke;
  v10[3] = &unk_24D3FBA68;
  v10[4] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke_2;
  v9[3] = &unk_24D3FBFE8;
  v9[4] = &v15;
  v9[5] = &v11;
  objc_msgSend(v6, "isMCMCurrentlyEnabledWithHandler:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

void __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PowerUISmartChargeClient_isMCMCurrentlyEnabled___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isMCMCurrentlyEnabledWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  id v5;

  connection = self->_connection;
  v4 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isMCMCurrentlyEnabledWithHandler:", v4);

}

- (BOOL)disableMCM:(id *)a3
{
  return -[PowerUISmartChargeClient setMCMState:error:](self, "setMCMState:error:", 0, a3);
}

- (void)disableMCMWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setMCMState:withHandler:", self->_clientName, 0, v5);

}

- (BOOL)temporarilyDisableMCM:(id *)a3
{
  return -[PowerUISmartChargeClient setMCMState:error:](self, "setMCMState:error:", 2, a3);
}

- (void)temporarilyDisableMCMWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setMCMState:withHandler:", self->_clientName, 2, v5);

}

- (BOOL)enableMCM:(id *)a3
{
  return -[PowerUISmartChargeClient setMCMState:error:](self, "setMCMState:error:", 1, a3);
}

- (void)enableMCMWithHandler:(id)a3
{
  NSXPCConnection *connection;
  id v5;
  id v6;

  connection = self->_connection;
  v5 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:setMCMState:withHandler:", self->_clientName, 1, v5);

}

- (void)engageFrom:(id)a3 until:(id)a4 repeatUntil:(id)a5 overrideAllSignals:(BOOL)a6
{
  _BOOL8 v6;
  NSXPCConnection *connection;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v6 = a6;
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke;
  v17[3] = &unk_24D3FC060;
  v17[4] = self;
  v17[5] = a2;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_147;
  v16[3] = &unk_24D3FC360;
  v16[4] = self;
  objc_msgSend(v15, "engageFrom:until:repeatUntil:overrideAllSignals:withHandler:", v14, v13, v12, v6, v16);

}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_147(uint64_t a1, char a2)
{
  NSObject *v2;

  if ((a2 & 1) == 0)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_147_cold_1(v2);
  }
}

- (void)resetEngagementOverride
{
  NSXPCConnection *connection;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[6];

  connection = self->_connection;
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke;
  v7[3] = &unk_24D3FC060;
  v7[4] = self;
  v7[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke_149;
  v6[3] = &unk_24D3FC360;
  v6[4] = self;
  objc_msgSend(v5, "resetEngagementOverrideWithHandler:", v6);

}

void __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(const char **)(a1 + 40);
    v6 = v4;
    NSStringFromSelector(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "%@ Error: %@", (uint8_t *)&v8, 0x16u);

  }
}

void __51__PowerUISmartChargeClient_resetEngagementOverride__block_invoke_149(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_215A71000, v2, OS_LOG_TYPE_DEFAULT, "Unable to reset override", v3, 2u);
    }
  }
}

- (id)simulateCurrentOutputAsOfDate:(id)a3 overrideAllSignals:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v9;
  NSXPCConnection *connection;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a4;
  v9 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  v27 = __Block_byref_object_dispose__3;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = 0;
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke;
  v16[3] = &unk_24D3FC060;
  v16[4] = self;
  v16[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_150;
  v15[3] = &unk_24D3FC388;
  v15[4] = self;
  v15[5] = &v23;
  v15[6] = &v17;
  v15[7] = a2;
  objc_msgSend(v12, "simulateCurrentOutputAsOfDate:overrideAllSignals:withHandler:", v9, v6, v15);

  if (a5)
    *a5 = objc_retainAutorelease((id)v18[5]);
  v13 = (id)v24[5];
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_150(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v8 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_150_cold_1((uint64_t)a1, v8);
  }

}

- (void)enterDevelopmentMode
{
  NSXPCConnection *connection;
  void *v3;
  _QWORD v4[6];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__PowerUISmartChargeClient_enterDevelopmentMode__block_invoke;
  v4[3] = &unk_24D3FC060;
  v4[4] = self;
  v4[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enterDevelopmentMode");

}

void __48__PowerUISmartChargeClient_enterDevelopmentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

- (void)resetDevelopmentMode
{
  NSXPCConnection *connection;
  void *v3;
  _QWORD v4[6];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__PowerUISmartChargeClient_resetDevelopmentMode__block_invoke;
  v4[3] = &unk_24D3FC060;
  v4[4] = self;
  v4[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDevelopmentMode");

}

void __48__PowerUISmartChargeClient_resetDevelopmentMode__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

- (id)lastUsedLeewayWithError:(id *)a3
{
  NSXPCConnection *connection;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  v18 = 0;
  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke;
  v12[3] = &unk_24D3FC060;
  v12[4] = self;
  v12[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke_151;
  v11[3] = &unk_24D3FC3B0;
  v11[4] = self;
  v11[5] = &v19;
  v11[6] = &v13;
  v11[7] = a2;
  objc_msgSend(v8, "currentLeewayWithHandler:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = (id)v20[5];
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

void __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

void __52__PowerUISmartChargeClient_lastUsedLeewayWithError___block_invoke_151(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v8 = *(NSObject **)(a1[4] + 24);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_150_cold_1((uint64_t)a1, v8);
  }

}

- (void)listMonitorSignals
{
  NSXPCConnection *connection;
  void *v3;
  _QWORD v4[6];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__PowerUISmartChargeClient_listMonitorSignals__block_invoke;
  v4[3] = &unk_24D3FC060;
  v4[4] = self;
  v4[5] = a2;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listMonitorSignals");

}

void __46__PowerUISmartChargeClient_listMonitorSignals__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(a1, v4);

}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

void __42__PowerUISmartChargeClient_isOBCSupported__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setState:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_215A71000, log, OS_LOG_TYPE_FAULT, "SmartChargeClient setState timed out!", v1, 2u);
}

void __47__PowerUISmartChargeClient_fullChargeDeadline___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_5_1(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_4_2();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __95__PowerUISmartChargeClient_smartChargingUIState_chargeLimit_chargingOverrideAllowed_withError___block_invoke_133_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_4_2();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __42__PowerUISmartChargeClient_isMCLSupported__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining MCL status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __67__PowerUISmartChargeClient_currentRecommendedChargeLimitWithError___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining recommended limit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__PowerUISmartChargeClient_isDEoCSupported__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining DEoC status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__PowerUISmartChargeClient_currentChargeLimit___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining DEoC limit: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__PowerUISmartChargeClient_getDEoCPredictions___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_215A71000, v0, v1, "Error obtaining predictions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setMCMState:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215A71000, v4, OS_LOG_TYPE_ERROR, "trying to set MCM state: %@", v6, 0xCu);

  OUTLINED_FUNCTION_0_1();
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_6_1(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_4_2();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __76__PowerUISmartChargeClient_engageFrom_until_repeatUntil_overrideAllSignals___block_invoke_147_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_215A71000, log, OS_LOG_TYPE_ERROR, "Unable to engage override", v1, 2u);
}

void __87__PowerUISmartChargeClient_simulateCurrentOutputAsOfDate_overrideAllSignals_withError___block_invoke_150_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_10(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_4_2();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

@end
