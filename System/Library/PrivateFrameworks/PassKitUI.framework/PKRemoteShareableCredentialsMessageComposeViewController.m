@implementation PKRemoteShareableCredentialsMessageComposeViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE564118);
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE66E260);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3;

  if (!self->_finished)
  {
    self->_finished = 1;
    -[PKRemoteShareableCredentialsMessageComposeViewController delegate](self, "delegate", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageComposeViewControllerDidFinishWithResult:", 0);

  }
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[PKRemoteShareableCredentialsMessageComposeViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKRemoteShareableCredentialsMessageComposeViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageComposeViewControllerDidFinishWithResult:", v3);

  }
  else
  {
    -[PKRemoteShareableCredentialsMessageComposeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (PKShareableCredentialsMessageComposeViewControllerDelegate)delegate
{
  return (PKShareableCredentialsMessageComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
