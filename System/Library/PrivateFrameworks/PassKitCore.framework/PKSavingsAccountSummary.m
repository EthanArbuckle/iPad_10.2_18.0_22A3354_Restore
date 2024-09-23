@implementation PKSavingsAccountSummary

- (PKSavingsAccountSummary)init
{
  PKSavingsAccountSummary *v2;
  NSNumberFormatter *v3;
  NSNumberFormatter *apyFormatter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKSavingsAccountSummary;
  v2 = -[PKSavingsAccountSummary init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    apyFormatter = v2->_apyFormatter;
    v2->_apyFormatter = v3;

    -[NSNumberFormatter setNumberStyle:](v2->_apyFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMultiplier:](v2->_apyFormatter, "setMultiplier:", &unk_1E2C3EA58);
    -[NSNumberFormatter setMinimumFractionDigits:](v2->_apyFormatter, "setMinimumFractionDigits:", 2);
    -[NSNumberFormatter setMaximumFractionDigits:](v2->_apyFormatter, "setMaximumFractionDigits:", 2);
  }
  return v2;
}

- (PKSavingsAccountSummary)initWithDictionary:(id)a3
{
  id v4;
  PKSavingsAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;
  uint64_t v8;
  NSDecimalNumber *availableBalance;
  uint64_t v10;
  NSDecimalNumber *pendingBalance;
  uint64_t v12;
  NSDecimalNumber *interestYTD;
  uint64_t v14;
  NSDecimalNumber *interestTotal;
  uint64_t v16;
  NSDecimalNumber *apy;

  v4 = a3;
  v5 = -[PKSavingsAccountSummary init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("availableBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableBalance = v5->_availableBalance;
    v5->_availableBalance = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("pendingBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    pendingBalance = v5->_pendingBalance;
    v5->_pendingBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestYTD"));
    v12 = objc_claimAutoreleasedReturnValue();
    interestYTD = v5->_interestYTD;
    v5->_interestYTD = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestTotal"));
    v14 = objc_claimAutoreleasedReturnValue();
    interestTotal = v5->_interestTotal;
    v5->_interestTotal = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("apy"));
    v16 = objc_claimAutoreleasedReturnValue();
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v16;

    v5->_hasWithdrawalLimit = objc_msgSend(v4, "PKBoolForKey:", CFSTR("hasWithdrawalLimit"));
    v5->_withdrawalsRemaining = objc_msgSend(v4, "PKIntegerForKey:", CFSTR("withdrawalsRemaining"));
  }

  return v5;
}

- (NSString)formattedAPY
{
  void *v3;
  void *v4;

  if (self->_apy)
  {
    -[PKSavingsAccountSummary apyFormatter](self, "apyFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringFromNumber:", self->_apy);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountSummary)initWithCoder:(id)a3
{
  id v4;
  PKSavingsAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;
  uint64_t v8;
  NSDecimalNumber *availableBalance;
  uint64_t v10;
  NSDecimalNumber *pendingBalance;
  uint64_t v12;
  NSDecimalNumber *interestYTD;
  uint64_t v14;
  NSDecimalNumber *interestTotal;
  uint64_t v16;
  NSDecimalNumber *apy;

  v4 = a3;
  v5 = -[PKSavingsAccountSummary init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("availableBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    availableBalance = v5->_availableBalance;
    v5->_availableBalance = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    pendingBalance = v5->_pendingBalance;
    v5->_pendingBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestYTD"));
    v12 = objc_claimAutoreleasedReturnValue();
    interestYTD = v5->_interestYTD;
    v5->_interestYTD = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestTotal"));
    v14 = objc_claimAutoreleasedReturnValue();
    interestTotal = v5->_interestTotal;
    v5->_interestTotal = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apy"));
    v16 = objc_claimAutoreleasedReturnValue();
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v16;

    v5->_hasWithdrawalLimit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasWithdrawalLimit"));
    v5->_withdrawalsRemaining = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("withdrawalsRemaining"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDecimalNumber *currentBalance;
  id v5;

  currentBalance = self->_currentBalance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", currentBalance, CFSTR("currentBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_availableBalance, CFSTR("availableBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingBalance, CFSTR("pendingBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestYTD, CFSTR("interestYTD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestTotal, CFSTR("interestTotal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apy, CFSTR("apy"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasWithdrawalLimit, CFSTR("hasWithdrawalLimit"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_withdrawalsRemaining, CFSTR("withdrawalsRemaining"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v6;
  NSDecimalNumber *availableBalance;
  NSDecimalNumber *v8;
  NSDecimalNumber *pendingBalance;
  NSDecimalNumber *v10;
  NSDecimalNumber *interestYTD;
  NSDecimalNumber *v12;
  NSDecimalNumber *interestTotal;
  NSDecimalNumber *v14;
  NSDecimalNumber *apy;
  NSDecimalNumber *v16;
  BOOL v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_34;
  currentBalance = self->_currentBalance;
  v6 = (NSDecimalNumber *)v4[3];
  if (currentBalance && v6)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (currentBalance != v6)
  {
    goto LABEL_34;
  }
  availableBalance = self->_availableBalance;
  v8 = (NSDecimalNumber *)v4[4];
  if (availableBalance && v8)
  {
    if ((-[NSDecimalNumber isEqual:](availableBalance, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (availableBalance != v8)
  {
    goto LABEL_34;
  }
  pendingBalance = self->_pendingBalance;
  v10 = (NSDecimalNumber *)v4[5];
  if (pendingBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](pendingBalance, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (pendingBalance != v10)
  {
    goto LABEL_34;
  }
  interestYTD = self->_interestYTD;
  v12 = (NSDecimalNumber *)v4[6];
  if (interestYTD && v12)
  {
    if ((-[NSDecimalNumber isEqual:](interestYTD, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (interestYTD != v12)
  {
    goto LABEL_34;
  }
  interestTotal = self->_interestTotal;
  v14 = (NSDecimalNumber *)v4[7];
  if (interestTotal && v14)
  {
    if ((-[NSDecimalNumber isEqual:](interestTotal, "isEqual:") & 1) == 0)
      goto LABEL_34;
  }
  else if (interestTotal != v14)
  {
    goto LABEL_34;
  }
  apy = self->_apy;
  v16 = (NSDecimalNumber *)v4[8];
  if (!apy || !v16)
  {
    if (apy == v16)
      goto LABEL_32;
LABEL_34:
    v17 = 0;
    goto LABEL_35;
  }
  if ((-[NSDecimalNumber isEqual:](apy, "isEqual:") & 1) == 0)
    goto LABEL_34;
LABEL_32:
  if (self->_hasWithdrawalLimit != *((unsigned __int8 *)v4 + 16))
    goto LABEL_34;
  v17 = self->_withdrawalsRemaining == v4[9];
LABEL_35:

  return v17;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_availableBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_pendingBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_interestYTD);
  objc_msgSend(v3, "safelyAddObject:", self->_interestTotal);
  objc_msgSend(v3, "safelyAddObject:", self->_apy);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_hasWithdrawalLimit - v4 + 32 * v4;
  v6 = self->_withdrawalsRemaining - v5 + 32 * v5;

  return v6;
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
  const __CFString *v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDecimalNumber stringValue](self->_currentBalance, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_availableBalance, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availableBalance: '%@'; "), v5);

  -[NSDecimalNumber stringValue](self->_pendingBalance, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pendingBalance: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_interestYTD, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestYTD: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_interestTotal, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestTotal: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_apy, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("apy: '%@'; "), v9);

  if (self->_hasWithdrawalLimit)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasWithdrawalLimit: '%@'; "), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("_withdrawalsRemaining: '%ld'; "), self->_withdrawalsRemaining);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKSavingsAccountSummary *v5;
  uint64_t v6;
  NSDecimalNumber *currentBalance;
  uint64_t v8;
  NSDecimalNumber *availableBalance;
  uint64_t v10;
  NSDecimalNumber *pendingBalance;
  uint64_t v12;
  NSDecimalNumber *interestYTD;
  uint64_t v14;
  NSDecimalNumber *interestTotal;
  uint64_t v16;
  NSDecimalNumber *apy;

  v5 = -[PKSavingsAccountSummary init](+[PKSavingsAccountSummary allocWithZone:](PKSavingsAccountSummary, "allocWithZone:"), "init");
  v6 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_availableBalance, "copyWithZone:", a3);
  availableBalance = v5->_availableBalance;
  v5->_availableBalance = (NSDecimalNumber *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_pendingBalance, "copyWithZone:", a3);
  pendingBalance = v5->_pendingBalance;
  v5->_pendingBalance = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_interestYTD, "copyWithZone:", a3);
  interestYTD = v5->_interestYTD;
  v5->_interestYTD = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_interestTotal, "copyWithZone:", a3);
  interestTotal = v5->_interestTotal;
  v5->_interestTotal = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_apy, "copyWithZone:", a3);
  apy = v5->_apy;
  v5->_apy = (NSDecimalNumber *)v16;

  v5->_hasWithdrawalLimit = self->_hasWithdrawalLimit;
  v5->_withdrawalsRemaining = self->_withdrawalsRemaining;
  return v5;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)availableBalance
{
  return self->_availableBalance;
}

- (void)setAvailableBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDecimalNumber)pendingBalance
{
  return self->_pendingBalance;
}

- (void)setPendingBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)interestYTD
{
  return self->_interestYTD;
}

- (void)setInterestYTD:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)interestTotal
{
  return self->_interestTotal;
}

- (void)setInterestTotal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)apy
{
  return self->_apy;
}

- (void)setAPY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)hasWithdrawalLimit
{
  return self->_hasWithdrawalLimit;
}

- (void)setHasWithdrawalLimit:(BOOL)a3
{
  self->_hasWithdrawalLimit = a3;
}

- (unint64_t)withdrawalsRemaining
{
  return self->_withdrawalsRemaining;
}

- (void)setWithdrawalsRemaining:(unint64_t)a3
{
  self->_withdrawalsRemaining = a3;
}

- (NSNumberFormatter)apyFormatter
{
  return self->_apyFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apy, 0);
  objc_storeStrong((id *)&self->_interestTotal, 0);
  objc_storeStrong((id *)&self->_interestYTD, 0);
  objc_storeStrong((id *)&self->_pendingBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_apyFormatter, 0);
}

@end
