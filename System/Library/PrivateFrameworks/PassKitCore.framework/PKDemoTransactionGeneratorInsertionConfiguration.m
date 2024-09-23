@implementation PKDemoTransactionGeneratorInsertionConfiguration

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int64_t)a3
{
  self->_accountType = a3;
}

- (NSString)transactionSourceIdentifier
{
  return self->_transactionSourceIdentifier;
}

- (void)setTransactionSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKPaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
  objc_storeStrong((id *)&self->_accountUser, a3);
}

- (unint64_t)codingType
{
  return self->_codingType;
}

- (void)setCodingType:(unint64_t)a3
{
  self->_codingType = a3;
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)accountEvents
{
  return self->_accountEvents;
}

- (void)setAccountEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountEvents, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_transactionSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
