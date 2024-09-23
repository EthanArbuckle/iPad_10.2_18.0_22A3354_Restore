@implementation PKPeerPaymentAssociatedAccountControllerDoneTapHelper

- (PKPeerPaymentAssociatedAccountControllerDoneTapHelper)initWithNavigationController:(id)a3
{
  id v5;
  PKPeerPaymentAssociatedAccountControllerDoneTapHelper *v6;
  PKPeerPaymentAssociatedAccountControllerDoneTapHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentAssociatedAccountControllerDoneTapHelper;
  v6 = -[PKPeerPaymentAssociatedAccountControllerDoneTapHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_navigationController, a3);

  return v7;
}

- (void)doneTapped
{
  -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
