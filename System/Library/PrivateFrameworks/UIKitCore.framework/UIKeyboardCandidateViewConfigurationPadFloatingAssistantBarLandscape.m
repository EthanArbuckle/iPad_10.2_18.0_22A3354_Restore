@implementation UIKeyboardCandidateViewConfigurationPadFloatingAssistantBarLandscape

- (id)initialState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardCandidateViewConfigurationPadFloatingAssistantBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPadBarLandscape initialState](&v17, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHasBackdrop:", 0);
  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", 10.0);

  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtraCellPadding:", 0.0, 0.0, 0.0, 0.0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "edgeMaskImageForRightSide:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftEdgeMaskImage:", v8);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "edgeMaskImageForRightSide:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRightEdgeMaskImage:", v11);

  objc_msgSend(v2, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setArrowButtonSeparatorImage:", 0);

  return v2;
}

@end
