@implementation PKDailyCashSelectionItem

- (NSCopying)identifier
{
  return (NSCopying *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_redemptionType);
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[PKDailyCashSelectionItem identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && self->_redemptionType == v4[1]
    && self->_hasAccount == *((unsigned __int8 *)v4 + 24)
    && self->_hasPendingApplication == *((unsigned __int8 *)v4 + 25)
    && self->_loading == *((unsigned __int8 *)v4 + 26)
    && self->_selected == *((unsigned __int8 *)v4 + 27)
    && self->_hasRedeemed == *((unsigned __int8 *)v4 + 28)
    && self->_accountState == v4[4])
  {
    v5 = PKEqualObjects();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
}

- (BOOL)hasAccount
{
  return self->_hasAccount;
}

- (void)setHasAccount:(BOOL)a3
{
  self->_hasAccount = a3;
}

- (BOOL)hasPendingApplication
{
  return self->_hasPendingApplication;
}

- (void)setHasPendingApplication:(BOOL)a3
{
  self->_hasPendingApplication = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)hasRedeemed
{
  return self->_hasRedeemed;
}

- (void)setHasRedeemed:(BOOL)a3
{
  self->_hasRedeemed = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balance, 0);
}

@end
