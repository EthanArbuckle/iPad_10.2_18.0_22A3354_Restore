@implementation PKDashboardRewardsBalanceItem

+ (id)identifier
{
  return CFSTR("rewardsBalanceItem");
}

- (PKDashboardRewardsBalanceItem)initWithPaymentRewardsBalance:(id)a3 institutionName:(id)a4 passUniquIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKDashboardRewardsBalanceItem *v11;
  uint64_t v12;
  NSString *balanceIdentifier;
  uint64_t v14;
  NSString *programName;
  uint64_t v16;
  NSURL *programURL;
  uint64_t v18;
  NSString *formattedQuantityValue;
  uint64_t v20;
  NSString *formattedMonetaryValue;
  uint64_t v22;
  NSDate *lastFetchedAt;
  uint64_t v24;
  NSString *passUniqueID;
  uint64_t v26;
  NSString *institutionName;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PKDashboardRewardsBalanceItem;
  v11 = -[PKDashboardRewardsBalanceItem init](&v29, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "identifier");
    v12 = objc_claimAutoreleasedReturnValue();
    balanceIdentifier = v11->_balanceIdentifier;
    v11->_balanceIdentifier = (NSString *)v12;

    objc_msgSend(v8, "programName");
    v14 = objc_claimAutoreleasedReturnValue();
    programName = v11->_programName;
    v11->_programName = (NSString *)v14;

    objc_msgSend(v8, "programURL");
    v16 = objc_claimAutoreleasedReturnValue();
    programURL = v11->_programURL;
    v11->_programURL = (NSURL *)v16;

    v11->_rewardsType = objc_msgSend(v8, "type");
    objc_msgSend(v8, "formattedQuantityValue");
    v18 = objc_claimAutoreleasedReturnValue();
    formattedQuantityValue = v11->_formattedQuantityValue;
    v11->_formattedQuantityValue = (NSString *)v18;

    objc_msgSend(v8, "formattedMonetaryValue");
    v20 = objc_claimAutoreleasedReturnValue();
    formattedMonetaryValue = v11->_formattedMonetaryValue;
    v11->_formattedMonetaryValue = (NSString *)v20;

    v11->_isRedeemable = objc_msgSend(v8, "isRedeemable");
    objc_msgSend(v8, "lastFetchedAt");
    v22 = objc_claimAutoreleasedReturnValue();
    lastFetchedAt = v11->_lastFetchedAt;
    v11->_lastFetchedAt = (NSDate *)v22;

    v24 = objc_msgSend(v10, "copy");
    passUniqueID = v11->_passUniqueID;
    v11->_passUniqueID = (NSString *)v24;

    v26 = objc_msgSend(v9, "copy");
    institutionName = v11->_institutionName;
    v11->_institutionName = (NSString *)v26;

  }
  return v11;
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_balanceIdentifier, a3);
}

- (NSString)programName
{
  return self->_programName;
}

- (void)setProgramName:(id)a3
{
  objc_storeStrong((id *)&self->_programName, a3);
}

- (NSString)institutionName
{
  return self->_institutionName;
}

- (void)setInstitutionName:(id)a3
{
  objc_storeStrong((id *)&self->_institutionName, a3);
}

- (unint64_t)rewardsType
{
  return self->_rewardsType;
}

- (void)setRewardsType:(unint64_t)a3
{
  self->_rewardsType = a3;
}

- (NSURL)programURL
{
  return self->_programURL;
}

- (void)setProgramURL:(id)a3
{
  objc_storeStrong((id *)&self->_programURL, a3);
}

- (NSString)formattedMonetaryValue
{
  return self->_formattedMonetaryValue;
}

- (void)setFormattedMonetaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedMonetaryValue, a3);
}

- (NSString)formattedQuantityValue
{
  return self->_formattedQuantityValue;
}

- (void)setFormattedQuantityValue:(id)a3
{
  objc_storeStrong((id *)&self->_formattedQuantityValue, a3);
}

- (BOOL)isRedeemable
{
  return self->_isRedeemable;
}

- (void)setIsRedeemable:(BOOL)a3
{
  self->_isRedeemable = a3;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
}

- (void)setPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_passUniqueID, a3);
}

- (NSDate)lastFetchedAt
{
  return self->_lastFetchedAt;
}

- (void)setLastFetchedAt:(id)a3
{
  objc_storeStrong((id *)&self->_lastFetchedAt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastFetchedAt, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_formattedQuantityValue, 0);
  objc_storeStrong((id *)&self->_formattedMonetaryValue, 0);
  objc_storeStrong((id *)&self->_programURL, 0);
  objc_storeStrong((id *)&self->_institutionName, 0);
  objc_storeStrong((id *)&self->_programName, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
}

@end
