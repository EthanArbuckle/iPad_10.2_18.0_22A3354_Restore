@implementation PKSharedPeerPaymentWebServiceArchiver

- (PKSharedPeerPaymentWebServiceArchiver)initWithPeerPaymentService:(id)a3
{
  id v5;
  PKSharedPeerPaymentWebServiceArchiver *v6;
  PKSharedPeerPaymentWebServiceArchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSharedPeerPaymentWebServiceArchiver;
  v6 = -[PKSharedPeerPaymentWebServiceArchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_peerPaymentService, a3);

  return v7;
}

- (void)archiveContext:(id)a3
{
  -[PKPeerPaymentService setSharedPeerPaymentWebServiceContext:](self->_peerPaymentService, "setSharedPeerPaymentWebServiceContext:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end
