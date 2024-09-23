@implementation PKRemoteSubcredentialMessageComposeViewController

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3;

  if (!self->_finished)
  {
    self->_finished = 1;
    -[PKRemoteSubcredentialMessageComposeViewController delegate](self, "delegate", a3);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageComposeViewControllerDidFinishWithResult:", 0);

  }
}

- (void)messageComposeViewControllerDidFinishWithResult:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (!self->_finished)
  {
    v3 = a3;
    self->_finished = 1;
    -[PKRemoteSubcredentialMessageComposeViewController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageComposeViewControllerDidFinishWithResult:", v3);

  }
}

- (PKSubcredentialMessageComposeViewControllerDelegate)delegate
{
  return (PKSubcredentialMessageComposeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
