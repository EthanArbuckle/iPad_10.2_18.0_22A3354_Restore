@implementation STSPaymentRequestBase

- (STSPaymentRequestBase)initWithTransactionAmount:(id)a3 currencyCode:(id)a4 countryCode:(id)a5 transactionDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  STSPaymentRequestBase *v15;
  STSPaymentRequestBase *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STSPaymentRequestBase;
  v15 = -[STSPaymentRequestBase init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_transactionDate, a6);
    objc_storeStrong((id *)&v16->_countryCode, a5);
    objc_storeStrong((id *)&v16->_currencyCode, a4);
    objc_storeStrong((id *)&v16->_transactionAmount, a3);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSPaymentRequestBase)initWithCoder:(id)a3
{
  id v4;
  STSPaymentRequestBase *v5;
  uint64_t v6;
  NSString *currencyCode;
  uint64_t v8;
  NSString *countryCode;
  uint64_t v10;
  NSDecimalNumber *transactionAmount;
  uint64_t v12;
  NSDate *transactionDate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STSPaymentRequestBase;
  v5 = -[STSPaymentRequestBase init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *currencyCode;
  id v5;

  currencyCode = self->_currencyCode;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionAmount, CFSTR("transactionAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));

}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_storeStrong((id *)&self->_transactionAmount, a3);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_storeStrong((id *)&self->_transactionDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_transactionAmount, 0);
}

@end
