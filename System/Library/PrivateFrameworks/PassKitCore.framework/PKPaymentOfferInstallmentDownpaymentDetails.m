@implementation PKPaymentOfferInstallmentDownpaymentDetails

- (PKPaymentOfferInstallmentDownpaymentDetails)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentDownpaymentDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *amount;
  uint64_t v8;
  NSDate *paymentDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentDownpaymentDetails;
  v5 = -[PKPaymentOfferInstallmentDownpaymentDetails init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKCurrencyAmountForKey:", CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("paymentDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v8;

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKCurrencyAmount dictionaryRepresentation](self->_amount, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("amount"));

  PKISO8601DateStringFromDate(self->_paymentDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("paymentDate"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferInstallmentDownpaymentDetails *v4;
  PKPaymentOfferInstallmentDownpaymentDetails *v5;
  PKPaymentOfferInstallmentDownpaymentDetails *v6;
  PKCurrencyAmount *amount;
  PKCurrencyAmount *v8;
  NSDate *paymentDate;
  NSDate *v10;
  char v11;

  v4 = (PKPaymentOfferInstallmentDownpaymentDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        amount = self->_amount;
        v8 = v6->_amount;
        if (amount && v8)
        {
          if (-[PKCurrencyAmount isEqual:](amount, "isEqual:"))
          {
LABEL_7:
            paymentDate = self->_paymentDate;
            v10 = v6->_paymentDate;
            if (paymentDate && v10)
              v11 = -[NSDate isEqual:](paymentDate, "isEqual:");
            else
              v11 = paymentDate == v10;
            goto LABEL_15;
          }
        }
        else if (amount == v8)
        {
          goto LABEL_7;
        }
        v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDate);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDate: '%@'; "), self->_paymentDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferInstallmentDownpaymentDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferInstallmentDownpaymentDetails *v5;
  uint64_t v6;
  PKCurrencyAmount *amount;
  uint64_t v8;
  NSDate *paymentDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferInstallmentDownpaymentDetails;
  v5 = -[PKPaymentOfferInstallmentDownpaymentDetails init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v6 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    paymentDate = v5->_paymentDate;
    v5->_paymentDate = (NSDate *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *amount;
  id v5;

  amount = self->_amount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", amount, CFSTR("amount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDate, CFSTR("paymentDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferInstallmentDownpaymentDetails *v5;
  PKCurrencyAmount *v6;
  PKCurrencyAmount *amount;
  uint64_t v8;
  NSDate *paymentDate;

  v5 = -[PKPaymentOfferInstallmentDownpaymentDetails init](+[PKPaymentOfferInstallmentDownpaymentDetails allocWithZone:](PKPaymentOfferInstallmentDownpaymentDetails, "allocWithZone:"), "init");
  v6 = -[PKCurrencyAmount copyWithZone:](self->_amount, "copyWithZone:", a3);
  amount = v5->_amount;
  v5->_amount = v6;

  v8 = -[NSDate copyWithZone:](self->_paymentDate, "copyWithZone:", a3);
  paymentDate = v5->_paymentDate;
  v5->_paymentDate = (NSDate *)v8;

  return v5;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSDate)paymentDate
{
  return self->_paymentDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDate, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

@end
