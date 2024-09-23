@implementation UIInterfaceActionConcreteVisualStyle_iOSSheet

- (UIEdgeInsets)contentMargin
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  UIEdgeInsets result;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scaledValueForValue:", 8.0);
    v7 = v6;

    v8 = 16.0;
    v9 = v7;
    v10 = 16.0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIInterfaceActionConcreteVisualStyle_iOSSheet;
    -[UIInterfaceActionConcreteVisualStyle_iOS contentMargin](&v13, sel_contentMargin);
    v7 = v11;
  }
  v12 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v12;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 57.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)actionSectionSpacing
{
  return 8.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4;
  void *v5;
  _UIAlertControlleriOSActionSheetCancelBackgroundView *v6;
  _UIAlertControlleriOSActionSheetCancelBackgroundView *v7;
  void *v8;
  _UIAlertControlleriOSActionSheetCancelBackgroundView *v9;
  _QWORD v11[4];
  _UIAlertControlleriOSActionSheetCancelBackgroundView *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type") == 1)
  {
    v6 = objc_alloc_init(_UIAlertControlleriOSActionSheetCancelBackgroundView);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __85__UIInterfaceActionConcreteVisualStyle_iOSSheet_newActionBackgroundViewForViewState___block_invoke;
    v11[3] = &unk_1E16B1B50;
    v7 = v6;
    v12 = v7;
    v13 = v4;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v11);
    v8 = v13;
    v9 = v7;

  }
  else if (objc_msgSend(v4, "isHighlighted"))
  {
    -[UIInterfaceActionConcreteVisualStyle_iOS _highlightedView](self, "_highlightedView");
    v9 = (_UIAlertControlleriOSActionSheetCancelBackgroundView *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)_systemFontSize
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  _QWORD v10[11];
  _QWORD v11[12];

  v11[11] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("UICTContentSizeCategoryXS");
  v10[1] = CFSTR("UICTContentSizeCategoryS");
  v11[0] = &unk_1E1A954E0;
  v11[1] = &unk_1E1A954E0;
  v10[2] = CFSTR("UICTContentSizeCategoryM");
  v10[3] = CFSTR("UICTContentSizeCategoryL");
  v11[2] = &unk_1E1A954E0;
  v11[3] = &unk_1E1A954E0;
  v10[4] = CFSTR("UICTContentSizeCategoryXL");
  v10[5] = CFSTR("UICTContentSizeCategoryXXL");
  v11[4] = &unk_1E1A954F0;
  v11[5] = &unk_1E1A95500;
  v10[6] = CFSTR("UICTContentSizeCategoryAccessibilityM");
  v10[7] = CFSTR("UICTContentSizeCategoryAccessibilityL");
  v11[6] = &unk_1E1A95510;
  v11[7] = &unk_1E1A95520;
  v10[8] = CFSTR("UICTContentSizeCategoryAccessibilityXL");
  v10[9] = CFSTR("UICTContentSizeCategoryAccessibilityXXL");
  v11[8] = &unk_1E1A95530;
  v11[9] = &unk_1E1A95540;
  v10[10] = CFSTR("UICTContentSizeCategoryAccessibilityXXXL");
  v11[10] = &unk_1E1A95550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)UIApp;
  v4 = v2;
  objc_msgSend(v3, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    v8 = v7;
  }
  else
  {
    v8 = 24.0;
  }

  return v8;
}

- (id)_regularActionFont
{
  -[UIInterfaceActionConcreteVisualStyle_iOSSheet _systemFontSize](self, "_systemFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (id)_preferredActionFont
{
  -[UIInterfaceActionConcreteVisualStyle_iOSSheet _systemFontSize](self, "_systemFontSize");
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
}

@end
