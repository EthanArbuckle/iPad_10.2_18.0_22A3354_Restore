@implementation UIKeyboardCandidateViewConfigurationPadBar

- (id)arrowButtonSeparatorImage
{
  void *v3;
  void *v4;

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 1, 9.5, 9.5, 55.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgeSeparatorImage
{
  void *v3;
  void *v4;

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 9.5, 9.5, 55.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBar;
  -[UIKeyboardCandidateViewConfigurationPhoneBar initialState](&v30, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisambiguationGridPosition:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  +[UIColor clearColor](UIColor, "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArrowButtonBackgroundColor:", v6);

  +[UIColor clearColor](UIColor, "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGridBackgroundColor:", v8);

  +[UIColor clearColor](UIColor, "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortControlBackgroundColor:", v10);

  objc_msgSend(v3, "setHasBackdrop:", 1);
  objc_msgSend(v3, "setBorders:", 0);
  objc_msgSend(v3, "setSortControlPosition:", 0);
  objc_msgSend(v3, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumCellWidth:", 60.0);

  objc_msgSend(v3, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMinimumCellPadding:", 18.0);

  objc_msgSend(v3, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExtraCellPadding:", 8.0, 0.0, 8.0, 0.0);

  objc_msgSend(v3, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSingleSlottedCellMargin:", 0.0);

  -[UIKeyboardCandidateViewConfigurationPadBar edgeSeparatorImage](self, "edgeSeparatorImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeftEdgeSeparatorImage:", v16);

  -[UIKeyboardCandidateViewConfigurationPadBar edgeSeparatorImage](self, "edgeSeparatorImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRightEdgeSeparatorImage:", v18);

  -[UIKeyboardCandidateViewConfigurationPadBar arrowButtonSeparatorImage](self, "arrowButtonSeparatorImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setArrowButtonSeparatorImage:", v20);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 9.5, 9.5, 55.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSlottedCellSeparatorImage:", v23);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "highlightedBarCellBackgroundImageWithColor:insets:", v26, 8.0, 2.0, 6.0, 2.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setHighlightedCellBackgroundImage:", v27);

  return v3;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKeyboardCandidateViewConfigurationPadBar;
  -[UIKeyboardCandidateViewConfigurationPhoneBar extendedState](&v13, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortControlPosition:", 1);
  objc_msgSend(v2, "setInlineTextViewPosition:", 0);
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGridBackgroundColor:", v3);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColumnsCount:", 13);

  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRightEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArrowButtonSeparatorImage:", 0);

  v9 = UIKBCornerRadius();
  objc_msgSend(v2, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v9);

  objc_msgSend(v2, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMaskedCorners:", 3);

  return v2;
}

- (id)extendedScrolledState
{
  return 0;
}

- (double)candidateDefaultFontSize
{
  return 22.0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 4;
}

- (BOOL)shouldAlwaysShowSortControl
{
  return 1;
}

@end
