@implementation DADiagnosticsRemoteRunner

- (DADiagnosticsRemoteRunner)initWithDelegate:(id)a3
{
  id v4;
  DADiagnosticsRemoteRunner *v5;
  DADiagnosticsRemoteRunner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DADiagnosticsRemoteRunner;
  v5 = -[DADiagnosticsRemoteRunner init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DADiagnosticsRemoteRunner setDelegate:](v5, "setDelegate:", v4);
    if (!-[DADiagnosticsRemoteRunner _establishConnection](v6, "_establishConnection"))
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[DADiagnosticsRemoteRunner xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DADiagnosticsRemoteRunner xpcConnection](self, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "suspend");

    -[DADiagnosticsRemoteRunner xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[DADiagnosticsRemoteRunner setXpcConnection:](self, "setXpcConnection:", 0);
  }
  -[DADiagnosticsRemoteRunner setDelegate:](self, "setDelegate:", 0);
  v6.receiver = self;
  v6.super_class = (Class)DADiagnosticsRemoteRunner;
  -[DADiagnosticsRemoteRunner dealloc](&v6, sel_dealloc);
}

- (BOOL)_establishConnection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *diagsAliveCheckQueue;
  NSObject *v15;
  id v16;
  NSObject *v17;
  dispatch_time_t v18;
  intptr_t v19;
  void *v22;
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  dispatch_semaphore_t v31;
  _QWORD v32[5];
  id v33;
  id location;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[7];
  _QWORD v42[8];

  v42[6] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.diagnostics.remote-runner-service"), 4096);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B57878);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  v42[2] = objc_opt_class();
  v42[3] = objc_opt_class();
  v42[4] = objc_opt_class();
  v42[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_runTestWithID_name_description_parameters_completion_, 3, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  v41[2] = objc_opt_class();
  v41[3] = objc_opt_class();
  v41[4] = objc_opt_class();
  v41[5] = objc_opt_class();
  v41[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_runTestWithID_name_description_parameters_completion_, 0, 1);

  objc_msgSend(v2, "setRemoteObjectInterface:", v22);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B57930);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExportedInterface:", v9);
  objc_msgSend(v2, "setExportedObject:", self);
  objc_msgSend(v2, "activate");
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke;
  v32[3] = &unk_24F53DD48;
  v32[4] = &v35;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && !v36[5])
  {
    v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Diagnostics.RemoteRunnerCheckQueue", MEMORY[0x24BDAC9C0]);
    diagsAliveCheckQueue = self->_diagsAliveCheckQueue;
    self->_diagsAliveCheckQueue = v13;

    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    v31 = dispatch_semaphore_create(0);
    v15 = self->_diagsAliveCheckQueue;
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_2;
    block[3] = &unk_24F53DD98;
    v16 = v11;
    v24 = v16;
    v25 = &v26;
    dispatch_async(v15, block);
    v17 = v27[5];
    v18 = dispatch_time(0, 2000000000);
    v19 = dispatch_semaphore_wait(v17, v18);
    v12 = v19 == 0;
    if (!v19)
    {
      -[DADiagnosticsRemoteRunner setXpcConnection:](self, "setXpcConnection:", v2);
      -[DADiagnosticsRemoteRunner setRemoteRunnerServer:](self, "setRemoteRunnerServer:", v16);
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v12 = 0;
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v35, 8);

  return v12;
}

void __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke(uint64_t a1, void *a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained(v4);
    objc_msgSend(v7, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteRunnerConnectionEndedWithError:", v10);

    v9 = objc_loadWeakRetained(v4);
    objc_msgSend(v9, "setXpcConnection:", 0);

  }
}

uint64_t __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_3;
  v3[3] = &unk_24F53DD70;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "ping:", v3);
}

intptr_t __49__DADiagnosticsRemoteRunner__establishConnection__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)cancelTestWithID:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelTestWithID:completion:", v9, v6);

  }
}

- (void)createRemoteRunnerDeviceWithSerialNumber:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createRemoteRunnerDeviceWithSerialNumber:completion:", v9, v6);

  }
}

- (void)destroyRemoteRunnerDeviceWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destroyRemoteRunnerDeviceWithCompletion:", v6);

  }
}

- (void)getReportWithComponents:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v7)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getReportWithComponents:completion:", v9, v6);

  }
}

- (void)getReportWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v4)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getReportWithCompletion:", v6);

  }
}

- (void)runTestWithID:(id)a3 name:(id)a4 description:(id)a5 parameters:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && v16)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "runTestWithID:name:description:parameters:completion:", v18, v12, v13, v14, v15);

  }
}

- (void)ping:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DADiagnosticsRemoteRunner remoteRunnerServer](self, "remoteRunnerServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ping:", v6);

  }
}

- (void)remoteRunnerDeviceEnded
{
  void *v3;
  id v4;

  -[DADiagnosticsRemoteRunner delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DADiagnosticsRemoteRunner delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteRunnerDeviceEnded");

  }
}

- (void)requestAsset:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[DADiagnosticsRemoteRunner delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DADiagnosticsRemoteRunner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestAsset:completion:", v9, v6);

  }
  else
  {
    v6[2](v6, 0);
  }

}

- (void)requestUploadAssets:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  -[DADiagnosticsRemoteRunner delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[DADiagnosticsRemoteRunner delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestUploadAssets:completion:", v9, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DADiagnosticsRemoteRunner"), -6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, &unk_24F53FAB0, v8);
  }

}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (DARemoteRunnerServerProtocol)remoteRunnerServer
{
  return (DARemoteRunnerServerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteRunnerServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (DADiagnosticsRemoteRunnerDelegate)delegate
{
  return (DADiagnosticsRemoteRunnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)diagsAliveCheckQueue
{
  return self->_diagsAliveCheckQueue;
}

- (void)setDiagsAliveCheckQueue:(id)a3
{
  objc_storeStrong((id *)&self->_diagsAliveCheckQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagsAliveCheckQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_remoteRunnerServer, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
