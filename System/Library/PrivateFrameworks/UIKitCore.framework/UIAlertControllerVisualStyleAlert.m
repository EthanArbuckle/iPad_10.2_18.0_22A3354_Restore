@implementation UIAlertControllerVisualStyleAlert

- (id)titleLabelFont
{
  void *v2;
  void *v3;

  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleHeadline"), 0, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleLabelColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 36.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 18.0;
}

- (id)messageLabelFont
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTitle");

  if (v4)
  {
    objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 0x8000, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIAlertControllerVisualStyleAlert titleLabelFont](self, "titleLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)marginAboveMessageLabelFirstBaseline
{
  void *v3;
  char v4;
  double result;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTitle");

  if ((v4 & 1) != 0)
    return 20.0;
  -[UIAlertControllerVisualStyleAlert marginAboveTitleLabelFirstBaseline](self, "marginAboveTitleLabelFirstBaseline");
  return result;
}

- (double)marginBelowMessageLabelLastBaseline
{
  return 24.0;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 24.0;
}

- (double)_marginAroundActionGroup
{
  return 0.0;
}

- (double)maximumWidth
{
  NSString *v2;
  _BOOL4 IsAccessibilityCategory;
  double result;

  objc_msgSend((id)UIApp, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (!IsAccessibilityCategory)
    return 270.0;
  _accessibilityMaximumWidthWhenUsingAccessibilitySizes();
  return result;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 0.0, 8.0, 0.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)textFieldHorizontalMargin
{
  return 15.0;
}

- (id)textFieldContainingViewWithTextField:(id)a3 position:(int64_t)a4
{
  uint64_t v5;
  char v6;
  double v7;
  id v8;
  UIView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  id v15;
  UIView *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
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
  _QWORD v34[5];
  _QWORD v35[6];

  v35[5] = *MEMORY[0x1E0C80C00];
  if (a4 == 3)
  {
    v5 = 12;
LABEL_7:
    v6 = 0;
    v7 = 7.0;
    goto LABEL_9;
  }
  if (a4 != 2)
  {
    if (a4 == 1)
      v5 = 3;
    else
      v5 = 15;
    goto LABEL_7;
  }
  v5 = 0;
  v7 = 0.0;
  v6 = 1;
LABEL_9:
  v8 = a3;
  v9 = [UIView alloc];
  v10 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
  v15 = +[_UIInterfaceActionVibrantBorderView newWithRoundedCornerPosition:continuousCornerRadius:](_UIInterfaceActionVibrantBorderView, "newWithRoundedCornerPosition:continuousCornerRadius:", v5, v7);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v14, "addSubview:", v15);
  v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  if ((v6 & 1) == 0)
  {
    -[UIView _setContinuousCornerRadius:](v16, "_setContinuousCornerRadius:", 7.0);
    -[UIView layer](v16, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaskedCorners:", v5);

  }
  -[UIView addSubview:](v14, "addSubview:", v16);
  -[UIView addSubview:](v16, "addSubview:", v8);
  objc_msgSend(v8, "_currentScreenScale");
  UIRoundToViewScale(v8);
  v20 = v19;
  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v21 = 0.0;
  else
    v21 = v19;
  _NSDictionaryOfVariableBindings(CFSTR("textField, vibrantBorder, textFieldContainer"), v8, v15, v16, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = CFSTR("textFieldContainerTop");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  v34[1] = CFSTR("borderWidth");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v24;
  v35[2] = &unk_1E1A95CC0;
  v34[2] = CFSTR("textFieldInsetH");
  v34[3] = CFSTR("textFieldInsetTop");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 7.0 - v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = CFSTR("textFieldInsetBottom");
  v35[3] = v25;
  v35[4] = &unk_1E1A95CD0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[vibrantBorder]|"), 0, v26, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v27);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(borderWidth)-[textFieldContainer]-(borderWidth)-|"), 0, v26, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v28);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(textFieldInsetH)-[textField]-(textFieldInsetH)-|"), 0, v26, v22);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v29);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[vibrantBorder]|"), 0, v26, v22);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v30);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(textFieldContainerTop)-[textFieldContainer]-(borderWidth)-|"), 0, v26, v22);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v31);

  objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(textFieldInsetTop)-[textField]-(textFieldInsetBottom)-|"), 0, v26, v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addConstraints:](v14, "addConstraints:", v32);

  return v14;
}

- (int64_t)permittedActionLayoutDirection
{
  void *v2;
  uint64_t v3;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfActions");

  if (v3 >= 3)
    return 1;
  else
    return 3;
}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.404;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  _BOOL4 v10;
  id v12;
  id v13;
  __int128 v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  CGAffineTransform v33;
  double v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  v10 = a5;
  v12 = a3;
  v13 = a9;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v37.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v37.c = v14;
  *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v36.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&v36.c = v14;
  *(_OWORD *)&v36.tx = *(_OWORD *)&v37.tx;
  v15 = a4;
  if (v10)
  {
    CGAffineTransformMakeScale(&v37, 1.2, 1.2);
    v16 = 0.0;
    v17 = 1.0;
  }
  else
  {
    v16 = 1.0;
    CGAffineTransformMakeScale(&v36, 1.0, 1.0);
    v17 = 0.0;
  }
  v35 = v37;
  objc_msgSend(v12, "setTransform:", &v35);
  objc_msgSend(v12, "setAlpha:", v16);
  objc_msgSend(v15, "_dimmingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setAlpha:", v16);
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E16DADE8;
  v20 = v12;
  v33 = v36;
  v34 = v17;
  v31 = v20;
  v32 = v18;
  v21 = v18;
  v27 = v13;
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v28[3] = &unk_1E16B1BF8;
  v29 = _Block_copy(aBlock);
  v25[0] = v19;
  v25[1] = 3221225472;
  v25[2] = __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v25[3] = &unk_1E16BC218;
  v26 = v20;
  v22 = v13;
  v23 = v20;
  v24 = v29;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v28, v25, 0.404, 0.0, 600.0, 0.0);

}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 64);
  v5[0] = *(_OWORD *)(a1 + 48);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(v2, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 96));
}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048620, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __165__UIAlertControllerVisualStyleAlert_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)placementAvoidsKeyboard
{
  return 1;
}

@end
