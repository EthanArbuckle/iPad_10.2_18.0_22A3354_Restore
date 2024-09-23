@implementation PKRemoteNetworkPaymentLoadingViewInterface

- (PKRemoteNetworkPaymentLoadingViewInterface)initWithContext:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  PKRemoteNetworkPaymentLoadingViewInterface *v8;
  _PKRemoteNetworkPaymentLoadingViewInterface *v9;
  _PKRemoteNetworkPaymentLoadingViewInterface *underlying;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteNetworkPaymentLoadingViewInterface;
  v8 = -[PKRemoteNetworkPaymentLoadingViewInterface init](&v12, sel_init);
  if (v8)
  {
    v9 = -[_PKRemoteNetworkPaymentLoadingViewInterface initWithContext:configuration:]([_PKRemoteNetworkPaymentLoadingViewInterface alloc], "initWithContext:configuration:", v6, v7);
    underlying = v8->_underlying;
    v8->_underlying = v9;

  }
  return v8;
}

- (UIViewController)primaryViewController
{
  return -[_PKRemoteNetworkPaymentLoadingViewInterface primaryViewController](self->_underlying, "primaryViewController");
}

- (id)serviceDelegate
{
  return -[_PKRemoteNetworkPaymentLoadingViewInterface serviceDelegate](self->_underlying, "serviceDelegate");
}

- (void)didAppear
{
  -[_PKRemoteNetworkPaymentLoadingViewInterface didAppear](self->_underlying, "didAppear");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
