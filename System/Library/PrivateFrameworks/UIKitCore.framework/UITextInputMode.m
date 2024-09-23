@implementation UITextInputMode

- (NSString)primaryLanguage
{
  void *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UITextInputMode primaryLanguage](self, "primaryLanguage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (UITextInputMode)currentInputMode
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputMode *)v3;
}

+ (NSArray)activeInputModes
{
  void *v2;
  void *v3;

  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITextInputMode)initWithCoder:(id)a3
{
  id v4;
  UIKeyboardInputMode *v5;

  v4 = a3;

  v5 = -[UIKeyboardInputMode initWithCoder:]([UIKeyboardInputMode alloc], "initWithCoder:", v4);
  return &v5->super;
}

@end
