@implementation PKAccountCreditTermsUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountCreditTermsUpdate)initWithCoder:(id)a3
{
  id v4;
  PKAccountCreditTermsUpdate *v5;
  uint64_t v6;
  NSString *requestIdentifier;
  uint64_t v8;
  NSString *adverseActionContentIdentifier;
  uint64_t v10;
  PKCurrencyAmount *creditLimit;
  uint64_t v12;
  PKCreditAccountRates *rates;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAccountCreditTermsUpdate;
  v5 = -[PKAccountCreditTermsUpdate init](&v15, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_initiator = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("initiator"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adverseActionContentIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    adverseActionContentIdentifier = v5->_adverseActionContentIdentifier;
    v5->_adverseActionContentIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creditLimit"));
    v10 = objc_claimAutoreleasedReturnValue();
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (PKCurrencyAmount *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rates"));
    v12 = objc_claimAutoreleasedReturnValue();
    rates = v5->_rates;
    v5->_rates = (PKCreditAccountRates *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_initiator, CFSTR("initiator"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adverseActionContentIdentifier, CFSTR("adverseActionContentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creditLimit, CFSTR("creditLimit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rates, CFSTR("rates"));

}

- (PKAccountCreditTermsUpdate)initWithRecord:(id)a3
{
  id v4;
  PKAccountCreditTermsUpdate *v5;
  NSString *v6;
  NSDecimalNumber *v7;
  NSDecimalNumber *v8;
  uint64_t v9;
  PKCurrencyAmount *creditLimit;
  void *v11;
  PKCreditAccountRates *v12;
  PKCreditAccountRates *rates;
  uint64_t v14;
  NSString *requestIdentifier;
  uint64_t v16;
  NSString *adverseActionContentIdentifier;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  char v21;
  uint64_t v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  char v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  char v33;
  __CFString *v34;
  __CFString *v35;
  char v36;
  __CFString *v37;
  __CFString *v38;
  int v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)PKAccountCreditTermsUpdate;
  v5 = -[PKAccountCreditTermsUpdate init](&v41, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("creditLimit"));
    v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 && v7)
    {
      PKCurrencyAmountCreate(v7, v6, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      creditLimit = v5->_creditLimit;
      v5->_creditLimit = (PKCurrencyAmount *)v9;

    }
    objc_msgSend(v4, "pk_encryptedDictionaryForKey:", CFSTR("rates"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PKCreditAccountRates initWithDictionary:]([PKCreditAccountRates alloc], "initWithDictionary:", v11);
    rates = v5->_rates;
    v5->_rates = v12;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("requestIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v14;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("adverseActionContentIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    adverseActionContentIdentifier = v5->_adverseActionContentIdentifier;
    v5->_adverseActionContentIdentifier = (NSString *)v16;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("initiator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lowercaseString");
    v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 == CFSTR("system"))
      goto LABEL_8;
    if (!v19)
      goto LABEL_12;
    v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("system"));

    if ((v21 & 1) != 0)
    {
LABEL_8:
      v22 = 1;
      goto LABEL_13;
    }
    v23 = v20;
    if (v23 == CFSTR("customer")
      || (v24 = v23,
          v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("customer")),
          v24,
          v25))
    {
      v22 = 2;
    }
    else
    {
LABEL_12:
      v22 = 0;
    }
LABEL_13:

    v5->_initiator = v22;
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("type"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lowercaseString");
    v27 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27 != CFSTR("creditlimitincreased"))
    {
      if (v27)
      {
        v29 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("creditlimitincreased"));

        if ((v29 & 1) != 0)
          goto LABEL_16;
        v31 = v28;
        if (v31 == CFSTR("creditlimitdecreased")
          || (v32 = v31,
              v33 = -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("creditlimitdecreased")),
              v32,
              (v33 & 1) != 0))
        {
          v30 = 2;
          goto LABEL_27;
        }
        v34 = v32;
        if (v34 == CFSTR("creditlimitincreaserequest")
          || (v35 = v34,
              v36 = -[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("creditlimitincreaserequest")),
              v35,
              (v36 & 1) != 0))
        {
          v30 = 3;
          goto LABEL_27;
        }
        v37 = v35;
        if (v37 == CFSTR("creditlimitdecreaserequest")
          || (v38 = v37,
              v39 = -[__CFString isEqualToString:](v37, "isEqualToString:", CFSTR("creditlimitdecreaserequest")),
              v38,
              v39))
        {
          v30 = 4;
          goto LABEL_27;
        }
      }
      v30 = 0;
      goto LABEL_27;
    }
LABEL_16:
    v30 = 1;
LABEL_27:

    v5->_type = v30;
  }

  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t initiator;
  const __CFString *v9;
  unint64_t type;
  const __CFString *v11;
  id v12;

  objc_msgSend(a3, "encryptedValues");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount currency](self->_creditLimit, "currency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v4, CFSTR("currencyCode"));

  -[PKCurrencyAmount amount](self->_creditLimit, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v6, CFSTR("creditLimit"));

  -[PKCreditAccountRates jsonString](self->_rates, "jsonString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v7, CFSTR("rates"));

  objc_msgSend(v12, "setObject:forKey:", self->_requestIdentifier, CFSTR("requestIdentifier"));
  objc_msgSend(v12, "setObject:forKey:", self->_adverseActionContentIdentifier, CFSTR("adverseActionContentIdentifier"));
  initiator = self->_initiator;
  if (initiator > 2)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E2AC2738[initiator];
  objc_msgSend(v12, "setObject:forKey:", v9, CFSTR("initiator"));
  type = self->_type;
  if (type > 4)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E2AC2710[type];
  objc_msgSend(v12, "setObject:forKey:", v11, CFSTR("type"));

}

+ (id)recordType
{
  return CFSTR("CreditTermsUpdate");
}

+ (id)recordNamePrefix
{
  return CFSTR("rewards-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PKCurrencyAmount *creditLimit;
  PKCurrencyAmount *v6;
  PKCreditAccountRates *rates;
  PKCreditAccountRates *v8;
  NSString *requestIdentifier;
  NSString *v10;
  NSString *adverseActionContentIdentifier;
  NSString *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  creditLimit = self->_creditLimit;
  v6 = (PKCurrencyAmount *)v4[5];
  if (creditLimit && v6)
  {
    if (!-[PKCurrencyAmount isEqual:](creditLimit, "isEqual:"))
      goto LABEL_24;
  }
  else if (creditLimit != v6)
  {
    goto LABEL_24;
  }
  rates = self->_rates;
  v8 = (PKCreditAccountRates *)v4[6];
  if (rates && v8)
  {
    if (!-[PKCreditAccountRates isEqual:](rates, "isEqual:"))
      goto LABEL_24;
  }
  else if (rates != v8)
  {
    goto LABEL_24;
  }
  requestIdentifier = self->_requestIdentifier;
  v10 = (NSString *)v4[3];
  if (requestIdentifier && v10)
  {
    if ((-[NSString isEqual:](requestIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (requestIdentifier != v10)
  {
    goto LABEL_24;
  }
  adverseActionContentIdentifier = self->_adverseActionContentIdentifier;
  v12 = (NSString *)v4[4];
  if (!adverseActionContentIdentifier || !v12)
  {
    if (adverseActionContentIdentifier == v12)
      goto LABEL_22;
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  if ((-[NSString isEqual:](adverseActionContentIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_24;
LABEL_22:
  if (self->_type != v4[1])
    goto LABEL_24;
  v13 = self->_initiator == v4[2];
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_creditLimit);
  objc_msgSend(v3, "safelyAddObject:", self->_requestIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_adverseActionContentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_rates);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_initiator - v5 + 32 * v5;

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  unint64_t initiator;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AC2710[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  initiator = self->_initiator;
  if (initiator > 2)
    v8 = CFSTR("unknown");
  else
    v8 = off_1E2AC2738[initiator];
  objc_msgSend(v4, "appendFormat:", CFSTR("initiator: '%@'; "), v8);
  objc_msgSend(v4, "appendFormat:", CFSTR("creditLimit: '%@'; "), self->_creditLimit);
  objc_msgSend(v4, "appendFormat:", CFSTR("requestIdentifier: '%@'; "), self->_requestIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("adverseIdentifier: '%@'; "), self->_adverseActionContentIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR("rates: '%@'; "), self->_rates);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return (NSString *)v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)initiator
{
  return self->_initiator;
}

- (void)setInitiator:(int64_t)a3
{
  self->_initiator = a3;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)adverseActionContentIdentifier
{
  return self->_adverseActionContentIdentifier;
}

- (void)setAdverseActionContentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (PKCurrencyAmount)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
  objc_storeStrong((id *)&self->_creditLimit, a3);
}

- (PKCreditAccountRates)rates
{
  return self->_rates;
}

- (void)setRates:(id)a3
{
  objc_storeStrong((id *)&self->_rates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rates, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_adverseActionContentIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
