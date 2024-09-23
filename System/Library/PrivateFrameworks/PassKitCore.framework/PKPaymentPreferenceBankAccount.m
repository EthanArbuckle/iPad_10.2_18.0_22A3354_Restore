@implementation PKPaymentPreferenceBankAccount

- (NSArray)bankAccounts
{
  return self->_bankAccounts;
}

- (void)setBankAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_bankAccounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankAccounts, 0);
}

@end
