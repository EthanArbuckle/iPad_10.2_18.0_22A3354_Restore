@implementation DADiagnosticsLauncher

- (DADiagnosticsLauncher)initWithDelegate:(id)a3
{
  id v5;
  DADiagnosticsLauncher *v6;
  DADiagnosticsLauncher *v7;
  NSXPCConnection *xpcConnection;
  BSProcessHandle *diagsProcess;
  RBSProcessMonitor *processMonitor;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DADiagnosticsLauncher;
  v6 = -[DADiagnosticsLauncher init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isDiagsRunning = 0;
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = 0;

    diagsProcess = v7->_diagsProcess;
    v7->_diagsProcess = 0;

    processMonitor = v7->_processMonitor;
    v7->_processMonitor = 0;

    v7->_exitReason = -1;
    objc_storeStrong((id *)&v7->_delegate, a3);
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[DADiagnosticsLauncher xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DADiagnosticsLauncher xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[DADiagnosticsLauncher xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[DADiagnosticsLauncher setXpcConnection:](self, "setXpcConnection:", 0);
  }
  -[DADiagnosticsLauncher _deinitProcessMonitor](self, "_deinitProcessMonitor");
  v6.receiver = self;
  v6.super_class = (Class)DADiagnosticsLauncher;
  -[DADiagnosticsLauncher dealloc](&v6, sel_dealloc);
}

- (void)launchDiagnostics
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22AEC1000, v0, v1, "Unable to launch Diagnostics - unable to create open application service!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BE38478];
  v8[0] = *MEMORY[0x24BE382F8];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("diags://"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x24BE38310];
  v9[0] = v3;
  v9[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "optionsWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_2;
  v7[3] = &unk_24F53DEE8;
  v6 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "openApplication:withOptions:completion:", CFSTR("com.apple.Diagnostics"), v5, v7);

}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3;
  block[3] = &unk_24F53DEC0;
  v11 = v6;
  v12 = v5;
  v13 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

uint64_t __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  void *v6;
  NSObject *v7;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    DiagnosticLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_1(v2, v3);

    objc_msgSend(*(id *)(a1 + 48), "setDiagsProcess:", 0);
    v4 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setDiagsProcess:");
    objc_msgSend(*(id *)(a1 + 48), "setIsDiagsRunning:", 1);
    objc_msgSend(*(id *)(a1 + 48), "_initProcessMonitor");
    objc_msgSend(*(id *)(a1 + 48), "xpcConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

LABEL_10:
      v4 = 0;
      return objc_msgSend(*(id *)(a1 + 48), "diagnosticsAppLaunchedWithResult:", v4);
    }
    if ((objc_msgSend(*(id *)(a1 + 48), "_establishConnection") & 1) != 0)
      goto LABEL_10;
    DiagnosticLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_2();

    v4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 48), "diagnosticsAppLaunchedWithResult:", v4);
}

- (void)diagnosticsExitingForReason:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  DiagnosticLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_22AEC1000, v5, OS_LOG_TYPE_DEFAULT, "Diagnostics app is exiting for %ld", (uint8_t *)&v8, 0xCu);
  }

  -[DADiagnosticsLauncher setIsDiagsRunning:](self, "setIsDiagsRunning:", 0);
  -[DADiagnosticsLauncher _deinitProcessMonitor](self, "_deinitProcessMonitor");
  -[DADiagnosticsLauncher delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DADiagnosticsLauncher delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diagnosticsAppDidExitWithReason:", a3);

  }
}

- (BOOL)_establishConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  id location;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  dispatch_semaphore_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.diagnostics.launcher-service"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B678B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B670D8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setExportedInterface:", v5);
  objc_msgSend(v3, "setExportedObject:", self);
  objc_msgSend(v3, "activate");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __45__DADiagnosticsLauncher__establishConnection__block_invoke;
  v17[3] = &unk_24F53DD48;
  v17[4] = &v20;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__0;
    v30 = __Block_byref_object_dispose__0;
    v31 = dispatch_semaphore_create(0);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __45__DADiagnosticsLauncher__establishConnection__block_invoke_63;
    v16[3] = &unk_24F53DD70;
    v16[4] = &v26;
    objc_msgSend(v7, "ping:", v16);
    v8 = v27[5];
    v9 = dispatch_time(0, 2000000000);
    v10 = dispatch_semaphore_wait(v8, v9);
    v11 = v10 == 0;
    if (v10)
    {
      DiagnosticLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[DADiagnosticsLauncher _establishConnection].cold.2();

    }
    else
    {
      -[DADiagnosticsLauncher setXpcConnection:](self, "setXpcConnection:", v3);
      -[DADiagnosticsLauncher setDiagnosticsLauncherServer:](self, "setDiagnosticsLauncherServer:", v7);
    }
    _Block_object_dispose(&v26, 8);

  }
  else
  {
    DiagnosticLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v21[5], "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[DADiagnosticsLauncher _establishConnection].cold.1(v14, (uint64_t)&v26, v13);
    }

    v11 = 0;
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __45__DADiagnosticsLauncher__establishConnection__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setXpcConnection:", 0);

}

intptr_t __45__DADiagnosticsLauncher__establishConnection__block_invoke_63(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)_initProcessMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  DADiagnosticsLauncher *v13;

  -[DADiagnosticsLauncher processMonitor](self, "processMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.Diagnostics"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE80CF8], "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BE80CC8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke;
    v10[3] = &unk_24F53DF60;
    v11 = v4;
    v12 = v5;
    v13 = self;
    v7 = v5;
    v9 = v4;
    objc_msgSend(v6, "monitorWithConfiguration:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DADiagnosticsLauncher setProcessMonitor:](self, "setProcessMonitor:", v8);

  }
}

void __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a1[4];
  v3 = (void *)MEMORY[0x24BDBCE30];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicates:", v5);

  objc_msgSend(v4, "setStateDescriptor:", a1[5]);
  objc_msgSend(v4, "setEvents:", 1);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke_2;
  v6[3] = &unk_24F53DF38;
  v6[4] = a1[6];
  objc_msgSend(v4, "setUpdateHandler:", v6);

}

void __44__DADiagnosticsLauncher__initProcessMonitor__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "diagsProcess");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(*(id *)(a1 + 32), "diagsProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pid");
    if (v10 == objc_msgSend(v18, "pid"))
    {
      objc_msgSend(v6, "exitEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "exitEvent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "context");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "type");

        v15 = *(void **)(a1 + 32);
        if (v14 == 1)
        {
          v16 = v15;
          v17 = 0;
        }
        else
        {
          v17 = objc_msgSend(v15, "exitReason");
          v16 = v15;
        }
        objc_msgSend(v16, "diagnosticsExitingForReason:", v17);
      }
    }
    else
    {

    }
  }

}

- (void)_deinitProcessMonitor
{
  void *v3;
  void *v4;

  -[DADiagnosticsLauncher processMonitor](self, "processMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DADiagnosticsLauncher processMonitor](self, "processMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[DADiagnosticsLauncher setProcessMonitor:](self, "setProcessMonitor:", 0);
  }
}

- (void)diagnosticsAppLaunchedWithResult:(int64_t)a3
{
  void *v5;
  id v6;

  -[DADiagnosticsLauncher delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DADiagnosticsLauncher delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diagnosticsAppLaunchedWithResult:", a3);

  }
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DADiagnosticsLauncherServerProtocol)diagnosticsLauncherServer
{
  return (DADiagnosticsLauncherServerProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDiagnosticsLauncherServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isDiagsRunning
{
  return self->_isDiagsRunning;
}

- (void)setIsDiagsRunning:(BOOL)a3
{
  self->_isDiagsRunning = a3;
}

- (DADiagnosticsLauncherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (int64_t)exitReason
{
  return self->_exitReason;
}

- (void)setExitReason:(int64_t)a3
{
  self->_exitReason = a3;
}

- (BSProcessHandle)diagsProcess
{
  return self->_diagsProcess;
}

- (void)setDiagsProcess:(id)a3
{
  objc_storeStrong((id *)&self->_diagsProcess, a3);
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_diagsProcess, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_diagnosticsLauncherServer, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_22AEC1000, a2, v4, "Failed to launch Diagnostics with error: %@", (uint8_t *)&v5);

}

void __42__DADiagnosticsLauncher_launchDiagnostics__block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22AEC1000, v0, v1, "Diagnostics launched, but unable to connect to Launcher service!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_establishConnection
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22AEC1000, v0, v1, "Launcher service timed out pinging Diagnostics app", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
