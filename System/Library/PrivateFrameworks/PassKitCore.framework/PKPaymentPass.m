@implementation PKPaymentPass

- (FKPaymentPass)fkPaymentPass
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = objc_alloc_init((Class)getFKPaymentPassClass[0]());
  -[PKObject uniqueID](self, "uniqueID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUniqueID:", v4);

  -[PKPass serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSerialNumber:", v5);

  -[PKPass passTypeIdentifier](self, "passTypeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPassTypeIdentifier:", v6);

  -[PKSecureElementPass associatedApplicationIdentifiers](self, "associatedApplicationIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssociatedApplicationIdentifiers:", v7);

  -[PKPass storeIdentifiers](self, "storeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssociatedStoreIdentifiers:", v8);

  -[PKSecureElementPass issuerCountryCode](self, "issuerCountryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIssuerCountryCode:", v9);

  -[PKSecureElementPass primaryAccountIdentifier](self, "primaryAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryAccountIdentifier:", v10);

  -[PKPass organizationName](self, "organizationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOrganizationName:", v11);

  -[PKPass localizedDescription](self, "localizedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocalizedDescription:", v12);

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKPaymentMethodTypeToString(objc_msgSend(v13, "paymentType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryPaymentApplicationPaymentType:", v14);

  -[PKSecureElementPass devicePrimaryPaymentApplication](self, "devicePrimaryPaymentApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryPaymentApplicationDisplayName:", v16);

  return (FKPaymentPass *)v3;
}

- (PKPaymentPassActivationState)activationState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentPass;
  return -[PKSecureElementPass passActivationState](&v3, sel_passActivationState);
}

@end
