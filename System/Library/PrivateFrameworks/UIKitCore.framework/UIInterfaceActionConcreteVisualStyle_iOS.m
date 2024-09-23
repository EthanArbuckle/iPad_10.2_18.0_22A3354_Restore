@implementation UIInterfaceActionConcreteVisualStyle_iOS

- (id)defaultScreen
{
  return +[UIScreen mainScreen](UIScreen, "mainScreen");
}

- (double)contentCornerRadius
{
  return 13.0;
}

- (UIEdgeInsets)contentMargin
{
  NSString *v2;
  _BOOL4 IsAccessibilityCategory;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (IsAccessibilityCategory)
  {
    +[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", CFSTR("UICTFontTextStyleBody"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scaledValueForValue:", 11.0);
    v6 = v5;

    v7 = 16.0;
    v8 = 16.0;
  }
  else
  {
    v6 = 12.0;
    v7 = 12.0;
    v8 = 12.0;
  }
  v9 = v6;
  v10 = v6;
  result.right = v8;
  result.bottom = v10;
  result.left = v7;
  result.top = v9;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 12.0;
}

- (double)verticalImageContentSpacing
{
  return 6.0;
}

- (BOOL)selectionFeedbackEnabled
{
  return 1;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  return objc_msgSend((id)UIApp, "_supportsIndirectInputEvents");
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  if (objc_msgSend(a3, "isPreferred"))
    -[UIInterfaceActionConcreteVisualStyle_iOS _preferredActionFont](self, "_preferredActionFont");
  else
    -[UIInterfaceActionConcreteVisualStyle_iOS _regularActionFont](self, "_regularActionFont");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 < 2)
  {
LABEL_4:
    objc_msgSend(v3, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor systemBlueColor](UIColor, "systemBlueColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    v8 = v7;
    if (v4 == v8)
    {

    }
    else
    {
      v9 = v8;
      if (!v4 || !v8)
      {

        goto LABEL_13;
      }
      v10 = objc_msgSend(v4, "isEqual:", v8);

      if (!v10)
        goto LABEL_14;
    }
    +[UIColor _systemBlueColor2](UIColor, "_systemBlueColor2");
    v9 = v4;
    v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  if (v5 == 2)
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v5 == 100)
  {
    goto LABEL_4;
  }
LABEL_14:

  return v4;
}

- (id)_highlightedView
{
  return -[_UIAlertControlleriOSHighlightedBackgroundView initWithStyle:]([_UIAlertControlleriOSHighlightedBackgroundView alloc], "initWithStyle:", 0);
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (!objc_msgSend(a3, "isHighlighted"))
    return 0;
  -[UIInterfaceActionConcreteVisualStyle_iOS _highlightedView](self, "_highlightedView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return -[_UIDimmingKnockoutBackdropView initWithStyle:]([_UIDimmingKnockoutBackdropView alloc], "initWithStyle:", 0);
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_regularActionFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)_preferredActionFont
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

@end
