@implementation _UIStepperButton

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (id)_systemDefaultFocusGroupIdentifier
{
  void *v3;
  char v4;
  void *v5;
  objc_super v7;

  -[UIView _focusBehavior](self, "_focusBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusGroupContainmentBehavior");

  if ((v4 & 0x10) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIStepperButton;
    -[UIControl _systemDefaultFocusGroupIdentifier](&v7, sel__systemDefaultFocusGroupIdentifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isLeft
{
  return self->_left;
}

- (void)setLeft:(BOOL)a3
{
  self->_left = a3;
}

@end
