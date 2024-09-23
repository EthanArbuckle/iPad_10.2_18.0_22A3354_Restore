@implementation SUSUICommandLineToolClient

- (SUSUICommandLineToolClient)init
{
  SUSUICommandLineToolClient *v3;
  SUSUICommandLineToolClient *v4;

  v4 = 0;
  v4 = -[SUSUICommandLineToolClient initWithDelegate:](self, "initWithDelegate:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (SUSUICommandLineToolClient)initWithDelegate:(id)a3
{
  SUSUICommandLineToolClient *v3;
  SUSUICommandLineToolClient *v5;
  SUSUICommandLineToolClient *v6;
  objc_super v7;
  id location[2];
  SUSUICommandLineToolClient *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)SUSUICommandLineToolClient;
  v6 = -[SUSUICommandLineToolClient init](&v7, sel_init);
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    -[SUSUICommandLineToolClient setDelegate:](v9, "setDelegate:", location[0]);
    -[SUSUICommandLineToolClient _connectToServerIfNecessary](v9, "_connectToServerIfNecessary");
  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  -[SUSUICommandLineToolClient _invalidateConnection](self, "_invalidateConnection");
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  SUSUICommandLineToolClient *v4;

  v4 = self;
  v3 = a2;
  objc_storeWeak((id *)&self->_delegate, 0);
  -[SUSUICommandLineToolClient _invalidateConnection](v4, "_invalidateConnection");
  v2.receiver = v4;
  v2.super_class = (Class)SUSUICommandLineToolClient;
  -[SUSUICommandLineToolClient dealloc](&v2, sel_dealloc);
}

- (void)showMiniAlertWithScan:(unint64_t)a3 errorCode:(id)a4 result:(id)a5
{
  SUSUICommandLineToolClient *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(_QWORD *, void *, void *);
  void *v15;
  id v16[2];
  int v17;
  int v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id location;
  unint64_t v24;
  SEL v25;
  SUSUICommandLineToolClient *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v6 = v26;
  v7 = MEMORY[0x24BDAC760];
  v16[1] = (id)MEMORY[0x24BDAC760];
  v17 = -1073741824;
  v18 = 0;
  v19 = __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke;
  v20 = &unk_24DA41498;
  v21 = v22;
  v10 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v6, "_remoteInterfaceWithErrorHandler:");
  v8 = v24;
  v9 = location;
  v11 = v7;
  v12 = -1073741824;
  v13 = 0;
  v14 = __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke_2;
  v15 = &unk_24DA414C0;
  v16[0] = v22;
  objc_msgSend(v10, "showMiniAlertWithScan:errorCode:result:", v8, v9);

  objc_storeStrong(v16, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __69__SUSUICommandLineToolClient_showMiniAlertWithScan_errorCode_result___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)showMiniAlertWithDescriptors:(unint64_t)a3 errorCode:(id)a4 downloadDescriptor:(id)a5 scanResultsDescriptor:(id)a6 autoInstallForecast:(id)a7 andRollbackDescriptor:(id)a8 result:(id)a9
{
  SUSUICommandLineToolClient *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(_QWORD *, void *, void *);
  void *v26;
  id v27[2];
  int v28;
  int v29;
  void (*v30)(_QWORD *, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id location;
  unint64_t v39;
  SEL v40;
  SUSUICommandLineToolClient *v41;

  v41 = self;
  v40 = a2;
  v39 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v36 = 0;
  objc_storeStrong(&v36, a6);
  v35 = 0;
  objc_storeStrong(&v35, a7);
  v34 = 0;
  objc_storeStrong(&v34, a8);
  v33 = 0;
  objc_storeStrong(&v33, a9);
  v13 = v41;
  v14 = MEMORY[0x24BDAC760];
  v27[1] = (id)MEMORY[0x24BDAC760];
  v28 = -1073741824;
  v29 = 0;
  v30 = __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke;
  v31 = &unk_24DA41498;
  v32 = v33;
  v21 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v13, "_remoteInterfaceWithErrorHandler:");
  v15 = v39;
  v16 = location;
  v17 = v37;
  v18 = v36;
  v19 = v35;
  v20 = v34;
  v22 = v14;
  v23 = -1073741824;
  v24 = 0;
  v25 = __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke_2;
  v26 = &unk_24DA414C0;
  v27[0] = v33;
  objc_msgSend(v21, "showMiniAlertWithDescriptors:errorCode:downloadDescriptor:scanResultsDescriptor:autoInstallForecast:andRollbackDescriptor:result:", v15, v16, v17, v18, v19, v20, &v22);

  objc_storeStrong(v27, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&location, 0);
}

void __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __159__SUSUICommandLineToolClient_showMiniAlertWithDescriptors_errorCode_downloadDescriptor_scanResultsDescriptor_autoInstallForecast_andRollbackDescriptor_result___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)dismissAllAlerts
{
  id v2;

  v2 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v2, "dismissAllAlerts");

}

- (void)showFollowUp:(unint64_t)a3
{
  id v3;

  v3 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v3, "showFollowUp:", a3);

}

- (void)showLaggardsUi:(unint64_t)a3 usingFakeData:(BOOL)a4 result:(id)a5
{
  id v5;
  id location;
  BOOL v7;
  unint64_t v8;
  SEL v9;
  SUSUICommandLineToolClient *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v5 = -[SUSUICommandLineToolClient _remoteInterface](v10, "_remoteInterface");
  objc_msgSend(v5, "showLaggardsUi:usingFakeData:result:", v8, v7, location);

  objc_storeStrong(&location, 0);
}

- (void)showAuthenticationUIWithOptions:(unint64_t)a3 result:(id)a4
{
  SUSUICommandLineToolClient *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, char, id);
  void *v12;
  id v13[2];
  int v14;
  int v15;
  void (*v16)(_QWORD *, void *);
  void *v17;
  id v18;
  id location;
  unint64_t v20;
  SEL v21;
  SUSUICommandLineToolClient *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v22;
  v5 = MEMORY[0x24BDAC760];
  v13[1] = (id)MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke;
  v17 = &unk_24DA41498;
  v18 = location;
  v7 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v4, "_remoteInterfaceWithErrorHandler:");
  v6 = v20;
  v8 = v5;
  v9 = -1073741824;
  v10 = 0;
  v11 = __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke_2;
  v12 = &unk_24DA414E8;
  v13[0] = location;
  objc_msgSend(v7, "showAuthenticationUIWithOptions:result:", v6);

  objc_storeStrong(v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
}

void __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __69__SUSUICommandLineToolClient_showAuthenticationUIWithOptions_result___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  BSDispatchQueueAssertMain();
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)showEmergencyCallUIWithOptions:(unint64_t)a3 result:(id)a4
{
  SUSUICommandLineToolClient *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, char, id);
  void *v12;
  id v13[2];
  int v14;
  int v15;
  void (*v16)(_QWORD *, void *);
  void *v17;
  id v18;
  id location;
  unint64_t v20;
  SEL v21;
  SUSUICommandLineToolClient *v22;

  v22 = self;
  v21 = a2;
  v20 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v22;
  v5 = MEMORY[0x24BDAC760];
  v13[1] = (id)MEMORY[0x24BDAC760];
  v14 = -1073741824;
  v15 = 0;
  v16 = __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke;
  v17 = &unk_24DA41498;
  v18 = location;
  v7 = -[SUSUICommandLineToolClient _remoteInterfaceWithErrorHandler:](v4, "_remoteInterfaceWithErrorHandler:");
  v6 = v20;
  v8 = v5;
  v9 = -1073741824;
  v10 = 0;
  v11 = __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke_2;
  v12 = &unk_24DA414E8;
  v13[0] = location;
  objc_msgSend(v7, "showEmergencyCallUIWithOptions:result:", v6);

  objc_storeStrong(v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
}

void __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BSDispatchQueueAssertMain();
  if (a1[4])
    (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

void __68__SUSUICommandLineToolClient_showEmergencyCallUIWithOptions_result___block_invoke_2(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  BSDispatchQueueAssertMain();
  if (*(_QWORD *)(a1 + 32))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)toggleSettingsBadge:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v3, "toggleSettingsBadge:", v4);

}

- (void)reboot:(BOOL)a3
{
  id v3;
  BOOL v4;

  v4 = a3;
  v3 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v3, "reboot:", v4);

}

- (void)simulateComingFromOTAUpdate
{
  id v2;

  v2 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v2, "simulateComingFromOTAUpdate");

}

- (void)downloadDidFinish
{
  id v2;

  v2 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v2, "downloadDidFinish");

}

- (void)setPasscodePolicy:(unint64_t)a3
{
  id v3;

  v3 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v3, "setPasscodePolicy:", a3);

}

- (id)URLForType:(unint64_t)a3
{
  os_log_t oslog;
  id location;
  unint64_t v6;
  SEL v7;
  SUSUICommandLineToolClient *v8;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = self;
  v7 = a2;
  v6 = a3;
  location = 0;
  if (a3 <= 3)
    __asm { BR              X8 }
  oslog = (os_log_t)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v10, v6);
    _os_log_impl(&dword_218F45000, oslog, OS_LOG_TYPE_DEFAULT, "Unsupported Preference pane: %lu", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v9 = 0;
  objc_storeStrong(&location, 0);
  return v9;
}

- (id)_remoteInterface
{
  return -[NSXPCConnection remoteObjectProxy](self->_serverConnection, "remoteObjectProxy", a2, self);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4;
  id location[2];
  SUSUICommandLineToolClient *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSUICommandLineToolClient _connectToServerIfNecessary](v6, "_connectToServerIfNecessary");
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
  SUSUICommandLineToolClient *v29;
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
    -[SUSUICommandLineToolClient _invalidateConnection](v29, "_invalidateConnection");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.softwareupdateservicesui.tool"), 4096);
    serverConnection = v29->_serverConnection;
    v29->_serverConnection = (NSXPCConnection *)v10;

    v9 = v29->_serverConnection;
    v8 = MEMORY[0x24BDAC9B8];
    -[NSXPCConnection _setQueue:](v9, "_setQueue:");

    v7 = v29->_serverConnection;
    v6 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503F620);
    -[NSXPCConnection setRemoteObjectInterface:](v7, "setRemoteObjectInterface:");

    v5 = v29->_serverConnection;
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25503AC90);
    -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:");

    -[NSXPCConnection setExportedObject:](v29->_serverConnection, "setExportedObject:", v29);
    objc_initWeak(&from, v29);
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke;
    v23 = &unk_24DA41510;
    objc_copyWeak(&v24, &from);
    v25 = (id)MEMORY[0x219A268AC](&v19);
    -[NSXPCConnection setInvalidationHandler:](v29->_serverConnection, "setInvalidationHandler:", v25);
    v3 = v29->_serverConnection;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke_2;
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

void __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  BSDispatchQueueAssertMain();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_noteConnectionDropped");

}

uint64_t __57__SUSUICommandLineToolClient__connectToServerIfNecessary__block_invoke_2(NSObject *a1)
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
  SUSUICommandLineToolClient *v3;
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

- (void)getDDMAlertStatus:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  SUSUICommandLineToolClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUICommandLineToolClient _remoteInterface](v11, "_remoteInterface");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__SUSUICommandLineToolClient_getDDMAlertStatus___block_invoke;
  v8 = &unk_24DA41560;
  v9 = location[0];
  objc_msgSend(v3, "getDDMAlertStatus:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__SUSUICommandLineToolClient_getDDMAlertStatus___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4
{
  id v4;
  BOOL v5;

  v5 = a4;
  v4 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v4, "showDDMAlert:install:", a3, v5);

}

- (void)ddmInstallNow
{
  id v2;

  v2 = -[SUSUICommandLineToolClient _remoteInterface](self, "_remoteInterface");
  objc_msgSend(v2, "ddmInstallNow");

}

- (void)getAlertStatus:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id location[2];
  SUSUICommandLineToolClient *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[SUSUICommandLineToolClient _remoteInterface](v11, "_remoteInterface");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __45__SUSUICommandLineToolClient_getAlertStatus___block_invoke;
  v8 = &unk_24DA41560;
  v9 = location[0];
  objc_msgSend(v3, "getAlertStatus:");

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __45__SUSUICommandLineToolClient_getAlertStatus___block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (SUSUICommandLineToolClientDelegate)delegate
{
  return (SUSUICommandLineToolClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
