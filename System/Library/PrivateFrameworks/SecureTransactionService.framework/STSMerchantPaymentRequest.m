@implementation STSMerchantPaymentRequest

- (STSMerchantPaymentRequest)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6 merchantCapabilities:(int64_t)a7 merchantData:(id)a8 unpredictableNumber:(unsigned int)a9
{
  id v16;
  STSMerchantPaymentRequest *v17;
  STSMerchantPaymentRequest *v18;
  objc_super v20;

  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)STSMerchantPaymentRequest;
  v17 = -[STSPaymentRequestBase initWithTransactionAmount:currencyCode:countryCode:transactionDate:](&v20, sel_initWithTransactionAmount_currencyCode_countryCode_transactionDate_, a3, a4, a5, a6);
  v18 = v17;
  if (v17)
  {
    v17->_merchantCapabilities = a7;
    objc_storeStrong((id *)&v17->_merchantData, a8);
    v18->_unpredictableNumber = a9;
  }

  return v18;
}

- (id)description
{
  void *v3;
  NSData *merchantData;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  merchantData = self->_merchantData;
  -[STSPaymentRequestBase currencyCode](self, "currencyCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPaymentRequestBase countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPaymentRequestBase transactionAmount](self, "transactionAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSPaymentRequestBase transactionDate](self, "transactionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("STSMerchantPaymentRequest { merchantData=%@ currencyCode=%@ countryCode=%@ transactionAmount=%@ transactionDate=%@ merchantCapabilities=%lu unpredictableNumber=%ud networkMerchantIdentifier=%@ appletIdentifier=%@}"), merchantData, v5, v6, v7, v8, self->_merchantCapabilities, self->_unpredictableNumber, self->_networkMerchantIdentifier, self->_appletIdentifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSMerchantPaymentRequest)initWithCoder:(id)a3
{
  id v4;
  STSMerchantPaymentRequest *v5;
  uint64_t v6;
  NSData *merchantData;
  uint64_t v8;
  NSData *networkMerchantIdentifier;
  uint64_t v10;
  NSString *appletIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSMerchantPaymentRequest;
  v5 = -[STSInAppPaymentRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_merchantCapabilities = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("merchantCapabilities"));
    v5->_unpredictableNumber = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("unpredictableNumber"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantData"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantData = v5->_merchantData;
    v5->_merchantData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    networkMerchantIdentifier = v5->_networkMerchantIdentifier;
    v5->_networkMerchantIdentifier = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appletIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    appletIdentifier = v5->_appletIdentifier;
    v5->_appletIdentifier = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSMerchantPaymentRequest;
  v4 = a3;
  -[STSInAppPaymentRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_merchantCapabilities, CFSTR("merchantCapabilities"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_unpredictableNumber, CFSTR("unpredictableNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantData, CFSTR("merchantData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkMerchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appletIdentifier, CFSTR("appletIdentifier"));

}

- (id)toNFECommercePaymentRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B590]);
  objc_msgSend(v5, "setAppletIdentifier:", v4);
  -[STSMerchantPaymentRequest merchantData](self, "merchantData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMerchantData:", v6);

  -[STSMerchantPaymentRequest networkMerchantIdentifier](self, "networkMerchantIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNetworkMerchantIdentifier:", v7);

  -[STSPaymentRequestBase currencyCode](self, "currencyCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrencyCode:", v8);

  -[STSPaymentRequestBase countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountryCode:", v9);

  -[STSPaymentRequestBase transactionAmount](self, "transactionAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionAmount:", v10);

  -[STSPaymentRequestBase transactionDate](self, "transactionDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTransactionDate:", v11);

  objc_msgSend(v5, "setUnpredictableNumber:", -[STSMerchantPaymentRequest unpredictableNumber](self, "unpredictableNumber"));
  if (v4)
  {
    objc_msgSend(v5, "setAppletIdentifier:", v4);
  }
  else
  {
    -[STSMerchantPaymentRequest appletIdentifier](self, "appletIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppletIdentifier:", v12);

  }
  objc_msgSend(v5, "setMerchantCapabilities:", -[STSMerchantPaymentRequest merchantCapabilities](self, "merchantCapabilities") & 2 | -[STSMerchantPaymentRequest merchantCapabilities](self, "merchantCapabilities") & 1 | -[STSMerchantPaymentRequest merchantCapabilities](self, "merchantCapabilities") & 0x40);

  return v5;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void)setAppletIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appletIdentifier, a3);
}

- (NSData)networkMerchantIdentifier
{
  return self->_networkMerchantIdentifier;
}

- (void)setNetworkMerchantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, a3);
}

- (int64_t)merchantCapabilities
{
  return self->_merchantCapabilities;
}

- (void)setMerchantCapabilities:(int64_t)a3
{
  self->_merchantCapabilities = a3;
}

- (NSData)merchantData
{
  return self->_merchantData;
}

- (void)setMerchantData:(id)a3
{
  objc_storeStrong((id *)&self->_merchantData, a3);
}

- (unsigned)unpredictableNumber
{
  return self->_unpredictableNumber;
}

- (void)setUnpredictableNumber:(unsigned int)a3
{
  self->_unpredictableNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantData, 0);
  objc_storeStrong((id *)&self->_networkMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
}

@end
