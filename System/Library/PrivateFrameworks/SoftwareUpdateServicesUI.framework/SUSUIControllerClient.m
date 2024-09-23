@implementation SUSUIControllerClient

- (SUSUIControllerClient)init
{
  SUSUIControllerClient *v3;
  SUSUIControllerClient *v4;
  objc_super v5;
  SEL v6;
  SUSUIControllerClient *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIControllerClient;
  v4 = -[SUSUIControllerClient init](&v5, sel_init);
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4)
    -[SUSUIControllerClient _connectToServerIfNecessary](v7, "_connectToServerIfNecessary");
  v3 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v3;
}

- (void)invalidate
{
  -[SUSUIControllerClient _invalidateConnection](self, "_invalidateConnection", a2, self);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  SUSUIControllerClient *v4;

  v4 = self;
  v3 = a2;
  -[SUSUIControllerClient _invalidateConnection](self, "_invalidateConnection");
  v2.receiver = v4;
  v2.super_class = (Class)SUSUIControllerClient;
  -[SUSUIControllerClient dealloc](&v2, sel_dealloc);
}

- (BOOL)createKeybagWithSecret:(id)a3
{
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  char v8;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = 0;
  v5 = objc_alloc(MEMORY[0x24BEAEC38]);
  v6 = dispatch_get_global_queue(21, 0);
  v7 = (id)objc_msgSend(v5, "initWithDelegate:queue:clientType:", 0);

  if (v7 && location[0])
    v8 = objc_msgSend(v7, "createInstallationKeybag:forUnattendedInstall:", location[0], 1) & 1;
  if (v7)
    objc_msgSend(v7, "invalidate");
  v4 = v8;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)getPasscodePolicy:(id)a3
{
  SUSUIControllerClient *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  SUSUIControllerClient *v17;
  id v18;
  os_log_type_t v19;
  id v20;
  int v21;
  id location[2];
  SUSUIControllerClient *v23;
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v20 = SUSUILog();
    v19 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v24, (uint64_t)v23);
      _os_log_impl(&dword_218F45000, (os_log_t)v20, v19, "Client <%p>: getPasscodePolicy", v24, 0xCu);
    }
    objc_storeStrong(&v20, 0);
    v3 = v23;
    v4 = MEMORY[0x24BDAC760];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __43__SUSUIControllerClient_getPasscodePolicy___block_invoke;
    v16 = &unk_24DA41B48;
    v17 = v23;
    v18 = location[0];
    v5 = -[SUSUIControllerClient _remoteInterfaceWithErrorHandler:](v3, "_remoteInterfaceWithErrorHandler:", &v12);
    v6 = v4;
    v7 = -1073741824;
    v8 = 0;
    v9 = __43__SUSUIControllerClient_getPasscodePolicy___block_invoke_182;
    v10 = &unk_24DA40840;
    v11 = location[0];
    objc_msgSend(v5, "getPasscodePolicy:", &v6);

    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  objc_storeStrong(location, 0);
}

void __43__SUSUIControllerClient_getPasscodePolicy___block_invoke(uint64_t a1, void *a2)
{
  os_log_t oslog[2];
  id location[2];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v5, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_218F45000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: error communicatin with server, return NotRequired", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(location, 0);
}

uint64_t __43__SUSUIControllerClient_getPasscodePolicy___block_invoke_182(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  v2 = suPasscodePolicyToSUSUIPasscodePolicyType(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
}

- (id)_remoteInterface
{
  -[SUSUIControllerClient _connectToServerIfNecessary](self, "_connectToServerIfNecessary");
  return -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy");
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  id location[2];
  SUSUIControllerClient *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUIControllerClient _connectToServerIfNecessary](v6, "_connectToServerIfNecessary");
  v4 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v6->_serverConnection, "remoteObjectProxyWithErrorHandler:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (void)_invalidateConnection
{
  if (self->_serverConnection)
  {
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:");
    -[NSXPCConnection setInterruptionHandler:](self->_serverConnection, "setInterruptionHandler:", 0);
    -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
    objc_storeStrong((id *)&self->_serverConnection, 0);
    self->_connected = 0;
  }
}

- (void)_connectToServerIfNecessary
{
  NSXPCConnection *serverConnection;
  NSXPCConnection *v3;
  id v4;
  NSXPCConnection *v5;
  id v6;
  NSXPCConnection *v7;
  id v8;
  NSXPCConnection *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15);
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id from;
  os_log_type_t v27;
  os_log_t location[2];
  SUSUIControllerClient *v29;
  uint8_t v30[16];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (os_log_t)a2;
  if (!self->_connected)
  {
    location[0] = (os_log_t)SUSUILog();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v31, (uint64_t)v29);
      _os_log_impl(&dword_218F45000, location[0], v27, "Client <%p>: establishing connection to softwareupdateservicesui plugin.", v31, 0xCu);
    }
    objc_storeStrong((id *)location, 0);
    -[SUSUIControllerClient _invalidateConnection](v29, "_invalidateConnection");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.softwareupdateservicesui.controller"), 4096);
    serverConnection = v29->_serverConnection;
    v29->_serverConnection = (NSXPCConnection *)v10;

    v9 = v29->_serverConnection;
    v8 = MEMORY[0x24BDAC9B8];
    -[NSXPCConnection _setQueue:](v9, "_setQueue:");

    v7 = v29->_serverConnection;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503BEB8);
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:");

    v5 = v29->_serverConnection;
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503BEB8);
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:");

    -[NSXPCConnection setExportedObject:](v29->_serverConnection, "setExportedObject:", v29);
    objc_initWeak(&from, v29);
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke;
    v23 = &unk_24DA41510;
    objc_copyWeak(&v24, &from);
    v25 = (id)MEMORY[0x219A268AC](&v19);
    -[NSXPCConnection setInvalidationHandler:](v29->_serverConnection, "setInvalidationHandler:", v25);
    v3 = v29->_serverConnection;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke_2;
    v16 = &unk_24DA41538;
    objc_copyWeak(&v18, &from);
    v17 = v25;
    -[NSXPCConnection setInterruptionHandler:](v3, "setInterruptionHandler:", &v12);
    -[NSXPCConnection resume](v29->_serverConnection, "resume");
    v29->_connected = 1;
    v29->_serverIsExiting = 0;
    v11 = SUSUILog();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v30, (uint64_t)v29);
      _os_log_impl(&dword_218F45000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Client <%p>: connection established to softwareupdateservicesui plugin.", v30, 0xCu);
    }
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v17, 0);
    objc_destroyWeak(&v18);
    objc_storeStrong(&v25, 0);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&from);
  }
}

void __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteConnectionDropped");

}

uint64_t __52__SUSUIControllerClient__connectToServerIfNecessary__block_invoke_2(NSObject *a1)
{
  id WeakRetained;
  os_log_t oslog[3];
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)&a1[5].isa);
    __os_log_helper_16_0_1_8_0((uint64_t)v5, (uint64_t)WeakRetained);
    _os_log_impl(&dword_218F45000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: softwareupdateservicesui plugin exit detected.", v5, 0xCu);

  }
  objc_storeStrong((id *)oslog, 0);
  return (*((uint64_t (**)(void))a1[4].isa + 2))();
}

- (void)_noteConnectionDropped
{
  os_log_t oslog[2];
  SUSUIControllerClient *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_218F45000, oslog[0], OS_LOG_TYPE_DEFAULT, "Client <%p>: disconnected from softwareupdateservicesui plugin.", v4, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  v3->_connected = 0;
}

- (void)_noteServerExiting
{
  self->_serverIsExiting = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
