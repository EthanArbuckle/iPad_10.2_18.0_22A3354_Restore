@implementation _UITextFieldVisualStyle_iOS

- (id)defaultTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)placeholderColor
{
  return +[UIColor placeholderTextColor](UIColor, "placeholderTextColor");
}

- (id)parentViewForTextContentView
{
  void *v2;
  void *v3;

  -[_UITextFieldVisualStyle styleSubject](self, "styleSubject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultTextColorForKeyboardAppearance
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)defaultFocusedTextColor
{
  return 0;
}

- (BOOL)textShouldUseVibrancy
{
  return 0;
}

@end
