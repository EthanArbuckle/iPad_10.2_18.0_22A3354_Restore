@implementation UIInputViewControllerInterfaceClient

- (id)responseDelegate
{
  void *v2;
  void *v3;

  -[UIInputViewControllerInterfaceClient _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_tearDownRemoteService
{
  -[UIInputViewControllerInterfaceClient completeRequestReturningItems:completionHandler:](self, "completeRequestReturningItems:completionHandler:", MEMORY[0x1E0C9AA60], 0);
}

- (void)_handleInputViewControllerState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UIInputViewControllerInterfaceClient forwardingInterface](self, "forwardingInterface");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_handleInputViewControllerState:", v4);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[UIRemoteInputViewControllerInterface _extensionAuxiliaryHostProtocol](UIRemoteInputViewControllerInterface, "_extensionAuxiliaryHostProtocol");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[UIRemoteInputViewControllerInterface _extensionAuxiliaryVendorProtocol](UIRemoteInputViewControllerInterface, "_extensionAuxiliaryVendorProtocol");
}

- (void)setForwardingInterface:(id)a3
{
  _UIIVCInterface *v4;
  _UIIVCInterface *forwardingInterface;
  _UIIVCInterface *v6;
  id v7;

  v4 = (_UIIVCInterface *)a3;
  -[_UIIVCInterface setResponseDelegate:](self->_forwardingInterface, "setResponseDelegate:", 0);
  forwardingInterface = self->_forwardingInterface;
  self->_forwardingInterface = v4;
  v6 = v4;

  -[UIInputViewControllerInterfaceClient responseDelegate](self, "responseDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIIVCInterface setResponseDelegate:](self->_forwardingInterface, "setResponseDelegate:", v7);

}

- (void)dealloc
{
  objc_super v3;

  -[_UIIVCInterface setResponseDelegate:](self->_forwardingInterface, "setResponseDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewControllerInterfaceClient;
  -[UIInputViewControllerInterfaceClient dealloc](&v3, sel_dealloc);
}

- (_UIIVCInterface)forwardingInterface
{
  return self->_forwardingInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forwardingInterface, 0);
}

@end
