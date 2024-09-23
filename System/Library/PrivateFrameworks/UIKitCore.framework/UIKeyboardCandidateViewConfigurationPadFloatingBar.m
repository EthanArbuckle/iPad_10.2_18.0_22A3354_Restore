@implementation UIKeyboardCandidateViewConfigurationPadFloatingBar

- (id)initialState
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIKeyboardCandidateViewConfigurationPadFloatingBar;
  -[UIKeyboardCandidateViewConfigurationPhoneBarDown initialState](&v15, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHasBackdrop:", 1);
  +[UIKeyboardPopoverContainer cornerRadius](UIKeyboardPopoverContainer, "cornerRadius");
  v4 = v3;
  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMaskedCorners:", 3);

  objc_msgSend(v2, "setBorders:", 10);
  +[UIKeyboardPopoverContainer borderColor](UIKeyboardPopoverContainer, "borderColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineColor:", v7);

  objc_msgSend(v2, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDoNotClipToBounds:", 1);

  objc_msgSend(v2, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowHeight");
  v12 = v11;
  objc_msgSend(v2, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setGridPadding:", 0.0, 3.0, 0.0, v12);

  return v2;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateViewConfigurationPadFloatingBar;
  -[UIKeyboardCandidateViewConfigurationPhoneBarDown extendedState](&v13, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHasBackdrop:", 1);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridBackgroundColor:", v3);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColumnsCount:", 4);

  +[UIKeyboardPopoverContainer cornerRadius](UIKeyboardPopoverContainer, "cornerRadius");
  v7 = v6;
  objc_msgSend(v2, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerRadius:", v7);

  objc_msgSend(v2, "setBorders:", 10);
  +[UIKeyboardPopoverContainer borderColor](UIKeyboardPopoverContainer, "borderColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineColor:", v9);

  objc_msgSend(v2, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDoNotClipToBounds:", 1);

  return v2;
}

- (BOOL)allowsPullDownGesture
{
  return 1;
}

- (BOOL)willCoverKeyboardLayout
{
  return 1;
}

@end
