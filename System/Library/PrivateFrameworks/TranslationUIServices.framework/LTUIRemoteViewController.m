@implementation LTUIRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "__LTUI_viewServiceExtensionInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "__LTUI_viewServiceExtensionHostInterface");
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  v4 = _LTOSLogSystemTranslation();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[LTUIRemoteViewController viewServiceDidTerminateWithError:].cold.1((uint64_t)v3, v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dismiss
{
  id v2;

  -[LTUIRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (void)confirmUserConsent
{
  id v2;

  -[LTUIRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmUserConsent");

}

- (void)expandSheet
{
  id v2;

  -[LTUIRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandSheet");

}

- (void)remoteIsReady
{
  id v2;

  -[LTUIRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteIsReady");

}

- (void)finishWithTranslation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LTUIRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithTranslation:", v4);

}

- (LTUIViewServiceExtensionHostProtocol)delegate
{
  return (LTUIViewServiceExtensionHostProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
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

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D649000, a2, OS_LOG_TYPE_ERROR, "View service terminated during system translation with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
