@implementation PKPaymentProvisioningMethodTypeCameraCapture

- (PKPaymentProvisioningMethodTypeCameraCapture)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentProvisioningMethodTypeCameraCapture;
  return -[PKPaymentProvisioningMethod initWithType:](&v3, sel_initWithType_, 64);
}

- (PKPaymentProvisioningMethodTypeCameraCapture)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentProvisioningMethodTypeCameraCapture *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSURL *appLaunchURL;
  uint64_t v10;
  NSArray *associatedStoreIdentifiers;
  void *v12;
  PKPaymentProvisioningMethodTypeCameraCapture *v13;
  uint64_t v14;
  NSArray *cardTypeSupport;
  _QWORD v17[4];
  PKPaymentProvisioningMethodTypeCameraCapture *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentProvisioningMethodTypeCameraCapture;
  v5 = -[PKPaymentProvisioningMethod initWithDictionary:](&v19, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("appLaunchURLScheme"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("appLaunchURLPath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningMethod _inAppProvisioningURLWthScheme:path:](v5, "_inAppProvisioningURLWthScheme:path:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v8;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedStoreIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v10;

    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("cardTypeSupport"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __67__PKPaymentProvisioningMethodTypeCameraCapture_initWithDictionary___block_invoke;
    v17[3] = &unk_1E2AC98B0;
    v13 = v5;
    v18 = v13;
    objc_msgSend(v12, "pk_arrayByApplyingBlock:", v17);
    v14 = objc_claimAutoreleasedReturnValue();
    cardTypeSupport = v13->_cardTypeSupport;
    v13->_cardTypeSupport = (NSArray *)v14;

  }
  return v5;
}

uint64_t __67__PKPaymentProvisioningMethodTypeCameraCapture_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayNameForCardType:", a2);
}

- (void)_decorateDescription:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeCameraCapture;
  v4 = a3;
  -[PKPaymentProvisioningMethod _decorateDescription:](&v5, sel__decorateDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("appLaunchURL: '%@'; "), self->_appLaunchURL);
  objc_msgSend(v4, "appendFormat:", CFSTR("associatedStoreIdentifiers: '%@'; "), self->_associatedStoreIdentifiers);
  objc_msgSend(v4, "appendFormat:", CFSTR("cardTypeSupport: '%@'; "), self->_cardTypeSupport);

}

- (PKPaymentProvisioningMethodTypeCameraCapture)initWithCoder:(id)a3
{
  id v4;
  PKPaymentProvisioningMethodTypeCameraCapture *v5;
  uint64_t v6;
  NSURL *appLaunchURL;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *associatedStoreIdentifiers;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *cardTypeSupport;
  objc_super v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentProvisioningMethodTypeCameraCapture;
  v5 = -[PKPaymentProvisioningMethod initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appLaunchURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    appLaunchURL = v5->_appLaunchURL;
    v5->_appLaunchURL = (NSURL *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithArray:", v9);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("associatedStoreIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E60]);
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("cardTypeSupport"));
    v16 = objc_claimAutoreleasedReturnValue();
    cardTypeSupport = v5->_cardTypeSupport;
    v5->_cardTypeSupport = (NSArray *)v16;

  }
  return v5;
}

- (void)encodeWithCode:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentProvisioningMethodTypeCameraCapture;
  v4 = a3;
  -[PKPaymentProvisioningMethod encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appLaunchURL, CFSTR("appLaunchURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedStoreIdentifiers, CFSTR("associatedStoreIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardTypeSupport, CFSTR("cardTypeSupport"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentProvisioningMethodTypeCameraCapture *v5;
  uint64_t v6;
  NSURL *appLaunchURL;
  uint64_t v8;
  NSArray *associatedStoreIdentifiers;
  uint64_t v10;
  NSArray *cardTypeSupport;

  v5 = objc_alloc_init(PKPaymentProvisioningMethodTypeCameraCapture);
  -[PKPaymentProvisioningMethod _copyInto:](self, "_copyInto:", v5);
  v6 = -[NSURL copyWithZone:](self->_appLaunchURL, "copyWithZone:", a3);
  appLaunchURL = v5->_appLaunchURL;
  v5->_appLaunchURL = (NSURL *)v6;

  v8 = -[NSArray copyWithZone:](self->_associatedStoreIdentifiers, "copyWithZone:", a3);
  associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
  v5->_associatedStoreIdentifiers = (NSArray *)v8;

  v10 = -[NSArray copyWithZone:](self->_cardTypeSupport, "copyWithZone:", a3);
  cardTypeSupport = v5->_cardTypeSupport;
  v5->_cardTypeSupport = (NSArray *)v10;

  return v5;
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (NSArray)cardTypeSupport
{
  return self->_cardTypeSupport;
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardTypeSupport, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
}

@end
