@implementation PKCreditAccountMergeSummaryAccountDetails

- (PKCreditAccountMergeSummaryAccountDetails)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountMergeSummaryAccountDetails *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *ownerAltDSID;
  uint64_t v10;
  NSDecimalNumber *statementBalance;
  uint64_t v12;
  NSDecimalNumber *currentBalance;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditAccountMergeSummaryAccountDetails;
  v5 = -[PKCreditAccountMergeSummaryAccountDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("ownerAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerAltDSID = v5->_ownerAltDSID;
    v5->_ownerAltDSID = (NSString *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("statementBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("currentBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditAccountMergeSummaryAccountDetails *v4;
  PKCreditAccountMergeSummaryAccountDetails *v5;
  BOOL v6;

  v4 = (PKCreditAccountMergeSummaryAccountDetails *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditAccountMergeSummaryAccountDetails isEqualToCreditAccountMergeSummaryAccountDetails:](self, "isEqualToCreditAccountMergeSummaryAccountDetails:", v5);

  return v6;
}

- (BOOL)isEqualToCreditAccountMergeSummaryAccountDetails:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  void *v11;
  NSString *v12;
  _BOOL4 v13;
  char v14;
  NSDecimalNumber *statementBalance;
  NSDecimalNumber *v17;
  NSDecimalNumber *currentBalance;
  NSDecimalNumber *v19;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_14;
  v6 = (void *)v4[1];
  v7 = self->_accountIdentifier;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
      goto LABEL_13;
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_14;
  }
  v11 = (void *)v5[2];
  v7 = self->_ownerAltDSID;
  v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_17;
  }
  v9 = v12;
  if (!v7 || !v12)
  {
LABEL_13:

    goto LABEL_14;
  }
  v13 = -[NSString isEqualToString:](v7, "isEqualToString:", v12);

  if (!v13)
    goto LABEL_14;
LABEL_17:
  statementBalance = self->_statementBalance;
  v17 = (NSDecimalNumber *)v5[3];
  if (statementBalance && v17)
  {
    if ((-[NSDecimalNumber isEqual:](statementBalance, "isEqual:") & 1) != 0)
      goto LABEL_22;
LABEL_14:
    v14 = 0;
    goto LABEL_15;
  }
  if (statementBalance != v17)
    goto LABEL_14;
LABEL_22:
  currentBalance = self->_currentBalance;
  v19 = (NSDecimalNumber *)v5[4];
  if (currentBalance && v19)
    v14 = -[NSDecimalNumber isEqual:](currentBalance, "isEqual:");
  else
    v14 = currentBalance == v19;
LABEL_15:

  return v14;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_ownerAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_statementBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_currentBalance);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("accountIdentifier: '%@'; "), self->_accountIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("ownerAltDSID: '%@'; "), self->_ownerAltDSID);
  -[NSDecimalNumber stringValue](self->_statementBalance, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("statementBalance: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_currentBalance, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentBalance: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountMergeSummaryAccountDetails)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountMergeSummaryAccountDetails *v5;
  uint64_t v6;
  NSString *accountIdentifier;
  uint64_t v8;
  NSString *ownerAltDSID;
  uint64_t v10;
  NSDecimalNumber *statementBalance;
  uint64_t v12;
  NSDecimalNumber *currentBalance;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCreditAccountMergeSummaryAccountDetails;
  v5 = -[PKCreditAccountMergeSummaryAccountDetails init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerAltDSID"));
    v8 = objc_claimAutoreleasedReturnValue();
    ownerAltDSID = v5->_ownerAltDSID;
    v5->_ownerAltDSID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementBalance"));
    v10 = objc_claimAutoreleasedReturnValue();
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentBalance"));
    v12 = objc_claimAutoreleasedReturnValue();
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountIdentifier;
  id v5;

  accountIdentifier = self->_accountIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerAltDSID, CFSTR("ownerAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementBalance, CFSTR("statementBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentBalance, CFSTR("currentBalance"));

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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_ownerAltDSID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_statementBalance, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_currentBalance, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)ownerAltDSID
{
  return self->_ownerAltDSID;
}

- (void)setOwnerAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
  objc_storeStrong((id *)&self->_statementBalance, a3);
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
  objc_storeStrong((id *)&self->_currentBalance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_ownerAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
