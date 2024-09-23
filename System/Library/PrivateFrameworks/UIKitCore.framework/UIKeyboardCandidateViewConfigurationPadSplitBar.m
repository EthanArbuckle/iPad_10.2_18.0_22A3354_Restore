@implementation UIKeyboardCandidateViewConfigurationPadSplitBar

- (id)initialState
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)UIKeyboardCandidateViewConfigurationPadSplitBar;
  -[UIKeyboardCandidateViewConfigurationPadBar initialState](&v20, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArrowButtonPosition:", 2);
  objc_msgSend(v2, "setArrowButtonDirection:", 1);
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rivenSizeFactor:", 40.0);
  v6 = v5;
  objc_msgSend(v2, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumCellWidth:", v6);

  v8 = UIKBCornerRadius();
  objc_msgSend(v2, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

  objc_msgSend(v2, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMaskedCorners:", 10);

  objc_msgSend(v2, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortControlPadding:", 0.0, 11.0, 0.0, 11.0);

  objc_msgSend(v2, "style");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightEdgeSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setArrowButtonSeparatorImage:", 0);

  objc_msgSend(v2, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowHeight");
  v17 = v16;
  objc_msgSend(v2, "style");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setGridPadding:", 0.0, 5.0, 0.0, v17);

  return v2;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateViewConfigurationPadSplitBar;
  -[UIKeyboardCandidateViewConfigurationPadBar extendedState](&v6, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArrowButtonDirection:", 0);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColumnsCount:", 4);

  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaskedCorners:", 10);

  return v2;
}

- (double)candidateDefaultFontSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferencesActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rivenSizeFactor:", 22.0);
  v5 = v4;

  return v5;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (BOOL)shouldUsePredictionViewSecureRenderTraits
{
  return 0;
}

- (BOOL)shouldAlwaysShowSortControl
{
  return 0;
}

@end
