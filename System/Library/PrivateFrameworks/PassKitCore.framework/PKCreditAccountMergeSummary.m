@implementation PKCreditAccountMergeSummary

- (PKCreditAccountMergeSummary)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountMergeSummary *v5;
  uint64_t v6;
  NSDate *mergeDate;
  uint64_t v8;
  NSDecimalNumber *totalBalance;
  void *v10;
  uint64_t v11;
  NSSet *accountDetails;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKCreditAccountMergeSummary;
  v5 = -[PKCreditAccountMergeSummary init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("mergeDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("accountDetails"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pk_setByApplyingBlock:", &__block_literal_global_59);
    v11 = objc_claimAutoreleasedReturnValue();
    accountDetails = v5->_accountDetails;
    v5->_accountDetails = (NSSet *)v11;

  }
  return v5;
}

PKCreditAccountMergeSummaryAccountDetails *__50__PKCreditAccountMergeSummary_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKCreditAccountMergeSummaryAccountDetails *v3;

  v2 = a2;
  v3 = -[PKCreditAccountMergeSummaryAccountDetails initWithDictionary:]([PKCreditAccountMergeSummaryAccountDetails alloc], "initWithDictionary:", v2);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditAccountMergeSummary *v4;
  PKCreditAccountMergeSummary *v5;
  BOOL v6;

  v4 = (PKCreditAccountMergeSummary *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditAccountMergeSummary isEqualToCreditAccountMergeSummary:](self, "isEqualToCreditAccountMergeSummary:", v5);

  return v6;
}

- (BOOL)isEqualToCreditAccountMergeSummary:(id)a3
{
  _QWORD *v4;
  NSDate *mergeDate;
  NSDate *v6;
  BOOL v7;
  NSDecimalNumber *totalBalance;
  NSDecimalNumber *v9;
  NSSet *accountDetails;
  NSSet *v11;
  char v12;

  v4 = a3;
  if (!v4)
    goto LABEL_17;
  mergeDate = self->_mergeDate;
  v6 = (NSDate *)v4[1];
  if (mergeDate)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (mergeDate != v6)
      goto LABEL_17;
  }
  else if ((-[NSDate isEqual:](mergeDate, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  totalBalance = self->_totalBalance;
  v9 = (NSDecimalNumber *)v4[2];
  if (!totalBalance || !v9)
  {
    if (totalBalance == v9)
      goto LABEL_13;
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSDecimalNumber isEqual:](totalBalance, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  accountDetails = self->_accountDetails;
  v11 = (NSSet *)v4[3];
  if (accountDetails && v11)
    v12 = -[NSSet isEqual:](accountDetails, "isEqual:");
  else
    v12 = accountDetails == v11;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_mergeDate);
  objc_msgSend(v3, "safelyAddObject:", self->_totalBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_accountDetails);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("mergeDate: '%@'; "), self->_mergeDate);
  -[NSDecimalNumber stringValue](self->_totalBalance, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalBalance: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("accountDetails: '%@'; "), self->_accountDetails);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountMergeSummary)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountMergeSummary *v5;
  uint64_t v6;
  NSDate *mergeDate;
  uint64_t v8;
  NSDecimalNumber *totalBalance;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *accountDetails;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCreditAccountMergeSummary;
  v5 = -[PKCreditAccountMergeSummary init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mergeDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    mergeDate = v5->_mergeDate;
    v5->_mergeDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBalance"));
    v8 = objc_claimAutoreleasedReturnValue();
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("accountDetails"));
    v13 = objc_claimAutoreleasedReturnValue();
    accountDetails = v5->_accountDetails;
    v5->_accountDetails = (NSSet *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *mergeDate;
  id v5;

  mergeDate = self->_mergeDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mergeDate, CFSTR("mergeDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalBalance, CFSTR("totalBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountDetails, CFSTR("accountDetails"));

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSDate copyWithZone:](self->_mergeDate, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_totalBalance, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSSet copyWithZone:](self->_accountDetails, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)accountDetailsForAccountIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSSet *accountDetails;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accountDetails = self->_accountDetails;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PKCreditAccountMergeSummary_accountDetailsForAccountIdentifier___block_invoke;
    v9[3] = &unk_1E2AC8A58;
    v10 = v4;
    -[NSSet pk_anyObjectPassingTest:](accountDetails, "pk_anyObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __66__PKCreditAccountMergeSummary_accountDetailsForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "accountIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (id)accountDetailsForAltDSID:(id)a3
{
  id v4;
  void *v5;
  NSSet *accountDetails;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    accountDetails = self->_accountDetails;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PKCreditAccountMergeSummary_accountDetailsForAltDSID___block_invoke;
    v9[3] = &unk_1E2AC8A58;
    v10 = v4;
    -[NSSet pk_anyObjectPassingTest:](accountDetails, "pk_anyObjectPassingTest:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __56__PKCreditAccountMergeSummary_accountDetailsForAltDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "ownerAltDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (NSDate)mergeDate
{
  return self->_mergeDate;
}

- (void)setMergeDate:(id)a3
{
  objc_storeStrong((id *)&self->_mergeDate, a3);
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (void)setTotalBalance:(id)a3
{
  objc_storeStrong((id *)&self->_totalBalance, a3);
}

- (NSSet)accountDetails
{
  return self->_accountDetails;
}

- (void)setAccountDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountDetails, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_mergeDate, 0);
}

@end
