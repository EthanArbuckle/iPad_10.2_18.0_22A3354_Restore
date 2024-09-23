@implementation SDNearbyPeerPaymentReceiverCoordinator

+ (id)verifyReceiverEligibility
{
  if ((objc_msgSend(a1, "nearbyReceiverIsEligible") & 1) != 0)
    return 0;
  else
    return objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("NearbyPeerPaymentError"), 1, 0);
}

+ (BOOL)nearbyReceiverIsEligible
{
  return objc_msgSend(sub_1000E590C(), "nearbyReceiverIsEligible");
}

- (SDNearbyPeerPaymentReceiverCoordinator)initWithSenderMetadata:(id)a3
{
  id v4;
  SDNearbyPeerPaymentReceiverCoordinator *v5;
  PKNearbyPeerPaymentReceiverCoordinator *v6;
  PKNearbyPeerPaymentReceiverCoordinator *coordinator;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SDNearbyPeerPaymentReceiverCoordinator;
  v5 = -[SDNearbyPeerPaymentReceiverCoordinator init](&v9, "init");
  if (v5)
  {
    v6 = (PKNearbyPeerPaymentReceiverCoordinator *)objc_msgSend(objc_alloc((Class)sub_1000E590C()), "initWithSenderMetadata:", v4);
    coordinator = v5->_coordinator;
    v5->_coordinator = v6;

  }
  return v5;
}

- (void)recipientMetadataWithContactID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyPeerPaymentReceiverCoordinator coordinator](self, "coordinator"));
  objc_msgSend(v8, "recipientMetadataWithContactID:completion:", v7, v6);

}

- (void)nearbyReceiverRequiresConfirmationWithContactID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyPeerPaymentReceiverCoordinator coordinator](self, "coordinator"));
  objc_msgSend(v8, "nearbyReceiverRequiresConfirmationWithContactID:completionHandler:", v7, v6);

}

- (PKNearbyPeerPaymentReceiverCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
