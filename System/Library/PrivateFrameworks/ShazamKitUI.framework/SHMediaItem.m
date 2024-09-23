@implementation SHMediaItem

void __50__SHMediaItem_Presentation__sh_uiServerConnection__block_invoke()
{
  SHShazamKitUIServiceConnection *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SHShazamKitUIServiceConnection alloc];
  v3 = (id)objc_opt_new();
  v1 = -[SHShazamKitUIServiceConnection initWithConnectionProvider:](v0, "initWithConnectionProvider:", v3);
  v2 = (void *)sh_uiServerConnection_serverConnection;
  sh_uiServerConnection_serverConnection = v1;

}

void __64__SHMediaItem_Presentation__presentMediaItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDE97C8], "remapErrorToClientError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __85__SHMediaItem_Presentation__presentMediaItem_presentationSettings_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDE97C8];
  v7 = a3;
  objc_msgSend(v6, "remapErrorToClientError:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
