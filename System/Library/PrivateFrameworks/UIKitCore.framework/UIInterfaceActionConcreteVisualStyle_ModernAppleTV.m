@implementation UIInterfaceActionConcreteVisualStyle_ModernAppleTV

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v3;
  _UIInterfaceActionRepresentationViewContext_AppleTV *v4;

  v3 = a3;
  v4 = -[_UIInterfaceActionRepresentationViewContext_AppleTV initWithHighlightTransformTargetView:]([_UIInterfaceActionRepresentationViewContext_AppleTV alloc], "initWithHighlightTransformTargetView:", v3);

  -[_UIInterfaceActionRepresentationViewContext_AppleTV setFocusedSizeIncrease:](v4, "setFocusedSizeIncrease:", 20.0);
  return v4;
}

- (UIEdgeInsets)contentMargin
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 12.0;
  v3 = 15.0;
  v4 = 12.0;
  v5 = 15.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)contentCornerRadius
{
  double result;

  +[_UIAlertControllerModernTVBackgroundView contentCornerRadius](_UIAlertControllerModernTVBackgroundView, "contentCornerRadius");
  return result;
}

- (double)_actionBackgroundCornerRadius
{
  return 16.0;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  return 1;
}

- (double)actionSectionSpacing
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  v3 = v2;
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  v5 = v4;
  v6 = v3;
  v7 = v5;
  v8 = v3;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 66.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  return (id)objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleBody"));
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  if (v7 < 2 || v7 == 100)
  {
    if ((objc_msgSend(v6, "isEnabled") & 1) == 0)
    {
      +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    v9 = objc_msgSend(v5, "isHighlighted");
    v10 = objc_msgSend(v5, "isPreferred");
    if (!v9)
    {
      if ((v10 & 1) != 0)
      {
        objc_msgSend(v5, "tintColor");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      +[UIColor labelColor](UIColor, "labelColor");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v3 = (void *)v11;
      goto LABEL_17;
    }
    if ((v10 & 1) == 0)
    {
      +[UIColor blackColor](UIColor, "blackColor");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_9:
    +[UIColor whiteColor](UIColor, "whiteColor");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (v7 == 2)
  {
    if ((objc_msgSend(v5, "isHighlighted") & 1) == 0)
    {
      +[UIColor systemRedColor](UIColor, "systemRedColor");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_13:
      v12 = (void *)v8;
      -[UIInterfaceActionConcreteVisualStyle_ModernAppleTV _vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:](self, "_vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:", v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    goto LABEL_9;
  }
LABEL_17:

  return v3;
}

- (id)_vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __109__UIInterfaceActionConcreteVisualStyle_ModernAppleTV__vibrancyStyleColorForUnfocusedTitleLabelWithTintColor___block_invoke;
  v7[3] = &unk_1E16B1DC8;
  v8 = v3;
  v4 = v3;
  +[UIColor colorWithDynamicProvider:](UIColor, "colorWithDynamicProvider:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;

  v3 = a3;
  objc_msgSend(v3, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 2)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "isPreferred") ^ 1;
  v6 = 0;
  if ((objc_msgSend(v3, "isFocused") & 1) == 0 && (v5 & 1) == 0)
  {
    objc_msgSend(v3, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceStyle");

    v9 = (id *)MEMORY[0x1E0CD2E98];
    if (v8 != 1)
      v9 = (id *)MEMORY[0x1E0CD2EA0];
    v6 = *v9;
  }

  return v6;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4;
  void *v5;
  _UIAlertControllerModernTVActionBackgroundView *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(_UIAlertControllerModernTVActionBackgroundView);
  if (objc_msgSend(v5, "type") == 2)
    v7 = 1;
  else
    v7 = objc_msgSend(v4, "isPreferred");
  -[_UIAlertControllerModernTVActionBackgroundView setShouldUseTintColorAsHighlightColor:](v6, "setShouldUseTintColorAsHighlightColor:", v7);
  -[UIInterfaceActionConcreteVisualStyle_ModernAppleTV _actionBackgroundCornerRadius](self, "_actionBackgroundCornerRadius");
  -[_UIAlertControllerTVBackgroundView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
  if (objc_msgSend(v5, "type") == 2)
  {
    +[UIColor systemRedColor](UIColor, "systemRedColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isPreferred"))
    {
      +[UIColor systemGray5Color](UIColor, "systemGray5Color");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setTintColor:](v6, "setTintColor:", v10);

      -[_UIAlertControllerModernTVActionBackgroundView setVibrantCompositing:forState:](v6, "setVibrantCompositing:forState:", 1, 0);
      goto LABEL_10;
    }
    objc_msgSend(v4, "tintColor");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[UIView setTintColor:](v6, "setTintColor:", v8);

  -[_UIAlertControllerTVBackgroundView setAlpha:forState:](v6, "setAlpha:forState:", 0, 0.2);
LABEL_10:
  -[_UIAlertControllerTVBackgroundView setShouldUseTintColorAsBackgroundColor:](v6, "setShouldUseTintColorAsBackgroundColor:", 1);

  return v6;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return 0;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isVerticalLayoutAxis");
  result = 24.0;
  if (v3)
    return 16.0;
  return result;
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIInterfaceActionConcreteVisualStyle_ModernAppleTV *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount](_UIAlertControllerModernTVBackgroundView, "backgroundInsetAmount");
  v7 = v6;
  objc_msgSend(v5, "_setGradientMaskLengths:", 50.0, -30.0, 50.0, -30.0);
  objc_msgSend(v5, "_setGradientMaskEdgeInsets:", v7, 0.0, v7, 0.0);
  objc_msgSend(v5, "setClipsToBounds:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = self;
    v8 = +[_UIAlertControllerModernTVBackgroundView newBackgroundVisualEffectInAlertGroup](_UIAlertControllerModernTVBackgroundView, "newBackgroundVisualEffectInAlertGroup");
    +[_UIAlertControllerModernTVBackgroundView platterHairlineWidth](_UIAlertControllerModernTVBackgroundView, "platterHairlineWidth");
    v10 = v9;
    v11 = objc_alloc_init(UIView);
    -[UIView addSubview:](v11, "addSubview:", v8);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(v8, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v11, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v29;
    objc_msgSend(v8, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v11, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -v10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v25;
    objc_msgSend(v8, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v11, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v14;
    objc_msgSend(v8, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v11, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, -v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v18);

    -[UIInterfaceActionConcreteVisualStyle_ModernAppleTV contentCornerRadius](v32, "contentCornerRadius");
    v20 = v19 - v10;
    objc_msgSend(v8, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerRadius:", v20);

    v22 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v8, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCornerCurve:", v22);

    objc_msgSend(v8, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMasksToBounds:", 1);

    objc_msgSend(v5, "setBackgroundView:", v11);
  }

}

@end
