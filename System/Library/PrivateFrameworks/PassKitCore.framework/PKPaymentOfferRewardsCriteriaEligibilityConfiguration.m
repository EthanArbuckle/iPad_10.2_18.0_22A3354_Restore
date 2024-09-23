@implementation PKPaymentOfferRewardsCriteriaEligibilityConfiguration

- (PKPaymentOfferRewardsCriteriaEligibilityConfiguration)initWithAmount:(id)a3 currencyCode:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  PKPaymentOfferRewardsCriteriaEligibilityConfiguration *v11;
  PKPaymentOfferRewardsCriteriaEligibilityConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferRewardsCriteriaEligibilityConfiguration;
  v11 = -[PKPaymentOfferRewardsCriteriaEligibilityConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_amount, a3);
    objc_storeStrong((id *)&v12->_currencyCode, a4);
    v12->_options = a5;
  }

  return v12;
}

- (NSString)description
{
  unint64_t options;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  options = self->_options;
  v4 = options & 1;
  v5 = (options >> 1) & 1;
  v6 = (options >> 2) & 1;
  v7 = (options >> 3) & 1;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v8, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v8, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v8, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("options: MultiToken: '%@'; "), v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("options: MerchantToken: '%@'; "), v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("options: Recurring: '%@'; "), v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("options: Deferred: '%@'; "), v12);

  objc_msgSend(v8, "appendFormat:", CFSTR(">"));
  return (NSString *)v8;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
