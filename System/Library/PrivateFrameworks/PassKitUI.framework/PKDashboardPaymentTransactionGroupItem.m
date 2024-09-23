@implementation PKDashboardPaymentTransactionGroupItem

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = PKEqualObjects();
  else
    v4 = 0;

  return v4;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_group);
  v4 = PKCombinedHash();

  return v4;
}

+ (id)identifier
{
  return CFSTR("transactionGroup");
}

- (PKPaymentTransactionGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (PKTransactionSourceCollection)transactionSourceCollection
{
  return self->_transactionSourceCollection;
}

- (void)setTransactionSourceCollection:(id)a3
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, a3);
}

- (PKFamilyMemberCollection)familyCollection
{
  return self->_familyCollection;
}

- (void)setFamilyCollection:(id)a3
{
  objc_storeStrong((id *)&self->_familyCollection, a3);
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

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
