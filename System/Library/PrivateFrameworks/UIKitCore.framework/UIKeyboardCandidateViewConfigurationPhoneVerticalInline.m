@implementation UIKeyboardCandidateViewConfigurationPhoneVerticalInline

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneVerticalInline;
  -[UIKeyboardCandidateViewConfigurationPhoneInline initialState](&v11, sel_initialState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGridPadding:", 0.0, 0.0, 0.0, 0.0);

  objc_msgSend(v2, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScrollDisabled:", 0);

  objc_msgSend(v2, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlightedRowBackgroundColor:", 0);

  objc_msgSend(v2, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCellTextAlignment:", 0);

  objc_msgSend(v2, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColumnsCount:", 1);

  objc_msgSend(v2, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLayoutOrientation:", 1);

  objc_msgSend(v2, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFillGridWithLines:", 0);

  objc_msgSend(v2, "setSortControlPosition:", 2);
  objc_msgSend(v2, "setArrowButtonPosition:", 0);
  return v2;
}

- (id)extendedState
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardCandidateViewConfigurationPhoneVerticalInline;
  -[UIKeyboardCandidateViewConfigurationPhoneInline extendedState](&v4, sel_extendedState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdditionalHeight:", 0.0);
  return v2;
}

- (unint64_t)rowsToExtend
{
  return 0;
}

- (int)inlineFloatingViewAdjustMode
{
  return 1;
}

- (CGSize)preferredInlineFloatingViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 250.0;
  v3 = 205.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
