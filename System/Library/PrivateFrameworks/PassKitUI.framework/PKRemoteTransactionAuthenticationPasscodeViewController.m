@implementation PKRemoteTransactionAuthenticationPasscodeViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5AEB00);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE66E648);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRemoteTransactionAuthenticationPasscodeViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v5, sel_viewServiceDidTerminateWithError_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerDidCancel");

}

- (void)passcodeViewControllerRequestSessionExchangeTokenWithHandler:(id)a3
{
  PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerRequestSessionExchangeTokenWithHandler:", v4);

}

- (void)passcodeViewControllerDidEndSessionExchange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerDidEndSessionExchange");

}

- (void)passcodeViewControllerDidCancel
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerDidCancel");

}

- (void)passcodeViewControllerDidGenerateEncryptedPasscode:(id)a3
{
  PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "passcodeViewControllerDidGenerateEncryptedPasscode:", v4);

}

- (PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate)delegate
{
  return (PKRemoteTransactionAuthenticationPasscodeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
