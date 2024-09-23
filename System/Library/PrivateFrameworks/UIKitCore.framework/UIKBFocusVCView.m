@implementation UIKBFocusVCView

- (BOOL)_isEligibleForFocusGivenAlpha
{
  objc_super v4;

  if (-[UIKBFocusVCView isEligibleForFocusWithZeroAlpha](self, "isEligibleForFocusWithZeroAlpha"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIKBFocusVCView;
  return -[UIView _isEligibleForFocusGivenAlpha](&v4, sel__isEligibleForFocusGivenAlpha);
}

- (id)preferredFocusedView
{
  void *v2;
  void *v3;

  -[UIView nextResponder](self, "nextResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIFocusEnvironmentPreferredFocusedView(v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEligibleForFocusWithZeroAlpha
{
  return self->_isEligibleForFocusWithZeroAlpha;
}

- (void)setIsEligibleForFocusWithZeroAlpha:(BOOL)a3
{
  self->_isEligibleForFocusWithZeroAlpha = a3;
}

@end
