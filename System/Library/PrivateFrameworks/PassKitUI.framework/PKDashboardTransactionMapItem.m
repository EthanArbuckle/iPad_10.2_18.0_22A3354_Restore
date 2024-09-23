@implementation PKDashboardTransactionMapItem

+ (id)identifier
{
  return CFSTR("map");
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end
