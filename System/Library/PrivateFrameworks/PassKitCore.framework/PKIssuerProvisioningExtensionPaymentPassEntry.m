@implementation PKIssuerProvisioningExtensionPaymentPassEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithType:(int64_t)a3 identifier:(id)a4 title:(id)a5 art:(CGImage *)a6
{
  NSObject *v7;
  uint8_t v9[16];

  PKLogFacilityTypeGetObject(6uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18FC92000, v7, OS_LOG_TYPE_DEFAULT, "PKIssuerProvisioningExtensionPaymentPassEntry: invalid initializer.", v9, 2u);
  }

  return 0;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithIdentifier:(NSString *)identifier title:(NSString *)title art:(CGImageRef)art addRequestConfiguration:(PKAddPaymentPassRequestConfiguration *)configuration
{
  NSString *v10;
  NSString *v11;
  PKAddPaymentPassRequestConfiguration *v12;
  PKAddPaymentPassRequestConfiguration *v13;
  void *v14;
  id *v15;
  id *v16;
  PKIssuerProvisioningExtensionPaymentPassEntry *v17;
  NSObject *v18;
  const char *v19;
  void *v21;
  uint64_t v22;
  objc_super v23;
  uint8_t buf[16];

  v10 = identifier;
  v11 = title;
  v12 = configuration;
  v13 = v12;
  if (!v12)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = "PKIssuerProvisioningExtensionPaymentPassEntry: initializer missing required parameters.";
LABEL_10:
      _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
    }
LABEL_11:

    v17 = 0;
    goto LABEL_12;
  }
  -[PKAddPaymentPassRequestConfiguration cardholderName](v12, "cardholderName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    -[PKAddPaymentPassRequestConfiguration primaryAccountSuffix](v13, "primaryAccountSuffix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      -[PKAddPaymentPassRequestConfiguration cardDetails](v13, "cardDetails");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
        goto LABEL_5;
      PKLogFacilityTypeGetObject(6uLL);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v19 = "PKIssuerProvisioningExtensionPaymentPassEntry: configuration missing card details.";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }

LABEL_5:
  v23.receiver = self;
  v23.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  v15 = -[PKIssuerProvisioningExtensionPassEntry _initWithType:identifier:title:art:](&v23, sel__initWithType_identifier_title_art_, 1, v10, v11, art);
  v16 = v15;
  if (v15)
    objc_storeStrong(v15 + 5, configuration);
  self = v16;
  v17 = self;
LABEL_12:

  return v17;
}

- (PKIssuerProvisioningExtensionPaymentPassEntry)initWithCoder:(id)a3
{
  id v4;
  PKIssuerProvisioningExtensionPaymentPassEntry *v5;
  PKIssuerProvisioningExtensionPaymentPassEntry *v6;
  uint64_t v7;
  PKAddPaymentPassRequestConfiguration *addRequestConfiguration;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  v5 = -[PKIssuerProvisioningExtensionPassEntry initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[PKIssuerProvisioningExtensionPassEntry setType:](v5, "setType:", 1);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addRequestConfiguration"));
    v7 = objc_claimAutoreleasedReturnValue();
    addRequestConfiguration = v6->_addRequestConfiguration;
    v6->_addRequestConfiguration = (PKAddPaymentPassRequestConfiguration *)v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKIssuerProvisioningExtensionPaymentPassEntry;
  v4 = a3;
  -[PKIssuerProvisioningExtensionPassEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_addRequestConfiguration, CFSTR("addRequestConfiguration"), v5.receiver, v5.super_class);

}

- (PKAddPaymentPassRequestConfiguration)addRequestConfiguration
{
  return self->_addRequestConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addRequestConfiguration, 0);
}

@end
