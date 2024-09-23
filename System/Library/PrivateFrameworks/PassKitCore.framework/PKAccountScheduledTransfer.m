@implementation PKAccountScheduledTransfer

- (PKAccountScheduledTransfer)init
{
  return -[PKAccountScheduledTransfer initWithCurrencyAmount:type:externalAccount:](self, "initWithCurrencyAmount:type:externalAccount:", 0, 0, 0);
}

- (PKAccountScheduledTransfer)initWithCurrencyAmount:(id)a3 type:(unint64_t)a4 externalAccount:(id)a5
{
  id v9;
  id v10;
  PKAccountScheduledTransfer *v11;
  PKAccountScheduledTransfer *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountScheduledTransfer;
  v11 = -[PKAccountScheduledTransfer init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_currencyAmount, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_externalAccount, a5);
  }

  return v12;
}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "pk_isNotANumber") & 1) == 0)
  {
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("amount"));

    -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("currencyCode"));

  }
  -[PKAccountPaymentFundingSource jsonDictionaryRepresentation](self->_externalAccount, "jsonDictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("transferDetails"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("externalAccount"));
  PKAccountTransferTypeToString(self->_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("type"));

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)hashComponent
{
  void *v3;
  void *v4;
  PKCurrencyAmount *currencyAmount;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountTransferExternalAccount hashComponent](self->_externalAccount, "hashComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "appendString:", v4);
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    -[PKCurrencyAmount amount](currencyAmount, "amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "pk_isNotANumber") & 1) == 0)
    {
      objc_msgSend(v7, "stringValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v8);

      -[PKCurrencyAmount currency](self->_currencyAmount, "currency");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v9);

    }
  }
  PKAccountTransferTypeToString(self->_type);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountScheduledTransfer)initWithCoder:(id)a3
{
  id v4;
  PKAccountScheduledTransfer *v5;
  uint64_t v6;
  PKCurrencyAmount *currencyAmount;
  uint64_t v8;
  PKAccountTransferExternalAccount *externalAccount;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountScheduledTransfer;
  v5 = -[PKAccountScheduledTransfer init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v6 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalAccount"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalAccount = v5->_externalAccount;
    v5->_externalAccount = (PKAccountTransferExternalAccount *)v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalAccount, CFSTR("externalAccount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmount, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKAccountTransferExternalAccount)externalAccount
{
  return self->_externalAccount;
}

- (void)setExternalAccount:(id)a3
{
  objc_storeStrong((id *)&self->_externalAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAccount, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
}

@end
