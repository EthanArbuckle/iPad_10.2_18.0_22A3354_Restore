@implementation UIKeyboardCandidateViewConfigurationPadInlineLiveConversionZhuyin

- (id)initialState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardCandidateViewConfigurationPadInlineLiveConversionZhuyin;
  -[UIKeyboardCandidateViewConfigurationPadInlineLiveConversion initialState](&v8, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlternativeTextAlignment:", 2);

  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlternativeTextFont:", v4);

  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableSwitchingSortingMethodByTabKey:", 0);

  return v2;
}

@end
