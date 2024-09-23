@implementation PKPaymentOfferInstallmentCriteriaEligibilityConfiguration

- (PKPaymentOfferInstallmentCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 merchantCountryCode:(id)a5 deviceRegion:(id)a6 supportedNetworks:(id)a7 merchantCapabilities:(unint64_t)a8 payLaterSuppressionMode:(int64_t)a9 options:(unint64_t)a10
{
  id v17;
  id v18;
  NSString *v19;
  id v20;
  PKPaymentOfferInstallmentCriteriaEligibilityConfiguration *v21;
  PKPaymentOfferInstallmentCriteriaEligibilityConfiguration *v22;
  id v24;
  objc_super v25;

  v17 = a3;
  v18 = a4;
  v24 = a5;
  v19 = (NSString *)a6;
  v20 = a7;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentOfferInstallmentCriteriaEligibilityConfiguration;
  v21 = -[PKPaymentOfferInstallmentCriteriaEligibilityConfiguration init](&v25, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_amount, a3);
    objc_storeStrong((id *)&v22->_currencyCode, a4);
    objc_storeStrong((id *)&v22->_merchantCountryCode, a5);
    objc_storeStrong((id *)&v22->_supportedNetworks, a7);
    v22->_merchantCapabilities = a8;
    v22->_payLaterSuppressionMode = a9;
    v22->_deviceRegion = v19;
    v22->_options = a10;
  }

  return v22;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCountryCode: '%@'; "), self->_merchantCountryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("deviceRegion: '%@'; "), self->_deviceRegion);
  objc_msgSend(v3, "appendFormat:", CFSTR("supportedNetworks: '%@'; "), self->_supportedNetworks);
  PKMerchantCapabilityToStrings(self->_merchantCapabilities);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantCapabilities: '%@'; "), v4);

  PKApplePayLaterAvailabilityToString(self->_payLaterSuppressionMode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("payLaterSuppressionMode: '%@'; "), v5);

  if (self->_options)
    objc_msgSend(v3, "appendFormat:", CFSTR("options: %ld; "), self->_options);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (NSArray)supportedNetworks
{
  return self->_supportedNetworks;
}

- (unint64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (int64_t)payLaterSuppressionMode
{
  return self->_payLaterSuppressionMode;
}

- (NSString)deviceRegion
{
  return self->_deviceRegion;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
