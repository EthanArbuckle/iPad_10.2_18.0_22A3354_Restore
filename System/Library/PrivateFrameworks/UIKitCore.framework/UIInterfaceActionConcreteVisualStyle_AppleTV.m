@implementation UIInterfaceActionConcreteVisualStyle_AppleTV

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v3;
  _UIInterfaceActionRepresentationViewContext_AppleTV *v4;

  v3 = a3;
  v4 = -[_UIInterfaceActionRepresentationViewContext_AppleTV initWithHighlightTransformTargetView:]([_UIInterfaceActionRepresentationViewContext_AppleTV alloc], "initWithHighlightTransformTargetView:", v3);

  return v4;
}

- (id)defaultScreen
{
  return +[UIScreen mainScreen](UIScreen, "mainScreen");
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)contentMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount](_UIAlertControllerTVBackgroundView, "backgroundInsetAmount");
  v3 = v2 + 40.0;
  v4 = 12.0;
  v5 = 12.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 38.0;
}

- (double)verticalImageContentSpacing
{
  return 6.0;
}

- (double)actionSectionSpacing
{
  return 39.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount](_UIAlertControllerTVBackgroundView, "backgroundInsetAmount");
  v3 = v2 + 5.0;
  v4 = 50.0;
  v5 = 0.0;
  v6 = v3;
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 80.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  return 1;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleHeadline"));
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");
  if (v6 < 2 || v6 == 100)
  {
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
    {
      if (objc_msgSend(v4, "isHighlighted"))
        +[UIColor blackColor](UIColor, "blackColor");
      else
        objc_msgSend(v4, "tintColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.3);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_11;
  }
  if (v6 == 2)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v3 = (void *)v7;
  }

  return v3;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_titleTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[UIInterfaceActionConcreteVisualStyle_AppleTV actionTitleLabelColorForViewState:](self, "actionTitleLabelColorForViewState:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  void *v3;
  _UIAlertControllerTVBackgroundView *v4;
  void *v5;

  objc_msgSend(a3, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_UIAlertControllerTVBackgroundView);
  -[_UIAlertControllerTVBackgroundView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", 4.5);
  if (objc_msgSend(v3, "type") == 2)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.968627451, 0.149019608, 0.17254902, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](v4, "setTintColor:", v5);

    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 0, 0.4);
    -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v4, "setAlpha:forState:", 4, 0.3);
  }
  -[_UIAlertControllerTVBackgroundView setShouldUseTintColorAsBackgroundColor:](v4, "setShouldUseTintColorAsBackgroundColor:", 1);

  return v4;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return objc_alloc_init(_UIAlertControllerTVBackgroundView);
}

- (id)actionPropertiesAffectingLabelStyling
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E16EFB40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  uint64_t v6;
  id v7;

  v7 = a3;
  v6 = objc_msgSend(a5, "isFocused");
  objc_msgSend(v7, "setMarqueeEnabled:", v6);
  objc_msgSend(v7, "setMarqueeRunning:", v6);

}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x1E16EFB60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a4;
  objc_msgSend(v4, "actionViewStateContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(v4, "isHighlighted"));
  v5 = objc_msgSend(v4, "isPressed");

  objc_msgSend(v6, "setPressed:", v5);
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);
  objc_msgSend(v4, "_setGradientMaskInsets:", 50.0, 0.0, 50.0, 0.0);

}

@end
