@implementation UIKeyboardCandidateViewConfigurationPadInlineLiveConversion

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
  double v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardCandidateViewConfigurationPadInlineLiveConversion;
  -[UIKeyboardCandidateViewConfigurationPhoneInline initialState](&v36, sel_initialState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrimaryGridRowType:", 1);
  objc_msgSend(v3, "setArrowButtonPosition:", 4);
  objc_msgSend(v3, "setSortControlPosition:", 5);
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColumnsCount:", 1);

  objc_msgSend(v3, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCellTextAlignment:", 0);

  objc_msgSend(v3, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRowHeight:", 44.0);

  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMinimumCellPadding:", 24.0);

  objc_msgSend(v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHighlightedRowBackgroundColor:", 0);

  if (_os_feature_enabled_impl())
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHighlightedBackgroundColor:", v9);

    if (-[UIKeyboardCandidateViewConfiguration darkKeyboard](self, "darkKeyboard"))
      +[UIColor clearColor](UIColor, "clearColor");
    else
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.96, 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGridBackgroundColor:", v18);

    objc_msgSend(v3, "style");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCornerRadius:", 14.0);

    objc_msgSend(v3, "style");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRoundsArrowButtonEdge:", 0);

    objc_msgSend(v3, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1.0;
  }
  else
  {
    +[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHighlightedBackgroundColor:", v11);

    +[UIColor clearColor](UIColor, "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGridBackgroundColor:", v13);

    objc_msgSend(v3, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 43.0;
  }
  objc_msgSend(v15, "setArrowButtonHeight:", v17);

  objc_msgSend(v3, "style");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setHighlightedCellBackgroundImage:", 0);

  objc_msgSend(v3, "style");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setGridPadding:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v3, "style");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDontSelectLastItemByBackwardMoving:", 1);

  objc_msgSend(v3, "style");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setShowOneMoreCandidate:", 1);

  objc_msgSend(v3, "style");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDisableSwitchingSortingMethodByTabKey:", 1);

  +[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTransliterationCandidateBackgroundColor:", v27);

  objc_msgSend(v3, "style");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidesPartialCandidates:", 1);

  objc_msgSend(v3, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSkipInlineCandidate:", 1);

  objc_msgSend(v3, "style");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMinimumNumberOfCandidates:", 2);

  objc_msgSend(v3, "style");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFillGridWithLines:", 1);

  objc_msgSend(v3, "style");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setScrollDisabled:", 0);

  objc_msgSend(v3, "style");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAllowCandidateGridExpanding:", 1);

  objc_msgSend(v3, "setArrowButtonDirection:", 1);
  return v3;
}

- (id)extendedState
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  -[UIKeyboardCandidateViewConfigurationPadInlineLiveConversion initialState](self, "initialState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setArrowButtonPosition:", 0);
  objc_msgSend(v2, "setSortControlPosition:", 2);
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowHeight");
  objc_msgSend(v2, "setAdditionalHeight:", v4 * 5.0 + -1.0);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScrollDisabled:", 0);

  objc_msgSend(v2, "setArrowButtonDirection:", 0);
  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidesPartialCandidates:", 0);

  objc_msgSend(v2, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowCandidateGridExpanding:", 0);

  return v2;
}

- (CGSize)preferredInlineFloatingViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 250.0;
  v3 = 220.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)inlineFloatingViewAdjustMode
{
  return 1;
}

@end
