@implementation UIKeyboardCandidateViewConfigurationHandwriting

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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardCandidateViewConfigurationHandwriting;
  -[UIKeyboardCandidateViewConfiguration initialState](&v20, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);

  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellBackgroundColor:", 0);

  objc_msgSend(v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGridBackgroundColor:", 0);

  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSingleSlottedCellMargin:", 0.0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 4.0, 4.0, 42.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightEdgeSeparatorImage:", v9);

  objc_msgSend(v3, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setArrowButtonSeparatorImage:", 0);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pocketShadowImageForDarkKeyboard:fadesToBottom:drawShadow:topPadding:bottomPadding:height:", -[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"), 0, 0, 6.0, 4.0, 42.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSlottedCellSeparatorImage:", v13);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "highlightedBarCellBackgroundImageWithColor:insets:", v16, 2.0, 2.0, 2.0, 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setHighlightedCellBackgroundImage:", v17);

  return v3;
}

@end
