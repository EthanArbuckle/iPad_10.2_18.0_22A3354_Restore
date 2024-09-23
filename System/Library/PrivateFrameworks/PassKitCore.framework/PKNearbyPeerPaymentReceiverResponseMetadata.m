@implementation PKNearbyPeerPaymentReceiverResponseMetadata

+ (void)receiverDataWithNonce:(id)a3 nearbyMetadata:(id)a4 appearanceData:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v9 = a6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110__PKNearbyPeerPaymentReceiverResponseMetadata_receiverDataWithNonce_nearbyMetadata_appearanceData_completion___block_invoke;
  v11[3] = &unk_1E2ADC208;
  v12 = v9;
  v10 = v9;
  +[_PKNearbyPeerPaymentReceiverResponseMetadata receiverDataWithNonce:nearbyMetadata:appearanceData:completion:](_PKNearbyPeerPaymentReceiverResponseMetadata, "receiverDataWithNonce:nearbyMetadata:appearanceData:completion:", a3, a4, a5, v11);

}

void __110__PKNearbyPeerPaymentReceiverResponseMetadata_receiverDataWithNonce_nearbyMetadata_appearanceData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PKNearbyPeerPaymentReceiverResponseMetadata *v4;

  if (a2)
  {
    v3 = a2;
    v4 = -[PKNearbyPeerPaymentReceiverResponseMetadata initWithInternalData:]([PKNearbyPeerPaymentReceiverResponseMetadata alloc], "initWithInternalData:", v3);

  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (PKNearbyPeerPaymentReceiverResponseMetadata)initWithInternalData:(id)a3
{
  id v5;
  PKNearbyPeerPaymentReceiverResponseMetadata *v6;
  PKNearbyPeerPaymentReceiverResponseMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKNearbyPeerPaymentReceiverResponseMetadata;
  v6 = -[PKNearbyPeerPaymentReceiverResponseMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalData, a3);

  return v7;
}

- (id)serializedData
{
  return -[_PKNearbyPeerPaymentReceiverResponseMetadata serializedData](self->_internalData, "serializedData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalData, 0);
}

@end
