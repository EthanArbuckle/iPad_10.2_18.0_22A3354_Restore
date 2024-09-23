@implementation PKPassBalance

- (PKPassBalance)initWithDictionary:(id)a3
{
  id v4;
  PKPassBalance *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  PKAutoReloadPaymentMethod *v9;
  PKAutoReloadPaymentMethod *paymentMethod;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPassBalance;
  v5 = -[PKPassBalance init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("paymentMethodMetadata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[PKAutoReloadPaymentMethod initWithDictionary:]([PKAutoReloadPaymentMethod alloc], "initWithDictionary:", v8);
      paymentMethod = v5->_paymentMethod;
      v5->_paymentMethod = v9;

    }
  }

  return v5;
}

- (PKPassBalance)initWithCoder:(id)a3
{
  id v4;
  PKPassBalance *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKAutoReloadPaymentMethod *paymentMethod;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassBalance;
  v5 = -[PKPassBalance init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentMethod"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentMethod = v5->_paymentMethod;
    v5->_paymentMethod = (PKAutoReloadPaymentMethod *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentMethod, CFSTR("paymentMethod"));

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: %@; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentMethod: %@; "), self->_paymentMethod);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (PKAutoReloadPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void)setPaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
