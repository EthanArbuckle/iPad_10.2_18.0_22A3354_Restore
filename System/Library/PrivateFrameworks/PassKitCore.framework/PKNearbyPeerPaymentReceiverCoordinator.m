@implementation PKNearbyPeerPaymentReceiverCoordinator

- (PKNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v4;
  PKNearbyPeerPaymentReceiverCoordinator *v5;
  _PKNearbyPeerPaymentReceiverCoordinator *v6;
  _PKNearbyPeerPaymentReceiverCoordinator *internalCoordinator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNearbyPeerPaymentReceiverCoordinator;
  v5 = -[PKNearbyPeerPaymentReceiverCoordinator init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_PKNearbyPeerPaymentReceiverCoordinator initWithSenderMetadata:]([_PKNearbyPeerPaymentReceiverCoordinator alloc], "initWithSenderMetadata:", v4);
    internalCoordinator = v5->_internalCoordinator;
    v5->_internalCoordinator = v6;

  }
  return v5;
}

+ (BOOL)nearbyReceiverIsEligible
{
  return +[_PKNearbyPeerPaymentReceiverCoordinator nearbyReceiverIsEligible](_PKNearbyPeerPaymentReceiverCoordinator, "nearbyReceiverIsEligible");
}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completionHandler:(id)a4
{
  -[_PKNearbyPeerPaymentReceiverCoordinator nearbyReceiverRequiresConfirmationWithContactID:completionHandler:](self->_internalCoordinator, "nearbyReceiverRequiresConfirmationWithContactID:completionHandler:", a3, a4);
}

- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)recipientMetadataWithAppearanceData:(id)a3 nonce:(id)a4 completion:(id)a5
{
  -[_PKNearbyPeerPaymentReceiverCoordinator recipientMetadataWithAppearanceData:nonce:completionHandler:](self->_internalCoordinator, "recipientMetadataWithAppearanceData:nonce:completionHandler:", a3, a4, a5);
}

- (void)validateTransactionWithResult:(id)a3 completion:(id)a4
{
  -[_PKNearbyPeerPaymentReceiverCoordinator validateTransactionWithResult:completionHandler:](self->_internalCoordinator, "validateTransactionWithResult:completionHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalCoordinator, 0);
}

@end
