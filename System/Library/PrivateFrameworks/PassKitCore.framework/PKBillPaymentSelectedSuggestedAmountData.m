@implementation PKBillPaymentSelectedSuggestedAmountData

- (PKBillPaymentSelectedSuggestedAmountData)initWithStatementIdentifier:(id)a3 transactionDate:(id)a4 transactionAmount:(id)a5 suggestedAmountCategory:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PKBillPaymentSelectedSuggestedAmountData *v14;
  PKBillPaymentSelectedSuggestedAmountData *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  v14 = -[PKBillPaymentSelectedSuggestedAmountData init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_statementIdentifier, a3);
    objc_storeStrong((id *)&v15->_transactionDate, a4);
    objc_storeStrong((id *)&v15->_transactionAmount, a5);
    v15->_suggestedAmountCategory = a6;
  }

  return v15;
}

- (PKBillPaymentSelectedSuggestedAmountData)initWithRecord:(id)a3
{
  id v4;
  PKBillPaymentSelectedSuggestedAmountData *v5;
  uint64_t v6;
  NSString *statementIdentifier;
  uint64_t v8;
  NSDate *transactionDate;
  uint64_t v10;
  NSDecimalNumber *transactionAmount;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  v5 = -[PKBillPaymentSelectedSuggestedAmountData init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("statementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("transactionDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v8;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("transactionAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("suggestedAmountCategory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suggestedAmountCategory = PKBillPaymentSuggestedAmountCategoryFromString(v12);

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "encryptedValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", self->_statementIdentifier, CFSTR("statementIdentifier"));
  objc_msgSend(v5, "setObject:forKey:", self->_transactionAmount, CFSTR("transactionAmount"));
  PKBillPaymentSuggestedAmountCategoryToString(self->_suggestedAmountCategory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("suggestedAmountCategory"));

  objc_msgSend(v5, "setObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
}

+ (id)recordType
{
  return CFSTR("BillPaymentSelectedSuggestedAmount");
}

+ (id)recordNamePrefix
{
  return CFSTR("billPaymentSelectedSuggestedAmountData-");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBillPaymentSelectedSuggestedAmountData)initWithCoder:(id)a3
{
  id v4;
  PKBillPaymentSelectedSuggestedAmountData *v5;
  uint64_t v6;
  NSString *statementIdentifier;
  uint64_t v8;
  NSDate *transactionDate;
  uint64_t v10;
  NSDecimalNumber *transactionAmount;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  v5 = -[PKBillPaymentSelectedSuggestedAmountData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transactionAmount"));
    v10 = objc_claimAutoreleasedReturnValue();
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    v5->_suggestedAmountCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestedAmountCategory"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *statementIdentifier;
  id v5;

  statementIdentifier = self->_statementIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", statementIdentifier, CFSTR("statementIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionDate, CFSTR("transactionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transactionAmount, CFSTR("transactionAmount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestedAmountCategory, CFSTR("suggestedAmountCategory"));

}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionAmount);
  objc_msgSend(v3, "safelyAddObject:", self->_transactionDate);
  objc_msgSend(v3, "safelyAddObject:", self->_statementIdentifier);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_suggestedAmountCategory - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *statementIdentifier;
  NSString *v6;
  NSDate *transactionDate;
  NSDate *v8;
  NSDecimalNumber *transactionAmount;
  NSDecimalNumber *v10;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  statementIdentifier = self->_statementIdentifier;
  v6 = (NSString *)v4[1];
  if (statementIdentifier && v6)
  {
    if ((-[NSString isEqual:](statementIdentifier, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (statementIdentifier != v6)
  {
    goto LABEL_17;
  }
  transactionDate = self->_transactionDate;
  v8 = (NSDate *)v4[2];
  if (transactionDate && v8)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (transactionDate != v8)
  {
    goto LABEL_17;
  }
  transactionAmount = self->_transactionAmount;
  v10 = (NSDecimalNumber *)v4[4];
  if (!transactionAmount || !v10)
  {
    if (transactionAmount == v10)
      goto LABEL_15;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  if ((-[NSDecimalNumber isEqual:](transactionAmount, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_15:
  v11 = self->_suggestedAmountCategory == v4[3];
LABEL_18:

  return v11;
}

- (NSString)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("statementIdentifier: '%@'; "), self->_statementIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionDate: '%@'; "), self->_transactionDate);
  if (self->_transactionAmount)
    v4 = CFSTR("<redacted>");
  else
    v4 = 0;
  objc_msgSend(v3, "appendFormat:", CFSTR("transactionAmount: '%@'; "), v4);
  PKBillPaymentSuggestedAmountCategoryToString(self->_suggestedAmountCategory);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("suggestedAmountCategory: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)suggestedAmountCategory
{
  return self->_suggestedAmountCategory;
}

- (void)setSuggestedAmountCategory:(unint64_t)a3
{
  self->_suggestedAmountCategory = a3;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end
