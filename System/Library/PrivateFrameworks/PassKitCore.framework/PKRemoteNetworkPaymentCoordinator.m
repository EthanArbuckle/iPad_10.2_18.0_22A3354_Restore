@implementation PKRemoteNetworkPaymentCoordinator

- (PKRemoteNetworkPaymentCoordinator)init
{
  PKRemoteNetworkPaymentCoordinator *v2;
  _PKRemoteNetworkPaymentCoordinator *v3;
  _PKRemoteNetworkPaymentCoordinator *underlying;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKRemoteNetworkPaymentCoordinator;
  v2 = -[PKRemoteNetworkPaymentCoordinator init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PKRemoteNetworkPaymentCoordinator);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    -[_PKRemoteNetworkPaymentCoordinator setWrapper:](v2->_underlying, "setWrapper:", v2);
  }
  return v2;
}

- (void)handlePaymentUserActivity:(id)a3 originProcess:(id)a4
{
  -[_PKRemoteNetworkPaymentCoordinator handlePaymentUserActivity:originProcess:](self->_underlying, "handlePaymentUserActivity:originProcess:", a3, a4);
}

- (void)presentErrorMessageWithFailure:(unint64_t)a3 originProcess:(id)a4 delay:(double)a5
{
  -[_PKRemoteNetworkPaymentCoordinator presentErrorMessageWithFailure:originProcess:delay:](self->_underlying, "presentErrorMessageWithFailure:originProcess:delay:", a3, a4, a5);
}

- (void)handleRemoteNetworkPaymentCoordinatorComplete
{
  void *v3;
  char v4;
  id v5;

  -[PKRemoteNetworkPaymentCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[PKRemoteNetworkPaymentCoordinator delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteNetworkPaymentCoordinatorDidComplete:", self);

  }
}

- (void)handleRemoteNetworkPaymentCoordinatorDidPresentPaymentSheet:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[PKRemoteNetworkPaymentCoordinator delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PKRemoteNetworkPaymentCoordinator delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteNetworkPaymentCoordinator:didPresentPaymentSheet:", self, v3);

  }
}

- (PKRemoteNetworkPaymentCoordinatorDelegate)delegate
{
  return (PKRemoteNetworkPaymentCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
