@implementation PKPayLaterAppliedPayment

- (PKPayLaterAppliedPayment)initWithDictionary:(id)a3
{
  id v4;
  PKPayLaterAppliedPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  uint64_t v8;
  PKCurrencyAmount *amountApplied;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAppliedPayment;
  v5 = -[PKPayLaterAppliedPayment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("paymentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("amountApplied"));
    v8 = objc_claimAutoreleasedReturnValue();
    amountApplied = v5->_amountApplied;
    v5->_amountApplied = (PKCurrencyAmount *)v8;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_paymentIdentifier, CFSTR("paymentIdentifier"));
  -[PKCurrencyAmount dictionaryRepresentation](self->_amountApplied, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("amountApplied"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterAppliedPayment *v4;
  PKPayLaterAppliedPayment *v5;
  BOOL v6;

  v4 = (PKPayLaterAppliedPayment *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPayLaterAppliedPayment isEqualToPayLaterAppliedPayment:](self, "isEqualToPayLaterAppliedPayment:", v5);

  return v6;
}

- (BOOL)isEqualToPayLaterAppliedPayment:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  PKCurrencyAmount *amountApplied;
  PKCurrencyAmount *v12;
  BOOL v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = (void *)v4[1];
  v7 = self->_paymentIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_12:
      v13 = 0;
      goto LABEL_14;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_12;
  }
  amountApplied = self->_amountApplied;
  v12 = (PKCurrencyAmount *)v5[2];
  if (amountApplied && v12)
    v13 = -[PKCurrencyAmount isEqual:](amountApplied, "isEqual:");
  else
    v13 = amountApplied == v12;
LABEL_14:

  return v13;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_amountApplied);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentIdentifier: '%@'; "), self->_paymentIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("amountApplied: '%@'; "), self->_amountApplied);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAppliedPayment)initWithCoder:(id)a3
{
  id v4;
  PKPayLaterAppliedPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  uint64_t v8;
  PKCurrencyAmount *amountApplied;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPayLaterAppliedPayment;
  v5 = -[PKPayLaterAppliedPayment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentIdentifier = v5->_paymentIdentifier;
    v5->_paymentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amountApplied"));
    v8 = objc_claimAutoreleasedReturnValue();
    amountApplied = v5->_amountApplied;
    v5->_amountApplied = (PKCurrencyAmount *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *paymentIdentifier;
  id v5;

  paymentIdentifier = self->_paymentIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", paymentIdentifier, CFSTR("paymentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amountApplied, CFSTR("amountApplied"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPayLaterAppliedPayment *v5;
  uint64_t v6;
  NSString *paymentIdentifier;
  PKCurrencyAmount *v8;
  PKCurrencyAmount *amountApplied;

  v5 = -[PKPayLaterAppliedPayment init](+[PKPayLaterAppliedPayment allocWithZone:](PKPayLaterAppliedPayment, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_paymentIdentifier, "copyWithZone:", a3);
  paymentIdentifier = v5->_paymentIdentifier;
  v5->_paymentIdentifier = (NSString *)v6;

  v8 = -[PKCurrencyAmount copyWithZone:](self->_amountApplied, "copyWithZone:", a3);
  amountApplied = v5->_amountApplied;
  v5->_amountApplied = v8;

  return v5;
}

- (NSString)paymentIdentifier
{
  return self->_paymentIdentifier;
}

- (void)setPaymentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PKCurrencyAmount)amountApplied
{
  return self->_amountApplied;
}

- (void)setAmountApplied:(id)a3
{
  objc_storeStrong((id *)&self->_amountApplied, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountApplied, 0);
  objc_storeStrong((id *)&self->_paymentIdentifier, 0);
}

@end
