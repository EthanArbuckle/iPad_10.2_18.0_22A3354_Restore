@implementation PKPaymentTokenContext

+ (PKPaymentTokenContext)contextWithProtobuf:(id)a3
{
  id v3;
  PKPaymentTokenContext *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc_init(PKPaymentTokenContext);
  objc_msgSend(v3, "merchantIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTokenContext setMerchantIdentifier:](v4, "setMerchantIdentifier:", v5);

  objc_msgSend(v3, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTokenContext setExternalIdentifier:](v4, "setExternalIdentifier:", v6);

  objc_msgSend(v3, "merchantName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTokenContext setMerchantName:](v4, "setMerchantName:", v7);

  objc_msgSend(v3, "merchantDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentTokenContext setMerchantDomain:](v4, "setMerchantDomain:", v8);

  if (objc_msgSend(v3, "hasDecimalAmount"))
  {
    objc_msgSend(v3, "decimalAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKProtoSupportDecimalNumberFromProtobuf(v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "hasCustomPrecisionAmount"))
    {
      PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v3, "amount"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentTokenContext setAmount:](v4, "setAmount:", v9);
      goto LABEL_7;
    }
    objc_msgSend(v3, "customPrecisionAmount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKLegacyCurrencyStorageIntegerToDecimal(objc_msgSend(v9, "amount"), 1);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  -[PKPaymentTokenContext setAmount:](v4, "setAmount:", v10);

LABEL_7:
  return v4;
}

- (id)protobuf
{
  PKProtobufPaymentTokenContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(PKProtobufPaymentTokenContext);
  -[PKPaymentTokenContext merchantIdentifier](self, "merchantIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setMerchantIdentifier:](v3, "setMerchantIdentifier:", v4);

  -[PKPaymentTokenContext externalIdentifier](self, "externalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setExternalIdentifier:](v3, "setExternalIdentifier:", v5);

  -[PKPaymentTokenContext merchantName](self, "merchantName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setMerchantName:](v3, "setMerchantName:", v6);

  -[PKPaymentTokenContext merchantDomain](self, "merchantDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setMerchantDomain:](v3, "setMerchantDomain:", v7);

  -[PKPaymentTokenContext amount](self, "amount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setAmount:](v3, "setAmount:", PKCurrencyDecimalToLegacyStorageInteger(v8, 0));

  -[PKPaymentTokenContext amount](self, "amount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DecimalToCustomPrecisionProtobuf(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setCustomPrecisionAmount:](v3, "setCustomPrecisionAmount:", v10);

  -[PKPaymentTokenContext amount](self, "amount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKProtoSupportProtoDecimalNumberFromDecimalNumber(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProtobufPaymentTokenContext setDecimalAmount:](v3, "setDecimalAmount:", v12);

  return v3;
}

- (PKPaymentTokenContext)initWithMerchantIdentifier:(NSString *)merchantIdentifier externalIdentifier:(NSString *)externalIdentifier merchantName:(NSString *)merchantName merchantDomain:(NSString *)merchantDomain amount:(NSDecimalNumber *)amount
{
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSDecimalNumber *v16;
  PKPaymentTokenContext *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *v25;
  uint64_t v26;
  NSDecimalNumber *v27;
  objc_super v29;

  v12 = merchantIdentifier;
  v13 = externalIdentifier;
  v14 = merchantName;
  v15 = merchantDomain;
  v16 = amount;
  v29.receiver = self;
  v29.super_class = (Class)PKPaymentTokenContext;
  v17 = -[PKPaymentTokenContext init](&v29, sel_init);
  if (v17)
  {
    v18 = -[NSString copy](v12, "copy");
    v19 = v17->_merchantIdentifier;
    v17->_merchantIdentifier = (NSString *)v18;

    v20 = -[NSString copy](v13, "copy");
    v21 = v17->_externalIdentifier;
    v17->_externalIdentifier = (NSString *)v20;

    v22 = -[NSString copy](v14, "copy");
    v23 = v17->_merchantName;
    v17->_merchantName = (NSString *)v22;

    v24 = -[NSString copy](v15, "copy");
    v25 = v17->_merchantDomain;
    v17->_merchantDomain = (NSString *)v24;

    v26 = -[NSDecimalNumber copy](v16, "copy");
    v27 = v17->_amount;
    v17->_amount = (NSDecimalNumber *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTokenContext *v4;
  PKPaymentTokenContext *v5;
  BOOL v6;

  v4 = (PKPaymentTokenContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTokenContext isEqualToPaymentTokenContext:](self, "isEqualToPaymentTokenContext:", v5);

  return v6;
}

- (BOOL)isEqualToPaymentTokenContext:(id)a3
{
  _QWORD *v4;
  NSString *merchantIdentifier;
  NSString *v6;
  BOOL v7;
  NSString *externalIdentifier;
  NSString *v9;
  NSString *merchantName;
  NSString *v11;
  NSString *merchantDomain;
  NSString *v13;
  NSDecimalNumber *amount;
  NSDecimalNumber *v15;
  char v16;

  v4 = a3;
  merchantIdentifier = self->_merchantIdentifier;
  v6 = (NSString *)v4[1];
  if (merchantIdentifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (merchantIdentifier != v6)
      goto LABEL_26;
  }
  else if ((-[NSString isEqual:](merchantIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_26;
  }
  externalIdentifier = self->_externalIdentifier;
  v9 = (NSString *)v4[2];
  if (externalIdentifier && v9)
  {
    if ((-[NSString isEqual:](externalIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (externalIdentifier != v9)
  {
    goto LABEL_26;
  }
  merchantName = self->_merchantName;
  v11 = (NSString *)v4[3];
  if (merchantName && v11)
  {
    if ((-[NSString isEqual:](merchantName, "isEqual:") & 1) == 0)
      goto LABEL_26;
  }
  else if (merchantName != v11)
  {
    goto LABEL_26;
  }
  merchantDomain = self->_merchantDomain;
  v13 = (NSString *)v4[4];
  if (!merchantDomain || !v13)
  {
    if (merchantDomain == v13)
      goto LABEL_22;
LABEL_26:
    v16 = 0;
    goto LABEL_27;
  }
  if ((-[NSString isEqual:](merchantDomain, "isEqual:") & 1) == 0)
    goto LABEL_26;
LABEL_22:
  amount = self->_amount;
  v15 = (NSDecimalNumber *)v4[5];
  if (amount && v15)
    v16 = -[NSDecimalNumber isEqual:](amount, "isEqual:");
  else
    v16 = amount == v15;
LABEL_27:

  return v16;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_externalIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantName);
  objc_msgSend(v3, "safelyAddObject:", self->_merchantDomain);
  objc_msgSend(v3, "safelyAddObject:", self->_amount);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSString copyWithZone:](self->_merchantIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_externalIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_merchantName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSString copyWithZone:](self->_merchantDomain, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_amount, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantIdentifier: %@, "), self->_merchantIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("externalIdentifier: %@, "), self->_externalIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("merchantName: %@, "), self->_merchantName);
  if (self->_merchantDomain)
    objc_msgSend(v3, "appendFormat:", CFSTR("merchantDomain: %@, "), self->_merchantDomain);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: %@, "), self->_amount);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTokenContext)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTokenContext *v5;
  uint64_t v6;
  NSString *merchantIdentifier;
  uint64_t v8;
  NSString *externalIdentifier;
  uint64_t v10;
  NSString *merchantName;
  uint64_t v12;
  NSString *merchantDomain;
  uint64_t v14;
  NSDecimalNumber *amount;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTokenContext;
  v5 = -[PKPaymentTokenContext init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v5->_merchantIdentifier;
    v5->_merchantIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantName"));
    v10 = objc_claimAutoreleasedReturnValue();
    merchantName = v5->_merchantName;
    v5->_merchantName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("merchantDomain"));
    v12 = objc_claimAutoreleasedReturnValue();
    merchantDomain = v5->_merchantDomain;
    v5->_merchantDomain = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("amount"));
    v14 = objc_claimAutoreleasedReturnValue();
    amount = v5->_amount;
    v5->_amount = (NSDecimalNumber *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *merchantIdentifier;
  id v5;

  merchantIdentifier = self->_merchantIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantName, CFSTR("merchantName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantDomain, CFSTR("merchantDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_amount, CFSTR("amount"));

}

+ (int64_t)version
{
  return 4;
}

- (PKPaymentTokenContext)initWithDictionary:(id)a3 error:(id *)a4
{
  id v5;
  PKPaymentTokenContext *v6;
  uint64_t v7;
  NSString *merchantIdentifier;
  uint64_t v9;
  NSString *externalIdentifier;
  uint64_t v11;
  NSString *merchantName;
  uint64_t v13;
  NSString *merchantDomain;
  uint64_t v15;
  NSDecimalNumber *amount;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentTokenContext;
  v6 = -[PKPaymentTokenContext init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "PKStringForKey:", CFSTR("merchantIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    merchantIdentifier = v6->_merchantIdentifier;
    v6->_merchantIdentifier = (NSString *)v7;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("externalIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v6->_externalIdentifier;
    v6->_externalIdentifier = (NSString *)v9;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("merchantName"));
    v11 = objc_claimAutoreleasedReturnValue();
    merchantName = v6->_merchantName;
    v6->_merchantName = (NSString *)v11;

    objc_msgSend(v5, "PKStringForKey:", CFSTR("merchantDomain"));
    v13 = objc_claimAutoreleasedReturnValue();
    merchantDomain = v6->_merchantDomain;
    v6->_merchantDomain = (NSString *)v13;

    objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
    v15 = objc_claimAutoreleasedReturnValue();
    amount = v6->_amount;
    v6->_amount = (NSDecimalNumber *)v15;

  }
  return v6;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantIdentifier, CFSTR("merchantIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_externalIdentifier, CFSTR("externalIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantName, CFSTR("merchantName"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_merchantDomain, CFSTR("merchantDomain"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_amount, CFSTR("amount"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (void)setMerchantIdentifier:(NSString *)merchantIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, merchantIdentifier, 8);
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(NSString *)externalIdentifier
{
  objc_setProperty_nonatomic_copy(self, a2, externalIdentifier, 16);
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(NSString *)merchantName
{
  objc_setProperty_nonatomic_copy(self, a2, merchantName, 24);
}

- (NSString)merchantDomain
{
  return self->_merchantDomain;
}

- (void)setMerchantDomain:(NSString *)merchantDomain
{
  objc_setProperty_nonatomic_copy(self, a2, merchantDomain, 32);
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(NSDecimalNumber *)amount
{
  objc_setProperty_nonatomic_copy(self, a2, amount, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_merchantDomain, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
}

@end
