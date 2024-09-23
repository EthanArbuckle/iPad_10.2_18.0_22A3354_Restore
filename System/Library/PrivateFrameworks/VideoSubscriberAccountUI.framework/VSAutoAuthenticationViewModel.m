@implementation VSAutoAuthenticationViewModel

- (VSAutoAuthenticationViewModel)init
{
  VSAutoAuthenticationViewModel *v2;
  VSAutoAuthenticationViewModel *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSAutoAuthenticationViewModel;
  v2 = -[VSCuratedViewModel init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VSCuratedViewModel setBeginValidationButtonEnabled:](v2, "setBeginValidationButtonEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSCuratedViewModel setBeginValidationButtonTitle:](v3, "setBeginValidationButtonTitle:", v5);

  }
  return v3;
}

- (void)didSelectManualSignInButton
{
  id v3;

  -[VSAutoAuthenticationViewModel delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoAuthenticationViewModelDidManualSignInButton:", self);

}

- (void)configureWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[VSViewModel identityProvider](self, "identityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewModel setTitle:](self, "setTitle:", v7);

  v8.receiver = self;
  v8.super_class = (Class)VSAutoAuthenticationViewModel;
  -[VSCuratedViewModel configureWithRequest:](&v8, sel_configureWithRequest_, v4);

}

- (VSAutoAuthenticationViewModelDelegate)delegate
{
  return (VSAutoAuthenticationViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)messageTitle
{
  return self->_messageTitle;
}

- (void)setMessageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)manualSignInTitle
{
  return self->_manualSignInTitle;
}

- (void)setManualSignInTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSString)manualSignInButtonText
{
  return self->_manualSignInButtonText;
}

- (void)setManualSignInButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manualSignInButtonText, 0);
  objc_storeStrong((id *)&self->_manualSignInTitle, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_messageTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
