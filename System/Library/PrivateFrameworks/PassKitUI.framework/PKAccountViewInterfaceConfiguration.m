@implementation PKAccountViewInterfaceConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  PKAccountViewInterfaceConfiguration *v5;
  uint64_t v6;
  PKAccount *account;
  uint64_t v8;
  NSDateComponents *rewardsDateComponents;

  v5 = -[PKAccountViewInterfaceConfiguration init](+[PKAccountViewInterfaceConfiguration allocWithZone:](PKAccountViewInterfaceConfiguration, "allocWithZone:"), "init");
  v6 = -[PKAccount copyWithZone:](self->_account, "copyWithZone:", a3);
  account = v5->_account;
  v5->_account = (PKAccount *)v6;

  v5->_isNewAccount = self->_isNewAccount;
  v5->_viewStyle = self->_viewStyle;
  v5->_destination = self->_destination;
  v8 = -[NSDateComponents copyWithZone:](self->_rewardsDateComponents, "copyWithZone:", a3);
  rewardsDateComponents = v5->_rewardsDateComponents;
  v5->_rewardsDateComponents = (NSDateComponents *)v8;

  objc_storeStrong((id *)&v5->_transaction, self->_transaction);
  objc_storeStrong((id *)&v5->_cashbackPass, self->_cashbackPass);
  objc_storeStrong((id *)&v5->_fundingSource, self->_fundingSource);
  return v5;
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (BOOL)isNewAccount
{
  return self->_isNewAccount;
}

- (void)setIsNewAccount:(BOOL)a3
{
  self->_isNewAccount = a3;
}

- (unint64_t)viewStyle
{
  return self->_viewStyle;
}

- (void)setViewStyle:(unint64_t)a3
{
  self->_viewStyle = a3;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_destination = a3;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (NSDateComponents)rewardsDateComponents
{
  return self->_rewardsDateComponents;
}

- (void)setRewardsDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_rewardsDateComponents, a3);
}

- (PKPaymentPass)cashbackPass
{
  return self->_cashbackPass;
}

- (void)setCashbackPass:(id)a3
{
  objc_storeStrong((id *)&self->_cashbackPass, a3);
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
  objc_storeStrong((id *)&self->_fundingSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_cashbackPass, 0);
  objc_storeStrong((id *)&self->_rewardsDateComponents, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
