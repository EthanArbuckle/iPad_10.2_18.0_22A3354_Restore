@implementation PKCreditAccountUserActivity

- (PKCreditAccountUserActivity)initWithDictionary:(id)a3
{
  id v4;
  PKCreditAccountUserActivity *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSDecimalNumber *purchases;
  uint64_t v10;
  NSDecimalNumber *adjustedPurchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *rewardsEarned;
  uint64_t v18;
  NSDecimalNumber *rewardsRedeemed;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCreditAccountUserActivity;
  v5 = -[PKCreditAccountUserActivity init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("accountUserAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("purchases"));
    v8 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("adjustedPurchases"));
    v10 = objc_claimAutoreleasedReturnValue();
    adjustedPurchases = v5->_adjustedPurchases;
    v5->_adjustedPurchases = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("pendingPurchases"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsEarned"));
    v16 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "PKDecimalNumberFromStringForKey:", CFSTR("rewardsRedeemed"));
    v18 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v18;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKCreditAccountUserActivity *v4;
  PKCreditAccountUserActivity *v5;
  BOOL v6;

  v4 = (PKCreditAccountUserActivity *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKCreditAccountUserActivity isEqualToCreditAccountUserActivity:](self, "isEqualToCreditAccountUserActivity:", v5);

  return v6;
}

- (BOOL)isEqualToCreditAccountUserActivity:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDecimalNumber *purchases;
  NSDecimalNumber *v12;
  NSDecimalNumber *adjustedPurchases;
  NSDecimalNumber *v14;
  NSDecimalNumber *pendingPurchases;
  NSDecimalNumber *v16;
  NSDecimalNumber *rewardsBalance;
  NSDecimalNumber *v18;
  NSDecimalNumber *rewardsEarned;
  NSDecimalNumber *v20;
  NSDecimalNumber *rewardsRedeemed;
  NSDecimalNumber *v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_36;
  v6 = (void *)v4[1];
  v7 = self->_accountUserAltDSID;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_36;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_36;
  }
  purchases = self->_purchases;
  v12 = (NSDecimalNumber *)v5[2];
  if (purchases && v12)
  {
    if ((-[NSDecimalNumber isEqual:](purchases, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (purchases != v12)
  {
    goto LABEL_36;
  }
  adjustedPurchases = self->_adjustedPurchases;
  v14 = (NSDecimalNumber *)v5[3];
  if (adjustedPurchases && v14)
  {
    if ((-[NSDecimalNumber isEqual:](adjustedPurchases, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (adjustedPurchases != v14)
  {
    goto LABEL_36;
  }
  pendingPurchases = self->_pendingPurchases;
  v16 = (NSDecimalNumber *)v5[4];
  if (pendingPurchases && v16)
  {
    if ((-[NSDecimalNumber isEqual:](pendingPurchases, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (pendingPurchases != v16)
  {
    goto LABEL_36;
  }
  rewardsBalance = self->_rewardsBalance;
  v18 = (NSDecimalNumber *)v5[5];
  if (rewardsBalance && v18)
  {
    if ((-[NSDecimalNumber isEqual:](rewardsBalance, "isEqual:") & 1) == 0)
      goto LABEL_36;
  }
  else if (rewardsBalance != v18)
  {
    goto LABEL_36;
  }
  rewardsEarned = self->_rewardsEarned;
  v20 = (NSDecimalNumber *)v5[6];
  if (!rewardsEarned || !v20)
  {
    if (rewardsEarned == v20)
      goto LABEL_32;
LABEL_36:
    v23 = 0;
    goto LABEL_37;
  }
  if ((-[NSDecimalNumber isEqual:](rewardsEarned, "isEqual:") & 1) == 0)
    goto LABEL_36;
LABEL_32:
  rewardsRedeemed = self->_rewardsRedeemed;
  v22 = (NSDecimalNumber *)v5[7];
  if (rewardsRedeemed && v22)
    v23 = -[NSDecimalNumber isEqual:](rewardsRedeemed, "isEqual:");
  else
    v23 = rewardsRedeemed == v22;
LABEL_37:

  return v23;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_accountUserAltDSID);
  objc_msgSend(v3, "safelyAddObject:", self->_purchases);
  objc_msgSend(v3, "safelyAddObject:", self->_adjustedPurchases);
  objc_msgSend(v3, "safelyAddObject:", self->_pendingPurchases);
  objc_msgSend(v3, "safelyAddObject:", self->_rewardsBalance);
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("accountUserAltDSID: '%@'; "), self->_accountUserAltDSID);
  -[NSDecimalNumber stringValue](self->_purchases, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("purchases: '%@'; "), v4);

  -[NSDecimalNumber stringValue](self->_adjustedPurchases, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("adjustedPurchases: '%@'; "), v5);

  -[NSDecimalNumber stringValue](self->_pendingPurchases, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("pendingPurchases: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_rewardsBalance, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsBalance: '%@'; "), v7);

  -[NSDecimalNumber stringValue](self->_rewardsEarned, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsEarned: '%@'; "), v8);

  -[NSDecimalNumber stringValue](self->_rewardsRedeemed, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("rewardsRedeemed: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCreditAccountUserActivity)initWithCoder:(id)a3
{
  id v4;
  PKCreditAccountUserActivity *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSDecimalNumber *purchases;
  uint64_t v10;
  NSDecimalNumber *adjustedPurchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *rewardsEarned;
  uint64_t v18;
  NSDecimalNumber *rewardsRedeemed;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKCreditAccountUserActivity;
  v5 = -[PKCreditAccountUserActivity init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountUserAltDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchases"));
    v8 = objc_claimAutoreleasedReturnValue();
    purchases = v5->_purchases;
    v5->_purchases = (NSDecimalNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adjustedPurchases"));
    v10 = objc_claimAutoreleasedReturnValue();
    adjustedPurchases = v5->_adjustedPurchases;
    v5->_adjustedPurchases = (NSDecimalNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingPurchases"));
    v12 = objc_claimAutoreleasedReturnValue();
    pendingPurchases = v5->_pendingPurchases;
    v5->_pendingPurchases = (NSDecimalNumber *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsBalance"));
    v14 = objc_claimAutoreleasedReturnValue();
    rewardsBalance = v5->_rewardsBalance;
    v5->_rewardsBalance = (NSDecimalNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsEarned"));
    v16 = objc_claimAutoreleasedReturnValue();
    rewardsEarned = v5->_rewardsEarned;
    v5->_rewardsEarned = (NSDecimalNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rewardsRedeemed"));
    v18 = objc_claimAutoreleasedReturnValue();
    rewardsRedeemed = v5->_rewardsRedeemed;
    v5->_rewardsRedeemed = (NSDecimalNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accountUserAltDSID;
  id v5;

  accountUserAltDSID = self->_accountUserAltDSID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accountUserAltDSID, CFSTR("accountUserAltDSID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchases, CFSTR("purchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_adjustedPurchases, CFSTR("adjustedPurchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingPurchases, CFSTR("pendingPurchases"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsBalance, CFSTR("rewardsBalance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsEarned, CFSTR("rewardsEarned"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rewardsRedeemed, CFSTR("rewardsRedeemed"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCreditAccountUserActivity *v5;
  uint64_t v6;
  NSString *accountUserAltDSID;
  uint64_t v8;
  NSDecimalNumber *purchases;
  uint64_t v10;
  NSDecimalNumber *adjustedPurchases;
  uint64_t v12;
  NSDecimalNumber *pendingPurchases;
  uint64_t v14;
  NSDecimalNumber *rewardsBalance;
  uint64_t v16;
  NSDecimalNumber *rewardsEarned;
  uint64_t v18;
  NSDecimalNumber *rewardsRedeemed;

  v5 = -[PKCreditAccountUserActivity init](+[PKCreditAccountUserActivity allocWithZone:](PKCreditAccountUserActivity, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_accountUserAltDSID, "copyWithZone:", a3);
  accountUserAltDSID = v5->_accountUserAltDSID;
  v5->_accountUserAltDSID = (NSString *)v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_purchases, "copyWithZone:", a3);
  purchases = v5->_purchases;
  v5->_purchases = (NSDecimalNumber *)v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_adjustedPurchases, "copyWithZone:", a3);
  adjustedPurchases = v5->_adjustedPurchases;
  v5->_adjustedPurchases = (NSDecimalNumber *)v10;

  v12 = -[NSDecimalNumber copyWithZone:](self->_pendingPurchases, "copyWithZone:", a3);
  pendingPurchases = v5->_pendingPurchases;
  v5->_pendingPurchases = (NSDecimalNumber *)v12;

  v14 = -[NSDecimalNumber copyWithZone:](self->_rewardsBalance, "copyWithZone:", a3);
  rewardsBalance = v5->_rewardsBalance;
  v5->_rewardsBalance = (NSDecimalNumber *)v14;

  v16 = -[NSDecimalNumber copyWithZone:](self->_rewardsEarned, "copyWithZone:", a3);
  rewardsEarned = v5->_rewardsEarned;
  v5->_rewardsEarned = (NSDecimalNumber *)v16;

  v18 = -[NSDecimalNumber copyWithZone:](self->_rewardsRedeemed, "copyWithZone:", a3);
  rewardsRedeemed = v5->_rewardsRedeemed;
  v5->_rewardsRedeemed = (NSDecimalNumber *)v18;

  return v5;
}

- (NSDecimalNumber)totalSpending
{
  void *v3;
  NSDecimalNumber *adjustedPurchases;
  NSDecimalNumber **p_adjustedPurchases;
  void *v6;
  int v7;
  NSDecimalNumber *purchases;
  void *v9;
  char v10;
  uint64_t v11;
  NSDecimalNumber *pendingPurchases;
  void *v13;
  char v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x1E0CB3598], "zero");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_adjustedPurchases = &self->_adjustedPurchases;
  adjustedPurchases = self->_adjustedPurchases;
  if (adjustedPurchases)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSDecimalNumber isEqualToNumber:](adjustedPurchases, "isEqualToNumber:", v6);

    if (!v7)
      goto LABEL_5;
  }
  p_adjustedPurchases = &self->_purchases;
  purchases = self->_purchases;
  if (purchases)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSDecimalNumber isEqualToNumber:](purchases, "isEqualToNumber:", v9);

    if ((v10 & 1) == 0)
    {
LABEL_5:
      objc_msgSend(v3, "decimalNumberByAdding:", *p_adjustedPurchases);
      v11 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v11;
    }
  }
  pendingPurchases = self->_pendingPurchases;
  if (pendingPurchases)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSDecimalNumber isEqualToNumber:](pendingPurchases, "isEqualToNumber:", v13);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v3, "decimalNumberByAdding:", self->_pendingPurchases);
      v15 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v15;
    }
  }
  return (NSDecimalNumber *)v3;
}

- (id)remainingMonthlySpendWithLimit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKCreditAccountUserActivity totalSpending](self, "totalSpending");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "compare:", v6) != -1)
    {
      objc_msgSend(v4, "decimalNumberBySubtracting:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDecimalNumber)purchases
{
  return self->_purchases;
}

- (void)setPurchases:(id)a3
{
  objc_storeStrong((id *)&self->_purchases, a3);
}

- (NSDecimalNumber)adjustedPurchases
{
  return self->_adjustedPurchases;
}

- (void)setAdjustedPurchases:(id)a3
{
  objc_storeStrong((id *)&self->_adjustedPurchases, a3);
}

- (NSDecimalNumber)pendingPurchases
{
  return self->_pendingPurchases;
}

- (void)setPendingPurchases:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPurchases, a3);
}

- (NSDecimalNumber)rewardsBalance
{
  return self->_rewardsBalance;
}

- (void)setRewardsBalance:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsBalance, a3);
}

- (NSDecimalNumber)rewardsEarned
{
  return self->_rewardsEarned;
}

- (void)setRewardsEarned:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsEarned, a3);
}

- (NSDecimalNumber)rewardsRedeemed
{
  return self->_rewardsRedeemed;
}

- (void)setRewardsRedeemed:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsRedeemed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewardsRedeemed, 0);
  objc_storeStrong((id *)&self->_rewardsEarned, 0);
  objc_storeStrong((id *)&self->_rewardsBalance, 0);
  objc_storeStrong((id *)&self->_pendingPurchases, 0);
  objc_storeStrong((id *)&self->_adjustedPurchases, 0);
  objc_storeStrong((id *)&self->_purchases, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
}

@end
