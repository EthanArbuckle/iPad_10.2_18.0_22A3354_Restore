@implementation VSViewModel

- (VSViewModel)init
{
  VSViewModel *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSViewModel;
  v2 = -[VSViewModel init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_userInterfaceStyle = objc_msgSend(v3, "userInterfaceStyle");

  }
  return v2;
}

- (void)configureWithRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "accountProviderAuthenticationToken");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VSViewModel setAuthenticationShare:](self, "setAuthenticationShare:", v4 != 0);

}

- (unint64_t)viewState
{
  return self->_viewState;
}

- (void)setViewState:(unint64_t)a3
{
  self->_viewState = a3;
}

- (BOOL)shouldPreValidate
{
  return self->_preValidate;
}

- (void)setPreValidate:(BOOL)a3
{
  self->_preValidate = a3;
}

- (BOOL)isInAuthenticationShareFlow
{
  return self->_authenticationShare;
}

- (void)setAuthenticationShare:(BOOL)a3
{
  self->_authenticationShare = a3;
}

- (unint64_t)validationState
{
  return self->_validationState;
}

- (void)setValidationState:(unint64_t)a3
{
  self->_validationState = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_identityProvider, a3);
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
