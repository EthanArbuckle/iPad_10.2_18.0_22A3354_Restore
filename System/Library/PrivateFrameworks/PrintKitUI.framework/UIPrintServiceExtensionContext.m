@implementation UIPrintServiceExtensionContext

- (UIPrintServiceExtensionContext)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIPrintServiceExtensionContext;
  return -[UIPrintServiceExtensionContext init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIPrintServiceExtensionContext;
  -[UIPrintServiceExtensionContext dealloc](&v2, sel_dealloc);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F01B45C0);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0199378);
}

- (void)_gatherPrintersForPrintInfo:(id)a3 reply:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(id, id);
  _QWORD v14[4];
  id v15;

  v13 = (void (**)(id, id))a4;
  +[UIPrintInfo printInfoWithDictionary:](UIPrintInfo, "printInfoWithDictionary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintServiceExtensionContext _principalObject](self, "_principalObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0
    && (-[UIPrintServiceExtensionContext _principalObject](self, "_principalObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "printerDestinationsForPrintInfo:", v6),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    v11 = (void *)objc_opt_new();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__UIPrintServiceExtensionContext__gatherPrintersForPrintInfo_reply___block_invoke;
    v14[3] = &unk_1E9D97C18;
    v15 = v11;
    v12 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
    v13[2](v13, v12);

  }
  else
  {
    v13[2](v13, (id)MEMORY[0x1E0C9AA60]);
  }

}

void __68__UIPrintServiceExtensionContext__gatherPrintersForPrintInfo_reply___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_authenticatedRequestForRequest:(id)a3 challengeResponse:(id)a4 reply:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  -[UIPrintServiceExtensionContext _principalObject](self, "_principalObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "_authenticatedRequestForRequest:challengeResponse:reply:", v11, v8, v9);
  else
    v9[2](v9, 0);

}

- (void)_apOp:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[UIPrintServiceExtensionContext _principalObject](self, "_principalObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "_apOp:reply:", v8, v6);
  else
    v6[2](v6, 0);

}

@end
