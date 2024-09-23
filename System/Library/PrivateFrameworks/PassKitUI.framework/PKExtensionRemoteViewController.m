@implementation PKExtensionRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE66E200);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE563FE0);
}

- (id)serviceViewControllerInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serviceViewControllerInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "exportedInterface");
}

- (PKExtensionRemoteViewControllerDelegate)delegate
{
  return (PKExtensionRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
