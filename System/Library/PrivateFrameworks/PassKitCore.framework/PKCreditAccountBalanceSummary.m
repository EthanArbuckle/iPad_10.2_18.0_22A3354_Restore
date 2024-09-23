@implementation PKCreditAccountBalanceSummary

- (PKCreditAccountBalanceSummary)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountBalanceSummary *v5;
  uint64_t v6;
  NSDate *openingDate;
  uint64_t v8;
  NSDate *closingDate;
  uint64_t v10;
  NSDecimalNumber *purchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *balanceTransfers;
  uint64_t v16;
  NSDecimalNumber *interestCharged;
  uint64_t v18;
  NSDecimalNumber *feesCharged;
  uint64_t v20;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v22;
  NSDecimalNumber *payments;
  uint64_t v24;
  NSDecimalNumber *credits;
  uint64_t v26;
  NSDecimalNumber *rewardsEarned;
  uint64_t v28;
  NSDecimalNumber *rewardsRedeemed;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKCreditAccountBalanceSummary;
  v5 = -[PKCreditAccountBalanceSummary init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKDateForKey:", CFSTR("openingDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v6;

    objc_msgSend(v4, "PKDateForKey:", CFSTR("closingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("purchases"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("pendingPurchases"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("balanceTransfers"));
    v14 = objc_claimAutoreleasedReturnValue();
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("interestCharged"));
    v16 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("feesCharged"));
    v18 = objc_claimAutoreleasedReturnValue();
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("paymentsAndCredits"));
    v20 = objc_claimAutoreleasedReturnValue();
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("payments"));
    v22 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("credits"));
    v24 = objc_claimAutoreleasedReturnValue();
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsEarned"));
    v26 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v26;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsRedeemed"));
    v28 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v28;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountBalanceSummary)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountBalanceSummary *v5;
  uint64_t v6;
  NSDate *openingDate;
  uint64_t v8;
  NSDate *closingDate;
  uint64_t v10;
  NSDecimalNumber *purchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *balanceTransfers;
  uint64_t v16;
  NSDecimalNumber *interestCharged;
  uint64_t v18;
  NSDecimalNumber *feesCharged;
  uint64_t v20;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v22;
  NSDecimalNumber *payments;
  uint64_t v24;
  NSDecimalNumber *credits;
  uint64_t v26;
  NSDecimalNumber *rewardsEarned;
  uint64_t v28;
  NSDecimalNumber *rewardsRedeemed;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKCreditAccountBalanceSummary;
  v5 = -[PKCreditAccountBalanceSummary init](&v31, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("openingDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("closingDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchases"));
    v10 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingPurchases"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("balanceTransfers"));
    v14 = objc_claimAutoreleasedReturnValue();
    balanceTransfers = v5->_balanceTransfers;
    v5->_balanceTransfers = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interestCharged"));
    v16 = objc_claimAutoreleasedReturnValue();
    interestCharged = v5->_interestCharged;
    v5->_interestCharged = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feesCharged"));
    v18 = objc_claimAutoreleasedReturnValue();
    feesCharged = v5->_feesCharged;
    v5->_feesCharged = (NSDecimalNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentsAndCredits"));
    v20 = objc_claimAutoreleasedReturnValue();
    paymentsAndCredits = v5->_paymentsAndCredits;
    v5->_paymentsAndCredits = (NSDecimalNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payments"));
    v22 = objc_claimAutoreleasedReturnValue();
    payments = v5->_payments;
    v5->_payments = (NSDecimalNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credits"));
    v24 = objc_claimAutoreleasedReturnValue();
    credits = v5->_credits;
    v5->_credits = (NSDecimalNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsEarned"));
    v26 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsRedeemed"));
    v28 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *openingDate;
  id v5;

  openingDate = self->_openingDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", openingDate, CFSTR("openingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_closingDate, CFSTR("closingDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchases, CFSTR("purchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingPurchases, CFSTR("pendingPurchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_balanceTransfers, CFSTR("balanceTransfers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interestCharged, CFSTR("interestCharged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_feesCharged, CFSTR("feesCharged"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_paymentsAndCredits, CFSTR("paymentsAndCredits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payments, CFSTR("payments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credits, CFSTR("credits"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsEarned, CFSTR("rewardsEarned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsRedeemed, CFSTR("rewardsRedeemed"));

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDate *openingDate;
  NSDate *v6;
  NSDate *closingDate;
  NSDate *v8;
  NSDecimalNumber *purchases;
  NSDecimalNumber *v10;
  NSDecimalNumber *pendingPurchases;
  NSDecimalNumber *v12;
  NSDecimalNumber *balanceTransfers;
  NSDecimalNumber *v14;
  NSDecimalNumber *interestCharged;
  NSDecimalNumber *v16;
  NSDecimalNumber *feesCharged;
  NSDecimalNumber *v18;
  NSDecimalNumber *paymentsAndCredits;
  NSDecimalNumber *v20;
  NSDecimalNumber *payments;
  NSDecimalNumber *v22;
  NSDecimalNumber *credits;
  NSDecimalNumber *v24;
  NSDecimalNumber *rewardsEarned;
  NSDecimalNumber *v26;
  NSDecimalNumber *rewardsRedeemed;
  NSDecimalNumber *v28;
  char v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_59;
  openingDate = self->_openingDate;
  v6 = (NSDate *)v4[1];
  if (openingDate && v6)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (openingDate != v6)
  {
    goto LABEL_59;
  }
  closingDate = self->_closingDate;
  v8 = (NSDate *)v4[2];
  if (closingDate && v8)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (closingDate != v8)
  {
    goto LABEL_59;
  }
  purchases = self->_purchases;
  v10 = (NSDecimalNumber *)v4[3];
  if (purchases && v10)
  {
    if ((-[NSDecimalNumber isEqual:](purchases, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (purchases != v10)
  {
    goto LABEL_59;
  }
  pendingPurchases = self->_pendingPurchases;
  v12 = (NSDecimalNumber *)v4[4];
  if (pendingPurchases && v12)
  {
    if ((-[NSDecimalNumber isEqual:](pendingPurchases, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (pendingPurchases != v12)
  {
    goto LABEL_59;
  }
  balanceTransfers = self->_balanceTransfers;
  v14 = (NSDecimalNumber *)v4[5];
  if (balanceTransfers && v14)
  {
    if ((-[NSDecimalNumber isEqual:](balanceTransfers, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (balanceTransfers != v14)
  {
    goto LABEL_59;
  }
  interestCharged = self->_interestCharged;
  v16 = (NSDecimalNumber *)v4[6];
  if (interestCharged && v16)
  {
    if ((-[NSDecimalNumber isEqual:](interestCharged, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (interestCharged != v16)
  {
    goto LABEL_59;
  }
  feesCharged = self->_feesCharged;
  v18 = (NSDecimalNumber *)v4[7];
  if (feesCharged && v18)
  {
    if ((-[NSDecimalNumber isEqual:](feesCharged, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (feesCharged != v18)
  {
    goto LABEL_59;
  }
  paymentsAndCredits = self->_paymentsAndCredits;
  v20 = (NSDecimalNumber *)v4[8];
  if (paymentsAndCredits && v20)
  {
    if ((-[NSDecimalNumber isEqual:](paymentsAndCredits, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (paymentsAndCredits != v20)
  {
    goto LABEL_59;
  }
  payments = self->_payments;
  v22 = (NSDecimalNumber *)v4[9];
  if (payments && v22)
  {
    if ((-[NSDecimalNumber isEqual:](payments, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (payments != v22)
  {
    goto LABEL_59;
  }
  credits = self->_credits;
  v24 = (NSDecimalNumber *)v4[10];
  if (credits && v24)
  {
    if ((-[NSDecimalNumber isEqual:](credits, "isEqual:") & 1) == 0)
      goto LABEL_59;
  }
  else if (credits != v24)
  {
    goto LABEL_59;
  }
  rewardsEarned = self->_rewardsEarned;
  v26 = (NSDecimalNumber *)v4[11];
  if (!rewardsEarned || !v26)
  {
    if (rewardsEarned == v26)
      goto LABEL_55;
LABEL_59:
    v29 = 0;
    goto LABEL_60;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsEarned, "isEqual:") & 1) == 0)
    goto LABEL_59;
LABEL_55:
  rewardsRedeemed = self->_rewardsRedeemed;
  v28 = (NSDecimalNumber *)v4[12];
  if (rewardsRedeemed && v28)
    v29 = -[NSDecimalNumber isEqual:](rewardsRedeemed, "isEqual:");
  else
    v29 = rewardsRedeemed == v28;
LABEL_60:

  return v29;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_openingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_closingDate);
  objc_msgSend(v3, "safelyAddObject:", self->_purchases);
  objc_msgSend(v3, "safelyAddObject:", self->_pendingPurchases);
  objc_msgSend(v3, "safelyAddObject:", self->_balanceTransfers);
  objc_msgSend(v3, "safelyAddObject:", self->_interestCharged);
  objc_msgSend(v3, "safelyAddObject:", self->_feesCharged);
  objc_msgSend(v3, "safelyAddObject:", self->_paymentsAndCredits);
  objc_msgSend(v3, "safelyAddObject:", self->_payments);
  objc_msgSend(v3, "safelyAddObject:", self->_credits);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsEarned);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsRedeemed);
  v4 = PKCombinedHash(17, v3);

  return v4;
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
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate description](self->_openingDate, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("openingDate: '%@'; "), v4);

  -[NSDate description](self->_closingDate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("closingDate: '%@'; "), v5);

  -[NSDecimalNumber stringValue](self->_purchases, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("purchases: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_pendingPurchases, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pendingPurchases: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_balanceTransfers, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("balanceTransfers: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_interestCharged, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("interestCharged: '%@'; "), v9);

  -[NSDecimalNumber stringValue](self->_feesCharged, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("feesCharges: '%@'; "), v10);

  -[NSDecimalNumber stringValue](self->_paymentsAndCredits, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("paymentsAndCredits: '%@'; "), v11);

  -[NSDecimalNumber stringValue](self->_payments, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("payments: '%@'; "), v12);

  -[NSDecimalNumber stringValue](self->_credits, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("credits: '%@'; "), v13);

  -[NSDecimalNumber stringValue](self->_rewardsEarned, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsEarned: '%@'; "), v14);

  -[NSDecimalNumber stringValue](self->_rewardsRedeemed, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsRedeemed: '%@'; "), v15);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountBalanceSummary *v5;
  uint64_t v6;
  NSDate *openingDate;
  uint64_t v8;
  NSDate *closingDate;
  uint64_t v10;
  NSDecimalNumber *purchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *balanceTransfers;
  uint64_t v16;
  NSDecimalNumber *interestCharged;
  uint64_t v18;
  NSDecimalNumber *feesCharged;
  uint64_t v20;
  NSDecimalNumber *paymentsAndCredits;
  uint64_t v22;
  NSDecimalNumber *payments;
  uint64_t v24;
  NSDecimalNumber *credits;
  uint64_t v26;
  NSDecimalNumber *rewardsEarned;
  uint64_t v28;
  NSDecimalNumber *rewardsRedeemed;

  v5 = -[PKCreditAccountBalanceSummary init](+[PKCreditAccountBalanceSummary allocWithZone:](PKCreditAccountBalanceSummary, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_openingDate, "copyWithZone:", a3);
  openingDate = v5->_openingDate;
  v5->_openingDate = (NSDate *)v6;

  v8 = -[NSDate copyWithZone:](self->_closingDate, "copyWithZone:", a3);
  closingDate = v5->_closingDate;
  v5->_closingDate = (NSDate *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_purchases, "copyWithZone:", a3);
  purchases = v5->_purchases;
  v5->_purchases = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_pendingPurchases, "copyWithZone:", a3);
  pendingPurchases = v5->_pendingPurchases;
  v5->_pendingPurchases = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_balanceTransfers, "copyWithZone:", a3);
  balanceTransfers = v5->_balanceTransfers;
  v5->_balanceTransfers = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_interestCharged, "copyWithZone:", a3);
  interestCharged = v5->_interestCharged;
  v5->_interestCharged = (NSDecimalNumber *)v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_feesCharged, "copyWithZone:", a3);
  feesCharged = v5->_feesCharged;
  v5->_feesCharged = (NSDecimalNumber *)v18;

  v20 = -[NSDecimalNumber copyWithZone:](self->_paymentsAndCredits, "copyWithZone:", a3);
  paymentsAndCredits = v5->_paymentsAndCredits;
  v5->_paymentsAndCredits = (NSDecimalNumber *)v20;

  v22 = -[NSDecimalNumber copyWithZone:](self->_payments, "copyWithZone:", a3);
  payments = v5->_payments;
  v5->_payments = (NSDecimalNumber *)v22;

  v24 = -[NSDecimalNumber copyWithZone:](self->_credits, "copyWithZone:", a3);
  credits = v5->_credits;
  v5->_credits = (NSDecimalNumber *)v24;

  v26 = -[NSDecimalNumber copyWithZone:](self->_rewardsEarned, "copyWithZone:", a3);
  rewardsEarned = v5->_rewardsEarned;
  v5->_rewardsEarned = (NSDecimalNumber *)v26;

  v28 = -[NSDecimalNumber copyWithZone:](self->_rewardsRedeemed, "copyWithZone:", a3);
  rewardsRedeemed = v5->_rewardsRedeemed;
  v5->_rewardsRedeemed = (NSDecimalNumber *)v28;

  return v5;
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDecimalNumber)purchases
{
  return self->_purchases;
}

- (void)setPurchases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDecimalNumber)pendingPurchases
{
  return self->_pendingPurchases;
}

- (void)setPendingPurchases:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDecimalNumber)balanceTransfers
{
  return self->_balanceTransfers;
}

- (void)setBalanceTransfers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDecimalNumber)interestCharged
{
  return self->_interestCharged;
}

- (void)setInterestCharged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDecimalNumber)feesCharged
{
  return self->_feesCharged;
}

- (void)setFeesCharged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDecimalNumber)paymentsAndCredits
{
  return self->_paymentsAndCredits;
}

- (void)setPaymentsAndCredits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDecimalNumber)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDecimalNumber)credits
{
  return self->_credits;
}

- (void)setCredits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDecimalNumber)rewardsEarned
{
  return self->_rewardsEarned;
}

- (void)setRewardsEarned:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDecimalNumber)rewardsRedeemed
{
  return self->_rewardsRedeemed;
}

- (void)setRewardsRedeemed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsRedeemed, 0);
  objc_storeStrong((id *)&self->_rewardsEarned, 0);
  objc_storeStrong((id *)&self->_credits, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_paymentsAndCredits, 0);
  objc_storeStrong((id *)&self->_feesCharged, 0);
  objc_storeStrong((id *)&self->_interestCharged, 0);
  objc_storeStrong((id *)&self->_balanceTransfers, 0);
  objc_storeStrong((id *)&self->_pendingPurchases, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
}

@end
