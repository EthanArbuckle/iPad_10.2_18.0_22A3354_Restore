@implementation PowerUISmartChargeClientAudioAccessories

+ (id)remoteInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E011B0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAvailableDevicesWithHandler_, 0, 1);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getStatusForDevice_withHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getStatusForDevice_withHandler_, 0, 0);

  return v2;
}

- (PowerUISmartChargeClientAudioAccessories)initWithClientName:(id)a3
{
  id v5;
  PowerUISmartChargeClientAudioAccessories *v6;
  PowerUISmartChargeClientAudioAccessories *v7;
  os_log_t v8;
  OS_os_log *log;
  uint64_t v10;
  NSXPCConnection *connection;
  NSXPCConnection *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PowerUISmartChargeClientAudioAccessories;
  v6 = -[PowerUISmartChargeClientAudioAccessories init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientName, a3);
    v8 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.powerui.audioAccessorySmartChargeManager"), 4096);
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
  v3.super_class = (Class)PowerUISmartChargeClientAudioAccessories;
  -[PowerUISmartChargeClientAudioAccessories dealloc](&v3, sel_dealloc);
}

- (void)connectAndDisableOBCforDevice:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  id v8;
  id v9;

  connection = self->_connection;
  v7 = a4;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client:connectAndDisableOBCforDevice:withHandler:", self->_clientName, v8, v7);

}

- (BOOL)connectAndDisableOBCforDevice:(id)a3 withError:(id *)a4
{
  id v6;
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

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke;
  v14[3] = &unk_24D3FC1C8;
  v14[4] = &v19;
  v14[5] = &v15;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke_2;
  v13[3] = &unk_24D3FC1F0;
  v13[4] = &v19;
  v13[5] = &v15;
  objc_msgSend(v9, "client:connectAndDisableOBCforDevice:withHandler:", clientName, v6, v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v11 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __84__PowerUISmartChargeClientAudioAccessories_connectAndDisableOBCforDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)setState:(unint64_t)a3 forDevice:(id)a4 withError:(id *)a5
{
  id v8;
  NSObject *log;
  NSString *clientName;
  void *v11;
  NSObject *v12;
  void *v13;
  NSXPCConnection *connection;
  uint64_t v15;
  void *v16;
  NSString *v17;
  BOOL v18;
  _QWORD v20[6];
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    clientName = self->_clientName;
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = log;
    objc_msgSend(v11, "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = clientName;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "Client '%@'requests state '%@'.", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  connection = self->_connection;
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke;
  v21[3] = &unk_24D3FC1C8;
  v21[4] = buf;
  v21[5] = &v22;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_clientName;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke_2;
  v20[3] = &unk_24D3FC1F0;
  v20[4] = buf;
  v20[5] = &v22;
  objc_msgSend(v16, "client:setState:forDevice:withHandler:", v17, a3, v8, v20);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v18 = *((_BYTE *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(buf, 8);

  return v18;
}

void __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __73__PowerUISmartChargeClientAudioAccessories_setState_forDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (unint64_t)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  unint64_t v10;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
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
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v7 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke;
  v13[3] = &unk_24D3FBA68;
  v13[4] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke_2;
  v12[3] = &unk_24D3FBFE8;
  v12[4] = &v18;
  v12[5] = &v14;
  objc_msgSend(v9, "isSmartChargingCurrentlyEnabledForDevice:withHandler:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v19[5]);
  v10 = v15[3];
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __95__PowerUISmartChargeClientAudioAccessories_isSmartChargingCurrentlyEnabledForDevice_withError___block_invoke_2(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)isSmartChargingCurrentlyEnabledForDevice:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v6;
  id v7;
  id v8;

  connection = self->_connection;
  v6 = a4;
  v7 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isSmartChargingCurrentlyEnabledForDevice:withHandler:", v7, v6);

}

- (BOOL)disableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return -[PowerUISmartChargeClientAudioAccessories setState:forDevice:withError:](self, "setState:forDevice:withError:", 0, a3, a4);
}

- (void)disableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  id v8;
  id v9;

  connection = self->_connection;
  v7 = a4;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client:setState:forDevice:withHandler:", self->_clientName, 0, v8, v7);

}

- (BOOL)temporarilyDisableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return -[PowerUISmartChargeClientAudioAccessories setState:forDevice:withError:](self, "setState:forDevice:withError:", 3, a3, a4);
}

- (void)temporarilyDisableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  id v8;
  id v9;

  connection = self->_connection;
  v7 = a4;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client:setState:forDevice:withHandler:", self->_clientName, 3, v8, v7);

}

- (BOOL)enableSmartChargingForDevice:(id)a3 withError:(id *)a4
{
  return -[PowerUISmartChargeClientAudioAccessories setState:forDevice:withError:](self, "setState:forDevice:withError:", 1, a3, a4);
}

- (void)enableSmartChargingForDevice:(id)a3 withHandler:(id)a4
{
  NSXPCConnection *connection;
  id v7;
  id v8;
  id v9;

  connection = self->_connection;
  v7 = a4;
  v8 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client:setState:forDevice:withHandler:", self->_clientName, 1, v8, v7);

}

- (BOOL)temporarilyEnableChargingForDevice:(id)a3 withError:(id *)a4
{
  return -[PowerUISmartChargeClientAudioAccessories setState:forDevice:withError:](self, "setState:forDevice:withError:", 2, a3, a4);
}

- (void)temporarilyEnableChargingForDevice:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSString *clientName;
  void *v10;
  int v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    clientName = self->_clientName;
    v11 = 138412290;
    v12 = clientName;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Client '%@'requests temporarilyEnableChargingWithHandler.", (uint8_t *)&v11, 0xCu);
  }
  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "client:setState:forDevice:withHandler:", self->_clientName, 2, v6, v7);

}

- (id)fullChargeDeadlineForDevice:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
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

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke;
  v13[3] = &unk_24D3FBA68;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke_2;
  v12[3] = &unk_24D3FC0D8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "fullChargeDeadlineForDevice:withHandler:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __82__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)fullChargeDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withHandler___block_invoke;
  v11[3] = &unk_24D3FC100;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullChargeDeadlineForDevice:withHandler:", v9, v8);

}

uint64_t __84__PowerUISmartChargeClientAudioAccessories_fullChargeDeadlineForDevice_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)unfilteredDeadlineForDevice:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t v7;
  NSXPCConnection *connection;
  void *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[5];
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

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4;
  v24 = __Block_byref_object_dispose__4;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v7 = MEMORY[0x24BDAC760];
  connection = self->_connection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke;
  v13[3] = &unk_24D3FBA68;
  v13[4] = &v14;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke_2;
  v12[3] = &unk_24D3FC0D8;
  v12[4] = &v20;
  v12[5] = &v14;
  objc_msgSend(v9, "unfilteredDeadlineForDevice:withHandler:", v6, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __82__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (void)unfilteredDeadlineForDevice:(id)a3 withHandler:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  connection = self->_connection;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __84__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withHandler___block_invoke;
  v11[3] = &unk_24D3FC100;
  v12 = v6;
  v8 = v6;
  v9 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unfilteredDeadlineForDevice:withHandler:", v9, v8);

}

uint64_t __84__PowerUISmartChargeClientAudioAccessories_unfilteredDeadlineForDevice_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)updateOBCDeadline:(id)a3 forDevice:(id)a4 withError:(id *)a5
{
  id v8;
  id v9;
  NSXPCConnection *connection;
  uint64_t v11;
  void *v12;
  NSString *clientName;
  char v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
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
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke;
  v17[3] = &unk_24D3FC1C8;
  v17[4] = &v22;
  v17[5] = &v18;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  clientName = self->_clientName;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke_2;
  v16[3] = &unk_24D3FC1F0;
  v16[4] = &v22;
  v16[5] = &v18;
  objc_msgSend(v12, "client:updateOBCDeadline:forDevice:withHandler:", clientName, v8, v9, v16);

  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v14 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __82__PowerUISmartChargeClientAudioAccessories_updateOBCDeadline_forDevice_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (void)updateOBCDeadline:(id)a3 forDevice:(id)a4 withHandler:(id)a5
{
  NSXPCConnection *connection;
  id v8;
  id v9;
  id v10;
  id v11;

  connection = self->_connection;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxy](connection, "remoteObjectProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateOBCDeadline:forDevice:withHandler:", v10, v9, v8);

}

- (void)engageUntil:(id)a3 forDevice:(id)a4 overrideAllSignals:(BOOL)a5
{
  _BOOL8 v5;
  NSXPCConnection *connection;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v5 = a5;
  connection = self->_connection;
  v9 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke;
  v14[3] = &unk_24D3FC060;
  v14[4] = self;
  v14[5] = a2;
  v10 = a4;
  v11 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke_102;
  v13[3] = &unk_24D3FC580;
  v13[4] = self;
  objc_msgSend(v12, "engageUntil:forDevice:overrideAllSignals:withHandler:", v11, v10, v5, v13);

}

void __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke(uint64_t a1, void *a2)
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

void __85__PowerUISmartChargeClientAudioAccessories_engageUntil_forDevice_overrideAllSignals___block_invoke_102(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Unable to send custom timestamp", v7, 2u);
    }
  }

}

- (id)getAvailableDevices
{
  NSXPCConnection *connection;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4;
  v14 = __Block_byref_object_dispose__4;
  v15 = (id)MEMORY[0x24BDBD1A8];
  connection = self->_connection;
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke;
  v9[3] = &unk_24D3FC060;
  v9[4] = self;
  v9[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke_103;
  v8[3] = &unk_24D3FC5A8;
  v8[4] = self;
  v8[5] = &v10;
  objc_msgSend(v5, "getAvailableDevicesWithHandler:", v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

void __63__PowerUISmartChargeClientAudioAccessories_getAvailableDevices__block_invoke_103(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
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
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = v4;
    objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "%@ devices about to be returned from client", (uint8_t *)&v10, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

- (id)getStatusForDevice:(id)a3
{
  id v5;
  NSXPCConnection *connection;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = (id)MEMORY[0x24BDBD1B8];
  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke;
  v12[3] = &unk_24D3FC060;
  v12[4] = self;
  v12[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke_105;
  v11[3] = &unk_24D3FC088;
  v11[4] = &v13;
  objc_msgSend(v8, "getStatusForDevice:withHandler:", v5, v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

void __63__PowerUISmartChargeClientAudioAccessories_getStatusForDevice___block_invoke_105(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (unint64_t)lastActionForDevice:(id)a3
{
  id v5;
  NSXPCConnection *connection;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke;
  v12[3] = &unk_24D3FC060;
  v12[4] = self;
  v12[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke_107;
  v11[3] = &unk_24D3FC5D0;
  v11[4] = &v13;
  objc_msgSend(v8, "lastActionForDevice:withHandler:", v5, v11);

  v9 = v14[3];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

uint64_t __64__PowerUISmartChargeClientAudioAccessories_lastActionForDevice___block_invoke_107(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)clearLastActionForDevice:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PowerUISmartChargeClientAudioAccessories *v10;
  SEL v11;

  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __69__PowerUISmartChargeClientAudioAccessories_clearLastActionForDevice___block_invoke;
  v9 = &unk_24D3FC060;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearLastActionForDevice:", v4, v6, v7, v8, v9, v10, v11);

}

void __69__PowerUISmartChargeClientAudioAccessories_clearLastActionForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)startMockingBluetoothForFakeDevice:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PowerUISmartChargeClientAudioAccessories *v10;
  SEL v11;

  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __79__PowerUISmartChargeClientAudioAccessories_startMockingBluetoothForFakeDevice___block_invoke;
  v9 = &unk_24D3FC060;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMockingBluetoothForFakeDevice:", v4, v6, v7, v8, v9, v10, v11);

}

void __79__PowerUISmartChargeClientAudioAccessories_startMockingBluetoothForFakeDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)stopMockingBluetooth
{
  NSXPCConnection *connection;
  void *v3;
  _QWORD v4[6];

  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__PowerUISmartChargeClientAudioAccessories_stopMockingBluetooth__block_invoke;
  v4[3] = &unk_24D3FC060;
  v4[4] = self;
  v4[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopMockingBluetooth");

}

void __64__PowerUISmartChargeClientAudioAccessories_stopMockingBluetooth__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)deleteRecordsForDevice:(id)a3
{
  void *v5;
  NSXPCConnection *connection;
  void *v7;
  _QWORD v8[6];

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  connection = self->_connection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__PowerUISmartChargeClientAudioAccessories_deleteRecordsForDevice___block_invoke;
  v8[3] = &unk_24D3FC060;
  v8[4] = self;
  v8[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteRecordsForDevices:", v5);

}

void __67__PowerUISmartChargeClientAudioAccessories_deleteRecordsForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)fakeConnectionForDevice:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PowerUISmartChargeClientAudioAccessories *v10;
  SEL v11;

  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __68__PowerUISmartChargeClientAudioAccessories_fakeConnectionForDevice___block_invoke;
  v9 = &unk_24D3FC060;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeConnectionForDevice:", v4, v6, v7, v8, v9, v10, v11);

}

void __68__PowerUISmartChargeClientAudioAccessories_fakeConnectionForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
}

- (void)setFakeConnectionStatusTo:(BOOL)a3
{
  _BOOL8 v3;
  NSXPCConnection *connection;
  void *v5;
  _QWORD v6[6];

  v3 = a3;
  connection = self->_connection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__PowerUISmartChargeClientAudioAccessories_setFakeConnectionStatusTo___block_invoke;
  v6[3] = &unk_24D3FC060;
  v6[4] = self;
  v6[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFakeConnectionStatusTo:", v3);

}

void __70__PowerUISmartChargeClientAudioAccessories_setFakeConnectionStatusTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
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
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  connection = self->_connection;
  v7 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke;
  v12[3] = &unk_24D3FC060;
  v12[4] = self;
  v12[5] = a2;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_109;
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

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_cold_1(a1, v4);

}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_109(_QWORD *a1, void *a2, void *a3)
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
      __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_109_cold_1((uint64_t)a1, v8);
  }

}

- (void)timeSeriesForDevice:(id)a3
{
  NSXPCConnection *connection;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  PowerUISmartChargeClientAudioAccessories *v10;
  SEL v11;

  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __64__PowerUISmartChargeClientAudioAccessories_timeSeriesForDevice___block_invoke;
  v9 = &unk_24D3FC060;
  v10 = self;
  v11 = a2;
  v4 = a3;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeSeriesForDevice:", v4, v6, v7, v8, v9, v10, v11);

}

void __64__PowerUISmartChargeClientAudioAccessories_timeSeriesForDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    objc_msgSend(v5, "clientName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEFAULT, "Client '%@' received error (%@): %@", (uint8_t *)&v9, 0x20u);

  }
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

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = *(const char **)(a1 + 40);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __68__PowerUISmartChargeClientAudioAccessories_lastUsedLeewayWithError___block_invoke_109_cold_1(uint64_t a1, void *a2)
{
  const char *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = *(const char **)(a1 + 56);
  v3 = a2;
  NSStringFromSelector(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_215A71000, v5, v6, "%@ Error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

@end
