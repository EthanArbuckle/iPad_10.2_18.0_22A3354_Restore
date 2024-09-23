@implementation SHMediaLibrary

void __75___SHMediaLibrary_Presentation___presentMediaLibraryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x24BDE97C8], "remapErrorToClientError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54___SHMediaLibrary_Presentation__sh_uiServerConnection__block_invoke()
{
  SHShazamKitUIServiceConnection *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SHShazamKitUIServiceConnection alloc];
  v3 = (id)objc_opt_new();
  v1 = -[SHShazamKitUIServiceConnection initWithConnectionProvider:](v0, "initWithConnectionProvider:", v3);
  v2 = (void *)sh_uiServerConnection_serverConnection_0;
  sh_uiServerConnection_serverConnection_0 = v1;

}

@end
