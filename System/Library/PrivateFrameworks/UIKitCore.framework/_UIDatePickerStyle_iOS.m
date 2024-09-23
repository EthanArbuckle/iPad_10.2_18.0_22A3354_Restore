@implementation _UIDatePickerStyle_iOS

- (id)createOverlayBackgroundView
{
  UIVisualEffectView *v3;
  void *v4;
  UIVisualEffectView *v5;
  void *v6;

  v3 = [UIVisualEffectView alloc];
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);

  -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
  -[UIVisualEffectView contentView](v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClipsToBounds:", 1);

  -[_UIDatePickerStyle_iOS overlayPlatterCornerRadius](self, "overlayPlatterCornerRadius");
  -[UIVisualEffectView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
  return v5;
}

- (void)addSubview:(id)a3 toOverlayBackgroundView:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "contentView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

}

- (CGSize)idealLayoutFittingSizeForDatePickerMode:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = 172.0;
  v4 = 218.0;
  v5 = 0.0;
  v6 = 320.0;
  if (a3 == 3)
  {
    v6 = 218.0;
    v5 = 172.0;
  }
  if (a3)
  {
    v4 = v6;
    v3 = v5;
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (double)inlineDateViewMinimumWidth
{
  return 280.0;
}

- (double)inlineTimeViewMinimumWidth
{
  return 0.0;
}

- (double)inlineTimeAndDateSpacing
{
  return 16.0;
}

- (double)inlineDatePickerMaximumWidth
{
  return 375.0;
}

- (double)inlineDatePickerMinimumMargin
{
  return 16.0;
}

- (double)compactLabelButtonSpacing
{
  return 4.0;
}

- (double)compactLabelCornerRadius
{
  return 8.0;
}

- (CGSize)compactLabelBackgroundPadding
{
  double v2;
  double v3;
  CGSize result;

  v2 = 12.0;
  v3 = 7.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)datePickerModalPresentationStyle
{
  return 5;
}

- (double)overlayPlatterCornerRadius
{
  return 13.0;
}

- (double)overlayPlatterInitialScale
{
  return 0.2;
}

- (double)overlayPlatterInitialHeight
{
  return 10.0;
}

- (double)overlayPlatterDefaultSpacing
{
  return 6.0;
}

- (double)overlayPlatterDefaultMargin
{
  return 16.0;
}

- (BOOL)overlayPlatterWantsShadowView
{
  return 1;
}

- (id)compactLabelTextColorForEditingState:(BOOL)a3
{
  if (a3)
    +[UIColor tintColor](UIColor, "tintColor");
  else
    +[UIColor labelColor](UIColor, "labelColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compactLabelBackgroundColorForEnabledState:(BOOL)a3
{
  if (a3)
    +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  else
    +[UIColor clearColor](UIColor, "clearColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)compactLabelBackgroundButtonConfiguration
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerStyle:", -1);
  -[_UIDatePickerStyle_iOS compactLabelCornerRadius](self, "compactLabelCornerRadius");
  v5 = v4;
  objc_msgSend(v3, "background");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  +[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "background");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  return v3;
}

@end
