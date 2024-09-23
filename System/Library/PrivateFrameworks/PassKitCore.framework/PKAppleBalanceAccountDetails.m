@implementation PKAppleBalanceAccountDetails

- (PKAppleBalanceAccountDetails)initWithDictionary:(id)a3
{
  id v4;
  PKAppleBalanceAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *fpanIdentifier;
  uint64_t v16;
  NSString *associatedPassTypeIdentifier;
  uint64_t v18;
  NSString *associatedPassSerialNumber;
  void *v20;
  PKAppleBalanceAccountSummary *v21;
  void *v22;
  uint64_t v23;
  PKAppleBalanceAccountSummary *accountSummary;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = -[PKAppleBalanceAccountDetails init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("fpanId"));
    v14 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v14;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassTypeIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v16;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("associatedPassSerialNumber"));
    v18 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v18;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("cardType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_cardType = PKPaymentCredentialTypeForPaymentNetworkName(v20);

    v21 = [PKAppleBalanceAccountSummary alloc];
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("accountSummary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PKAppleBalanceAccountSummary initWithDictionary:](v21, "initWithDictionary:", v22);
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKAppleBalanceAccountSummary *)v23;

  }
  return v5;
}

- (PKAppleBalanceAccountDetails)initWithCloudRecord:(id)a3
{
  id v4;
  PKAppleBalanceAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *fpanIdentifier;
  uint64_t v12;
  NSString *associatedPassTypeIdentifier;
  uint64_t v14;
  NSString *countryCode;
  uint64_t v16;
  NSString *currencyCode;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PKAppleBalanceAccountSummary *v22;
  PKAppleBalanceAccountSummary *accountSummary;
  _QWORD v25[2];
  int v26;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = -[PKAppleBalanceAccountDetails init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_dateForKey:", CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "pk_dateForKey:", CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("fpanId"));
    v10 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v10;

    objc_msgSend(v4, "pk_stringForKey:", CFSTR("associatedPassTypeIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v12;

    v5->_cardType = (int)objc_msgSend(v4, "pk_intForKey:", CFSTR("cardType"));
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("countryCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v14;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("balanceCurrencyCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v16;

    objc_msgSend(v4, "pk_encryptedObjectForKey:ofClass:", CFSTR("balanceAmount"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = (void *)MEMORY[0x1E0CB3598];
    if (v18)
    {
      objc_msgSend(v18, "decimalValue");
    }
    else
    {
      v25[0] = 0;
      v25[1] = 0;
      v26 = 0;
    }
    objc_msgSend(v20, "decimalNumberWithDecimal:", v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(PKAppleBalanceAccountSummary);
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = v22;

    -[PKAppleBalanceAccountSummary setCurrentBalance:](v5->_accountSummary, "setCurrentBalance:", v21);
  }

  return v5;
}

- (PKCurrencyAmount)currentBalance
{
  NSDecimalNumber *v3;
  void *v4;

  -[PKAppleBalanceAccountSummary currentBalance](self->_accountSummary, "currentBalance");
  v3 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v3, self->_currencyCode, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PKCurrencyAmount *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalanceAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKAppleBalanceAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *fpanIdentifier;
  uint64_t v16;
  NSString *associatedPassSerialNumber;
  uint64_t v18;
  NSString *associatedPassTypeIdentifier;
  uint64_t v20;
  PKAppleBalanceAccountSummary *accountSummary;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAppleBalanceAccountDetails;
  v5 = -[PKAppleBalanceAccountDetails init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdatedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    createdDate = v5->_createdDate;
    v5->_createdDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v10 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v12 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpanId"));
    v14 = objc_claimAutoreleasedReturnValue();
    fpanIdentifier = v5->_fpanIdentifier;
    v5->_fpanIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassSerialNumber"));
    v16 = objc_claimAutoreleasedReturnValue();
    associatedPassSerialNumber = v5->_associatedPassSerialNumber;
    v5->_associatedPassSerialNumber = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPassTypeIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
    v5->_associatedPassTypeIdentifier = (NSString *)v18;

    v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountSummary"));
    v20 = objc_claimAutoreleasedReturnValue();
    accountSummary = v5->_accountSummary;
    v5->_accountSummary = (PKAppleBalanceAccountSummary *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastUpdatedDate;
  id v5;

  lastUpdatedDate = self->_lastUpdatedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpanIdentifier, CFSTR("fpanId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassSerialNumber, CFSTR("associatedPassSerialNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPassTypeIdentifier, CFSTR("associatedPassTypeIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountSummary, CFSTR("accountSummary"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *lastUpdatedDate;
  NSDate *v6;
  NSDate *createdDate;
  NSDate *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  void *v14;
  NSString *v15;
  _BOOL4 v16;
  void *v17;
  NSString *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  _BOOL4 v22;
  void *v23;
  NSString *v24;
  _BOOL4 v25;
  BOOL v26;
  PKAppleBalanceAccountSummary *accountSummary;
  PKAppleBalanceAccountSummary *v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_42;
  lastUpdatedDate = self->_lastUpdatedDate;
  v6 = (NSDate *)v4[1];
  if (lastUpdatedDate && v6)
  {
    if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0)
      goto LABEL_42;
  }
  else if (lastUpdatedDate != v6)
  {
    goto LABEL_42;
  }
  createdDate = self->_createdDate;
  v8 = (NSDate *)v4[2];
  if (!createdDate || !v8)
  {
    if (createdDate == v8)
      goto LABEL_12;
LABEL_42:
    v26 = 0;
    goto LABEL_43;
  }
  if ((-[NSDate isEqual:](createdDate, "isEqual:") & 1) == 0)
    goto LABEL_42;
LABEL_12:
  v9 = (void *)v4[7];
  v10 = self->_countryCode;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
      goto LABEL_41;
    v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_42;
  }
  v14 = (void *)v4[8];
  v10 = self->_currencyCode;
  v15 = v14;
  if (v10 == v15)
  {

  }
  else
  {
    v12 = v15;
    if (!v10 || !v15)
      goto LABEL_41;
    v16 = -[NSString isEqualToString:](v10, "isEqualToString:", v15);

    if (!v16)
      goto LABEL_42;
  }
  v17 = (void *)v4[3];
  v10 = self->_fpanIdentifier;
  v18 = v17;
  if (v10 == v18)
  {

  }
  else
  {
    v12 = v18;
    if (!v10 || !v18)
      goto LABEL_41;
    v19 = -[NSString isEqualToString:](v10, "isEqualToString:", v18);

    if (!v19)
      goto LABEL_42;
  }
  v20 = (void *)v4[5];
  v10 = self->_associatedPassSerialNumber;
  v21 = v20;
  if (v10 == v21)
  {

    goto LABEL_36;
  }
  v12 = v21;
  if (!v10 || !v21)
  {
LABEL_41:

    goto LABEL_42;
  }
  v22 = -[NSString isEqualToString:](v10, "isEqualToString:", v21);

  if (!v22)
    goto LABEL_42;
LABEL_36:
  v23 = (void *)v4[4];
  v10 = self->_associatedPassTypeIdentifier;
  v24 = v23;
  if (v10 == v24)
  {

    goto LABEL_45;
  }
  v12 = v24;
  if (!v10 || !v24)
    goto LABEL_41;
  v25 = -[NSString isEqualToString:](v10, "isEqualToString:", v24);

  if (!v25)
    goto LABEL_42;
LABEL_45:
  if (self->_cardType != v4[6])
    goto LABEL_42;
  accountSummary = self->_accountSummary;
  v29 = (PKAppleBalanceAccountSummary *)v4[9];
  if (accountSummary && v29)
    v26 = -[PKAppleBalanceAccountSummary isEqual:](accountSummary, "isEqual:");
  else
    v26 = accountSummary == v29;
LABEL_43:

  return v26;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdatedDate);
  objc_msgSend(v3, "safelyAddObject:", self->_createdDate);
  objc_msgSend(v3, "safelyAddObject:", self->_countryCode);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_fpanIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassSerialNumber);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedPassTypeIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_accountSummary);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_cardType - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_lastUpdatedDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdateDate: '%@'; "), v4);

  -[NSDate description](self->_createdDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("createdDate: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("fpanIdentifier: '%@'; "), self->_fpanIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassSerialNumber: '%@'; "), self->_associatedPassSerialNumber);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedPassTypeIdentifier: '%@'; "), self->_associatedPassTypeIdentifier);
  PKPaymentNetworkNameForPaymentCredentialType(self->_cardType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cardType: '%@'; "), v6);

  -[PKAppleBalanceAccountSummary description](self->_accountSummary, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("summary: '%@'; "), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKAppleBalanceAccountDetails *v5;
  uint64_t v6;
  NSDate *lastUpdatedDate;
  uint64_t v8;
  NSDate *createdDate;
  uint64_t v10;
  NSString *countryCode;
  uint64_t v12;
  NSString *currencyCode;
  uint64_t v14;
  NSString *fpanIdentifier;
  uint64_t v16;
  NSString *associatedPassSerialNumber;
  uint64_t v18;
  NSString *associatedPassTypeIdentifier;
  PKAppleBalanceAccountSummary *v20;
  PKAppleBalanceAccountSummary *accountSummary;

  v5 = -[PKAppleBalanceAccountDetails init](+[PKAppleBalanceAccountDetails allocWithZone:](PKAppleBalanceAccountDetails, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdatedDate, "copyWithZone:", a3);
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_createdDate, "copyWithZone:", a3);
  createdDate = v5->_createdDate;
  v5->_createdDate = (NSDate *)v8;

  v10 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  countryCode = v5->_countryCode;
  v5->_countryCode = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_fpanIdentifier, "copyWithZone:", a3);
  fpanIdentifier = v5->_fpanIdentifier;
  v5->_fpanIdentifier = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_associatedPassSerialNumber, "copyWithZone:", a3);
  associatedPassSerialNumber = v5->_associatedPassSerialNumber;
  v5->_associatedPassSerialNumber = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_associatedPassTypeIdentifier, "copyWithZone:", a3);
  associatedPassTypeIdentifier = v5->_associatedPassTypeIdentifier;
  v5->_associatedPassTypeIdentifier = (NSString *)v18;

  v5->_cardType = self->_cardType;
  v20 = -[PKAppleBalanceAccountSummary copyWithZone:](self->_accountSummary, "copyWithZone:", a3);
  accountSummary = v5->_accountSummary;
  v5->_accountSummary = v20;

  return v5;
}

- (void)encodeWithCloudRecord:(id)a3 codingType:(unint64_t)a4
{
  NSDate *lastUpdatedDate;
  id v6;
  void *v7;
  void *v8;
  id v9;

  lastUpdatedDate = self->_lastUpdatedDate;
  v6 = a3;
  objc_msgSend(v6, "setObject:forKey:", lastUpdatedDate, CFSTR("lastUpdatedDate"));
  objc_msgSend(v6, "setObject:forKey:", self->_createdDate, CFSTR("createdDate"));
  objc_msgSend(v6, "setObject:forKey:", self->_associatedPassTypeIdentifier, CFSTR("associatedPassTypeIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_cardType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("cardType"));

  objc_msgSend(v6, "encryptedValues");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKey:", self->_countryCode, CFSTR("countryCode"));
  objc_msgSend(v9, "setObject:forKey:", self->_currencyCode, CFSTR("balanceCurrencyCode"));
  objc_msgSend(v9, "setObject:forKey:", self->_fpanIdentifier, CFSTR("fpanId"));
  -[PKAppleBalanceAccountSummary currentBalance](self->_accountSummary, "currentBalance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("balanceAmount"));

}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)createdDate
{
  return self->_createdDate;
}

- (void)setCreatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)fpanIdentifier
{
  return self->_fpanIdentifier;
}

- (void)setFpanIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)associatedPassTypeIdentifier
{
  return self->_associatedPassTypeIdentifier;
}

- (void)setAssociatedPassTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)associatedPassSerialNumber
{
  return self->_associatedPassSerialNumber;
}

- (void)setAssociatedPassSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (void)setCardType:(int64_t)a3
{
  self->_cardType = a3;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PKAppleBalanceAccountSummary)accountSummary
{
  return self->_accountSummary;
}

- (void)setAccountSummary:(id)a3
{
  objc_storeStrong((id *)&self->_accountSummary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountSummary, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_associatedPassSerialNumber, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_fpanIdentifier, 0);
  objc_storeStrong((id *)&self->_createdDate, 0);
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
}

@end
