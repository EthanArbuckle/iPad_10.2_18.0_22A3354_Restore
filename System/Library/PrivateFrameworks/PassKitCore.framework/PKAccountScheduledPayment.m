@implementation PKAccountScheduledPayment

- (PKAccountScheduledPayment)init
{
  return -[PKAccountScheduledPayment initWithCurrencyAmount:fundingSource:](self, "initWithCurrencyAmount:fundingSource:", 0, 0);
}

- (PKAccountScheduledPayment)initWithCurrencyAmount:(id)a3 fundingSource:(id)a4
{
  id v7;
  id v8;
  PKAccountScheduledPayment *v9;
  PKAccountScheduledPayment *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountScheduledPayment;
  v9 = -[PKAccountScheduledPayment init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_currencyAmount, a3);
    objc_storeStrong((id *)&v10->_fundingSource, a4);
  }

  return v10;
}

- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v7, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("amount"));

      -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("currencyCode"));

    }
  }
  -[PKAccountPaymentFundingSource jsonDictionaryRepresentationWithCertificatesResponse:](self->_fundingSource, "jsonDictionaryRepresentationWithCertificatesResponse:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("paymentDetails"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("fundingSource"));
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

- (id)hashComponentWithCertificatesResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  PKCurrencyAmount *currencyAmount;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountPaymentFundingSource hashComponentWithCertificatesResponse:](self->_fundingSource, "hashComponentWithCertificatesResponse:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v6, "appendString:", v7);
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    -[PKCurrencyAmount amount](currencyAmount, "amount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if ((v11 & 1) == 0)
      {
        objc_msgSend(v9, "stringValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v12);

        -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendString:", v13);

      }
    }

  }
  v14 = (void *)objc_msgSend(v6, "copy");

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountScheduledPayment)initWithCoder:(id)a3
{
  id v4;
  PKAccountScheduledPayment *v5;
  uint64_t v6;
  PKCurrencyAmount *currencyAmount;
  uint64_t v8;
  PKAccountPaymentFundingSource *fundingSource;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledPayment;
  v5 = -[PKAccountScheduledPayment init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fundingSource"));
    v8 = objc_claimAutoreleasedReturnValue();
    fundingSource = v5->_fundingSource;
    v5->_fundingSource = (PKAccountPaymentFundingSource *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  PKCurrencyAmount *currencyAmount;
  id v5;

  currencyAmount = self->_currencyAmount;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currencyAmount, CFSTR("currencyAmount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fundingSource, CFSTR("fundingSource"));

}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
