@implementation UIKeyboardCandidateViewConfigurationPhoneBarLandscapeWithBottomPadding

- (id)extendedScrolledState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarLandscapeWithBottomPadding;
  -[UIKeyboardCandidateViewConfigurationPhoneBarLandscape extendedScrolledState](&v5, sel_extendedScrolledState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortControlPadding:", 0.0, 19.0, 20.0, 19.0);

  return v2;
}

@end
