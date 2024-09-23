@implementation SBUIPopoverExtensionHostViewController

- (void)_extensionRequestsDismiss
{
  id v3;

  -[SBUIPopoverExtensionHostViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverHostExtensionRequestsDismiss:", self);

}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE798008);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE791580);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)__shouldRemoteViewControllerFenceOperations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[SBUIPopoverExtensionHostViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v4, v5);

  -[SBUIPopoverExtensionHostViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popoverHostExtensionDidExit:", self);

}

- (_SBUIPopoverExtensionHostDelegate)delegate
{
  return (_SBUIPopoverExtensionHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewServiceDidTerminateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A471F000, a2, OS_LOG_TYPE_ERROR, "Popover Extension did terminate with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
