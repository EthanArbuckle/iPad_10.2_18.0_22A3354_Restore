@implementation PKPaymentSetupConfiguration

- (PKPaymentSetupConfiguration)init
{
  PKPaymentSetupConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupConfiguration;
  result = -[PKPaymentSetupConfiguration init](&v3, sel_init);
  if (result)
    result->_usePaymentSetupFeaturesFromCDN = 1;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupConfiguration *v5;
  uint64_t v6;
  NSString *referrerIdentifier;
  uint64_t v8;
  NSString *merchantIdentifier;
  uint64_t v10;
  NSURL *originatingURL;
  uint64_t v12;
  NSString *signature;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *signedFields;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentSetupConfiguration;
  v5 = -[PKPaymentSetupConfiguration init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("referrerIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    originatingURL = v5->_originatingURL;
    v5->_originatingURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
    v12 = objc_claimAutoreleasedReturnValue();
    signature = v5->_signature;
    v5->_signature = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("signedFields"));
    v17 = objc_claimAutoreleasedReturnValue();
    signedFields = v5->_signedFields;
    v5->_signedFields = (NSArray *)v17;

    v5->_usePaymentSetupFeaturesFromCDN = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usePaymentSetupFeaturesFromCDN"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *referrerIdentifier;
  id v5;

  referrerIdentifier = self->_referrerIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", referrerIdentifier, CFSTR("referrerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingURL, CFSTR("originatingURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signedFields, CFSTR("signedFields"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usePaymentSetupFeaturesFromCDN, CFSTR("usePaymentSetupFeaturesFromCDN"));

}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)usePaymentSetupFeaturesFromCDN
{
  return self->_usePaymentSetupFeaturesFromCDN;
}

- (void)setUsePaymentSetupFeaturesFromCDN:(BOOL)a3
{
  self->_usePaymentSetupFeaturesFromCDN = a3;
}

- (NSURL)originatingURL
{
  return self->_originatingURL;
}

- (void)setOriginatingURL:(id)a3
{
  objc_storeStrong((id *)&self->_originatingURL, a3);
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)signedFields
{
  return self->_signedFields;
}

- (void)setSignedFields:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_signedFields, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_originatingURL, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
}

@end
