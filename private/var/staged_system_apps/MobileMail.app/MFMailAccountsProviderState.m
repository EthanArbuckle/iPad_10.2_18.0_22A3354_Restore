@implementation MFMailAccountsProviderState

- (id)initFromProvider:(id)a3
{
  id v4;
  MFMailAccountsProviderState *v5;
  void *v6;
  NSSet *v7;
  NSSet *displayedAccountsIdentifiers;
  void *v9;
  NSSet *v10;
  NSSet *focusedAccountsIdentifiers;
  void *v12;
  NSArray *v13;
  NSArray *mailAccounts;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFMailAccountsProviderState;
  v5 = -[MFMailAccountsProviderState init](&v16, "init");
  if (v5)
  {
    v5->_numberOfActiveAccounts = (unint64_t)objc_msgSend(v4, "numberOfActiveAccounts");
    v5->_numberOfInactiveAccounts = (unint64_t)objc_msgSend(v4, "numberOfInactiveAccounts");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_displayedAccountsIdentifiers"));
    v7 = (NSSet *)objc_msgSend(v6, "copy");
    displayedAccountsIdentifiers = v5->_displayedAccountsIdentifiers;
    v5->_displayedAccountsIdentifiers = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_focusedAccountsIdentifiers"));
    v10 = (NSSet *)objc_msgSend(v9, "copy");
    focusedAccountsIdentifiers = v5->_focusedAccountsIdentifiers;
    v5->_focusedAccountsIdentifiers = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailAccounts"));
    v13 = (NSArray *)objc_msgSend(v12, "copy");
    mailAccounts = v5->_mailAccounts;
    v5->_mailAccounts = v13;

  }
  return v5;
}

- (unint64_t)numberOfInactiveAccounts
{
  return self->_numberOfInactiveAccounts;
}

- (unint64_t)numberOfActiveAccounts
{
  return self->_numberOfActiveAccounts;
}

- (NSArray)mailAccounts
{
  return self->_mailAccounts;
}

- (NSSet)displayedAccountsIdentifiers
{
  return self->_displayedAccountsIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailAccounts, 0);
  objc_storeStrong((id *)&self->_focusedAccountsIdentifiers, 0);
  objc_storeStrong((id *)&self->_displayedAccountsIdentifiers, 0);
}

- (NSSet)focusedAccountsIdentifiers
{
  return self->_focusedAccountsIdentifiers;
}

- (void)setFocusedAccountsIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
