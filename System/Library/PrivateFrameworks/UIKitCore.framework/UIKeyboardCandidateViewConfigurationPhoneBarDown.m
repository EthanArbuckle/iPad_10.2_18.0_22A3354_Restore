@implementation UIKeyboardCandidateViewConfigurationPhoneBarDown

- (id)initialState
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarDown;
  -[UIKeyboardCandidateViewConfigurationPhoneBar initialState](&v18, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArrowButtonDirection:", 1);
  objc_msgSend(v2, "setSortControlPosition:", 4);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowHeight");
  v5 = v4;
  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGridPadding:", 0.0, 1.0, 0.0, v5);

  objc_msgSend(v2, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowHeight");
  v9 = v8;
  objc_msgSend(v2, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGridLinePadding:", 0.0, 0.0, 0.0, v9);

  objc_msgSend(v2, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowHeight");
  v13 = v12;
  objc_msgSend(v2, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortControlPadding:", 0.0, 0.0, 0.0, v13);

  objc_msgSend(v2, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setGridLineOffset:", 0.0, 4.0);

  objc_msgSend(v2, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDoNotClipToBounds:", 1);

  return v2;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneBarDown;
  -[UIKeyboardCandidateViewConfigurationPhoneBar extendedState](&v12, sel_extendedState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setArrowButtonDirection:", 0);
  objc_msgSend(v3, "setInlineTextViewPosition:", 0);
  objc_msgSend(v3, "setArrowButtonPosition:", 7);
  objc_msgSend(v3, "setSortControlPosition:", 4);
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtraCellPadding:", 8.0, 0.0, 0.0, 0.0);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasBackdrop:", objc_msgSend(v5, "_isBackdropVisible"));

  objc_msgSend(v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDoNotClipToBounds:", 1);

  +[UIKeyboardCandidateViewImageRenderer sharedImageRenderer](UIKeyboardCandidateViewImageRenderer, "sharedImageRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKeyboardCandidateViewConfiguration highlightedBackgroundColor](self, "highlightedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightedBarCellBackgroundImageWithColor:insets:", v8, 8.0, 2.0, 0.0, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHighlightedCellBackgroundImage:", v9);

  return v3;
}

- (id)extendedScrolledState
{
  return 0;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (BOOL)shouldResizeKeyboardBackdrop
{
  return 0;
}

- (BOOL)willCoverKeyboardLayout
{
  return 1;
}

- (BOOL)allowsPullDownGesture
{
  return 1;
}

@end
