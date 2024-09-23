@implementation UIRemoteInputViewControllerInterface

- (void)dealloc
{
  _UIIVCResponseDelegate *responseDelegate;
  objc_super v4;

  responseDelegate = self->_responseDelegate;
  self->_responseDelegate = 0;

  v4.receiver = self;
  v4.super_class = (Class)UIRemoteInputViewControllerInterface;
  -[UIRemoteInputViewControllerInterface dealloc](&v4, sel_dealloc);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1ECD79E50 != -1)
    dispatch_once(&qword_1ECD79E50, &__block_literal_global_313);
  return (id)_MergedGlobals_1_13;
}

void __71__UIRemoteInputViewControllerInterface__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDE91780);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_13;
  _MergedGlobals_1_13 = v0;

  v2 = (void *)_MergedGlobals_1_13;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel__performInputViewControllerOutput_, 0, 0);

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1ECD79E60 != -1)
    dispatch_once(&qword_1ECD79E60, &__block_literal_global_88_2);
  return (id)qword_1ECD79E58;
}

void __73__UIRemoteInputViewControllerInterface__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDF79EA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD79E58;
  qword_1ECD79E58 = v0;

  v2 = (void *)qword_1ECD79E58;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel__handleInputViewControllerState_, 0, 0);

}

- (void)_performInputViewControllerOutput:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIRemoteInputViewControllerInterface responseDelegate](self, "responseDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_performInputViewControllerOutput:", v4);

}

- (void)_tearDownRemoteService
{
  void *v2;
  id v3;

  -[UIRemoteInputViewControllerInterface _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_tearDownRemoteService");

}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[UIRemoteInputViewControllerInterface _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleInputViewControllerState:", v4);

}

- (void)_openURL:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (_UIIVCResponseDelegate)responseDelegate
{
  return self->_responseDelegate;
}

- (void)setResponseDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_responseDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDelegate, 0);
}

@end
