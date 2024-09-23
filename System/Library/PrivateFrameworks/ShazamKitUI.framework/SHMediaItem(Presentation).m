@implementation SHMediaItem(Presentation)

+ (id)sh_uiServerConnection
{
  if (sh_uiServerConnection_onceToken != -1)
    dispatch_once(&sh_uiServerConnection_onceToken, &__block_literal_global);
  return (id)sh_uiServerConnection_serverConnection;
}

+ (void)presentMediaItem:()Presentation completionHandler:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = a3;
    objc_msgSend(a1, "sh_uiServerConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__SHMediaItem_Presentation__presentMediaItem_completionHandler___block_invoke;
    v9[3] = &unk_24F136148;
    v10 = v6;
    objc_msgSend(v8, "presentMediaItem:completionHandler:", v7, v9);

  }
}

+ (void)presentMediaItem:()Presentation presentationSettings:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  if (v8)
  {
    v9 = a4;
    v10 = a3;
    objc_msgSend(a1, "sh_uiServerConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__SHMediaItem_Presentation__presentMediaItem_presentationSettings_completionHandler___block_invoke;
    v12[3] = &unk_24F136170;
    v13 = v8;
    objc_msgSend(v11, "presentMediaItem:presentationSettings:completionHandler:", v10, v9, v12);

  }
}

@end
