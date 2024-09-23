@implementation PKDashboardTransactionReceiptItem

+ (id)identifier
{
  return CFSTR("receipt");
}

- (PKTransactionReceipt)receipt
{
  return self->_receipt;
}

- (void)setReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_receipt, a3);
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (void)setAccountUserCollection:(id)a3
{
  objc_storeStrong((id *)&self->_accountUserCollection, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_receipt, 0);
}

@end
