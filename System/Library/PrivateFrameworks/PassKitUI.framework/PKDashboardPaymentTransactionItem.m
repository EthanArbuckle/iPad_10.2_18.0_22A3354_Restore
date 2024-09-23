@implementation PKDashboardPaymentTransactionItem

- (PKDashboardPaymentTransactionItem)initWithTransactionSourceCollection:(id)a3 familyCollection:(id)a4 transaction:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKDashboardPaymentTransactionItem *v18;
  PKDashboardPaymentTransactionItem *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKDashboardPaymentTransactionItem;
  v18 = -[PKDashboardPaymentTransactionItem init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_transaction, a5);
    objc_storeStrong((id *)&v19->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v19->_familyCollection, a4);
    objc_storeStrong((id *)&v19->_account, a6);
    objc_storeStrong((id *)&v19->_accountUserCollection, a7);
    objc_storeStrong((id *)&v19->_bankConnectInstitution, a8);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPaymentTransaction identifier](self->_transaction, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[2], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PKEqualObjects();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPaymentTransaction identifier](self->_transaction, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", v4);

  v5 = PKCombinedHash();
  return v5;
}

+ (id)identifier
{
  return CFSTR("transaction");
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
}

- (PKTransactionSource)secondaryTransactionSource
{
  return self->_secondaryTransactionSource;
}

- (void)setSecondaryTransactionSource:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTransactionSource, a3);
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

- (FKInstitution)bankConnectInstitution
{
  return self->_bankConnectInstitution;
}

- (void)setBankConnectInstitution:(id)a3
{
  objc_storeStrong((id *)&self->_bankConnectInstitution, a3);
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isFeaturedTransaction
{
  return self->_isFeaturedTransaction;
}

- (void)setIsFeaturedTransaction:(BOOL)a3
{
  self->_isFeaturedTransaction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_bankConnectInstitution, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_secondaryTransactionSource, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end
