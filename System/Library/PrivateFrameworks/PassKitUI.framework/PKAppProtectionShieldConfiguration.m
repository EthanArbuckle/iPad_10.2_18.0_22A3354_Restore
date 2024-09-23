@implementation PKAppProtectionShieldConfiguration

- (PKAppProtectionShieldConfiguration)init
{
  PKAppProtectionShieldConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAppProtectionShieldConfiguration;
  result = -[PKAppProtectionShieldConfiguration init](&v3, sel_init);
  if (result)
    result->_showAuthOnAppear = 1;
  return result;
}

- (PKAppProtectionShieldViewControllerDelegate)delegate
{
  return (PKAppProtectionShieldViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)showDismiss
{
  return self->_showDismiss;
}

- (void)setShowDismiss:(BOOL)a3
{
  self->_showDismiss = a3;
}

- (BOOL)showAuthOnAppear
{
  return self->_showAuthOnAppear;
}

- (void)setShowAuthOnAppear:(BOOL)a3
{
  self->_showAuthOnAppear = a3;
}

- (unint64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(unint64_t)a3
{
  self->_shieldType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
