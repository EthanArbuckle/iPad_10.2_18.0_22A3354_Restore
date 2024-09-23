@implementation _SHMediaLibrary(Presentation)

+ (void)_presentMediaLibraryWithCompletionHandler:()Presentation
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "sh_uiServerConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75___SHMediaLibrary_Presentation___presentMediaLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F136148;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "presentMediaLibraryWithCompletionHandler:", v7);

}

+ (id)sh_uiServerConnection
{
  if (sh_uiServerConnection_onceToken_0[0] != -1)
    dispatch_once(sh_uiServerConnection_onceToken_0, &__block_literal_global_0);
  return (id)sh_uiServerConnection_serverConnection_0;
}

@end
