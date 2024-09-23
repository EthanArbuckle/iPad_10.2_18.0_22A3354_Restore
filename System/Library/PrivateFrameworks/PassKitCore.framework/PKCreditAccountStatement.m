@implementation PKCreditAccountStatement

- (PKCreditAccountStatement)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openingDate;
  uint64_t v10;
  NSDate *closingDate;
  uint64_t v12;
  NSDate *paymentDueDate;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSDecimalNumber *statementBalance;
  uint64_t v18;
  NSDecimalNumber *totalBalance;
  uint64_t v20;
  NSDecimalNumber *minimumDue;
  uint64_t v22;
  NSDecimalNumber *purchases;
  uint64_t v24;
  NSDecimalNumber *feesCharged;
  uint64_t v26;
  NSDecimalNumber *interestCharged;
  uint64_t v28;
  NSDecimalNumber *balanceTransfers;
  uint64_t v30;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v32;
  NSDecimalNumber *payments;
  uint64_t v34;
  NSDecimalNumber *credits;
  uint64_t v36;
  NSDecimalNumber *rewardsBalance;
  uint64_t v38;
  NSDecimalNumber *rewardsEarned;
  uint64_t v40;
  NSDecimalNumber *rewardsRedeemed;
  uint64_t v42;
  NSDecimalNumber *rewardsYTD;
  uint64_t v44;
  NSDecimalNumber *rewardsLifetime;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKCreditAccountStatement;
  v5 = -[PKCreditAccountStatement init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("openingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("closingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("paymentDueDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v12;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("statementBalance"));
    v16 = objc_claimAutoreleasedReturnValue();
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("totalBalance"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("minimumDue"));
    v20 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("purchases"));
    v22 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("feesCharged"));
    v24 = objc_claimAutoreleasedReturnValue();
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestCharged"));
    v26 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v26;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("balanceTransfers"));
    v28 = objc_claimAutoreleasedReturnValue();
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v28;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("paymentsAndCredits"));
    v30 = objc_claimAutoreleasedReturnValue();
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v30;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("payments"));
    v32 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v32;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("credits"));
    v34 = objc_claimAutoreleasedReturnValue();
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v34;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsBalance"));
    v36 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v36;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsEarned"));
    v38 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v38;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsRedeemed"));
    v40 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v40;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsYTD"));
    v42 = objc_claimAutoreleasedReturnValue();
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v42;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsLifetime"));
    v44 = objc_claimAutoreleasedReturnValue();
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v44;

  }
  return v5;
}

- (unint64_t)monthNumber
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;

  -[NSDate timeIntervalSinceDate:](self->_closingDate, "timeIntervalSinceDate:", self->_openingDate);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", self->_openingDate, v3 * 0.5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "month");

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountStatement)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDate *closingDate;
  uint64_t v14;
  NSDate *paymentDueDate;
  uint64_t v16;
  NSString *currencyCode;
  uint64_t v18;
  NSDecimalNumber *statementBalance;
  uint64_t v20;
  NSDecimalNumber *totalBalance;
  uint64_t v22;
  NSDecimalNumber *minimumDue;
  uint64_t v24;
  NSDecimalNumber *purchases;
  uint64_t v26;
  NSDecimalNumber *feesCharged;
  uint64_t v28;
  NSDecimalNumber *interestCharged;
  uint64_t v30;
  NSDecimalNumber *balanceTransfers;
  uint64_t v32;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v34;
  NSDecimalNumber *payments;
  uint64_t v36;
  NSDecimalNumber *credits;
  uint64_t v38;
  NSDecimalNumber *rewardsBalance;
  uint64_t v40;
  NSDecimalNumber *rewardsEarned;
  uint64_t v42;
  NSDecimalNumber *rewardsRedeemed;
  uint64_t v44;
  NSDecimalNumber *rewardsYTD;
  uint64_t v46;
  NSDecimalNumber *rewardsLifetime;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PKCreditAccountStatement;
  v5 = -[PKCreditAccountStatement init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentDueDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v16 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statementBalance"));
    v18 = objc_claimAutoreleasedReturnValue();
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBalance"));
    v20 = objc_claimAutoreleasedReturnValue();
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minimumDue"));
    v22 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchases"));
    v24 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feesCharged"));
    v26 = objc_claimAutoreleasedReturnValue();
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestCharged"));
    v28 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceTransfers"));
    v30 = objc_claimAutoreleasedReturnValue();
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentsAndCredits"));
    v32 = objc_claimAutoreleasedReturnValue();
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payments"));
    v34 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credits"));
    v36 = objc_claimAutoreleasedReturnValue();
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsBalance"));
    v38 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsEarned"));
    v40 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v40;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsRedeemed"));
    v42 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v42;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsYTD"));
    v44 = objc_claimAutoreleasedReturnValue();
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v44;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsLifetime"));
    v46 = objc_claimAutoreleasedReturnValue();
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v46;

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
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountIdentifier, CFSTR("accountIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentDueDate, CFSTR("paymentDueDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statementBalance, CFSTR("statementBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_totalBalance, CFSTR("totalBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_minimumDue, CFSTR("minimumDue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchases, CFSTR("purchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feesCharged, CFSTR("feesCharged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestCharged, CFSTR("interestCharged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceTransfers, CFSTR("balanceTransfers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentsAndCredits, CFSTR("paymentsAndCredits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credits, CFSTR("credits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsBalance, CFSTR("rewardsBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsEarned, CFSTR("rewardsEarned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsRedeemed, CFSTR("rewardsRedeemed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsYTD, CFSTR("rewardsYTD"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsLifetime, CFSTR("rewardsLifetime"));

}

- (PKCreditAccountStatement)initWithRecord:(id)a3
{
  id v4;
  PKCreditAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *openingDate;
  uint64_t v10;
  NSDate *closingDate;
  uint64_t v12;
  NSDate *paymentDueDate;
  uint64_t v14;
  NSString *currencyCode;
  uint64_t v16;
  NSDecimalNumber *statementBalance;
  uint64_t v18;
  NSDecimalNumber *totalBalance;
  uint64_t v20;
  NSDecimalNumber *minimumDue;
  uint64_t v22;
  NSDecimalNumber *rewardsBalance;
  uint64_t v24;
  NSDecimalNumber *rewardsEarned;
  uint64_t v26;
  NSDecimalNumber *rewardsRedeemed;
  uint64_t v28;
  NSDecimalNumber *rewardsYTD;
  uint64_t v30;
  NSDecimalNumber *rewardsLifetime;
  uint64_t v32;
  NSDecimalNumber *purchases;
  uint64_t v34;
  NSDecimalNumber *feesCharged;
  uint64_t v36;
  NSDecimalNumber *interestCharged;
  uint64_t v38;
  NSDecimalNumber *balanceTransfers;
  uint64_t v40;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v42;
  NSDecimalNumber *payments;
  uint64_t v44;
  NSDecimalNumber *credits;
  objc_super v47;

  v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PKCreditAccountStatement;
  v5 = -[PKCreditAccountStatement init](&v47, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("openingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v8;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("closingDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v10;

    objc_msgSend(v4, "pk_encryptedDateForKey:", CFSTR("paymentDueDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    paymentDueDate = v5->_paymentDueDate;
    v5->_paymentDueDate = (NSDate *)v12;

    objc_msgSend(v4, "pk_encryptedStringForKey:", CFSTR("currencyCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v14;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("statementBalance"));
    v16 = objc_claimAutoreleasedReturnValue();
    statementBalance = v5->_statementBalance;
    v5->_statementBalance = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("totalBalance"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalBalance = v5->_totalBalance;
    v5->_totalBalance = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("minimumDue"));
    v20 = objc_claimAutoreleasedReturnValue();
    minimumDue = v5->_minimumDue;
    v5->_minimumDue = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsBalance"));
    v22 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsEarned"));
    v24 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsRedeemed"));
    v26 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v26;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsYTD"));
    v28 = objc_claimAutoreleasedReturnValue();
    rewardsYTD = v5->_rewardsYTD;
    v5->_rewardsYTD = (NSDecimalNumber *)v28;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("rewardsLifetime"));
    v30 = objc_claimAutoreleasedReturnValue();
    rewardsLifetime = v5->_rewardsLifetime;
    v5->_rewardsLifetime = (NSDecimalNumber *)v30;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("purchases"));
    v32 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v32;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("feesCharged"));
    v34 = objc_claimAutoreleasedReturnValue();
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v34;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("interestCharged"));
    v36 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v36;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("balanceTransfers"));
    v38 = objc_claimAutoreleasedReturnValue();
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v38;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("paymentsAndCredits"));
    v40 = objc_claimAutoreleasedReturnValue();
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v40;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("payments"));
    v42 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v42;

    objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", CFSTR("credits"));
    v44 = objc_claimAutoreleasedReturnValue();
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v44;

  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "encryptedValues");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v19, "setObject:forKey:", self->_openingDate, CFSTR("openingDate"));
  objc_msgSend(v19, "setObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v19, "setObject:forKey:", self->_paymentDueDate, CFSTR("paymentDueDate"));
  objc_msgSend(v19, "setObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  -[NSDecimalNumber stringValue](self->_statementBalance, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v4, CFSTR("statementBalance"));

  -[NSDecimalNumber stringValue](self->_totalBalance, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v5, CFSTR("totalBalance"));

  -[NSDecimalNumber stringValue](self->_minimumDue, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v6, CFSTR("minimumDue"));

  -[NSDecimalNumber stringValue](self->_rewardsBalance, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v7, CFSTR("rewardsBalance"));

  -[NSDecimalNumber stringValue](self->_rewardsEarned, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v8, CFSTR("rewardsEarned"));

  -[NSDecimalNumber stringValue](self->_rewardsRedeemed, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v9, CFSTR("rewardsRedeemed"));

  -[NSDecimalNumber stringValue](self->_rewardsYTD, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v10, CFSTR("rewardsYTD"));

  -[NSDecimalNumber stringValue](self->_rewardsLifetime, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v11, CFSTR("rewardsLifetime"));

  -[NSDecimalNumber stringValue](self->_purchases, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v12, CFSTR("purchases"));

  -[NSDecimalNumber stringValue](self->_feesCharged, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v13, CFSTR("feesCharged"));

  -[NSDecimalNumber stringValue](self->_interestCharged, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v14, CFSTR("interestCharged"));

  -[NSDecimalNumber stringValue](self->_balanceTransfers, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v15, CFSTR("balanceTransfers"));

  -[NSDecimalNumber stringValue](self->_paymentsAndCredits, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v16, CFSTR("paymentsAndCredits"));

  -[NSDecimalNumber stringValue](self->_payments, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("payments"));

  -[NSDecimalNumber stringValue](self->_credits, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v18, CFSTR("credits"));

}

+ (id)recordType
{
  return CFSTR("Statement");
}

+ (id)recordNamePrefix
{
  return CFSTR("statementAvailable-");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *v6;
  NSDate *openingDate;
  NSDate *v8;
  NSDate *closingDate;
  NSDate *v10;
  NSDate *paymentDueDate;
  NSDate *v12;
  NSString *currencyCode;
  NSString *v14;
  NSDecimalNumber *statementBalance;
  NSDecimalNumber *v16;
  NSDecimalNumber *totalBalance;
  NSDecimalNumber *v18;
  NSDecimalNumber *minimumDue;
  NSDecimalNumber *v20;
  NSDecimalNumber *purchases;
  NSDecimalNumber *v22;
  NSDecimalNumber *feesCharged;
  NSDecimalNumber *v24;
  NSDecimalNumber *interestCharged;
  NSDecimalNumber *v26;
  NSDecimalNumber *balanceTransfers;
  NSDecimalNumber *v28;
  NSDecimalNumber *paymentsAndCredits;
  NSDecimalNumber *v30;
  NSDecimalNumber *payments;
  NSDecimalNumber *v32;
  NSDecimalNumber *credits;
  NSDecimalNumber *v34;
  NSDecimalNumber *rewardsBalance;
  NSDecimalNumber *v36;
  NSDecimalNumber *rewardsEarned;
  NSDecimalNumber *v38;
  NSDecimalNumber *rewardsRedeemed;
  NSDecimalNumber *v40;
  NSDecimalNumber *rewardsYTD;
  NSDecimalNumber *v42;
  NSDecimalNumber *rewardsLifetime;
  NSDecimalNumber *v44;
  char v45;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_99;
  identifier = self->_identifier;
  v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (identifier != v6)
  {
    goto LABEL_99;
  }
  openingDate = self->_openingDate;
  v8 = (NSDate *)v4[3];
  if (openingDate && v8)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (openingDate != v8)
  {
    goto LABEL_99;
  }
  closingDate = self->_closingDate;
  v10 = (NSDate *)v4[4];
  if (closingDate && v10)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (closingDate != v10)
  {
    goto LABEL_99;
  }
  paymentDueDate = self->_paymentDueDate;
  v12 = (NSDate *)v4[5];
  if (paymentDueDate && v12)
  {
    if ((-[NSDate isEqual:](paymentDueDate, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (paymentDueDate != v12)
  {
    goto LABEL_99;
  }
  currencyCode = self->_currencyCode;
  v14 = (NSString *)v4[6];
  if (currencyCode && v14)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (currencyCode != v14)
  {
    goto LABEL_99;
  }
  statementBalance = self->_statementBalance;
  v16 = (NSDecimalNumber *)v4[7];
  if (statementBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](statementBalance, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (statementBalance != v16)
  {
    goto LABEL_99;
  }
  totalBalance = self->_totalBalance;
  v18 = (NSDecimalNumber *)v4[8];
  if (totalBalance && v18)
  {
    if ((-[NSDecimalNumber isEqual:](totalBalance, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (totalBalance != v18)
  {
    goto LABEL_99;
  }
  minimumDue = self->_minimumDue;
  v20 = (NSDecimalNumber *)v4[9];
  if (minimumDue && v20)
  {
    if ((-[NSDecimalNumber isEqual:](minimumDue, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (minimumDue != v20)
  {
    goto LABEL_99;
  }
  purchases = self->_purchases;
  v22 = (NSDecimalNumber *)v4[10];
  if (purchases && v22)
  {
    if ((-[NSDecimalNumber isEqual:](purchases, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (purchases != v22)
  {
    goto LABEL_99;
  }
  feesCharged = self->_feesCharged;
  v24 = (NSDecimalNumber *)v4[11];
  if (feesCharged && v24)
  {
    if ((-[NSDecimalNumber isEqual:](feesCharged, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (feesCharged != v24)
  {
    goto LABEL_99;
  }
  interestCharged = self->_interestCharged;
  v26 = (NSDecimalNumber *)v4[12];
  if (interestCharged && v26)
  {
    if ((-[NSDecimalNumber isEqual:](interestCharged, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (interestCharged != v26)
  {
    goto LABEL_99;
  }
  balanceTransfers = self->_balanceTransfers;
  v28 = (NSDecimalNumber *)v4[13];
  if (balanceTransfers && v28)
  {
    if ((-[NSDecimalNumber isEqual:](balanceTransfers, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (balanceTransfers != v28)
  {
    goto LABEL_99;
  }
  paymentsAndCredits = self->_paymentsAndCredits;
  v30 = (NSDecimalNumber *)v4[14];
  if (paymentsAndCredits && v30)
  {
    if ((-[NSDecimalNumber isEqual:](paymentsAndCredits, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (paymentsAndCredits != v30)
  {
    goto LABEL_99;
  }
  payments = self->_payments;
  v32 = (NSDecimalNumber *)v4[15];
  if (payments && v32)
  {
    if ((-[NSDecimalNumber isEqual:](payments, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (payments != v32)
  {
    goto LABEL_99;
  }
  credits = self->_credits;
  v34 = (NSDecimalNumber *)v4[16];
  if (credits && v34)
  {
    if ((-[NSDecimalNumber isEqual:](credits, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (credits != v34)
  {
    goto LABEL_99;
  }
  rewardsBalance = self->_rewardsBalance;
  v36 = (NSDecimalNumber *)v4[17];
  if (rewardsBalance && v36)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsBalance, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (rewardsBalance != v36)
  {
    goto LABEL_99;
  }
  rewardsEarned = self->_rewardsEarned;
  v38 = (NSDecimalNumber *)v4[18];
  if (rewardsEarned && v38)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsEarned, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (rewardsEarned != v38)
  {
    goto LABEL_99;
  }
  rewardsRedeemed = self->_rewardsRedeemed;
  v40 = (NSDecimalNumber *)v4[19];
  if (rewardsRedeemed && v40)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsRedeemed, "isEqual:") & 1) == 0)
      goto LABEL_99;
  }
  else if (rewardsRedeemed != v40)
  {
    goto LABEL_99;
  }
  rewardsYTD = self->_rewardsYTD;
  v42 = (NSDecimalNumber *)v4[20];
  if (!rewardsYTD || !v42)
  {
    if (rewardsYTD == v42)
      goto LABEL_95;
LABEL_99:
    v45 = 0;
    goto LABEL_100;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsYTD, "isEqual:") & 1) == 0)
    goto LABEL_99;
LABEL_95:
  rewardsLifetime = self->_rewardsLifetime;
  v44 = (NSDecimalNumber *)v4[21];
  if (rewardsLifetime && v44)
    v45 = -[NSDecimalNumber isEqual:](rewardsLifetime, "isEqual:");
  else
    v45 = rewardsLifetime == v44;
LABEL_100:

  return v45;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_closingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentDueDate);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_statementBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_totalBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_minimumDue);
  objc_msgSend(v3, "safelyAddObject:", self->_purchases);
  objc_msgSend(v3, "safelyAddObject:", self->_feesCharged);
  objc_msgSend(v3, "safelyAddObject:", self->_interestCharged);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceTransfers);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentsAndCredits);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  objc_msgSend(v3, "safelyAddObject:", self->_credits);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsBalance);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsEarned);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsRedeemed);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsYTD);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsLifetime);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)description
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  -[NSDate description](self->_openingDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), v4);

  -[NSDate description](self->_closingDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), v5);

  -[NSDate description](self->_paymentDueDate, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentDueDate: '%@'; "), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSDecimalNumber stringValue](self->_statementBalance, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("statementBalance: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_totalBalance, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("totalBalance: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_minimumDue, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumDue: '%@'; "), v9);

  -[NSDecimalNumber stringValue](self->_purchases, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("purchases: '%@'; "), v10);

  -[NSDecimalNumber stringValue](self->_feesCharged, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("feesCharged: '%@'; "), v11);

  -[NSDecimalNumber stringValue](self->_interestCharged, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestCharged: '%@'; "), v12);

  -[NSDecimalNumber stringValue](self->_balanceTransfers, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceTransfers: '%@'; "), v13);

  -[NSDecimalNumber stringValue](self->_paymentsAndCredits, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentsAndCredits: '%@'; "), v14);

  -[NSDecimalNumber stringValue](self->_payments, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), v15);

  -[NSDecimalNumber stringValue](self->_credits, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("credits: '%@'; "), v16);

  -[NSDecimalNumber stringValue](self->_rewardsBalance, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsBalance: '%@'; "), v17);

  -[NSDecimalNumber stringValue](self->_rewardsEarned, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsEarned: '%@'; "), v18);

  -[NSDecimalNumber stringValue](self->_rewardsRedeemed, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsRedeemed: '%@'; "), v19);

  -[NSDecimalNumber stringValue](self->_rewardsYTD, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsYTD: '%@'; "), v20);

  -[NSDecimalNumber stringValue](self->_rewardsLifetime, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsLifetime: '%@'; "), v21);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountStatement *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *accountIdentifier;
  uint64_t v10;
  NSDate *openingDate;
  uint64_t v12;
  NSDate *closingDate;
  uint64_t v14;
  NSDate *paymentDueDate;
  uint64_t v16;
  NSString *currencyCode;
  uint64_t v18;
  NSDecimalNumber *statementBalance;
  uint64_t v20;
  NSDecimalNumber *totalBalance;
  uint64_t v22;
  NSDecimalNumber *minimumDue;
  uint64_t v24;
  NSDecimalNumber *purchases;
  uint64_t v26;
  NSDecimalNumber *feesCharged;
  uint64_t v28;
  NSDecimalNumber *interestCharged;
  uint64_t v30;
  NSDecimalNumber *balanceTransfers;
  uint64_t v32;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v34;
  NSDecimalNumber *payments;
  uint64_t v36;
  NSDecimalNumber *credits;
  uint64_t v38;
  NSDecimalNumber *rewardsBalance;
  uint64_t v40;
  NSDecimalNumber *rewardsEarned;
  uint64_t v42;
  NSDecimalNumber *rewardsRedeemed;
  uint64_t v44;
  NSDecimalNumber *rewardsYTD;
  uint64_t v46;
  NSDecimalNumber *rewardsLifetime;

  v5 = -[PKCreditAccountStatement init](+[PKCreditAccountStatement allocWithZone:](PKCreditAccountStatement, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_accountIdentifier, "copyWithZone:", a3);
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  v10 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  openingDate = v5->_openingDate;
  v5->_openingDate = (NSDate *)v10;

  v12 = -[NSDate copyWithZone:](self->_closingDate, "copyWithZone:", a3);
  closingDate = v5->_closingDate;
  v5->_closingDate = (NSDate *)v12;

  v14 = -[NSDate copyWithZone:](self->_paymentDueDate, "copyWithZone:", a3);
  paymentDueDate = v5->_paymentDueDate;
  v5->_paymentDueDate = (NSDate *)v14;

  v16 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_statementBalance, "copyWithZone:", a3);
  statementBalance = v5->_statementBalance;
  v5->_statementBalance = (NSDecimalNumber *)v18;

  v20 = -[NSDecimalNumber copyWithZone:](self->_totalBalance, "copyWithZone:", a3);
  totalBalance = v5->_totalBalance;
  v5->_totalBalance = (NSDecimalNumber *)v20;

  v22 = -[NSDecimalNumber copyWithZone:](self->_minimumDue, "copyWithZone:", a3);
  minimumDue = v5->_minimumDue;
  v5->_minimumDue = (NSDecimalNumber *)v22;

  v24 = -[NSDecimalNumber copyWithZone:](self->_purchases, "copyWithZone:", a3);
  purchases = v5->_purchases;
  v5->_purchases = (NSDecimalNumber *)v24;

  v26 = -[NSDecimalNumber copyWithZone:](self->_feesCharged, "copyWithZone:", a3);
  feesCharged = v5->_feesCharged;
  v5->_feesCharged = (NSDecimalNumber *)v26;

  v28 = -[NSDecimalNumber copyWithZone:](self->_interestCharged, "copyWithZone:", a3);
  interestCharged = v5->_interestCharged;
  v5->_interestCharged = (NSDecimalNumber *)v28;

  v30 = -[NSDecimalNumber copyWithZone:](self->_balanceTransfers, "copyWithZone:", a3);
  balanceTransfers = v5->_balanceTransfers;
  v5->_balanceTransfers = (NSDecimalNumber *)v30;

  v32 = -[NSDecimalNumber copyWithZone:](self->_paymentsAndCredits, "copyWithZone:", a3);
  paymentsAndCredits = v5->_paymentsAndCredits;
  v5->_paymentsAndCredits = (NSDecimalNumber *)v32;

  v34 = -[NSDecimalNumber copyWithZone:](self->_payments, "copyWithZone:", a3);
  payments = v5->_payments;
  v5->_payments = (NSDecimalNumber *)v34;

  v36 = -[NSDecimalNumber copyWithZone:](self->_credits, "copyWithZone:", a3);
  credits = v5->_credits;
  v5->_credits = (NSDecimalNumber *)v36;

  v38 = -[NSDecimalNumber copyWithZone:](self->_rewardsBalance, "copyWithZone:", a3);
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v38;

  v40 = -[NSDecimalNumber copyWithZone:](self->_rewardsEarned, "copyWithZone:", a3);
  rewardsEarned = v5->_rewardsEarned;
  v5->_rewardsEarned = (NSDecimalNumber *)v40;

  v42 = -[NSDecimalNumber copyWithZone:](self->_rewardsRedeemed, "copyWithZone:", a3);
  rewardsRedeemed = v5->_rewardsRedeemed;
  v5->_rewardsRedeemed = (NSDecimalNumber *)v42;

  v44 = -[NSDecimalNumber copyWithZone:](self->_rewardsYTD, "copyWithZone:", a3);
  rewardsYTD = v5->_rewardsYTD;
  v5->_rewardsYTD = (NSDecimalNumber *)v44;

  v46 = -[NSDecimalNumber copyWithZone:](self->_rewardsLifetime, "copyWithZone:", a3);
  rewardsLifetime = v5->_rewardsLifetime;
  v5->_rewardsLifetime = (NSDecimalNumber *)v46;

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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
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

- (NSDate)paymentDueDate
{
  return self->_paymentDueDate;
}

- (void)setPaymentDueDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)statementBalance
{
  return self->_statementBalance;
}

- (void)setStatementBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)totalBalance
{
  return self->_totalBalance;
}

- (void)setTotalBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)minimumDue
{
  return self->_minimumDue;
}

- (void)setMinimumDue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)purchases
{
  return self->_purchases;
}

- (void)setPurchases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)feesCharged
{
  return self->_feesCharged;
}

- (void)setFeesCharged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDecimalNumber)interestCharged
{
  return self->_interestCharged;
}

- (void)setInterestCharged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSDecimalNumber)balanceTransfers
{
  return self->_balanceTransfers;
}

- (void)setBalanceTransfers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSDecimalNumber)paymentsAndCredits
{
  return self->_paymentsAndCredits;
}

- (void)setPaymentsAndCredits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSDecimalNumber)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDecimalNumber)credits
{
  return self->_credits;
}

- (void)setCredits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSDecimalNumber)rewardsEarned
{
  return self->_rewardsEarned;
}

- (void)setRewardsEarned:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDecimalNumber)rewardsRedeemed
{
  return self->_rewardsRedeemed;
}

- (void)setRewardsRedeemed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDecimalNumber)rewardsYTD
{
  return self->_rewardsYTD;
}

- (void)setRewardsYTD:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSDecimalNumber)rewardsLifetime
{
  return self->_rewardsLifetime;
}

- (void)setRewardsLifetime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsLifetime, 0);
  objc_storeStrong((id *)&self->_rewardsYTD, 0);
  objc_storeStrong((id *)&self->_rewardsRedeemed, 0);
  objc_storeStrong((id *)&self->_rewardsEarned, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_credits, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_paymentsAndCredits, 0);
  objc_storeStrong((id *)&self->_balanceTransfers, 0);
  objc_storeStrong((id *)&self->_interestCharged, 0);
  objc_storeStrong((id *)&self->_feesCharged, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_minimumDue, 0);
  objc_storeStrong((id *)&self->_totalBalance, 0);
  objc_storeStrong((id *)&self->_statementBalance, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentDueDate, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
