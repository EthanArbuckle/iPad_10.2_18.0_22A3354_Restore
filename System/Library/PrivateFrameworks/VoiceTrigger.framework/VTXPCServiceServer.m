@implementation VTXPCServiceServer

- (VTXPCServiceServer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VTXPCServiceServer;
  return -[VTXPCServiceServer init](&v3, sel_init);
}

- (void)startService
{
  NSXPCListener *v3;
  NSXPCListener *listener;

  v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.voicetrigger.voicetriggerservice"));
  listener = self->_listener;
  self->_listener = v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  VTXPCConnection *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v25 = "-[VTXPCServiceServer listener:shouldAcceptNewConnection:]";
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: %{public}s connection: %{public}@", buf, 0x16u);
  }
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.voicetrigger.voicetriggerservice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DDFF0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v9);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E0E98);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v10);

    v11 = objc_alloc_init(VTXPCConnection);
    objc_msgSend(v6, "setExportedObject:", v11);
    objc_initWeak((id *)buf, v11);
    v12 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke;
    v22[3] = &unk_24C7F49E0;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v6, "setInterruptionHandler:", v22);
    objc_initWeak(&location, v6);
    v15 = v12;
    v16 = 3221225472;
    v17 = __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke_2;
    v18 = &unk_24C7F3AA8;
    objc_copyWeak(&v19, (id *)buf);
    objc_copyWeak(&v20, &location);
    objc_msgSend(v6, "setInvalidationHandler:", &v15);
    objc_msgSend(v6, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v13 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v25 = "-[VTXPCServiceServer listener:shouldAcceptNewConnection:]";
      v26 = 2114;
      v27 = v6;
      _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "::: %{public}s Deny connection %{public}@: lack of entitlement.", buf, 0x16u);
    }
  }

  return v8 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

void __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDisconnect");

}

void __57__VTXPCServiceServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleDisconnect");

  +[VTTriggerEventMonitorManager sharedManager](VTTriggerEventMonitorManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "removeConnection:", v3);

}

@end
