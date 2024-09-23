@implementation PKPaymentSetupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupRequest)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupRequest *v5;
  uint64_t v6;
  PKPaymentSetupConfiguration *configuration;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *paymentSetupFeatures;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentSetupRequest;
  v5 = -[PKPaymentSetupRequest init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (PKPaymentSetupConfiguration *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("paymentSetupFeatures"));
    v11 = objc_claimAutoreleasedReturnValue();
    paymentSetupFeatures = v5->_paymentSetupFeatures;
    v5->_paymentSetupFeatures = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKPaymentSetupConfiguration *configuration;
  id v5;

  configuration = self->_configuration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configuration, CFSTR("configuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentSetupFeatures, CFSTR("paymentSetupFeatures"));

}

- (PKPaymentSetupConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSArray)paymentSetupFeatures
{
  return self->_paymentSetupFeatures;
}

- (void)setPaymentSetupFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSetupFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentSetupFeatures, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
