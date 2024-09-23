@implementation PKPaymentTransactionFeeItem

- (PKPaymentTransactionFeeItem)initWithFeeDictionary:(id)a3
{
  id v4;
  PKPaymentTransactionFeeItem *v5;
  PKPaymentTransactionFeeItem *v6;
  PKPaymentTransactionFeeItem *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKPaymentTransactionFeeItem;
    v5 = -[PKPaymentTransactionFeeItem init](&v9, sel_init);
    v6 = v5;
    if (v5)
      -[PKPaymentTransactionFeeItem _initWithFeeDictionary:](v5, "_initWithFeeDictionary:", v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_initWithFeeDictionary:(id)a3
{
  NSString *v4;
  NSString *identifier;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  PKCurrencyAmount *v11;
  PKCurrencyAmount *currencyAmount;
  NSString *v13;
  NSString *localizedDisplayName;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "objectForKey:", CFSTR("identifier"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v4;

  objc_msgSend(v15, "objectForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_type = PKPaymentTransactionFeeItemTypeFromString(v6);

  objc_msgSend(v15, "PKDecimalNumberFromStringForKey:", CFSTR("amount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("currencyCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToNumber:", v9);

    if ((v10 & 1) == 0)
    {
      if (v8)
      {
        v11 = -[PKCurrencyAmount initWithAmount:currency:exponent:]([PKCurrencyAmount alloc], "initWithAmount:currency:exponent:", v7, v8, 0);
        currencyAmount = self->_currencyAmount;
        self->_currencyAmount = v11;

      }
    }
  }
  objc_msgSend(v15, "objectForKey:", CFSTR("localizedDisplayName"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedDisplayName = self->_localizedDisplayName;
  self->_localizedDisplayName = v13;

}

- (id)jsonDictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  PKCurrencyAmount *currencyAmount;
  void *v7;
  void *v8;
  void *v9;
  NSString *localizedDisplayName;
  unint64_t type;
  const __CFString *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  currencyAmount = self->_currencyAmount;
  if (currencyAmount)
  {
    -[PKCurrencyAmount currency](currencyAmount, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCurrencyAmount amount](self->_currencyAmount, "amount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("currencyCode"));
    if (v8)
    {
      objc_msgSend(v8, "stringValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("amount"));

    }
  }
  localizedDisplayName = self->_localizedDisplayName;
  if (localizedDisplayName)
    objc_msgSend(v4, "setObject:forKey:", localizedDisplayName, CFSTR("localizedDisplayName"));
  type = self->_type;
  v12 = CFSTR("creditCard");
  switch(type)
  {
    case 1uLL:
      break;
    case 2uLL:
      v12 = CFSTR("foreignTransaction");
      break;
    case 3uLL:
      v12 = CFSTR("serviceCharge");
      break;
    case 4uLL:
      v12 = CFSTR("instantWithdrawal");
      break;
    default:
      if (type == 100)
        v12 = CFSTR("other");
      else
        v12 = CFSTR("unknown");
      break;
  }
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("type"));
  v13 = (void *)objc_msgSend(v4, "copy");

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionFeeItem)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionFeeItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  PKCurrencyAmount *currencyAmount;
  void *v10;
  uint64_t v11;
  NSString *localizedDisplayName;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentTransactionFeeItem;
  v5 = -[PKPaymentTransactionFeeItem init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmount"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyAmount = v5->_currencyAmount;
    v5->_currencyAmount = (PKCurrencyAmount *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentTransactionFeeItemTypeFromString(v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
    v11 = objc_claimAutoreleasedReturnValue();
    localizedDisplayName = v5->_localizedDisplayName;
    v5->_localizedDisplayName = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  const __CFString *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_currencyAmount, CFSTR("currencyAmount"));
  type = self->_type;
  v5 = CFSTR("creditCard");
  switch(type)
  {
    case 1uLL:
      break;
    case 2uLL:
      v5 = CFSTR("foreignTransaction");
      break;
    case 3uLL:
      v5 = CFSTR("serviceCharge");
      break;
    case 4uLL:
      v5 = CFSTR("instantWithdrawal");
      break;
    default:
      if (type == 100)
        v5 = CFSTR("other");
      else
        v5 = CFSTR("unknown");
      break;
  }
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_localizedDisplayName);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionFeeItem *v4;
  PKPaymentTransactionFeeItem *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionFeeItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionFeeItem isEqualToFeeItem:](self, "isEqualToFeeItem:", v5);

  return v6;
}

- (BOOL)isEqualToFeeItem:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  BOOL v7;
  PKCurrencyAmount *currencyAmount;
  PKCurrencyAmount *v9;
  NSString *localizedDisplayName;
  NSString *v11;
  BOOL v12;

  v4 = a3;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (identifier != v6)
      goto LABEL_19;
  }
  else if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_19;
  }
  currencyAmount = self->_currencyAmount;
  v9 = (PKCurrencyAmount *)v4[3];
  if (currencyAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](currencyAmount, "isEqual:"))
      goto LABEL_19;
  }
  else if (currencyAmount != v9)
  {
    goto LABEL_19;
  }
  localizedDisplayName = self->_localizedDisplayName;
  v11 = (NSString *)v4[4];
  if (!localizedDisplayName || !v11)
  {
    if (localizedDisplayName == v11)
      goto LABEL_17;
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](localizedDisplayName, "isEqual:") & 1) == 0)
    goto LABEL_19;
LABEL_17:
  v12 = self->_type == v4[2];
LABEL_20:

  return v12;
}

- (id)description
{
  void *v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  v4 = CFSTR("creditCard");
  switch(self->_type)
  {
    case 1uLL:
      break;
    case 2uLL:
      v4 = CFSTR("foreignTransaction");
      break;
    case 3uLL:
      v4 = CFSTR("serviceCharge");
      break;
    case 4uLL:
      v4 = CFSTR("instantWithdrawal");
      break;
    default:
      v4 = CFSTR("other");
      if (CFSTR("creditCard") != (__CFString *)100)
        v4 = CFSTR("unknown");
      break;
  }
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyAmount: '%@'; "), self->_currencyAmount);
  objc_msgSend(v3, "appendFormat:", CFSTR("localizedDisplayName: '%@'; "), self->_localizedDisplayName);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (PKCurrencyAmount)currencyAmount
{
  return self->_currencyAmount;
}

- (void)setCurrencyAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
