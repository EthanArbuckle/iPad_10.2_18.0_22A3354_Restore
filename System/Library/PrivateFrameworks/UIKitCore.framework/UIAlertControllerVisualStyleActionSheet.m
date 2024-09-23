@implementation UIAlertControllerVisualStyleActionSheet

+ (int64_t)interfaceActionPresentationStyle
{
  return 1;
}

- (id)vibrancyEffectForTitleAndMessageLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
  if (!vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect)
  {
    +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1200);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIVibrancyEffect _effectForBlurEffect:vibrancyStyle:](UIVibrancyEffect, "_effectForBlurEffect:vibrancyStyle:", v3, 102);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
    vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect = v4;

    v2 = (void *)vibrancyEffectForTitleAndMessageLabel__cachedVibrancyEffect;
  }
  return v2;
}

- (id)titleLabelFont
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMessage");

  if (v3)
    v4 = 2;
  else
    v4 = 64;
  objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v5, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)titleLabelColor
{
  +[UIColor whiteColor](UIColor, "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)_spacingBetweenDismissButtonAndContent
{
  return 8.0;
}

- (double)marginAboveTitleLabelFirstBaseline
{
  return 27.0;
}

- (double)marginBelowTitleLabelLastBaseline
{
  return 17.0;
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
    objc_msgSend(off_1E167A830, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", CFSTR("UICTFontTextStyleFootnote"), 0, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIAlertControllerVisualStyleActionSheet titleLabelFont](self, "titleLabelFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)messageLabelColor
{
  +[UIColor whiteColor](UIColor, "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
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
    return 22.0;
  -[UIAlertControllerVisualStyleActionSheet marginAboveTitleLabelFirstBaseline](self, "marginAboveTitleLabelFirstBaseline");
  return result;
}

- (double)marginBelowMessageLabelLastBaseline
{
  void *v3;
  char v4;
  double result;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTitle");

  if ((v4 & 1) != 0)
    return 28.0;
  -[UIAlertControllerVisualStyleActionSheet marginBelowTitleLabelLastBaseline](self, "marginBelowTitleLabelLastBaseline");
  return result;
}

- (double)marginBelowLastLabelLastBaseline
{
  return 17.0;
}

- (double)maximumWidth
{
  return 0.0;
}

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = _UIActionSheetPresentationControllerContentInsetsAdjustedForSafeAreaWithStandardContentInsets(a3, 8.0, 8.0, 8.0, 8.0);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a7;
  v13 = a6;
  objc_msgSend(v12, "constraintForKey:", CFSTR("UIAlertControllerVisualStyleActionSheet.centerX"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v10, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addConstraint:forKey:", v14, CFSTR("UIAlertControllerVisualStyleActionSheet.centerX"));
  }
  objc_msgSend(v12, "constraintForKey:", CFSTR("UIAlertControllerVisualStyleActionSheet.bottom"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v10, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addConstraint:forKey:", v17, CFSTR("UIAlertControllerVisualStyleActionSheet.bottom"));
  }
  objc_msgSend(v10, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInsetsForContainerView:", v20);
  v22 = v21;
  v24 = v23;
  v26 = v25;

  objc_msgSend(v17, "setConstant:", -v24);
  objc_msgSend(v14, "setConstant:", (v22 - v26) * 0.5);
  v27 = (void *)MEMORY[0x1E0D156E0];
  v29[0] = v14;
  v29[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v28);

}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  return 0.404;
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double MaxY;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD aBlock[4];
  id v59;
  id v60;
  double v61;
  double v62;
  double v63;
  CGRect v64;

  v14 = a3;
  v15 = a9;
  v16 = a6;
  v17 = a4;
  objc_msgSend(v14, "center");
  v19 = v18;
  v21 = v20;
  objc_msgSend(v14, "center");
  v23 = v22;
  objc_msgSend(v16, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v14, "superview");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "convertRect:fromView:", v16, v25, v27, v29, v31);
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;

  v64.origin.x = v34;
  v64.origin.y = v36;
  v64.size.width = v38;
  v64.size.height = v40;
  MaxY = CGRectGetMaxY(v64);
  objc_msgSend(v14, "frame");
  v43 = MaxY + v42 * 0.5;
  if (a5)
    v44 = MaxY + v42 * 0.5;
  else
    v44 = v21;
  if (a5)
    v45 = v23;
  else
    v45 = v19;
  if (a5)
    v46 = 1.0;
  else
    v46 = 0.0;
  if (a5)
    v47 = 0.0;
  else
    v47 = 1.0;
  if (!a5)
  {
    v21 = v43;
    v19 = v23;
  }
  objc_msgSend(v14, "setCenter:", v45, v44);
  objc_msgSend(v17, "_dimmingView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "setAlpha:", v47);
  v49 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E16E2EC0;
  v61 = v19;
  v62 = v21;
  v59 = v14;
  v60 = v48;
  v63 = v46;
  v50 = v48;
  v51 = v14;
  v55 = v15;
  v56[0] = v49;
  v56[1] = 3221225472;
  v56[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v56[3] = &unk_1E16B1BF8;
  v57 = _Block_copy(aBlock);
  v54[0] = v49;
  v54[1] = 3221225472;
  v54[2] = __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v54[3] = &unk_1E16B1BA0;
  v52 = v15;
  v53 = v57;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 6, v56, v54, a8, 0.0, 600.0, 0.0);

}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 64));
}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v3;

  v3 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048620, *(_QWORD *)(a1 + 32), *(double *)&v3.minimum, *(double *)&v3.maximum, *(double *)&v3.preferred);
}

uint64_t __171__UIAlertControllerVisualStyleActionSheet_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)permittedActionLayoutDirection
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;

  -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasTitle") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hasMessage") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[UIAlertControllerVisualStyle descriptor](self, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "hasContentViewController");

    }
  }

  -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "verticalSizeClass");

  if (v8 == 1)
    v9 = v4;
  else
    v9 = 1;
  if (v9)
    return 1;
  else
    return 3;
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return objc_msgSend(a4, "_isPresentedAsPopover", a3);
}

- (BOOL)placementAvoidsKeyboard
{
  return 1;
}

@end
