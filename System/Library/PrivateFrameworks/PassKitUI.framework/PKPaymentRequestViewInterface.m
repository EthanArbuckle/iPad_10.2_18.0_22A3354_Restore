@implementation PKPaymentRequestViewInterface

- (PKPaymentRequestViewInterface)initWithConfiguration:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PKPaymentRequestViewInterface *v8;
  uint64_t v9;
  _TtC9PassKitUI27PaymentRequestViewInterface *wrappedInterface;
  PKPaymentRequestViewInterface *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRequestViewInterface;
  v8 = -[PKPaymentRequestViewInterface init](&v13, sel_init);
  if (v8
    && (+[PaymentRequestViewInterfaceFactory interfaceForConfiguration:withDelegate:](_TtC9PassKitUI34PaymentRequestViewInterfaceFactory, "interfaceForConfiguration:withDelegate:", v6, v7), v9 = objc_claimAutoreleasedReturnValue(), wrappedInterface = v8->_wrappedInterface, v8->_wrappedInterface = (_TtC9PassKitUI27PaymentRequestViewInterface *)v9, wrappedInterface, !v8->_wrappedInterface))
  {
    v11 = 0;
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)viewController
{
  return -[PaymentRequestViewInterface viewController](self->_wrappedInterface, "viewController");
}

- (id)serviceDelegate
{
  return -[PaymentRequestViewInterface serviceDelegate](self->_wrappedInterface, "serviceDelegate");
}

- (void)start
{
  -[PaymentRequestViewInterface start](self->_wrappedInterface, "start");
}

- (void)stop
{
  -[PaymentRequestViewInterface stop](self->_wrappedInterface, "stop");
}

- (void)invalidate
{
  -[PaymentRequestViewInterface invalidate](self->_wrappedInterface, "invalidate");
}

- (_TtC9PassKitUI27PaymentRequestViewInterface)wrappedInterface
{
  return self->_wrappedInterface;
}

- (void)setWrappedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_wrappedInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedInterface, 0);
}

@end
