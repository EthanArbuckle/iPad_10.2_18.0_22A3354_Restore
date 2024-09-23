@implementation PXRemoteDiagnosticsService

uint64_t __73__PXRemoteDiagnosticsService_startServerOnInternalDevicesWithAgentClass___block_invoke(uint64_t a1)
{
  PXRemoteDiagnosticsService *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(PXRemoteDiagnosticsService);
  v3 = (void *)startServerOnInternalDevicesWithAgentClass__service;
  startServerOnInternalDevicesWithAgentClass__service = (uint64_t)v2;

  objc_msgSend(*(id *)(a1 + 32), "localDiagnosticsAgent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)startServerOnInternalDevicesWithAgentClass__service, "setAgent:", v4);

  return objc_msgSend((id)startServerOnInternalDevicesWithAgentClass__service, "_startListening");
}

void __45__PXRemoteDiagnosticsService__startListening__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error setting photos XPC endpoint: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");

}

void __45__PXRemoteDiagnosticsService__startListening__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_endpoint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "agent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "agent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "assetsdClient");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D719C0], "sharedAssetsdClientForPhotoLibraryURL:", v9);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "diagnosticsClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PXRemoteDiagnosticsService__startListening__block_invoke_2;
    v12[3] = &unk_1E5148B78;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "setPhotosXPCEndpoint:completionHandler:", v6, v12);

  }
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (PXRemoteDiagnosticsService)init
{
  PXRemoteDiagnosticsService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *diagnosticsQueue;
  PXRemoteDiagnosticsService *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXRemoteDiagnosticsService;
  v2 = -[PXRemoteDiagnosticsService init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.photosuicore.diagnostics", 0);
    diagnosticsQueue = v2->_diagnosticsQueue;
    v2->_diagnosticsQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (PXDiagnosticsAgent)agent
{
  return self->_agent;
}

- (void)_startListening
{
  NSObject *diagnosticsQueue;
  _QWORD block[5];

  diagnosticsQueue = self->_diagnosticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PXRemoteDiagnosticsService__startListening__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(diagnosticsQueue, block);
}

+ (void)startServerOnInternalDevicesWithAgentClass:(Class)a3
{
  void *v6;
  _QWORD block[5];

  if (!+[PXApplicationState isRunningInPhotosApp](PXApplicationState, "isRunningInPhotosApp"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXRemoteDiagnosticsService.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXApplicationState.isRunningInPhotosApp"));

  }
  if (PFOSVariantHasInternalUI())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__PXRemoteDiagnosticsService_startServerOnInternalDevicesWithAgentClass___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = a3;
    if (startServerOnInternalDevicesWithAgentClass__onceToken != -1)
      dispatch_once(&startServerOnInternalDevicesWithAgentClass__onceToken, block);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3B50];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_1EEBEB078);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  -[PXRemoteDiagnosticsService agent](self, "agent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedObject:", v8);

  objc_msgSend(v6, "resume");
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_diagnosticsQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
