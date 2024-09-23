@implementation SLConversationExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_2);
  return (id)_extensionAuxiliaryVendorProtocol_interface;
}

void __71__SLConversationExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE379580);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface;
  _extensionAuxiliaryVendorProtocol_interface = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_40);
  return (id)_extensionAuxiliaryHostProtocol_interface;
}

void __69__SLConversationExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE38C5E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface;
  _extensionAuxiliaryHostProtocol_interface = v0;

}

- (void)requestDismissal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SLConversationExtensionHostContext_requestDismissal__block_invoke;
  block[3] = &unk_1E3794360;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __54__SLConversationExtensionHostContext_requestDismissal__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "dismissalRequestHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissalRequestHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  -[SLConversationExtensionHostContext createURLWithMessageGUIDForCurrentURL:](self, "createURLWithMessageGUIDForCurrentURL:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SLConversationExtensionHostContext_openURL_completionHandler___block_invoke;
  block[3] = &unk_1E3794360;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__SLConversationExtensionHostContext_openURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);

}

- (id)createURLWithMessageGUIDForCurrentURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB39D8];
  -[SLConversationExtensionHostContext messageGUID](self, "messageGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "queryItemWithName:value:", CFSTR("message-guid"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v10);

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("overlay"), CFSTR("1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v11);

  objc_msgSend(v4, "setQueryItems:", v7);
  objc_msgSend(v4, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)dismissalRequestHandler
{
  return self->_dismissalRequestHandler;
}

- (void)setDismissalRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (void)setMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageGUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong(&self->_dismissalRequestHandler, 0);
}

@end
