@implementation UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 62.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)contentMargin
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIEdgeInsets result;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet;
    -[UIInterfaceActionConcreteVisualStyle_iOSSheet contentMargin](&v9, sel_contentMargin);
  }
  else
  {
    v6 = 23.0;
    v5 = 12.0;
    v7 = 12.0;
    v8 = 23.0;
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 12.0;
}

- (double)verticalImageContentSpacing
{
  return 12.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (objc_msgSend(a3, "isHighlighted"))
    return -[_UIAlertControlleriOSHighlightedBackgroundView initWithStyle:]([_UIAlertControlleriOSHighlightedBackgroundView alloc], "initWithStyle:", 0);
  else
    return 0;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  _UIDimmingKnockoutBackdropView *inlineBackgroundView;
  _UIDimmingKnockoutBackdropView *v5;
  _UIDimmingKnockoutBackdropView *v6;

  inlineBackgroundView = self->_inlineBackgroundView;
  if (!inlineBackgroundView)
  {
    v5 = -[_UIDimmingKnockoutBackdropView initWithStyle:]([_UIDimmingKnockoutBackdropView alloc], "initWithStyle:", 2);
    v6 = self->_inlineBackgroundView;
    self->_inlineBackgroundView = v5;

    inlineBackgroundView = self->_inlineBackgroundView;
  }
  return inlineBackgroundView;
}

- (double)_actionTitleFontSize
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
  v11[0] = &unk_1E1A95560;
  v11[1] = &unk_1E1A95560;
  v10[2] = CFSTR("UICTContentSizeCategoryM");
  v10[3] = CFSTR("UICTContentSizeCategoryL");
  v11[2] = &unk_1E1A95560;
  v11[3] = &unk_1E1A95560;
  v10[4] = CFSTR("UICTContentSizeCategoryXL");
  v10[5] = CFSTR("UICTContentSizeCategoryXXL");
  v11[4] = &unk_1E1A954E0;
  v11[5] = &unk_1E1A95570;
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
    v8 = 22.0;
  }

  return v8;
}

- (id)_regularActionFont
{
  -[UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet _actionTitleFontSize](self, "_actionTitleFontSize");
  return (id)objc_msgSend(off_1E167A828, "systemFontOfSize:");
}

- (id)_preferredActionFont
{
  -[UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet _actionTitleFontSize](self, "_actionTitleFontSize");
  return (id)objc_msgSend(off_1E167A828, "boldSystemFontOfSize:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineBackgroundView, 0);
}

@end
