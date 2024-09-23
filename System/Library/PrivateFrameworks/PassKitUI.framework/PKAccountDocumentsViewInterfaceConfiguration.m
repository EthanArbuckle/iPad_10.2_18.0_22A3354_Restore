@implementation PKAccountDocumentsViewInterfaceConfiguration

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accounts, 0);
}

@end
