@implementation PKDemoTransactionGeneratorConfiguration

- (PKDemoTransactionGeneratorConfiguration)init
{
  PKDemoTransactionGeneratorConfiguration *v2;
  PKDemoTransactionGeneratorConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKDemoTransactionGeneratorConfiguration;
  v2 = -[PKDemoTransactionGeneratorConfiguration init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_demoMerchant = -1;
    v2->_demoPerson = -1;
    v2->_redemptionType = PKDemoRewardsRedemptionType();
  }
  return v3;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)demoMerchant
{
  return self->_demoMerchant;
}

- (void)setDemoMerchant:(int64_t)a3
{
  self->_demoMerchant = a3;
}

- (int64_t)demoPerson
{
  return self->_demoPerson;
}

- (void)setDemoPerson:(int64_t)a3
{
  self->_demoPerson = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (unint64_t)redemptionType
{
  return self->_redemptionType;
}

- (void)setRedemptionType:(unint64_t)a3
{
  self->_redemptionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
