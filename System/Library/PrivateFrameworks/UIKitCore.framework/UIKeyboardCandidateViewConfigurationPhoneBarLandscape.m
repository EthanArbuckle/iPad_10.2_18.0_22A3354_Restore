@implementation UIKeyboardCandidateViewConfigurationPhoneBarLandscape

- (id)initialState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPhoneBar initialState](&v12, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBorders:", 0);
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 4.0);

  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGridMaskedCorners:", 15);

  objc_msgSend(v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExtraCellPadding:", 2.0, 0.0, 0.0, 0.0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightedBarCellBackgroundImageWithColor:insets:", v8, 2.0, 2.0, 0.0, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHighlightedCellBackgroundImage:", v9);

  return v3;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPhoneBar extendedState](&v7, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortControlPosition:", 3);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColumnsCount:", 10);

  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortControlPadding:", 0.0, 0.0, 6.0, 0.0);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHasBackdrop:", objc_msgSend(v5, "_isBackdropVisible"));

  return v2;
}

- (id)extendedScrolledState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarLandscape;
  -[UIKeyboardCandidateViewConfigurationPhoneBar extendedScrolledState](&v5, sel_extendedScrolledState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsIndex:", 0);

  return v2;
}

@end
