@implementation UIKeyboardCandidateViewConfigurationPadVerticalInlineZhuyin

- (id)initialState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardCandidateViewConfigurationPadVerticalInlineZhuyin;
  -[UIKeyboardCandidateViewConfigurationPhoneVerticalInline initialState](&v7, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlternativeTextAlignment:", 2);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternativeTextFont:", v4);

  return v2;
}

@end
