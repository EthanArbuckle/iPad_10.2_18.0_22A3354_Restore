@implementation UIKeyboardCandidateViewConfigurationPhoneBar

- (id)initialState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBar;
  -[UIKeyboardCandidateViewConfiguration initialState](&v25, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortControlPosition:", 5);
  objc_msgSend(v3, "setDisambiguationGridPosition:", 2);
  objc_msgSend(v3, "setArrowButtonPosition:", 7);
  objc_msgSend(v3, "setArrowButtonDirection:", 0);
  objc_msgSend(v3, "setBorders:", 0);
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_isBackdropVisible") & 1) != 0)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInputTraits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "keyboardAppearance");

    if (v7 != 13)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(v3, "setHasBackdrop:", 0);
  objc_msgSend(v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArrowButtonBackgroundHidden:", 1);

LABEL_6:
  objc_msgSend(v3, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExtraCellPadding:", 8.0, 0.0, 0.0, 0.0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 1, 6.0, 4.0, 42.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setArrowButtonSeparatorImage:", v11);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 6.0, 4.0, 42.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSlottedCellSeparatorImage:", v14);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "highlightedBarCellBackgroundImageWithColor:insets:", v17, 8.0, 2.0, 0.0, 2.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHighlightedCellBackgroundImage:", v18);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "highlightedBarCellBackgroundImageWithColor:insets:", v21, 4.0, 3.0, 4.0, 3.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disambiguationStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHighlightedCellBackgroundImage:", v22);

  return v3;
}

- (id)extendedState
{
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

  -[UIKeyboardCandidateViewConfigurationPhoneBar initialState](self, "initialState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryGridRowType:", 1);
  objc_msgSend(v3, "setArrowButtonDirection:", 1);
  objc_msgSend(v3, "setInlineTextViewPosition:", 1);
  objc_msgSend(v3, "setSortControlPosition:", 2);
  objc_msgSend(v3, "setBorders:", 0);
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColumnsCount:", 6);

  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtraCellPadding:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setArrowButtonSeparatorImage:", 0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightedBarCellBackgroundImageWithColor:insets:", v8, 4.0, 2.0, 4.0, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHighlightedCellBackgroundImage:", v9);

  +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", UIKBGetNamedColor(CFSTR("UIKBColorBlack_Alpha8")));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGroupHeaderBackgroundColor:", v11);

  return v3;
}

- (id)extendedScrolledState
{
  void *v2;
  void *v3;

  -[UIKeyboardCandidateViewConfigurationPhoneBar extendedState](self, "extendedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsIndex:", 1);

  return v2;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 1;
}

- (BOOL)shouldUsePredictionViewSecureRenderTraits
{
  return 1;
}

@end
