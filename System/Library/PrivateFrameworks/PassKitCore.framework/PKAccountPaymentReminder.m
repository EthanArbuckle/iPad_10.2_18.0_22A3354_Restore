@implementation PKAccountPaymentReminder

- (PKAccountPaymentReminder)initWithDictionary:(id)a3
{
  id v4;
  PKAccountPaymentReminder *v5;
  uint64_t v6;
  NSString *currencyCode;
  uint64_t v8;
  NSDecimalNumber *minimumDue;
  uint64_t v10;
  NSDate *paymentDueDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  v5 = -[PKAccountPaymentReminder init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumDue"));
    v8 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("paymentDueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentReminder)initWithCoder:(id)a3
{
  id v4;
  PKAccountPaymentReminder *v5;
  uint64_t v6;
  NSDecimalNumber *minimumDue;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSDate *paymentDueDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  v5 = -[PKAccountPaymentReminder init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDue"));
    v6 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDueDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *minimumDue;
  id v5;

  minimumDue = self->_minimumDue;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", minimumDue, CFSTR("minimumDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDueDate, CFSTR("paymentDueDate"));

}

- (PKAccountPaymentReminder)initWithRecord:(id)a3
{
  id v4;
  PKAccountPaymentReminder *v5;
  uint64_t v6;
  NSDate *paymentDueDate;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSDecimalNumber *minimumDue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountPaymentReminder;
  v5 = -[PKAccountPaymentReminder init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("paymentDueDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v6;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("minimumDue"));
    v10 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v10;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "setObject:forKey:", self->_paymentDueDate, CFSTR("paymentDueDate"));
  -[NSDecimalNumber stringValue](self->_minimumDue, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("minimumDue"));

}

+ (id)recordType
{
  return CFSTR("PaymentReminder");
}

+ (id)recordNamePrefix
{
  return CFSTR("paymentReminder-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *minimumDue;
  NSDecimalNumber *v6;
  NSDate *paymentDueDate;
  NSDate *v8;
  NSString *currencyCode;
  NSString *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  minimumDue = self->_minimumDue;
  v6 = (NSDecimalNumber *)v4[1];
  if (minimumDue && v6)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0)
      goto LABEL_14;
  }
  else if (minimumDue != v6)
  {
    goto LABEL_14;
  }
  paymentDueDate = self->_paymentDueDate;
  v8 = (NSDate *)v4[3];
  if (!paymentDueDate || !v8)
  {
    if (paymentDueDate == v8)
      goto LABEL_10;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_10:
  currencyCode = self->_currencyCode;
  v10 = (NSString *)v4[2];
  if (currencyCode && v10)
    v11 = -[NSString isEqual:](currencyCode, "isEqual:");
  else
    v11 = currencyCode == v10;
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDue);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumDue: '%@'; "), self->_minimumDue);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSDate description](self->_paymentDueDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDueDate: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
}

@end
