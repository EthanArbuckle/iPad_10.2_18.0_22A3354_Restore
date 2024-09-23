@implementation PKPassbookSettingsDefaultBehavior

- (PKPassbookSettingsDefaultBehavior)init
{
  PKPassbookSettingsDefaultBehavior *v2;
  PKPassLibraryDefaultDataProvider *v3;
  PKPassLibraryDefaultDataProvider *passLibraryDataProvider;
  PKPaymentDefaultDataProvider *v5;
  PKPaymentDefaultDataProvider *paymentDataProvider;
  uint64_t v7;
  PKPaymentOptionsDefaults *options;
  PKPassbookPeerPaymentSettingsDefaultBehavior *v9;
  PKPassbookPeerPaymentSettingsDefaultBehavior *peerPaymentDefaultBehavior;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassbookSettingsDefaultBehavior;
  v2 = -[PKPassbookSettingsDefaultBehavior init](&v12, sel_init);
  if (v2)
  {
    v3 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D66F18]);
    passLibraryDataProvider = v2->_passLibraryDataProvider;
    v2->_passLibraryDataProvider = v3;

    v5 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E0D67100]);
    paymentDataProvider = v2->_paymentDataProvider;
    v2->_paymentDataProvider = v5;

    objc_msgSend(MEMORY[0x1E0D671B8], "defaults");
    v7 = objc_claimAutoreleasedReturnValue();
    options = v2->_options;
    v2->_options = (PKPaymentOptionsDefaults *)v7;

    v9 = objc_alloc_init(PKPassbookPeerPaymentSettingsDefaultBehavior);
    peerPaymentDefaultBehavior = v2->_peerPaymentDefaultBehavior;
    v2->_peerPaymentDefaultBehavior = v9;

  }
  return v2;
}

- (void)setSetupDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_setupDelegate, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKPassbookSettingsDefaultBehavior;
  -[PKPassbookSettingsDefaultBehavior dealloc](&v2, sel_dealloc);
}

- (BOOL)deviceInRestrictedMode
{
  return -[PKPaymentDefaultDataProvider isDeviceInRestrictedMode](self->_paymentDataProvider, "isDeviceInRestrictedMode");
}

- (BOOL)deviceSupportsInAppPayments
{
  return PKInAppPaymentAllowed() != 0;
}

- (id)setupDelegate
{
  return objc_loadWeakRetained((id *)&self->_setupDelegate);
}

- (id)passLibraryDataProvider
{
  return self->_passLibraryDataProvider;
}

- (id)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (id)optionsDelegate
{
  return self->_options;
}

- (id)secureElementID
{
  return (id)-[PKPaymentDefaultDataProvider secureElementIdentifier](self->_paymentDataProvider, "secureElementIdentifier");
}

- (BOOL)canRegisterForPeerPayment
{
  char v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (!PKIsManagedAppleID())
  {
    if ((PKUseMockSURFServer() & 1) != 0)
      return 1;
    if (PKStoreDemoModeEnabled())
      return PKDeviceHasMockPeerPaymentPass();
    objc_msgSend(MEMORY[0x1E0D673C8], "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D67480], "sharedService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PKPeerPaymentServiceOverrideURL();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_8;
    objc_msgSend(v4, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRegistered");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v4, "context");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "targetDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceRegion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(v10, "peerPaymentEnabledForRegion:", v12);

      goto LABEL_14;
    }
    if (v5 && !objc_msgSend(v5, "needsRegistration"))
LABEL_8:
      v2 = 1;
    else
      v2 = objc_msgSend(v4, "_canRegisterForPeerPayment");
LABEL_14:

    return v2;
  }
  return 0;
}

- (id)peerPaymentDelegate
{
  return self->_peerPaymentDefaultBehavior;
}

- (id)peerPaymentDataSource
{
  return self->_peerPaymentDefaultBehavior;
}

- (BOOL)hasFelicaSecureElement
{
  return PKFelicaSecureElementIsAvailable() != 0;
}

- (BOOL)supportsCredentialType:(int64_t)a3
{
  return 1;
}

- (BOOL)secureElementIsProductionSigned
{
  return -[PKPaymentDefaultDataProvider secureElementIsProductionSigned](self->_paymentDataProvider, "secureElementIsProductionSigned");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_peerPaymentDefaultBehavior, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
}

@end
