@implementation PKSavingsAccountStatement

- (PKSavingsAccountStatement)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDate *closingDate;
  uint64_t v14;
  NSDecimalNumber *openingBalance;
  uint64_t v16;
  NSDecimalNumber *closingBalance;
  uint64_t v18;
  NSDecimalNumber *interestEarned;
  uint64_t v20;
  NSDecimalNumber *totalDeposits;
  uint64_t v22;
  NSDecimalNumber *totalDailyCashDeposits;
  uint64_t v24;
  NSDecimalNumber *totalWithdrawn;
  uint64_t v26;
  NSDecimalNumber *apy;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKSavingsAccountStatement;
  v5 = -[PKSavingsAccountStatement init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("openingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("closingDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("openingBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    openingBalance = v5->_openingBalance;
    v5->_openingBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("closingBalance"));
    v16 = objc_claimAutoreleasedReturnValue();
    closingBalance = v5->_closingBalance;
    v5->_closingBalance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestEarned"));
    v18 = objc_claimAutoreleasedReturnValue();
    interestEarned = v5->_interestEarned;
    v5->_interestEarned = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalDeposits"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalDeposits = v5->_totalDeposits;
    v5->_totalDeposits = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalDailyCashDeposits"));
    v22 = objc_claimAutoreleasedReturnValue();
    totalDailyCashDeposits = v5->_totalDailyCashDeposits;
    v5->_totalDailyCashDeposits = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalWithdrawn"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalWithdrawn = v5->_totalWithdrawn;
    v5->_totalWithdrawn = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("apy"));
    v26 = objc_claimAutoreleasedReturnValue();
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v26;

    v5->_statementPeriodDays = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("statementPeriodDays"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountStatement)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDate *closingDate;
  uint64_t v14;
  NSDecimalNumber *openingBalance;
  uint64_t v16;
  NSDecimalNumber *closingBalance;
  uint64_t v18;
  NSDecimalNumber *interestEarned;
  uint64_t v20;
  NSDecimalNumber *totalDeposits;
  uint64_t v22;
  NSDecimalNumber *totalDailyCashDeposits;
  uint64_t v24;
  NSDecimalNumber *totalWithdrawn;
  uint64_t v26;
  NSDecimalNumber *apy;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKSavingsAccountStatement;
  v5 = -[PKSavingsAccountStatement init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    openingBalance = v5->_openingBalance;
    v5->_openingBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingBalance"));
    v16 = objc_claimAutoreleasedReturnValue();
    closingBalance = v5->_closingBalance;
    v5->_closingBalance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestEarned"));
    v18 = objc_claimAutoreleasedReturnValue();
    interestEarned = v5->_interestEarned;
    v5->_interestEarned = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDeposits"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalDeposits = v5->_totalDeposits;
    v5->_totalDeposits = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDailyCashDeposits"));
    v22 = objc_claimAutoreleasedReturnValue();
    totalDailyCashDeposits = v5->_totalDailyCashDeposits;
    v5->_totalDailyCashDeposits = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalWithdrawn"));
    v24 = objc_claimAutoreleasedReturnValue();
    totalWithdrawn = v5->_totalWithdrawn;
    v5->_totalWithdrawn = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apy"));
    v26 = objc_claimAutoreleasedReturnValue();
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v26;

    v5->_statementPeriodDays = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("statementPeriodDays"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openingBalance, CFSTR("openingBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingBalance, CFSTR("closingBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestEarned, CFSTR("interestEarned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalDeposits, CFSTR("totalDeposits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalDailyCashDeposits, CFSTR("totalDailyCashDeposits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalWithdrawn, CFSTR("totalWithdrawn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apy, CFSTR("apy"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_statementPeriodDays, CFSTR("statementPeriodDays"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSString *currencyCode;
  NSString *v8;
  NSDate *openingDate;
  NSDate *v10;
  NSDate *closingDate;
  NSDate *v12;
  NSDecimalNumber *openingBalance;
  NSDecimalNumber *v14;
  NSDecimalNumber *closingBalance;
  NSDecimalNumber *v16;
  NSDecimalNumber *interestEarned;
  NSDecimalNumber *v18;
  NSDecimalNumber *totalDeposits;
  NSDecimalNumber *v20;
  NSDecimalNumber *totalDailyCashDeposits;
  NSDecimalNumber *v22;
  NSDecimalNumber *totalWithdrawn;
  NSDecimalNumber *v24;
  NSDecimalNumber *apy;
  NSDecimalNumber *v26;
  BOOL v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_57;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (identifier != v6)
  {
    goto LABEL_57;
  }
  currencyCode = self->_currencyCode;
  v8 = (NSString *)v4[2];
  if (currencyCode && v8)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (currencyCode != v8)
  {
    goto LABEL_57;
  }
  openingDate = self->_openingDate;
  v10 = (NSDate *)v4[3];
  if (openingDate && v10)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (openingDate != v10)
  {
    goto LABEL_57;
  }
  closingDate = self->_closingDate;
  v12 = (NSDate *)v4[4];
  if (closingDate && v12)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (closingDate != v12)
  {
    goto LABEL_57;
  }
  openingBalance = self->_openingBalance;
  v14 = (NSDecimalNumber *)v4[5];
  if (openingBalance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](openingBalance, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (openingBalance != v14)
  {
    goto LABEL_57;
  }
  closingBalance = self->_closingBalance;
  v16 = (NSDecimalNumber *)v4[6];
  if (closingBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](closingBalance, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (closingBalance != v16)
  {
    goto LABEL_57;
  }
  interestEarned = self->_interestEarned;
  v18 = (NSDecimalNumber *)v4[7];
  if (interestEarned && v18)
  {
    if ((-[NSDecimalNumber isEqual:](interestEarned, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (interestEarned != v18)
  {
    goto LABEL_57;
  }
  totalDeposits = self->_totalDeposits;
  v20 = (NSDecimalNumber *)v4[8];
  if (totalDeposits && v20)
  {
    if ((-[NSDecimalNumber isEqual:](totalDeposits, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (totalDeposits != v20)
  {
    goto LABEL_57;
  }
  totalDailyCashDeposits = self->_totalDailyCashDeposits;
  v22 = (NSDecimalNumber *)v4[9];
  if (totalDailyCashDeposits && v22)
  {
    if ((-[NSDecimalNumber isEqual:](totalDailyCashDeposits, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (totalDailyCashDeposits != v22)
  {
    goto LABEL_57;
  }
  totalWithdrawn = self->_totalWithdrawn;
  v24 = (NSDecimalNumber *)v4[10];
  if (totalWithdrawn && v24)
  {
    if ((-[NSDecimalNumber isEqual:](totalWithdrawn, "isEqual:") & 1) == 0)
      goto LABEL_57;
  }
  else if (totalWithdrawn != v24)
  {
    goto LABEL_57;
  }
  apy = self->_apy;
  v26 = (NSDecimalNumber *)v4[11];
  if (!apy || !v26)
  {
    if (apy == v26)
      goto LABEL_55;
LABEL_57:
    v27 = 0;
    goto LABEL_58;
  }
  if ((-[NSDecimalNumber isEqual:](apy, "isEqual:") & 1) == 0)
    goto LABEL_57;
LABEL_55:
  v27 = self->_statementPeriodDays == v4[12];
LABEL_58:

  return v27;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_closingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_openingBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_closingBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_interestEarned);
  objc_msgSend(v3, "safelyAddObject:", self->_totalDeposits);
  objc_msgSend(v3, "safelyAddObject:", self->_totalDailyCashDeposits);
  objc_msgSend(v3, "safelyAddObject:", self->_totalWithdrawn);
  objc_msgSend(v3, "safelyAddObject:", self->_apy);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_statementPeriodDays - v4 + 32 * v4;

  return v5;
}

- (id)description
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
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSDate description](self->_openingDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), v4);

  -[NSDate description](self->_closingDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), v5);

  -[NSDecimalNumber stringValue](self->_openingBalance, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openingBalance: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_closingBalance, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("closingBalance: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_interestEarned, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestEarned: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_totalDeposits, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalDeposits: '%@'; "), v9);

  -[NSDecimalNumber stringValue](self->_totalDailyCashDeposits, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalDailyCashDeposits: '%@'; "), v10);

  -[NSDecimalNumber stringValue](self->_totalWithdrawn, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalWithdrawn: '%@'; "), v11);

  -[NSDecimalNumber stringValue](self->_apy, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("apy: '%@'; "), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR("statementPeriodDays: '%li'; "), self->_statementPeriodDays);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSavingsAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *currencyCode;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDecimalNumber *openingBalance;
  uint64_t v14;
  NSDecimalNumber *closingBalance;
  uint64_t v16;
  NSDecimalNumber *interestEarned;
  uint64_t v18;
  NSDecimalNumber *totalDeposits;
  uint64_t v20;
  NSDecimalNumber *totalDailyCashDeposits;
  uint64_t v22;
  NSDecimalNumber *totalWithdrawn;
  uint64_t v24;
  NSDecimalNumber *apy;

  v5 = -[PKSavingsAccountStatement init](+[PKSavingsAccountStatement allocWithZone:](PKSavingsAccountStatement, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  v10 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  openingDate = v5->_openingDate;
  v5->_openingDate = (NSDate *)v10;

  v12 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  openingBalance = v5->_openingBalance;
  v5->_openingBalance = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_closingBalance, "copyWithZone:", a3);
  closingBalance = v5->_closingBalance;
  v5->_closingBalance = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_interestEarned, "copyWithZone:", a3);
  interestEarned = v5->_interestEarned;
  v5->_interestEarned = (NSDecimalNumber *)v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_totalDeposits, "copyWithZone:", a3);
  totalDeposits = v5->_totalDeposits;
  v5->_totalDeposits = (NSDecimalNumber *)v18;

  v20 = -[NSDecimalNumber copyWithZone:](self->_totalDailyCashDeposits, "copyWithZone:", a3);
  totalDailyCashDeposits = v5->_totalDailyCashDeposits;
  v5->_totalDailyCashDeposits = (NSDecimalNumber *)v20;

  v22 = -[NSDecimalNumber copyWithZone:](self->_totalWithdrawn, "copyWithZone:", a3);
  totalWithdrawn = v5->_totalWithdrawn;
  v5->_totalWithdrawn = (NSDecimalNumber *)v22;

  v24 = -[NSDecimalNumber copyWithZone:](self->_apy, "copyWithZone:", a3);
  apy = v5->_apy;
  v5->_apy = (NSDecimalNumber *)v24;

  v5->_statementPeriodDays = self->_statementPeriodDays;
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
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

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDecimalNumber)openingBalance
{
  return self->_openingBalance;
}

- (void)setOpeningBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)closingBalance
{
  return self->_closingBalance;
}

- (void)setClosingBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)interestEarned
{
  return self->_interestEarned;
}

- (void)setInterestEarned:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)totalDeposits
{
  return self->_totalDeposits;
}

- (void)setTotalDeposits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)totalDailyCashDeposits
{
  return self->_totalDailyCashDeposits;
}

- (void)setTotalDailyCashDeposits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)totalWithdrawn
{
  return self->_totalWithdrawn;
}

- (void)setTotalWithdrawn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)apy
{
  return self->_apy;
}

- (void)setAPY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)statementPeriodDays
{
  return self->_statementPeriodDays;
}

- (void)setStatementPeriodDays:(int64_t)a3
{
  self->_statementPeriodDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apy, 0);
  objc_storeStrong((id *)&self->_totalWithdrawn, 0);
  objc_storeStrong((id *)&self->_totalDailyCashDeposits, 0);
  objc_storeStrong((id *)&self->_totalDeposits, 0);
  objc_storeStrong((id *)&self->_interestEarned, 0);
  objc_storeStrong((id *)&self->_closingBalance, 0);
  objc_storeStrong((id *)&self->_openingBalance, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
